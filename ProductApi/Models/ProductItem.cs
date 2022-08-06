using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace ProductApi.Models
{
    [Table("ProductItems")]
    public class ProductItem
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid Id { get; set; }
        public string productName { get; set; }
        public string department { get; set; }
        public string color { get; set; }
        public double price { get; set; }
        public string productAdjective { get; set; }
        public string productMaterial { get; set; }
        public string producttype { get; set; }

    }
}