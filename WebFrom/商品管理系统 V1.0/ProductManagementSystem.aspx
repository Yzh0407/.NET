<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductManagementSystem.aspx.cs" Inherits="WebApplication6.ProductManagementSystem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .button-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .aspNet-Button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: inline-block;
        }

            .aspNet-Button:hover {
                background-color: #45a049;
            }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

            .grid-view th, .grid-view td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            .grid-view th {
                background-color: #f2f2f2;
                text-align: left;
            }

            .grid-view tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .grid-view tr:hover {
                background-color: #f1f1f1;
            }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <h2>商品管理系统</h2>
            <div class="button-container">
                <asp:Button ID="Button1" runat="server" Text="添加商品" PostBackUrl="~/AddProduct.aspx" CssClass="aspNet-Button" />
            </div>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="Content" HeaderText="商品名称" SortExpression="Content"></asp:BoundField>
                    <asp:BoundField DataField="IsUp" HeaderText="是否上架" SortExpression="IsUp"></asp:BoundField>
                    <asp:BoundField DataField="UnitPrice" HeaderText="商品单价" SortExpression="UnitPrice"></asp:BoundField>
                    <asp:BoundField DataField="Remark" HeaderText="商品备注" SortExpression="Remark"></asp:BoundField>
                    <asp:BoundField DataField="CategoryName" HeaderText="所属类别" SortExpression="CategoryName"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT Content, IsUp, UnitPrice, Remark, Category.CategoryName FROM Product INNER JOIN Category ON Category.CategoryID = Product.CategoryID;"></asp:SqlDataSource>
        </form>
    </div>
</body>
</html>
