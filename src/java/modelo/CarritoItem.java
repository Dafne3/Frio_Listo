package modelo;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class CarritoItem {
    private Producto producto;
    private int cantidad;

    public CarritoItem() {}

    public CarritoItem(Producto producto, int cantidad) {
        this.producto = producto;
        setCantidad(cantidad);
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        if (cantidad < 1) cantidad = 1;

        // 🔒 Control de stock (si el producto tiene límite)
        if (producto != null && producto.getStock() > 0 && cantidad > producto.getStock()) {
            this.cantidad = producto.getStock();
        } else {
            this.cantidad = cantidad;
        }
    }

    // 🔹 Subtotal calculado de forma segura y redondeada
    public BigDecimal getSubtotal() {
        if (producto == null || producto.getPrecioUnitario() == null) {
            return BigDecimal.ZERO;
        }

        BigDecimal subtotal = producto.getPrecioUnitario()
                .multiply(new BigDecimal(cantidad))
                .setScale(2, RoundingMode.HALF_UP);
        return subtotal;
    }

    // 🔹 Método auxiliar para verificar disponibilidad
    public boolean hayStockDisponible() {
        return producto != null && producto.getStock() >= cantidad;
    }

    // 🔹 Método para aumentar cantidad (validando stock)
    public void aumentarCantidad(int extra) {
        if (extra < 1) return;

        int nuevaCantidad = this.cantidad + extra;
        if (producto != null && nuevaCantidad > producto.getStock()) {
            this.cantidad = producto.getStock();
        } else {
            this.cantidad = nuevaCantidad;
        }
    }
}

