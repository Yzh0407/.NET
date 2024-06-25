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
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // 获取正在编辑的行
            GridViewRow row = GridView1.Rows[e.RowIndex];

            // 查找包含商品库存数据的TextBox控件
            TextBox txtProductNum = (TextBox)row.FindControl("txtProductNum");

            // 如果找到了TextBox控件
            if (txtProductNum != null)
            {
                int productNum;
                // 尝试将TextBox的文本转换为整数，并检查是否为非负数
                if (!int.TryParse(txtProductNum.Text, out productNum) || productNum < 0)
                {
                    // 如果转换失败或值为负数，取消更新操作
                    e.Cancel = true;
                    // 向客户端发送JavaScript代码，弹出一个提示框
                    Response.Write($"<script>alert('商品库存必须是有效的整数!');</script>");
                }
            }
        }
    }
}