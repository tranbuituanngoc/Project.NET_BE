using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;
using project.NETMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.NETMVC.Controllers
{
    public class BlogController : Controller
    {
        private readonly unisexShopContext _context;


        public BlogController(unisexShopContext context)
        {
            _context = context;
        }

        // GET: Admin/AdminBlogs
        public async Task<IActionResult> Index(
            string currentFilter,
            string searchString,
            int? pageNumber)
        {
            if (searchString != null)
            {
                pageNumber = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var blogs = from s in _context.Blogs
                        select s;
            if (!String.IsNullOrEmpty(searchString))
            {
                blogs = blogs.Where(s => s.Title.Contains(searchString)
                                       || s.Title.Contains(searchString));
            }

            int pageSize = 6;
            return View(await PaginatedList<Blog>.CreateAsync(blogs.AsNoTracking(), pageNumber ?? 1, pageSize));
        }

        public IActionResult Details(int id)
        {
            var blog = _context.Blogs.AsNoTracking().SingleOrDefault(x => x.BlogId == id);
            if (blog == null)
            {
                return RedirectToAction("Index");
            }
            return View(blog);
        }
    }
}
