<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="AdminLoginPage.aspx.cs" Inherits="FinalProject.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <link rel="stylesheet" type="text/css" href="stylesheets/adminLoginPage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <div class="loginform">
        <center>
        <div class="form">
            <h3>Admin Login</h3>
            <div>
                <label for="username">Username</label>
                <asp:TextBox ID="txtUserName" placeholder="UserName" CssClass="txtbox" required="" runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserName" ErrorMessage="Can't be blank" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            </div>
            <div>
                <label for="password">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="txtbox" TextMode="Password" required="" placeholder="Password"></asp:TextBox>
                
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>

            <div>
                <asp:Button ID="btnLogin" runat="server" CssClass="btnSubmit" Text="Login" OnClick="btnLogin_Click" />
            </div>
        </div>
            </center>
    </div>
</asp:Content>
