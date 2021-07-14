<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SessionDetail.aspx.cs" Inherits="E_Learning_System.SessionDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">  
            <h2>Basic Table</h2>  
            <table class="table" id="maintable">  
                <thead>  
                    <tr>  
                        <th>Firstname</th>  
                        <th>Lastname</th>  
                        <th>Email</th>  
                    </tr>  
                </thead>  
                <tbody>  
                    <tr class="data-contact-person">  
                        <td>  
                            <input type="text" name="f-name" class="form-control f-name01" /></td>  
                        <td>  
                            <input type="text" name="l-name" class="form-control l-name01" /></td>  
                        <td>  
                            <input type="text" name="email" class="form-control email01" /></td>  
                        <td>  
                            <button type="button" id="btnAdd" class="btn btn-xs btn-primary classAdd">Add More</button>  
                        </td>  
                    </tr>  
                </tbody>  
            </table>  
            <button type="button" id="btnSubmit" class="btn btn-primary btn-md pull-right btn-sm">Submit</button>  
        </div>  
</asp:Content>
