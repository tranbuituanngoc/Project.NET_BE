using System;
using System.Collections.Generic;

#nullable disable

namespace project.NETMVC.Models
{
    public partial class Evaluation
    {
        public int IdDanhgia { get; set; }
        public int? IdSp { get; set; }
        public string IdUser { get; set; }
        public double? Point { get; set; }
        public string Message { get; set; }
        public DateTime? EvaluationDate { get; set; }
    }
}
