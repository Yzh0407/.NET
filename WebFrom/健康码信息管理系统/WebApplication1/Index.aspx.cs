using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 页面首次加载时绑定 GridView
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        // 查询按钮点击事件处理程序
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // 绑定 GridView
            BindGridView();
        }

        // 绑定 GridView 方法
        private void BindGridView()
        {
            // 获取数据库连接字符串
            string connectionString = "Data Source=47.113.148.121;Initial Catalog=Test;User ID=sa;Password=123454321aA.";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // SQL 查询语句
                string query = "SELECT u.UId, u.Name, u.IdCard, u.PhoneNumber, u.Sex, u.Age, u.CreateDate, c.Name AS HealthCodeStatus, " +
                               "CASE WHEN u.State = 0 THEN '未上报' ELSE '已上报' END AS ReportStatus " +
                               "FROM UserInfo u " +
                               "JOIN CodeType c ON u.CId = c.CId ";

                // 如果输入了查询条件，则添加 WHERE 子句
                if (!string.IsNullOrEmpty(txtSearchName.Text))
                {
                    query += "WHERE u.Name LIKE @Name ";
                }

                query += "ORDER BY u.UId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // 如果输入了查询条件，则添加参数
                    if (!string.IsNullOrEmpty(txtSearchName.Text))
                    {
                        cmd.Parameters.AddWithValue("@Name", "%" + txtSearchName.Text + "%");
                    }

                    // 使用 SqlDataAdapter 填充 DataTable
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        // 绑定 DataTable 到 GridView
                        gvUserInfo.DataSource = dt;
                        gvUserInfo.DataBind();
                    }
                }
            }
        }

        // GridView 分页事件处理
        protected void gvUserInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // 设置新的分页索引
            gvUserInfo.PageIndex = e.NewPageIndex;
            // 重新绑定 GridView
            BindGridView();
        }
    }
}