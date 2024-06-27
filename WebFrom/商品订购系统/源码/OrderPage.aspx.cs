using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Input;

namespace WebApplication1
{
    public partial class OrderPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "Insert into OrderInfo (GoodsId,UserId,OrderTime,State,SendType,Address,Phone) values (@GoodsId,@UserId,@OrderTime,@State,@SendType,@Address,@Phone)";
            try
            {
                using (SqlConnection Connection = new SqlConnection("Data Source=ACODE-WFBDDFVZJ\\SQLEXPRESS;Initial Catalog=GoodsManage;User ID=sa;Password=123456;"))
                {
                    using (SqlCommand command = new SqlCommand(sql, Connection))
                    {
                        Connection.Open();


                        string username = HttpContext.Current.User.Identity.Name;

                        string getUserIdQuery = "SELECT UserId FROM UserInfo WHERE UserName = @UserName";

                        int userId;
                        using (SqlCommand getUserIdCommand = new SqlCommand(getUserIdQuery, Connection))
                        {
                            getUserIdCommand.Parameters.AddWithValue("@UserName", username);
                            userId = (int)getUserIdCommand.ExecuteScalar();
                        }

                        command.Parameters.AddWithValue("@GoodsId", DropDownList1.SelectedValue);
                        command.Parameters.AddWithValue("@UserId", userId);
                        string stateValue = "1"; // 设置默认值
                        command.Parameters.AddWithValue("@State", stateValue);
                        command.Parameters.AddWithValue("@OrderTime", DateTime.Now);
                        command.Parameters.AddWithValue("@Address", TextBox1.Text.Trim());
                        command.Parameters.AddWithValue("@Phone", TextBox2.Text.Trim());
                        command.Parameters.AddWithValue("@SendType", RadioButtonList1.SelectedValue);

                        int result = command.ExecuteNonQuery();

                        if (result >= 1)
                        {
                            Response.Write("<script>alert('订购成功');window.location='Index.aspx';</script>");

                        }
                        else
                        {
                            Response.Write("<script>alert('订购失败');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write($"<script>alert('数据库连接错误 {ex.Message}');</script>");
            }
        }
    }
}
