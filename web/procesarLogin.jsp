<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<%
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        if (con != null) {
            String correo = request.getParameter("correo");
            String pass = request.getParameter("clave");

            String sql = "SELECT idUsuario, nombre, apellido, correo FROM usuarios WHERE correo=? AND pass=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, pass);

            rs = ps.executeQuery();

            if (rs.next()) {
                // ? Guardar en sesión
                session.setAttribute("idUsuario", rs.getInt("idUsuario"));
                session.setAttribute("nombreUsuario", rs.getString("nombre"));
                session.setAttribute("apellidoUsuario", rs.getString("apellido"));
                session.setAttribute("correoUsuario", rs.getString("correo"));

                response.sendRedirect("index.jsp"); // Redirige al inicio
            } else {
                request.setAttribute("errorLogin", "Correo o contraseña incorrectos");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("error", "Error de conexión a la base de datos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.setAttribute("error", "Error en login: " + e.getMessage());
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
