using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Cart : System.Web.UI.Page
{
    private CartService CartService = new CartService();
    private VentaService mVentaService = new VentaService();
    private UsuarioService mUserService = new UsuarioService();

    IEnumerable<DetalleVenta> mCarrito;

    protected void Page_Load(object sender, EventArgs e)
    {
        GetCarrito();

        if (confirmPurchase.Value == "1")
            HacerCompra();

        if (!IsPostBack)
        {
            CargarGrilla();

            if (Application["Carrito"] == null)
                btnCheckout.Visible = false;
            else if(((DataTable)Application["Carrito"]).Rows.Count == 0)
                btnCheckout.Visible = false;
        }
    }

    protected void GetCarrito()
    {
        mCarrito = CartService.GetCarrito();
    }

    protected void CargarGrilla()
    {
        gdvCarrito.DataSource = mCarrito;
        gdvCarrito.DataBind();

        CalcularTotal();
    }

    protected void CalcularTotal()
    {
        float Total = 0;

        foreach (GridViewRow x in gdvCarrito.Rows)
            Total += float.Parse(((Label)x.FindControl("lblPrecio")).Text);

        lblTotal.Text = Total.ToString();
    }

    protected void gdvPrueba_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        ((DataTable)Application["Carrito"]).Rows[e.RowIndex].Delete();

        GetCarrito();

        CargarGrilla();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void gdvCarrito_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvCarrito.EditIndex = e.NewEditIndex;

        CargarGrilla();
    }

    protected void gdvCarrito_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gdvCarrito.EditIndex = -1;

        CargarGrilla();
    }

    protected void gdvCarrito_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int mCantidad = int.Parse(((DropDownList)gdvCarrito.Rows[e.RowIndex].FindControl("ddlCantidad")).SelectedValue);
        float mPrecio = float.Parse(((Label)gdvCarrito.Rows[e.RowIndex].FindControl("lblPrecioUnitario")).Text) * mCantidad;

        CartService.ActualizarItem(e.RowIndex, mCantidad, mPrecio);

        GetCarrito();

        gdvCarrito.EditIndex = -1;
        CargarGrilla();
    }

    protected void HacerCompra()
    {
        try
        {
            if (mUserService.IsUserLogged() || Session["Username"] != null)
            {
                mVentaService.AltaVenta(float.Parse(lblTotal.Text));

                int IdVenta = mVentaService.GetIdVenta(Global.IdUser);

                if (IdVenta > 0)
                {
                    foreach (DetalleVenta x in mCarrito)
                    {
                        x.Id = IdVenta;
                        mVentaService.AltaDetalleVenta(x);
                    }
                }

                Application["Carrito"] = CartService.CrearCarrito();

                Response.Redirect("Orders.aspx", false);
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("Error.aspx?Err=" + ex.Message);
        }
    }
}
