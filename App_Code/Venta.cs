using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Venta
/// </summary>
public class Venta
{
    private int mId;
    private DateTime mFecha;
    private float mMonto;
    private Usuario mUser = new Usuario();

    public Usuario User
    {
        get { return mUser; }
        set { mUser = value; }
    }
    public string NombreUsuario
    {
        get { return mUser.Apellido + ", " + mUser.Nombre; }
    }
    public Venta()
    { }
    public int Id
    {
        get { return mId; }
        set { mId = value; }
    }
    public DateTime Fecha
    {
        get { return mFecha; }
        set { mFecha = value; }
    }
    public float Monto
    {
        get { return mMonto; }
        set { mMonto = value; }
    }
}