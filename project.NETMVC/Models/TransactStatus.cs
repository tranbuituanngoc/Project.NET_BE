using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class TransactStatus
    {
        public TransactStatus()
        {
            Orders = new HashSet<Order>();
        }

        public int TransactStatusId { get; set; }
        public string Status { get; set; }
        public string Descripsion { get; set; }
        public int? ShipperId { get; set; }

        public virtual Shipper Shipper { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
