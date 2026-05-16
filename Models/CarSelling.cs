namespace AdamGarage.Models
{
    public class CarSelling
    {
              public int ID { get; set; }
              public int CarID { get; set; }
              public int SellerID { get; set; }
              public int ProviderID { get; set; }

              // Navigation properties
              public Car Car { get; set; }
              public Seller Seller { get; set; }
              public Provider Provider { get; set; }
    }
}
