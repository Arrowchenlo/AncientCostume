using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ancient_costume.ViewModel
{
    public class LoginViewEmployees
    {
        [Required(ErrorMessage ="帳號為必填")]
        public string UserName { get; set; }

        [Required(ErrorMessage ="密碼為必填")]
        [RegularExpression("[0-9]{3}",ErrorMessage ="密碼要求3個數字")]
        public string Password { get; set; }
    }
}