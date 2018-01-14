<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Log In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>    
    
    <link href="./css/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet"/>
    
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet"/>
    <link href="./css/font-awesome.min.css" rel="stylesheet"/>
    
    <link href="./css/ui-lightness/jquery-ui-1.10.0.custom.min.css" rel="stylesheet"/>
    
    <link href="./css/base-admin-3.css" rel="stylesheet"/>
    <link href="./css/base-admin-3-responsive.css" rel="stylesheet"/>

	<link href="./css/pages/signin.css" rel="stylesheet"/>

    <link href="./css/custom.css" rel="stylesheet"/>

    <script type="text/javascript">
        function AlertUser() {
            alert("La combinacion de usuario y contraseña no es correcta. Intentelo de nuevo.");
        }
    </script>
</head>
<body>
    <nav class="navbar navbar-inverse" role="navigation">

	<div class="container">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="./Home.aspx">My Page</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav navbar-right">
      <li class="">						
			<a href="./Signup.aspx">
				Create an Account
			</a>			
		</li>

		<li class="">
						
			<a href="./Home.aspx">
				<i class="icon-chevron-left"></i>&nbsp;&nbsp; 
				Back to Homepage
			</a>
			
		</li>
    </ul>
  </div><!-- /.navbar-collapse -->
</div> <!-- /.container -->
</nav>



<div class="account-container stacked">
	
	<div class="content clearfix">
		
        <h1>Sign In</h1>		
		<form id="form1" runat="server">
    
			<div class="login-fields">
				
				<p>Sign in using your registered account:</p>

				<div class="form-group error" style="height: 70px;">
                    <div>
                        <asp:RequiredFieldValidator ID="rfvUsername" CssClass="error" runat="server" ErrorMessage="This field is required." ControlToValidate="txtUsuario"></asp:RequiredFieldValidator>
                    </div>
				    <div class="field">
					    <label for="username">Username:</label>
                        <asp:TextBox ID="txtUsuario" CssClass="form-control input-lg username-field" placeholder="User" runat="server"></asp:TextBox>
				    </div> <!-- /field -->
				</div>
				
                <div class="form-group error" style="height: 70px;">
                    <div>
                        <asp:RequiredFieldValidator ID="rfvPassword" CssClass="error" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </div>
				    <div class="field">
					    <label for="password">Password:</label>
                        <asp:TextBox ID="txtPassword" CssClass="form-control input-lg password-field" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
				    </div> <!-- /password -->
			    </div>
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
				
				<span class="login-checkbox">
                    <asp:CheckBox ID="cbKeepSigned" runat="server" />
					<label class="choice" for="Field">Keep me signed in</label>
				</span>
									
                <asp:Button ID="btnSingin" runat="server" Text="Sign In" OnClick="btnSingin_Click" CssClass="login-action btn btn-primary"  />
				
			</div> <!-- .actions -->
        </form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->


    <!-- Text Under Box -->
    <div class="login-extra">
	    Don't have an account? <a href="./Signup.aspx">Sign Up</a><br/>
    </div> <!-- /login-extra -->

    

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
    <script src="./js/libs/jquery-1.9.1.min.js"></script>
    <script src="./js/libs/jquery-ui-1.10.0.custom.min.js"></script>
    <script src="./js/libs/bootstrap.min.js"></script>

    <script src="./js/Application.js"></script>

    <script src="./js/demo/signin.js"></script>

    <script src="./js/plugins/msgGrowl/js/msgGrowl.js"></script>
    <script src="./js/demo/notifications.js"></script>

    
</body>
</html>
