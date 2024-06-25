using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication14
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //将用户选择的文件上传到服务器
        protected void Button1_Click(object sender, EventArgs e)
        {
            //判断用户是否选择了文件
            try
            {
                if (FileUpload1.HasFile)
                {
                    //有选择文件
                    //1.fileName获取文件名称
                    string fileName = FileUpload1.FileName;

                    //2.文件上传保存的虚拟路径
                    //string path = "~/images/" + fileName;
                    string path = "~/images/" + DateTime.Now.ToFileTime() + (new Random().Next()) + fileName;


                    //3.虚拟路劲转换为服务器中的物理路径
                    string savePath = Server.MapPath(path);

                    //4.使用上传文件控件的SaveAs方法将文件上传到服务器
                    FileUpload1.SaveAs(savePath);

                    //设置显示图片的文件路径
                    Image1.ImageUrl = path;
                }
                else
                {
                    //没有选择文件
                    Response.Write("<script>alter('请选择文件')</script>");
                }
            }
            catch (Exception ex)
            {

                Response.Write("上传失败。错误信息：" + ex.Message);
            }
        }
    }
}