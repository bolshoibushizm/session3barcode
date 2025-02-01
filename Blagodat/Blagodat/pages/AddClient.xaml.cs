using Blagodat.db;
using System;
using System.Collections.Generic;
using System.Linq;
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

namespace Blagodat.pages
{
    /// <summary>
    /// Логика взаимодействия для AddClient.xaml
    /// </summary>
    public partial class AddClient : Page
    {
        public db.Client _client;
        int idClient;
        public AddClient()
        {
            InitializeComponent();
            getCode();
            CodeBox.Text = idClient.ToString();
          
        }
        public AddClient(db.Client client)
        {
            InitializeComponent();
            _client = client;
            EmailBox.Text = _client.Email;
            AddSurname.Text = _client.Surname;
            AddName.Text = _client.Name;
            AddPatron.Text = _client.Patronymic;
            DP.Text = client.Birthday.ToString();
            PassportBox.Text = client.Passport;
           
        }
        private int getCode()
        {
            var lastRecord = App.Context.Client
     .OrderByDescending(p => p.ClientCode)
     .FirstOrDefault();
            idClient = lastRecord.ClientCode + 1;
            return idClient;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            var error = Errors();
            try
            {
                if (error.Length == 0)
                {
                    if (_client == null)
                    {
                        var newClient = new db.Client
                        {
                            ClientCode = getCode(),
                            Email = EmailBox.Text,
                            Surname = AddSurname.Text,
                            Name = AddName.Text,
                            Patronymic = AddPatron.Text,
                            Birthday = DateTime.Parse(DP.Text),
                            Passport = PassportBox.Text,
                        };
                        App.Context.Client.Add(newClient);
                        App.Context.SaveChanges();
                        MessageBox.Show("Клиент добавлен");
                    }
                }
                else
                {
                    MessageBox.Show(error.ToString());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        private string Errors()
        {
            //EmailBox.Text = _client.Email;
            //AddSurname.Text = _client.Surname;
            //AddName.Text = _client.Name;
            //AddPatron.Text = _client.Patronymic;
            //DP.Text = client.Birthday.ToString();
            //PassportBox.Text = client.Passport;

            StringBuilder stringBuilder = new StringBuilder();
            var user = App.Context.Client.FirstOrDefault(p=> p.Passport == PassportBox.Text && p.ClientCode.ToString() == CodeBox.Text.ToString() && p.Email == EmailBox.Text && p.Surname == AddSurname.Text && p.Name == AddName.Text);
            if (user != null)
            {
                stringBuilder.AppendLine("Такой пользователь уже есть");
            }
            if (string.IsNullOrEmpty(AddSurname.Text))
            {
                stringBuilder.AppendLine("Поле фамилия не заполнено");
            }
            if (string.IsNullOrEmpty(AddName.Text))
            {
                stringBuilder.AppendLine("Поле имя не заполнено");
            }
            if (string.IsNullOrEmpty(DP.Text))
            {
                stringBuilder.AppendLine("Поле дата рождения не заполнено");
            }
            if (string.IsNullOrEmpty(PassportBox.Text))
            {
                stringBuilder.AppendLine("Поле паспорт не заполнено");
            }
            if (string.IsNullOrEmpty(PassportBox.Text))
            {
                stringBuilder.AppendLine("Поле пароль не заполнено");
            }
            if (string.IsNullOrEmpty(CodeBox.Text))
            {
                stringBuilder.AppendLine("Поле код не заполнено");
            }
            return stringBuilder.ToString();    
            

        }
    }
}
