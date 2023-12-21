<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="AdminAccessPage.aspx.cs" Inherits="FinalProject.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <style>
        .header{
            font-size:x-large;
        }
        .txtBox{
            width:180px;
            height:30px;
            border-radius:8px;
            padding-left:15px;
            margin:0 15px 0 15px ;
        }
        .btn{
            height:30px;
            width:60px;
            border-radius:5px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div style="height:557px">
    <div style="padding-top:20px; padding-bottom:10px;">
        <center>
        <asp:Label ID="lblHeader" runat="server" Text="Student Details:-" CssClass="header"></asp:Label>
            </center>
    </div>
    <div style="margin-top:25px; margin-bottom:25px">
        <asp:GridView ID="gridViewAdmin" runat="server" AutoGenerateColumns="False" DataKeyNames="APPLN_ID" OnPageIndexChanging="gridViewAdmin_PageIndexChanging" PageSize="5" AllowPaging="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="gridViewAdmin_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowEditing="GridView1_RowEditing" CellPadding="4" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Update" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('You sure To delete?')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="ApplicationID">
                    <ItemTemplate>
                        <asp:Label ID="lblApplnID" runat="server" Text='<%#Eval("APPLN_ID") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="lblApplnID" runat="server" Text='<%#Eval("APPLN_ID") %>'></asp:Label>
                        <%--<asp:TextBox ID="txtApplnID" ReadOnly="true" runat="server" Text='<%#Eval("APPLN_ID") %>'></asp:TextBox>--%>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Applicant's Name">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("APPLN_NAME") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("APPLN_NAME") %>' ReadOnly="true" BackColor="Aqua"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Father's Name">
                    <ItemTemplate>
                        <asp:Label ID="lblFname" runat="server" Text='<%#Eval("APPLN_FNAME") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFname" runat="server" Text='<%#Eval("APPLN_FNAME") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFname" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Mother's Name">
                    <ItemTemplate>
                        <asp:Label ID="lblMname" runat="server" Text='<%#Eval("APPLN_MNAME") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMname" runat="server" Text='<%#Eval("APPLN_MNAME") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMname" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("APPLN_ADD") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%#Eval("APPLN_ADD") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <asp:Label ID="lblGender" runat="server" Text='<%#Eval("APPLN_GENDER") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGender" runat="server" Text='<%#Eval("APPLN_GENDER") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGender" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="DOB">
                    <ItemTemplate>
                        <asp:Label ID="lblDOB" runat="server" Text='<%#Eval("APPLN_DOB") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" Text='<%#Eval("APPLN_DOB") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Mobile No.">
                    <ItemTemplate>
                        <asp:Label ID="lblMobileNo" runat="server" Text='<%#Eval("APPLN_MOB") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMobileNo" runat="server" Text='<%#Eval("APPLN_MOB") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="txtMobileNo" ValidationExpression="[0-9]{10}" ForeColor="Yellow" ErrorMessage="Enter a 10 digit number" runat="server"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobileNo" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="College Code">
                    <ItemTemplate>
                        <asp:Label ID="lblCollege" runat="server" Text='<%#Eval("APPLN_COLCD") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCollege" runat="server" Text='<%#Eval("APPLN_COLCD") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCollege" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Course Code">
                    <ItemTemplate>
                        <asp:Label ID="lblCourse" runat="server" Text='<%#Eval("APPLN_CRSCD") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCourse" runat="server" Text='<%#Eval("APPLN_CRSCD") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCourse" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Fees">
                    <ItemTemplate>
                        <asp:Label ID="lblFees" runat="server" Text='<%#Eval("APPLN_FEES") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFees" runat="server" Text='<%#Eval("APPLN_FEES") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFees" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Last Exam">
                    <ItemTemplate>
                        <asp:Label ID="lblLastExam" runat="server" Text='<%#Eval("APPLN_LAST_EXAM") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLastExam" runat="server" Text='<%#Eval("APPLN_LAST_EXAM") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastExam" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Last Exam Board">
                    <ItemTemplate>
                        <asp:Label ID="lblLastBoard" runat="server" Text='<%#Eval("APPLN_LAST_BOARD") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLastBoard" runat="server" Text='<%#Eval("APPLN_LAST_BOARD") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastBoard" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Last Exam Marks">
                    <ItemTemplate>
                        <asp:Label ID="lblMarks" runat="server" Text='<%#Eval("APPLN_LAST_OBTM") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMarks" runat="server" Text='<%#Eval("APPLN_LAST_OBTM") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMarks" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Percentage">
                    <ItemTemplate>
                        <asp:Label ID="lblPercentage" runat="server" Text='<%#Eval("APPLN_PERCTG") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPercentage" runat="server" Text='<%#Eval("APPLN_PERCTG") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPercentage" ErrorMessage="Can't be blank" ForeColor="Yellow"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Student UserID">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("APPLN_FILLED_BY") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="lblUserID" runat="server" Text='<%#Eval("APPLN_FILLED_BY") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="TimeStamp">
                    <ItemTemplate>
                        <asp:Label  runat="server" Text='<%#Eval("FILLUP_TIMESTAMP") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="lblTime" runat="server" Text='<%#Eval("FILLUP_TIMESTAMP") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
            <h1 style="font-family:'Baskerville Old Face'; padding-left:20px">No active registered student !!</h1>
        </EmptyDataTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    
</div>
    <div>
        <center>
            <a href="AdminDashboard.aspx" runat="server">Back to Dashboard</a>
        </center>
    </div>

    
        <div style="margin-top:35px; margin-left:15px; width:100%; display:flex;">
            <p style="font-size:20px">To fill-up a form of a Registered student enter his/her Email-ID--</p>
            <asp:TextBox ID="txtSearch" runat="server" Text="" CssClass="txtBox" placeholder="Search Email"></asp:TextBox>
            
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click" />

            <br />
            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtSearch" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ErrorMessage="Enter a valid email." ForeColor="Red"></asp:RegularExpressionValidator>
        </div>

        <div style="margin-top:35px">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>
        </div>
</asp:Content>
