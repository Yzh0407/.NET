using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodsManage
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //非介入式验证不启用
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //将用户名作为查询条件到用户表找用户数据
            string sql = $"select * from userInfo where username=@UserName";

            //在数据库执行查询语句，数据库适配器对象
            //创建数据库适配器对象
            SqlDataAdapter adapter = new SqlDataAdapter(sql, "Data Source=ACODE-SKEFKONCW\\SQLEXPRESS;Initial Catalog=GoodsManage;User ID=sa;Password=123456");


            //设置参数
            adapter.SelectCommand.Parameters.AddWithValue("UserName", txtName.Text);

            //定义数据表对象，存储查询结果
            DataTable dt = new DataTable();

            //调用Fill方法执行sql，将查询结果保存在数据表对象中
            adapter.Fill(dt);


            //查询结果保存在dt对象
            //判断是否有用户，判断查询结果表是否有数据
            if(dt.Rows.Count > 0 ) {

                //如果有用户，判断密码是否正确
                //用户输入的密码和  查询出来的用户密码是否相等
                if(txtPwd.Text== dt.Rows[0]["Password"].ToString())
                {
                    //使用Session对象保存登录用户的id，便于下单时获取使用
                    Session["UserId"] = dt.Rows[0]["UserId"];

                    //如果密码正确，登录成功提示跳转到List页面
                    Response.Write("<script>alert('登录成功')</script>");
                    //订单信息列表页面；
                    Response.Write("<script>window.location.href='/List.aspx'</script>");


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
    }
}