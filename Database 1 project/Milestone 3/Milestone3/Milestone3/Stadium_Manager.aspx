<%@ Page Title="Stadium Manager" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stadium_Manager.aspx.cs" Inherits="Milestone3.Stadium_Manager" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <div class="jumbotron">
        <h1>Welcome stadium manager</h1>
        <p class="lead">See what you want to do.</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
          
        </p>
    </div>
    <div>        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>

   
        <div class="col-md-4">
            <h2>view all stadium information  </h2>
            <p>
                Manager Username
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="viewAllStadiumInfo" Text="Submit"  ValidateRequestMode="Enabled"> </asp:button>             </p>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </div>
        <div class="col-md-4">
            <h2>recieved requests </h2>
          
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="recievedRequest" Text="Submit"> </asp:button>             
                <asp:GridView ID="GridView2" runat="server">
                </asp:GridView>
                 <p>
                stadium manager username &nbsp;&nbsp; <asp:TextBox ID="TextBox9" runat="server" Height="16px"></asp:TextBox>
            </p>
            </p>
            
        </div>
             
        <div class="col-md-4">
            <h2>accept sent requests  </h2>
            <p>
                 <p>
                stadium manager username 
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </p>
             <p>
                guest club name
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </p>
             <p>
                host club name
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </p>
             <p>
             start time 
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </p>
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="acceptrecievedRequest" Text="Submit"  ValidateRequestMode="Enabled"> </asp:button>             </p>
            

    </div>
            <div class="col-md-4">
            <h2>reject sent requests  </h2>
            <p>
                  <p>
                stadium manager username 
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </p>
             <p>
                guest club name
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </p>
             <p>
                host club name
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </p>
             <p>
             start time 
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </p>
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="rejectrecievedRequest" Text="Submit"  ValidateRequestMode="Enabled"> </asp:button>             </p>

    </div>

</div>


 
    
</asp:Content>
