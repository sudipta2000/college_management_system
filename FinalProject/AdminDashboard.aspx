<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="FinalProject.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
        <link rel="stylesheet" href="stylesheets/StudentDashboard.css?val=1" type="text/css" />
    <script type="text/javascript">
        window.history.forward();
        function back() {
            window.history.forward();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    
    <div class="container">
       <asp:Button ID="btnDetails" runat="server" CssClass="btnDesign" Text="Student Details" OnClick="btnDetails_Click" />
       <asp:Button ID="btnQueryCheck" runat="server" CssClass="btnDesign" Text="View Queries" OnClick="btnQueryCheck_Click" />
        <asp:Button ID="btnLogout" runat="server" CssClass="btnDesign" Text="Logout" OnClientClick="back()" OnClick="btnLogout_Click" />
    </div>
      
</asp:Content>
