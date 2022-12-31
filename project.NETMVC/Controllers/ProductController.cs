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
        //Phương thức này thêm tham số số trang, tham số thứ tự sắp xếp hiện tại
        //và tham số bộ lọc hiện tại.
        //Khi người dùng chưa nhấp vào liên kết phân trang hoặc sắp xếp thì các tham số sẽ không có giá trị

        public async Task<IActionResult> Index(
            string sortOrder,
            string currentFilter,
            string searchString,
            int? pageNumber)
        {
            //hiển thị ra danh sách sản phẩm được sắp xếp ở hiện tại, giữ nguyên thứ tự sắp xếp
            ViewData["CurrentSort"] = sortOrder;
            ViewData["PriceUpSortParm"] = String.IsNullOrEmpty(sortOrder) ? "giathapdencao" : "";
            ViewData["PriceDownSortParm"] = String.IsNullOrEmpty(sortOrder) ? "giacodenthap" : "";

            //chuỗi tìm kiếm bị thay đổi thì trang phải được cài đtặ lại thành 1
            //chuỗi tìm kiếm thay đổi khi một giá trị được nhập vào và nút tìm kiếm được click
            if (searchString != null)
            {
                pageNumber = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            //hiển thị sản phẩm với chuỗi bộ lọc hiện tại
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
                case "priceup":
                    Products = Products.OrderByDescending(s => s.Price);
                    break;
                case "pricedown":
                    Products = Products.OrderByDescending(s => s.Price);
                    break;
                default:
                    Products = Products.OrderBy(s => s.Price);
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
            var lsProduct = _context.Products
                      .AsNoTracking()
                      .Where(x => x.CateId == Product.CateId && x.IdSp != id && x.Active == true)
                      .Take(3)
                      .OrderByDescending(x => x.DateCreate)
                      .ToList();
            ViewBag.SanPham = lsProduct;
            return View(Product);
        }
    }
}
