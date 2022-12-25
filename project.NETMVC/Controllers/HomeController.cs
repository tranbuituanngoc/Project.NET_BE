using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using project.NETMVC.Models;
using project.NETMVC.ModelView;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace project.NETMVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly unisexShopContext _context;

        public HomeController(ILogger<HomeController> logger, unisexShopContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            HomeVM model = new HomeVM();

            var lsProducts = _context.Products.AsNoTracking()
                .Where(x => x.Active == true && x.HomeFlag == true)
                .OrderByDescending(x => x.DateCreate)
                .ToList();

            List<ProductHVM> lsProductViews = new List<ProductHVM>();
            var lsCats = _context.Categories
                .AsNoTracking()
                .Where(x => x.Published == true)
                .OrderByDescending(x => x.Odering)
                .ToList();

            foreach (var item in lsCats)
            {
                ProductHVM productHome = new ProductHVM();
                productHome.category = item;
                productHome.products = lsProducts.Where(x => x.CateId == item.CatId).ToList();
                lsProductViews.Add(productHome);

                var TinTuc = _context.Blogs
                    .AsNoTracking()
                    .Where(x => x.Published == true && x.IsNewfeed == true)
                    .OrderByDescending(x => x.CreateDate)
                    .Take(3)
                    .ToList();
                model.Products = lsProductViews;
                model.blogs = TinTuc;
                ViewBag.AllProducts = lsProducts;
            }
            return View(model);
        }



        [Route("Contact.html", Name = "Contact")]
        public IActionResult Contact()
        {
            return View();
        }
        [Route("About.html", Name = "About")]
        public IActionResult About()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
