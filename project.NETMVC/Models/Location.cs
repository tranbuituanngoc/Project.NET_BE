using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Location
    {
        public Location()
        {
            Custommers = new HashSet<Custommer>();
        }

        public int LocationId { get; set; }
        public string Conscious { get; set; }

        public virtual ICollection<Custommer> Custommers { get; set; }
    }
}
