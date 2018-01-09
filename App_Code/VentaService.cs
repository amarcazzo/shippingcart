using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Descripción breve de VentaService
/// </summary>
public class VentaService
{
    public VentaService()
    { }

    public List<Venta> GetVentas()
    {
        List<Venta> mVentas = new List<Venta>();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from VW_Ventas";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            while (Reader.Read())
            {
                Venta mAux = new Venta();

                mAux.Id = int.Parse(Reader["IdVenta"].ToString());
                mAux.Fecha = DateTime.Parse(Reader["Fecha"].ToString());
                mAux.Monto = float.Parse(Reader["Monto"].ToString());
                mAux.User.Nombre = Reader["Nombre"].ToString();
                mAux.User.Apellido = Reader["Apellido"].ToString(); 

                mVentas.Add(mAux);
            }

            return mVentas;
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

    public List<Venta> GetVentas(int Id)
    {
        List<Venta> mVentas = new List<Venta>();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from Ventas where IdUsuario=" + Id;

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            while (Reader.Read())
            {
                Venta mAux = new Venta();

                mAux.Id = int.Parse(Reader["IdVenta"].ToString());
                mAux.Fecha = DateTime.Parse(Reader["Fecha"].ToString());
                mAux.Monto = float.Parse(Reader["Monto"].ToString());

                mVentas.Add(mAux);
            }

            return mVentas;
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

    public List<DetalleVenta> GetDetalleVenta(int Id)
    {
        List<DetalleVenta> mDetalle = new List<DetalleVenta>();

        string mRuta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string mConsulta = "select * from DetalleVentas where IDVenta =" + Id;


        SqlConnection mConexion = new SqlConnection(mRuta);
        SqlCommand mComando = new SqlCommand(mConsulta, mConexion);

        try
        {
            mConexion.Open();

            SqlDataReader mReader = mComando.ExecuteReader();

            while (mReader.Read())
            {
                DetalleVenta mAux = new DetalleVenta();

                mAux.Id = int.Parse(mReader["IdVenta"].ToString());
                mAux.Producto.Nombre = mReader["Nombre"].ToString();
                mAux.PrecioUnitario = float.Parse(mReader["Precio"].ToString());
                mAux.Cantidad = int.Parse(mReader["Cantidad"].ToString());

                mDetalle.Add(mAux);
            }

            return mDetalle;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            mConexion.Close();
            mConexion.Dispose();
        }
    }

    public bool AltaVenta(float Monto)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand("SP_AltaVenta", Conexion);

        try
        {
            Conexion.Open();

            Comando.CommandType = System.Data.CommandType.StoredProcedure;

            Comando.Parameters.Add("@IdUsuario", SqlDbType.Int).Value = Global.IdUser;
            Comando.Parameters.Add("@Monto", SqlDbType.Money).Value = Monto;
            Comando.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = DateTime.Now;


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

    public void AltaDetalleVenta(DetalleVenta mDetalle)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand("SP_AltaDetalleVenta", Conexion);

        try
        {
            Conexion.Open();

            Comando.CommandType = System.Data.CommandType.StoredProcedure;

            Comando.Parameters.Add("@IDVenta", SqlDbType.Int).Value = mDetalle.Id;
            Comando.Parameters.Add("@IDProducto", SqlDbType.Int).Value = mDetalle.Producto.Id;
            Comando.Parameters.Add("@Cantidad", SqlDbType.Int).Value = mDetalle.Cantidad;
            Comando.Parameters.Add("@Precio", SqlDbType.Money).Value = mDetalle.PrecioUnitario;

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

    public int GetIdVenta(int IdUser)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select top 1 IDVenta from Ventas where IdUsuario =" + IdUser + " order by IDVenta desc";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            int IdVenta = 0;

            while (Reader.Read())
                IdVenta = int.Parse(Reader["IDVenta"].ToString());

            return IdVenta;
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