<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="row">
            <div class="widget">
                <div class="widget-header">
                    <i class="icon-bookmark"></i>
					<h3>Stats</h3>
                </div>

                <div class="widget-content">
                <div class="col-md-4">
                    <div class="widget-header">
					    <h3>Usuarios</h3>
				    </div> <!-- /widget-header -->
                <asp:GridView ID="gdvDashboard" AllowPaging="true" OnPageIndexChanging="gdvDashboard_PageIndexChanging" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Usuario">
                            <ItemTemplate>
                                <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("User") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("NombreCompleto") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Categoria">
                            <ItemTemplate>
                                <asp:Label ID="lblCategoria" runat="server" Text='<%# Bind("Categoria.Descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                            No se registran usuarios.
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
            <div class="col-md-4">
                <div class="widget-header">
					<h3>Empleados</h3>
				</div> <!-- /widget-header -->
                <asp:GridView ID="gdvEmpleados" AllowPaging="true" OnPageIndexChanging="gdvEmpleados_PageIndexChanging" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <ItemTemplate>
                                <asp:Label ID="lblApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Categoria">
                            <ItemTemplate>
                                <asp:Label ID="lblCategoria" runat="server" Text='<%# Bind("Categoria.Descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                            No se registran empleados.
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
            <div class="col-md-4">
                <div class="widget-header">
					<h3>Ventas de hoy</h3>
				</div> <!-- /widget-header -->
                <asp:GridView ID="gdvUltimasVentas" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" ShowFooter="False">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Usuario">
                            <ItemTemplate>
                                <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("NombreUsuario") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Monto">
                            <ItemTemplate>
                                <span>$</span>
                                <asp:Label ID="lblMonto" runat="server" Text='<%# Bind("Monto") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha">
                            <ItemTemplate>
                                <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        No se registran ventas hoy.
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
            </div>
            </div>

            <div class="widget stacked">
				<div class="widget-header">
					<i class="icon-bookmark"></i>
					<h3>Quick Shortcuts</h3>
				</div> <!-- /widget-header -->
				
				<div class="widget-content">

					<div class="shortcuts">
						<a href="./ProductForm.aspx" class="shortcut">
							<i class="shortcut-icon icon-desktop"></i>
							<span class="shortcut-label">Agregar producto</span>
						</a>
						
						<a href="./Products.aspx" class="shortcut">
							<i class="shortcut-icon icon-desktop"></i>
							<span class="shortcut-label">Editar producto</span>								
						</a>	
					</div> <!-- /shortcuts -->
				</div> <!-- /widget-content -->
			</div> <!-- /widget -->
            
        </div>
    </div>
        
    <script src="./js/charts/pie.js"></script>
    <script src="./js/charts/bar.js"></script>
    <script src="./js/plugins/flot/jquery.flot.orderBars.js"></script>

</asp:Content>

