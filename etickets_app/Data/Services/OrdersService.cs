using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eTickets.Models;
using Microsoft.EntityFrameworkCore;

namespace eTickets.Data.Services
{
    public class OrdersService : IOrdersService
    {
        private readonly AppDbContext _context;

        public OrdersService(AppDbContext context)
        {
            _context = context;
        }
        public async Task<List<Order>> GetOrdersByUserIdAndRoleAsync(string userId, string userRole)
        {
            var orders = await _context.Orders.Include(o => o.OrderItems).ThenInclude(OI => OI.Movie)
            .Include(u => u.User).ToListAsync();
            
            if(userRole != "Admin")
            {
                orders = orders.Where(o => o.UserId == userId).ToList();
            }
            return orders;
        }

        public async Task StoreOrderAsync(List<ShoppingCartItem> items, string userId, string userEmail)
        {
            var order = new Order()
            {
                UserId = userId,
                Email = userEmail
            };

            await _context.Orders.AddAsync(order);
            await _context.SaveChangesAsync();

            foreach(var item in items)
            {
                var orderItem = new OrderItem()
                {
                    Amount = item.Amount,
                    MovieId = item.Movie.Id,
                    Price = item.Movie.Price,
                    OrderId = order.Id,
                };

                await _context.Set<OrderItem>().AddAsync(orderItem);
            }
        }
    }
}