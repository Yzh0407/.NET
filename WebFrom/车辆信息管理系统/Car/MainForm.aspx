<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="Car.MainForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>车辆管理系统</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="添加"  PostBackUrl="~/Add.aspx"/>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cid" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="cid" HeaderText="编号" InsertVisible="False" ReadOnly="True" SortExpression="cid" />
                    <asp:BoundField DataField="carNum" HeaderText="车牌号" SortExpression="carNum" />
                    <asp:BoundField DataField="cname" HeaderText="业主姓名" SortExpression="cname" />
                    <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                    <asp:BoundField DataField="tel" HeaderText="电话号码" SortExpression="tel" />
                    <asp:CheckBoxField DataField="isPass" HeaderText="是否通过" SortExpression="isPass" />
                    <asp:TemplateField HeaderText="删除">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" OnClientClick="return confirm('确认删除？')">删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ParkingDBConnectionString %>" DeleteCommand="DELETE FROM [carInfo] WHERE [cid] = @cid" InsertCommand="INSERT INTO [carInfo] ([carNum], [cname], [sex], [tel], [isPass]) VALUES (@carNum, @cname, @sex, @tel, @isPass)" SelectCommand="SELECT * FROM [carInfo]" UpdateCommand="UPDATE [carInfo] SET [carNum] = @carNum, [cname] = @cname, [sex] = @sex, [tel] = @tel, [isPass] = @isPass WHERE [cid] = @cid">
                <DeleteParameters>
                    <asp:Parameter Name="cid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="carNum" Type="String" />
                    <asp:Parameter Name="cname" Type="String" />
                    <asp:Parameter Name="sex" Type="String" />
                    <asp:Parameter Name="tel" Type="String" />
                    <asp:Parameter Name="isPass" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="carNum" Type="String" />
                    <asp:Parameter Name="cname" Type="String" />
                    <asp:Parameter Name="sex" Type="String" />
                    <asp:Parameter Name="tel" Type="String" />
                    <asp:Parameter Name="isPass" Type="Boolean" />
                    <asp:Parameter Name="cid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
