using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication9
{
    public partial class StudentList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // GridView删除行事件处理方法
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // 获取删除行的e_ID值
            string e_ID = GridView1.DataKeys[e.RowIndex].Value.ToString();
            // 设置SqlDataSource的Delete参数
            SqlDataSource1.DeleteParameters["e_ID"].DefaultValue = e_ID;
        }

        // 模拟JavaScript的确认弹窗
        private bool confirmDelete()
        {
            // 实际项目中需要通过客户端确认结果，这里仅为示例
            return true; // 此处应根据实际的客户端确认结果进行修改
        }
    }
}
