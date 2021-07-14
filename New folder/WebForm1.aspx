<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="E_Learning_System.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .table{
            background-color: #F7F7F7;  
            color: #333;  
            border:2px solid black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="2" CellSpacing="3"  >
                <ItemTemplate>
                    <table class="table">
                        <tr>
                            <th colspan="2" align="center">
                                <b>
                                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                                </b>
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                              
                                   
                               <asp:HyperLink ID="TitleLabel" runat="server" Text='<%# Eval("Title")  %>' Font-Underline="False" 
                                   NavigateUrl='<%#"WebinarDetails.aspx?Title="+Eval("Title")%>'/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                             
                                   <asp:Label ID="LevelLabel" runat="server" Text='<%# Eval("Level") %>' />
                               
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                             
                                  <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' /> TO
                                    <asp:Label ID="EndDateLabel" runat="server" Text='<%# Eval("EndDate") %>' />
                               
                            </td>
                        </tr>
                        <tr>
                             <td >
                                 <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#Eval("bannerImage") %>' Height="100" Width="200" 
                                     PostBackUrl='<%#"WebinarDetails.aspx?Title="+Eval("Title") %>'/>
                                 
                             </td>
                        </tr>
                         
                                 <asp:Button ID="Button1" runat="server" Text="Click to Register" />
                                
                    </table>
                   
                  
                 
                </ItemTemplate>
                    
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELearningConnectionString %>" SelectCommand="SELECT [Title], [Type], [Level], [StartDate], [EndDate], [bannerImage] FROM [tbl_Webinar]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
