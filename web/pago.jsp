package controlador;

import modelo.CarritoItem;
import modelo.Producto;
import modelo.Conexion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;

import com.google.gson.Gson;

@WebServlet("/CarritoServlet")
public class CarritoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "listar";

        switch (action) {
            case "agregar":
                agregarAlCarrito(request, response);
                break;
            case "eliminar":
                eliminarItem(request, response);
                break;
            case "vaciar":
                vaciarCarrito(request, response);
                break;
            case "checkout":
                checkout(request, response);
                break;
            case "listar":
            default:
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
        }
    }

    // -------------------------
    // AGREGAR AL CARRITO (AJAX o normal)
    // -------------------------
    private void agregarAlCarrito(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int id;
        int cantidad;

        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de producto inválido");
            return;
        }

        try {
            cantidad = Integer.parseInt(request.getParameter("cantidad"));
            if (cantidad <= 0) cantidad = 1;
        } catch (Exception e) {
            cantidad = 1;
        }

        Producto p = obtenerProductoPorId(id);
        if (p == null) {
            if (isAjax(request)) {
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().print("{\"success\":false, \"msg\":\"Producto no encontrado\"}");
            } else {
                response.sendRedirect("ProductoServlet?action=listar");
            }
            return;
        }

        HttpSession session = request.getSession(true);
        @SuppressWarnings("unchecked")
        Map<Integer, CarritoItem> carrito = (Map<Integer, CarritoItem>) session.getAttribute("carrito");
        if (carrito == null) carrito = new LinkedHashMap<>();

        if (carrito.containsKey(id)) {
            CarritoItem it = carrito.get(id);
            it.setCantidad(it.getCantidad() + cantidad);
        } else {
            carrito.put(id, new CarritoItem(p, cantidad));
        }

        session.setAttribute("carrito", carrito);

        if (isAjax(request)) {
            response.setContentType("application/json;charset=UTF-8");
            Map<String, Object> out = new LinkedHashMap<>();
            out.put("success", true);
            out.put("id", p.getIdProducto());
            out.put("nombre", p.getNombre());
            out.put("precio", p.getPrecioUnitario());
            out.put("cantidad", cantidad);
            out.put("imagen", p.getImagen());
            out.put("totalItems", calcularCantidadTotal(carrito));
            out.put("subtotal", calcularSubtotal(carrito));

            String json = new Gson().toJson(out);
            response.getWriter().write(json);
        } else {
            response.sendRedirect("ProductoServlet?action=listar");
        }
    }

    // -------------------------
    // ELIMINAR ITEM
    // -------------------------
    private void eliminarItem(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int id;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (Exception e) {
            response.sendRedirect("CarritoServlet?action=listar");
            return;
        }

        HttpSession session = request.getSession(false);
        if (session != null) {
            @SuppressWarnings("unchecked")
            Map<Integer, CarritoItem> carrito = (Map<Integer, CarritoItem>) session.getAttribute("carrito");
            if (carrito != null) {
                carrito.remove(id);
                session.setAttribute("carrito", carrito);
            }
        }

        if (isAjax(request)) {
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write("{\"success\":true}");
        } else {
            response.sendRedirect("CarritoServlet?action=listar");
        }
    }

    // -------------------------
    // VACIAR CARRITO
    // -------------------------
    private void vaciarCarrito(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) session.removeAttribute("carrito");

        if (isAjax(request)) {
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write("{\"success\":true}");
        } else {
            response.sendRedirect("CarritoServlet?action=listar");
        }
    }

    // -------------------------
    // CHECKOUT
    // -------------------------
    private void checkout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        Integer usuarioId = session != null ? (Integer) session.getAttribute("usuarioId") : null;

        if (usuarioId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        @SuppressWarnings("unchecked")
        Map<Integer, CarritoItem> carrito = (Map<Integer, CarritoItem>) session.getAttribute("carrito");
        if (carrito == null || carrito.isEmpty()) {
            response.sendRedirect("ProductoServlet?action=listar");
            return;
        }

        try (Connection con = Conexion.getConnection()) {
            con.setAutoCommit(false);

            // Eliminar pedido pendiente anterior
            String findPedido = "SELECT idPedido FROM pedidos WHERE idUsuario = ? AND estado = 'Pendiente'";
            try (PreparedStatement psFind = con.prepareStatement(findPedido)) {
                psFind.setInt(1, usuarioId);
                try (ResultSet rs = psFind.executeQuery()) {
                    while (rs.next()) {
                        int idPed = rs.getInt("idPedido");
                        try (PreparedStatement psDelDet = con.prepareStatement("DELETE FROM detallesPedido WHERE idPedido = ?")) {
                            psDelDet.setInt(1, idPed);
                            psDelDet.executeUpdate();
                        }
                        try (PreparedStatement psDelPed = con.prepareStatement("DELETE FROM pedidos WHERE idPedido = ?")) {
                            psDelPed.setInt(1, idPed);
                            psDelPed.executeUpdate();
                        }
                    }
                }
            }

            // Insertar nuevo pedido
            String insertPedido = "INSERT INTO pedidos (idUsuario, total, estado, direccionEnvio, metodoPago) VALUES (?, ?, 'Pendiente', '', '')";
            BigDecimal total = calcularSubtotal(carrito);

            int idPedido;
            try (PreparedStatement psInsert = con.prepareStatement(insertPedido, Statement.RETURN_GENERATED_KEYS)) {
                psInsert.setInt(1, usuarioId);
                psInsert.setBigDecimal(2, total);
                psInsert.executeUpdate();
                try (ResultSet gen = psInsert.getGeneratedKeys()) {
                    gen.next();
                    idPedido = gen.getInt(1);
                }
            }

            // Insertar detalles
            String insertDetalle = "INSERT INTO detallesPedido (idPedido, idProducto, cantidad, precioVenta, subtotal) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement psDet = con.prepareStatement(insertDetalle)) {
                for (CarritoItem it : carrito.values()) {
                    psDet.setInt(1, idPedido);
                    psDet.setInt(2, it.getProducto().getIdProducto());
                    psDet.setInt(3, it.getCantidad());
                    psDet.setBigDecimal(4, it.getProducto().getPrecioUnitario());
                    psDet.setBigDecimal(5, it.getSubtotal());
                    psDet.addBatch();
                }
                psDet.executeBatch();
            }

            con.commit();
            session.setAttribute("pedidoPendienteId", idPedido);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("carrito.jsp");
    }

    // -------------------------
    // HELPERS
    // -------------------------
    private boolean isAjax(HttpServletRequest request) {
        String xhr = request.getHeader("X-Requested-With");
        return xhr != null && "XMLHttpRequest".equalsIgnoreCase(xhr);
    }

    private int calcularCantidadTotal(Map<Integer, CarritoItem> carrito) {
        int total = 0;
        for (CarritoItem it : carrito.values()) total += it.getCantidad();
        return total;
    }

    private BigDecimal calcularSubtotal(Map<Integer, CarritoItem> carrito) {
        BigDecimal sub = BigDecimal.ZERO;
        for (CarritoItem it : carrito.values()) sub = sub.add(it.getSubtotal());
        return sub;
    }

    // -------------------------
    // CONSULTA DE PRODUCTO
    // -------------------------
    private Producto obtenerProductoPorId(int id) {
        Producto p = null;
        String sql = "SELECT idProducto, idCategoria, nombre, descripcion, precioUnitario, stock, activo, imagen FROM productos WHERE idProducto = ?";
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
                    p.setImagen(rs.getString("imagen")); // ahora usa imagen real de BD
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return p;
    }
}