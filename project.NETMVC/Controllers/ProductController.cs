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
    public class ProductController : Controller
    {
        private readonly unisexShopContext _context;


        public ProductController(unisexShopContext context)
        {
            _context = context;
        }

        // GET: Admin/AdminProducts
        public async Task<IActionResult> Index(
            string sortOrder,
            string currentFilter,
            string searchString,
            int? pageNumber)
        {
            ViewData["CurrentSort"] = sortOrder;
            ViewData["PriceUpSortParm"] = String.IsNullOrEmpty(sortOrder) ? "priceup_desc" : "";
            ViewData["PriceDownSortParm"] = sortOrder == "Price" ? "pricedown_desc" : "Price";

            if (searchString != null)
            {
                pageNumber = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            var Products = from s in _context.Products
                        select s;
            if (!String.IsNullOrEmpty(searchString))
            {
                Products = Products.Where(s => s.Name.Contains(searchString)
                                       || s.Name.Contains(searchString));
            }
            switch (sortOrder)
            {
                case "pricedown_desc":
                    Products = Products.OrderByDescending(s => s.Name);
                    break;
                case "Date":
                    Products = Products.OrderBy(s => s.Price);
                    break;
                case "priceup_desc":
                    Products = Products.OrderByDescending(s => s.Price);
                    break;
                default:
                    Products = Products.OrderBy(s => s.Name);
                    break;
            }

            int pageSize = 9;
            return View(await PaginatedList<Product>.CreateAsync(Products.AsNoTracking(), pageNumber ?? 1, pageSize));
        }

        public IActionResult Details(int id)
        {
            var Product = _context.Products.AsNoTracking().SingleOrDefault(x => x.IdSp == id);
            if (Product == null)
            {
                return RedirectToAction("Index");
            }
            return View(Details);
        }
    }
}
