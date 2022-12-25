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
    public class AdminAccountsController : Controller
    {
        private readonly unisexShopContext _context;

        public AdminAccountsController(unisexShopContext context)
        {
            _context = context;
        }

        // GET: Admin/AdminAccounts
        public IActionResult Index(int page = 1, int RoleID = 0)
        {
            var pageNumber = page;
            var pageSize = 10;

            //get list product after filter
            List<Account> lsAccounts = new List<Account>();

            List<SelectListItem> lsTrangThai = new List<SelectListItem>();
            lsTrangThai.Add(new SelectListItem() { Text = "Hoạt động", Value = "1" });
            lsTrangThai.Add(new SelectListItem() { Text = "Khóa", Value = "0" });
          

            //if filted then where cateID=catID else seleted all
            if (RoleID != 0)
            {
                lsAccounts = _context.Accounts
                .AsNoTracking()
                .Where(x => x.RoleId == RoleID)
                .Include(x => x.Role)
                .OrderByDescending(x => x.AccountId).ToList();
            }
            else
            {
                lsAccounts = _context.Accounts
               .AsNoTracking()
               .Include(x => x.Role)
               .OrderByDescending(x => x.AccountId).ToList();
            }

            // because to list so parse to queryable like lsProducts.AsQueryable()
            PagedList<Account> models = new PagedList<Account>(lsAccounts.AsQueryable(), pageNumber, pageSize);
            ViewBag.CurrentRoleID = RoleID;

            ViewBag.CurrentPage = pageNumber;
          
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "Description",RoleID);
            ViewData["lsTrangThai"] = lsTrangThai;
            return View(models);
        }
        //GET: Admin/AdminAccounts/Filtter
        public IActionResult Filtter(int RoleID = 0)
        {
            var url = $"/Admin/AdminAccounts?RoleID={RoleID}";
            // get all product else return RoleID
            if (RoleID == 0)
            {
                url = $"/Admin/AdminAccounts";
            }
            //return a json file and send redirect to AdminAccounts
            return Json(new { status = "success", redirectUrl = url });
        }

        // GET: Admin/AdminAccounts/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts
                .Include(a => a.Role)
                .FirstOrDefaultAsync(m => m.AccountId == id);
            if (account == null)
            {
                return NotFound();
            }

            return View(account);
        }

        // GET: Admin/AdminAccounts/Create
        public IActionResult Create()
        {
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleName");
            return View();
        }

        // POST: Admin/AdminAccounts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("AccountId,Phone,Email,Password,Active,FullName,RoleId,LastLogin,CreateDate")] Account account)
        {
            if (ModelState.IsValid)
            {
                _context.Add(account);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleName", account.RoleId);
            return View(account);
        }

        // GET: Admin/AdminAccounts/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts.FindAsync(id);
            if (account == null)
            {
                return NotFound();
            }
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleName", account.RoleId);
            return View(account);
        }

        // POST: Admin/AdminAccounts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("AccountId,Phone,Email,Password,Active,FullName,RoleId,LastLogin,CreateDate")] Account account)
        {
            if (id != account.AccountId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(account);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AccountExists(account.AccountId))
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
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleName", account.RoleId);
            return View(account);
        }

        // GET: Admin/AdminAccounts/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts
                .Include(a => a.Role)
                .FirstOrDefaultAsync(m => m.AccountId == id);
            if (account == null)
            {
                return NotFound();
            }

            return View(account);
        }

        // POST: Admin/AdminAccounts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var account = await _context.Accounts.FindAsync(id);
            _context.Accounts.Remove(account);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AccountExists(string id)
        {
            return _context.Accounts.Any(e => e.AccountId == id);
        }
    }
}
