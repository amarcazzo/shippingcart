using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inicio : System.Web.UI.MasterPage
{
    UsuarioService UserService = new UsuarioService();
    CartService CartService = new CartService();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (UserService.IsUserLogged())
            {
                liRegister.Visible = false;
                liLogin.Visible = false;
                liUsuario.Visible = true;

                lblUsuario.Text = HttpContext.Current.Request.Cookies["Username"].Value;

                Global.IdUser = UserService.GetUserId(((Label)liUsuario.FindControl("lblUsuario")).Text);
                Global.IdCategoriaUser = UserService.GetCategoria(((Label)liUsuario.FindControl("lblUsuario")).Text);
            }
            else if(Session["Username"] != null)
            {
                liRegister.Visible = false;
                liLogin.Visible = false;
                liUsuario.Visible = true;

                lblUsuario.Text = Session["Username"].ToString();

                Global.IdUser = UserService.GetUserId(((Label)liUsuario.FindControl("lblUsuario")).Text);
                Global.IdCategoriaUser = UserService.GetCategoria(((Label)liUsuario.FindControl("lblUsuario")).Text);
            }

            if (Global.IdCategoriaUser == 1)
                liCarrito.Visible = false;

            CargarOpcionesUsuario();
        }
    }
    protected void CargarOpcionesUsuario()
    {
        if(liUsuario.Visible)
        {
            blUserOpts.Items.Add(new ListItem("My Account", "1"));

            if (UserService.IsUserLogged())
            {
                if (UserService.GetCategoria(HttpContext.Current.Request.Cookies["Username"].Value) == 1)
                    blUserOpts.Items.Add(new ListItem("Dashboard", "2"));
                else
                    blUserOpts.Items.Add(new ListItem("My Orders", "2"));
            }
            else
            {
                if (UserService.GetCategoria(Session["Username"].ToString()) == 1)
                    blUserOpts.Items.Add(new ListItem("Dashboard", "2"));
                else
                    blUserOpts.Items.Add(new ListItem("My Orders", "2"));
            }

            blUserOpts.Items.Add(new ListItem("Logout", "3"));
        }

    }
    protected void blUserOpts_Click(object sender, BulletedListEventArgs e)
    {
        string mUser = null;

        try
        {
            if (UserService.IsUserLogged())
                mUser = HttpContext.Current.Request.Cookies["Username"].Value;
            else if (Session["Username"] != null)
                mUser = Session["Username"].ToString();
        }
        catch (Exception ex)
        {
            Response.Redirect("Error.aspx?" + ex.Message);
        }

        switch(blUserOpts.Items[e.Index].Value)
        {
            case "1":
                Response.Redirect("Account.aspx?Id=" + UserService.GetUserId(mUser));
                break;
            case "2":
                if (Global.IdCategoriaUser == 1)
                    Response.Redirect("Dashboard.aspx");
                else
                    Response.Redirect("Orders.aspx");
                break;
            case "3":
                if (UserService.IsUserLogged())
                {
                    HttpContext.Current.Request.Cookies.Remove("Username");
                    Response.Cookies["Username"].Expires = DateTime.Now;
                }
                else
                {
                    Session.Remove("Username");
                }

                liUsuario.Visible = false;

                if (Global.IdCategoriaUser == 1)
                    liCarrito.Visible = true;

                Global.IdCategoriaUser = 0;
                Global.IdUser = 0;

                Response.Redirect("Home.aspx");
                break;
        }
    }
}
