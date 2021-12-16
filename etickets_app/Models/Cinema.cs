using eTickets.Data.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace eTickets.Models
{
    public class Cinema : IEntityBase
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "varchar(500)")]
        [Display(Name = "Logo")]
        //[Required(ErrorMessage = "Cinema logo is required")]

        public string Logo { get; set; }

        [Column(TypeName = "varchar(150)")]
        //[Required(ErrorMessage = "Name is required.")]
        [StringLength(70, MinimumLength = 3, ErrorMessage = "Name length must be between 3 and 70 char")]

        public string Name { get; set; }

        [Column(TypeName = "text")]
        [Display(Name = "Description")]
        //[Required(ErrorMessage = "Cinema description is required")]

        public string Discription { get; set; }
        // relationships 
        public List<Movie> Movies { get; set; }

    }
}
