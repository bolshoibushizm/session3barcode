using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Blagodat
{
    /// <summary>
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Window
    {
        string capcha;
        bool firstEnter;
     
        
        public Authorization()
        {
            InitializeComponent();
            firstEnter = true;
        
        }
        

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var currentUser = App.Context.Employee.FirstOrDefault(p => p.Login == LoginBox.Text && p.Password == PB.Password);
                if (firstEnter)
                {
                    if (currentUser != null)
                    {
                        App._CurrentEmployee = currentUser;
                        MainWindow mainWindow = new MainWindow();
                        mainWindow.Show();
                        this.Close();
                    }
                    else
                    {
                        firstEnter = false;
                        MessageBox.Show("Пользователь с такими данными не найден", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                   
                    }
                }
                else if (!firstEnter && CheckCapcha() && currentUser != null)
                {
                    App._CurrentEmployee = currentUser;
                    MainWindow mainWindow = new MainWindow();
                    mainWindow.Show();
                    this.Close();
                }
                else
                {
                    if (CheckCapcha() != true)
                    {
                        MessageBox.Show("Неверная капча", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        CapchaBox.Clear();
                    }
                    else
                    {
                        MessageBox.Show("Неверные данные для входа", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                    Thread.Sleep(10000);
                    firstEnter = false;
                    GenerateCapcha();
                }
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }


        }

        private void GenerateCapcha()
        {
            capcha = "";
            string[] element = new string[] {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
"A", "B", "C", "D", "E", "F", "G", "H", "I", "J","K", "L", "M", "N", "O", "P",
"Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f",
"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
"w", "x", "y", "z"
};
            Random random = new Random();
            for (int i = 0;i<3;i++)
            {
                capcha += element[random.Next(element.Length)];
            }
            CapchaTextBlock.Text = capcha;

        }

        private void NewCapcha_Click(object sender, RoutedEventArgs e)
        {
            GenerateCapcha();
        }
        public bool CheckCapcha()
        {
            if (CapchaTextBlock.Text == capcha)

                    return true;
            return false;
        }

        
    }
}
