<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.math.BigDecimal, modelo.CarritoItem" %>

<%
    // Obtener carrito de sesión
    List<CarritoItem> carrito = (List<CarritoItem>) session.getAttribute("carrito");
    Integer idUsuario = (Integer) session.getAttribute("idUsuario"); // Si el usuario está logueado

    BigDecimal subtotal = BigDecimal.ZERO;
    BigDecimal descuento = BigDecimal.ZERO;
    BigDecimal total = BigDecimal.ZERO;

    if (carrito != null) {
        for (CarritoItem item : carrito) {
            subtotal = subtotal.add(item.getSubtotal());
        }
        // Ejemplo: si compra supera S/300 aplicar 10% de descuento
        if (subtotal.compareTo(new BigDecimal("300")) >= 0) {
            descuento = subtotal.multiply(new BigDecimal("0.10"));
        }
        total = subtotal.subtract(descuento);
    }

    // Guardar carrito en base de datos si el usuario está logueado
    if (idUsuario != null && carrito != null) {
        try {
            modelo.Conexion con = new modelo.Conexion();
            java.sql.Connection cn = con.getConexion();
            // Limpiamos el carrito anterior del usuario
            java.sql.PreparedStatement psDel = cn.prepareStatement("DELETE FROM carrito_usuario WHERE id_usuario=?");
            psDel.setInt(1, idUsuario);
            psDel.executeUpdate();

            // Insertamos productos actuales
            java.sql.PreparedStatement psIns = cn.prepareStatement(
                "INSERT INTO carrito_usuario (id_usuario, id_producto, cantidad, subtotal) VALUES (?, ?, ?, ?)");
            for (CarritoItem item : carrito) {
                psIns.setInt(1, idUsuario);
                psIns.setInt(2, item.getProducto().getIdProducto());
                psIns.setInt(3, item.getCantidad());
                psIns.setBigDecimal(4, item.getSubtotal());
                psIns.addBatch();
            }
            psIns.executeBatch();
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Carrito de Compras - FrioListo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* --- ESTRUCTURA GENERAL --- */
        html, body {
            height: 100%;
            margin: 0;
            background-color: #f8fbfd;
            font-family: "Poppins", sans-serif;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            padding-top: 90px;
        }

        main {
            flex: 1;
        }

        header {
            background-color: #005f73;
        }

        /* --- BOTONES Y ESTILOS --- */
        .btn-main {
            background-color: #22a593;
            color: white;
            border: none;
            font-weight: bold;
        }
        .btn-main:hover {
            background-color: #1d8b7a;
        }

        .resumen-box {
            background: #e8f5f3;
            border-radius: 15px;
            padding: 20px;
        }
        .resumen-box h5 {
            color: #005f73;
            font-weight: bold;
        }

        .seguir-comprando {
            color: #005f73;
            font-weight: 600;
            text-decoration: none;
            border: 2px solid #005f73;
            border-radius: 10px;
            padding: 8px 20px;
        }
        .seguir-comprando:hover {
            background-color: #005f73;
            color: white;
            text-decoration: none;
        }

        /* --- FOOTER PEGADO ABAJO --- */
        footer {
            background-color: #005f73;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: auto; /* Empuja el footer al fondo */
        }
    </style>
</head>
<body>

<header class="d-flex flex-wrap align-items-center justify-content-between py-3 px-4 fixed-top">
    <a href="index.jsp" class="d-flex align-items-center text-white text-decoration-none">
        <img src="images/friolisto.png" width="50" height="50">
        <span class="fs-2 fw-bold ms-3">FrioListo</span>
    </a>
    <a href="ProductoServlet?action=listar" class="btn btn-light">Seguir comprando</a>
</header>

<main class="container mt-4">
    <h3 class="fw-bold text-center mb-4" style="color:#005f73;">Tu carrito de compras</h3>

    <% if (carrito == null || carrito.isEmpty()) { %>
        <div class="alert alert-info text-center">Tu carrito está vacío.</div>
    <% } else { %>
        <div class="row">
            <div class="col-lg-8">
                <table class="table table-hover align-middle shadow-sm">
                    <thead class="table-primary text-center">
                        <tr>
                            <th>Imagen</th>
                            <th>Producto</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Subtotal</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for (CarritoItem item : carrito) { %>
                        <tr class="text-center">
                            <td><img src="<%= item.getProducto().getImagen() %>" width="70" height="70" style="border-radius:10px;"></td>
                            <td><%= item.getProducto().getNombre() %></td>
                            <td>S/. <%= item.getProducto().getPrecioUnitario() %></td>
                            <td><%= item.getCantidad() %></td>
                            <td>S/. <%= item.getSubtotal() %></td>
                            <td>
                                <a href="CarritoServlet?action=actualizarCantidad&idProducto=<%= item.getProducto().getIdProducto() %>&cambio=-1" class="btn btn-danger btn-sm">-</a>
                                <a href="CarritoServlet?action=actualizarCantidad&idProducto=<%= item.getProducto().getIdProducto() %>&cambio=1" class="btn btn-success btn-sm">+</a>
                                <a href="CarritoServlet?action=eliminar&idProducto=<%= item.getProducto().getIdProducto() %>" class="btn btn-outline-danger btn-sm">Eliminar</a>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>

                <div class="text-start mt-4">
                    <a href="CarritoServlet?action=vaciar" class="btn btn-outline-danger me-3">Vaciar carrito</a>
                    <a href="ProductoServlet?action=listar" class="seguir-comprando">← Seguir comprando</a>
                </div>
            </div>

            <!-- 📦 Resumen de Pago -->
            <div class="col-lg-4">
                <div class="resumen-box shadow-sm">
                    <h5 class="mb-3">Resumen de pago</h5>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Subtotal:</span>
                        <strong>S/. <%= subtotal %></strong>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span>Descuento:</span>
                        <strong class="text-success">-S/. <%= descuento %></strong>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between mb-3 fs-5">
                        <span>Total:</span>
                        <strong class="text-primary">S/. <%= total %></strong>
                    </div>
                    <a href="pago.jsp" class="btn btn-main w-100 py-2">Continuar con el pago</a>
                </div>
            </div>
        </div>
    <% } %>
</main>

<footer>
    <p>© 2025 FrioListo. Todos los derechos reservados.</p>
</footer>

</body>
</html>
