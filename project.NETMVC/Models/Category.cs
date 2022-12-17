using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Category
    {
        public Category()
        {
            Blogs = new HashSet<Blog>();
            Products = new HashSet<Product>();
        }

        public int CatId { get; set; }
        public string CatName { get; set; }

        public virtual ICollection<Blog> Blogs { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
