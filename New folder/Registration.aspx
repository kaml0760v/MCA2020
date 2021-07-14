<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="Registration.aspx.cs" Inherits="E_Learning_System.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            width: 459px;
        }
        .auto-style3 {
            width: 459px;
            height: 23px;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 459px;
            height: 30px;
        }
        .auto-style6 {
            height: 30px;
        }
        .auto-style7 {
            margin-top: 0px;
        }
        .auto-style8 {
            width: 459px;
            height: 25px;
        }
        .auto-style9 {
            height: 25px;
        }
    </style>
    <script type="text/javascript">
        function checkAggrement(sender, args) {
            if (document.getElementById("<%=chkterms.ClientID %>").checked == true) {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div>
            <table class="auto-style4">
                <tr>
                    <td class="auto-style1" colspan="2">
                        <h1 align="center">Registration</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                             <asp:Label ID="Label1" runat="server" Text="First name: " Font-Bold="True" ></asp:Label>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox ID="txtfirstname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfirstname" Display="Dynamic" ErrorMessage="*Please enter first name" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtfirstname" Display="Dynamic" ErrorMessage="*Name must contain only alphabets." ForeColor="Red" ValidationExpression="[a-zA-Z].+"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                            <asp:Label ID="Label2" runat="server" Text="Middle name: " Font-Bold="True"></asp:Label>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMiddlename" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                            <asp:Label ID="Label3" runat="server" Text="Last name: " Font-Bold="True"></asp:Label>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastname" Display="Dynamic" ErrorMessage="*Please enter last name" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLastname" Display="Dynamic" ErrorMessage="*Name must contain only alphabets." ForeColor="Red" ValidationExpression="[a-zA-Z].+"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                            <asp:Label ID="Label4" runat="server" Text="Mobile no: " Font-Bold="True"></asp:Label>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMobileno" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMobileno" Display="Dynamic" ErrorMessage="*Please enter Mobile number" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobileno" Display="Dynamic"
                            ErrorMessage="*Please enter 10 digit only" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <div align="right">
                            <asp:Label ID="Label5" runat="server" Text="Email Address: " Font-Bold="True"></asp:Label>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic"
                            ErrorMessage="*Please enter Email id" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                            ErrorMessage="*Invalid Email" ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <div align="right">
                            <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="Date of Birth: "></asp:Label>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtDOB" runat="server"  placeholder="Enter Date DD/MM/YYYY"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtDOB" Display="Dynamic"
                            ErrorMessage="*Please enter DOB" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                            <div align="right">
                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="
                                Adhar-card no: "></asp:Label>
                        </div></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtAdhar" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtAdhar" Display="Dynamic" 
                            ErrorMessage="*Please enter Adhar card number" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtAdhar" Display="Dynamic" 
                            ErrorMessage="*please enter valid Adharcard number" ForeColor="Red" ValidationExpression="^[0-9]{12}$"></asp:RegularExpressionValidator>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <div align="right">
                            <asp:Label ID="Label10" runat="server" Text="Address: " Font-Bold="True"></asp:Label>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress" 
                            Display="Dynamic" ErrorMessage="*Please enter your Address" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <div align="right">
                            <asp:Label ID="Label11" runat="server" Text="City: " Font-Bold="True"></asp:Label>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="drpDownCity" runat="server">
                            <asp:ListItem>Surat</asp:ListItem>
                            <asp:ListItem>Bardoli</asp:ListItem>
                            <asp:ListItem>Ahmedabad</asp:ListItem>
                            <asp:ListItem>Vadodara</asp:ListItem>
                            <asp:ListItem>Navsari</asp:ListItem>
                            <asp:ListItem>Valsad</asp:ListItem>
                            <asp:ListItem>Vapi</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="drpDownCity" Display="Dynamic"
                            ErrorMessage="*Please select your city" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <div align="right">
                            <asp:Label ID="Label12" runat="server" Text="Gender: " Font-Bold="True"></asp:Label>
                        </div>
                    </td>
                    <td class="auto-style1">
                        <asp:RadioButtonList ID="rdoGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="rdoGender" Display="Dynamic" 
                            ErrorMessage="*Please select your Gender" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                            <asp:Label ID="Label6" runat="server" Text="Username: " Font-Bold="True"></asp:Label>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtUsername" Display="Dynamic" 
                            ErrorMessage="*Please enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                            <asp:Label ID="Label7" runat="server" Text="Password: " Font-Bold="True"></asp:Label>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPassword"
                            Display="Dynamic" ErrorMessage="*Please enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPassword"
                            Display="Dynamic" ErrorMessage="*Invalid Password" ForeColor="Red" ToolTip="one number and one special character required." 
                            ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&amp;+=]).*$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <div align="right">
                            <asp:Label ID="Label8" runat="server" Text="Confirm Password: " Font-Bold="True"></asp:Label>
                        </div>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtConfirmPassword"
                            Display="Dynamic" ErrorMessage="*Please enter Confirm password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" 
                            ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="*Password Mismatch" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <div align="right">
                            <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Profile Picture: "></asp:Label>
                        </div>
                    </td>
                    <td class="auto-style6">
                        <asp:FileUpload ID="fileProfile" runat="server" />
                        <asp:Label ID="lblProfile" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <div align="right">
                            <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Identity Proof: "></asp:Label>
                        </div>
                    </td>
                    <td class="auto-style6">
                        <asp:FileUpload ID="fileIdentity" runat="server" />
                        <asp:Label ID="lblIdentity" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                            <div align="right">
                                <asp:Label ID="Label13" runat="server" Text="Qualification: " Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                    </td>
                    <td>
                        <asp:Button ID="btnQualification" runat="server" Text="Add Qualification" OnClick="btnQualification_Click" CssClass="auto-style7" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                                <asp:PlaceHolder ID="PlaceHolder1" runat="server" ></asp:PlaceHolder>
                        </div>
                        
                    </td>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                                <asp:PlaceHolder ID="PlaceHolder3" runat="server" ></asp:PlaceHolder>
                        </div>
                        </td>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolder6" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                                <asp:PlaceHolder ID="PlaceHolder4" runat="server" ></asp:PlaceHolder>
                        </div></td>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolder7" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <div align="right">
                                <asp:PlaceHolder ID="PlaceHolder5" runat="server" ></asp:PlaceHolder>
                        </div></td>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolder8" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        </td>
                    <td class="auto-style9">
                        <asp:CheckBox ID="chkterms" runat="server" Text="I accept the terms &amp; conditions." />
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="checkAggrement" Display="Dynamic"
                            ErrorMessage="Please accept Terms &amp; Conditons first." ForeColor="Red"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        </td>
                    <td class="auto-style9">
                        <asp:CheckBox ID="chkSub" runat="server" Text="Subscribe to our newsletter." />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        
                    </td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
