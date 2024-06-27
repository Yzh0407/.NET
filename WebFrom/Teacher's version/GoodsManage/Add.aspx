<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="GoodsManage.Add" %>

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
        <asp:SqlDataSource ID="order" runat="server" ConnectionString="<%$ ConnectionStrings:GoodsManageConnectionString %>" 
            DeleteCommand="DELETE FROM [OrderInfo] WHERE [OrderId] = @OrderId" 
            InsertCommand="INSERT INTO [OrderInfo] ([GoodsId], [UserId], [OrderTime], [State], [SendType], [Address], [Phone]) VALUES (@GoodsId, @UserId, @OrderTime, @State, @SendType, @Address, @Phone)" 
            SelectCommand="SELECT * FROM [OrderInfo]" 
            UpdateCommand="UPDATE [OrderInfo] SET [GoodsId] = @GoodsId, [UserId] = @UserId, [OrderTime] = @OrderTime, [State] = @State, [SendType] = @SendType, [Address] = @Address, [Phone] = @Phone WHERE [OrderId] = @OrderId">
            <DeleteParameters>
                <asp:Parameter Name="OrderId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="GoodsId" Type="Int32" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="OrderTime" Type="DateTime" />
                <asp:Parameter Name="State" Type="Int32" />
                <asp:Parameter Name="SendType" Type="Boolean" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="GoodsId" Type="Int32" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="OrderTime" Type="DateTime" />
                <asp:Parameter Name="State" Type="Int32" />
                <asp:Parameter Name="SendType" Type="Boolean" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="OrderId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
