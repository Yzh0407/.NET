<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication5.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>房源信息管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f5;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        .btnAdd {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
        }

            .btnAdd:hover {
                background-color: #45a049;
            }

        #GridView1 {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

            #GridView1 th {
                background-color: #4CAF50;
                color: white;
                text-align: left;
                padding: 10px;
            }

            #GridView1 td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

            #GridView1 tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #GridView1 tr:hover {
                background-color: #ddd;
            }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <h2>房源信息管理系统</h2>
            <asp:Button ID="btnAdd" runat="server" Text="添加房源" PostBackUrl="~/HouseAdd.aspx" CssClass="btnAdd" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="编号" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
                    <asp:BoundField DataField="LeaseMode" HeaderText="租赁方式" SortExpression="LeaseMode"></asp:BoundField>
                    <asp:BoundField DataField="Rent" HeaderText="租金" SortExpression="Rent"></asp:BoundField>
                    <asp:BoundField DataField="Contacts" HeaderText="联系人" SortExpression="Contacts"></asp:BoundField>
                    <asp:BoundField DataField="DepositMethod" HeaderText="押金方式" SortExpression="DepositMethod"></asp:BoundField>
                    <asp:BoundField DataField="Type" HeaderText="房屋类型" SortExpression="Type"></asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="详细地址" SortExpression="Address"></asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:TestConnectionString %>' ProviderName='<%$ ConnectionStrings:TestConnectionString.ProviderName %>' SelectCommand="select HouseInfo.ID,LeaseMode,Rent,Contacts,DepositMethod,Type,Address from HouseInfo
inner join HouseType on HouseInfo.HouseTypeID=HouseType.ID"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
