<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="manage Learner.aspx.cs" Inherits="E_Learning_System.manage_Learner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 

        OnRowDataBound="GridView1_RowDataBound" CellPadding="4"  DataKeyNames="ID"

        OnSelectedIndexChanging="GridView1_SelectedIndexChanging" ForeColor="#333333">

        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />       

      <Columns>

        <asp:BoundField DataField="FName" HeaderText="Name" />
            
        <asp:BoundField DataField="Mobileno" HeaderText="Mobileno" />

        <asp:BoundField DataField="Email" HeaderText="Email" />

        <asp:BoundField DataField="Address" HeaderText="Address" />
        <asp:BoundField DataField="City" HeaderText="City" />
        <asp:BoundField DataField="subscription" HeaderText="subscription" />
        <asp:BoundField DataField="status" HeaderText="status" />
        <asp:TemplateField>

        <ItemTemplate>

        <asp:ImageButton ID="img_user" runat="server" CommandName="Select"

            ImageUrl='<%# Eval("status" ) %>' Width="20px" Height="20px" />

        </ItemTemplate>

        </asp:TemplateField>

      </Columns>     

        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />        

        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />

    </asp:GridView>
</form>

</asp:Content>
