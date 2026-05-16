using System;

namespace AdamGarage.Models
{
    public class TestDrive
    {
              public int TestDriveID { get; set; }
              public int CarID { get; set; }
              public int CustomerID { get; set; }
              public DateTime? Time { get; set; }
              public int Rate { get; set; }
              public string FeedBack { get; set; }
              public int SellerID { get; set; }

              // Navigation properties
              public Car Car { get; set; }
              public Customer Customer { get; set; }
              public Seller Seller { get; set; }
    }
}
