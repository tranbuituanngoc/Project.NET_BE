using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;
using project.NETMVC.Models;
using WebShop.Helpper;

namespace project.NETMVC.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminBlogsController : Controller
    {
        private readonly unisexShopContext _context;
        public INotyfService _notyfService { get; }

        public AdminBlogsController(unisexShopContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        // GET: Admin/AdminBlogs
        public async Task<IActionResult> Index(int? page)
        {
            //Paging page
            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            //set pageSize
            var pageSize = 10;
            //get customer desc
            var lsBlogs = _context.Blogs.AsNoTracking().OrderByDescending(x => x.BlogId);
            PagedList<Blog> models = new PagedList<Blog>(lsBlogs, pageNumber, pageSize);
            ViewBag.CurrentPage = pageNumber;

            return View(models);
        }

        // GET: Admin/AdminBlogs/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blog = await _context.Blogs
                .FirstOrDefaultAsync(m => m.BlogId == id);
            if (blog == null)
            {
                return NotFound();
            }

            return View(blog);
        }

        // GET: Admin/AdminBlogs/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/AdminBlogs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("BlogId,Title,Image,Author,AccountId,CreateDate,ModifyDate,IsHot,IsNewfeed,Published,ListImage,Contents")] Blog blog, Microsoft.AspNetCore.Http.IFormFile fThumb)
        {
            if (ModelState.IsValid)
            {
                blog.Title = Utilities.ToTitleCase(blog.Title);
                if (fThumb != null)
                {
                    // if isImage then get extension and return a product thum with image
                    string extension = Path.GetExtension(fThumb.FileName);
                    string image = Utilities.SEOUrl(blog.Title) + extension;
                    blog.Image = await Utilities.UploadFile(fThumb, @"blogs", image.ToLower());
                }
                if (string.IsNullOrEmpty(blog.Image)) blog.Image = "default.jpg";
                blog.ModifyDate = DateTime.Now;
                blog.CreateDate = DateTime.Now;

                _context.Add(blog);
                await _context.SaveChangesAsync();
                _notyfService.Success("Thêm mới thành công");
                return RedirectToAction(nameof(Index));
        }
            return View(blog);
        }

        // GET: Admin/AdminBlogs/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blog = await _context.Blogs.FindAsync(id);
            if (blog == null)
            {
                return NotFound();
            }
            return View(blog);
        }

        // POST: Admin/AdminBlogs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("BlogId,Title,Image,Author,AccountId,CreateDate,ModifyDate,IsHot,IsNewfeed,Published,ListImage,Contents")] Blog blog, Microsoft.AspNetCore.Http.IFormFile fThumb)
        {
            if (id != blog.BlogId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    blog.Title = Utilities.ToTitleCase(blog.Title);
                    if (fThumb != null)
                    {
                        // if isImage then get extension and return a product thum with image
                        string extension = Path.GetExtension(fThumb.FileName);
                        string image = Utilities.SEOUrl(blog.Title) + extension;
                        blog.Image = await Utilities.UploadFile(fThumb, @"blogs", image.ToLower());
                    }
                    if (string.IsNullOrEmpty(blog.Image)) blog.Image = "default.jpg";
                    blog.ModifyDate = DateTime.Now;

                    _context.Update(blog);
                    _notyfService.Success("Cập nhật thành công");
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BlogExists(blog.BlogId))
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
            return View(blog);
        }

        // GET: Admin/AdminBlogs/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var blog = await _context.Blogs
                .FirstOrDefaultAsync(m => m.BlogId == id);
            if (blog == null)
            {
                return NotFound();
            }

            return View(blog);
        }

        // POST: Admin/AdminBlogs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var blog = await _context.Blogs.FindAsync(id);
            _context.Blogs.Remove(blog);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool BlogExists(int id)
        {
            return _context.Blogs.Any(e => e.BlogId == id);
        }
    }
}
