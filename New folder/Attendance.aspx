<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="E_Learning_System.Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div style="margin: 5px 0px 5px 10px;">
            Select Webinar or Workshop :
    <asp:DropDownList ID="DropDownList1" Width="150" runat="server" >
    </asp:DropDownList>

            <asp:Button ID="btnGet" runat="server" OnClick="btnGet_Click" Text="Submit" />

        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"   
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"   
            CellPadding="4" ForeColor="Black" GridLines="Vertical">  
            <AlternatingRowStyle BackColor="White" />  
            <Columns>  
                <asp:TemplateField HeaderText="ID">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Name">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Fname") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Mobile">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MobileNo") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Attendence">  
                    <EditItemTemplate>  
                        <asp:CheckBox ID="CheckBox1" runat="server" />  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:CheckBox ID="CheckBox1" runat="server" />  
                    </ItemTemplate>  
                </asp:TemplateField>  
            </Columns>  
            <FooterStyle BackColor="#CCCC99" />  
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />  
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />  
            <RowStyle BackColor="#F7F7DE" />  
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />  
            <SortedAscendingCellStyle BackColor="#FBFBF2" />  
            <SortedAscendingHeaderStyle BackColor="#848384" />  
            <SortedDescendingCellStyle BackColor="#EAEAD3" />  
            <SortedDescendingHeaderStyle BackColor="#575357" />  
        </asp:GridView>  
      
        <br />  
      
    </div>  
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click"   
        Text="Save" />  
    </form>
</asp:Content>
