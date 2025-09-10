<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate(); // cerrar sesión
    response.sendRedirect("index.jsp");
%>
