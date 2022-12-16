using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Custommer
    {
        public Custommer()
        {
            Orders = new HashSet<Order>();
        }

        public string CustommerId { get; set; }
        public string FullName { get; set; }
        public DateTime? Birthday { get; set; }
        public string Avatar { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public int LocationId { get; set; }
        public DateTime? CreateDate { get; set; }
        public string Password { get; set; }
        public DateTime? LastLogin { get; set; }
        public bool? Active { get; set; }

        public virtual Location Location { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
