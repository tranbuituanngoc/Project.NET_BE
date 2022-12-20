using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Product
    {
        public Product()
        {
            Colors = new HashSet<Color>();
            OrderDetails = new HashSet<OrderDetail>();
            Sizes = new HashSet<Size>();
            UserEvaluations = new HashSet<UserEvaluation>();
        }

        public int IdSp { get; set; }
        public string Name { get; set; }
        public int? CateId { get; set; }
        public double? Price { get; set; }
        public string Status { get; set; }
        public double? Discount { get; set; }
        public DateTime? DateCreate { get; set; }
        public DateTime? DateModified { get; set; }
        public bool BestSeller { get; set; }
        public bool HomeFlag { get; set; }
        public bool Active { get; set; }
        public int? UnitslnStock { get; set; }
        public string Thumb { get; set; }
        public string Image { get; set; }
        public string Video { get; set; }
        public string ShortDescrip { get; set; }
        public string Descrip { get; set; }

        public virtual Category Cate { get; set; }
        public virtual ICollection<Color> Colors { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<Size> Sizes { get; set; }
        public virtual ICollection<UserEvaluation> UserEvaluations { get; set; }
    }
}
