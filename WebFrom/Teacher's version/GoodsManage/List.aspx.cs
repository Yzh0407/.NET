using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodsManage
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string State(string state)
        {
            switch (state)
            {
                case "0":
                    return "未发货";
                case "1":
                    return "已发货";
                case "2":
                    return "已送达";
                case "3":
                    return "已签收";
                default:
                    return "未知状态";            
            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = SqlDataSource1.SelectCommand + $" where GoodsName like '%{txtGoodsName.Text}%' ";
          
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            SqlDataSource1.SelectCommand = SqlDataSource1.SelectCommand + $" where GoodsName like '%{txtGoodsName.Text}%' ";

        }
    }
}