using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Blog
    {
        public int BlogId { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public string Author { get; set; }
        public string AccountId { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? ModifyDate { get; set; }
        public bool IsHot { get; set; }
        public bool IsNewfeed { get; set; }
        public bool Published { get; set; }
        public string ListImage { get; set; }
        public string Contents { get; set; }
    }
}
