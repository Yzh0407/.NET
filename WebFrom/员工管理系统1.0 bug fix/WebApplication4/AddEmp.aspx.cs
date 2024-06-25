using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class AddEmp : System.Web.UI.Page
    {
        // 页面加载事件处理
        protected void Page_Load(object sender, EventArgs e)
        {
            // 设置非介入方式验证行为，以确保客户端验证正常工作
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            // 检查是否是首次加载页面
            if (!IsPostBack)
            {
                // 设置状态Status的默认选项
                Status.SelectedValue = "在职";
            }
        }

        // 添加员工按钮点击事件处理
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            // 定义保存SQL插入语句的字符串
            string sql = "INSERT INTO [EmpInfo] ([EmpName], [EmpSex], [Status], [Tel], [Did], [Remark]) VALUES (@EmpName, @EmpSex, @Status, @Tel, @Did, @Remark)";
            try
            {
                // 创建数据库连接对象
                using (SqlConnection con = new SqlConnection("Server=.;Database=DB;User Id=sa;Password=123456;"))
                {
                    // 创建命令对象
                    using (SqlCommand command = new SqlCommand(sql, con))
                    {
                        // 设置参数，将前端控件的值传递给SQL语句中的参数
                        command.Parameters.AddWithValue("@EmpName", EmpName.Text);
                        command.Parameters.AddWithValue("@EmpSex", EmpSex.Text);
                        command.Parameters.AddWithValue("@Status", Status.SelectedValue);
                        command.Parameters.AddWithValue("@Tel", EmpPhone.Text);
                        command.Parameters.AddWithValue("@Did", Did.SelectedValue);
                        command.Parameters.AddWithValue("@Remark", Remark.Text);

                        // 打开数据库连接
                        con.Open();
                        // 执行SQL语句，返回受影响的行数
                        int result = command.ExecuteNonQuery();

                        // 关闭数据库连接
                        con.Close();

                        // 根据执行结果显示提示信息
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

        // 自定义验证事件处理，验证性别输入是否为“男”或“女”
        protected void sexInput_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string sexInput = args.Value;
            if (sexInput == "男" || sexInput == "女")
            {
                // 如果性别输入为“男”或“女”，验证通过
                args.IsValid = true;
            }
            else
            {
                // 否则，验证失败
                args.IsValid = false;
            }
        }
    }
}
