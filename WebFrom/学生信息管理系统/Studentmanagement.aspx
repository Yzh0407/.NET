<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Studentmanagement.aspx.cs" Inherits="_02_Web.Studentmanagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="text">
            <asp:Label ID="hhname" runat="server" Text=""></asp:Label>
        </div>
        <div>
            学生管理
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID,Expr1" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="学号" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="ClassID" HeaderText="班级编号" SortExpression="ClassID" />
                    <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                    <asp:BoundField DataField="Birthday" HeaderText="出生日期" SortExpression="Birthday" />
                    <asp:CheckBoxField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                    <asp:BoundField DataField="Age" HeaderText="年龄" SortExpression="Age" />
                    <asp:BoundField DataField="Phone" HeaderText="电话号码" SortExpression="Phone" />
                    <asp:BoundField DataField="Hobby" HeaderText="爱好" SortExpression="Hobby" />
                    <asp:BoundField DataField="Address" HeaderText="地址" SortExpression="Address" />
                    <asp:BoundField DataField="Expr1" HeaderText="学号" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" />
                    <asp:BoundField DataField="ClassName" HeaderText="班级姓名" SortExpression="ClassName" />
                    <asp:TemplateField HeaderText="删除">
                        <ItemTemplate>
                        <asp:LinkButton runat="server" CommandName="Delete" OnClientClick="return confirm('确认删除？')">删除</asp:LinkButton>
                        </ItemTemplate>
                       </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.;Initial Catalog=StuInfo;User ID=sa;Password=123456;" DeleteCommand="DELETE FROM [Student] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Student] ([ID], [ClassID], [Name], [Birthday], [Sex], [Age], [Phone], [Hobby], [Address]) VALUES (@ID, @ClassID, @Name, @Birthday, @Sex, @Age, @Phone, @Hobby, @Address)" SelectCommand="SELECT Student.ID, Student.ClassID, Student.Name, Student.Birthday, Student.Sex, Student.Age, Student.Phone, Student.Hobby, Student.Address, ClassInfo.ClassID AS Expr1, ClassInfo.ClassName FROM Student INNER JOIN ClassInfo ON Student.ClassID = ClassInfo.ClassID" UpdateCommand="UPDATE [Student] SET [ClassID] = @ClassID, [Name] = @Name, [Birthday] = @Birthday, [Sex] = @Sex, [Age] = @Age, [Phone] = @Phone, [Hobby] = @Hobby, [Address] = @Address WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="ClassID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter DbType="Date" Name="Birthday" />
                    <asp:Parameter Name="Sex" Type="Boolean" />
                    <asp:Parameter Name="Age" Type="Int32" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Hobby" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ClassID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter DbType="Date" Name="Birthday" />
                    <asp:Parameter Name="Sex" Type="Boolean" />
                    <asp:Parameter Name="Age" Type="Int32" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Hobby" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
