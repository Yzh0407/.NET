<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication4.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        #form1 {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .btnAdd {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }

            .btnAdd:hover {
                background-color: #45a049;
            }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

            .gridview th, .gridview td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
            }

            .gridview th {
                background-color: #4CAF50;
                color: white;
            }

            .gridview tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .gridview tr:hover {
                background-color: #ddd;
            }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px 0;
            color: #fff;
            background-color: #5cb85c;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>公司人员管理系统</h2>
            <%-- 别忘记声明DataKeyNames --%>
            <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="EmpID" DataSourceID="SqlDataSource1" ID="EmpInfoGridView" AllowPaging="True" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="EmpID" HeaderText="员工编号" ReadOnly="True" />
                    <asp:BoundField DataField="EmpName" HeaderText="员工姓名" />
                    <asp:BoundField DataField="EmpSex" HeaderText="员工性别" />
                    <asp:BoundField DataField="Status" HeaderText="员工状态" />
                    <asp:BoundField DataField="Tel" HeaderText="手机号码" />
                    <asp:BoundField DataField="DName" HeaderText="所在部门" />
                    <asp:BoundField DataField="Remark" HeaderText="备注" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkBtn1" runat="server" CssClass="btn" CommandName="Delete" OnClientClick="return confirm('是否确认删除？')">删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>"
                DeleteCommand="DELETE FROM [EmpInfo] WHERE [EmpID] = @EmpID"
                InsertCommand="INSERT INTO [EmpInfo] ([EmpName], [EmpSex], [Status], [Tel], [Did], [Remark]) VALUES (@EmpName, @EmpSex, @Status, @Tel, @Did, @Remark)"
                SelectCommand="SELECT EmpInfo.EmpID, EmpInfo.EmpName, EmpInfo.EmpSex, EmpInfo.Status, EmpInfo.Tel, DeptInfo.DName AS DName, EmpInfo.Remark FROM EmpInfo JOIN DeptInfo ON EmpInfo.Did = DeptInfo.Did"
                UpdateCommand="UPDATE [EmpInfo] SET [EmpName] = @EmpName, [EmpSex] = @EmpSex, [Status] = @Status, [Tel] = @Tel, [Did] = @Did, [Remark] = @Remark WHERE [EmpID] = @EmpID" ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>">
                <DeleteParameters>
                    <asp:Parameter Name="EmpID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmpName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="EmpSex" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Status" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Tel" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Did" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Remark" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EmpName" Type="String"></asp:Parameter>
                    <asp:Parameter Name="EmpSex" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Status" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Tel" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Did" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Remark" Type="String"></asp:Parameter>
                    <asp:Parameter Name="EmpID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="btnAdd" runat="server" Text="办理员工入职" PostBackUrl="~/AddEmp.aspx" CssClass="btnAdd" />
        </div>
    </form>
</body>
</html>

