using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de EmpleadoService
/// </summary>
public class EmpleadoService
{
    public EmpleadoService()
    {    }

    public List<Empleado> GetEmpleados()
    {
        List<Empleado> mEmpleados = new List<Empleado>();

        string Ruta = "Data Source = localhost\\sqlexpress; Initial Catalog = Empresa;Integrated Security = True";
        string Consulta = "select * from VW_Empleados";

        SqlConnection Conexion = new SqlConnection(Ruta);
        SqlCommand Comando = new SqlCommand(Consulta, Conexion);

        try
        {
            Conexion.Open();

            SqlDataReader Reader = Comando.ExecuteReader();

            while (Reader.Read())
            {
                Empleado mAux = new Empleado();

                mAux.Legajo = int.Parse(Reader["Legajo"].ToString());
                mAux.Nombre = Reader["Nombre"].ToString();
                mAux.Apellido = Reader["Apellido"].ToString();
                mAux.Dni = Reader["DNI"].ToString();
                mAux.Categoria.Descripcion = Reader["Descripcion"].ToString();

                mEmpleados.Add(mAux);
            }

            return mEmpleados;
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