<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication7.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书管理系统</title>
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

        h1 {
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
        <h1>图书管理系统</h1>
        <form id="form1" runat="server">
            <div>
                <div class="button-container">
                    <asp:Button ID="Button1" runat="server" Text="添加商品" PostBackUrl="~/AddBook.aspx" CssClass="aspNet-Button" />
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ISBN" DataSourceID="SqlDataSource1" CssClass="grid-view">
                    <Columns>
                        <asp:BoundField DataField="ISBN" HeaderText="图书编号" ReadOnly="True" SortExpression="ISBN"></asp:BoundField>
                        <asp:BoundField DataField="TypeName" HeaderText="图书类型" SortExpression="TypeName"></asp:BoundField>
                        <asp:BoundField DataField="BookName" HeaderText="图书名称" SortExpression="BookName"></asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="图书价格" SortExpression="Price"></asp:BoundField>
                        <asp:BoundField DataField="Author" HeaderText="作者" SortExpression="Author"></asp:BoundField>
                        <asp:BoundField DataField="Stock" HeaderText="库存" SortExpression="Stock"></asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BookManageConnectionString %>' ProviderName='<%$ ConnectionStrings:BookManageConnectionString.ProviderName %>' SelectCommand="select ISBN,BookType.TypeName,BookName,Price,Author,Stock from BookInfo
inner join BookType on BookInfo.TypeID=BookType.TypeID"></asp:SqlDataSource>
            </div>
            <footer style="text-align: center; margin-top: 20px;">
                &copy; 2024 图书管理系统. All rights reserved.
            </footer>
        </form>
    </div>
</body>
</html>
