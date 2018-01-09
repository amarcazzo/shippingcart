using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Descripción breve de CartService
/// </summary>
public class CartService
{
    public CartService()
    { }

    public List<DetalleVenta> GetCarrito()
    {
        DataTable mCarrito;

        mCarrito = ((DataTable)HttpContext.Current.Application["Carrito"]);

        List<DetalleVenta> mDetalle = new List<DetalleVenta>();

        if (mCarrito != null)
            foreach (DataRow x in mCarrito.Rows)
                mDetalle.Add(new DetalleVenta(int.Parse(x["Id"].ToString()), x["Producto"].ToString(), int.Parse(x["Cantidad"].ToString()), float.Parse(x["PrecioUnitario"].ToString())));

        return mDetalle;
    }

    public DataTable CrearCarrito()
    {
        DataTable mCarrito = new DataTable();

        mCarrito.Columns.Add(new DataColumn("Id", System.Type.GetType("System.Int32")));
        mCarrito.Columns.Add(new DataColumn("Producto", System.Type.GetType("System.String")));
        mCarrito.Columns.Add(new DataColumn("Cantidad", System.Type.GetType("System.Int32")));
        mCarrito.Columns.Add(new DataColumn("PrecioUnitario", System.Type.GetType("System.Single")));
        mCarrito.Columns.Add(new DataColumn("Precio", System.Type.GetType("System.Single")));

        return mCarrito;
    }

    public void AgregarItem(int Id, string Producto, float Precio)
    {
        DataRow dRow;

        dRow = ((DataTable)HttpContext.Current.Application["Carrito"]).NewRow();

        dRow["Id"] = Id;
        dRow["Producto"] = Producto;
        dRow["Cantidad"] = 1;
        dRow["PrecioUnitario"] = Precio;
        dRow["Precio"] = Precio;
        

        ((DataTable)HttpContext.Current.Application["Carrito"]).Rows.Add(dRow);

    }

    public void ActualizarItem(int Row, int Cantidad, float Precio)
    {
        ((DataTable)HttpContext.Current.Application["Carrito"]).Rows[Row]["Cantidad"] = Cantidad;
        ((DataTable)HttpContext.Current.Application["Carrito"]).Rows[Row]["Precio"] = Precio;
    }
}