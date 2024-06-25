<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication8.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品管理系统</title>
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
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>商品管理系统</h1>
            <asp:Button ID="Button1" runat="server" Text="添加" PostBackUrl="~/AddProduct.aspx" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="商品编号" ReadOnly="True" InsertVisible="False" SortExpression="ProductID"></asp:BoundField>
                    <asp:BoundField DataField="ProductName" HeaderText="商品名称" SortExpression="ProductName"></asp:BoundField>
                    <asp:BoundField DataField="ProductClass" HeaderText="商品类别" SortExpression="ProductClass"></asp:BoundField>
                    <asp:BoundField DataField="ProductNum" HeaderText="商品库存" SortExpression="ProductNum"></asp:BoundField>
                    <asp:BoundField DataField="Remark" HeaderText="商品备注" SortExpression="Remark"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MarketConnectionString %>' ProviderName='<%$ ConnectionStrings:MarketConnectionString.ProviderName %>' SelectCommand="SELECT * FROM [ProductInfo]"></asp:SqlDataSource>
        </div>
        <footer style="text-align: center; margin-top: 20px;">
            &copy; 2024 闽大商品管理系统
        </footer>
    </form>
</body>
</html>
