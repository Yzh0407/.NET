<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        div {
            margin-bottom: 20px;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            button:hover {
                background-color: #0056b3;
            }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

            .gridview th, .gridview td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
            }

            .gridview th {
                background-color: #f2f2f2;
            }

            .gridview tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .gridview tr:hover {
                background-color: #f1f1f1;
            }

        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>商品订购系统</h1>
        <div>
            <asp:Button ID="Button1" runat="server" Text="订购商品" PostBackUrl="~/OrderPage.aspx" />
            <br />
            商品名称: 
            <asp:TextBox ID="txtSearchName" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderId" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="订单编号" ReadOnly="True" InsertVisible="False" SortExpression="OrderId"></asp:BoundField>
                    <asp:BoundField DataField="UserName" HeaderText="下单人" SortExpression="GoodsId"></asp:BoundField>
                    <asp:BoundField DataField="GoodsName" HeaderText="商品名称" SortExpression="UserId"></asp:BoundField>
                    <asp:BoundField DataField="OrderTime" HeaderText="下单时间" SortExpression="OrderTime"></asp:BoundField>
                    <asp:BoundField DataField="State" HeaderText="下单状态" SortExpression="State"></asp:BoundField>
                    <asp:BoundField DataField="SendType" HeaderText="配送类型" SortExpression="SendType"></asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="收货地址" SortExpression="Address"></asp:BoundField>
                    <asp:BoundField DataField="Phone" HeaderText="收货电话" SortExpression="Phone"></asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CommandName="Delete"
                                OnClientClick="return confirm('确认是否删除?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:GoodsManageConnectionString %>' SelectCommand="select OrderId,UserName,GoodsName,OrderTime,case when State = 0 then '未发货' when State = 1 then '已发货' when State = 2 then '已送达' else '已签收' end As State,case when SendType = 0 then '商家配送'else '自提' end As SendType,Address,Phone from OrderInfo inner join GoodsInfo on GoodsInfo.GoodsId=OrderInfo.GoodsId inner join UserInfo on UserInfo.UserId = OrderInfo.UserId" DeleteCommand="DELETE FROM [OrderInfo] WHERE [OrderId] = @OrderId">
                <DeleteParameters>
                    <asp:Parameter Name="OrderId" Type="Int32"></asp:Parameter>
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
