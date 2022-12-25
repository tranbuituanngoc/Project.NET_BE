using Microsoft.AspNetCore.Mvc;

namespace project.NETMVC.Controllers
{
    public class CategoryController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
