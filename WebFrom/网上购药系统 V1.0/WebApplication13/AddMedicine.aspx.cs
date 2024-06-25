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
    public partial class AddMedicine : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "INSERT INTO OrderInfo (MedicineName, UserId, AddTime, RealName, Mobile, Address, State, SendType, Remark) VALUES (@MedicineName, @UserId, @AddTime, @RealName, @Mobile, @Address, @State, @SendType, @Remark)";
            try
            {
                using (SqlConnection Connection = new SqlConnection("Data Source=47.113.148.121;Initial Catalog=OrderMedicineDB;User ID=sa;Password=123454321aA."))
                {
                    using (SqlCommand command = new SqlCommand(sql, Connection))
                    {
                        Connection.Open();

                        // 获取当前登录的用户名
                        string username = HttpContext.Current.User.Identity.Name;

                        // 获取用户ID
                        string getUserIdQuery = "SELECT UserId FROM UserInfo WHERE UserName = @UserName";

                        int userId;
                        using (SqlCommand getUserIdCommand = new SqlCommand(getUserIdQuery, Connection))
                        {
                            getUserIdCommand.Parameters.AddWithValue("@UserName", username);
                            userId = (int)getUserIdCommand.ExecuteScalar();
                        }
                        //赋值
                        command.Parameters.AddWithValue("@MedicineName", TextBox1.Text.Trim());
                        command.Parameters.AddWithValue("@UserId", userId);
                        command.Parameters.AddWithValue("@AddTime", DateTime.Now);
                        command.Parameters.AddWithValue("@RealName", TextBox2.Text.Trim());
                        command.Parameters.AddWithValue("@Mobile", TextBox3.Text.Trim());
                        command.Parameters.AddWithValue("@Address", TextBox4.Text.Trim());
                        string stateValue = "1"; // 设置默认值，未配送
                        command.Parameters.AddWithValue("@State", stateValue);
                        command.Parameters.AddWithValue("@SendType", RadioButtonList1.SelectedValue);
                        command.Parameters.AddWithValue("@Remark", TextBox5.Text.Trim());

                        int result = command.ExecuteNonQuery();

                        if (result > 0)
                        {
                            Response.Write("<script>alert('药品订购成功！');window.location='Index.aspx';</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('药品订购失败！');</script>");
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                // 捕获异常并提示数据库连接错误
                Response.Write($"<script>alert('数据库连接错误 {ex.Message}');</script>");
            }
        }
    }
}