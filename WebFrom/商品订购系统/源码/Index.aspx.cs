using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.Security;

namespace WebApplication1
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }

            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string OrderID = GridView1.DataKeys[e.RowIndex].Value.ToString();

            string connectionString = "Data Source=ACODE-WFBDDFVZJ\\SQLEXPRESS;Initial Catalog=GoodsManage;User ID=sa;Password=123456;";

            string delete = "DELETE FROM [OrderInfo] WHERE [OrderId] = @OrderId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(delete, conn))
                {
                    cmd.Parameters.AddWithValue("OrderId", OrderID);

                    conn.Open();

                    cmd.ExecuteNonQuery();

                    BindGridView();
                }
            }
        }



        private void BindGridView()
        {
            string connectionString = "Data Source=ACODE-WFBDDFVZJ\\SQLEXPRESS;Initial Catalog=GoodsManage;User ID=sa;Password=123456;";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "select OrderId,UserName,GoodsName,OrderTime,case when State = 0 then '未发货' when State = 1 then '已发货' when State = 2 then '已送达' else '已签收' end As State,case when SendType = 0 then '商家配送'else '自提' end As SendType,Address,Phone from OrderInfo inner join GoodsInfo on GoodsInfo.GoodsId=OrderInfo.GoodsId inner join UserInfo on UserInfo.UserId = OrderInfo.UserId ";

                if (!string.IsNullOrEmpty(txtSearchName.Text))
                {
                    query += "WHERE GoodsName LIKE @Name ";
                }

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(txtSearchName.Text))
                    {
                        cmd.Parameters.AddWithValue("@Name", "%" + txtSearchName.Text + "%");
                    }

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }
}