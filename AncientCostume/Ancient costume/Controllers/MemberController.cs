using Ancient_costume.Models;
using Ancient_costume.ViewModel;
using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using System.Web.ModelBinding;
using System.Data.Entity.Validation;
using System.Diagnostics.Metrics;
using System.Diagnostics.Eventing.Reader;

namespace Ancient_costume.Controllers
{
    public class MemberController : Controller
    {
        private AcDBEntities _db = new AcDBEntities();

        //驗證碼
        Random rnd = new Random(DateTime.Now.Millisecond);

        //產生驗證碼
        public void GenCode()
        {
            //立刻到期,不要cache
            Response.Expires = -1;

            // 產生圖片亂數值放入Session
            //取得字元
            string RenderText = GenRenderText();
            Session["RenderText"] = RenderText;

            // 設定字型及大小
            const string FONT_NAME = "Arial";
            const int FONT_SIZE = 40;

            Bitmap bmp = null;
            Graphics g = null;

            try
            {
                //設定字型
                Font font = new Font(FONT_NAME, FONT_SIZE);

                //讀取底圖
                bmp = new Bitmap(Server.MapPath($@"\Images\BackGround.jpg"));
                g = Graphics.FromImage(bmp);

                // 設定圖片寬高
                int nHeight = 0;
                int nWidth = 0;

                //存4個字元各自的起始位置(X軸)
                int[] offsetPos = new int[RenderText.Length];

                for (int i = 0; i < RenderText.Length; i++)
                {
                    // 根據字型大小計算印出字體的總寬高
                    SizeF sSize = g.MeasureString(RenderText[i].ToString(), font);
                    // 設定圖片寬高
                    nHeight = (int)sSize.Height + FONT_SIZE / 4;
                    offsetPos[i] = nWidth + (int)sSize.Width / 3; //10 20 30 40 計算出每個字元起始的X軸座標
                    nWidth += (int)sSize.Width;
                }

                //產生適合文字大小的圖
                bmp = new Bitmap(bmp, nWidth + 20, nHeight);
                g = Graphics.FromImage(bmp);

                for (int i = 0; i < RenderText.Length; i++)
                {
                    //字體轉換角度
                    Matrix myMatrix = new Matrix();

                    //印出亂數字串
                    myMatrix.RotateAt(rnd.Next(-40, 41), new PointF(offsetPos[i], nHeight / 2), MatrixOrder.Append);
                    g.Transform = myMatrix;

                    //亂數字型大小
                    Random fontRnd = new Random(rnd.Next(FONT_SIZE));
                    g.DrawString(
                        RenderText.Substring(i, 1),
                        new Font(FONT_NAME, fontRnd.Next(FONT_SIZE - 15, FONT_SIZE + 1)),
                        new SolidBrush(Color.Black),
                        offsetPos[i], 6);
                }


                // 清除Buffer
                Response.Clear();

                //// 設定Output的結果為Png圖片
                Response.ContentType = "IMAGE/PNG";

                //// 產出圖片
                bmp.Save(Response.OutputStream, ImageFormat.Png);

                Response.End();

            }
            catch (Exception ex)
            {

                var a = ex.Message;
            }

            finally
            {
                // Clean up the GDI+ surface
                if (null != g)
                    g.Dispose();

                // Clean up the Bitmap
                if (null != bmp)
                    bmp.Dispose();
            }
        }

        private string GenRenderText(int chars = 4)
        {
            string code = "1234567890ABCDEFGHKLMNPQRTWXYZ";
            // 設定預設圖片文字
            string RenderText = "";

            for (int i = 1; i <= chars; i++)
            {
                RenderText += code[rnd.Next(0, code.Length)];
            }
            return RenderText;
        }

        //首頁
        public ActionResult Index()
        {
            List<Journey> model = _db.Journeys.ToList();

            return View(model);
        }


        //登入
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel model, string code)
        {


            //產生驗證碼 偶爾出錯
            //驗證碼、帳號密碼一起比對

            //帳號Arrow , 密碼00000
            //成功=>Member/Index

            if (model.Password.Length != 5)
            {
                ModelState.AddModelError("Password", "密碼需要5碼");
            }


            bool isCaptchaValid = (Session["RenderText"].ToString().Trim() == code.ToUpper().Trim());


            //待修改驗證和帳號密碼一起比對
            //判斷登入帳號Arrow , 密碼00000
            Member member = _db.Members.FirstOrDefault
                 (m => m.UserName == model.UserName
                     && m.Password == model.Password);

            if (member != null && isCaptchaValid)
            {
                //登入成功  

                //記起來-區別user/member可做不同事情
                Session["userName"] = model.UserName;
                Session["memberid"] = member.Id;

                return RedirectToAction("Index", "Member");
            }
             if (!isCaptchaValid)
            {
                ModelState.AddModelError("", "驗證碼不正確");
                ViewBag.Message = "比對失敗";
            }

            if (member == null)
            {
                ModelState.AddModelError("", "帳號密碼不正確");
            }


            return View(model);
        }

