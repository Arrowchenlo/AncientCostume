using Ancient_costume.Models;
using Ancient_costume.ViewModel;
using DemoFullCalendar_MVC.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Common.CommandTrees;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Contexts;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Ancient_costume.Controllers
{
    public class EmployeeController : Controller
    {
        private AcDBEntities _db = new AcDBEntities();

        public ActionResult Index()
        {
            List<Journey> model = _db.Journeys.ToList();

            return View(model);
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewEmployees model)
        {
            //帳號Josie , 密碼000
            //成功=>Home/Index

            if (model.Password.Length != 3)
            {
                ModelState.AddModelError("Password", "密碼需要3碼");
            }

            if (ModelState.IsValid)
            {
                //判斷登入帳號Josie , 密碼000
                Employee employees = _db.Employees.FirstOrDefault
                     (m => m.Name == model.UserName
                         && m.Phone == model.Password);

                if (employees != null)
                {
                    //登入成功  

                    //記起來-區別user/member可做不同事情
                    Session["userName"] = model.UserName;
                    Session["employees"] = employees.Name;

                    return RedirectToAction("Index", "Employee");
                }
                else
                {
                    ModelState.AddModelError("", "帳號密碼不正確");
                }
            }

            return View(model);
        }

        public ActionResult Logout()
        {
            Session.Abandon();

            return RedirectToAction("Index", "Employee");
        }

        public ActionResult NoAuth()
        {
            return View();
        }

        //顯示行程
        // Employee/Index傳Id過來
        public ActionResult Journey(int? id)
        {
            //將Journey/index內的產品資訊帶到Journey
            Session["JourneyId"] = id;

            //查詢id
            Journey journey = _db.Journeys.FirstOrDefault(x => x.Id == id);

            return View(journey);
        }

        //新增行程
        public ActionResult Create()
        {
            if (Session["employees"] == null)
            {
                // 如果沒有員工登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Employee");
            }


            return View();
        }

        //新增-OK
        [HttpPost]
        public ActionResult Create(Journey model, HttpPostedFileBase pImage, HttpPostedFileBase sImage1, HttpPostedFileBase sImage2, HttpPostedFileBase sImage3, HttpPostedFileBase stImage1, HttpPostedFileBase stImage2, HttpPostedFileBase stImage3)
        {

            //上傳圖片可為空或有圖片-目前要上傳所有圖片，不然會錯誤 待修改可不上傳圖片
            model.EditImage = pImage.ContentLength == 0 ? model.EditImage : pImage.FileName;
            model.Sights_img1 = sImage1.ContentLength == 0 ? model.Sights_img1 : sImage1.FileName;
            model.Sights_img2 = sImage2.ContentLength == 0 ? model.Sights_img2 : sImage2.FileName;
            model.Sights_img3 = sImage3.ContentLength == 0 ? model.Sights_img3 : sImage3.FileName;
            model.Stay_img1 = stImage1.ContentLength == 0 ? model.Stay_img1 : stImage1.FileName;
            model.Stay_img2 = stImage2.ContentLength == 0 ? model.Stay_img2 : stImage2.FileName;
            model.Stay_img3 = stImage3.ContentLength == 0 ? model.Stay_img3 : stImage3.FileName;

            //圖片存檔在\source\sights\資料夾
            string path = Server.MapPath($@"\source\sights\{pImage.FileName}");
            pImage.SaveAs(path);

            string path1 = Server.MapPath($@"\source\sights\{sImage1.FileName}");
            sImage1.SaveAs(path1);
            string path2 = Server.MapPath($@"\source\sights\{sImage2.FileName}");
            sImage2.SaveAs(path2);
            string path3 = Server.MapPath($@"\source\sights\{sImage3.FileName}");
            sImage3.SaveAs(path3);

            string path4 = Server.MapPath($@"\source\stay\{stImage1.FileName}");
            stImage1.SaveAs(path4);
            string path5 = Server.MapPath($@"\source\stay\{stImage2.FileName}");
            stImage2.SaveAs(path5);
            string path6 = Server.MapPath($@"\source\stay\{stImage3.FileName}");
            stImage3.SaveAs(path6);

            //model存DB
            _db.Journeys.Add(model);
            _db.SaveChanges();

            return RedirectToAction("Createsuccess");
        }

        public ActionResult Createsuccess()
        {
            return View();
        }

        //修改行程
        public ActionResult Edit(int? id)
        {

            if (Session["employees"] == null)
            {
                // 如果沒有員工登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Employee");
            }

            //查詢id
            Journey journey = _db.Journeys.Find(id);

            //回傳journey
            return View(journey);

        }

        [HttpPost]
        public ActionResult Edit(Journey model, HttpPostedFileBase pImage, HttpPostedFileBase sImage1, HttpPostedFileBase sImage2, HttpPostedFileBase sImage3, HttpPostedFileBase stImage1, HttpPostedFileBase stImage2, HttpPostedFileBase stImage3)
        {
            Journey oldData = _db.Journeys.FirstOrDefault(x => x.Id == model.Id);

            //新資料取代舊資料

            oldData.Id = model.Id;
            oldData.JourneyName = model.JourneyName;
            oldData.JourneyDate = model.JourneyDate;
            oldData.JourneyContent = model.JourneyContent;
            oldData.Sights = model.Sights;
            oldData.Location = model.Location;
            oldData.Stay = model.Stay;
            oldData.Stay_title = model.Stay_title;
            oldData.Stay_text = model.Stay_text;
            oldData.Remarks = model.Remarks;
            oldData.AssemblyPlace = model.AssemblyPlace;
            oldData.DailyItinerary = model.DailyItinerary;
            oldData.Sights_title = model.Sights_title;
            oldData.Sights_text = model.Sights_text;
            oldData.ExpenseItems = model.ExpenseItems;
            oldData.Photo = model.Photo;
            oldData.Transportation = model.Transportation;
            oldData.StayExpenses = model.StayExpenses;
            oldData.Activity = model.Activity;
            oldData.CarFare = model.CarFare;
            oldData.Food = model.Food;


            //如果有上傳旅遊圖片，舊資料取代新資料，否則保留舊資料
            //空值檢查

            if (pImage != null && pImage.ContentLength > 0)
            {
                oldData.EditImage = pImage.FileName;
                string path = Server.MapPath($@"\source\sights\{pImage.FileName}");
                pImage.SaveAs(path);
            }

            if (sImage1 != null && sImage1.ContentLength > 0)
            {
                oldData.Sights_img1 = sImage1.FileName;
                string path1 = Server.MapPath($@"\source\sights\{sImage1.FileName}");
                sImage1.SaveAs(path1);
            }

            if (sImage2 != null && sImage2.ContentLength > 0)
            {
                oldData.Sights_img2 = sImage2.FileName;
                string path2 = Server.MapPath($@"\source\sights\{sImage2.FileName}");
                sImage2.SaveAs(path2);
            }

            if (sImage3 != null && sImage3.ContentLength > 0)
            {
                oldData.Sights_img3 = sImage3.FileName;
                string path3 = Server.MapPath($@"\source\sights\{sImage3.FileName}");
                sImage3.SaveAs(path3);
            }

            if (stImage1 != null && stImage1.ContentLength > 0)
            {
                oldData.Stay_img1 = stImage1.FileName;
                string path4 = Server.MapPath($@"\source\stay\{stImage1.FileName}");
                stImage1.SaveAs(path4);
            }

            if (stImage2 != null && stImage2.ContentLength > 0)
            {
                oldData.Stay_img2 = stImage2.FileName;
                string path5 = Server.MapPath($@"\source\stay\{stImage2.FileName}");
                stImage2.SaveAs(path5);
            }

            if (stImage3 != null && stImage3.ContentLength > 0)
            {
                oldData.Stay_img3 = stImage3.FileName;
                string path6 = Server.MapPath($@"\source\stay\{stImage3.FileName}");
                stImage3.SaveAs(path6);
            }

            //存DB
            _db.SaveChanges();

            return RedirectToAction("Editsuccess");
        }

        public ActionResult Editsuccess()
        {
            return View();
        }


        //刪除行程
        public ActionResult Delete(int? id)
        {
            if (Session["employees"] == null)
            {
                // 如果沒有員工登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Employee");
            }

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Journey journey = _db.Journeys.Find(id);
            if (journey == null)
            {
                return HttpNotFound();
            }
            return View(journey);
        }


        //刪除-OK
        [HttpPost]
        //指定Action名稱Delete
        [ActionName(nameof(Delete))]
        public ActionResult Delete2(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Journey journey = _db.Journeys.Find(id);
            if (journey == null)
            {
                return HttpNotFound();
            }
            //從資料庫中刪除
            _db.Journeys.Remove(journey);
            _db.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        //查詢行程
        public ActionResult Inquire(int? id)
        {
            if (Session["employees"] == null)
            {
                // 如果沒有員工登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Employee");
            }

            Journey journey = _db.Journeys.Find(id);

            if (journey == null)
            {
                return HttpNotFound();
            }

            return View(nameof(Index), new List<Journey> { journey });

        }

        public ActionResult Orderinfo()
        {
            if (Session["employees"] == null)
            {
                // 如果沒有員工登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Employee");
            }

            //從資料庫中取得所有訂單，
            //並根據 MemberID 進行排序，最後將結果轉換成 List<Order> 型別的物件 model
            List<Order> model = _db.Orders.OrderBy(o => o.MemberID).ToList();

            //model空值檢查
            if (model == null)
            {
                return HttpNotFound();
            }

            //新增統計行程排行
            //根據行程名稱分組
            var resultJourney = _db.Orders.GroupBy(o => o.JourneyName).ToList();

            // 取得每個行程的訂單數量
            // Select(g => g.Key)：取得分組的 Key 值，也就是行程名稱
            // Select(g => g.Count())：取得分組的數量，也就是訂單數量
            string[] xAry = resultJourney.Select(g => g.Key).ToArray();
            int[] yAry = resultJourney.Select(g => g.Count()).ToArray();

            // 將資料傳遞到視圖
            //將陣列轉換成字串
            //string.Join(",", xAry)：將陣列 xAry 以逗號分隔的形式轉換成字串
            //string.Join(",", yAry)：將陣列 yAry 以逗號分隔的形式轉換成字串
            ViewBag.xAry = string.Join(",", xAry);
            ViewBag.yAry = string.Join(",", yAry);

            //新增統計旅程每月數量-按照月份分組
            //GroupBy(o => o.OrderDate.Value.Month)：根據 OrderDate 的月份進行分組
            var resultMonth = _db.Orders.Where(o => o.OrderDate.HasValue)
                           .GroupBy(o => o.OrderDate.Value.Month)
                           .ToList();


            // 取得每個月份的訂單數量
            var monthlyOrders = resultMonth.Select(m => m.Key).ToList();

            // 準備線狀圖的資料
            string[] aAry = monthlyOrders.Select(o => o.ToString()).ToArray();
            int[] bAry = resultMonth.Select(g => g.Count()).ToArray();//取得每個月份的訂單數量

            // 將資料傳遞到視圖
            ViewBag.aAry = string.Join(",", aAry);//將陣列轉換成字串
            ViewBag.bAry = string.Join(",", bAry);

            //新增統計旅程每月收入-按照月份分組
            var resultincome = _db.Orders
                           .Where(o => o.OrderDate.HasValue)
                           .ToList()//先將數據加載到內存中
                           .GroupBy(o => new { o.OrderDate.Value.Year, o.OrderDate.Value.Month })
                           .Select(g => new
                           {
                               YearMonth = $"{g.Key.Year}-{g.Key.Month.ToString("D2")}",//將年月份組合成字符串
                               Count = g.Count(),

                               //計算每個月份的總費用
                               TotalExpenses = g.Sum(o =>
                                   (string.IsNullOrEmpty(o.MakeUpExpenses) ? 0 : int.Parse(o.MakeUpExpenses)) +
                                   (string.IsNullOrEmpty(o.Photo) ? 0 : int.Parse(o.Photo)) +
                                   (string.IsNullOrEmpty(o.Transportation) ? 0 : int.Parse(o.Transportation)) +
                                   (string.IsNullOrEmpty(o.CarFare) ? 0 : int.Parse(o.CarFare)) +
                                   (string.IsNullOrEmpty(o.StayExpenses) ? 0 : int.Parse(o.StayExpenses)) +
                                   (string.IsNullOrEmpty(o.Activity) ? 0 : int.Parse(o.Activity)) +
                                   (string.IsNullOrEmpty(o.Food) ? 0 : int.Parse(o.Food))
                                )
                           })
                           .ToList();

            // 取得每個月份的訂單數量和總費用
            var monthlyOrdersIncome = resultincome.Select(m => m.YearMonth).ToList();
            var monthlyOrdersTotalincome = resultincome.Select(m => m.TotalExpenses).ToList();

            // 準備線狀圖的資料
            string[] cAry = monthlyOrdersIncome.Select(o => o.ToString()).ToArray();
            int[] dAry = monthlyOrdersTotalincome.Select(g => g).ToArray();//取得每個月份的訂單收入

            // 將資料傳遞到視圖
            ViewBag.cAry = string.Join(",", cAry);//將陣列轉換成字串
            ViewBag.dAry = string.Join(",", dAry);

            return View(model);
        }

        //刪除訂單
        public ActionResult DeleteOrder(int? id)
        {
            if (Session["employees"] == null)
            {
                // 如果沒有員工登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Employee");
            }

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = _db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        [HttpPost]
        //指定Action名稱Delete
        [ActionName(nameof(DeleteOrder))]
        public ActionResult DeleteOrder2(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = _db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            //從資料庫中刪除
            _db.Orders.Remove(order);
            _db.SaveChanges();
            return RedirectToAction("Orderinfo", "Employee");
        }

        //新增查詢訂單
        [HttpPost]
        public ActionResult Checkingorder(int textorder, DateTime startDate, DateTime endDate)
        {
            if (Session["employees"] == null)
            {
                // 如果沒有員工登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Employee");
            }

            //比對會員ID、訂單日期，忽略時間部分-DbFunctions.TruncateTime(適用於.NET Framework 4.8)
            //o.MemberID == textorder：篩選出 MemberID 等於 textorder 的訂單。資料庫ID和輸入ID比對
            //o.OrderDate == startDate：篩選出 OrderDate 等於 startDate 的訂單。資料庫日期和輸入日期比對
            //o.OrderDate < endDate：篩選出 OrderDate 小於 endDate 的訂單。資料庫日期小於輸入日期比對
            var results = _db.Orders
                .Where(o => o.MemberID 
                == textorder && DbFunctions.TruncateTime(o.OrderDate) 
                == DbFunctions.TruncateTime(startDate) && DbFunctions.TruncateTime(o.OrderDate) 
                < DbFunctions.TruncateTime(endDate))
                .OrderBy(o => o.MemberID)
                .ToList();

            //新增統計行程
            var resultJourney = _db.Orders.GroupBy(o => o.JourneyName).ToList();

            string[] xAry = resultJourney.Select(g => g.Key).ToArray();
            int[] yAry = resultJourney.Select(g => g.Count()).ToArray();

            ViewBag.xAry = string.Join(",", xAry);
            ViewBag.yAry = string.Join(",", yAry);

            return View("Orderinfo", results);
        }

        //取得訂單行事曆
        public ActionResult GetEvents()
        {
            List<CalendarEvent> eventsList = new List<CalendarEvent>();

            var orders = _db.Orders.ToList();

            foreach (var o in orders)
            {
                CalendarEvent calEvent = new CalendarEvent();
                calEvent.id = o.Id.ToString();
                calEvent.start = o.OrderDate.Value.ToString("yyyy-MM-dd");
                calEvent.title = $"訂單編號:{o.Id}";
                calEvent.color = "#1221ba";
                eventsList.Add(calEvent);
            }

            return Json(eventsList, JsonRequestBehavior.AllowGet);
        }

        //取得行程行事曆
        public ActionResult GetJourneyEvents()
        {
            List<CalendarEvent> eventsList = new List<CalendarEvent>();

            var journeys = _db.Journeys.ToList();

            foreach (var j in journeys)
            {
                CalendarEvent calEvent = new CalendarEvent();
                calEvent.id = j.Id.ToString();
                calEvent.start = j.JourneyDate.Value.ToString("yyyy-MM-dd");
                calEvent.title = $"旅程出發日:{j.JourneyName}";
                calEvent.color = "#1221ba";
                calEvent.url = $"/Member/Journey/{j.Id}";
                eventsList.Add(calEvent);
            }

            return Json(eventsList, JsonRequestBehavior.AllowGet);
        }
    }
}