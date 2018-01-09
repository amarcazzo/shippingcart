using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Descripción breve de UsuarioService
/// </summary>
public class UsuarioService
{
    public UsuarioService()
    {  }

    public bool CheckUser(string User, string Password)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from Usuarios where Usuario = '" + User + "' and Pass = '" + Password + "'";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            if (!Reader.Read())
                return false;
            else
                return true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            Conexion.Close();
            Conexion.Dispose();
        }
    }

    public Usuario GetUser(int Id)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from Usuarios where IdUsuario = " + Id;

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            Usuario mAux = new Usuario();

            if(Reader.Read())
            {
                mAux.Id = Id;
                mAux.User = Reader["Usuario"].ToString();
                mAux.Password = Reader["Pass"].ToString();
                mAux.Nombre = Reader["Nombre"].ToString();
                mAux.Apellido = Reader["Apellido"].ToString();
                mAux.Email = Reader["Email"].ToString();
            }

            return mAux;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            Conexion.Close();
            Conexion.Dispose();
        }
    }

    public int GetUserId(string User)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select IdUsuario from Usuarios where Usuario = '" + User + "'";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader mReader = Comando.ExecuteReader();

            int Id = 0;

            if(mReader.Read())
                Id = int.Parse(mReader["IdUsuario"].ToString());

            return Id;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            Conexion.Close();
            Conexion.Dispose();
        }
    }

    public int GetCategoria(string User)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select IdCategoriaUsuario from Usuarios where Usuario = '" + User + "'";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader mReader = Comando.ExecuteReader();

            int Id = 0;

            if (mReader.Read())
                Id = int.Parse(mReader["IdCategoriaUsuario"].ToString());

            return Id;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            Conexion.Close();
            Conexion.Dispose();
        }
    }

    public bool IsUserLogged()
    {
        try
        {
            if (HttpContext.Current.Request.Cookies["Username"] == null)
                return false;
            else
                return true;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public bool CreateUser(Usuario User)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand("SP_AltaUsuario", Conexion);

        try
        {
            Conexion.Open();

            Comando.CommandType = System.Data.CommandType.StoredProcedure;

            Comando.Parameters.Add("@Usuario", SqlDbType.VarChar).Value = User.User;
            Comando.Parameters.Add("@Pass", SqlDbType.VarChar).Value = User.Password;
            Comando.Parameters.Add("@Email", SqlDbType.VarChar).Value = User.Email;
            Comando.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = User.Nombre;
            Comando.Parameters.Add("@Apellido", SqlDbType.VarChar).Value = User.Apellido;

            if (Comando.ExecuteNonQuery() == 0)
                return false;
            else
                return true;

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            Conexion.Close();
            Conexion.Dispose();
        }
    }

    public void UpdateUser(Usuario User)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand("SP_UpdateUsuario", Conexion);

        try
        {
            Conexion.Open();

            Comando.CommandType = System.Data.CommandType.StoredProcedure;

            Comando.Parameters.Add("@Id", SqlDbType.Int).Value = User.Id;
            Comando.Parameters.Add("@Usuario", SqlDbType.VarChar).Value = User.User;
            Comando.Parameters.Add("@Pass", SqlDbType.VarChar).Value = User.Password;
            Comando.Parameters.Add("@Email", SqlDbType.VarChar).Value = User.Email;
            Comando.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = User.Nombre;
            Comando.Parameters.Add("@Apellido", SqlDbType.VarChar).Value = User.Apellido;

            Comando.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            Conexion.Close();
            Conexion.Dispose();
        }
    }

    public List<Usuario> GetUsuarios()
    {
        List<Usuario> mUsuarios = new List<Usuario>();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from VW_Usuarios";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            while (Reader.Read())
            {
                Usuario mAux = new Usuario();

                mAux.Id = int.Parse(Reader["IdUsuario"].ToString());
                mAux.User = Reader["Usuario"].ToString();
                mAux.Nombre = Reader["Nombre"].ToString();
                mAux.Apellido = Reader["Apellido"].ToString();
                mAux.Email = Reader["Email"].ToString();
                mAux.Categoria.Descripcion = Reader["Descripcion"].ToString();

                mUsuarios.Add(mAux);
            }

            return mUsuarios;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            Conexion.Close();
            Conexion.Dispose();
        }
    }
}