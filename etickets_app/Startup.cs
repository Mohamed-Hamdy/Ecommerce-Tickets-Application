using eTickets.Data;
using etickets_app.Data;
using eTickets.Data.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using etickets_app.Data.Services;
using Microsoft.AspNetCore.Http;
using etickets_app.Data.Cart;
using eTickets.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authentication.Cookies;

namespace etickets_app
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //DbContext configuration
            services.AddDbContext<AppDbContext>(options => options.UseMySQL(Configuration.GetConnectionString("DefaultConnectionString")));
            /*
            services.AddIdentity<ApplicationUser , IdentityRole>(options =>
            {
                options.Password.RequiredLength = 10;
                options.Password.RequiredUniqueChars = 3;
                options.Password.RequireLowercase = false;
                options.Password.RequireUppercase = false;
                options.Password.RequireNonAlphanumeric = false;

            })
            
            .AddEntityFrameworkStores<AppDbContext>();
            */
            // Services Configuration
            services.AddScoped<IActorsService, ActorService>();
            services.AddScoped<IProducersService, ProducersService>();
            services.AddScoped<ICinemasService, CinemasService>();
            services.AddScoped<IMoviesService, MoviesService>();
            services.AddScoped<IOrdersService, OrdersService>();
            
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped(sc => ShoppingCart.GetShoppingCart(sc));

            
            //Authorization and Authentication
            services.AddIdentity<ApplicationUser, IdentityRole>().AddEntityFrameworkStores<AppDbContext>();
            services.AddMemoryCache();

            services.AddSession();
            services.AddAuthentication(options => {
                options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
            });

            services.AddControllersWithViews();

            
            
            //services.AddSession();
            //services.AddControllersWithViews();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();
            app.UseSession();
            
            app.UseAuthentication();
            app.UseAuthorization();
           
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
            // seed Database
            AppDbInitializer.Seed(app);
            //AppDbInitializer.SeedUsersAndRolesAsync(app).Wait();
        }
    }
}
