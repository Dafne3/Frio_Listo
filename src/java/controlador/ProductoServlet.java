package controlador;

import modelo.Producto;
import modelo.CarritoItem;
import modelo.Conexion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.util.*;

@WebServlet("/ProductoServlet")
public class ProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // GET: listar productos o mostrar detalle
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("listar")) {
            listarProductos(request, response);
        } else if (action.equals("detalle")) {
            mostrarDetalle(request, response);
        } else {
            listarProductos(request, response);
        }
    }

    // Lista productos desde BD (solo los de idProducto >= 3)
    private void listarProductos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Producto> productos = new ArrayList<>();
        // ✅ Filtra productos desde idProducto = 3
        String sql = "SELECT idProducto, idCategoria, nombre, descripcion, precioUnitario, stock, activo "
           + "FROM productos WHERE activo = 1 AND idProducto IN (3,4,5,6,7,8,9 ,10,11,12,13,14) "
           + "ORDER BY FIELD(idProducto, 3,4,5,6,7,8,9,10,11,12,13,14)";


        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Producto p = new Producto();
                p.setIdProducto(rs.getInt("idProducto"));
                p.setIdCategoria(rs.getInt("idCategoria"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecioUnitario(rs.getBigDecimal("precioUnitario"));
                p.setStock(rs.getInt("stock"));
                p.setActivo(rs.getBoolean("activo"));

                // ✅ Ajusta el nombre de la imagen desde prod1.jpg
                // Si tu primera imagen (Coca-Cola) es prod1.jpg, 
                // entonces el producto con id=3 usará prod1.jpg
                int imagenIndex = p.getIdProducto() - 2; 
                p.setImagen("images/prod" + imagenIndex + ".jpg");

                productos.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        // Sincronizar carrito si el usuario tiene uno pendiente
        HttpSession session = request.getSession();
        Object carritoObj = session.getAttribute("carrito");
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");

        if (usuarioId != null && carritoObj == null) {
            Map<Integer, CarritoItem> carritoFromDb = cargarPedidoPendiente(usuarioId);
            if (carritoFromDb != null && !carritoFromDb.isEmpty()) {
                session.setAttribute("carrito", carritoFromDb);
            }
        }

        request.setAttribute("productos", productos);
        request.getRequestDispatcher("productos.jsp").forward(request, response);
    }

    // Obtener producto por id y enviar a detalleProducto.jsp
    private void mostrarDetalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("ProductoServlet?action=listar");
            return;
        }

        int id = Integer.parseInt(idStr);
        Producto p = null;
        String sql = "SELECT idProducto, idCategoria, nombre, descripcion, precioUnitario, stock, activo " +
                     "FROM productos WHERE idProducto = ? AND idProducto >= 3"; // ✅ No mostrar los primeros dos productos

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Producto();
                    p.setIdProducto(rs.getInt("idProducto"));
                    p.setIdCategoria(rs.getInt("idCategoria"));
                    p.setNombre(rs.getString("nombre"));
                    p.setDescripcion(rs.getString("descripcion"));
                    p.setPrecioUnitario(rs.getBigDecimal("precioUnitario"));
                    p.setStock(rs.getInt("stock"));
                    p.setActivo(rs.getBoolean("activo"));

                    // ✅ Ajuste del índice de imagen
                    int imagenIndex = p.getIdProducto() - 2;
                    p.setImagen("images/prod" + imagenIndex + ".jpg");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        if (p == null) {
            response.sendRedirect("ProductoServlet?action=listar");
            return;
        }

        request.setAttribute("producto", p);
        request.getRequestDispatcher("detalleProducto.jsp").forward(request, response);
    }


    // Lee pedido pendiente (estado 'Pendiente') y arma Map<idProducto, CarritoItem>
    private Map<Integer, CarritoItem> cargarPedidoPendiente(int usuarioId) {
        Map<Integer, CarritoItem> carrito = new LinkedHashMap<>();
        String sqlPedido = "SELECT idPedido FROM pedidos WHERE idUsuario = ? AND estado = 'Pendiente' ORDER BY fechaPedido DESC LIMIT 1";
        String sqlDetalle = "SELECT dp.idProducto, dp.cantidad, dp.precioVenta, p.nombre, p.descripcion, p.precioUnitario " +
                "FROM detallesPedido dp JOIN productos p ON dp.idProducto = p.idProducto WHERE dp.idPedido = ?";

        try (Connection con = Conexion.getConnection();
             PreparedStatement psPedido = con.prepareStatement(sqlPedido)) {
            psPedido.setInt(1, usuarioId);
            try (ResultSet rsPedido = psPedido.executeQuery()) {
                if (rsPedido.next()) {
                    int idPedido = rsPedido.getInt("idPedido");
                    try (PreparedStatement psDet = con.prepareStatement(sqlDetalle)) {
                        psDet.setInt(1, idPedido);
                        try (ResultSet rsDet = psDet.executeQuery()) {
                            while (rsDet.next()) {
                                int idProd = rsDet.getInt("idProducto");
                                int cantidad = rsDet.getInt("cantidad");
                                BigDecimal precioUnitario = rsDet.getBigDecimal("precioUnitario");

                                Producto p = new Producto();
                                p.setIdProducto(idProd);
                                p.setNombre(rsDet.getString("nombre"));
                                p.setDescripcion(rsDet.getString("descripcion"));
                                p.setPrecioUnitario(precioUnitario);
                                p.setImagen("images/prod" + idProd + ".jpg");

                                CarritoItem item = new CarritoItem(p, cantidad);
                                carrito.put(idProd, item);
                            }
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return carrito;
    }
}

