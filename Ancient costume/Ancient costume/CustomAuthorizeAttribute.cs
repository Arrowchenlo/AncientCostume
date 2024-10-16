using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWeb
{
    public class CustomAuthorizeAttribute:ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Session["employees"] == null)
            {
                filterContext.Result = new RedirectResult("/Employees/Login");
            }
            base.OnActionExecuting(filterContext);
        }
    }
}