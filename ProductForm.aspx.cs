using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ProductForm : System.Web.UI.Page
{
    ProductoService ProductoService = new ProductoService();
    CategoriaService CatService = new CategoriaService();
    CartService CartService = new CartService();

    private string ImagePath;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarCategorias();

            if (Global.IdCategoriaUser == 1)
            {
                if (Request.QueryString["Id"] != null)
                {
                    btnDelete.Visible = true;
                    btnEdit.Visible = true;
                }
                else
                    HabilitarCampos();

                btnBuy.Visible = false;
                btnSave.Visible = true;
            }
        }


        if (!IsPostBack && Request.QueryString["Id"] != null)
            CargarForm();
    }

    protected void HabilitarCampos()
    {
        txtDescripcion.Enabled = true;
        txtMarca.Enabled = true;
        txtNombre.Enabled = true;
        txtPrecio.Enabled = true;
        ddlCategoria.Enabled = true;
        avatarUpload.Visible = true;
    }

    protected void CargarCategorias()
    {
        foreach (Categoria x in CatService.GetCategorias("Productos"))
            ddlCategoria.Items.Add(new ListItem(x.Descripcion, x.Id.ToString()));
    }

    protected void CargarForm()
    {
        try
        {
            Producto mAux = ProductoService.GetProducto(int.Parse(Request.QueryString["Id"]));

            txtNombre.Text = mAux.Nombre;
            txtDescripcion.Text = mAux.Descripcion;
            txtPrecio.Text = mAux.Precio.ToString();
            txtMarca.Text = mAux.Marca;
            ddlCategoria.SelectedValue = mAux.Categoria.Id.ToString();
            imgProducto.ImageUrl = mAux.Imagen;
        }
        catch (Exception ex)
        {
            Response.Redirect("Error.aspx?" + ex.Message);
        }
    }

    protected void SaveImage()
    {
        int contentLength = avatarUpload.PostedFile.ContentLength;//You may need it for validation
        string contentType = avatarUpload.PostedFile.ContentType;//You may need it for validation
        string fileName = avatarUpload.PostedFile.FileName;
        if(contentLength > 0)
            avatarUpload.PostedFile.SaveAs(@"C:\Users\Ayrton\Documents\TP Final\img\products\" + txtNombre.Text.Trim() + ".jpg");//Or code to save in the DataBase.

        ImagePath = "./img/products/" + txtNombre.Text.Trim() + ".jpg";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            SaveImage();

            Producto mProducto = new Producto();

            mProducto.Descripcion = txtDescripcion.Text;
            mProducto.Nombre = txtNombre.Text;
            mProducto.Marca = txtMarca.Text;
            mProducto.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
            mProducto.Precio = float.Parse(txtPrecio.Text);
            mProducto.Imagen = ImagePath;

            if (Request.QueryString["Id"] != null)
            {
                mProducto.Id = int.Parse(Request.QueryString["Id"].ToString());
                ProductoService.UpdateProducto(mProducto);
                Response.Redirect(Request.Url.ToString(), false);
            }
            else
            {
                ProductoService.CreateProduct(mProducto);
                Response.Redirect("ProductForm.aspx?Id=" + mProducto.Id, false);
            } 

            
        }
        catch(Exception ex)
        {
            Response.Redirect("Error.aspx?" + ex.Message);
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        btnSave.Visible = true;
        HabilitarCampos();
    }

    protected void btnBuy_Click(object sender, EventArgs e)
    {
        if (Application["Carrito"] == null)
            Application["Carrito"] = CartService.CrearCarrito();
        
        CartService.AgregarItem(int.Parse(Request.QueryString["Id"].ToString()) , txtNombre.Text, float.Parse(txtPrecio.Text));

        Response.Redirect("Products.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx", false);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            if (ProductoService.DeleteProducto(int.Parse(Request.QueryString["Id"].ToString())))
                Response.Redirect("Products.aspx", false);
        }
        catch (Exception ex)
        {
            Response.Redirect("Error.aspx?" + ex.Message);
        }
    }
}