using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;


namespace eTickets.Models
{
    public class Actor
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "varchar(500)")]
        [Display(Name = "Profile Picture")]
        public string ProfilepictureURL { get; set; }

        [Column(TypeName = "varchar(150)")]
        [Display(Name = "Name")]
        public string FullName { get; set; }

        [Column(TypeName = "text")]
        [Display(Name = "Bio")]
        public string Bio { get; set; }

        // relationships 
        public List<Actor_Movie> Actors_Movies { get; set; }

    }
}
