<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="StudentQuery.aspx.cs" Inherits="FinalProject.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <style>
        .tableContainer {
            height: 292px;
            width: 100%;
            padding-top: 25px;
        }

        .tableDesign {
            height: 250px;
            margin-top: 20px;
            width: 550px;
            padding-top: 15px;
            border: 2px solid black;
            border-radius: 5px;
            box-shadow: 0 0 6px 0 white;
        }

        .auto-style1 {
            height: 20px;
        }

        .tdClass {
            font-size: larger;
            color: whitesmoke;
        }

        .btn {
            margin: 15px;
            justify-content: space-between;
            height: 30px;
            width: 60px;
            border-radius: 5px;
            font-family: 'Baskerville Old Face';
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div style="height: 557px; background-color: #0E8388">
        <div class="tableContainer">
            <center>
    <table class="tableDesign">
        <tr>
            <td class="tdClass">
                <asp:Label runat="server" Text="Student Name: "></asp:Label>
            </td>
            <td class="tdClass">
                <asp:Label ID="lblName" Text="" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1"></td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td class="tdClass">
                <asp:Label runat="server" Text="Enter your query: "></asp:Label>
            </td>
            <td class="tdClass">
                <asp:TextBox ID="txtQuery" runat="server" TextMode="MultiLine" Height="75px" Width="209px" ></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtQuery" ErrorMessage="Can't be blank" ForeColor="Red" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="tdClass">
                <center>
                <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" Width="80px" CssClass="btn"/>
                <asp:Button ID="btnBack" Text="Dashboard" runat="server" OnClick="btnBack_Click" Width="80px" CausesValidation="false" CssClass="btn" />    
                </center>
            </td>
        </tr>
        <tr>
            
            <td colspan="2">
                
                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
       
            </td>
        </tr>
    </table>
            </center>
        </div>
        <div class="gridView">
            <center>
        <asp:GridView ID="gvStudentQuery" runat="server" AllowPaging="true" PageSize="5" OnPageIndexChanging="gvStudentQuery_PageIndexChanging" OnRowDeleting="gvStudentQuery_RowDeleting" DataKeyNames="query_id" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="836px" Height="149px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="QueryID">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("query_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Query Details">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("query_details") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Posted By">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("query_post_by") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Query Time">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("query_time") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Query Reply">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("query_reply") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Reply Time">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("reply_time") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


                <asp:TemplateField HeaderText="Solved/Delete" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('You sure To delete?')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
            <EmptyDataTemplate>
                <span>
                    <h2>No Active Queries!!</h2>
                </span>
            </EmptyDataTemplate>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
            </center>
        </div>
    </div>
</asp:Content>
