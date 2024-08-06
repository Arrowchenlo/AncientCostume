using Ancient_costume.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ancient_costume.Controllers
{
    public class StayController : Controller
    {
        private AcDBEntities _db = new AcDBEntities();

        // GET: Stay
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Stay()
        {
            List<Journey_Stays> model = _db.Journey_Stays.ToList();

            return View(model);
        }

        public ActionResult Test1()
        {

            return View();
        }
    }
}