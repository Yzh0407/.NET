<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication8.Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品管理系统</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <style>
        body {
            background-image: url('https://krseoul.imgtbl.com/i/2024/06/17/667016fd50003.png'); /* 背景图片的路径 */
            background-size: cover; /* 背景图片覆盖整个页面 */
            background-position: center; /* 背景图片居中 */
            background-repeat: no-repeat; /* 背景图片不重复 */
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

        input[type="submit"], .aspNetDisabled, .btn2 {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
            text-decoration: none;
        }

        .btn3 {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
            text-decoration: none;
            width: 50px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .btnout {
            float:right;
        }
    </style>
    <script>
        function validateIntInput(event) {
            var value = event.target.value;
            if (isNaN(value) || parseInt(value) != value || parseInt(value) < 0) {
                alert("请输入有效的整数。");
                event.target.value = '';
                event.target.focus();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>商品管理系统</h1>
            <asp:Button ID="Button1" runat="server" Text="添加" PostBackUrl="~/AddProduct.aspx" />
            <asp:Button ID="Button2" runat="server" Text="注销" CssClass="btnout" OnClick="LogoutButton_Click" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="商品编号" ReadOnly="True" InsertVisible="False" SortExpression="ProductID"></asp:BoundField>
                    <asp:BoundField DataField="ProductName" HeaderText="商品名称" SortExpression="ProductName"></asp:BoundField>
                    <asp:BoundField DataField="ProductClass" HeaderText="商品类别" SortExpression="ProductClass"></asp:BoundField>
                    <asp:TemplateField HeaderText="商品库存">
                        <ItemTemplate>
                            <asp:Label ID="lblProductNum" runat="server" Text='<%# Bind("ProductNum") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtProductNum" runat="server" Text='<%# Bind("ProductNum") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Remark" HeaderText="商品备注" SortExpression="Remark"></asp:BoundField>
                    <asp:CommandField HeaderText="&nbsp;操作" ControlStyle-CssClass="btn3" ShowEditButton="True"></asp:CommandField>
                    <asp:TemplateField HeaderText="&emsp;操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkBtn1" runat="server" CssClass="btn2" CommandName="Delete" OnClientClick="return confirm('是否确认删除？')">删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:MarketConnectionString2 %>" ProviderName="<%$ ConnectionStrings:MarketConnectionString2.ProviderName %>" DeleteCommand="DELETE FROM [ProductInfo] WHERE [ProductID] = @ProductID" SelectCommand="SELECT * FROM [ProductInfo]" InsertCommand="INSERT INTO [ProductInfo] ([ProductName], [ProductClass], [ProductNum], [Remark]) VALUES (@ProductName, @ProductClass, @ProductNum, @Remark)" UpdateCommand="UPDATE [ProductInfo] SET [ProductName] = @ProductName, [ProductClass] = @ProductClass, [ProductNum] = @ProductNum, [Remark] = @Remark WHERE [ProductID] = @ProductID">
                <DeleteParameters>
                    <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ProductClass" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ProductNum" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Remark" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ProductClass" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ProductNum" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Remark" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <footer style="text-align: center; margin-top: 20px;">
            &copy; 2024 闽大商品管理系统
        </footer>
    </form>
</body>
</html>
