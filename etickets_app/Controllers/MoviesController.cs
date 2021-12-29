using eTickets.Data;
using eTickets.Data.Services;
using eTickets.Data.Static;
using eTickets.Data.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eTickets.Controllers
{
    [Authorize(Roles = UserRoles.Admin)]
    public class MoviesController : Controller
    {

        private readonly IMoviesService _service;
        public MoviesController(IMoviesService service)
        {
            _service = service;
        }

        [AllowAnonymous]
        public async Task<IActionResult> Index()
        {
            var allMovies = await _service.GetAllAsync(c => c.Cinema);
            return View(allMovies);
        }

        [AllowAnonymous]
        public async Task<IActionResult> Filter(string searchString)
        {
            var allMovies = await _service.GetAllAsync(c => c.Cinema);

            if(!string.IsNullOrEmpty(searchString))
            {
                var FilteredResult = allMovies.Where(m => m.Name.ToLower().Contains(searchString) ||
                 m.Discription.ToLower().Contains(searchString))
                .ToList();
                return View("Index", FilteredResult);
            }

            return View(allMovies);
        }

        //Get: Movies/Details/id
        [AllowAnonymous]
        public async Task<IActionResult> Details(int id)
        {
            var movie = await _service.GetMovieByIdAsync(id);

            return View(movie);
        }

        //Get: Movies/Create
        public async Task<IActionResult> Create()
        {
            var movieDropdownsData = await _service.GetNewMovieDropdownsValues();

            ViewBag.Cinemas = new SelectList(movieDropdownsData.Cinemas, "Id", "Name");
            ViewBag.Producers = new SelectList(movieDropdownsData.Producers, "Id", "FullName");
            ViewBag.Actors = new SelectList(movieDropdownsData.Actors, "Id", "FullName");

            return View();
        }

        //Post: Movies/Create
        [HttpPost]
        public async Task<IActionResult> Create(NewMovieVM movie)
        {
            if(!ModelState.IsValid)
            {
                var movieDropdownsData = await _service.GetNewMovieDropdownsValues();

                ViewBag.Cinemas = new SelectList(movieDropdownsData.Cinemas, "Id", "Name");
                ViewBag.Producers = new SelectList(movieDropdownsData.Producers, "Id", "FullName");
                ViewBag.Actors = new SelectList(movieDropdownsData.Actors, "Id", "FullName");

                return View(movie);
            }

            await _service.AddNewMovieAsync(movie);
            return RedirectToAction(nameof(Index));
        }

        //Get: Movies/Edit/id
        public async Task<IActionResult> Edit(int id)
        {
            var movie = await _service.GetMovieByIdAsync(id);

            if(movie == null) return View("NotFound");

            var response = new NewMovieVM()
            {
                    Name = movie.Name,
                    Discription = movie.Discription,
                    Price = movie.Price,
                    ImageURL = movie.ImageURL,
                    StartDate = movie.StartDate,
                    EndDate = movie.EndDate,
                    MovieCategory = movie.MovieCategory,
                    CinemaId = movie.CinemaId,
                    ProducerId = movie.ProducerId,
                    ActorIds = movie.Actors_Movies.Select(m => m.ActorId).ToList()
            };

            var movieDropdownsData = await _service.GetNewMovieDropdownsValues();

            ViewBag.Cinemas = new SelectList(movieDropdownsData.Cinemas, "Id", "Name");
            ViewBag.Producers = new SelectList(movieDropdownsData.Producers, "Id", "FullName");
            ViewBag.Actors = new SelectList(movieDropdownsData.Actors, "Id", "FullName");

            return View(response);
        }

        //Post: Movies/Edit/id
        [HttpPost]
        public async Task<IActionResult> Edit(int id, NewMovieVM movie)
        {
            if(id != movie.Id) return View("NotFound");

            if(!ModelState.IsValid)
            {
                var movieDropdownsData = await _service.GetNewMovieDropdownsValues();

                ViewBag.Cinemas = new SelectList(movieDropdownsData.Cinemas, "Id", "Name");
                ViewBag.Producers = new SelectList(movieDropdownsData.Producers, "Id", "FullName");
                ViewBag.Actors = new SelectList(movieDropdownsData.Actors, "Id", "FullName");
                
                return View(movie);
            }

            await _service.UpdateMovieAsync(movie);
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Delete(int id)
        {
            var movie = await _service.GetMovieByIdAsync(id);

            if(movie == null) return View("NotFound");

            var response = new NewMovieVM()
            {
                    Name = movie.Name,
                    Discription = movie.Discription,
                    Price = movie.Price,
                    ImageURL = movie.ImageURL,
                    StartDate = movie.StartDate,
                    EndDate = movie.EndDate,
                    MovieCategory = movie.MovieCategory,
                    CinemaId = movie.CinemaId,
                    ProducerId = movie.ProducerId,
                    ActorIds = movie.Actors_Movies.Select(m => m.ActorId).ToList()
            };

            var movieDropdownsData = await _service.GetNewMovieDropdownsValues();

            ViewBag.Cinemas = new SelectList(movieDropdownsData.Cinemas, "Id", "Name");
            ViewBag.Producers = new SelectList(movieDropdownsData.Producers, "Id", "FullName");
            ViewBag.Actors = new SelectList(movieDropdownsData.Actors, "Id", "FullName");

            return View(response);
        }

        //Post: /Delete/1
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirme(int id, NewMovieVM movie)
        {
            if(id != movie.Id) return View("NotFound");

            await _service.DeleteMovieAsync(movie);
            return RedirectToAction(nameof(Index));
        }

    }
}
