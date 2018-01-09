using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Descripción breve de ProductoService
/// </summary>
public class ProductoService
{
    public ProductoService()
    { }

    public List<Producto> GetProductos()
    {
        List<Producto> mProductos = new List<Producto>();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from Productos where Estado = 1";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            while(Reader.Read())
            {
                Producto mAux = new Producto();

                mAux.Id = int.Parse(Reader["IdProducto"].ToString());
                mAux.Nombre = Reader["Nombre"].ToString();
                mAux.Descripcion = Reader["Descripcion"].ToString();
                mAux.Precio = float.Parse(Reader["Precio"].ToString());
                mAux.Marca = Reader["Marca"].ToString();
                mAux.Categoria.Id = int.Parse(Reader["IdCategoria"].ToString());
                mAux.Imagen = Reader["Imagen"].ToString();

                mProductos.Add(mAux);
            }

            return mProductos;
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

    public Producto GetProducto(int Id)
    {
        Producto mProducto = new Producto();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from Productos where IDProducto=" + Id;

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            Comando.CommandType = CommandType.Text;

            SqlDataReader mReader = Comando.ExecuteReader();

            if(mReader.Read())
            {
                mProducto.Nombre = mReader["Nombre"].ToString();
                mProducto.Descripcion = mReader["Descripcion"].ToString();
                mProducto.Precio = float.Parse(mReader["Precio"].ToString());
                mProducto.Marca = mReader["Marca"].ToString();
                mProducto.Categoria.Id = int.Parse(mReader["IdCategoria"].ToString());
                mProducto.Imagen = mReader["Imagen"].ToString();
            }

            return mProducto;
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

    public bool CreateProduct(Producto Aux)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand("SP_AltaProducto", Conexion);

        try
        {
            Conexion.Open();

            Comando.CommandType = System.Data.CommandType.StoredProcedure;

            Comando.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = Aux.Nombre;
            Comando.Parameters.Add("@Marca", SqlDbType.VarChar).Value = Aux.Marca;
            Comando.Parameters.Add("@Descripcion", SqlDbType.VarChar).Value = Aux.Descripcion;
            Comando.Parameters.Add("@IdCategoria", SqlDbType.Int).Value = Aux.Categoria.Id;
            Comando.Parameters.Add("@Precio", SqlDbType.Money).Value = Aux.Precio;
            Comando.Parameters.Add("@Imagen", SqlDbType.VarChar).Value = Aux.Imagen;

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

    public void UpdateProducto(Producto mProducto)
    {
        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand("SP_UpdateProducto", Conexion);

        try
        {
            Conexion.Open();

            Comando.CommandType = System.Data.CommandType.StoredProcedure;

            Comando.Parameters.Add("@Id", SqlDbType.Int).Value = mProducto.Id;
            Comando.Parameters.Add("@Descripcion", SqlDbType.VarChar).Value = mProducto.Descripcion;
            Comando.Parameters.Add("@Marca", SqlDbType.VarChar).Value = mProducto.Marca;
            Comando.Parameters.Add("@IDCategoria", SqlDbType.Int).Value = mProducto.Categoria.Id;
            Comando.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = mProducto.Nombre;
            Comando.Parameters.Add("@Imagen", SqlDbType.VarChar).Value = mProducto.Imagen;
            Comando.Parameters.Add("@Precio", SqlDbType.Money).Value = mProducto.Precio;


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

    public bool DeleteProducto(int Id)
    {
        Producto mProducto = new Producto();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "update Productos set Estado = 0 where IDProducto=" + Id;

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            Comando.CommandType = CommandType.Text;

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

    public List<Producto> GetMasVendidos()
    {
        List<Producto> mProductos = new List<Producto>();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from VW_MasVendidos";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            while (Reader.Read())
            {
                Producto mAux = new Producto();

                mAux.Id = int.Parse(Reader["IdProducto"].ToString());
                mAux.Nombre = Reader["Nombre"].ToString();
                mAux.Imagen = Reader["Imagen"].ToString();

                mProductos.Add(mAux);
            }

            return mProductos;
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