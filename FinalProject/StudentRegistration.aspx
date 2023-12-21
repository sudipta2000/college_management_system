<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="FinalProject.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 250px;
        }
        td{
            padding-top:15px;
        }
        table{
            padding-left:15px;
        }
        #applnID{
            background-image:linear-gradient(to right,#020024,#ff9eeb);
            width:600px;
            font-size:large;
            font-weight:bold;
            padding-bottom:15px;
            text-align:center;
            align-items:center;
            color:wheat;
        }
        table input{
            height:30px;
            padding-left:15px;
            border-radius:10px;
        }
        .btn{
            margin:15px;
            justify-content:space-between;
            height:30px;
            width:60px;
            border-radius:5px;
            font-family: 'Baskerville Old Face';
        }
       
       
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <script type="text/javascript">
          function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgPhotograph.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
                }
          }
        function SignPreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgSignature.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div>
        <table>
            <tr >
                <td colspan="3" id="applnID">
                   Application No- <asp:Label ID="lblAppln" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Applicant's Name: *" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:TextBox ID="txtName" runat="server" BackColor="Aqua" ReadOnly="true" placeholder="Enter your Name" Width="1000px"></asp:TextBox>
                </td>
            </tr>


            <tr>
                <td class="auto-style1">
                    <asp:Label runat="server" Text="Father's Name: *"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:TextBox ID="txtFathersName" runat="server" placeholder="Enter your father's name" Width="1000px" ></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFathersName" ErrorMessage="!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <asp:Label runat="server" Text="Mother's Name: *"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:TextBox ID="txtMothersName" runat="server" placeholder="Enter your mother's name" Width="1000px"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMothersName" ErrorMessage="!" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <asp:Label runat="server" Text="Communication Address: *"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" >
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter your address" Width="1000px"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" ErrorMessage="!" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Gender: *" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" Text="Date of Birth: *"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" Text="Mobile no. *"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="radioGender" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                        <asp:ListItem Value="Male"></asp:ListItem>
                        
                        <asp:ListItem Value="Female"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="radioGender" ErrorMessage="!" ForeColor="Red"></asp:RequiredFieldValidator>
                   
                </td>
                <td >
                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDOB" ErrorMessage="!" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:TextBox ID="txtMobile" TextMode="Phone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobile" ErrorMessage="!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ControlToValidate="txtMobile" ValidationExpression="[0-9]{10}" ForeColor="Red" ErrorMessage="Enter a 10 digit number" runat="server"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Photograph *"></asp:Label>
                </td>
                <td></td>
                <td>
                    <asp:Label runat="server" Text="Signature *"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:image  runat="server" ID="imgPhotograph"/>
                </td>
                <td></td>
                <td>
                    <asp:Image runat="server" ID="imgSignature" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:FileUpload ID="picture" CssClass="uploaded" onchange="ImagePreview(this)" runat="server" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="picture" ErrorMessage="!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td></td>
                <td>
                    <asp:FileUpload ID="signature" CssClass="uploaded" onchange="SignPreview(this)" runat="server" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="signature" ErrorMessage="!" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>College *</td>
                <td>Course *</td>
                <td>Last Examination Passed *</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddlCollege" runat="server"></asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCourse" runat="server"></asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="ddlExam" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Last Examination Board *
                </td>
                <td>
                    Total Marks obtainied *
                </td>
                <td>
                    Percentage of Marks/Grade/Division *
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="ddlBoard" runat="server"></asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txtMarks" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMarks" ErrorMessage="!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ControlToValidate="txtMarks" ValidationExpression="[0-9]{3}" ForeColor="Red" ErrorMessage="Max limit is 4 digit" runat="server"></asp:RegularExpressionValidator>
                     <%--<asp:RegularExpressionValidator runat="server" ValidationExpression="[0-9]" ControlToValidate="txtMarks" ErrorMessage="Enter valid number" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                </td>
                <td>
                    <asp:TextBox ID="txtPercentage" MaxLength="2" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPercentage" ErrorMessage="!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ControlToValidate="txtPercentage" ValidationExpression="[0-9]{2}" ForeColor="Red" ErrorMessage="Max limit is 2 digit" runat="server"></asp:RegularExpressionValidator>
                </td>
            </tr>
            </table>
            <div>
                <center>
                 <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" OnClick="btnSubmit_Click" OnClientClick="return confirm('You sure want to submit?')" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn" OnClick="btnReset_Click" OnClientClick="return confirm('You want to reset?')" CausesValidation="false" />
                 <asp:Button ID="btnBack" runat="server" Text="Dashboard" CssClass="btn" OnClick="btnBack_Click" OnClientClick="return confirm('Your sure want to go back?')" CausesValidation="false" />
                    </center>
               </div>
                    

        
    </div>
</asp:Content>
