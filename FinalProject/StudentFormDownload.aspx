<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentFormDownload.aspx.cs" Inherits="FinalProject.StudentFormDownload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Form</title>
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
            border:3px solid gray;
            margin-top:25px;
            margin-bottom:45px;
            padding-bottom:20px;
            border-radius:5px;
            padding-top:10px;
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
            width:70px;
            border-radius:5px;
            font-family: 'Baskerville Old Face';
            align-content:center;
        }
       
       
        .auto-style2 {
            width: 333px;
            /*padding-left:15px;*/
        }
       
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                    <asp:Label Text="Applicant's Name: " runat="server"></asp:Label>
                </td>
                <td rowspan="4">
                    <asp:Image ID="imgPhotograph" runat="server" ImageUrl=""  Height="150px" Width="118px"/>
                    
                </td>
                
            </tr>
            <tr>
                <td colspan="2">
                    <%--<asp:TextBox ID="txtName" runat="server" ReadOnly="true" placeholder="Enter your Name" Width="1000px"></asp:TextBox>--%>
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                </td>
                
            </tr>


            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Label runat="server" Text="Father's Name: "></asp:Label>
                </td>
                
            </tr>
            <tr>
                <td colspan="2">
                    <%--<asp:TextBox ID="txtFathersName" runat="server" placeholder="Enter your father's name" Width="1000px"></asp:TextBox>--%>
                    <asp:Label ID="lblFname" runat="server" Text=""></asp:Label>
                </td>
                
            </tr>

            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Label runat="server" Text="Mother's Name: "></asp:Label>
                </td>
                <td>
                    <asp:Image ID="imgSignature" runat="server" ImageUrl="" Height="39px" Width="185px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%--<asp:TextBox ID="txtMothersName" runat="server" placeholder="Enter your mother's name" Width="1000px"></asp:TextBox>--%>
                    <asp:Label ID="lblMname" runat="server" Text=""></asp:Label>
                </td>
                
            </tr>

            <tr>
                <td class="auto-style1" colspan="2">
                    <asp:Label runat="server" Text="Communication Address: "></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" >
                    <%--<asp:TextBox ID="txtAddress" runat="server" placeholder="Enter your address" Width="1000px"></asp:TextBox>--%>
                    <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                </td>
                
            </tr>

            <tr>
                <td class="auto-style2">
                    <asp:Label Text="Gender: " runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" Text="Date of Birth: "></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" Text="Mobile no. "></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                  <%--<asp:RadioButtonList ID="radioGender" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                        <asp:ListItem Value="Male"></asp:ListItem>
                        
                        <asp:ListItem Value="Female"></asp:ListItem>
                    </asp:RadioButtonList>--%>
                    <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                </td>
                <td >
                    <%--<asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox>--%>
                    <asp:Label ID="lblDOB" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <%--<asp:TextBox ID="txtMobile" TextMode="Phone" runat="server"></asp:TextBox>--%>
                    <asp:Label ID="lblMobile" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"> College </td>
                <td class="auto-style1"> Course </td>
                <td class="auto-style1"> Last Examination Passed </td>
            </tr>
            <tr>
                <td class="auto-style2">
                   <%--<asp:TextBox ID="txtCollege" runat="server"></asp:TextBox>--%>
                    <asp:Label ID="lblCollege" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <%--<asp:TextBox ID="txtCourse" runat="server"></asp:TextBox>--%>
                    <asp:Label ID="lblCourse" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <%--<asp:TextBox ID="txtLastExamPass" runat="server"></asp:TextBox>--%>
                    <asp:Label ID="lblLastExam" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Last Examination Board 
                </td >
                <td class="auto-style1">
                    Total Marks obtainied 
                </td>
                <td class="auto-style1">
                    Percentage of Marks/Grade/Division 
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <%--<asp:TextBox ID="txtLastExamBoard" runat="server"></asp:TextBox>--%>
                    <asp:Label ID="lblLastExamBoard" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <%--<asp:TextBox ID="txtMarks" runat="server"></asp:TextBox>--%>
                    <asp:Label ID="lblMarks" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <%--<asp:TextBox ID="txtPercentage" runat="server"></asp:TextBox>--%>
                    <asp:Label ID="lblPercentage" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            </table>   
        <div>
            <center>
            <asp:Button CssClass="btn" ID="btnDownload" runat="server" Text="Print" OnClientClick="window.print()" />
            <asp:Button CssClass="btn" ID="btnBack" runat="server" Text="Dashboard" OnClick="btnBack_Click" />
                </center>
        </div>    
    </div>
    </div>
    </form>
</body>
</html>
