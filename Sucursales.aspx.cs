using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sucursales : System.Web.UI.Page
{
    SucursalService mSucursalService = new SucursalService();

    IEnumerable<Sucursal> mSucursales;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            mSucursales = mSucursalService.GetSucursales();
            CargarSucursales();
        }
    }

    protected void CargarSucursales()
    {
        lvSucursales.DataSource = mSucursales;
        lvSucursales.DataBind();
    }

    protected void btnMapa_Click(object sender, EventArgs e)
    {
        gMaps.Src = ((Button)sender).CommandArgument.ToString();
    }
}