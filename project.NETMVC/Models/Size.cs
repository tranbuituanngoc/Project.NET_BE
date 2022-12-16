using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Size
    {
        public int? IdSp { get; set; }
        public int IdSize { get; set; }
        public string NameSize { get; set; }

        public virtual Product IdSpNavigation { get; set; }
    }
}
