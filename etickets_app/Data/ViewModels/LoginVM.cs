using System.ComponentModel.DataAnnotations;

namespace eTickets.Data.ViewModels
{
    public class LoginVM
    {
        [Required(ErrorMessage = "Email is required")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is requird")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}