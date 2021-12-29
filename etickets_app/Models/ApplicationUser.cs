using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace eTickets.Models
{
    public class ApplicationUser:IdentityUser
    {
        [Display(Name="Full Name")]
        public string FullName { get; set; }
        [Display(Name = "Active")]
        public bool is_active { get; set; } = true;

        [Display(Name = "Staff")]
        public bool is_staff { get; set; } = false;

        [Display(Name = "superuser")]
        public bool is_superuser { get; set; } = false;


    }
}