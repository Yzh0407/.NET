<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="查询" OnClick="btnSelect_Click" />
            <asp:Button ID="Button2" runat="server" Text="添加" PostBackUrl="~/Add.aspx" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderId" DataSourceID="SqlDataSource1" OnRowDeleted="GridView1_RowDeleted">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="OrderId" InsertVisible="False" ReadOnly="True" SortExpression="OrderId" />
                    <asp:BoundField DataField="GoodsName" HeaderText="GoodsName" SortExpression="GoodsName" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="OrderTime" HeaderText="OrderTime" SortExpression="OrderTime" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="State" HeaderText="State" ReadOnly="True" SortExpression="State" />
                    <asp:BoundField DataField="SendType" HeaderText="SendType" ReadOnly="True" SortExpression="SendType" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GoodsManageConnectionString %>" DeleteCommand="DELETE FROM OrderInfo WHERE OrderId = @OrderId;
"
                SelectCommand="SELECT OrderInfo.OrderId, GoodsInfo.GoodsName, UserInfo.UserName, OrderInfo.OrderTime, OrderInfo.Address, OrderInfo.Phone, CASE OrderInfo.State WHEN 0 THEN '未发货' WHEN 1 THEN '已发货' WHEN 2 THEN '已送达' WHEN 3 THEN '已签收' ELSE '未知状态' END AS State, CASE OrderInfo.SendType WHEN 0 THEN '商家配送' WHEN 1 THEN '自提' ELSE '未知方式' END AS SendType FROM OrderInfo JOIN GoodsInfo ON OrderInfo.GoodsId = GoodsInfo.GoodsId JOIN UserInfo ON OrderInfo.UserId = UserInfo.UserId">
                <DeleteParameters>
                    <asp:Parameter Name="OrderId" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
