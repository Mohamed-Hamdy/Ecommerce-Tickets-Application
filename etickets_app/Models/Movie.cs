using eTickets.Data;
using eTickets.Data.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace eTickets.Models
{
    public class Movie:IEntityBase
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "varchar(150)")]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Column(TypeName = "text")]
        [Display(Name = "Discription")]
        public string Discription { get; set; }

        [Display(Name = "Price")]
        public double Price { get; set; }

        [Column(TypeName = "varchar(250)")]
        [Display(Name = "Image")]
        public string ImageURL { get; set; }

        [Display(Name = "Start Date")]
        public DateTime StartDate { get; set; }

        [Display(Name = "End Date")]
        public DateTime EndDate { get; set; }
        public MovieCategory MovieCategory { get; set; }
        // relationships 
        public List<Actor_Movie> Actors_Movies { get; set; }

        // Cinema
        public int CinemaId { get; set; }
        [ForeignKey("CinemaId")]
        public Cinema Cinema { get; set; }

        // Producer
        public int ProducerId { get; set; }
        [ForeignKey("ProducerId")]
        public Producer Producer { get; set; }
    }
}
