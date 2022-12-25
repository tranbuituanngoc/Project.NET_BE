using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using project.NETMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.NETMVC.Controllers
{
    public class ProductController : Controller
    { 
        private readonly unisexShopContext _context;
        public ProductController(unisexShopContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Details(int id)
        {
            var product = _context.Products.Include(x => x.Cate).FirstOrDefault(x => x.IdSp == id);
            if (product == null)
            {
                return RedirectToAction("Index");
            }
            return View(product);
        }
    }
}
