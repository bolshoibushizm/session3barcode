using Blagodat.db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Reflection.Emit;
using iTextSharp;
using iTextSharp.text.pdf;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf.codec;
using SixLabors.ImageSharp.Drawing.Processing;
using Aspose.BarCode;
using System.Diagnostics;
using Aspose.BarCode.Generation;
using iTextSharp.text.pdf.crypto;
using System.Runtime.CompilerServices;

namespace Blagodat.pages
{
    /// <summary>
    /// Логика взаимодействия для MakeOrder.xaml
    /// </summary>
    public partial class MakeOrder : Page
    {
        private List<Service> servicesList = new List<Service>();
        int Total;
        private db.Order _currentorder;
        int idOrder;
        int ClientId;
        string OrderCodee;
        DateTime datecreate;
        DateTime timecreated;
        string bar;

        public MakeOrder()
        {
            InitializeComponent();
            LV.ItemsSource = App.Context.Client.ToList();
            InitializeBox();
            getCode();

            IDBox.Text = idOrder.ToString();
            GetOrderCode();
            GetOrderCode();


        }
        public MakeOrder(db.Order order)
        {
            InitializeComponent();
            order = _currentorder;

        }
        public string GetBar()
        {
            Random random = new Random();
            var a = random.Next(100000, 999999);

          

            bar = $"{idOrder} {datecreate}  {a} ";
            return bar;
        }
        private void save_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var Check = Errors();

                if (Check.Length == 0)
                {
                    if (_currentorder == null)
                    {
                        Order Neworder = new Order
                        {
                            IDOrder = idOrder,
                            DateCreated = datecreate,
                            ClientCode = ClientId,
                            OrderCode = OrderCodee,
                            IDStatus = 1,
                            CloseDate = DP.SelectedDate,

                        };
                        App.Context.Order.Add(Neworder);
                        App.Context.SaveChanges();
                        GenerateBarcode();
                        Document document = new Document();
                        PdfWriter pdfwriter = PdfWriter.GetInstance(document, new FileStream("Талончик.pdf", FileMode.Create));
                        document.Open();
                        var image = iTextSharp.text.Image.GetInstance("annotatedBarcode.png");
                        document.Add(image);
                        document.Close();
                      
                            Process.Start("Талончик.pdf");
                        


                    }
                }
                else
                {
                    MessageBox.Show(Check.ToString());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        private void GetTime()
        {
            var time = DateTime.Now.ToString(@"HH:mm:ss");
            string timecreatedd = time;
            timecreated = DateTime.Parse(timecreatedd);

        }
        private void GenerateBarcode()
        {   
            GetBar();
            BarcodeGenerator barcodeGenerator = new BarcodeGenerator(EncodeTypes.Code128, bar);




            barcodeGenerator.Save( "output.png", BarCodeImageFormat.Png);


        }

        private int getCode()
        {
            var lastRecord = App.Context.Order
     .OrderByDescending(p => p.IDOrder)
     .FirstOrDefault();
            idOrder = lastRecord.IDOrder + 1;
            return idOrder;
        }
        public void InitializeBox()
        {
            List<string> asd = new List<string>();
            asd.AddRange(App.Context.Service.Select(p => p.NameService).ToList());
            Servisec.ItemsSource = asd;
        }


        private void Image_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            NavigationService.Navigate(new pages.AddClient());
        }

        private void Update()
        {
            var asd = App.Context.Client.ToList();
            asd = asd.Where(p=> p.Surname.ToLower().Contains(Search.Text.ToLower())||p.Name.ToLower().Contains(Search.Text.ToLower())||p.Patronymic.ToLower().Contains(Search.Text.ToLower())).ToList();
            LV.ItemsSource = asd;
        }

        private void AddImage_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var selectedServiceName = Servisec.SelectedItem.ToString();

            if (selectedServiceName != null)
            {
                
                var service = App.Context.Service
                    .FirstOrDefault(s => s.NameService.Contains(selectedServiceName));
                if (service != null)
                {
                    
                    servicesList.Add(service);

                    
                    DG.ItemsSource = null; 
                    DG.ItemsSource = servicesList;
                }
            }
            
            Summ();
        }
        private void Summ()
        {
            Total = (int)servicesList.Sum(p => p.PriceHour);

            TotalPrice.Text = $"Общая сумма: {Total}";
        }

       

        private void PickClient_Click(object sender, RoutedEventArgs e)
        {
            var client = (sender as Button).DataContext as Client;
            ClientId = client.ClientCode;
            GetOrderCode();
        }
        private void GetOrderCode()
        {
            datecreate = DateTime.Now;
            DateOfCreated.Text = datecreate.ToString();
            OrderCodee = $"{ClientId}/{datecreate.ToString(@"yyyy-mm-dd")}";
        }

        private void Search_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }
        private string Errors()
        {
            StringBuilder stringBuilder = new StringBuilder();
            var asd = App.Context.Order.FirstOrDefault(p=> p.IDOrder.ToString() == IDBox.Text.ToString());
            if (asd!=null)
            {
                stringBuilder.AppendLine("такой заказ уже есть");
            }
            if (ClientId == 0)
            {
                stringBuilder.AppendLine("Клиент не выбран");
            }
            return stringBuilder.ToString();
        }
    }
        
    
}
