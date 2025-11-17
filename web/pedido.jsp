<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es_PE" />
<!-- ahora usamos JSTL y FMT -->
    <meta charset="UTF-8">
    <title>Pedido</title>
    <link rel="stylesheet" href="css/estilos.css">
    <!--  aquí uso el mismo estilo general de la página -->
</head>
<body>
<div class="contenedor-principal">
    <h1 class="titulo-principal">Confirmar Pedido</h1>

    <div class="tarjeta-producto">
        <div class="producto-img">
            <!-- esto reemplaza a la imagen estática -->
            <img src="img/${producto.id}.png" alt="Producto">
        </div>
        <div class="producto-detalles">
            <h2 class="producto-nombre">${producto.nombre}</h2>
            <p class="producto-precio">S/. <fmt:formatNumber value="${producto.precio}" type="currency"/></p>
            <p class="producto-stock">Stock disponible: ${producto.stock}</p>

            <form action="ConfirmarPedidoServlet" method="post">
                <input type="hidden" name="id" value="${producto.id}">

                <button class="btn-comprar" type="submit">Confirmar Pedido</button>
                <a href="productos.jsp" class="btn-volver">Volver</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
