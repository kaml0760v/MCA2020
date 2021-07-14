<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebinarDetails.aspx.cs" Inherits="E_Learning_System.WebinarDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />  
                    Type:
                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                    <br />
                    Level:
                    <asp:Label ID="LevelLabel" runat="server" Text='<%# Eval("Level") %>' />
                    <br />
                    StartDate:
                    <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
                    <br />
                    EndDate:
                    <asp:Label ID="EndDateLabel" runat="server" Text='<%# Eval("EndDate") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    bannerImage:
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#Eval("bannerImage") %>' Height="100" Width="200" 
                                    />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELearningConnectionString %>" SelectCommand="SELECT [Title], [Type], [Level], [StartDate], [EndDate], [Description], [bannerImage] FROM [tbl_Webinar] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Id" QueryStringField="Title" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
