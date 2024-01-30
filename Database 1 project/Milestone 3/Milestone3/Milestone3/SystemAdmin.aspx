<%@ Page Title="SA Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SystemAdmin.aspx.cs" Inherits="Milestone3.SystemAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Welcome System Admin</h1>
        <p class="lead">See what you want to do.</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
        </p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Add a Club</h2>
            <p>
                Club Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="add_cname" runat="server" Height="16px"></asp:TextBox>
            </p>
            <p>
                Club Location&nbsp;&nbsp; <asp:TextBox ID="add_cl" runat="server" Height="16px"></asp:TextBox>
            </p>
            <p>
                                <asp:button runat="server" type="button" class="btn btn-primary" OnClick="AddClub" Text="Submit" Height="36px"> </asp:button>    

            </p>
        </div>
        <div class="col-md-4">
            <h2>Delete a Club</h2>
            <p>
                Club Name&nbsp;&nbsp;&nbsp; <asp:TextBox ID="d_cname" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Button runat="server" type="button" class="btn btn-primary" OnClick="DeleteClub" Text="Submit"></asp:Button>  

            </p>
            
        </div>
        <div class="col-md-4">
            <h2>Add a Stadium</h2>
            <p>
                Stadium Name&nbsp;
                <asp:TextBox ID="add_sname" runat="server"></asp:TextBox>
            </p>
            <p>
                Location&nbsp;
                <asp:TextBox ID="add_sl" runat="server"></asp:TextBox>
            </p>
            <p>
                Capacity&nbsp;
                <asp:TextBox ID="add_sc" runat="server"></asp:TextBox>
            </p>
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="AddStadium" Text="Submit" OnClientClick="AddStadium" ValidateRequestMode="Enabled"> </asp:button>             </p>
            

        </div>
        <div class="col-md-4">
            <h2>Delete a Stadium</h2>
            <p>
                Name
                <asp:TextBox ID="d_sname" runat="server"></asp:TextBox>
            </p>
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="DeleteStadium" Text="Submit"> </asp:button>             </p>
            
        </div>
        <div class="col-md-4">
            <h2>Block a Fan</h2>
            <p>
                Fan ID&nbsp;
                <asp:TextBox ID="F_id" runat="server"></asp:TextBox>
            </p>
            <p>
<asp:button runat="server" type="button"  class="btn btn-primary" onClick="Bfan" Text="Submit"> </asp:button>             
            </p>
        </div>
    </div>

</asp:Content>
