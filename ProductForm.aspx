<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.master" AutoEventWireup="true" CodeFile="ProductForm.aspx.cs" Inherits="ProductForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="widget">
            <div class="widget-content">
               <div class="tabbable">
					<ul class="nav nav-tabs">
					  <li class="active">
					    <a data-toggle="tab"><i class="icon-list"></i> Producto</a>
					  </li>
					</ul>
					
					<br/>
					
						<div class="tab-content col-md-10">
							<div class="tab-pane active " id="profile">
							    <div class="form-horizontal col-md-10">
								<fieldset>
                                    
									<div class="form-group">
										<label class="col-md-4">Imagen</label>
                                        <div class="col-md-8">
                                            <asp:Image ID="imgProducto" CssClass="img-thumbnail" ImageUrl="/img/no-image.png" runat="server" Height="150px" Width="150px" />
                                            <hr />
                                            <input ID="avatarUpload" visible="false" type="file" name="file" OnChange="PreviewFile()" class="form-control btn-sm"  runat="server" />
                                        </div>								
									</div> <!-- /control-group -->

									<div class="form-group">											
										<label class="col-md-4">Nombre</label>
										<div class="col-md-8">
                                            <asp:TextBox ID="txtNombre" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									
									<div class="form-group">											
										<label class="col-md-4">Descripcion</label>
										<div class="col-md-8">
                                            <asp:TextBox ID="txtDescripcion" CssClass="form-control" Enabled="false" runat="server" Height="150px" TextMode="MultiLine" MaxLength="200"></asp:TextBox>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
                                    <div class="form-group">											
										<label class="col-md-4">Categoria</label>
										<div class="col-md-8">
                                            <asp:DropDownList ID="ddlCategoria" Enabled="false" CssClass="form-control dropdown" runat="server"></asp:DropDownList>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->

                                    <div class="form-group">											
										<label class="col-md-4">Marca</label>
										<div class="col-md-8">
                                            <asp:TextBox ID="txtMarca" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<div class="form-group">											
										<label class="col-md-4">Precio</label>
										<div class="col-md-8 input-group">
                                            <span class="input-group-addon">$</span>
                                            <asp:TextBox ID="txtPrecio" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
										</div> <!-- /controls -->				
									</div> <!-- /control-group -->
									
									<hr /><br />
										
									<div class="form-group">
										<div class="col-md-offset-4 col-md-8">
                                            <asp:Button ID="btnDelete" Visible="false" CssClass="btn btn-danger" OnClick="btnDelete_Click" runat="server" Text="Delete" />
                                            <asp:Button ID="btnSave" Visible="false" CssClass="btn btn-success" OnClick="btnSave_Click" runat="server" Text="Save" />
                                            <asp:Button ID="btnEdit" Visible="false" CssClass="btn btn-info" OnClick="btnEdit_Click" runat="server" Text="Edit" />
                                            <asp:Button ID="btnBuy" CssClass="btn btn-primary" runat="server" OnClick="btnBuy_Click" Text="Buy" />
                                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
										</div>
									</div> <!-- /form-actions -->
								</fieldset>
							</div>
							</div>
						</div>
					</div>
			</div>
        </div>
    </div>

    <script type="text/javascript">
        function PreviewFile() {
            var preview = document.querySelector('#<%= imgProducto.ClientID %>');
            var file = document.querySelector('#<%=avatarUpload.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>

</asp:Content>

