using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace eTickets.Models
{
    public class Cinema
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "varchar(500)")]
        [Display(Name = "Logo")]
        public string Logo { get; set; }

        [Column(TypeName = "varchar(150)")]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Column(TypeName = "text")]
        [Display(Name = "Description")]
        public string Discription { get; set; }
        // relationships 
        public List<Movie> Movies { get; set; }

    }
}
