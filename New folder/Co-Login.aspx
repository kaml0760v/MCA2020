<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Co-Login.aspx.cs" Inherits="E_Learning_System.Co_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div align="center">
             <input type="hidden" id="hiddenElement" name="hiddenElement" runat="server" />
            <table style="width:50%;">
                <tr>
                    <td colspan="2"><h1>Login</h1></td>
                </tr>
                <tr>
                    <td class="auto-style1"><div align="left">
                        Username
                        </div></td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" align="left"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUsername" Display="Dynamic" 
                            ErrorMessage="*Username is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <div align="left">
                            Password
                        </div>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" align="left" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" align="left" OnClick="btnLogin_Click" />
                    </td>
                </tr>
                </table>
        </div>
    </form>
</asp:Content>
