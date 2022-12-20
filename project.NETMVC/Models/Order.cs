using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Order
    {
        public int OrderId { get; set; }
        public string CustommerId { get; set; }
        public DateTime? OrderDate { get; set; }
        public DateTime? ShipDate { get; set; }
        public int? TransactStatusId { get; set; }
        public bool Deleted { get; set; }
        public bool Paid { get; set; }
        public DateTime? PaymentDate { get; set; }
        public string Note { get; set; }
        public int? OrderDetailsId { get; set; }

        public virtual Custommer Custommer { get; set; }
        public virtual OrderDetail OrderDetails { get; set; }
        public virtual TransactStatus TransactStatus { get; set; }
    }
}
