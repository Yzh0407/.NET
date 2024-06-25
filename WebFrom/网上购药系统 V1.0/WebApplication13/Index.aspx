<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication13.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网上购药系统</title>
    <style>
        body {
            background-image: url('https://krseoul.imgtbl.com/i/2024/06/17/667016fd50003.png'); /* 背景图片的路径 */
            background-size: cover; /* 背景图片覆盖整个页面 */
            background-position: center; /* 背景图片居中 */
            background-repeat: no-repeat; /* 背景图片不重复 */
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #form1 {
            width: 80%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
            text-align: left;
        }

            .gridview th, .gridview td {
                padding: 12px;
                border: 1px solid #ddd;
            }

            .gridview th {
                background-color: #f2f2f2;
                color: #333;
            }

            .gridview tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .gridview tr:hover {
                background-color: #f1f1f1;
            }

            .gridview .command-field button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
            }

                .gridview .command-field button:hover {
                    background-color: #0056b3;
                }

        .btn {
            background-color: #007bff; /* 设置按钮的背景颜色为蓝色 */
            color: white; /* 设置按钮的文字颜色为白色 */
            border: none; /* 去掉按钮的边框 */
            border-radius: 8px; /* 设置按钮的圆角边框半径为8px */
            padding: 4px 5px; /* 设置按钮的内边距，上下为4px，左右为5px */
            cursor: pointer; /* 设置鼠标悬停在按钮上时的指针样式 */
            font-size: 1em; /* 设置按钮的字体大小 */
            text-decoration: none; /* 去掉按钮文字的下划线 */
            width: 100px; /* 设置按钮的宽度为100px，可以根据需要调整 */
        }

        .btn-add {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 8px 10px;
            cursor: pointer;
            font-size: 1em;
            margin: 5px;
            text-decoration: none;
        }

            .btn:hover, .btn-add:hover {
                opacity: 0.9;
            }

        .btnout {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 8px 10px;
            cursor: pointer;
            font-size: 1em;
            margin: 5px;
            text-decoration: none;
            float: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>订单信息</h1>
        <div>
            <asp:Button ID="Button1" runat="server" Text="在线订购" PostBackUrl="~/AddMedicine.aspx" CssClass="btn-add" />
            <asp:Button ID="Button2" runat="server" Text="注销" CssClass="btnout" OnClick="LogoutButton_Click" />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="gridview" AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="编号" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                    <asp:BoundField DataField="MedicineName" HeaderText="药品名" SortExpression="MedicineName"></asp:BoundField>
                    <asp:BoundField DataField="UserName" HeaderText="下单人" SortExpression="UserId"></asp:BoundField>
                    <asp:BoundField DataField="AddTime" HeaderText="下单时间" SortExpression="AddTime"></asp:BoundField>
                    <asp:BoundField DataField="RealName" HeaderText="收货人" SortExpression="RealName"></asp:BoundField>
                    <asp:BoundField DataField="Mobile" HeaderText="收货人电话" SortExpression="Mobile"></asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="收货地址" SortExpression="Address">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SendType" HeaderText="配送方式" SortExpression="SendType"></asp:BoundField>
                    <asp:BoundField DataField="State" HeaderText="状态" SortExpression="State"></asp:BoundField>
                    <asp:BoundField DataField="SendTime" HeaderText="配送时间" SortExpression="SendTime"></asp:BoundField>
                    <asp:BoundField DataField="Remark" HeaderText="备注" SortExpression="Remark">
                        <ItemStyle Width="50px" />
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="操作" ControlStyle-CssClass="btn"></asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:OrderMedicineDBConnectionString %>'
                SelectCommand="SELECT ID, MedicineName, UserInfo.UserName, AddTime, RealName, Mobile, Address, CASE WHEN State = 1 THEN '未配送' WHEN State = 2 THEN '已配送' END AS State,CASE WHEN SendType = 0 THEN '商家配送' WHEN SendType = 1 THEN '自提' END AS SendType,SendTime,Remark FROM OrderInfo INNER JOIN UserInfo ON UserInfo.UserId = OrderInfo.UserId;"
                DeleteCommand="DELETE FROM [OrderInfo] WHERE [Id] = @Id"
                InsertCommand="INSERT INTO [OrderInfo] ([MedicineName], [UserId], [AddTime], [RealName], [Mobile], [Address], [State], [SendTime], [SendType], [Remark]) VALUES (@MedicineName, @UserId, @AddTime, @RealName, @Mobile, @Address, @State, @SendTime, @SendType, @Remark)"
                UpdateCommand="UPDATE [OrderInfo] SET [MedicineName] = @MedicineName, [UserId] = @UserId, [AddTime] = @AddTime, [RealName] = @RealName, [Mobile] = @Mobile, [Address] = @Address, [State] = @State, [SendTime] = @SendTime, [SendType] = @SendType, [Remark] = @Remark WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MedicineName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="UserId" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="AddTime" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="RealName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Mobile" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                    <asp:Parameter Name="State" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="SendTime" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="SendType" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="Remark" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MedicineName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="UserId" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="AddTime" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="RealName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Mobile" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                    <asp:Parameter Name="State" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="SendTime" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="SendType" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="Remark" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <footer style="text-align: center; margin-top: 20px;">
            &copy; 2024 闽大网上购药系统
        </footer>
    </form>
</body>
</html>
