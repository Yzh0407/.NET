using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = SqlDataSource1.SelectCommand + $" where GoodsName like '%{TextBox1.Text}%' ";

        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            SqlDataSource1.SelectCommand = SqlDataSource1.SelectCommand + $" where GoodsName like '%{TextBox1.Text}%' ";
        }
    }
}