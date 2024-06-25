using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class HouseAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // 确保页面首次加载时绑定数据
                BindHouseTypeDropdown();
            }
        }

        private void BindHouseTypeDropdown()
        {
            // 确保下拉列表绑定数据
            SqlDataSource1.SelectCommand = "SELECT * FROM [HouseType]";
            DropDownList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "INSERT INTO HouseInfo (LeaseMode, Rent, Contacts, DepositMethod, HouseTypeID, Address) VALUES (@LeaseMode, @Rent, @Contacts, @DepositMethod, @HouseTypeID, @Address)";
            try
            {
                using (SqlConnection sqlConnection = new SqlConnection("Server=.;Database=Test;User Id=sa;Password=123456;"))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, sqlConnection))
                    {
                        cmd.Parameters.AddWithValue("@LeaseMode", TextBox1.Text.Trim());
                        cmd.Parameters.AddWithValue("@Rent", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@Contacts", TextBox3.Text.Trim());
                        cmd.Parameters.AddWithValue("@DepositMethod", TextBox4.Text.Trim());
                        cmd.Parameters.AddWithValue("@HouseTypeID", DropDownList1.SelectedValue);
                        cmd.Parameters.AddWithValue("@Address", TextBox5.Text.Trim());

                        //调试信息
                        //Response.Write($"<script>alert('LeaseMode: {TextBox1.Text.Trim()}\\nRent: {TextBox2.Text.Trim()}\\nContacts: {TextBox3.Text.Trim()}\\nDepositMethod: {TextBox4.Text.Trim()}\\nHouseTypeID: {DropDownList1.SelectedValue}\\nAddress: {TextBox5.Text.Trim()}');</script>");

                        sqlConnection.Open();

                        int result = cmd.ExecuteNonQuery();



                        // 根据执行结果显示提示信息
                        if (result > 0)
                        {
                            Response.Write("<script>alert('添加成功！');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('添加失败！');</script>");
                        }

                        sqlConnection.Close();
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