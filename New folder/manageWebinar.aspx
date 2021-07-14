<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="manageWebinar.aspx.cs" Inherits="E_Learning_System.manageWebinar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 201px;
        }
        .auto-style2 {
            width: 201px;
            height: 23px;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            width: 201px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <fieldset>
        <legend>Add Webinar or Workshop</legend>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style2">Select Type of Session:</td>
                <td class="auto-style3">
                    <asp:RadioButtonList ID="rdoSession" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Webinar</asp:ListItem>
                        <asp:ListItem>Workshop</asp:ListItem>
                    </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdoSession" Display="Dynamic" ErrorMessage="*Please select Session Type" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Title:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTitle" Display="Dynamic" ErrorMessage="*Please enter title" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Level:</td>
                <td>
                    <asp:DropDownList ID="drpLevel" runat="server">
                        <asp:ListItem Value="0" Text="Choose Your Division">--Select Level--</asp:ListItem>
                        <asp:ListItem>High</asp:ListItem>
                        <asp:ListItem>Low</asp:ListItem>
                        <asp:ListItem>Medium</asp:ListItem>
                    </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="drpLevel" Display="Dynamic" ErrorMessage="*Please select Level" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">From Date:</td>
                <td>
                    <asp:TextBox ID="txtFromdate" runat="server" placeholder=" DD/MM/YYYY " ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFromdate" Display="Dynamic" ErrorMessage="*Please enter start date" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">To Date:</td>
                <td>
                    <asp:TextBox ID="txtTodate" runat="server" placeholder=" DD/MM/YYYY "></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTodate" Display="Dynamic" ErrorMessage="*Please enter End date" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Description:</td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDescription" Display="Dynamic" ErrorMessage="*Please enter Session description" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Upload Banner:</td>
                <td>
                    <asp:FileUpload ID="fileBanner" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="fileBanner" Display="Dynamic" ErrorMessage="*Please select Banner Image" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </fieldset>
    </form>
</asp:Content>
