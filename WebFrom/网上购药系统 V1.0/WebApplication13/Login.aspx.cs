using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication13
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 关闭介入式验证
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // 获取用户名和密码
            string UserName = TextBox1.Text;
            string Password = TextBox2.Text;

            if (ValidateUser(UserName, Password))
            {
                // 设置身份验证票据
                FormsAuthentication.SetAuthCookie(UserName, false);
                // 提示登录成功并重定向到首页
                Response.Write($"<script>alert('登录成功！欢迎您，{UserName}！');window.location='Index.aspx';</script>");
            }
            else
            {
                // 提示登录失败
                Response.Write("<script>alert('登陆失败！用户名或密码错误！')</script>");
            }
        }

        private bool ValidateUser(string username, string password)
        {
            // SQL查询语句，检查用户名和密码是否匹配
            string sql = "SELECT COUNT(1) FROM UserInfo WHERE UserName=@UserName AND Password=@Password";
            try
            {
                using (SqlConnection Connection = new SqlConnection("Data Source=47.113.148.121;Initial Catalog=OrderMedicineDB;User ID=sa;Password=123454321aA."))
                {
                    using (SqlCommand command = new SqlCommand(sql, Connection))
                    {
                        //赋值
                        command.Parameters.AddWithValue("@UserName", TextBox1.Text.Trim());
                        command.Parameters.AddWithValue("@Password", TextBox2.Text.Trim());

                        //打开数据库链接
                        Connection.Open();

                        int result = (int)(command.ExecuteScalar());

                        if (result > 0)
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