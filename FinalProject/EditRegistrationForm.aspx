<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="EditRegistrationForm.aspx.cs" Inherits="FinalProject.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 250px;
        }

        td {
            padding-top: 15px;
        }

        table {
            padding-left: 15px;
        }

        #applnID {
            background-image: linear-gradient(to right,#020024,#ff9eeb);
            width: 600px;
            font-size: large;
            font-weight: bold;
            padding-bottom: 15px;
            text-align: center;
            align-items: center;
            color: wheat;
        }

        table input {
            height: 30px;
            padding-left: 15px;
            border-radius: 10px;
        }

        .btn {
            margin: 15px;
            justify-content: space-between;
            height: 30px;
            width: 70px;
            border-radius: 5px;
            font-family: 'Baskerville Old Face';
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="3" id="applnID">Application No-
                    <asp:Label ID="lblAppln" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Applicant's Name: " runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:TextBox ID="txtName" runat="server" ReadOnly="true" BackColor="Aqua" placeholder="Enter your Name" Width="1000px"></asp:TextBox>
                </td>
            </tr>


            <tr>
                <td class="auto-style1">
                    <asp:Label runat="server" Text="Father's Name: *"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:TextBox ID="txtFathersName" runat="server" placeholder="Enter your father's name" Width="1000px"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFathersName" ErrorMessage="Cant't be blank" ForeColor="Red"></asp:RequiredFieldValidator>

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
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMothersName" ErrorMessage="Cant't be blank" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <asp:Label runat="server" Text="Communication Address: *"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter your address" Width="1000px"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" ErrorMessage="Cant't be blank" ForeColor="Red"></asp:RequiredFieldValidator>

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
                </td>
                <td>
                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDOB" ErrorMessage="Cant't be blank" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:TextBox ID="txtMobile" TextMode="Number" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobile" ErrorMessage="Cant't be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ControlToValidate="txtMobile" ValidationExpression="[0-9]{10}" ForeColor="Red" ErrorMessage="Enter a 10 digit number" runat="server"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>College *</td>
                <td>Course *</td>
                <td>Last Examination Passed *</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtCollege" ReadOnly="true" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtCourse" ReadOnly="true" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtLastExamPass" ReadOnly="true" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Last Examination Board *
                </td>
                <td>Total Marks obtainied *
                </td>
                <td>Percentage of Marks/Grade/Division *
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtLastExamBoard" ReadOnly="true" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtMarks" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMarks" ErrorMessage="Cant't be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ControlToValidate="txtMarks" ValidationExpression="[0-9]{3}" ForeColor="Red" ErrorMessage="Max limit is 4 digit" runat="server"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:TextBox ID="txtPercentage" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPercentage" ErrorMessage="Cant't be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ControlToValidate="txtPercentage" ValidationExpression="[0-9]{2}" ForeColor="Red" ErrorMessage="Max limit is 2 digit" runat="server"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <div>
            <center>
                 <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn"  OnClick="btnUpdate_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn" OnClick="btnReset_Click" CausesValidation="false" OnClientClick="return confirm('You sure want to reset?')" />
                 <asp:Button ID="btnBack" runat="server" Text="Dashboard" CssClass="btn" OnClick="btnBack_Click" CausesValidation="false"/>
                    </center>
        </div>



    </div>
</asp:Content>
