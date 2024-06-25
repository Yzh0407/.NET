using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication8
{
    public partial class Login : System.Web.UI.Page
    {
        // 页面加载事件
        protected void Page_Load(object sender, EventArgs e)
        {
            // 设置验证模式为None，以便在不使用无障碍验证的情况下进行验证
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        // 登录按钮点击事件
        protected void Button1_Click(object sender, EventArgs e)
        {
            // 获取用户名和密码
            string UserName = TextBox1.Text;
            string Password = TextBox2.Text;

            // 验证用户信息
            if (ValidateUser(UserName, Password))
            {
                // 设置身份验证票据
                FormsAuthentication.SetAuthCookie(UserName, false);
                // 提示登录成功并重定向到首页
                Response.Write($"<script>alert('登录成功！欢迎您，{UserName}！');window.location='Index.aspx';</script>");
                // 或者直接使用Response.Redirect重定向到首页
                // Response.Redirect("Index.aspx");
            }
            else
            {
                // 提示登录失败
                Response.Write("<script>alert('登陆失败！用户名或密码错误！')</script>");
            }
        }

        // 验证用户信息的方法
        private bool ValidateUser(string username, string password)
        {
            // SQL查询语句，检查用户名和密码是否匹配
            string sql = "SELECT COUNT(1) FROM UserInfo WHERE UserName=@UserName AND Password=@Password";
            try
            {
                // 使用using语句确保资源正确释放
                using (SqlConnection com = new SqlConnection("Data Source=47.113.148.121;Initial Catalog=Market;User ID=sa;Password=123454321aA.;"))
                {
                    using (SqlCommand command = new SqlCommand(sql, com))
                    {
                        // 添加参数以防止SQL注入攻击
                        command.Parameters.AddWithValue("@UserName", username);
                        command.Parameters.AddWithValue("@Password", password);

                        // 打开数据库连接
                        com.Open();

                        // 执行查询并获取结果
                        int result = (int)command.ExecuteScalar();

                        // 返回查询结果，判断用户是否存在
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
                // 捕获异常并提示数据库连接错误
                Response.Write($"<script>alert('数据库连接错误 {ex.Message}');</script>");
                return false;
            }
        }
    }
}
