using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account : System.Web.UI.Page
{
    UsuarioService UserService = new UsuarioService();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Request.QueryString["Id"] != null)
            CargarForm();
    }

    protected void CargarForm()
    {
        try
        {
            Usuario mAux = UserService.GetUser(int.Parse(Request.QueryString["Id"]));

            txtNombre.Text = mAux.Nombre;
            txtApellido.Text = mAux.Apellido;
            txtEmail.Text = mAux.Email;
            txtUsuario.Text = mAux.User;
            txtPassword.Text = mAux.Password;
            txtPassConfirm.Text = mAux.Password;
        }
        catch (Exception ex)
        {
            Response.Redirect("Error.aspx?" + ex.Message);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Usuario mAux = new Usuario();

            if (Page.IsValid)
            {
                mAux.Id = int.Parse(Request.QueryString["Id"]);
                mAux.User = txtUsuario.Text;
                mAux.Nombre = txtNombre.Text;
                mAux.Apellido = txtApellido.Text;
                mAux.Email = txtEmail.Text;
                mAux.Password = txtPassword.Text;

                UserService.UpdateUser(mAux);
            }

        }
        catch (Exception ex)
        {
            Response.Redirect("Error.aspx?" + ex.Message);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}