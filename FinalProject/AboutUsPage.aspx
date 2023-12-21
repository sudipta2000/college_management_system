<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMaster.Master" AutoEventWireup="true" CodeBehind="AboutUsPage.aspx.cs" Inherits="FinalProject.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContentHead" runat="server">
    <style>
        .mission{
            padding-top:30px;
            width:100%;
            height:200px;
            font-size:x-large;
            background-color:aqua;
            font-family: 'Century Gothic';
        }
        .mission p{
            margin-top:20px;
        }
        .content-box{
            padding-top:50px;
            padding-bottom:40px;
            background-color:antiquewhite;
        }
        .content{
            width:800px; 
            padding-left:200px;
            margin-top:25px;
            font-family:'Baskerville Old Face';
            
        }
        .content span{
            font-size:24px;
        }

        .content p{
            margin-top:10px;
            font-size:18px;
            padding-left:20px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div>
        <div class="mission">
            <center>
            <h1>Our mission</h1>
            <p>Nurture everyone's passion, curiosity, optimism, and educational success.</p>
                </center>
        </div>
            
        <div class="content-box">
            <center>
                <h1 style="font-family:'Bahnschrift SemiBold'">Our Philosophy</h1>
            </center>
            <div class="content">
                <span>Proven learning approaches</span>
                <p>Teaching is one of the most challenging and complex jobs on the planet. Our digital resources, tools, and learning materials are developed by educational experts to incorporate leading pedagogical practices. They are useful in any type of teaching moment and many can be used to support national education standards.</p>
            </div>

            <div class="content">
                <span>Empowered educatorss</span>
                <p>From school teachers and tutors to home schoolers and parents, engaged adults are the key to unlocking each child's potential and drive to learn. We empower all kinds of educators to
                                                             teach kids by providing the best educational resources in any form or device to be used at home, 
                                                            at school, and everywhere in-between.</p>
            </div>

            <div class="content">
                <span>Unique experiences</span>
                <p>There is no such thing as "one size fits all" in education;
                                                                each educator and child has unique challenges and goals. We celebrate the diversity of our users by offering differentiated resources 
                                                            that can meet a wide range of educational needs - and raise kids' confidence in learning.</p>
            </div>

            <div class="content">
                <span>Conscientious and supportive</span>
                <p>We continue to provide academically sound content of the highest caliber and welcome
                                                             input from our users as we address issues of equity, diversity, inclusivity and representation. Since we know there are many different approaches to teaching and education, 
                                                            we develop our materials to complement these different philosophies across subjects and grades.</p>
            </div>
            
        </div>
    </div>
</asp:Content>
