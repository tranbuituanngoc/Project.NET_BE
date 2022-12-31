using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using project.NETMVC.Models;
using project.NETMVC.ModelViews;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using WebShop.Extension;
using WebShop.Helpper;

namespace project.NETMVC.Controllers
{
    [Authorize]
    public class AccountsController : Controller
    {
        private readonly unisexShopContext _context;
        public INotyfService _notyfService { get; }

        public AccountsController(unisexShopContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }
        //Kiem tra email
        [HttpGet]
        [AllowAnonymous]
        public IActionResult ValidateEmail(string email)
        {
            try
            {
                var khachhang = _context.Custommers.AsNoTracking().SingleOrDefault(x => x.Email.ToLower() == email.ToLower());
                if (khachhang != null)
                {
                    return Json(data: "Email:" + email + "đã tồn tại.");
                }
                return Json(data: true);
            }
            catch
            {
                return Json(data: true);
            }
        }

        [Route("tai-khoan-cua-toi", Name = "Dashboard")]
        public IActionResult Dashboard()
        {
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            if (taikhoanID != null)
            {
                var khachhang = _context.Custommers.AsNoTracking().SingleOrDefault(x => x.CustommerId.Equals(taikhoanID));
                if (khachhang != null)
                {
                    return View();
                }
            }
            return RedirectToAction("Login");
        }
        //Dang ky
        [HttpGet]
        [AllowAnonymous]
        [Route("dang-ky", Name = "DangKy")]
        public IActionResult DangKyTaiKhoan() { return View(); }

        [HttpPost]
        [AllowAnonymous]
        [Route("dang-ky", Name = "DangKy")]
        public async Task<IActionResult> DangKyTaiKhoan(RegisterVM taikhoan)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var rd = "ct" + Utilities.GetRandomKey();
                    Custommer khachhang = new Custommer
                    {
                        CustommerId = rd,
                        FullName = taikhoan.FullName,
                        Phone = taikhoan.Phone.Trim(),
                        Email = taikhoan.Email.Trim().ToLower(),
                        Password = taikhoan.Password.ToMD5(),
                        Active = true,
                        CreateDate = DateTime.Now
                    };
                    try
                    {
                        _context.Add(khachhang);
                        await _context.SaveChangesAsync();
                        //Luu session Makh
                        HttpContext.Session.SetString("CustomerId", khachhang.CustommerId.ToString());
                        var taikhoanID = HttpContext.Session.GetString("CustomerId");
                        //Nhan dang
                        var claims = new List<Claim>
                        {
                            new Claim(ClaimTypes.Name, khachhang.FullName),
                            new Claim("CustomerId", khachhang.CustommerId.ToString())
                        };
                        ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, "login");
                        ClaimsPrincipal claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
                        await HttpContext.SignInAsync(claimsPrincipal);
                        _notyfService.Success("Đăng ký thành công.");
                        return RedirectToAction("Index", "Home");
                    }
                    catch
                    {
                        _notyfService.Error("Đăng ký không thành công.");
                        return RedirectToAction("DangKyTaiKhoan", "Accounts");
                    }
                }
                else
                {
                    return View(taikhoan);
                }
            }
            catch
            {
                return View(taikhoan);
            }

        }
        //Dang nhap
        [HttpGet]
        [AllowAnonymous]
        [Route("dang-nhap", Name = "DangNhap")]
        public IActionResult Login(string returnUrl = null)
        {
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            if (taikhoanID != null)
            {
                return RedirectToAction("Dashboard", "Accounts");
            }
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("dang-nhap", Name = "DangNhap")]
        public async Task<IActionResult> Login(LoginViewModel customer, string returnUrl = null)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    bool isEmail = Utilities.IsValidEmail(customer.Username);
                    if (!isEmail) { return View(customer); }

                    var khachhang = _context.Custommers.AsNoTracking().SingleOrDefault(x => x.Email.Trim() == customer.Username.Trim());

                    if (khachhang == null) { return RedirectToAction("DangKyTaiKhoan"); }

                    string pass = customer.Password.ToMD5();
                    if (khachhang.Password != pass)
                    {
                        _notyfService.Error("Thông tin đăng nhập không chính xác.");
                        return View(customer);
                    }
                    //Kiem tra trang thai tai khoan
                    if (khachhang.Active == false)
                    {
                        _notyfService.Error("Tài khoản đã bị khóa");
                        return RedirectToAction("Login", "Account");
                    }
                    //Luu session Makh
                    HttpContext.Session.SetString("CustomerId", khachhang.CustommerId.ToString());
                    var taikhoanID = HttpContext.Session.GetString("CustomerId");
                    //Nhan dang
                    var claims = new List<Claim>
                        {
                            new Claim(ClaimTypes.Name, khachhang.FullName),
                            new Claim("CustomerId", khachhang.CustommerId.ToString())
                        };
                    ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, "login");
                    ClaimsPrincipal claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
                    _notyfService.Success("Đăng nhập thành công.");
                    return RedirectToAction("Index", "Home");
                }
            }
            catch
            {
                _notyfService.Error("Đăng nhập không thành công");
                return RedirectToAction("Login", "Accounts");
            }
            return View(customer);
        }
    }
}
