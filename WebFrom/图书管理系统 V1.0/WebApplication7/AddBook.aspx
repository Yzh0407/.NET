<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="WebApplication7.AddBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书管理系统-添加图书</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 30px;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        form {
            width: 100%;
            max-width: 500px;
            margin: 20px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 10px;
        }

        td {
            vertical-align: middle;
        }

            td:first-child {
                text-align: right;
                font-weight: bold;
                color: #555;
                padding-right: 10px;
                white-space: nowrap;
            }

            td:last-child {
                text-align: left;
            }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .aspNetHidden {
            display: none;
        }

        .aspNetDisabled {
            opacity: 0.5;
        }

        input[type="button"], input[type="submit"], input[type="reset"], button {
            width: calc(100% - 40px);
            padding: 10px 20px;
            background-color: #4CAF50;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            display: block;
            margin: 20px auto;
            box-sizing: border-box;
            position: relative;
            right: -185px
        }

            input[type="button"]:hover, input[type="submit"]:hover, input[type="reset"]:hover, button:hover {
                background-color: #45a049;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>图书管理系统</h2>
            <table>
                <tr>
                    <td>图书编号</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="必填项"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>图书名称</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="必填项"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>图书类型</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TypeName" DataValueField="TypeID">
                        </asp:DropDownList><asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BookManageConnectionString %>' SelectCommand="SELECT * FROM [BookType]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage="必选项"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>作者</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="必填项"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>价格</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="必填项"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>库存数</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="必填项"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" /></td>
                </tr>
            </table>
        </div>
        <footer style="text-align: center;">
            &copy; 2024 图书管理系统. All rights reserved.
        </footer>
    </form>
</body>
</html>
