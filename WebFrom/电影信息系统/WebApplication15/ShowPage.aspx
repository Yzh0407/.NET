<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowPage.aspx.cs" Inherits="WebApplication15.ShowPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>电影展示</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 8px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        img {
            max-width: 100px;
            height: auto;
        }

        video {
            max-width: 200px;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>电影展示</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="movie_id">
            <Columns>
                <asp:BoundField DataField="title" HeaderText="电影名称" SortExpression="title" />
                <asp:BoundField DataField="director" HeaderText="导演" SortExpression="director" />
                <asp:BoundField DataField="actors" HeaderText="主演" SortExpression="actors" />
                <asp:BoundField DataField="description" HeaderText="简介" SortExpression="description" />
                <asp:TemplateField HeaderText="封面">
                    <ItemTemplate>
                        <img src='<%# ResolveUrl(Eval("cover_path").ToString()) %>' alt="封面" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="视频资源">
                    <ItemTemplate>
                        <video controls>
                            <source src='<%# ResolveUrl(Eval("movie_path").ToString()) %>' type="video/mp4">
                            您的浏览器不支持HTML5视频。
                        </video>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
