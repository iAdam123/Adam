using System;

namespace AdamGarage.Models
{
    public class Sale
    {
              public int SaleID { get; set; }
              public DateTime? SaleDate { get; set; }
              public decimal SalePrice { get; set; }
              public string PaymentMethod { get; set; }
              public int SellerID { get; set; }
              public int CustomerID { get; set; }
              public int CarID { get; set; }
              public string Notes { get; set; }
              public decimal Discount { get; set; }

              // Navigation properties
              public Seller Seller { get; set; }
              public Customer Customer { get; set; }
              public Car Car { get; set; }
    }
}
