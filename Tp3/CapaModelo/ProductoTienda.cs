﻿namespace CapaModelo
{
    public class ProductoTienda
    {
        public int IdProductoTienda { get; set; }
        public Producto oProducto { get; set; }
        public Tienda oTienda { get; set; }
        public int Stock { get; set; }
        public decimal PrecioUnidadCompra { get; set; }
        public decimal PrecioUnidadVenta { get; set; }
        public bool Iniciado { get; set; }
    }
}
