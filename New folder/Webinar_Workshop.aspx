<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Webinar_Workshop.aspx.cs" Inherits="E_Learning_System.Webinar_Workshop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
         <div>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="2" CellSpacing="3" OnItemDataBound="DataList1_ItemDataBound" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand"  >
                <ItemTemplate>
                    <table class="table">
                        <tr>
                            <th colspan="2" >
                                <b>
                                    <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                                </b>
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2" >
                              
                                   
                               <asp:HyperLink ID="TitleLabel" runat="server" Text='<%# Eval("Title")  %>' Font-Underline="False" 
                                   NavigateUrl='<%#"WebinarDetails.aspx?Title="+Eval("Id")%>'/>
                            </td>
                        </tr>
                        <tr>
                            <td >
                             
                                   <asp:Label ID="LevelLabel" runat="server" Text='<%# Eval("Level") %>' />
                               
                            </td>
                            <td  >
                             
                                   <asp:Label ID="LabelID" runat="server" Text='<%# Eval("Id") %>' />
                               
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" >
                             
                                  <asp:Label ID="StartDateLabel" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "[StartDate]", "{0:dd/MM/yyyy}") %>' /> TO
                                    <asp:Label ID="EndDateLabel" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"[EndDate]","{0:dd/MM/yyyy}") %>' />
                               
                            </td>
                        </tr>
                        <tr>
                             <td >
                                 <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#Eval("bannerImage") %>' Height="100" Width="200" 
                                     PostBackUrl='<%#"WebinarDetails.aspx?Title="+Eval("Id") %>'/>
                                 
                             </td>
                        </tr>
                         <td></td>


                        <td> <asp:Button ID="Button1" runat="server" Text="Click to Register" CommandName="Register" CommandArgument='<%#Eval("Id") %>' /></td>
                                 
                                
                    </table>
                   
                  
                 
                </ItemTemplate>
                    
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELearningConnectionString %>" SelectCommand="SELECT [Title], [Type], [Level], [StartDate], [EndDate], [bannerImage], [Id] FROM [tbl_Webinar]"></asp:SqlDataSource>
        </div>
      
</asp:Content>

