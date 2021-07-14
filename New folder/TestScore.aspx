<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TestScore.aspx.cs" Inherits="E_Learning_System.TestScore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">

   
        <div style="margin: 5px 0px 5px 10px;">
            Select Webinar or Workshop : 
            <asp:DropDownList ID="DropDownList1" Width="150" runat="server">
            </asp:DropDownList>
            <asp:Button ID="btnGenerate" runat="server" Text="Generate Score Entry" OnClick="btnGenerate_Click" />
        </div>
 
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript">
    var pageIndex = 0;
    var pageCount;
    $(window).scroll(function () {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            GetRecor    ds();
        }
    });
    $(function () {
        GetRecords();
    });
    function GetRecords() {
        pageIndex++;
        if (pageIndex == 1 || pageIndex <= pageCount) {
            $("#loader").show();
            $.ajax({
                type: "POST",
                url: "CS.aspx/GetImages",
                data: '{pageIndex: ' + pageIndex + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.responseText);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }
    }
    function OnSuccess(response) {
        var xmlDoc = $.parseXML(response.d);
        var xml = $(xmlDoc);
        pageCount = parseInt(xml.find("PageCount").eq(0).find("PageCount").text());
        var images = xml.find("LearnerRegistration");
        var repeatColumns = parseInt("<%=dlImages.RepeatColumns == 0 ? 1 : dlImages.RepeatColumns %>");
        var rowCount = Math.ceil(images.length / repeatColumns);
        var j = 0;
        images.each(function () {
            var image = $(this);
            var row = $("[id*=dlImages] .item:last").closest("tr");
            if ($(".is_used[value='1']", row).length == repeatColumns) {
                row = $("[id*=dlImages] tr").eq(0).clone();
                
                $(".image", row).attr("src", "");
                $("[id*=dlImages]").append(row);
                j = 0;
            } else {
                row = $("[id*=dlImages] .item:last").closest("tr");
            }
            var cell = $(".item", row).eq(j);
            $(".name", cell).html(image.find("Fname").text());
            //$(".button", cell).attr("href", image.find("Url").text());
            //$(".is_used", cell).attr("value", "1");
            var img = $(".image", cell);
            var loader = $("<img class = 'loader' src = 'loader.gif' />");
            img.after(loader);
            img.hide();
            img.attr("src", image.find("Profile").text());
            img.load(function () {
                $(this).parent().find(".loader").remove();
                $(this).fadeIn();
            });
            j++;
        });
        $("[id*=dlImages] .is_used[value='0']").closest(".item").remove();
    }
        </script>
        <div>
            <asp:DataList ID="dlImages" runat="server" RepeatLayout="Table" RepeatColumns="1"
                CellPadding="2" CellSpacing="20">
                <ItemTemplate>
                    <table class="item" border="0">
                        <tr>
                            <td>
                                <img class="image" src='<%# Eval("Profile") %>' alt="" />
                                <%--<asp:Image ID="profileimage"  ImageUrl="<%# Eval("Profile") %>" runat="server" Width="100px" Height="100px" />--%>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="name">
                        <%# Eval("Fname") %></span>
                                <%--<asp:Label Text='<%# Eval("Fname") %>' CssClass="name" runat="server" />--%>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
        </form>
</asp:Content>
