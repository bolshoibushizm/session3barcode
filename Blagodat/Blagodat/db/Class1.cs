using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blagodat.db
{
    public partial class Employee
    {
        public string imageSourse
        {
            get
            {
                if (!string.IsNullOrEmpty(Photo))
                    return Photo;
                else return "";
            }
        }
    }
}
