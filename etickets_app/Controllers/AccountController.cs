using System.Threading.Tasks;
using eTickets.Data;
using eTickets.Data.Cart;
using eTickets.Data.Static;
using eTickets.Data.ViewModels;
using eTickets.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace eTickets.Controllers
{
    public class AccountController: Controller
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly AppDbContext _context;
        private readonly ShoppingCart _shoppingCart;
        public AccountController(UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager, AppDbContext context, ShoppingCart shoppingCart)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _context = context;
            _shoppingCart = shoppingCart;
        }

        [Authorize(Roles = UserRoles.AdminAndSuperUser)]
        public async Task<IActionResult> Users()
        {
            var users = await _context.Users.ToListAsync();
            return View(users);
        }

        public IActionResult Login()
        {
            bool checkLoggedIn = User?.Identity.IsAuthenticated ?? false;
            if(checkLoggedIn)
                return RedirectToAction("Index", "Movies");
            return View(new LoginVM());
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginVM loginVM)
        {
            bool checkLoggedIn = User?.Identity.IsAuthenticated ?? false;
            if(checkLoggedIn)
                return RedirectToAction("Index", "Movies");

            if(!ModelState.IsValid)
            {
                return View(loginVM);
            }

            var user = await _userManager.FindByEmailAsync(loginVM.Email);
            if(user != null)
            {
                if(!user.is_active)
                {
                    TempData["Error"] = "This account is banned";
                    return View(loginVM);
                }
                var checkPassword = await _userManager.CheckPasswordAsync(user, loginVM.Password);
                if(checkPassword)
                {
                    var result = await _signInManager.PasswordSignInAsync(user, loginVM.Password, false, false);
                    if(result.Succeeded)
                    {
                        return RedirectToAction("Index", "Movies");
                    }
                }

                TempData["Error"] = "Email or Password is not valid";
                return View(loginVM);
            }

            TempData["Error"] = "Email or Password is not valid";
            return View(loginVM);
        }

        public IActionResult Register()
        {
            bool checkLoggedIn = User?.Identity.IsAuthenticated ?? false;
            if(checkLoggedIn)
                return RedirectToAction("Index", "Movies");
            return View(new RegisterVM());
        } 

        [HttpPost]
        public async Task<IActionResult> Register(RegisterVM registerVM)
        {
            bool checkLoggedIn = User?.Identity.IsAuthenticated ?? false;
            if(checkLoggedIn)
                return RedirectToAction("Index", "Movies");

            if(!ModelState.IsValid)
                return View(registerVM);
            
            var user = await _userManager.FindByEmailAsync(registerVM.Email);
            if(user != null)
            {
                TempData["Error"] = "This Email already exists!";
                return View(registerVM);
            }

            var newUser = new ApplicationUser()
            {
                FullName = registerVM.FullName,
                Email = registerVM.Email,
                UserName = registerVM.Email
            };

            var newUserResponse = await _userManager.CreateAsync(newUser, registerVM.Password);
            if(newUserResponse.Succeeded)
                await _userManager.AddToRoleAsync(newUser, UserRoles.User);
            
            return View("RegisterCompleted");
        }

        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            bool checkLoggedIn = User?.Identity.IsAuthenticated ?? false;
            if(checkLoggedIn)
            {
                await _signInManager.SignOutAsync();
                await _shoppingCart.ClearShoppingCartAsync();
                return RedirectToAction("Index", "Movies");
            }else{
                return RedirectToAction("Index", "Movies");
            }
            
        }

        public IActionResult AccessDenied(string ReturnUrl)
        {
            return View();
        }

        [Authorize(Roles = UserRoles.AdminAndSuperUser)]
        public async Task<IActionResult> ManageAccount(string email)
        {
            var user = await _userManager.FindByEmailAsync(email);
            var currentUserRole = HttpContext.User.IsInRole(UserRoles.SuperUser);

            if(await _userManager.IsInRoleAsync(user, UserRoles.SuperUser) && !currentUserRole)
            {
                TempData["Error"] = "You have no authority over the account you try to access!";
                return RedirectToAction(nameof(Users));
            }
            if(user != null)
                return View(user);
            return RedirectToAction(nameof(Users));
        }

        [HttpPost, Authorize(Roles = UserRoles.AdminAndSuperUser)]
        public async Task<IActionResult> ManageAccount(ApplicationUser account)
        {
            var isActive = account.is_active;
            var isAdmine = account.is_staff;

            var user = await _userManager.FindByEmailAsync(account.Email);

            if(user == null)
                return RedirectToAction(nameof(Users));
            
            user.is_active = isActive;
            user.is_staff = isAdmine;

            if(!isAdmine)
                await _userManager.RemoveFromRoleAsync(user, UserRoles.Admin);
            else
                await _userManager.AddToRoleAsync(user, UserRoles.Admin);

            await _context.SaveChangesAsync();

            return View("StatusChangedSuccessfully");
        }
    }
}