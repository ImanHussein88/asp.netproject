<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="ImanHusseinPizza.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <title> Reset  Password</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="formResetPassord" runat="server" class="form_forizontal col-sm-offset-3 col-sm-4" >
        <h3> Reset a Password</h3>
    <div class="form-group" > <!--usename-->
        <div class="input-group">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-user"> </span>
            </span>
            <asp:TextBox ID="TextBoxuserName" class="form-control" runat="server"></asp:TextBox>

        </div>
    
    </div><!--close input g-->

        <div class="form-group" > <!--st email-->
        <div class="input-group">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-envelope"> </span>
            </span>
            <asp:TextBox ID="TextBoxEmail" class="form-control" runat="server"></asp:TextBox>

        </div><!--close input g-->
    </div><!--close email g-->
        <hr /> <!--horizontal line-->
       

        <div class="form-group" >
            <asp:Button ID="Buttonrestpassord" runat="server" Text="Reset Password" class="btn btn-primary btn-lg" OnClick="Buttonrestpassord_Click" /><br />
            <asp:Label ID="LabelMessage" class="control-label" runat="server" Text="" Visible="false"></asp:Label>
            
         
            </div>
    </form>
</body>
</html>
