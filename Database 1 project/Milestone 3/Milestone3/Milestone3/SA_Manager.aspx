<%@ Page Title="Sports Association Manager" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SA_Manager.aspx.cs" Inherits="Milestone3.SA_Manager" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Welcome Sports Association Manager</h1>
        <p class="lead">See what you want to do.</p>
        
        <asp:Label ID="Label1" runat="server" Text="Output Message"></asp:Label>
    </div>
    <div>
         <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    </div>
    <div class="col-md-4">
            <h2>Add new match</h2>
            <p>
                Host Club Name</p>
            <p>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </p>
            <p>
                Guest Club Name</p>
            <p>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </p>
            <p>
                Start Time</p>
            <p>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </p>
            <p>
                End Time</p>
            <p>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </p>
            <p>
                                <asp:button runat="server" type="button" class="btn btn-primary" OnClick="addNewMatch" Text="Add" Height="36px" ID="button1"> </asp:button>    

            </p>
        </div>

            <div class="col-md-4">
            <h2>Delete Match</h2>
            <p>
                Host Club Name</p>
            <p>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </p>
            <p>
                Guest Club Name</p>
            <p>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </p>
            <p>
                Start Time</p>
            <p>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </p>
            <p>
                End Time</p>
            <p>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </p>
            <p>
                                <asp:button runat="server" type="button" class="btn btn-primary" OnClick="DeleteMatch" Text="Delete" Height="36px" ID="button2"> </asp:button>    

            </p>
        </div>

        <div class="col-md-4">

            <h2>Upcoming Matches</h2>
            <p>
                                <asp:button runat="server" type="button" class="btn btn-primary" OnClick="viewUpcomingMatches"  Text="View" Height="36px" ID="button3"> </asp:button>    

            </p>
            <p>
                <asp:GridView ID="GridViewUpcoming" runat="server">
                </asp:GridView>
            </p>
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>

        </div>
        <div class="col-md-4">
            <h2>Unpaired Clubs </h2>
            <p>
                All clubs that were never scheduled to play against each other</p>
            <p>
                                <asp:button runat="server" type="button" class="btn btn-primary" Onclick="viewclubsNeverMatched" Text="View" Height="36px" ID="button5"> </asp:button>    

            &nbsp;</p>
            <asp:GridView ID="GridView3" runat="server">
            </asp:GridView>
            <br />
        </div>
        <div>         <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</div>
    <div class="col-md-4">
            <h2>Played Matches</h2>
            <p>
                                <asp:button runat="server" type="button" class="btn btn-primary"  Onclick="viewPlayedMatches" Text="View" Height="36px" ID="button4"> </asp:button>    

            &nbsp;</p>
            <asp:GridView ID="GridViewPlayed" runat="server">
            </asp:GridView>
        </div>

</asp:Content>
