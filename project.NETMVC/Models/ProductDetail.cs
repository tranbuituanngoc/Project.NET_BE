using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class ProductDetail
    {
        public int? IdSp { get; set; }
        public int IdCtsp { get; set; }
        public string Image { get; set; }
        public string Video { get; set; }
        public string ShortDescription { get; set; }
        public string Description { get; set; }
        public int? IdDanhgia { get; set; }

        public virtual Product IdSpNavigation { get; set; }
    }
}
