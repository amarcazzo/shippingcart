using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Sucursal
/// </summary>
public class Sucursal
{
    private int mId;
    private string mDescripcion;
    private int mCodigoPostal;
    private string mDireccion;
    private string mMapa; 

    public Sucursal()
    { }
    public int Id
    {
        get { return mId; }
        set { mId = value; }
    }
    public string Descripcion
    {
        get { return mDescripcion; }
        set { mDescripcion = value; }
    }
    public int CodigoPostal
    {
        get { return mCodigoPostal; }
        set { mCodigoPostal = value; }
    }
    public string Direccion
    {
        get { return mDireccion; }
        set { mDireccion = value; }
    }
    public string Mapa
    {
        get { return mMapa; }
        set { mMapa = value; }
    }
}