using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodsManage
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 订购按钮单击事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOrder_Click(object sender, EventArgs e)
        {
            //设置数据源控件的InsertParameters集合中所有参数的值
            order.InsertParameters["GoodsId"].DefaultValue = ddlGoodsName.Text;
            order.InsertParameters["UserId"].DefaultValue = Session["UserId"].ToString();
            order.InsertParameters["OrderTime"].DefaultValue =DateTime.Now.ToString();
            order.InsertParameters["State"].DefaultValue ="0";
            order.InsertParameters["SendType"].DefaultValue = rblSendType.Text;
            order.InsertParameters["Address"].DefaultValue = txtAddress.Text;
            order.InsertParameters["Phone"].DefaultValue = txtPhone.Text;


            //调用数据源控件中的Insert方法执行插入语句（InserCommand）
            int result =  order.Insert();
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