using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Products : System.Web.UI.Page
{
    private ProductoService mProductoService = new ProductoService();
    private CategoriaService mCategoriaService = new CategoriaService();
    private MarcaService mMarcaService = new MarcaService();

    private IEnumerable<Categoria> mCategorias;
    private IEnumerable<Producto> mProductos;

    protected void Page_Load(object sender, EventArgs e)
    {

        mProductos = mProductoService.GetProductos();
        mCategorias = mCategoriaService.GetCategorias("Productos");

        if (!IsPostBack)
        {
            if (Request.QueryString["Buscar"] != null)
                FiltrarBusqueda(Request.QueryString["Buscar"].ToString());

            CargarCategorias();
            CargarMarcas();
            CargarProductos();
        }
    }

    protected void CargarCategorias()
    {
        foreach (Categoria x in mCategorias)
            blCategorias.Items.Add(new ListItem(x.Descripcion, x.Id.ToString()));
    }

    protected void CargarProductos()
    {
        lvProductos.DataSource = mProductos;
        lvProductos.DataBind();
    }

    protected void CargarMarcas()
    {
        ddlMarcas.Items.Add(new ListItem("Todas", "0"));

        foreach (Marca x in mMarcaService.GetMarcas())
            ddlMarcas.Items.Add(new ListItem(x.Descripcion));
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        FiltrarBusqueda(txtBusqueda.Text.ToLower());

        CargarProductos();
    }

    protected void btnVerMas_Click(object sender, EventArgs e)
    {
        string IdProducto = ((Button)sender).CommandArgument.ToString();
        try
        {
            Response.Redirect("ProductForm.aspx?Id=" + IdProducto, false);
        }
        catch (Exception ex)
        {
            Response.Redirect("Error.aspx?" + ex.Message);
        }
    }

    protected void FiltrarBusqueda(string mCadena)
    {
        mProductos = mProductos.Where(x => x.Nombre.ToLower().Contains(mCadena));
    }

    protected void FiltrarMarca()
    {
        if (ddlMarcas.SelectedValue != "0")
            mProductos = mProductos.Where(x => x.Marca == ddlMarcas.SelectedValue);
    }

    protected void FiltrarPrecios()
    {
        if (txtPrecioMax.Text != "" && txtPrecioMin.Text == "")
            mProductos = mProductos.Where(x => x.Precio < float.Parse(txtPrecioMax.Text));
        else if (txtPrecioMin.Text != "" && txtPrecioMax.Text == "")
            mProductos = mProductos.Where(x => x.Precio > float.Parse(txtPrecioMin.Text));
        else if (txtPrecioMin.Text != "" && txtPrecioMax.Text != "")
            mProductos = mProductos.Where(x => x.Precio > float.Parse(txtPrecioMin.Text) && x.Precio < float.Parse(txtPrecioMax.Text));
    }

    protected void btnPrecios_Click(object sender, EventArgs e)
    {
        FiltrarMarca();
        FiltrarPrecios();

        CargarProductos();
    }

    protected void blCategorias_Click(object sender, BulletedListEventArgs e)
    {
        mProductos = mProductos.Where(x => x.Categoria.Id == int.Parse(blCategorias.Items[e.Index].Value));

        CargarProductos();
    }
}