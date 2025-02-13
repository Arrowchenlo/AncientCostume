using Ancient_costume.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ancient_costume.Controllers
{
    public class JourneyController : Controller
    {
        private AcDBEntities _db = new AcDBEntities();
        // GET: Journey
        public ActionResult Index()
        {
           List<Journey> model = _db.Journeys.ToList();

            return View(model);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Journey model, HttpPostedFileBase pImage)
        {
            //1.存檔案
            string path = Server.MapPath($@"\UploadFiles\{pImage.FileName}");
            pImage.SaveAs(path);

            //2.存DB
            //model.EditImage = pImage.FileName;
            //_db.Journeys.Add(model);
            //_db.SaveChanges();

            return RedirectToAction("Index");
        }

        public ActionResult Edit(int? id)
        {
            //查詢id
            Journey journey = _db.Journeys.FirstOrDefault(x => x.Id == id);

            return View(journey);
        }

        [HttpPost]
        public ActionResult Edit(Journey model, HttpPostedFileBase pImage)
        {
            //將新資料代入
            Journey oldData = _db.Journeys.FirstOrDefault(x => x.Id == model.Id);

            //新資料取代舊資料
            //oldData.Id = model.Id;
            //oldData.Price = model.Price;

            //如果有上傳新的圖片
            if (pImage != null)
            {
                //換掉
                oldData.Id = model.Id;
                oldData.EditImage = pImage.FileName;

                //存檔
                string path = Server.MapPath($@"\UploadFiles\{pImage.FileName}");
                pImage.SaveAs(path);
            }
            //存DB
            _db.SaveChanges();

            return RedirectToAction("journey");
        }
    }
}