using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    UsuarioService UserService = new UsuarioService();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnSingin_Click(object sender, EventArgs e)
    {
        try
        {
            if (UserService.CheckUser(txtUsuario.Text, txtPassword.Text))
            {
                if (cbKeepSigned.Checked)
                {
                    HttpCookie Cookie = new HttpCookie("Username");
                    Cookie.Value = txtUsuario.Text;
                    Cookie.Expires = DateTime.Now.AddMonths(1);

                    HttpContext.Current.Response.AppendCookie(Cookie);
                }
                else
                    Session["Username"] = txtUsuario.Text;

                Global.IdUser = UserService.GetUserId(txtUsuario.Text);
                Global.IdCategoriaUser = UserService.GetCategoria(txtUsuario.Text);

                Response.Redirect("Home.aspx", false);
            }
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "AlertUser();", true);

        }
        catch (Exception ex)
        {
            Response.Redirect("Error.aspx?" + ex.Message);
        }
        
    }
    
}