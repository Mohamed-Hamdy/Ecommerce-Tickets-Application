using eTickets.Data;
using eTickets.Models;
using etickets_app.Data.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eTickets.Controllers
{
    public class ProducersController : Controller
    {
        private readonly IProducersService _service;
        public ProducersController(IProducersService service)
        {
            _service = service;
        }

         public async Task <IActionResult> Index()
        {
            var allproducers = await _service.GetAllAsync();
            return View(allproducers);
        }
        public IActionResult Create()
        {
            return View();
        }

        public async Task<IActionResult> Details(int id)
        {
            var producer_Details = await _service.GetByIdAsync(id);

            if (producer_Details == null)
                return View("NotFound");

            return View(producer_Details);
        }

        //Post: /Create
        [HttpPost]
        public async Task<IActionResult> Create([Bind("FullName, ProfilepictureURL, Bio")] Producer producer)
        {
            if (!ModelState.IsValid)
            {
                return View(producer);
            }

            await _service.AddAsync(producer);
            return RedirectToAction(nameof(Index));
        }

        //Get: /Edit/1
        public async Task<IActionResult> Edit(int id)
        {
            var producer = await _service.GetByIdAsync(id);
            if (producer == null)
                return View("NotFound");
            return View(producer);
        }

        //Post: /Edit/1
        [HttpPost]
        public async Task<IActionResult> Edit(int id, Producer producer)
        {
            if (!ModelState.IsValid)
            {
                return View(producer);
            }

            await _service.UpdateAsync(id, producer);
            return RedirectToAction(nameof(Index));
        }

        //Get: /Delete/1
        public async Task<IActionResult> Delete(int id)
        {
            var producer = await _service.GetByIdAsync(id);
            if (producer == null)
                return View("NotFound");
            return View(producer);
        }

        //Post: /Delete/1
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirme(int id)
        {
            var producer = await _service.GetByIdAsync(id);
            if (producer == null)
                return View("NotFound");

            await _service.DeleteAsync(producer);
            return RedirectToAction(nameof(Index));
        }

    }
}
