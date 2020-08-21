<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ImanHusseinPizza.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <title> Registration</title>
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
                <h2 class="drawer-title">Menu</h2>
            </div>
            <ul class="drawer-nav">
                <li role="presentation" class="active"><a href="Home.aspx">Home</a></li>
                <li role="presentation"><a href="Order.aspx">Order Pizza</a></li>
            </ul>
            <div class="drawer-body">
                <p>
                    This page is for BSU Pizza store, you can order variety flavors of pizza on our website.
                    Also, this page is the sample for presentation.
                </p>
            </div>
            <div class="drawer-footer locked text-center">
                <small>&copy; Aaron Feng and Jeff Zhang</small>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <form id="Registration" class="form-horizontal" runat="server">
          <div class="form-group"> <!--first name group-->
              <asp:Label ID="LabelFname" runat="server" Text="First Name" CssClass="control-label col-sm-4" for="TextBoxFname"></asp:Label>
              <div class="col-sm-4">
                <asp:TextBox ID="TextBoxFname" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div class="col-sm-4">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorFname" runat="server"  ErrorMessage="First name is required" 
                      ForeColor="Red" ControlToValidate="TextBoxFname">

                  </asp:RequiredFieldValidator>
                  <br />
              </div>
          </div><!-- close first name group-->

         <div class="form-group"> <!--last name group-->
              <asp:Label ID="LabelLname" runat="server" Text="Last Name" for="TextBoxLname" CssClass="control-label col-sm-4"></asp:Label>
              <div class="col-sm-4">
                <asp:TextBox ID="TextBoxLname" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div class="col-sm-4">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorLname" runat="server" 
                      ErrorMessage="Last name is required" ControlToValidate="TextBoxLname" ForeColor="Red" ></asp:RequiredFieldValidator>
                  <br />
              </div>
          </div><!--close last name group-->
         <div class="form-group"> <!--user name group-->
              <asp:Label ID="LabelUsername" runat="server" Text="User Name"  for="TextBoxUserName" CssClass="control-label col-sm-4"></asp:Label>
              <div class="col-sm-4">
                <asp:TextBox ID="TextBoxUserName" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div class="col-sm-4">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName"  ForeColor="Red" ControlToValidate="TextBoxUserName" runat="server" ErrorMessage="User name is required">

                  </asp:RequiredFieldValidator>
                  <br />
              </div>
          </div><!--close user name group-->

         <div class="form-group"> <!-- start Email group-->
              <asp:Label for="TextBoxEmail" ID="LabelEmail" runat="server" Text="Email" CssClass="control-label col-sm-4"></asp:Label>
              <div class="col-sm-4">
                  <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div class="col-sm-4">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail"  runat="server" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="TextBoxEmail" ></asp:RequiredFieldValidator>
                  &nbsp;<br />
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="You must enter a valid email address"  ForeColor="Red" ControlToValidate="TextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                  <br />
              </div>
          </div><!--close Email group-->

         <div class="form-group"> <!--Start County group-->
              <asp:Label ID="LabelCountry" runat="server"  for="DropDownListCountry"  Text="Country" CssClass="control-label col-sm-4"></asp:Label>
              <div class="col-sm-4">
                  <asp:DropDownList ID="DropDownListCountry" runat="server" Selected="True" class="form-control" >
                      <asp:ListItem></asp:ListItem>
                      <asp:ListItem>United State</asp:ListItem>
                      <asp:ListItem>China</asp:ListItem>
                      <asp:ListItem>Iraq</asp:ListItem>
                      <asp:ListItem>India</asp:ListItem>
                  </asp:DropDownList>
              </div>
              <div class="col-sm-4">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorCountry"  runat="server" ErrorMessage="Country is required"  ControlToValidate="DropDownListCountry" ForeColor="Red"></asp:RequiredFieldValidator>
                  <br />

              </div>
          </div><!--close country group-->
         <div class="form-group"> <!-- start password group-->
              <asp:Label  ID="LabelPassword" runat="server" for="TextBoxPassword" Text="Password" CssClass="control-label col-sm-4"></asp:Label>
              <div class="col-sm-4">
                <asp:TextBox TextMode="Password" ID="TextBoxPassword" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div class="col-sm-4">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" ForeColor="Red" runat="server" ErrorMessage="password is required" ControlToValidate="TextBoxPassword"></asp:RequiredFieldValidator>
                  <br />
                  <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ErrorMessage="Use at least 6 characters without special characters" ControlToValidate="TextBoxPassword" ValidationExpression="[a-zA-Z0-9]{6,6}"></asp:RegularExpressionValidator>

              </div>
          </div><!--close Password group-->
        <div class="form-group"> <!-- start comfirm password-->
            <asp:Label ID="LabelConfirmPassword" for="TextBoxConfirmPassword" class="control-label col-sm-4" runat="server" Text="Confirm Password"></asp:Label>
            <div class="col-sm-4"  >                 <asp:TextBox TextMode="Password" ID="TextBoxConfirmPassword"  class="form-control" runat="server"></asp:TextBox>             </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" ForeColor="Red" ErrorMessage="Confirm Password is required" ControlToValidate="TextBoxConfirmPassword"></asp:RequiredFieldValidator>&nbsp;<br />
             <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both password must be same" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword" ForeColor="Red"></asp:CompareValidator>
            <br />
         </div><!-- close comfirm password--> 
       
        <div class="form-group"> <!-- start Age -->
            <asp:Label ID="Label1" for="TextBoxAge" class="control-label col-sm-4" runat="server" Text="Age"></asp:Label>
            <div class="col-sm-4"  >                 <asp:TextBox ID="TextBoxAge"  class="form-control" runat="server"></asp:TextBox>             </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ErrorMessage="Age is required!" ForeColor="Red" ControlToValidate="TextBoxAge"></asp:RequiredFieldValidator>
            <br />
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="you must be at least 18" ControlToValidate="TextBoxAge"  MaximumValue="128" MinimumValue="18" Type="Integer"></asp:RangeValidator>
            &nbsp;<br /> 
         </div><!-- close Age--> 

        <div class="form-group"><!-- start radio buttons--> 

             <asp:Label id="LabelGender" for="RadioButtons" class="control-label col-sm-4" runat="server" text="Gender"></asp:Label>
             <div id="RadioButtons"   class="col-sm-4 radio-inline" >
              <asp:RadioButton ID="RadioButtonMale" runat="server"  GroupName="gender" Text="Male"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              
               <asp:RadioButton ID="RadioButtonFemale" runat="server" GroupName="gender" Text="Female" Checked="true"/>
        </div> 
    </div><!-- close radio button>
        <!--start button group-->
        <div class="form-group"> 
            <asp:Label ID="LabelWelcome" runat="server" Text="Welcome" CssClass="control-label col-sm-4"></asp:Label>
            <asp:Button ID="ButtonSubmit" class="btn btn-primary" runat="server" Text="Submit" OnClick="ButtonSubmit_Click"/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           <input class="btn btn-warning" type="reset" id="ButtonReset" value="Reset" />
         
           
        </div><!--close button  group-->



   
    </form>
    <script src="js/drawer.js"></script>
    <script>$('#drawerMenu').drawer({ toggle: false });</script>
</body>
</html>
