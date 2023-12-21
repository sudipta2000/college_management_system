<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="ContactUsPage.aspx.cs" Inherits="FinalProject.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <style>
        .gMap {
            margin-top:30px;
            float:right;
        }

            .gMap iframe {
                height: 400px;
                width: 600px;
                
            }
        .contact{
            float:left;
        }
        .contact p{
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size:24px;
            padding-top:165px;
            padding-left:70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div style="height:557px; background-color:antiquewhite">
        <div class="contact">
            <p>
                Management & Computer Consultants(MCC)
                <br />
                MCC Tower, Plot-DH-6/34, AA-1D, Premises – 12-315,
                <br />
                New Town, Rajarhat,
                <br />
                Kolkata – 700156
                <br />
                For more info mail us at <a href="#">mccit@info.in</a>
                <br />
                
            </p>
        </div>
        <div class="gMap">
            <h2 style="padding:10px">Location on map:
            </h2>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d921.0050648526479!2d88.4815686201592!3d22.578345587313585!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a020acd0ca22021%3A0x89be11f9d5439d4c!2sManagement%20%26%20Computer%20Consultants%20(MCC)!5e0!3m2!1sen!2sin!4v1680077833050!5m2!1sen!2sin" width="600" height="450" style="border: 0; loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
</asp:Content>
