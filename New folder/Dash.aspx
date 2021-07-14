<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dash.aspx.cs" Inherits="E_Learning_System.Dash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
       
        .auto-style1 {
            height: 42px;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
       
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1" colspan="2" >
                        <div align="center">
            <asp:Label ID="lblWelcome" runat="server" Text="Welcome, "></asp:Label>
                            <br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </div>
                    </td>
                </tr>
                <tr>
                    <td >
                        &nbsp;</td>
                    <td><div align="right">
                                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"/>
                        </di>
          
                    </td>
                </tr>
                <tr>
                    <td >&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
