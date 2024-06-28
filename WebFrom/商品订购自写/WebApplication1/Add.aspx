<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="WebApplication1.Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>商品名称：</td>
                    <td>
                        <asp:DropDownList ID="ddlGoodsName" runat="server" DataSourceID="SqlDataSource1" DataTextField="GoodsName" DataValueField="GoodsId"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GoodsManageConnectionString %>" SelectCommand="SELECT * FROM [GoodsInfo]"></asp:SqlDataSource>
                    </td>
                </tr>
                 <tr>
                    <td>收货地址：</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>收货电话：</td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>配送方式：</td>
                    <td>
                        <asp:RadioButtonList ID="rblSendType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="True">自提</asp:ListItem>
                            <asp:ListItem Value="False" Selected="True">商家配送</asp:ListItem>
                        </asp:RadioButtonList>

                    </td>
                </tr>
                 <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnOrder" runat="server" Text="订购" OnClick="btnOrder_Click" /></td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:GoodsManageConnectionString %>' InsertCommand="INSERT INTO [OrderInfo] ([GoodsId], [UserId], [OrderTime], [State], [SendType], [Address], [Phone]) VALUES (@GoodsId, @UserId, @OrderTime, @State, @SendType, @Address, @Phone)" SelectCommand="SELECT OrderInfo.OrderId, GoodsInfo.GoodsName, UserInfo.UserName, OrderInfo.OrderTime, OrderInfo.Address, OrderInfo.Phone, CASE OrderInfo.State WHEN 0 THEN '未发货' WHEN 1 THEN '已发货' WHEN 2 THEN '已送达' WHEN 3 THEN '已签收' ELSE '未知状态' END AS State, CASE OrderInfo.SendType WHEN 0 THEN '商家配送' WHEN 1 THEN '自提' ELSE '未知方式' END AS SendType FROM OrderInfo JOIN GoodsInfo ON OrderInfo.GoodsId = GoodsInfo.GoodsId JOIN UserInfo ON OrderInfo.UserId = UserInfo.UserId">
            <InsertParameters>
                <asp:Parameter Name="GoodsId"></asp:Parameter>
                <asp:Parameter Name="UserId"></asp:Parameter>
                <asp:Parameter Name="OrderTime"></asp:Parameter>
                <asp:Parameter Name="State"></asp:Parameter>
                <asp:Parameter Name="SendType"></asp:Parameter>
                <asp:Parameter Name="Address"></asp:Parameter>
                <asp:Parameter Name="Phone"></asp:Parameter>
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
