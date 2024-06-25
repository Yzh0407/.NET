using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication9
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 页面加载时的初始化代码，如果页面不是回发则执行
            if (!IsPostBack)
            {
                // 这里可以添加页面加载时需要执行的代码
            }
        }

        // 按钮点击事件处理程序
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // 获取用户输入的用户名和密码
            string userName = txtUserName.Text;
            string userPwd = txtUserPwd.Text;

            // 检查用户名和密码是否为空
            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(userPwd))
            {
                lblMessage.Text = "用户名和密码不能为空！";
                return;
            }

            // 调用数据访问层验证用户凭据
            bool isValid = DataAccessLayer.ValidateUser(userName, userPwd);

            // 如果验证成功，则重定向到学生列表页面
            if (isValid)
            {
                Response.Redirect("StudentList.aspx");
            }
            else
            {
                // 如果验证失败，则显示错误消息
                lblMessage.Text = "用户名或密码错误！";
            }
        }
    }

    // 数据访问层的静态类，用于数据库操作
    public static class DataAccessLayer
    {
        // 验证用户登录的方法
        public static bool ValidateUser(string userName, string userPwd)
        {
            // 从配置文件中获取数据库连接字符串
            string connectionString = ConfigurationManager.ConnectionStrings["StuInfoConnectionString"].ConnectionString;

            // 使用using语句确保资源正确释放
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // 准备SQL查询语句和参数化查询
                string query = "SELECT COUNT(*) FROM Login WHERE userName=@userName AND userPwd=@userPwd";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@userName", userName);
                    cmd.Parameters.AddWithValue("@userPwd", userPwd);

                    // 打开数据库连接并执行查询
                    conn.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    // 返回用户是否存在的标志
                    return count > 0;
                }
            }
        }
    }
}