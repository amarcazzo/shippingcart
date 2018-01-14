<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="widget">
            <div class="widget-header">
                <h3>Detalles</h3>
            </div>
            <div class="widget-content">
                <asp:GridView ID="gdvDetalleVenta" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Producto">
                            <ItemTemplate>
                                <asp:Label ID="lblProducto" runat="server" Text='<%# Bind("Producto.Nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cantidad">
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
                </asp:GridView>
            </div>
        </div>
        <div class="widget">
            <div class="widget-content">
                <table class="table table-striped table-bordered">
                    <tr>
                        <td>
                            <span style="font-weight:bold">Total</span>
                        </td>
                        <td>
                            <span>$</span>
                            <asp:Label ID="lblPrecioTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <hr />
                <div class="col-md-offset-11">
                    <asp:Button ID="btnVolver" CssClass="btn btn-info" runat="server" Text="Back" OnClick="btnVolver_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

