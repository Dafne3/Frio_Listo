<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    String nombre = request.getParameter("nombres");
    String apellido = request.getParameter("apellidos");
    String sexo = request.getParameter("sexo");
    String telefono = request.getParameter("telefono");
    String correo = request.getParameter("correo");
    String clave = request.getParameter("clave");
    String confirmarClave = request.getParameter("confirmarClave");

    PreparedStatement ps = null;

    try {
        if (!clave.equals(confirmarClave)) {
            request.setAttribute("errorRegistro", "Las contraseñas no coinciden.");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            return;
        }

        if (con != null) {
            // Verificar si ya existe el correo
            String checkQuery = "SELECT * FROM usuarios WHERE correo = ?";
            ps = con.prepareStatement(checkQuery);
            ps.setString(1, correo);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("errorRegistro", "Este correo ya está registrado.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
                return;
            }
            rs.close();
            ps.close();

            // Insertar usuario
            String insertQuery = "INSERT INTO usuarios (idRol, nombre, apellido, sexo, telefono, correo, pass) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(insertQuery);
            ps.setInt(1, 2);  // Rol usuario normal
            ps.setString(2, nombre);
            ps.setString(3, apellido);
            ps.setString(4, sexo);
            ps.setString(5, telefono);
            ps.setString(6, correo);
            ps.setString(7, clave);

            int filas = ps.executeUpdate();

            if (filas > 0) {
                // ? Redirigir al login con mensaje de éxito
                request.setAttribute("exitoRegistro", "Cuenta creada correctamente. Ahora inicia sesión.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorRegistro", "Hubo un error al registrar. Intenta nuevamente.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }
        } else {
            out.println("Error: No hay conexión con la base de datos.");
        }
    } catch (Exception e) {
        out.println("Error en registro: " + e.getMessage());
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
