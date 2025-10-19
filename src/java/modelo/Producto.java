package modelo;

import java.math.BigDecimal;

public class Producto {
    private int idProducto;
    private int idCategoria;
    private String nombre;
    private String descripcion;
    private BigDecimal precioUnitario;
    private int stock;
    private boolean activo;
    private String imagen; // ruta relativa dentro de /images/ (ej: "images/prod1.jpg")

    public Producto() {}

    // Constructor auxiliar para crear productos que vienen desde UI (no desde DB)
    public Producto(int idProducto, String nombre, BigDecimal precioUnitario, int stock, String imagen) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precioUnitario = precioUnitario;
        this.stock = stock;
        this.imagen = imagen;
    }

    // getters y setters
    public int getIdProducto() { return idProducto; }
    public void setIdProducto(int idProducto) { this.idProducto = idProducto; }

    public int getIdCategoria() { return idCategoria; }
    public void setIdCategoria(int idCategoria) { this.idCategoria = idCategoria; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public BigDecimal getPrecioUnitario() { return precioUnitario; }
    public void setPrecioUnitario(BigDecimal precioUnitario) { this.precioUnitario = precioUnitario; }

    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }

    public boolean isActivo() { return activo; }
    public void setActivo(boolean activo) { this.activo = activo; }

    public String getImagen() { return imagen; }
    public void setImagen(String imagen) { this.imagen = imagen; }
}
