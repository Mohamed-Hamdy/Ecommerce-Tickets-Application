using eTickets.Data;
using eTickets.Data.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace eTickets.Data.ViewModels
{
    public class NewMovieVM
    {
        public int Id { get; set; }

        [Display(Name = "Movie name")]
        [Required(ErrorMessage = "Name is required.")]
        public string Name { get; set; }

        [Display(Name = "Moive discription")]
        [Required(ErrorMessage = "Moive discription is required.")]
        public string Discription { get; set; }

        [Display(Name = "Price in $")]
        [Required(ErrorMessage = "Moive price is required.")]
        public double Price { get; set; }

        [Display(Name = "Movie poster")]
        [Required(ErrorMessage = "Moive Poster is required.")]
        public string ImageURL { get; set; }

        [Display(Name = "Start date")]
        [Required(ErrorMessage = "Start date is required.")]
        public DateTime StartDate { get; set; }

        [Display(Name = "End date")]
        [Required(ErrorMessage = "End date is required.")]
        public DateTime EndDate { get; set; }

        [Display(Name = "Moive category")]
        [Required(ErrorMessage = "Moive category is required.")]
        public MovieCategory MovieCategory { get; set; }
        // relationships 
        [Display(Name = "Select actor(s)")]
        [Required(ErrorMessage = "Moive actor(s) is required.")]
        public List<int> ActorIds { get; set; }

        [Display(Name = "Select a cinema")]
        [Required(ErrorMessage = "Moive cinema is required.")]
        public int CinemaId { get; set; }

        [Display(Name = "Select a producer")]
        [Required(ErrorMessage = "Moive producer is required.")]
        public int ProducerId { get; set; }
    }
}
