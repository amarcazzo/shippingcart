using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderDetails : System.Web.UI.Page
{
    private VentaService mVentaService = new VentaService();

    IEnumerable<DetalleVenta> mDetalle;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            mDetalle = mVentaService.GetDetalleVenta(int.Parse(Request.QueryString["Id"]));
            CargarDetalle();
            CalcularTotal();
        }
    }

    protected void CargarDetalle()
    {
        gdvDetalleVenta.DataSource = mDetalle;
        gdvDetalleVenta.DataBind();
    }

    protected void CalcularTotal()
    {
        float mPrecioFinal = 0;

        foreach (GridViewRow x in gdvDetalleVenta.Rows)
            mPrecioFinal += int.Parse(((Label)x.FindControl("lblPrecio")).Text);

        lblPrecioTotal.Text = mPrecioFinal.ToString();
    }

    protected void btnVolver_Click(object sender, EventArgs e)
    {
        Response.Redirect("Orders.aspx");
    }
}