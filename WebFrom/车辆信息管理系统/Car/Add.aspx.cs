using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Car
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        /// <summary>
        /// 添加
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //获取前端界面的数据，添加到数据库中保存
            //1.定义字符串保存插入的sql语句
            string sql = "insert into carInfo(carNum, cname, sex, tel, isPass) values(@carNum, @cname, @sex, @tel, @isPass)";
            try
            {
                //2.创建连接对象
                using (SqlConnection con = new SqlConnection("server=.;database=ParkingDb;uid=sa;pwd=123456;"))
                {
                    //3.创建命令对象
                    using (SqlCommand command = new SqlCommand(sql, con))
                    {
                        //4.设置参数
                        command.Parameters.AddWithValue("carNum", txtNum.Text);
                        command.Parameters.AddWithValue("cname", txtName.Text);
                        command.Parameters.AddWithValue("sex", rblSex.Text);
                        command.Parameters.AddWithValue("tel", txtPhone.Text);
                        command.Parameters.AddWithValue("isPass", IsPass.Text);


                        //5.打开数据库连接
                        con.Open();

                        //6.调用方法执行sql语句
                        int result = command.ExecuteNonQuery();

                        //7.关闭数据库
                        con.Close();
                        //8.判断结果是否添加成功
                        if (result > 0)
                        {
                            //提示添加成功，并且跳转到列表页
                            Response.Write("<script>alert('添加成功');window.location.href='/MainForm.aspx'</script>");
                          
                        }
                        else
                        {
                            Response.Write("<script>alert('添加失败')</script>");
                        }

                    }


                }

            }
            catch (Exception ex)
            {

                Response.Write($"<script>alert('添加失败，{ex.Message}')</script>");
            }
            



          
        }

        /// <summary>
        /// 清空
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtNum.Text = "";
            txtName.Text = "";
            txtPhone.Text = "";
        }
    }
}