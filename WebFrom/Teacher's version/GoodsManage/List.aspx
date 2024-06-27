<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="GoodsManage.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnOrder" runat="server" Text="订购" PostBackUrl="~/Add.aspx" />
            <br />
            商品名称：<asp:TextBox ID="txtGoodsName" runat="server"></asp:TextBox><asp:Button ID="btnSelect" runat="server" Text="查询" OnClick="btnSelect_Click" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderId,Expr1,Expr2" DataSourceID="SqlDataSource1" OnRowDeleted="GridView1_RowDeleted">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="订单编号" InsertVisible="False" ReadOnly="True" SortExpression="OrderId" />
                    <asp:BoundField DataField="UserName" HeaderText="下单人" SortExpression="UserName" />
                    <asp:BoundField DataField="GoodsName" HeaderText="商品名称" SortExpression="GoodsName" />
                    <asp:BoundField DataField="OrderTime" HeaderText="下单时间" SortExpression="OrderTime" />
                    <asp:TemplateField HeaderText="订单状态" SortExpression="State">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# State(Eval("State").ToString()) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="配送类型" SortExpression="SendType">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("SendType") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("SendType").ToString()=="False"?"商家配送":"自提" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Address" HeaderText="收货地址" SortExpression="Address" />
                    <asp:BoundField DataField="Phone" HeaderText="收货电话" SortExpression="Phone" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" OnClientClick="return confirm(&quot;确认删除？&quot;)">删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GoodsManageConnectionString %>" DeleteCommand="DELETE FROM [OrderInfo] WHERE [OrderId] = @OrderId" InsertCommand="INSERT INTO [OrderInfo] ([GoodsId], [UserId], [OrderTime], [State], [SendType], [Address], [Phone]) VALUES (@GoodsId, @UserId, @OrderTime, @State, @SendType, @Address, @Phone)" 
                SelectCommand="SELECT OrderInfo.OrderId, OrderInfo.GoodsId, OrderInfo.UserId, OrderInfo.OrderTime, OrderInfo.State, OrderInfo.SendType, OrderInfo.Address, OrderInfo.Phone, UserInfo.UserId AS Expr1, UserInfo.UserName, UserInfo.Password, GoodsInfo.GoodsId AS Expr2, GoodsInfo.GoodsName FROM OrderInfo INNER JOIN UserInfo ON OrderInfo.UserId = UserInfo.UserId INNER JOIN GoodsInfo ON OrderInfo.GoodsId = GoodsInfo.GoodsId" UpdateCommand="UPDATE [OrderInfo] SET [GoodsId] = @GoodsId, [UserId] = @UserId, [OrderTime] = @OrderTime, [State] = @State, [SendType] = @SendType, [Address] = @Address, [Phone] = @Phone WHERE [OrderId] = @OrderId">
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
        </div>
    </form>
</body>
</html>
