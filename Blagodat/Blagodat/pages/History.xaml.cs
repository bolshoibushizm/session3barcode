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
    /// Логика взаимодействия для History.xaml
    /// </summary>
    public partial class History : Page
    {
        public History()
        {
            InitializeComponent();
            LV.ItemsSource = App.Context.History.ToList();
            InitializeBox();
        }
        public void InitializeBox()
        {
            List<string> Filter = new List<string> { "Все" };
            Filter.AddRange(App.Context.Employee.Select(p => p.Login));
            FilterBox.ItemsSource = Filter;
            FilterBox.SelectedIndex = 0;
        }
        public void Update()
        {
            var asd = App.Context.History.ToList();

            if (Sort.SelectedIndex == 0)
            {
                asd = asd.OrderByDescending(p => p.LastDate.ToString()).ToList();
            }
            if (Sort.SelectedIndex == 1)
            {
                asd = asd.OrderBy(p => p.LastDate.ToString()).ToList();
            }
            if (FilterBox.SelectedIndex != 0)
            {
                string selectedFilter = FilterBox.SelectedItem.ToString();
                asd = asd.Where(p => p.Employee.Login == selectedFilter).ToList();
            }
            LV.ItemsSource = asd;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                Update();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void FilterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                Update();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Sort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                Update();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
