using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;
using WebShop.Helpper;
using project.NETMVC.Models;

namespace project.NETMVC.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminProductsController : Controller
    {
        private readonly unisexShopContext _context;
        public INotyfService _notyfService { get; }

        public AdminProductsController(unisexShopContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        // GET: Admin/AdminProducts
        public IActionResult Index(int page = 1, int CatID = 0)
        {
            var pageNumber = page;
            var pageSize = 10;

            //get list product after filter
            List<Product> lsProducts = new List<Product>();

            //if filted then where cateID=catID else seleted all
            if (CatID != 0)
            {
                lsProducts = _context.Products
                .AsNoTracking()
                .Where(x => x.CateId == CatID)
                .Include(x => x.Cate)
                .OrderBy(x => x.IdSp).ToList();
            }
            else
            {
                lsProducts = _context.Products
               .AsNoTracking()
               .Include(x => x.Cate)
               .OrderBy(x => x.IdSp).ToList();
            }

            // because to list so parse to queryable like lsProducts.AsQueryable()
            PagedList<Product> models = new PagedList<Product>(lsProducts.AsQueryable(), pageNumber, pageSize);
            ViewBag.CurrentCateID = CatID;

            ViewBag.CurrentPage = pageNumber;

            ViewData["DanhMuc"] = new SelectList(_context.Categories, "CatId", "CatName");

            return View(models);
        }



        public IActionResult Filtter(int CatID = 0)
        {
            var url = $"/Admin/AdminProducts?CatID={CatID}";
            // get all product else return catID
            if (CatID == 0)
            {
                url = $"/Admin/AdminProducts";
            }
            //return a json file and send redirect to Admin product
            return Json(new { status = "success", redirectUrl = url });
        }

        // GET: Admin/AdminProducts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Cate)
                .FirstOrDefaultAsync(m => m.IdSp == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Admin/AdminProducts/Create
        public IActionResult Create()
        {
            ViewData["Danhmuc"] = new SelectList(_context.Categories, "CatId", "CatName");
            return View();
        }

        // POST: Admin/AdminProducts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdSp,Name,CateId,Price,Status,Discount,DateCreate,DateModified,BestSeller,HomeFlag,Active,UnitslnStock,Thumb,Image,Video,ShortDescrip,Descrip")] Product product, Microsoft.AspNetCore.Http.IFormFile fThumb, Microsoft.AspNetCore.Http.IFormFile fVideo)
        {
            if (ModelState.IsValid)
            {
                product.Name = Utilities.ToTitleCase(product.Name);
                if (fThumb != null)
                {
                    // if isImage then get extension and return a product thum with image
                    string extension = Path.GetExtension(fThumb.FileName);
                    string image = Utilities.SEOUrl(product.Name) + extension;
                    product.Thumb = await Utilities.UploadFile(fThumb, @"products", image.ToLower());
                }
                if (fVideo != null)
                {
                    string extension = Path.GetExtension(fVideo.FileName);
                    string video = Utilities.SEOUrl(product.Name) + extension;
                    product.Video = await Utilities.UploadVideo(fVideo, @"products", video.ToLower());
                }
                if (string.IsNullOrEmpty(product.Thumb)) product.Thumb = "default.jpg";
                if (string.IsNullOrEmpty(product.Video)) product.Video = "default.mp4";
                product.DateModified = DateTime.Now;
                product.DateCreate = DateTime.Now;

                _context.Add(product);
                await _context.SaveChangesAsync();
                _notyfService.Success("Thêm mới thành công");
                return RedirectToAction(nameof(Index));
            }
            ViewData["DanhMuc"] = new SelectList(_context.Categories, "CatId", "CatName", product.CateId);
            return View(product);
        }

        // GET: Admin/AdminProducts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["Danhmuc"] = new SelectList(_context.Categories, "CatId", "CatName", product.CateId);
            return View(product);
        }

        // POST: Admin/AdminProducts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdSp,Name,CateId,Price,Status,Discount,DateCreate,DateModified,BestSeller,HomeFlag,Active,UnitslnStock,Thumb,Image,Video,ShortDescrip,Descrip")] Product product, Microsoft.AspNetCore.Http.IFormFile fThumb, Microsoft.AspNetCore.Http.IFormFile fVideo)
        {
            if (id != product.IdSp)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (ModelState.IsValid)
                    {
                        product.Name = Utilities.ToTitleCase(product.Name);
                        if (fThumb != null)
                        {
                            // if isImage then get extension and return a product thum with image
                            string extension = Path.GetExtension(fThumb.FileName);
                            string image = Utilities.SEOUrl(product.Name) + extension;
                            product.Thumb = await  Utilities.UploadFile(fThumb, @"products", image.ToLower());
                        }
                        if (fVideo != null)
                        {
                            string extension = Path.GetExtension(fVideo.FileName);
                            string video = Utilities.SEOUrl(product.Name) + extension;
                            product.Video = await Utilities.UploadVideo(fVideo, @"products", video.ToLower());
                        }
                        if (string.IsNullOrEmpty(product.Thumb)) product.Thumb = "default.jpg";
                        if (string.IsNullOrEmpty(product.Video)) product.Video = "default.mp4";
                        product.DateModified = DateTime.Now;

                        _context.Update(product);
                        _notyfService.Success("Cập nhật thành công");
                        await _context.SaveChangesAsync();
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.IdSp))
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
            ViewData["Danhmuc"] = new SelectList(_context.Categories, "CatId", "CatName", product.CateId);
            return View(product);
        }

        // GET: Admin/AdminProducts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Cate)
                .FirstOrDefaultAsync(m => m.IdSp == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Admin/AdminProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _context.Products.FindAsync(id);
            _context.Products.Remove(product);
            await _context.SaveChangesAsync();
            _notyfService.Success("Xóa thành công");
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.IdSp == id);
        }
    }
}
