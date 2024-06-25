<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WebApplication8.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品管理系统-添加商品</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        h3 {
            text-align: center;
            color: #666;
            margin-bottom: 20px;
            font-size: 18px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

            td:first-child {
                text-align: right;
                padding-right: 10px;
            }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .aspNetDisabled {
            background-color: #f0f0f0 !important;
            color: #888 !important;
        }

        input[type="submit"], .aspNetDisabled {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
        }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

        .error {
            color: red;
            font-size: 12px;
        }

        .btn {
            display: block;
            margin: 20px auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>商品管理系统</h1>
            <h3>商品添加</h3>
            <table>
                <tr>
                    <td>商品名称：</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="必填项" CssClass="error"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>商品类别：</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="必填项" CssClass="error"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>商品库存：</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="必填项" CssClass="error"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>商品备注：</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="必填项" CssClass="error"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <asp:Button ID="Button1" runat="server" CssClass="btn" Text="添加" OnClick="Button1_Click" />
        </div>
        <footer style="text-align: center; margin-top: 20px;">
            &copy; 2024 闽大商品管理系统
        </footer>
    </form>
</body>
</html>
