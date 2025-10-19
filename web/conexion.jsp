<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    try {
        // Cargar el driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // URL de conexi�n
        String url = "jdbc:mysql://localhost:3306/Friolisto1?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=America/Lima";
        String user = "friouser";       // ? Cambia si usas otro usuario
        String pass = "mipassword123"; // ? Cambia por tu contrase�a

        // Establecer conexi�n
        con = DriverManager.getConnection(url, user, pass);

        // Guardamos en el request para usar en otros JSP
        request.setAttribute("conexion", con);

    } catch (Exception e) {
        out.println("? Error de conexi�n: " + e.getMessage());
    }
%>
