using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de MarcaService
/// </summary>
public class MarcaService
{
    public MarcaService()
    { }

    public List<Marca> GetMarcas()
    {
        List<Marca> mMarcas = new List<Marca>();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select distinct Marca from Productos";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            while (Reader.Read())
            {
                Marca mAux = new Marca();

                mAux.Descripcion = Reader["Marca"].ToString();

                mMarcas.Add(mAux);
            }

            return mMarcas;
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