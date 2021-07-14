<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="datewisewebinar.aspx.cs" Inherits="E_Learning_System.datewisewebinar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <asp:Calendar ID="datepicker" runat="server" Visible="false" OnSelectionChanged="datepicker_SelectionChanged"></asp:Calendar>
    From : <asp:TextBox ID="txtFromDate" runat="server"></asp:TextBox>
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">GetDate</asp:LinkButton>
    <div>
        <asp:Calendar ID="datepicker1" runat="server" Visible="false" OnSelectionChanged="datepicker1_SelectionChanged"></asp:Calendar>
    To : <asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
    <asp:LinkButton ID="LinkPickDate" runat="server" OnClick="LinkPickDate_Click">GetDate</asp:LinkButton>
    </div>
    <asp:Button ID="btnGenerate" runat="server" Text="Generate" OnClick="btnGenerate_Click" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELearningConnectionString %>" SelectCommand="SELECT [Title], [Type], [Level], [StartDate], [EndDate] FROM [tbl_Webinar] WHERE (([StartDate] &gt;= @StartDate) AND ([StartDate] &lt;= @StartDate2))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtFromDate" DbType="Date" Name="StartDate" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtToDate" DbType="Date" Name="StartDate2" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
