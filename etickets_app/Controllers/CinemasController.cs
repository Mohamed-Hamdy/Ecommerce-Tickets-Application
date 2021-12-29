using eTickets.Data;
using eTickets.Models;
using etickets_app.Data.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eTickets.Controllers
{
    [Authorize]
    public class CinemasController : Controller
    {
        private readonly ICinemasService _service;
        public CinemasController(ICinemasService service)
        {
            _service = service;
        }

        [AllowAnonymous]
        public async Task<IActionResult> Index()
        {
            var allcinemas = await _service.GetAllAsync();
            return View(allcinemas);
        }
        //Get: /Create
        public IActionResult Create()
        {
            return View();
        }

        //Post: /Create
        [HttpPost]
        public async Task<IActionResult> Create([Bind("Logo, Name , Description")] Cinema cinema)
        {
            if (!ModelState.IsValid)
            {
                return View(cinema);
            }

            await _service.AddAsync(cinema);
            return RedirectToAction(nameof(Index));
        }

        [AllowAnonymous]
        public async Task<IActionResult> Details(int id)
        {
            var cinema = await _service.GetByIdAsync(id);

            if (cinema == null)
                return View("NotFound");

            return View(cinema);
        }

        //Get: /Edit/1
        public async Task<IActionResult> Edit(int id)
        {
            var cinema = await _service.GetByIdAsync(id);
            if (cinema == null)
                return View("NotFound");
            return View(cinema);
        }

        //Post: /Edit/1
        [HttpPost]
        public async Task<IActionResult> Edit(int id, Cinema cinema)
        {
            if (!ModelState.IsValid)
            {
                return View(cinema);
            }

            await _service.UpdateAsync(id, cinema);
            return RedirectToAction(nameof(Index));
        }

        //Get: /Delete/1
        public async Task<IActionResult> Delete(int id)
        {
            var cinema = await _service.GetByIdAsync(id);
            if (cinema == null)
                return View("NotFound");
            return View(cinema);
        }

        //Post: /Delete/1
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirme(int id)
        {
            var cinema = await _service.GetByIdAsync(id);
            if (cinema == null)
                return View("NotFound");

            await _service.DeleteAsync(cinema);
            return RedirectToAction(nameof(Index));
        }
    }
}
