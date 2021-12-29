using System.Linq;
using System.Threading.Tasks;
using eTickets.Data.Base;
using eTickets.Data.ViewModels;
using eTickets.Models;
using Microsoft.EntityFrameworkCore;

namespace eTickets.Data.Services
{
    public class MoviesService:EntityBaseRepository<Movie>, IMoviesService
    {
        private readonly AppDbContext _context;
        public MoviesService(AppDbContext context):base(context)
        {
            _context = context;
        }

        public async Task AddNewMovieAsync(NewMovieVM data)
        {
            var newMovie = new Movie()
            {
                Name = data.Name,
                Discription = data.Discription,
                Price = data.Price,
                ImageURL = data.ImageURL,
                StartDate = data.StartDate,
                EndDate = data.EndDate,
                MovieCategory = data.MovieCategory,
                CinemaId = data.CinemaId,
                ProducerId = data.ProducerId
            };

            await _context.Movies.AddAsync(newMovie);
            await _context.SaveChangesAsync();

            //adding movie actors
            foreach(var actorId in data.ActorIds)
            {
                var actor_movie = new Actor_Movie()
                {
                    ActorId = actorId,
                    MovieId = newMovie.Id
                };
                await _context.Actors_Movies.AddAsync(actor_movie);
            }
            await _context.SaveChangesAsync();
        }

        public async Task DeleteMovieAsync(NewMovieVM data)
        {
            var dbmovie = await _context.Movies.FirstOrDefaultAsync(m => m.Id == data.Id);

            var existing_actors = await _context.Actors_Movies.Where(am => am.MovieId == data.Id).ToListAsync();
            _context.Actors_Movies.RemoveRange(existing_actors);
            await _context.SaveChangesAsync();

            _context.Movies.Remove(dbmovie);

            await _context.SaveChangesAsync();
        }

        public async Task<Movie> GetMovieByIdAsync(int id)
        {
            var movie = await _context.Movies
            .Include(c => c.Cinema)
            .Include(p => p.Producer)
            .Include(am => am.Actors_Movies).ThenInclude(a => a.Actor)
            .FirstOrDefaultAsync(m => m.Id == id);

            return movie;
        }

        public async Task<NewMovieDropdownsVM> GetNewMovieDropdownsValues()
        {
            var response = new NewMovieDropdownsVM()
            {
                Producers = await _context.Producers.OrderBy(p => p.FullName).ToListAsync(),
                Cinemas = await _context.Cinemas.OrderBy(c => c.Name).ToListAsync(),
                Actors = await _context.Actors.OrderBy(a => a.FullName).ToListAsync()
            };
            
            return response;
            
        }

        public async Task UpdateMovieAsync(NewMovieVM data)
        {
            var dbMovie = await _context.Movies.FirstOrDefaultAsync(m => m.Id == data.Id);

            if(dbMovie != null)
            {
                dbMovie.Name = data.Name;
                dbMovie.Discription = data.Discription;
                dbMovie.Price = data.Price;
                dbMovie.ImageURL = data.ImageURL;
                dbMovie.StartDate = data.StartDate;
                dbMovie.EndDate = data.EndDate;
                dbMovie.MovieCategory = data.MovieCategory;
                dbMovie.CinemaId = data.CinemaId;
                dbMovie.ProducerId = data.ProducerId;

                await _context.SaveChangesAsync();
            }

            //remove existing actors
            var existing_actors = await _context.Actors_Movies.Where(am => am.MovieId == data.Id).ToListAsync();
            _context.Actors_Movies.RemoveRange(existing_actors);
            await _context.SaveChangesAsync();

            //adding movie actors
            foreach(var actorId in data.ActorIds)
            {
                var actor_movie = new Actor_Movie()
                {
                    ActorId = actorId,
                    MovieId = data.Id
                };
                await _context.Actors_Movies.AddAsync(actor_movie);
            }
            await _context.SaveChangesAsync();
        }
    }
}