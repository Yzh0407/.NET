using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication15
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }


        //验证文件存在的逻辑
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (FileUpload1.HasFile)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (FileUpload2.HasFile)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //判断用户是否选择了文件
            try
            {
                if (FileUpload1.HasFile && FileUpload2.HasFile)
                {
                    //有选择文件
                    //1.fileName获取文件名称
                    string fileName = FileUpload1.FileName;
                    string fileName2 = FileUpload2.FileName;

                    //2.文件上传保存的虚拟路径
                    //string path = "~/video/" + fileName;
                    string path = "~/img/" + DateTime.Now.ToFileTime() + (new Random().Next()) + fileName;
                    string path2 = "~/video/" + DateTime.Now.ToFileTime() + (new Random().Next()) + fileName2;


                    //3.虚拟路劲转换为服务器中的物理路径
                    string savePath = Server.MapPath(path);
                    string savePath2 = Server.MapPath(path2);

                    //4.使用上传文件控件的SaveAs方法将文件上传到服务器
                    FileUpload1.SaveAs(savePath);
                    FileUpload2.SaveAs(savePath2);


                    string sql = "INSERT INTO movies (title, director, actors, description, cover_path, movie_path) VALUES (@title, @director, @actors, @description, @cover_path, @movie_path)";
                    try
                    {
                        using (SqlConnection con = new SqlConnection("Server=.;Database=movie_info_system;User ID=sa;Password=123456;"))
                        {
                            using (SqlCommand cmd = new SqlCommand(sql, con))
                            {
                                cmd.Parameters.AddWithValue("@title", TextBox1.Text.Trim());
                                cmd.Parameters.AddWithValue("@director", TextBox2.Text.Trim());
                                cmd.Parameters.AddWithValue("@actors", TextBox3.Text.Trim());
                                cmd.Parameters.AddWithValue("@description", TextBox4.Text.Trim());
                                cmd.Parameters.AddWithValue("@cover_path", path);
                                cmd.Parameters.AddWithValue("@movie_path", path2);

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
                else
                {
                    //没有选择文件
                    Response.Write("<script>alter('请选择文件');</script>");
                }
            }
            catch (Exception ex)
            {

                Response.Write("上传失败。错误信息：" + ex.Message);
            }
        }
    }
}