using etickets_app.Data.Cart;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace etickets_app.Data.ViewComponents
{
    public class ShoppingCartSummary: ViewComponent
    {
        private readonly ShoppingCart _shoppingcart;
        
        public ShoppingCartSummary(ShoppingCart shoppingcart)
        {
            _shoppingcart = shoppingcart;
        }
        public IViewComponentResult Invoke()
        {

            var items = _shoppingcart.GetShoppingCartItems();
//          Console.WriteLine("The Count = {0}" + items);
            return View(items.Count);
        }
    }
}
