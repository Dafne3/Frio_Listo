<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String telefono = request.getParameter("telefono");
    String asunto = request.getParameter("asunto");
    String mensaje = request.getParameter("mensaje");

    try {
        // Conexión a la base de datos Friolisto1
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/Friolisto1?useSSL=false&serverTimezone=UTC",
            "root",
            "root"
        );

        String sql = "INSERT INTO mensajesContacto (nombreRemitente, correoRemitente, telefonoRemitente, asunto, mensaje) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, nombre);
        ps.setString(2, correo);
        ps.setString(3, telefono);
        ps.setString(4, asunto);
        ps.setString(5, mensaje);

        int filas = ps.executeUpdate();
        ps.close();
        con.close();

        if (filas > 0) {
            request.setAttribute("mensajeExito", "Tu mensaje fue enviado correctamente. ¡Gracias por contactarnos!");
        } else {
            request.setAttribute("mensajeError", "No se pudo enviar el mensaje. Intenta nuevamente.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("mensajeError", " Error al conectar con la base de datos: " + e.getMessage());
    }

    // Redirige de vuelta a contacto.jsp
    RequestDispatcher rd = request.getRequestDispatcher("contacto.jsp");
    rd.forward(request, response);
%>
