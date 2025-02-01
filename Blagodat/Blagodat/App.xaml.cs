using Blagodat.db;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace Blagodat
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static db.BlogodatKIAEntities Context {  get;} = new db.BlogodatKIAEntities();
        public static Employee _CurrentEmployee;
    }
}
