using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                DropDownList1.DataBind();
                DropDownList1.SelectedValue = "1"; // 默认值

                // 找到默认选中的项并修改其显示文字
                ListItem selectedItem = DropDownList1.Items.FindByValue("1");
                if (selectedItem != null)
                {
                    selectedItem.Text = "== 请选择 ==";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "INSERT INTO Product (Content, IsUp, UnitPrice, Remark, CategoryID) VALUES (@Content, @IsUp, @UnitPrice, @Remark, @CategoryID)";
            try
            {
                using (SqlConnection con = new SqlConnection("Server=.;Database=Test;User Id=sa;Password=123456;"))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@Content", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@IsUp", RadioButtonList1.SelectedValue);
                        cmd.Parameters.AddWithValue("@UnitPrice", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@Remark", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@CategoryID", DropDownList1.SelectedValue);

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
                // 捕获异常并显示错误信息
                Response.Write($"<script>alert('添加失败！, {ex.Message}');</script>");
            }
        }
    }
}