        //登出
        public ActionResult Logout()
        {
            Session.Abandon();

            return RedirectToAction("Index", "Member");
        }

        //沒有權限
        public ActionResult NoAuth()
        {
            return View();
        }

        //註冊會員
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                //判斷帳號是否重複
                if (_db.Members.Any(m => m.UserName == model.UserName))
                {
                    ModelState.AddModelError("UserName", "帳號重複");
                }
                else
                {
                    //新增會員
                    Member member = new Member
                    {
                        UserName = model.UserName,
                        Password = model.Password,
                        Email = model.Email,
                        Phone = model.Phone,
                    };

                    _db.Members.Add(member);
                    _db.SaveChanges();

                    return RedirectToAction("Login", "Member");
                }
            }

            return View(model);
        }

        //旅程產品
        public ActionResult Journey(int? id)
        {
            //將Journey/index內的產品資訊帶到Journey
            Session["JourneyId"] = id;

            //查詢id
            Journey journey = _db.Journeys.FirstOrDefault(x => x.Id == id);

            return View(journey);
        }

        //訂購行程
        [HttpPost]
        public ActionResult Order(string cutsom, string makeup, string hair)
        {
            if (Session["username"] == null)
            {
                // 如果沒有員工登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Member");
            }

            //女-衣服,女-妝容,女-髮型各3個
            //男-衣服,男-妝容,男-髮型各3個

            //將會員訂購旅程代入session
            Session["costume"] = cutsom;
            Session["makeup"] = makeup;
            Session["hair"] = hair;


            List<Journey> model = _db.Journeys.ToList();

            return View();
        }

        //顯示訂購資訊
        //將會員訂購旅程代入-依照Id代入
        [HttpPost]
        public ActionResult Bill
            (string name, string twid, string phone, string address,
             string selectPerson, string Selectfood, string Selectchild, string message)
        {
            ViewBag.name = name;
            ViewBag.twid = twid;
            ViewBag.phone = phone;
            ViewBag.address = address;
            ViewBag.selectPerson = selectPerson;
            ViewBag.Selectfood = Selectfood;
            ViewBag.Selectchild = Selectchild;
            ViewBag.message = message;

            //取回所有session顯示在view
            //帶回 / Member / Journey / 3的資料
            int id = (int)Session["JourneyId"];
            Journey journey = _db.Journeys.FirstOrDefault(x => x.Id == id);
            ViewBag.JourneyName = journey.JourneyName;
            ViewBag.JourneyContent = journey.JourneyContent;
            ViewBag.Sights = journey.Sights;
            ViewBag.Stay = journey.Stay;
            ViewBag.ExpenseItems = journey.ExpenseItems;
            ViewBag.MakeUpExpenses = journey.MakeUpExpenses.Value.ToString("0");
            ViewBag.Photo = journey.Photo.Value.ToString("0");
            ViewBag.Transportation = journey.Transportation.Value.ToString("0");
            ViewBag.CarFare = journey.CarFare.Value.ToString("0");
            ViewBag.StayExpenses = journey.StayExpenses.Value.ToString("0");
            ViewBag.Activity = journey.Activity.Value.ToString("0");
            ViewBag.Food = journey.Food.Value.ToString("0");
            ViewBag.AssemblyPlace = journey.AssemblyPlace;
            ViewBag.DailyItinerary = journey.DailyItinerary;

            //允許session為空
            if (Session["costume"] != null && Session["makeup"] != null && Session["hair"] != null)
            {
                ViewBag.custom = Session["costume"].ToString();
                ViewBag.makeup = Session["makeup"].ToString();
                ViewBag.hair = Session["hair"].ToString();
            }
            else
            {
                ViewBag.custom = "無";
                ViewBag.makeup = "無";
                ViewBag.hair = "無";
            }

            List<Journey> model = _db.Journeys.ToList();

            //將會員選取旅遊資訊儲存在DB_Order,刪掉session
            //DB_Order有JourneyId,MemberId讓客戶查詢所選旅程資訊
            //會員讀取自己旅遊訂單資料

            Order order = new Order();
            order.Customersname = name;
            order.TwId = twid;
            order.Phone = phone;
            order.Address = address;
            order.SelectPerson = selectPerson;
            order.Selectfood = Selectfood;
            order.Selectchild = Selectchild;
            order.Message = message;
            order.JourneyName = ViewBag.JourneyName;
            order.JourneyContent = ViewBag.JourneyContent;
            order.Sights = ViewBag.Sights;
            order.Stay = ViewBag.Stay;
            order.ExpenseItems = ViewBag.ExpenseItems;
            order.MakeUpExpenses = ViewBag.MakeUpExpenses;
            order.Photo = ViewBag.Photo;
            order.Transportation = ViewBag.Transportation;
            order.CarFare = ViewBag.CarFare;
            order.StayExpenses = ViewBag.StayExpenses;
            order.Activity = ViewBag.Activity;
            order.Food = ViewBag.Food;
            order.AssemblyPlace = ViewBag.AssemblyPlace;
            order.DailyItinerary = ViewBag.DailyItinerary;
            order.custom = ViewBag.custom;
            order.makeup = ViewBag.makeup;
            order.hair = ViewBag.hair;
            order.JourneyId = (int)Session["JourneyId"];
            order.MemberID = (int)Session["memberid"];

            //增加當日時間到DB
            order.OrderDate = DateTime.Now;

            _db.Orders.Add(order);
            _db.SaveChanges();

            Session["JourneyId"] = null;
            Session["custom"] = null;
            Session["makeup"] = null;
            Session["hair"] = null;

            return View(model);
        }

        public ActionResult OrderList()
        {
            if (Session["memberid"] == null)
            {
                // 如果沒有會員登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Member");
            }

            // 假設 Session["memberid"] 存儲了當前登入會員的ID
            int memberId = Convert.ToInt32(Session["memberid"]);

            // 僅查詢當前會員的訂單
            List<Order> model = _db.Orders.Where(o => o.MemberID == memberId).ToList();

            return View(model);
        }


        public ActionResult ForgotMember()
        {
            //取得會員資料，session null時，預設為0
            int id = (int)(Session["memberid"] ?? 0);
            Member model = _db.Members.FirstOrDefault(m => m.Id == id);
            ViewBag.user = model?.UserName;
            ViewBag.phone = model?.Phone;
            ViewBag.email = model?.Email;

            return View();
        }

        [HttpPost]
        public ActionResult ForgotMember(string email)
        {
            //查詢該email是否存在於會員資料庫
            Member member = _db.Members.FirstOrDefault(m => m.Email == email);

            if (member != null)
            {
                //寄送帳號密碼給會員
                string subject = "忘記密碼 - Ancient Costume";
                string body = $"您的帳號是：{member.UserName}\n您的密碼是：{member.Password}";

                //在此實作寄送郵件的程式碼
                MailMessage msg = new MailMessage();

                //收件者@gmail.com
                msg.To.Add("sara15560132@gmail.com");

                //寄件者@gmail.com
                msg.From = new MailAddress("sara15560132@gmail.com",
                    "tony", System.Text.Encoding.UTF8);

                //郵件標題
                msg.Subject = "江湖夢/漢旅網站" + subject;
                //指定Subject的編碼  
                msg.SubjectEncoding = System.Text.Encoding.UTF8;

                //郵件內容
                msg.Body = "江湖夢/漢旅網站" + body;
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                SmtpClient MySmtp = new SmtpClient("smtp.gmail.com", 587);

                //寄件者的帳號密碼
                MySmtp.Credentials = new System.Net.NetworkCredential(
                    "sara15560132", "cxqr wdwz fguz ianu");

                //啟用 SSL
                MySmtp.EnableSsl = true;
                MySmtp.Send(msg);

                ViewBag.Message = "已寄送帳號密碼至您的信箱";
            }
            else
            {
                ViewBag.Message = "該信箱不存在於會員資料庫";
            }

            return View();
        }

        public ActionResult AddFavorite(int id)
        {
            if (Session["memberid"] == null)
            {
                // 如果沒有會員登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Member");
            }

            //取得會員ID
            int memberId = (int)Session["memberid"];

            //查詢是否已經收藏
            Favorite favorite = _db.Favorites.FirstOrDefault(f => f.JourneyId == id && f.MemberId == memberId);

            if (favorite == null)
            {
                //新增收藏
                favorite = new Favorite
                {
                    JourneyId = id,
                    MemberId = memberId
                };

                _db.Favorites.Add(favorite);
                _db.SaveChanges();
            }

            return RedirectToAction("Collect", "Member");
        }

        public ActionResult Collect()
        {
            if (Session["memberid"] == null)
            {
                // 如果沒有會員登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Member");
            }

            int id = (int)Session["memberid"];

            List<Favorite> favorites = _db.Favorites.Where(m => m.MemberId == id).ToList();
            return View(favorites);
        }

        public ActionResult DeleteFavorite(int id)
        {
            if (Session["memberid"] == null)
            {
                // 如果沒有會員登入，重定向到登入頁面或顯示錯誤訊息
                return RedirectToAction("Login", "Member");
            }

            Favorite favorite = _db.Favorites.FirstOrDefault(f => f.Id == id);
            _db.Favorites.Remove(favorite);
            _db.SaveChanges();

            return RedirectToAction("Collect", "Member");
        }


        [HttpPost]
        public ActionResult Editmember(Member model)
        {

            int id = (int)Session["memberid"];
            Member oldData = _db.Members.FirstOrDefault(m => m.Id == id);

            // 更新會員資料，不是空值才更新
            if (!string.IsNullOrEmpty(model.UserName))
            {
                oldData.UserName = model.UserName;
            }
            if (!string.IsNullOrEmpty(model.Password))
            {
                oldData.Password = model.Password;
            }
            if (!string.IsNullOrEmpty(model.Email))
            {
                oldData.Email = model.Email;
            }
            if (!string.IsNullOrEmpty(model.Phone))
            {
                oldData.Phone = model.Phone;
            }

            //存DB
            _db.SaveChanges();

            return RedirectToAction("Login", "Member");
        }
    }
}