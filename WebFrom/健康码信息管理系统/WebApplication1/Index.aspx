<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>健康码信息管理系统</title>
    <style>
        body {
            background-image: url('https://krseoul.imgtbl.com/i/2024/06/18/6671a218615d3.jpg'); /* 背景图片的路径 */
            background-size:1800px 1080px; /* 背景图片覆盖整个页面 */
            background-position: center; /* 背景图片居中 */
            background-repeat: no-repeat; /* 背景图片不重复 */
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        div {
            margin-bottom: 20px;
        }

        input[type="text"] {
            width: 300px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            button:hover {
                background-color: #0056b3;
            }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

            .gridview th, .gridview td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
            }

            .gridview th {
                background-color: #f2f2f2;
            }

            .gridview tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .gridview tr:hover {
                background-color: #f1f1f1;
            }

        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>健康码信息管理系统</h1>
        <div>
            姓名查询: 
            <!-- 输入框，用于输入要查询的姓名 -->
            <asp:TextBox ID="txtSearchName" runat="server"></asp:TextBox>
            <!-- 查询按钮，点击后执行查询操作 -->
            <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />

            <asp:Button ID="Button1" runat="server" Text="添加" PostBackUrl="~/AddCode.aspx" />
            <!-- GridView 控件，用于显示查询结果 -->
            <asp:GridView ID="gvUserInfo" runat="server" AutoGenerateColumns="False" DataKeyNames="UId" AllowPaging="True" OnPageIndexChanging="gvUserInfo_PageIndexChanging" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="UId" HeaderText="编号" />
                    <asp:BoundField DataField="Name" HeaderText="姓名" />
                    <asp:BoundField DataField="IdCard" HeaderText="身份证号码" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="电话号码" />
                    <asp:BoundField DataField="Sex" HeaderText="性别" />
                    <asp:BoundField DataField="Age" HeaderText="年龄" />
                    <asp:BoundField DataField="CreateDate" HeaderText="登记时间" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="HealthCodeStatus" HeaderText="健康码状态" />
                    <asp:BoundField DataField="ReportStatus" HeaderText="是否上报" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1"></asp:SqlDataSource>
        </div>
        <footer style="text-align: center; margin-top: 20px;">
            疫情防控&emsp;人人有责
        </footer>
    </form>
</body>
</html>
