<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="E_Learning_System.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server"> 
       <asp:LinkButton ID="linkWeb" runat="server" OnClick="linkWeb_Click">ASP.NET</asp:LinkButton>
    <table ID="Table2" runat="server" >
    <tr>
        <td>
            Title
        </td>
        <td> <asp:TextBox ID="nametxt" runat="server">asp.net</asp:TextBox></td>
    </tr>
     <tr>
        <td>
            Type
        </td>
        <td> <asp:TextBox ID="contacttxt" runat="server">High</asp:TextBox></td>
    </tr>
     <tr>
        <td>
            Start Date
        </td>
        <td> <asp:TextBox ID="coursetxt" runat="server">01/06/2021</asp:TextBox></td>
    </tr>
     <tr>
        <td>
            End Date
        </td>
        <td> <asp:TextBox ID="feetxt" runat="server">05/06/2021</asp:TextBox></td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnregister" runat="server" Text="Register"/>
        </td>

         </tr>

</table>
    </form>

</asp:Content>
