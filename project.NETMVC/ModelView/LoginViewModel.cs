using System.ComponentModel.DataAnnotations;

namespace project.NETMVC.ModelViews
{
    public class LoginViewModel
    {
        [Key]
        [MaxLength(50)]
        [Required(ErrorMessage ="Vui lòng nhập email.")]
        [Display(Name ="Email")]
        public string Username { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu.")]
        [MinLength(6, ErrorMessage = "Mật khẩu phải có tối thiểu 6 ký tự.")]
        public string Password { get; set; }
    }
}
