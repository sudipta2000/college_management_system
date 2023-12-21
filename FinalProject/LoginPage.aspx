<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="FinalProject.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <link rel="stylesheet" type="text/css" href="stylesheets/studentLoginPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="loginform">
        <center>
        <div class="form">
            <h3>Student Login</h3>
            <div>
                <label>Email id</label>
                <asp:TextBox ID="txtEmail" placeholder="Email ID" CssClass="txtbox" runat="server" required=""></asp:TextBox>
            </div>
            <div>
                <label for="password">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="txtbox" TextMode="Password" placeholder="Password" required=""></asp:TextBox>
                <br />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
         
            <div>
                <asp:Button ID="btnLogin" runat="server" CssClass="btnSubmit" Text="Login" OnClick="btnLogin_Click" />
                <br />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Enter a valid email." ForeColor="Black"></asp:RegularExpressionValidator>
                <br />
                <span> Not a registered student?<a href="HomePage.aspx"> Sign Up</a></span>
                
            </div>
            
        </div>
            </center>
    </div>
</asp:Content>
