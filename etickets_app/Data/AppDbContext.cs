using eTickets.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eTickets.Data
{
    public class AppDbContext : IdentityDbContext<ApplicationUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Actor_Movie>().HasKey(am => new
            {
                am.ActorId,
                am.MovieId
            });
            modelBuilder.Entity<Actor_Movie>().HasOne(m => m.Movie).WithMany(am => am.Actors_Movies).HasForeignKey(m => m.MovieId);
         
            modelBuilder.Entity<Actor_Movie>().HasOne(m => m.Actor).WithMany(am => am.Actors_Movies).HasForeignKey(m => m.ActorId);
            
            modelBuilder.Entity<IdentityRole>(e => e.Property(IR => IR.Id).HasMaxLength(150));

            modelBuilder.Entity<ApplicationUser>(e => e.Property(IU => IU.Id).HasMaxLength(150));
            modelBuilder.Entity<ApplicationUser>(e => e.Property(IU => IU.is_active).HasDefaultValue(true));
            modelBuilder.Entity<ApplicationUser>(e => e.Property(IU => IU.is_staff).HasDefaultValue(false));
            modelBuilder.Entity<ApplicationUser>(e => e.Property(IU => IU.is_superuser).HasDefaultValue(false));

            modelBuilder.Entity<IdentityRoleClaim<string>>(e => e.Property(IR => IR.RoleId).HasMaxLength(150));

            modelBuilder.Entity<IdentityUserClaim<string>>(e => e.Property(IR => IR.UserId).HasMaxLength(150));

            modelBuilder.Entity<IdentityUserLogin<string>>(e => e.Property(IU => IU.LoginProvider).HasMaxLength(200));
            modelBuilder.Entity<IdentityUserLogin<string>>(e => e.Property(IU => IU.ProviderKey).HasMaxLength(200));
            modelBuilder.Entity<IdentityUserLogin<string>>(e => e.Property(IU => IU.UserId).HasMaxLength(200));

            modelBuilder.Entity<IdentityUserRole<string>>(e => e.Property(IR => IR.UserId).HasMaxLength(150));
            modelBuilder.Entity<IdentityUserRole<string>>(e => e.Property(IR => IR.RoleId).HasMaxLength(150));

            modelBuilder.Entity<IdentityUserToken<string>>(e => e.Property(IR => IR.UserId).HasMaxLength(150));
            modelBuilder.Entity<IdentityUserToken<string>>(e => e.Property(IR => IR.LoginProvider).HasMaxLength(150));
            modelBuilder.Entity<IdentityUserToken<string>>(e => e.Property(IR => IR.Name).HasMaxLength(150));

            
            base.OnModelCreating(modelBuilder);
        }
        
        public DbSet<Actor> Actors { get; set; }
        public DbSet <Movie> Movies { get; set; }
        public DbSet <Actor_Movie> Actors_Movies { get; set; }
        public DbSet <Cinema> Cinemas { get; set; }
        public DbSet <Producer> Producers { get; set; }

        //Orders tables
        public DbSet<Order> OrderItems {get; set; }
        public DbSet<Order> Orders {get; set; }
        public DbSet<ShoppingCartItem> ShoppingCartItems { get; set; }
        
    }

}
