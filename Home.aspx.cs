using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    private ProductoService mProductoService = new ProductoService();

    IEnumerable<Producto> mProductos;

    protected void Page_Load(object sender, EventArgs e)
    {
        mProductos = mProductoService.GetMasVendidos();

        if (!IsPostBack)
            CargarMasVendidos();
        
    }

    protected void CargarMasVendidos()
    {
        lvMasVendidos.DataSource = mProductos;
        lvMasVendidos.DataBind();
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        if(txtBusqueda.Text != "")
            Response.Redirect("Products.aspx?Buscar=" + txtBusqueda.Text);
    }

    protected void btnVerMas_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductForm.aspx?Id=" + ((Button)sender).CommandArgument.ToString());
    }
}