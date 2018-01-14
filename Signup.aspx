<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Create an account</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/> 
    
	<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="./css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
	
	<link href="./css/font-awesome.min.css" rel="stylesheet"/>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet"/>
    
    <link href="./css/ui-lightness/jquery-ui-1.10.0.custom.min.css" rel="stylesheet"/>
    
    <link href="./css/base-admin-3.css" rel="stylesheet"/>
    <link href="./css/base-admin-3-responsive.css" rel="stylesheet"/>
    
	<link href="./css/pages/signin.css" rel="stylesheet"/>

    <link href="./css/custom.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
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
            <a class="navbar-brand" href="Home.aspx">My Page</a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li class="">						
			        <a href="Signup.aspx">
				        Create an Account
			        </a>			
		        </li>

		        <li class="">
						
			        <a href="Home.aspx">
				        <i class="icon-chevron-left"></i>&nbsp;&nbsp; 
				        Back to Homepage
			        </a>
			
		        </li>
            </ul>
          </div><!-- /.navbar-collapse -->
        </div> <!-- /.container -->
    </nav>



    <div class="account-container register stacked">
	
	    <div class="content clearfix">
			    <h1>Create Your Account</h1>			
			
			    <div class="login-fields">
				
				    <p>Create your free account:</p>

				    <div class="form-group error"  style="height: 60px">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvNombre" CssClass="error" runat="server" ErrorMessage="This field is required" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                        </div>
				        <div class="field">
					        <label>First Name:</label>
                            <asp:TextBox ID="txtNombre" CssClass="form-control" placeholder="First Name" runat="server"></asp:TextBox>

				        </div> <!-- /field -->
                    </div>
				    
                    <div class="form-group error" style="height: 60px">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvApellido" CssClass="error" runat="server" ErrorMessage="This field is required" ControlToValidate="txtApellido"></asp:RequiredFieldValidator>
                        </div>
				        <div class="field">
					        <label for="lastname">Last Name:</label>	
                            <asp:TextBox ID="txtApellido" CssClass="form-control" placeholder="Last Name" runat="server"></asp:TextBox>
				        </div> <!-- /field -->
                    </div>
				    
				    <div class="form-group error" style="height: 60px">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvEmail" CssClass="error" runat="server" ErrorMessage="This field is required" ControlToValidate="txtEmail" />
                            <asp:RegularExpressionValidator ID="revEmail" CssClass="error" runat="server" ErrorMessage="The e-mail is not valid." ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        </div>
				        <div class="field">
					        <label>Email Address:</label>
                            <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="E-Mail" runat="server"></asp:TextBox>
				        </div> <!-- /field -->
                    </div>

                    <div class="form-group error" style="height: 60px">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvUser" CssClass="error" runat="server" ErrorMessage="This field is required" ControlToValidate="txtUser"></asp:RequiredFieldValidator>
                        </div>
				        <div class="field">
					        <label>Username:</label>
                            <asp:TextBox ID="txtUser" CssClass="form-control" placeholder="Username" runat="server" ></asp:TextBox>
				        </div> <!-- /field -->
                    </div>
				    
                    <div class="form-group error" style="height: 60px">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvPassword" CssClass="error" runat="server" ErrorMessage="This field is required" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                        </div>
				        <div class="field">
					        <label>Password:</label>
                            <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
				        </div> <!-- /field -->
                    </div>
				    
                    <div class="form-group error" style="height: 60px">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvConfirmPass" CssClass="error" runat="server" ErrorMessage="This field is required" ControlToValidate="txtConfirmPass"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cmpPasswords" runat="server" ErrorMessage="Passwords don't match" ControlToValidate="txtConfirmPass" CssClass="error" ControlToCompare="txtPassword"></asp:CompareValidator>
                        </div>
				        <div class="field">
					        <label>Confirm Password:</label>
                            <asp:TextBox ID="txtConfirmPass" CssClass="form-control" placeholder="Confirm Password" runat="server" TextMode="Password"></asp:TextBox>
				        </div> <!-- /field -->
                    </div>
				    
			    </div> <!-- /login-fields -->
			    <div class="login-actions" style="height:60px">
                    <asp:Button ID="btnAceptar" runat="server" CssClass="login-action btn btn-primary" Text="Register" OnClick="btnAceptar_Click" />
			    </div> <!-- .actions -->
			
		
	    </div> <!-- /content -->
	
    </div> <!-- /account-container -->


    <!-- Text Under Box -->
    <div class="login-extra">
	    Already have an account? <a href="./Login.aspx">Login</a>
    </div> <!-- /login-extra -->


<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/libs/jquery-1.9.1.min.js"></script>
<script src="./js/libs/jquery-ui-1.10.0.custom.min.js"></script>
<script src="./js/libs/bootstrap.min.js"></script>

<script src="./js/Application.js"></script>

<script src="./js/demo/signin.js"></script>
    </form>
</body>
</html>
