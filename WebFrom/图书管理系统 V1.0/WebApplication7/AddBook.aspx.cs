using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "INSERT INTO BookInfo (ISBN, BookName, Price, Author, Stock, TypeID) VALUES (@ISBN, @BookName, @Price, @Author, @Stock, @TypeID)";
            try
            {
                using (SqlConnection con = new SqlConnection("Server=.;Database=BookManage;User ID=sa;Password=123456;"))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@ISBN", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@BookName", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@Price", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@Author", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@Stock", TextBox5.Text.Trim());
                        cmd.Parameters.AddWithValue("@TypeID", DropDownList1.SelectedValue);

                        con.Open();

                        int result = cmd.ExecuteNonQuery();

                        con.Close();

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