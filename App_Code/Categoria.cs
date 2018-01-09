using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Categoria
/// </summary>
public class Categoria
{
    private int mId;
    private string mDescripcion;

    public Categoria()
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
}