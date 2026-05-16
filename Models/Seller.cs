namespace AdamGarage.Models
{
    public class Seller
    {
              public int SellerID { get; set; }
              public string Phone_1 { get; set; }
              public string Phone_2 { get; set; }
              public string UserName { get; set; }

              // Navigation property
              public User User { get; set; }
    }
}
