using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;
using project.NETMVC.Models;

namespace project.NETMVC.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminCustommersController : Controller
    {
        private readonly unisexShopContext _context;

        public AdminCustommersController(unisexShopContext context)
        {
            _context = context;
        }

        // GET: Admin/AdminCustommers
        public async Task<IActionResult> Index(int? page)
        {
            //Paging page
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            //set pageSize
            var pageSize = 10;
            //get customer desc
            var lsCustommers = _context.Custommers.AsNoTracking().Include(x=>x.Location).OrderByDescending(x => x.CustommerId);
            PagedList<Custommer> models = new PagedList<Custommer>(lsCustommers, pageNumber, pageSize);
            ViewBag.CurrentPage = pageNumber;

            return View(models);
        }

        // GET: Admin/AdminCustommers/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var custommer = await _context.Custommers
                .Include(c => c.Location)
                .FirstOrDefaultAsync(m => m.CustommerId == id);
            if (custommer == null)
            {
                return NotFound();
            }

            return View(custommer);
        }

        // GET: Admin/AdminCustommers/Create
        public IActionResult Create()
        {
            ViewData["LocationId"] = new SelectList(_context.Locations, "LocationId", "Conscious");
            return View();
        }

        // POST: Admin/AdminCustommers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CustommerId,FullName,Birthday,Avatar,Email,Phone,LocationId,CreateDate,Password,LastLogin,Active")] Custommer custommer)
        {
            if (ModelState.IsValid)
            {
                _context.Add(custommer);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["LocationId"] = new SelectList(_context.Locations, "LocationId", "Conscious", custommer.LocationId);
            return View(custommer);
        }

        // GET: Admin/AdminCustommers/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var custommer = await _context.Custommers.FindAsync(id);
            if (custommer == null)
            {
                return NotFound();
            }
            ViewData["LocationId"] = new SelectList(_context.Locations, "LocationId", "Conscious", custommer.LocationId);
            return View(custommer);
        }

        // POST: Admin/AdminCustommers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("CustommerId,FullName,Birthday,Avatar,Email,Phone,LocationId,CreateDate,Password,LastLogin,Active")] Custommer custommer)
        {
            if (id != custommer.CustommerId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(custommer);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CustommerExists(custommer.CustommerId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["LocationId"] = new SelectList(_context.Locations, "LocationId", "Conscious", custommer.LocationId);
            return View(custommer);
        }

        // GET: Admin/AdminCustommers/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var custommer = await _context.Custommers
                .Include(c => c.Location)
                .FirstOrDefaultAsync(m => m.CustommerId == id);
            if (custommer == null)
            {
                return NotFound();
            }

            return View(custommer);
        }

        // POST: Admin/AdminCustommers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var custommer = await _context.Custommers.FindAsync(id);
            _context.Custommers.Remove(custommer);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CustommerExists(string id)
        {
            return _context.Custommers.Any(e => e.CustommerId == id);
        }
    }
}
