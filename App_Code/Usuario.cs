using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
/// <summary>
/// Descripción breve de Usuario
/// </summary>
public class Usuario
{
    private int mId; 
    private string mUser;
    private string mPassword;
    private Categoria mCategoria = new Categoria();
    private string mEmail;
    private string mNombre;
    private string mApellido;

    public Usuario()
    {  }
    public Usuario(int mId , string mUser , string mPassword , Categoria mCategoria , string mEmail , string mNombre , string mApellido)
    {
        this.mId = mId;
        this.mUser = mUser;
        this.mPassword = mPassword;
        this.mCategoria = mCategoria;
        this.mEmail = mEmail;
        this.mNombre = mNombre;
        this.mApellido = mApellido;
    }
    public int Id
    {
        get { return mId; }
        set { mId = value; }
    }

    public string User
    {
        get { return mUser; }
        set { mUser = value; }
    }

    public string Password
    {
        get { return mPassword; }
        set { mPassword = value; }
    }

    public string Email
    {
        get { return mEmail; }
        set { mEmail = value; }
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

    public Categoria Categoria
    {
        get { return mCategoria; }
        set { mCategoria = value; }
    }

    public string NombreCompleto
    {
        get { return mApellido + ", " + mNombre; }
    }

}