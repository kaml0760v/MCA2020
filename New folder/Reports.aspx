<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="E_Learning_System.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:GridView ID="GridView1" runat="server" CellPadding="1" ForeColor="#333333" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" /> 
            <Columns>

        <asp:BoundField DataField="Webinar_id" HeaderText="Webinar_id" />

        <asp:BoundField DataField="RegisterDate" HeaderText="Date" />
                </Columns>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />        

        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:GridView>
</asp:Content>

