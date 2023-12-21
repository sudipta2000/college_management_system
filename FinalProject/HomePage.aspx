<%@ Page Title="College Portal" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="FinalProject.WebForm1" %>

<asp:Content ID="contentHead" ContentPlaceHolderID="mainContentHead" runat="server">
    <link type="text/css" rel="stylesheet" href="stylesheets/HomePage.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="main-container">
        <div class="info">
            <div class="signUpform">
                <div class="formContent">
                    <div class="signup">
                        <div class="huh">
                            <label>Admission open!! Sign up and book your seat...</label>
                            
                            <asp:TextBox ID="txtName" runat="server" placeholder="Name" required=""></asp:TextBox>
                            <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Can't be blank" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                            <asp:TextBox ID="txtMail" runat="server" placeholder="Email ID" required=""></asp:TextBox>
                            <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txtMail" ErrorMessage="Can't be blank" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                            <asp:TextBox ID="txtPassword" MaxLength="10" runat="server" placeholder="Password" TextMode="Password" required=""></asp:TextBox>
                            <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Can't be blank" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                            <asp:TextBox ID="txtConpassword" MaxLength="10" runat="server" placeholder="Confirm Password" TextMode="password" required=""></asp:TextBox>
                            <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txtConpassword" ErrorMessage="Can't be blank" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                            <asp:Button ID="btnSignUp" CssClass="btnSubmit" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" />
                            <span id="login-switch">Already signed up? <a href="LoginPage.aspx"> Log In</a></span>
                            
                            <br />
                            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                            <asp:CompareValidator ControlToValidate="txtConpassword" ControlToCompare="txtPassword" runat="server" ErrorMessage="Password not matched" ForeColor="Red"></asp:CompareValidator>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtMail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Enter a valid email." ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
