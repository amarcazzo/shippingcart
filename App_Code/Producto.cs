using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Producto
/// </summary>
public class Producto
{
    private int mId;
    private string mNombre;
    private string mDescripcion;
    private Categoria mCategoria = new Categoria();
    private string mMarca;
    private string mImagen;
    private float mPrecio;

    public Producto()
    {  }

    public Producto(string Nombre, string Descripcion, int IdCategoria, string Imagen, float Precio)
    {
        mNombre = Nombre;
        mDescripcion = Descripcion;
        mCategoria.Id = IdCategoria;
        mImagen = Imagen;
        mPrecio = Precio;
    }

    public int Id
    {
        get { return mId; }
        set { mId = value; }
    }

    public string Nombre
    {
        get { return mNombre; }
        set { mNombre = value; }
    }

    public string Descripcion
    {
        get { return mDescripcion; }
        set { mDescripcion = value; }
    }

    public Categoria Categoria
    {
        get { return mCategoria; }
        set { mCategoria = value; }
    }

    public string Imagen
    {
        get { return mImagen; }
        set { mImagen = value; }
    }

    public float Precio
    {
        get { return mPrecio; }
        set { mPrecio = value; }
    }

    public string Marca
    {
        get { return mMarca; }
        set { mMarca = value; }
    }

}