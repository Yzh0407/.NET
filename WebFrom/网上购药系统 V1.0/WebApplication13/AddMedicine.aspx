<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMedicine.aspx.cs" Inherits="WebApplication13.AddMedicine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网上购药系统-订购页面</title>
    <style>
        body {
            background-image: url('https://krseoul.imgtbl.com/i/2024/06/17/667016fd50003.png'); /* 背景图片的路径 */
            background-size: cover; /* 背景图片覆盖整个页面 */
            background-position: center; /* 背景图片居中 */
            background-repeat: no-repeat; /* 背景图片不重复 */
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #form1 {
            width: 26%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        td {
            padding: 8px;
            vertical-align: top;
        }

        #td1 {
            padding: 0px;
        }

        .error {
            color: red;
            font-size: 0.9em;
            margin-left: 10px;
        }

        .button-container {
            text-align: center;
        }

        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 1em;
            margin: 5px;
        }

        .btn-add {
            background-color: #28a745;
            border-radius: 8px;
        }

        .btn-return {
            background-color: #dc3545;
            border-radius: 8px;
        }

        .btn:hover {
            opacity: 0.9;
        }

        footer {
            text-align: center;
            margin-top: 20px;
            color: #555;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>在线订药</h1>
            <table>
                <tr>
                    <td>药品名：</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="必填项" CssClass="error"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>收货人姓名：</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="必填项" CssClass="error"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>收货人电话：</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="必填项" CssClass="error"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>收货地址：</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="必填项" CssClass="error"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>配送方式：</td>
                    <td id="td1">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlDataSource1" DataTextField="SendTypeName" DataValueField="SendType">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:OrderMedicineDBConnectionString %>' SelectCommand="SELECT DISTINCT SendType,CASE WHEN SendType = 0 THEN '商家配送' WHEN SendType = 1 THEN '自提' END AS SendTypeName FROM OrderInfo INNER JOIN UserInfo ON UserInfo.UserId = OrderInfo.UserId"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>备注：</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="必填项" CssClass="error"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <div class="button-container">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-add" Text="添加" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-return" CausesValidation="false" Text="返回" PostBackUrl="~/index.aspx" />
            </div>
        </div>
        <footer style="text-align: center; margin-top: 20px;">
            &copy; 2024 闽大网上购药系统
        </footer>
    </form>
</body>
</html>
