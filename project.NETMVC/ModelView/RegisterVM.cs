using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace project.NETMVC.ModelViews
{
    public class RegisterVM
    {
        [Key]
        public int AccountId { get; set; }

        [Display(Name ="Tên đầy đủ")]
        [Required(ErrorMessage ="Vui lòng nhập họ và tên.")]
        public string FullName { get; set; }

        [Display(Name ="Số điện thoại")]
        [Required(ErrorMessage ="Vui lòng nhập số điện thoại.")]
        public string Phone { get; set; }

        [Display(Name ="Email")]
        [Required(ErrorMessage ="Vui lòng nhập email.")]
        [DataType(DataType.EmailAddress)]
        [Remote(action: "ValidateEmail", controller: "Accounts")]
        public string Email { get; set; }
        
        [Display(Name ="Mật khẩu")]
        [Required(ErrorMessage ="Vui lòng nhập mật khẩu.")]
        [MinLength(6, ErrorMessage ="Mật khẩu phải có tối thiểu 6 ký tự.")]
        public string Password { get; set; }
        
        [Display(Name ="Xác nhận mật khẩu")]
        [Compare("Password", ErrorMessage ="Vui lòng nhập mật khẩu giống nhau")]
        public string ConfirmPassword { get; set; }
    }
}
