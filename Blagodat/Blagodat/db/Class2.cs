using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blagodat.db
{
    public partial class Client
    {
        public string GetFullName
        {
            get
            {
                return $"{Surname} {Name} {Patronymic}";
            }
        }
    }
}
