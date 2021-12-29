using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using eTickets.Data.Base;

namespace eTickets.Models
{
    public class Actor:IEntityBase
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "varchar(500)")]
        [Display(Name = "Profile Picture")]
        [Required(ErrorMessage = "Profile picture is required.")]
        public string ProfilepictureURL { get; set; }

        [Column(TypeName = "varchar(150)")]
        [Display(Name = "Name")]
        [Required(ErrorMessage = "Name is required.")]
        [StringLength(70, MinimumLength =3, ErrorMessage ="Name length must be between 3 and 70 char.")]
        public string FullName { get; set; }

        [Column(TypeName = "text")]
        [Display(Name = "Biography")]
        [Required(ErrorMessage = "Biography is required.")]     
        public string Bio { get; set; }

        // relationships 
        public List<Actor_Movie> Actors_Movies { get; set; }

    }
}
