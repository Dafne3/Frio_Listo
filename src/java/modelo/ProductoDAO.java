package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    // ✅ Obtener conexión usando tu clase Conexion.java
    private Connection obtenerConexion() throws SQLException {
        // Usa el método estático (el más seguro)
        return Conexion.getConnection();
    }

    /**
     * 🔹 Obtiene un producto por su ID (usado en detalleProducto.jsp y CarritoServlet)
     */
    public Producto obtenerPorId(int idProducto) {
        Producto producto = null;
        String sql = "SELECT * FROM producto WHERE idProducto = ?";

        try (Connection con = obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idProducto);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    producto = new Producto();
                    producto.setIdProducto(rs.getInt("idProducto"));
                    producto.setNombre(rs.getString("nombre"));
                    producto.setDescripcion(rs.getString("descripcion"));
                    producto.setPrecioUnitario(rs.getBigDecimal("precioUnitario"));
                    producto.setStock(rs.getInt("stock"));
                    producto.setImagen(rs.getString("imagen"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("❌ Error al obtener producto por ID: " + e.getMessage());
        }
        return producto;
    }

    /**
     * 🔹 Lista todos los productos (para productos.jsp)
     */
    public List<Producto> listar() {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM producto";

        try (Connection con = obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecioUnitario(rs.getBigDecimal("precioUnitario"));
                producto.setStock(rs.getInt("stock"));
                producto.setImagen(rs.getString("imagen"));
                lista.add(producto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("❌ Error al listar productos: " + e.getMessage());
        }

        return lista;
    }

    /**
     * 🔹 Agrega un nuevo producto (para administrador)
     */
    public boolean agregar(Producto producto) {
        String sql = "INSERT INTO producto(nombre, descripcion, precioUnitario, stock, imagen) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setBigDecimal(3, producto.getPrecioUnitario());
            ps.setInt(4, producto.getStock());
            ps.setString(5, producto.getImagen());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("❌ Error al agregar producto: " + e.getMessage());
            return false;
        }
    }

    /**
     * 🔹 Actualiza un producto existente
     */
    public boolean actualizar(Producto producto) {
        String sql = "UPDATE producto SET nombre=?, descripcion=?, precioUnitario=?, stock=?, imagen=? WHERE idProducto=?";
        try (Connection con = obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setBigDecimal(3, producto.getPrecioUnitario());
            ps.setInt(4, producto.getStock());
            ps.setString(5, producto.getImagen());
            ps.setInt(6, producto.getIdProducto());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("❌ Error al actualizar producto: " + e.getMessage());
            return false;
        }
    }

    /**
     * 🔹 Elimina un producto por su ID
     */
    public boolean eliminar(int idProducto) {
        String sql = "DELETE FROM producto WHERE idProducto=?";
        try (Connection con = obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idProducto);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("❌ Error al eliminar producto: " + e.getMessage());
            return false;
        }
    }
}
