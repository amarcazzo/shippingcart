﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container stacked">
        
        <div class="widget widget-nopad stacked">
						
				    <div class="widget-header">
					    <i class="icon-shopping-cart"></i>
					    <h3>Cart</h3>
				    </div> <!-- /widget-header -->
				
				    <div class="widget-content">
                            <asp:GridView ID="gdvCarrito" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" OnRowEditing="gdvCarrito_RowEditing" OnRowCancelingEdit="gdvCarrito_RowCancelingEdit" OnRowUpdating="gdvCarrito_RowUpdating" OnRowDeleting="gdvPrueba_RowDeleting" AutoGenerateEditButton="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="Descripcion">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescripcion" runat="server" Text='<%# Bind("Producto.Nombre") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cantidad">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlCantidad" runat="server">
                                                <asp:ListItem Text="1" />
                                                <asp:ListItem Text="2" />
                                                <asp:ListItem Text="3" />
                                                <asp:ListItem Text="4" />
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCantidad" runat="server" Text='<%# Bind("Cantidad") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Precio unitario">
                                        <ItemTemplate>
                                            <span>$</span>
                                            <asp:Label ID="lblPrecioUnitario" runat="server" Text='<%# Bind("PrecioUnitario") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Precio">
                                        <ItemTemplate>
                                            <span>$</span>
                                            <asp:Label ID="lblPrecio" runat="server" Text='<%# Bind("Precio") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    El carrito esta vacío.
                                </EmptyDataTemplate>
                            </asp:GridView>
				    </div> <!-- /widget-content -->
            <br />
            <div class="widget-content">
                <div class="form-group">
					<div class="col-md-offset col-md-12">
                        <hr />
                        <asp:Table ID="tbTotal" CssClass="table table-striped table-bordered" runat="server">
                            <asp:TableRow>
                                <asp:TableHeaderCell>
                                    <i class="icon-money" />
                                    Total
                                </asp:TableHeaderCell>
                                <asp:TableCell>
                                    <span>$</span>
                                    <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <asp:Button ID="btnCheckout" CssClass="btn btn-primary" OnClientClick="javascript:ConfirmPurchase();" runat="server" Text="Checkout" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Continue shopping" OnClick="btnCancel_Click"/>
                        <hr />
                    </div>
				</div>
            </div>
	    </div> <!-- /widget -->	
    </div>
    <asp:HiddenField runat="server" Value="0" id="confirmPurchase"></asp:HiddenField>

    <script type="text/javascript">
        function ConfirmPurchase() {
            if (<%: Global.IdUser %> != '0') {
                if(confirm("¿Está seguro que desea realizar la compra?") == true)
                    document.getElementById("<%: confirmPurchase.ClientID %>").value = 1;

                __doPostBack();
            }
            else {
                if (confirm("Para realizar una compra debe estar registrado! ¿Desea registrarse?") == true)
                    window.location = "./Signup.aspx";
            }
        }
    </script>
</asp:Content>

