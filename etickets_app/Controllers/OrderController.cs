using eTickets.Data.Services;
using eTickets.Data.Static;
using etickets_app.Data.Cart;
using etickets_app.Data.Services;
using etickets_app.Data.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace etickets_app.Controllers
{
    [Authorize]
    public class OrderController : Controller
    {
        private readonly IMoviesService _moviesService;
        private readonly ShoppingCart _shoppingcart;
        private readonly IOrdersService _ordersService;

        public OrderController(IMoviesService moviesService , ShoppingCart shoppingcart , IOrdersService ordersService)
        {
            _moviesService = moviesService;
            _shoppingcart = shoppingcart;
            _ordersService = ordersService;
        }

        public async Task<IActionResult> Index()
        {
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            string userRole = User.FindFirstValue(ClaimTypes.Role);

            var orders = await _ordersService.GetOrdersByUserIdAndRoleAsync(userId, userRole);

            return View(orders);
        }


        // Get Total Price of Movies 
        public IActionResult ShoppingCart()
        {
            var Items = _shoppingcart.GetShoppingCartItems();
            _shoppingcart.ShoppingCartItems = Items;
            var response = new ShoppingCartVM()
            {
                ShoppingCart = _shoppingcart,
                ShoppingCartTotal = _shoppingcart.GetShoppingCartTotal()
            };
            return View(response);
        }
        // Add Item To Shopping Cart
        public async Task<IActionResult> AddItemToShoppingCart (int id)
        {
            var item = await _moviesService.GetMovieByIdAsync(id);

            if (item != null)
            {
                _shoppingcart.AddItemToCart(item);
            }
            return RedirectToAction(nameof(ShoppingCart));
        }
        // Remove Item From Shopping Cart
        public async Task<IActionResult> RemoveItemFromShoppingCart(int id)
        {
            var item = await _moviesService.GetMovieByIdAsync(id);

            if (item != null)
            {
                _shoppingcart.RemoveItemFromCart(item);
            }
            return RedirectToAction(nameof(ShoppingCart));
        }

        // Complate Order Payment
        public async Task<IActionResult> CompleteOrder()
        {
            var items = _shoppingcart.GetShoppingCartItems();
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            string userEmailAddress = User.FindFirstValue(ClaimTypes.Email);
            await _ordersService.StoreOrderAsync(items, userId, userEmailAddress);
            await _shoppingcart.ClearShoppingCartAsync();

            return View("OrderCompleted");
        }
    }
}
