using project.NETMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.NETMVC.ModelView
{
    public class ProductHVM
    {
        public List<Product> products { get; set; }
        public Category category { get; set; }
    }
}
