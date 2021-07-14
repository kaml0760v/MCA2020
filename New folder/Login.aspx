<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Learning_System.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 233px;
        }
        #form1{
            height:100%;
        }
    </style>
   
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
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtOTP" runat="server" align="left"></asp:TextBox>
                        <input type="button" onclick="genalert()" value="OTP" />
                        <script type ="text/javascript">
                            function genalert() {
                                var otp = (Math.floor(Math.random() * 10000) + 10000).toString().substring(1);
                                alert('OTP is ' + otp);
                                document.getElementById('<%= hiddenElement.ClientID %>').value = otp;
                            }
                        </script>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" align="left" OnClick="btnLogin_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblmsg" runat="server" align="left" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</asp:Content>
