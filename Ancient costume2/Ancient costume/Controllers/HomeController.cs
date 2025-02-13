using Ancient_costume.Models;
using Azure;
using Azure.AI.OpenAI;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace Ancient_costume.Controllers
{
    public class HomeController : Controller
    {
        private AcDBEntities _db = new AcDBEntities();

        // GET: Home
        public ActionResult Index()
        {
            List<Journey> model = _db.Journeys.ToList();

            return View(model);
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Photo()
        {
            return View();
        }

        public ActionResult Services()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult Email(string name, string email, string emailsubject, string message)
        {


            //寄信
            string sender = name;
            string subject = emailsubject;
            string body = message;

            //在此實作寄送郵件的程式碼
            MailMessage msg = new MailMessage();

            //收件者@gmail.com
            msg.To.Add("sara15560132@gmail.com");

            //寄件者@gmail.com
            msg.From = new MailAddress(email,
                "tony", System.Text.Encoding.UTF8);

            //郵件標題
            msg.Subject = "江湖夢/漢旅網站來信" + sender + " " + subject;
            //指定Subject的編碼  
            msg.SubjectEncoding = System.Text.Encoding.UTF8;

            msg.IsBodyHtml = true;
            msg.BodyEncoding = System.Text.Encoding.UTF8;

            //讀取email模板
            string templatePath = Path.Combine(Server.MapPath(@"~\Views\Home\email_template.cshtml"));
            string htmlTemplate = System.IO.File.ReadAllText(templatePath);

            //取代模板中的變數
            string emailBody = htmlTemplate.Replace("{{name}}", sender)
                .Replace("{{email}}", email)
                .Replace("{{subject}}", subject)
                .Replace("{{message}}", body);

            msg.Body = emailBody;

            SmtpClient MySmtp = new SmtpClient("smtp.gmail.com", 587);

            //寄件者的帳號密碼、應用程式密碼
            MySmtp.Credentials = new System.Net.NetworkCredential(
                "sara15560132", "fyas aoee kkvo cenx");

            //啟用 SSL
            MySmtp.EnableSsl = true;
            MySmtp.Send(msg);

            return RedirectToAction("Contact", "Home");
        }

        public ActionResult GetMessage(string input)
        {
            var history = new List<ChatRequestMessage>();

            string usertext = input;
            string output = runForHisotry2(history);

            return Json(new { ot = output, ut = usertext }, JsonRequestBehavior.AllowGet); ;
        }

        static string runForHisotry2(List<ChatRequestMessage> history)
        {

            Uri endpoint = new Uri("https://aiinstace99.openai.azure.com/");

            //老師提供的付費金鑰
            AzureKeyCredential credential = new AzureKeyCredential("94d4ae7ba8404f04872d8f6b42848277");

            var openAIClient = new OpenAIClient(endpoint, credential);

            var completionOptions = new ChatCompletionsOptions
            {
                MaxTokens = 300,
                Temperature = 0.1f,
                FrequencyPenalty = 1.0f,
                PresencePenalty = 1.0f,
                NucleusSamplingFactor = 0.95f, // Top P
                DeploymentName = "gpt3Model",
            };

            var systemPrompt = @"
                你是一個旅遊網站的客服機器人，客戶會向你購買旅程，
                你必須從客戶的報名敘述中找到底下這些報名資訊。
                找到的資訊必須覆述一次，如果有缺少的資訊，必須提醒客戶缺少的部分，
                直到蒐集完所有資訊後，要跟客戶做最後的確認，並且問客戶是否正確? 
                如果客戶回答不正確，則要重新蒐集資訊。
                如果客戶說正確，則將蒐集到的資料，整理成一個JSON字串，直接輸出，無須回覆其他文字。
                
                報名資訊包含:
                 * 報名旅程名稱
                 * 出發日
                 * 報名人數
                 * 付款方式

                旅遊名稱包含:
                 * 宜蘭傳藝園區
                 * 卓也小屋渡假園區
                 * 橫店影視城
                 * 敦煌沙漠

                付款包含:
                 * 現金
                 * 刷卡
                 * LINE Pay

                 回應時，請注意以下幾點:
                 * 不要說 '感謝你的來信' 之類的話，因為客戶是從對談視窗輸入訊息的，不是寫信來的
                 * 不要一直說抱歉或對不起，但可以說不好意思。
                 * 不要幫客戶報名，也不要提到跟金額有關的事情
                 * 要能夠盡量解決客戶的問題
                 * 不要以回覆信件的格式書寫，請直接提供對談機器人可以直接給客戶的回覆
                 * 無法回應的問題請客戶查看官網資訊或洽服務人員
                 * 請不要自問自答，等客戶輸入訊息再回覆問題
                 * 請不要提供過於冗長的回覆，盡量簡潔明瞭，不重複同樣的對話
                 * 對話長度分段說明，不要一次回答太多問題

                 
                 ----------------------
                ";

            completionOptions.Messages.Add(new ChatRequestSystemMessage(systemPrompt));


            foreach (var message in history)
            {
                completionOptions.Messages.Add(message);
            }

            ChatCompletions response = openAIClient.GetChatCompletions(completionOptions);


            ChatResponseMessage assistantResponse = response.Choices[0].Message;

            return assistantResponse.Content;

        }
    }
}