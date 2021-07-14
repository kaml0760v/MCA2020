<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SessionEntry.aspx.cs" Inherits="E_Learning_System.SessionEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="jQuery/jquery-3.6.0.min.js"></script>
    <%--<script type="text/javascript">
        $(document).ready(function () {
            $('#GO').click(function () {
                var table = $(this).closest('table');
                if (table.find('input:text').length < 50) {
                    var x = $(this).closest('tr').nextAll('txr');
                    $.each(x, function (i, val) {
                        val.remove();
                    });
                    table.append('<tr class='data-contact-person'><td>session title :</td ><td><input type="text" class="input" id="current Name" value=""></td >'+
                        '<td>session date :</td > <td><input type="text" class="input" id="current Name" value=""></td >' +
                        '<td>session time :</td ><td><input type="text" class="input" id="current Name" value=""></td >'+
                        '<td>session Speaker : </td ><td><input type="text" class="input" id="current Name" value=""></td ></tr > ')
                    $.each(x, function (i, val) {
                        table.append(val);
                    });
                }
            });
        });
    </script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            load();
        });
        function load() {
            $('#txtnumber').focus();
            $('#GO').click(function () {
                $('#txtnumber').empty();
                var NoOfrecord = $('#txtnumber').val();
                if (NoOfrecord > 0) {
                    createControl(NoOfrecord);
                }
            });
        }
        function createControl(NoOfrecord) {
            var tbl = "";
            tbl = "<table class='table table-bordered table-hover'>" +
                "<tr>" +
                "<th> S.No </th>" +
                "<th> Session Title </th>" +
                "<th> Session date </th>" +
                "<th> Session time </th>" +
                "<th> Speaker </th>" +
                "</tr>";
            for (i = 1; i <= NoOfrecord; i++) {
                tbl += "<tr class='data-contact-person'>" +
                    "<td>" + i + "</td>" +

                    "<td>" +
                    "<input type='text' class='input' name='txtTitle' id='txtTitle' placeholder='Title' autofocus />" +
                    "</td>" +

                    "<td>" +
                    "<input type='text' class='input' name='txtDate' id='txtDate' placeholder='Date' />" +
                    "</td>" +
                    "<td>" +
                    "<input type='text' class='input' name='txtTime' id='txtTime' placeholder='Time' />" +
                    "</td>" +
                    "<td>" +
                    "<input type='text' class='input' name='txtName' id='txtName' placeholder='Speaker name' />" +
                    "</td>" +
                    
                   
                    "</tr>";
            }
            tbl += "<tr><td><input type='button' id='btnSubmit' value='Submit' 'onclick='getTextValue()'/></td></tr>";
            tbl += "</table>";

            $("#AddControll").append(tbl);
        }
        function getAllData() {
            var data = [];
            $('tr.data-contact-person').each(function () {
                var title = $(this).find('txtTitle').val();
                var date = $(this).find('txtDate').val();
                var time = $(this).find('txtTime').val();
                var name = $(this).find('txtName').val();
                var alldata = {
                    'title': title,
                    'date': date,
                    'time': time,
                    'name': name
                }
                data.push(alldata);
            });
            console.log(data);
            return data;
        }
        $('#btnSubmit').click(function () {
            var data = JSON.stringify(getAllData());
            $.ajax({
                url: 'SessionEntry.aspx/SaveData',//Home.aspx is the page   
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ 'Sessiondata': data }),
                success: function () {
                    alert("Data Added Successfully");
                },
                error: function () {
                    alert("Error while inserting data");
                }
            }); 
        })

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table border="0" cellspacing="2">
            <tr>
                <td><label id="lblNoOfRec"> Enter the number of session </label>
                </td>
                <td>
                    <input type="text" id="txtnumber" />
                    &nbsp;&nbsp;&nbsp;
            <input type="button" value="GO" id="GO" />

                </td>
            </tr>
            
        </table>
        <div id="AddControll">

        </div>

    </form>
</asp:Content>
