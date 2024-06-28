using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <param name="e"></param>
        protected void btnOrder_Click(object sender, EventArgs e)
        {
            //设置数据源控件的InsertParameters集合中所有参数的值
            SqlDataSource2.InsertParameters["GoodsId"].DefaultValue = ddlGoodsName.Text;
            SqlDataSource2.InsertParameters["UserId"].DefaultValue = Session["UserId"].ToString();
            SqlDataSource2.InsertParameters["OrderTime"].DefaultValue = DateTime.Now.ToString();
            SqlDataSource2.InsertParameters["State"].DefaultValue = "0";
            SqlDataSource2.InsertParameters["SendType"].DefaultValue = rblSendType.Text;
            SqlDataSource2.InsertParameters["Address"].DefaultValue = txtAddress.Text;
            SqlDataSource2.InsertParameters["Phone"].DefaultValue = txtPhone.Text;


            //调用数据源控件中的Insert方法执行插入语句（InserCommand）
            int result = SqlDataSource2.Insert();
            if (result > 0)
            {
                Response.Write("<script>alert('订购成功')</script>");
                Response.Write("<script>window.location.href='/List.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('订购失败')</script>");

            }
        }
    }
}