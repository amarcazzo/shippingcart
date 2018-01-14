using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    private VentaService mVentaService = new VentaService();
    private UsuarioService mUserService = new UsuarioService();

    IEnumerable<Venta> mVentas;

    protected void Page_Load(object sender, EventArgs e)
    {
        mVentas = mVentaService.GetVentas(Global.IdUser);

        if (!IsPostBack)
            CargarVentas();
    }

    protected void CargarVentas()
    {
        gdvCompras.DataSource = mVentas;
        gdvCompras.DataBind();
    }
    
    protected void btnDetalle_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrderDetails.aspx?Id=" + ((Button)sender).CommandArgument);
    }

    protected void ddlTiempo_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch(ddlTiempo.SelectedValue)
        {
            case "1":
                mVentas = mVentas.Where(x => x.Fecha > DateTime.Now.AddMonths(-1));
                break;
            case "3":
                mVentas = mVentas.Where(x => x.Fecha > DateTime.Now.AddMonths(-3));
                break;
            case "6":
                mVentas = mVentas.Where(x => x.Fecha > DateTime.Now.AddMonths(-6));
                break;
            case "12":
                mVentas = mVentas.Where(x => x.Fecha > DateTime.Now.AddMonths(-12));
                break;
        }

        CargarVentas();
    }
}