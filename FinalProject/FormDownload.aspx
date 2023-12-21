<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="FormDownload.aspx.cs" Inherits="FinalProject.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 250px;
            /*padding-left:15px;*/
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
       
       
        .auto-style2 {
            width: 333px;
            /*padding-left:15px;*/
        }
       
       
    </style>
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
                <td class="auto-style1" colspan="2">
                    <asp:Label Text="Applicant's Name: *" runat="server"></asp:Label>
                </td>
                <td rowspan="4">
                    <asp:Image ID="imgPhotograph" runat="server" ImageUrl=""  Height="150px" Width="118px"/>
                    
                </td>
                
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                </td>
                
            </tr>


            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Label runat="server" Text="Father's Name: *"></asp:Label>
                </td>
                
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblFname" runat="server" Text=""></asp:Label>
                </td>
                
            </tr>

            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Label runat="server" Text="Mother's Name: *"></asp:Label>
                </td>
                <td>
                    <asp:Image ID="imgSignature" runat="server" ImageUrl="" Height="39px" Width="185px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMname" runat="server" Text=""></asp:Label>
                </td>
                
            </tr>

            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Label runat="server" Text="Communication Address: *"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" >
                    <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                </td>
                
            </tr>

            <tr>
                <td class="auto-style2">
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
                <td class="auto-style2">
                    <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                </td>
                <td >
                    <asp:Label ID="lblDOB" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMobile" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp; College *</td>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp; Course *</td>
                <td class="auto-style1">&nbsp;&nbsp;&nbsp; Last Examination Passed *</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblCollege" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblCourse" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLastExam" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                    Last Examination Board *
                </td >
                <td class="auto-style1">
                    &nbsp;&nbsp;&nbsp;
                    Total Marks obtainied *
                </td>
                <td class="auto-style1">
                    &nbsp;&nbsp;&nbsp;
                    Percentage of Marks/Grade/Division *
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblLastExamBoard" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMarks" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPercentage" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            </table>   
        <div>
            <asp:Button ID="btnDownload" runat="server" Text="Print" OnClientClick="window.print()" />
        </div>    
    </div>
</asp:Content>
