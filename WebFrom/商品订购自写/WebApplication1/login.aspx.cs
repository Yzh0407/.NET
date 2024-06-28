using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }


        /*1. **构建查询**
        2. **填充数据**
        3. **检查用户**
        4. **验证密码**
        5. **处理结果***/
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string sql = $"select * from userInfo where username=@UserName";

            SqlDataAdapter adapter = new SqlDataAdapter(sql, "Data Source=ACODE-WFBDDFVZJ\\SQLEXPRESS;Initial Catalog=GoodsManage;Persist Security Info=True;User ID=SA;Password=123456");

            adapter.SelectCommand.Parameters.AddWithValue("UserName", txtName.Text);

            DataTable dataTable = new DataTable();

            adapter.Fill(dataTable);

            if (dataTable.Rows.Count > 0)
            {
                if (txtPwd.Text == dataTable.Rows[0]["Password"].ToString())
                {
                    //使用Session对象保存登录用户的id，便于下单时获取使用
                    Session["UserId"] = dataTable.Rows[0]["UserId"];

                    //如果密码正确，登录成功提示跳转到List页面
                    Response.Write("<script>alert('登录成功')</script>");
                    //订单信息列表页面；
                    Response.Write("<script>window.location.href='/index.aspx'</script>");
                }
                else
                {
                    //否则提示密码错误
                    Response.Write("<script>alert('密码错误')</script>");

                }
            }
            else
            {//否则没有用户，提示用户名不存在
                Response.Write("<script>alert('用户名不存在')</script>");

            }
        }


        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPwd.Text = "";

        }
    }
}