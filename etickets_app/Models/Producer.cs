using eTickets.Data.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace eTickets.Models
{
    public class Producer:IEntityBase
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "varchar(500)")]
        [Display(Name = "Profile Picture")]
        [Required(ErrorMessage = "Profile Picture is Required")]

        public string ProfilepictureURL { get; set; }

        [Column(TypeName = "varchar(150)")]
        [Required(ErrorMessage = "Name is required.")]
        [StringLength(70, MinimumLength = 3, ErrorMessage = "Name length must be between 3 and 70 char")]
        
        public string FullName { get; set; }

        [Column(TypeName = "varchar(150)")]
        [Display(Name = "Bio")]
        [Required(ErrorMessage = "Biography is Required")]

        public string Bio { get; set; }

        // relationships 
        public List<Movie> Movies { get; set; }

    }
}
