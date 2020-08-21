<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ImanHusseinPizza.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <title> Login</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/introjs.css" />
    <link rel="stylesheet" href="css/bootstrap-drawer.css" />
    <link rel="stylesheet" href="css/liquid-slider.css" />
    <link rel="stylesheet" href="css/bsuPizza.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
    <header class="container">

        <nav class="collapse navbar-collapse navbar-inverse">
            <img class="logo" src="images/bsulogo.jpg" alt="bsulogo" />
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="Order.aspx">Make a Order</a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">User Information <span class="caret" /></a>
                    <ul class="dropdown-menu">
                        <li><a href="BasicUser.aspx">Basic Information</a></li>
                        <li><a href="DeliveryInfo.aspx">Delivery Information</a></li>
                    </ul>
                </li>
                <li><a href="Login.aspx">Login </a></li>
                <li><a href="Registration.aspx">Become a member</a></li>
            </ul>
        </nav>
    </header>
    <div id="drawerMenu" class="drawer dw-xs-8 fold">
        <div class="drawer-controls visible-xs-block">
            <a href="#drawerMenu" data-toggle="drawer" class="btn btn-primary btn-lg" style="font-size: 50px; padding: 0px 10px 0px 10px">≡</a>
        </div>
        <div class="drawer-contents">
            <div class="drawer-heading">
                <h2 class="drawer-title" data-localize="menu.title">Menu</h2>
            </div>
             <ul class="drawer-nav">
                <li  class="active"><a href="Home.aspx" data-localize="menu.home">Home</a></li>
                <li ><a href="Order.aspx" data-localize="menu.order">Order Pizza</a></li>
                <li ><a href="Login.aspx" data-localize="menu.login">Login </a></li>
                <li ><a href="Registration.aspx" data-localize="menu.register">Become a member</a></li>
            </ul>
            <div class="drawer-body">
                <p data-localize="menu.body">
                    This page is for BSU Pizza store, you can order variety flavors of pizza on our website.
                    Also, this page is the sample for presentation.
                </p>
            </div>
            <div class="drawer-footer locked text-center">
                <small>&copy; Aaron Feng and Jeff Zhang</small>
            </div>
        </div>
    </div>
    <div class="container">
    <form id="formlLogin" runat="server" class="form_forizontal col-sm-offset-3 col-sm-6" >
        <h3> Login to your acount(you must create an acount first)</h3>
    <div class="form-group" >
        <div class="input-group">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-user"> </span>
            </span>
            <asp:TextBox ID="TextBoxuser" class="form-control" runat="server"></asp:TextBox>

        </div>
    
    </div><!--close input g-->

        <div class="form-group" >
        <div class="input-group">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-lock"> </span>
            </span>
            <asp:TextBox ID="TextBoxPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>

        </div><!--close input g-->
    </div><!--close input g-->
        <hr /> <!--horizontal line-->
        <a href="Registration.aspx"> Create an acount</a> 

        <div class="form-group" >
            <asp:Button ID="ButtonLogin" class="btn btn-success" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
            <br />
            <asp:Label ID="LabelMessage" runat="server" Text="" Visible="false"></asp:Label>
            <br />
            <asp:LinkButton ID="LinkButtonForgotpaswword" runat="server" Enabled="false" Visible="false" PostBackUrl="~/ResetPassword.aspx">Forgot Password</asp:LinkButton>
            </div>
    </form>
        </div>
    <script src="js/drawer.js"></script>
    <script>$('#drawerMenu').drawer({ toggle: false });</script>
</body>
</html>
