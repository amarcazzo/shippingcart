<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.master" AutoEventWireup="true" CodeFile="Sucursales.aspx.cs" Inherits="Sucursales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="col-md-8">
            <div class="widget">
                <div class="widget-header">
                    <h3>Sucursales</h3>
                </div>
                <div class="widget-content" style="height:400px">   
                    <asp:ListView ID="lvSucursales" runat="server" GroupItemCount="4">
                        <AlternatingItemTemplate>
                            <li style="display:inline-block;width: 150px;text-align:center; margin:10px; border:solid, 1px">
                                <i class="icon-home icon-4x img-thumbnail"></i>
                                <br />
                                <br />
                                Sucursal <asp:Label ID="lblDescripcion" Width="100%" runat="server" Text='<%# Eval("Descripcion") %>' />
                                <br />
                                <br />
                                Codigo Postal<asp:Label ID="lblCodigoPostal" Width="100%" runat="server" Text='<%# Eval("CodigoPostal") %>' />
                                <br />
                                <br />
                                Direccion<asp:Label ID="lblDireccion" Width="100%" runat="server" Text='<%# Eval("Direccion") %>' />
                                <br />
                                <br />
                                <asp:Button ID="btnMapa" CommandArgument='<%# Bind("Mapa") %>' OnClick="btnMapa_Click" Width="100%" CssClass="btn btn-info" runat="server" Text="Mapa" />
                            </li>
                        </AlternatingItemTemplate>
                        <EmptyDataTemplate>
                            No se han devuelto datos.
                        </EmptyDataTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>
                        <ItemTemplate>
                            <li style="display:inline-block;width: 150px;text-align:center; margin:10px; border:solid, 1px">
                                <i class="icon-home icon-4x img-thumbnail"></i>
                                <br />
                                <br />
                                Sucursal <asp:Label ID="lblDescripcion" Width="100%" runat="server" Text='<%# Eval("Descripcion") %>' />
                                <br />
                                <br />
                                Codigo Postal<asp:Label ID="lblCodigoPostal" Width="100%" runat="server" Text='<%# Eval("CodigoPostal") %>' />
                                <br />
                                <br />
                                Direccion<asp:Label ID="lblDireccion" Width="100%" runat="server" Text='<%# Eval("Direccion") %>' />
                                <br />
                                <br />
                                <asp:Button ID="btnMapa" CommandArgument='<%# Bind("Mapa") %>' OnClick="btnMapa_Click" Width="100%" CssClass="btn btn-info" runat="server" Text="Mapa" />
                            </li>
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
                </div> <%--Widget content--%>
            </div> <%--Widget--%>
        </div>
        <div class="col-md-4">
            <div class="widget">
                <div class="widget-header">
                    <h3>Mapa</h3>
                </div>
                <div class="widget-content" style="height:400px">
                    <iframe runat="server" id="gMaps" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3285.0583827517353!2d-58.43176438415333!3d-34.57738926361389!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bcb590bcec7ed9%3A0x4d74a2a5f1f8d553!2sAv.+Santa+Fe+4950%2C+Cdad.+Aut%C3%B3noma+de+Buenos+Aires!5e0!3m2!1ses-419!2sar!4v1478813308940" width="320" height="360" frameborder="0" style="border:0" allowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
    </div> <%--Container--%>

    

</asp:Content>

