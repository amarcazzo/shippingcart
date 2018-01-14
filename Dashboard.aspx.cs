using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{

    private UsuarioService mUserService = new UsuarioService();
    private EmpleadoService mEmpleadoService = new EmpleadoService();
    private VentaService mVentaService = new VentaService();

    IEnumerable<Usuario> mUsuarios;
    IEnumerable<Empleado> mEmpleados;
    IEnumerable<Venta> mVentas;

    protected void Page_Load(object sender, EventArgs e)
    {
        mUsuarios = mUserService.GetUsuarios();
        mEmpleados = mEmpleadoService.GetEmpleados();
        mVentas = mVentaService.GetVentas().Where(x => x.Fecha == DateTime.Now.Date);

        if (!IsPostBack)
            CargarGrid();
    }

    protected void CargarGrid()
    {
        gdvDashboard.DataSource = mUsuarios;
        gdvDashboard.DataBind();

        gdvEmpleados.DataSource = mEmpleados;
        gdvEmpleados.DataBind();

        gdvUltimasVentas.DataSource = mVentas;
        gdvUltimasVentas.DataBind();
    }


    protected void gdvUltimasVentas_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvUltimasVentas.PageIndex = e.NewPageIndex;
        CargarGrid();
    }

    protected void gdvEmpleados_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvEmpleados.PageIndex = e.NewPageIndex;
        CargarGrid();
    }

    protected void gdvDashboard_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvDashboard.PageIndex = e.NewPageIndex;
        CargarGrid();
    }
}