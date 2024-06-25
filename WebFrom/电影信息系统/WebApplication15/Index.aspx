<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication15.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>电影系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            text-align: center;
            color: #333333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

            td:first-child {
                text-align: right;
                font-weight: bold;
                color: #333333;
                padding-right: 10px;
            }

            td:last-child {
                text-align: left;
            }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .aspNetDisabled {
            background-color: #eee;
        }

        .error-message {
            color: red;
            font-size: 12px;
        }

        .file-upload {
            width: calc(100% - 20px);
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

            .button-container button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

                .button-container button:hover {
                    background-color: #45a049;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>电影系统</h1>
            <asp:Button ID="Button2" runat="server" Text="放映厅" CausesValidation="false" PostBackUrl="~/ShowPage.aspx"/>
            <table>
                <tr>
                    <td>电影名称：</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="电影名称必填"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>导演：</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="导演必填" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>主演：</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="主演必填" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>简介：</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="简介必填" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>封面：</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="FileUpload1" OnServerValidate="CustomValidator1_ServerValidate" ErrorMessage="请选择一个文件" Display="Dynamic" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>视频资源：</td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="FileUpload2" OnServerValidate="CustomValidator2_ServerValidate" ErrorMessage="请选择一个文件" Display="Dynamic" ForeColor="Red" />
                    </td>
                </tr>
            </table>
            <div class="button-container">
                <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</body>
</html>
