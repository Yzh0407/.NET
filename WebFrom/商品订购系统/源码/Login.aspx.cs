using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string UserName = TextBox1.Text;
            string Password = TextBox2.Text;

            if (ValidateUser(UserName, Password))
            {
                FormsAuthentication.SetAuthCookie(UserName, false);
                Response.Write($"<script>alert('登录成功！欢迎您，{UserName}！');window.location='Index.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('登陆失败！用户名或密码错误！')</script>");
            }
        }

        private bool ValidateUser(string username, string password)
        {
            string sql = "SELECT COUNT(1) FROM UserInfo WHERE UserName=@UserName AND Password=@Password";
            try
            {
                using (SqlConnection com = new SqlConnection("Data Source=ACODE-WFBDDFVZJ\\SQLEXPRESS;Initial Catalog=GoodsManage;User ID=sa;Password=123456;"))
                {
                    using (SqlCommand command = new SqlCommand(sql, com))
                    {
                        command.Parameters.AddWithValue("@UserName", username);
                        command.Parameters.AddWithValue("@Password", password);

                        com.Open();

                        int result = (int)command.ExecuteScalar();

                        if (result >= 1)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('数据库连接错误 {ex.Message}');</script>");
                return false;
            }
        }
    }
}