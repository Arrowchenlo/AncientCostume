using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DemoFullCalendar_MVC.Models
{
    public class CalendarEvent
    {
        public string id;
        public string start; //日期 yyyy-MM-dd
        public string title; //標題
        public string color; //背景顏色
        internal string url; //連結
    }
}