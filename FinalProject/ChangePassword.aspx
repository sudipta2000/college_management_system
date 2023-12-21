<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="FinalProject.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 72px;
        }
        .auto-style2 {
            width: 405px;
            font-size:larger;
            color:whitesmoke;
        }
        .btn{
            margin:15px;
            justify-content:space-between;
            height:35px;
            width:100px;
            border-radius:5px;
            font-family: 'Baskerville Old Face';
        }
        .txtBox{
            height:30px;
            width:200px;
            border-radius:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <center>
    <div style="height: 507px;padding-top:50px; background-color:#804674">
        <table style="height: 172px; width: 462px">
            <tr>
                <td class="auto-style2">
                    Enter your old password:
                </td>
               
                <td>
                    <asp:TextBox ID="txtOldPass" CssClass="txtBox" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOldPass" ErrorMessage="* Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td class="auto-style2">
                    Enter your new password:
                </td>
                <td>
              
                    <asp:TextBox ID="txtNewPass" CssClass="txtBox" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNewPass" ErrorMessage="* Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td class="auto-style2">
                    Confirm your new password:
                </td>
            
                <td>
                    <asp:TextBox ID="txtConPass" CssClass="txtBox" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConPass" ErrorMessage="* Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ControlToValidate="txtConPass" ControlToCompare ="txtNewPass" ErrorMessage="Password must be same" ForeColor="Yellow"></asp:CompareValidator>
                    
                </td>
            </tr>
        </table>
        <div>
        <div>
            <asp:Button ID="btnChangePass" runat="server" CssClass="btn" Text="Change Password" OnClick="btnChangePass_Click" />
            <asp:Button ID="btnback" runat="server" Text="Dashboard" CssClass="btn" OnClick="btnback_Click" CausesValidation="false" />
        </div>
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        </div>
    </div>
        </center>
</asp:Content>
