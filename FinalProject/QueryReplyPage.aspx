<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="QueryReplyPage.aspx.cs" Inherits="FinalProject.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <style>
        .header{
            font-size:x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div style="height:557px">
    <div style="padding:20px; padding-bottom:20px;">
        <center>
        <asp:Label ID="lblHeader" runat="server" Text="Active Queries:-" CssClass="header"></asp:Label>
            </center>
    </div>
    <div>
        <center>
    <asp:GridView ID="gvQuery" runat="server" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvQuery_PageIndexChanging" AutoGenerateColumns="False" DataKeyNames="query_id" OnRowCancelingEdit="gvQuery_RowCancelingEdit" OnRowEditing="gvQuery_RowEditing" OnRowUpdating="gvQuery_RowUpdating" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Both" Height="177px" Width="783px">
        <Columns>
            <asp:TemplateField HeaderText="QueryID">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("query_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblID" runat="server" Text='<%#Eval("query_id") %>'></asp:Label>
                </EditItemTemplate>
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
                <EditItemTemplate>
                    <asp:TextBox ID="txtReply" runat="server" Text="" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtReply" ErrorMessage="Can't be blank" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Reply Time">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("reply_time") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Reply" ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Submit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Reply"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <h1 style="font-family:'Baskerville Old Face'; padding-left:20px">No active queries right now!!</h1>
        </EmptyDataTemplate>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
            </center>
</div>
    
    <div>
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
    </div>

    <div>
        <center>
            <a href="AdminDashboard.aspx" runat="server">Back to Dashboard</a>
        </center>
    </div>
        </div>
</asp:Content>
