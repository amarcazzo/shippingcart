<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div>
            <div class="widget stacked">
                <div class="widget-header">
                    <h3>Ultimas compras</h3>
                </div>
                <div class="widget-content">
                    <span>Ultimo(s):</span>
                    <asp:DropDownList ID="ddlTiempo" CssClass="form-control input-sm" style="display:inline-block" Width="100px" runat="server" OnSelectedIndexChanged="ddlTiempo_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="Todas"></asp:ListItem>
                        <asp:ListItem Text="Mes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="3 meses" Value="3"></asp:ListItem>
                        <asp:ListItem Text="6 meses" Value="6"></asp:ListItem>
                        <asp:ListItem Text="1 año" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                    <hr />
                    <asp:GridView ID="gdvCompras" Width="100%" CssClass="table table-bordered table-responsive" runat="server" AutoGenerateColumns="False">
                        <EmptyDataTemplate>
                            <span class="modal-title">No se registran ventas.</span>
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:TemplateField HeaderText="Id">
                                <ItemTemplate>
                                    <asp:Label ID="lblIdVenta" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha">
                                <ItemTemplate>
                                    <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Monto">
                                <ItemTemplate>
                                    <span>$</span>
                                    <asp:Label ID="lblMonto" runat="server" Text='<%# Bind("Monto") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnDetalle" CssClass="btn-link" OnClick="btnDetalle_Click" CommandArgument='<%# Bind("Id") %>' runat="server" Text="Ver detalle" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

