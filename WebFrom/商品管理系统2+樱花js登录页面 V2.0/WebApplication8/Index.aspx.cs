using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication8
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            // 检查用户是否已通过身份验证
            if (!User.Identity.IsAuthenticated)
            {
                // 如果未通过身份验证，重定向到登录页面
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // 清除身份验证票据
            FormsAuthentication.SignOut();
            // 重定向到登录页面
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}