using eTickets.Data;
using eTickets.Data.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eTickets.Models;

namespace eTickets.Controllers
{
    public class ActorsController : Controller
    {
        private readonly IActorsService _service;
        public ActorsController(IActorsService service)
        {
            _service = service;
        }
        public async Task<IActionResult> Index()
        {
            var actors = await _service.GetAllAsync();

            return View(actors);
        }

        //Get: /Create
        public IActionResult Create()
        {
            return View();
        }

        //Post: /Create
        [HttpPost]
        public async Task<IActionResult> Create([Bind("FullName, ProfilepictureURL, Bio")]Actor actor)
        {
            if(!ModelState.IsValid)
            {
                return View(actor);
            }

            await _service.AddAsync(actor);
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Details(int id)
        {
            var actor = await _service.GetByIdAsync(id);

            if(actor == null)
                return View("NotFound");
            
            return View(actor);
        }

        //Get: /Edit/1
        public async Task<IActionResult> Edit(int id)
        {
            var actor = await _service.GetByIdAsync(id);
            if(actor == null)
                return View("NotFound");
            return View(actor);
        }

        //Post: /Edit/1
        [HttpPost]
        public async Task<IActionResult> Edit(int id, Actor actor)
        {
            if(!ModelState.IsValid)
            {
                return View(actor);
            }

            await _service.UpdateAsync(id, actor);
            return RedirectToAction(nameof(Index));
        }

        //Get: /Delete/1
        public async Task<IActionResult> Delete(int id)
        {
            var actor = await _service.GetByIdAsync(id);
            if(actor == null)
                return View("NotFound");
            return View(actor);
        }

        //Post: /Delete/1
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirme(int id)
        {
            var actor = await _service.GetByIdAsync(id);
            if(actor == null)
                return View("NotFound");

            await _service.DeleteAsync(actor);
            return RedirectToAction(nameof(Index));
        }
    }
}
