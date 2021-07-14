<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TopFive.aspx.cs" Inherits="E_Learning_System.TopFive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Top five city of Learner's</h3>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" CellPadding="5" ForeColor="#333333"  >
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" /> 
             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />        

        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:GridView>
    </form>
</asp:Content>
