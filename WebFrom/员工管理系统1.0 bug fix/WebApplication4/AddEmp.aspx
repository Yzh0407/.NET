<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmp.aspx.cs" Inherits="WebApplication4.AddEmp" %>

<!-- 指定页面使用的编程语言是C#，启用自动事件连线，并指定该页面的代码隐藏文件和继承的类 -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加员工</title>
    <!-- 页面标题 -->
    <style>
        /* 内联样式，用于定义页面的外观 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

            .form-control:focus {
                border-color: #007bff;
                outline: none;
            }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            .btn:hover {
                background-color: #0056b3;
            }

        .error-message {
            color: red;
            font-size: 12px;
        }

        .text-center {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 定义一个ASP.NET服务器端表单 -->
        <div class="container">
            <!-- 包含表单内容的容器，设置样式使其居中显示 -->
            <h2>办理员工入职</h2>
            <!-- 表单标题 -->
            <table>
                <!-- 表单的布局表格 -->
                <tr>
                    <td>员工姓名：</td>
                    <td>
                        <!-- 员工姓名输入框 -->
                        <asp:TextBox ID="EmpName" runat="server" CssClass="form-control"></asp:TextBox>
                        <!-- 必填验证器，确保输入框不能为空 -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必须填写" ControlToValidate="EmpName" CssClass="error-message"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>员工性别：</td>
                    <td>
                        <!-- 员工性别输入框 -->
                        <asp:TextBox ID="EmpSex" runat="server" CssClass="form-control"></asp:TextBox>
                        <!-- 必填验证器，确保输入框不能为空 -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="必须填写" ControlToValidate="EmpSex" CssClass="error-message"></asp:RequiredFieldValidator>
                        <!-- 自定义验证器，确保性别必须是'男'或'女' -->
                        <asp:CustomValidator ID="sexInput" runat="server" ErrorMessage="性别必须是'男'或'女'" ControlToValidate="EmpSex" CssClass="error-message" OnServerValidate="sexInput_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>员工状态：</td>
                    <td>
                        <!-- 员工状态下拉列表 -->
                        <asp:DropDownList ID="Status" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Status" DataValueField="Status"></asp:DropDownList>
                        <!-- 数据源，用于填充下拉列表 -->
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:T1 %>' ProviderName='<%$ ConnectionStrings:T1.ProviderName %>' SelectCommand="SELECT DISTINCT Status FROM EmpInfo;"></asp:SqlDataSource>
                        <!-- 必填验证器，确保选择一个状态 -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="必须填写" ControlToValidate="Status" CssClass="error-message"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>手机号码：</td>
                    <td>
                        <!-- 员工手机号码输入框 -->
                        <asp:TextBox ID="EmpPhone" runat="server" CssClass="form-control"></asp:TextBox>
                        <!-- 必填验证器，确保输入框不能为空 -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="必须填写" ControlToValidate="EmpPhone" CssClass="error-message"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>所在部门：</td>
                    <td>
                        <!-- 员工所在部门下拉列表 -->
                        <asp:DropDownList ID="Did" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="DName" DataValueField="Did"></asp:DropDownList>
                        <!-- 数据源，用于填充下拉列表 -->
                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:T3 %>' ProviderName='<%$ ConnectionStrings:T3.ProviderName %>' SelectCommand="SELECT * FROM [DeptInfo]"></asp:SqlDataSource>
                        <!-- 必填验证器，确保选择一个部门 -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="必须填写" ControlToValidate="Did" CssClass="error-message"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>备注：</td>
                    <td>
                        <!-- 备注输入框 -->
                        <asp:TextBox ID="Remark" runat="server" CssClass="form-control"></asp:TextBox>
                        <!-- 必填验证器，确保输入框不能为空 -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="必须填写" ControlToValidate="Remark" CssClass="error-message"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                        <!-- 提交按钮 -->
                        <asp:Button ID="ButtonAdd" runat="server" Text="提交" CssClass="btn" OnClick="ButtonAdd_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
