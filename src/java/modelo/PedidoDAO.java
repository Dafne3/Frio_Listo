/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.*;
import java.math.BigDecimal;
import java.util.List;

public class PedidoDAO {

    private Connection obtenerConexion() throws SQLException {
        return Conexion.getConnection();
    }

    public int registrarPedido(BigDecimal total, List<CarritoItem> carrito) {
        int idGenerado = 0;

        String sqlPedido = "INSERT INTO pedido(total) VALUES(?)";
        String sqlDetalle = "INSERT INTO detalle_pedido(idPedido, idProducto, cantidad, precioUnitario, subtotal) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = obtenerConexion()) {

            con.setAutoCommit(false);

            // Insertar pedido
            PreparedStatement ps = con.prepareStatement(sqlPedido, Statement.RETURN_GENERATED_KEYS);
            ps.setBigDecimal(1, total);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                idGenerado = rs.getInt(1);
            }

            // Insertar detalles
            PreparedStatement psDet = con.prepareStatement(sqlDetalle);
            for (CarritoItem item : carrito) {
                psDet.setInt(1, idGenerado);
                psDet.setInt(2, item.getProducto().getIdProducto());
                psDet.setInt(3, item.getCantidad());
                psDet.setBigDecimal(4, item.getProducto().getPrecioUnitario());
                psDet.setBigDecimal(5, item.getSubtotal());
                psDet.addBatch();
            }
            psDet.executeBatch();

            con.commit();

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("❌ Error registrando pedido: " + e.getMessage());
        }

        return idGenerado;
    }
}
