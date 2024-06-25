<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Car.Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加车辆信息</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>车牌号</td>
                    <td>
                        <asp:TextBox ID="txtNum" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="车牌号必填" ControlToValidate="txtNum"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                    <td>业主</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="业主姓名必填" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                    <td>性别</td>
                    <td>
                        <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="男">男</asp:ListItem>
                            <asp:ListItem Value="女">女</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="性别必选" ControlToValidate="rblSex"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                    <td>电话</td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="电话号码必填" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                    <td>是否通过</td>
                    <td>
                        <asp:RadioButtonList ID="IsPass" runat="server" RepeatDirection="Horizontal">
                           <asp:ListItem  Value="1">通过</asp:ListItem>
                           <asp:ListItem  Value="0">不通过</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="是否通过必填" ControlToValidate="IsPass"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click"  />
                    </td>
                    <td>
                        <asp:Button ID="btnClear" runat="server" Text="清空" OnClick="btnClear_Click" style="height: 21px" />
                    </td>
                </tr>
            </table>
  
        </div>
    </form>
</body>
</html>
