using System;

namespace AdamGarage.Models
{
    public class Service
    {
              public int ServiceID { get; set; }
              public int CarID { get; set; }
              public DateTime? ServiceDate { get; set; }
              public string PerformedBy { get; set; }
              public string PartName { get; set; }
              public decimal Price { get; set; }
              public string Comments { get; set; }

              // Navigation property
              public Car Car { get; set; }
    }
}
