using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de SucursalService
/// </summary>
public class SucursalService
{
    public SucursalService()
    { }

    public List<Sucursal> GetSucursales()
    {
        List<Sucursal> mSucursales = new List<Sucursal>();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from Sucursales";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            while (Reader.Read())
            {
                Sucursal mAux = new Sucursal();

                mAux.Id = int.Parse(Reader["IdSucursal"].ToString());
                mAux.Descripcion = Reader["Descripcion"].ToString();
                mAux.CodigoPostal = int.Parse(Reader["CP"].ToString());
                mAux.Direccion = Reader["Direccion"].ToString();
                mAux.Mapa = Reader["Mapa"].ToString();

                mSucursales.Add(mAux);
            }

            return mSucursales;
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