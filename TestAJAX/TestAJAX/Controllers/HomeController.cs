using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestAJAX.Models;

namespace TestAJAX.Controllers
{
    public class HomeController : Controller
    {
        NorthwindEntities _db = new NorthwindEntities();

        public ActionResult AJAX()
        {
            var model = _db.Orders.ToList();

            return View(model);
        }

        public ActionResult Dropdown()
        {
            var OrderId = _db.Orders.Select(o => new { o.OrderID }).ToList();//使用匿名物件轉集合
                
            return Json(OrderId, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetDeopdown(int? orderId)
        {
            var OrderDetail = _db.Order_Details
                .Where(o => o.OrderID == orderId)
                .Select(o => new { o.ProductID, o.UnitPrice, o.Quantity, o.Discount})
                .ToList();

            return Json(OrderDetail, JsonRequestBehavior.AllowGet);
        }

        //顧客ID
        public ActionResult Customer()
        {
           var CustomerId = _db.Orders.Select(o => new { o.CustomerID }).ToList();

            return Json(CustomerId, JsonRequestBehavior.AllowGet);
        }

        //顧客明細
        public ActionResult GetCustomer(string customerId)
        {
           var CustomerDetail = _db.Customers
                .Where(c => c.CustomerID == customerId)
                .Select(c => new { c.CompanyName, c.ContactName, c.ContactTitle, c.Address })
                .ToList();

            return Json(CustomerDetail, JsonRequestBehavior.AllowGet);
        }


        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}