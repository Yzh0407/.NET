using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AddCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=47.113.148.121;Initial Catalog=Test;User ID=sa;Password=123454321aA.";
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO UserInfo (Name, IdCard, PhoneNumber, Sex, Age, CreateDate, CId, State) " +
                                   "VALUES (@Name, @IdCard, @PhoneNumber, @Sex, @Age, @CreateDate, @CId, @State)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@IdCard", txtIdCard.Text);
                        cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                        cmd.Parameters.AddWithValue("@Sex", ddlSex.SelectedValue);
                        cmd.Parameters.AddWithValue("@Age", string.IsNullOrEmpty(txtAge.Text) ? (object)DBNull.Value : int.Parse(txtAge.Text));
                        cmd.Parameters.AddWithValue("@CreateDate", DateTime.Now.ToString("yyyy-MM-dd"));
                        cmd.Parameters.AddWithValue("@CId", ddlHealthCodeStatus.SelectedValue);
                        cmd.Parameters.AddWithValue("@State", rblState.SelectedValue);

                        conn.Open();

                        int result = cmd.ExecuteNonQuery();


                        if (result > 0)
                        {
                            Response.Write("<script>alert('添加成功！');window.location='Index.aspx';</script>");
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