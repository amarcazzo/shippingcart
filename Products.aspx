<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="main" style="height:100%">
        <div class="container">
          <div class="row">
      	    
              <div class="col-md-4 col-xs-12">
                  <div class="widget widget-nopad stacked">
		                <div class="widget-header">
			                <i class="icon-bookmark"></i>
			                <h3>Categorias</h3>
		                </div> <!-- /widget-header -->
				
		                <div class="widget-content">
                            <asp:BulletedList ID="blCategorias" OnClick="blCategorias_Click" CssClass="nav nav-pills nav-stacked" DisplayMode="LinkButton" runat="server"></asp:BulletedList>
		                </div> <!-- /widget-content -->
	                </div> <!-- /widget -->
                <div class="widget widget-nopad stacked">
                    <div class="widget-header">
                        <i class="icon-filter"></i>
                            Filtros
                    </div>
                    <div class="widget-content">
                        <div class="navbar-form" role="search">
                            <div class="form-group">
                                <asp:TextBox ID="txtBusqueda" CssClass="form-control input-sm search-query" Width="250px" placeholder="Search" runat="server"></asp:TextBox>
                            </div>
                            <asp:Button ID="btnBuscar" CssClass="btn btn-navbar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                        </div>
                        <hr />
                        <div>
                            <div class="navbar-form">
                                <asp:Label ID="lblMarcas" runat="server" CssClass="" Text="Marcas:"></asp:Label>
                                <asp:DropDownList ID="ddlMarcas" CssClass="form-control input-sm" Width="275px" runat="server"></asp:DropDownList>	
                            </div>
                            <hr />
				            <div class="navbar-form">
                                <div class="item-content">
                                    	<table>
                                        <tr>
                                            <td><span>Precio minimo:</span><td>
                                            <td><asp:TextBox ID="txtPrecioMin" CssClass="form-control input-sm" Width="70px" runat="server"></asp:TextBox></td>
                                            <td><td>
                                        </tr>
                                        <tr>
                                            <td><span>Precio máximo:</span><td>
                                            <td><asp:TextBox ID="txtPrecioMax" CssClass="form-control input-sm" Width="70px" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><asp:Button ID="btnAplicar" CssClass="btn btn-sm btn-success" runat="server" Text="Apply" OnClick="btnPrecios_Click" /><td>
                                        </tr>
                                    </table>
				                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-8">	
      		    <div class="widget stacked">
				    <div class="widget-header">
					    <i class="icon-desktop"></i>
					    <h3>Productos</h3>
				    </div> <!-- /widget-header -->

				    <div class="widget-content">
                        
                            <div class="container">
                                <asp:ListView ID="lvProductos" runat="server" GroupItemCount="4">
                                    <AlternatingItemTemplate>
                                        <td runat="server" style="display:inline-block;width: 150px;align-content:center; margin:10px">
                                            <asp:Label ID="lblNombre" style="display:inline-block; border:0; color:cornflowerblue; font-weight:bold; height:50px;text-align:center" Width="100%" runat="server" Text='<%# Eval("Nombre") %>' />
                                            <br />
                                            <br />
                                            <asp:Image ID="imgProducto" ImageUrl='<%# Bind("Imagen") %>' CssClass="img-thumbnail" Height="150px" Width="150px" runat="server" />
                                            <br />
                                            <br />
                                            <asp:Button ID="btnVerMas"  CssClass="btn btn-primary" Width="100%" OnClick="btnVerMas_Click" CommandArgument='<%# Bind("Id") %>' runat="server" Text="Ver más" />
                                            <br />
                                            <br />
                                        </td>
                                    </AlternatingItemTemplate>
                                    <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server"></td>
                                        </tr>
                                    </GroupTemplate>
                                    <EmptyDataTemplate>
                                        No hay productos con esos criteros.
                                    </EmptyDataTemplate>
                                    <ItemTemplate>
                                        <td runat="server" style="display:inline-block;width: 150px;align-content:center; margin:10px">
                                            <asp:Label ID="lblNombre" style="border:0; color:cornflowerblue; font-weight:bold; height:50px; text-align:center" Width="100%" runat="server" Text='<%# Eval("Nombre") %>' />
                                            <br />
                                            <br />
                                            <asp:Image ID="imgProducto" ImageUrl='<%# Bind("Imagen") %>' CssClass="img-thumbnail" Height="150px" Width="150px" runat="server" />
                                            <br />
                                            <br />
                                            <asp:Button ID="btnVerMas" CssClass="btn btn-primary" Width="100%" CommandArgument='<%# Bind("Id") %>' OnClick="btnVerMas_Click" runat="server" Text="Ver más" />
                                            <br />
                                            <br />
                                        </td>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                                        <tr id="groupPlaceholder" runat="server">
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>
				        </div> <!-- /widget-content -->
			        </div> <!-- /widget -->

              </div>
        </div>
        </div>
    </div>

</asp:Content>

