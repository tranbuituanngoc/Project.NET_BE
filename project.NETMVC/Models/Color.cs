using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Color
    {
        public int IdSp { get; set; }
        public int IdColor { get; set; }
        public string ColorName { get; set; }

        public virtual Product IdSpNavigation { get; set; }
    }
}
