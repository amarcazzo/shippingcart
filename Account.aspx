<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="main">

    <div class="container">

      <div class="row">
      	
      	<div class="col-md-8">      		
      		
      		<div class="widget stacked ">
      			
      			<div class="widget-header">
      				<i class="icon-user"></i>
      				<h3>Your Account</h3>
  				</div> <!-- /widget-header -->
				
				<div class="widget-content">
					
					<div class="tabbable">
					<ul class="nav nav-tabs">
					  <li class="active">
					    <a href="#profile" data-toggle="tab">Profile</a>
					  </li>
					</ul>
					
					<br/>
					
						<div class="tab-content">
							<div class="tab-pane active" id="profile">
							    <div class="form-horizontal col-md-8">
								<fieldset>
									
									<div class="form-group">											
										<label for="username" class="col-md-4">Username</label>
										<div class="col-md-8">
                                            <asp:TextBox ID="txtUsuario" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
											<p class="help-block">Your username is for logging in and cannot be changed.</p>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									
									<div class="form-group">											
										<label for="firstname" class="col-md-4">First Name</label>
										<div class="col-md-8">
                                            <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									
									<div class="form-group">											
										<label class="col-md-4" for="lastname">Last Name</label>
										<div class="col-md-8">
                                            <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server"></asp:TextBox>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									
									<div class="form-group">											
										<label class="col-md-4" for="email">Email Address</label>
										<div class="col-md-8">
                                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									
									<hr /><br />
									
									<div class="form-group">											
										<label class="col-md-4" for="password1">Password</label>
										<div class="col-md-8">
                                            <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->


									<div class="form-group error">
                                        <div>
                                            <asp:CompareValidator ID="cmpPasswords" runat="server" CssClass="error" ControlToValidate="txtPassConfirm" ErrorMessage="Password don't match." ControlToCompare="txtPassword"></asp:CompareValidator>
                                        </div>
										<label class="col-md-4" for="password2">Confirm</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txtPassConfirm" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
										
										<br />

									<div class="form-group">

										<div class="col-md-offset-4 col-md-8">
                                            <asp:Button ID="btnSave" data-type="success" CssClass="btn btn-primary growl-type" OnClick="btnSave_Click" runat="server" Text="Save" />
                                            <asp:Button ID="btnCancel" CssClass="btn btn-default" OnClick="btnCancel_Click" runat="server" Text="Cancel" />
										</div>
									</div> <!-- /form-actions -->
								</fieldset>
							</div>
							</div>
						</div>
					</div>
					
				</div> <!-- /widget-content -->
					
			</div> <!-- /widget -->
      		
	    </div> <!-- /span8 -->
      	
      	
      	<div class="col-md-4">

      		<div class="well">

      			<h4>Extra Info</h4>

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					
					
				<p> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      		</div>
								
	      </div> <!-- /span4 -->
      	
      </div> <!-- /row -->

    </div> <!-- /container -->
    
</div> <!-- /main -->

    <div class="msgGrowl-container bottom-right"></div>

</asp:Content>

