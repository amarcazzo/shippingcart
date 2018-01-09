using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Global
/// </summary>
public static class Global
{
    static int _IdUser;
    static int _IdCategoriaUser;

    public static int IdUser
    {
        get { return _IdUser; }
        set { _IdUser = value; }
    }

    public static int IdCategoriaUser
    {
        get { return _IdCategoriaUser; }
        set { _IdCategoriaUser = value; }
    }
}