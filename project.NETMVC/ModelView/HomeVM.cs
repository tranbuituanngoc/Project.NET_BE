using project.NETMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.NETMVC.ModelView
{
    public class HomeVM
    {
        public List<Blog> blogs { get; set; }
        public List<ProductHVM> Products { get; set; }
    }
}
