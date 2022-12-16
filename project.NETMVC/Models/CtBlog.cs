using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class CtBlog
    {
        public int IdCtblog { get; set; }
        public int? IdBlog { get; set; }
        public string Image { get; set; }
        public string Contents { get; set; }

        public virtual Blog IdBlogNavigation { get; set; }
    }
}
