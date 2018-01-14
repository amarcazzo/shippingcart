using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Signup : System.Web.UI.Page
{
    UsuarioService UserService = new UsuarioService();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Usuario mAux = new Usuario();

            mAux.User = txtUser.Text;
            mAux.Password = txtPassword.Text;
            mAux.Nombre = txtNombre.Text;
            mAux.Apellido = txtApellido.Text;
            mAux.Email = txtEmail.Text;

            try
            {
                if (UserService.CreateUser(mAux))
                    Response.Redirect("Login.aspx", false);
            }
            catch (Exception ex)
            {
                Response.Redirect("Error.aspx?" + ex.Message);
            }
         
        }
    }
}