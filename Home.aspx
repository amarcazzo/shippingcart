<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
<div class="main">

    <div class="container">
      	<div class="">
			<div class="widget stacked">
				<div class="widget-content">
					<div class="form-group" style="text-align:center">
                        <h3 class="modal-title">Encontra lo que estás buscando!</h3>
                        <br />
                        <asp:TextBox runat="server" ID="txtBusqueda" CssClass="form-control input-sm" Width="400px" style="display:inline-block" placeholder="Search"></asp:TextBox>
                        <asp:Button runat="server" Text="Buscar" ID="btnBuscar" CssClass="btn btn-default" OnClick="btnBuscar_Click" />
					</div>
                    <hr />
                        <div class="widget-header">
                            <i class="glyphicon-fire"></i>
                            <h3>Más vendidos</h3>
                        </div>
                        <div class="widget-content" style="text-align:center">
                            <asp:ListView ID="lvMasVendidos" GroupItemCount="4" runat="server">
                                <AlternatingItemTemplate>
                                        <td runat="server" style="display:inline-block;width: 245px;align-content:center; margin:10px">
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
                                <ItemTemplate>
                                        <td runat="server" style="display:inline-block;width: 245px;align-content:center; margin:10px">
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
                    <hr />
                    <div style="text-align:center">
                            <asp:ScriptManager ID="ScriptManager1" runat="server" />
                            <div class="UserControlDiv" style="text-align:center">
                                <asp:UpdatePanel ID="up1" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:Timer ID="Timer1" Interval="2500" runat="server" />
                                        <asp:AdRotator ID="AdRotator1" AdvertisementFile="Ads.xml" KeywordFilter="small" runat="server" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                    </div>
				</div> <!-- /widget-content -->
			</div> <!-- /widget -->
	    </div> <!-- /span6 -->
					
    </div> <!-- /container -->
    
</div> <!-- /main -->
        
</asp:Content>

