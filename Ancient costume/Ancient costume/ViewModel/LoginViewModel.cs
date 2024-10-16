using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ancient_costume.ViewModel
{
    public class LoginViewModel
    {
        [Required(ErrorMessage ="帳號為必填")]
        public string UserName { get; set; }

        [Required(ErrorMessage ="密碼為必填")]
        [RegularExpression("[0-9]{5}",ErrorMessage ="密碼要求5個數字")]
        public string Password { get; set; }

        public string Code { get; set; }
        
        public string Email { get; set; }
        public string Phone { get; set; }
    }
}