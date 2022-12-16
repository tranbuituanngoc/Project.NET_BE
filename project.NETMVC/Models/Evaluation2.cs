using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Evaluation2
    {
        public int IdDanhgia { get; set; }
        public int? IdSp { get; set; }
        public string AccountId { get; set; }
        public double? Point { get; set; }
        public string Message { get; set; }
        public DateTime? EvaluationDate { get; set; }

        public virtual Product IdSpNavigation { get; set; }
    }
}
