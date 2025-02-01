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
using System.Windows.Threading;
namespace Blagodat
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private db.History _history;
        DispatcherTimer _timer;
        TimeSpan _time;
        public MainWindow()
        {
            InitializeComponent();
            asdasd();
            _time = TimeSpan.FromSeconds(600);
            _timer = new DispatcherTimer();
            _timer.Interval = TimeSpan.FromSeconds(1);
            _timer.Tick += Timer_Tick; 
            _timer.Start();

            if (App._CurrentEmployee.IDRole == 2 )
            {
                Historye.Visibility = Visibility.Hidden;
            }
            if (App._CurrentEmployee.IDRole !=2)
            {
                History.Visibility = Visibility.Hidden;
                AllClient.Visibility = Visibility.Hidden;
            }
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            tbTime.Text = _time.ToString();

            if (_time == TimeSpan.FromSeconds(300))
            {
               MessageBox.Show("Внимание! до окончания сессии осталось 5 минут!");
            }

            if (_time == TimeSpan.Zero)
            {
                _timer.Stop();
                this.Close();
            }

            _time = _time.Add(TimeSpan.FromSeconds(-1));
        }
        public MainWindow (db.History history)
        {  
            InitializeComponent();
            var data = DateTime.UtcNow;
            _history = history;
            App._CurrentEmployee.Login = history.UserLogin;
            data = history.LastDate;


        }
        //Сохранение истории
        private void asdasd()
        {
            var data = DateTime.UtcNow;

            if (App._CurrentEmployee != null)
            {
                var newhist = new History()
                {
                    UserLogin = App._CurrentEmployee.Login,
                    LastDate = data,
                    EnterType = "Успешно"
                };
                App.Context.History.Add(newhist);
                App.Context.SaveChanges();
       
            }
        }

        private void History_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MyFrame.Navigate(new pages.History());
            }
            catch(Exception ex) 
            {
                MessageBox.Show(ex.Message);
            }
            }

        private void Historye_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MyFrame.Navigate(new pages.MakeOrder());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void AllClient_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MyFrame.Navigate(new pages.AllClientList());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
