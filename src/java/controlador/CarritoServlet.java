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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            case "actualizar":
            case "actualizarCantidad":
                actualizarCantidad(request, response);
                break;
            case "checkout":
                checkout(request, response);
                break;
            default:
                response.sendRedirect("carrito.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void agregarAlCarrito(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        int idProducto;
        try {
            idProducto = Integer.parseInt(request.getParameter("idProducto"));
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de producto inválido");
            return;
        }

        int cantidad = 1;
        Producto producto = obtenerProductoPorId(idProducto);

        if (producto == null) {
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

        if (carrito.containsKey(idProducto)) {
            CarritoItem item = carrito.get(idProducto);
            item.setCantidad(item.getCantidad() + cantidad);
        } else {
            carrito.put(idProducto, new CarritoItem(producto, cantidad));
        }

        session.setAttribute("carrito", carrito);

        if (isAjax(request)) {
            response.setContentType("application/json;charset=UTF-8");
            Map<String, Object> out = new LinkedHashMap<>();
            out.put("success", true);
            out.put("idProducto", producto.getIdProducto());
            out.put("nombre", producto.getNombre());
            out.put("precio", producto.getPrecioUnitario());
            out.put("cantidad", carrito.get(idProducto).getCantidad());
            out.put("imagen", producto.getImagen());
            out.put("totalItems", calcularCantidadTotal(carrito));
            out.put("subtotal", calcularSubtotal(carrito));

            String json = new Gson().toJson(out);
            response.getWriter().write(json);
        } else {
            response.sendRedirect("carrito.jsp");
        }
    }

    private void actualizarCantidad(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        Map<Integer, CarritoItem> carrito = (Map<Integer, CarritoItem>) session.getAttribute("carrito");
        if (carrito == null) carrito = new LinkedHashMap<>();

        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        int cambio = Integer.parseInt(request.getParameter("cambio"));

        if (carrito.containsKey(idProducto)) {
            CarritoItem item = carrito.get(idProducto);
            int nuevaCantidad = Math.max(1, item.getCantidad() + cambio);
            item.setCantidad(nuevaCantidad);
        }

        session.setAttribute("carrito", carrito);

        response.setContentType("application/json;charset=UTF-8");
        Map<String, Object> json = new LinkedHashMap<>();
        json.put("success", true);
        json.put("idProducto", idProducto);
        json.put("cantidad", carrito.get(idProducto).getCantidad());
        json.put("totalItems", calcularCantidadTotal(carrito));

        response.getWriter().write(new Gson().toJson(json));
    }

    private void eliminarItem(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));

        HttpSession session = request.getSession(false);
        if (session != null) {
            @SuppressWarnings("unchecked")
            Map<Integer, CarritoItem> carrito = (Map<Integer, CarritoItem>) session.getAttribute("carrito");
            if (carrito != null) {
                carrito.remove(idProducto);
                session.setAttribute("carrito", carrito);
            }
        }

        if (isAjax(request)) {
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write("{\"success\":true}");
        } else {
            response.sendRedirect("carrito.jsp");
        }
    }

    private void vaciarCarrito(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) session.removeAttribute("carrito");

        if (isAjax(request)) {
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write("{\"success\":true}");
        } else {
            response.sendRedirect("carrito.jsp");
        }
    }

    private void checkout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // ... (igual que tu versión original, no se modifica)
        response.sendRedirect("carrito.jsp");
    }

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
                    p.setImagen(rs.getString("imagen"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return p;
    }
}
