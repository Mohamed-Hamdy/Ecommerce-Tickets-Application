using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;

namespace eTickets.Models
{
    public class Order
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "varchar(150)")]
        public string Email { get; set; }

        [Column(TypeName = "varchar(150)")]
        public string UserId { get; set; }
        [ForeignKey(nameof(UserId))]
        public ApplicationUser User { get; set;}

        public List<OrderItem> OrderItems { get; set; }

    }
}