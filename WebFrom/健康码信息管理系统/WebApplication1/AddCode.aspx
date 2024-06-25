<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCode.aspx.cs" Inherits="WebApplication1.AddCode" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加用户信息</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 550px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            vertical-align: middle;
        }

            td:first-child {
                color: #333;
                width: 30%;
            }

            td:last-child {
                width: 70%;
            }

        input[type="text"], input[type="tel"], select, .horizontal-radio {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }


            .horizontal-radio input {
                margin-right: 5px;
            }

            .horizontal-radio label {
                margin-right: 15px;
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

        td[colspan="2"] {
            text-align: center;
        }

        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>添加用户</h1>
        <table>
            <tr>
                <td>姓名：</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填项" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>身份证号码：</td>
                <td>
                    <asp:TextBox ID="txtIdCard" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="必填项" ControlToValidate="txtIdCard"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>电话号码：</td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="必填项" ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>性别：</td>
                <td>
                    <asp:DropDownList ID="ddlSex" runat="server">
                        <asp:ListItem Text="男" Value="男"></asp:ListItem>
                        <asp:ListItem Text="女" Value="女"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="必选项" ControlToValidate="ddlSex"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>年龄：</td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="必填项" ControlToValidate="txtAge"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>健康码状态：</td>
                <td>
                    <asp:DropDownList ID="ddlHealthCodeStatus" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="CId"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:TestConnectionString2 %>' SelectCommand="SELECT * FROM [CodeType]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="必填项" ControlToValidate="ddlHealthCodeStatus"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>是否上报：</td>
                <td>
                    <asp:RadioButtonList ID="rblState" runat="server" RepeatDirection="Horizontal" CssClass="horizontal-radio">
                        <asp:ListItem Text="未上报" Value="0"></asp:ListItem>
                        <asp:ListItem Text="已上报" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="必选项" ControlToValidate="rblState"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="提交" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
        <footer style="text-align: center; margin-top: 20px;">
            坚决打赢疫情防控的人民战争总体战阻击战
        </footer>
    </form>
</body>
</html>
