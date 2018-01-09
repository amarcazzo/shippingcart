using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de CategoriaService
/// </summary>
public class CategoriaService
{
    public CategoriaService()
    {  }

    public List<Categoria> GetCategorias(string Tipo)
    {
        List<Categoria> mCategorias = new List<Categoria>();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from Categorias" + Tipo;

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            while (Reader.Read())
            {
                Categoria mAux = new Categoria();

                mAux.Id = int.Parse(Reader["IdCategoria"].ToString());
                mAux.Descripcion = Reader["Descripcion"].ToString();

                mCategorias.Add(mAux);
            }

            return mCategorias;
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