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

        public IActionResult Details(int id)
        {
            var blog = _context.Blogs.AsNoTracking().SingleOrDefault(x=>x.BlogId==id);
            if (blog == null)
            {
                return RedirectToAction("Index");
            }
            return View(blog);
        }
    }
}
