<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="FinalProject.WebForm5" %>
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

    <div class="container" style="padding-left:200px">
       <asp:Button ID="btnFormFillup" runat="server" CssClass="btnDesign" Text="Form Fillup" OnClick="btnFormFillup_Click" />
       <asp:Button ID="btnFormDownload" runat="server" CssClass="btnDesign" Text="Form Download" OnClick="btnFormDownload_Click" />
        <asp:Button ID="btnEditForm" runat="server" Text="Form Edit" CssClass="btnDesign" OnClick="btnEditForm_Click" />
        <asp:Button ID="btnQuery" runat="server" Text="Query/Complaint" CssClass="btnDesign" OnClick="btnQuery_Click" />
        <asp:Button ID="btnPassChange" runat="server" Text="Change Password" CssClass="btnDesign" OnClick="btnPassChange_Click" />
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btnDesign" OnClientClick="back()" OnClick="btnLogout_Click" />
    </div>
</asp:Content>
