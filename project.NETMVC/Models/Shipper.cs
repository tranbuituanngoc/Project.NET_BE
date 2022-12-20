using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Shipper
    {
        public Shipper()
        {
            TransactStatuses = new HashSet<TransactStatus>();
        }

        public int ShipperId { get; set; }
        public string ShipperName { get; set; }
        public string Phone { get; set; }
        public string Company { get; set; }

        public virtual ICollection<TransactStatus> TransactStatuses { get; set; }
    }
}
