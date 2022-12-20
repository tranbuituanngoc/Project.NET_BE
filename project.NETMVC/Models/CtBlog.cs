using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class CtBlog
    {
        public CtBlog()
        {
            Blogs = new HashSet<Blog>();
        }

        public int IdCtblog { get; set; }
        public string Image { get; set; }
        public string Contents { get; set; }

        public virtual ICollection<Blog> Blogs { get; set; }
    }
}
