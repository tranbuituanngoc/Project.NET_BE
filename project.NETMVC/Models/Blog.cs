using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Blog
    {
        public Blog()
        {
            CtBlogs = new HashSet<CtBlog>();
        }

        public int IdBlog { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public int? CateId { get; set; }
        public string Author { get; set; }
        public string AccountId { get; set; }
        public bool? IsHot { get; set; }
        public bool? IsNewfeed { get; set; }
        public bool? Published { get; set; }

        public virtual Category Cate { get; set; }
        public virtual ICollection<CtBlog> CtBlogs { get; set; }
    }
}
