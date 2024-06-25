<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WebApplication6.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        #top-title {
            text-align: center;
        }

        .font-weiget {
            font-weight: bold;
            width: 150px;
        }

        input[type="text"],
        select,
        .aspNet-TextBox,
        .aspNet-DropDownList {
            width: 100%;
            padding: 8px;
            margin: 4px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .aspNet-Button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            .aspNet-Button:hover {
                background-color: #45a049;
            }

        .horizontal-radio-button-list {
            display: flex;
            flex-direction: row;
            align-items: center;
        }

            .horizontal-radio-button-list input[type="radio"] {
                margin-right: 10px;
            }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <h2 id="top-title">商品管理系统</h2>
            <div>
                <table>
                    <tr>
                        <td class="font-weiget">商品名称</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="aspNet-TextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="必须填写"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weiget">是否上架</td>
                        <td class="horizontal-radio-button-list">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlDataSource2" DataTextField="IsUp" DataValueField="IsUp"></asp:RadioButtonList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="Data Source=.;Initial Catalog=Test;User ID=sa;Password=123456;Encrypt=False;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT  [IsUp] FROM [Product]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="必须填写"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weiget">商品单价</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="aspNet-TextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="必须填写"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weiget">商品备注</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="aspNet-TextBox"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="必须填写"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="font-weiget">所属类别</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID" CssClass="aspNet-DropDownList"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="Data Source=.;Initial Catalog=Test;User ID=sa;Password=123456;Encrypt=False;" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1" InitialValue="1" ErrorMessage="必须填写"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <asp:Button ID="Button1" runat="server" Text="添加" CssClass="aspNet-Button" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>
