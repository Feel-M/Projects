<%@ Page Title="Club Representative Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Club_Rep.aspx.cs" Inherits="Milestone3.Club_Rep" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Welcome Club Representative</h1>
        <p class="lead">See what you want to do.</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
          
        </p>
    </div>
    <div>        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
    <div class="row">
   
        
        <div class="col-md-4">
            <h2>view all club information </h2>
            <p>
                 club_rep_id &nbsp;
                <asp:TextBox ID="club_rep_id" runat="server"></asp:TextBox>
            </p>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <p>
               &nbsp;
                </p>
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="allClubs" Text="Submit"  ValidateRequestMode="Enabled"> </asp:button>             </p>
            

        </div>
        <div class="col-md-4">
            <h2>view all upcoming matches of the club</h2>
            <p>
               club representative username
                <asp:TextBox ID="crep_username" runat="server"></asp:TextBox>
            </p>
             <p>
               club  name
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                 <asp:GridView ID="GridView3" runat="server">
                 </asp:GridView>
            </p>
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="upcomingmatches" Text="Submit"> </asp:button>             </p>
            
        </div>



             </div>
        <div class="col-md-4">
            <h2>view all available stadiums</h2>
            <p>
                date
                <asp:TextBox ID="date" runat="server"></asp:TextBox>
            </p>
         
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="allstadiums" Text="Submit"> </asp:button>             
                <asp:GridView ID="GridView2" runat="server">
                </asp:GridView>
            </p>
            
        </div>

    <div class="col-md-4">
            <h2>send request to stadium manager</h2>
            <p>
                club name 
                <asp:TextBox ID="club_namee" runat="server"></asp:TextBox>
            </p>
         <p>
                stadium name 
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </p>
        <p>
                club rep username 
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </p>
        <p>
                start time
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </p>
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="addhostrequest" Text="Submit"> </asp:button>             </p>
            
        </div>


       
        </div>


</asp:Content>
