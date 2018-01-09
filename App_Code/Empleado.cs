using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Empleado
/// </summary>
public class Empleado
{
    private int mLegajo;
    private string mNombre;
    private string mApellido;
    private string mDni;
    private Categoria mCategoria = new Categoria();
    public Empleado()
    { }
    public int Legajo
    {
        get { return mLegajo; }
        set { mLegajo = value; }
    }
    public string Nombre
    {
        get { return mNombre; }
        set { mNombre = value; }
    }
    public string Apellido
    {
        get { return mApellido; }
        set { mApellido = value; }
    }
    public string Dni
    {
        get { return mDni; }
        set { mDni = value; }
    }
    public Categoria Categoria
    {
        get { return mCategoria; }
        set { mCategoria = value; }
    }
}