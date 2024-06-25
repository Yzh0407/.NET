using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication8
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string sql = "INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES (@ProductName, @ProductClass, @ProductNum, @Remark);";
            try
            {
                using (SqlConnection con = new SqlConnection("Server=.;Database=Market;User ID=sa;Password=123456;"))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@ProductName", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@ProductClass", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@ProductNum", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@Remark", TextBox4.Text.Trim());

                        con.Open();

                        int result = cmd.ExecuteNonQuery();


                        if (result > 0)
                        {
                            Response.Write("<script>alert('添加成功！');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('添加失败！');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('添加失败! {ex.Message}');</script>");
            }
        }
    }
}