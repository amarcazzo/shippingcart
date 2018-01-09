using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de DetalleVenta
/// </summary>
public class DetalleVenta
{
    private int mId;
    private Producto mProducto = new Producto();
    private int mCantidad;
    private float mPrecioUnitario;

    public DetalleVenta()
    {   }

    public DetalleVenta(int IdProducto, string Descripcion, int Cantidad, float Precio)
    {
        mProducto.Id = IdProducto;
        mProducto.Nombre = Descripcion;
        mCantidad = Cantidad;
        mPrecioUnitario = Precio;
    }

    public int Id
    {
        get { return mId; }
        set { mId = value; }
    }

    public Producto Producto
    {
        get { return mProducto; }
        set { mProducto = value; }
    }

    public int Cantidad
    {
        get { return mCantidad; }
        set { mCantidad = value; }
    }

    public float PrecioUnitario
    {
        get { return mPrecioUnitario; }
        set { mPrecioUnitario = value; }
    }

    public float Precio
    {
        get { return mPrecioUnitario * mCantidad; }
    }
}