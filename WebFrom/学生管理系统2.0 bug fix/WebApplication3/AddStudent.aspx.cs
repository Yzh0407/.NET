using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AddStudent : System.Web.UI.Page
    {
        // 页面加载事件处理
        protected void Page_Load(object sender, EventArgs e)
        {
            // 检查是否为首次加载页面
            if (!IsPostBack)
            {
                // 绑定班级下拉列表
                BindClassDropdown();
            }
        }

        // 绑定班级下拉列表的方法
        private void BindClassDropdown()
        {
            // 数据库连接字符串
            string connectionString = "Server =.;database = StudentDB;uid=sa;pwd = 123456;";

            // 创建SqlConnection对象，使用using确保资源释放
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // SQL查询语句，获取ClassInfo表的ClassID和ClassName
                string query = "SELECT ClassID, ClassName FROM ClassInfo";

                // 创建SqlCommand对象
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // 打开数据库连接
                    conn.Open();

                    // 执行查询，并使用SqlDataReader读取数据
                    SqlDataReader reader = cmd.ExecuteReader();

                    // 将数据绑定到下拉列表
                    ddlClass.DataSource = reader;
                    ddlClass.DataTextField = "ClassName";
                    ddlClass.DataValueField = "ClassID";
                    ddlClass.DataBind();
                }
            }
        }

        // 保存按钮点击事件处理
        protected void btnSave_Click(object sender, EventArgs e)
        {
            // 数据库连接字符串
            string connectionString = "Server =.;database = StudentDB;uid=sa;pwd = 123456;";

            // 创建SqlConnection对象，使用using确保资源释放
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // SQL插入语句，将表单数据插入StudentInfo表
                string query = "INSERT INTO StudentInfo (StuName, Sex, Age, Phone, ClassID) " +
                               "VALUES (@StuName, @Sex, @Age, @Phone, @ClassID)";

                // 创建SqlCommand对象
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // 添加参数及其值
                    cmd.Parameters.AddWithValue("@StuName", txtStuName.Text);
                    cmd.Parameters.AddWithValue("@Sex", ddlSex.SelectedValue);
                    cmd.Parameters.AddWithValue("@Age", int.Parse(txtAge.Text));
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@ClassID", ddlClass.SelectedValue);

                    // 打开数据库连接
                    conn.Open();

                    // 执行插入操作，并检查结果
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        // 插入成功，显示成功消息并重定向到Default.aspx
                        Response.Write("<script>alert('添加成功');window.location='Default.aspx';</script>");
                    }
                    else
                    {
                        // 插入失败，显示失败消息
                        Response.Write("<script>alert('添加失败');</script>");
                    }
                }
            }
        }
    }
}
