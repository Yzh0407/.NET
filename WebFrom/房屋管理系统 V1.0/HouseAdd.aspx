<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HouseAdd.aspx.cs" Inherits="WebApplication5.HouseAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>房源信息管理系统-添加房源</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
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
            <h2>房源信息管理系统</h2>
            <table>
                <tr>
                    <td>租赁方式</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>租金</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>联系人</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>押金方式</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>房屋类型</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Type" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="Data Source=.;Initial Catalog=Test;User ID=sa;Password=123456;Encrypt=False;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [HouseType]"></asp:SqlDataSource>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HouseDropList %>' SelectCommand="SELECT * FROM [HouseType]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>详细地址</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="确定" OnClick="Button1_Click" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
