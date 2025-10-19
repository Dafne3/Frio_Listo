<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="modelo.Producto" %>
<%
    Producto producto = (Producto) request.getAttribute("producto");
    String nombreSesion = (String) session.getAttribute("nombreSesion");
    String apellidoSesion = (String) session.getAttribute("apellidoSesion");
    int totalItems = (request.getAttribute("totalItems") != null) ? (int) request.getAttribute("totalItems") : 0;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle del Producto - FrioListo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn-uicons.flaticon.com/uicons-thin-straight/css/uicons-thin-straight.css">
    <style>
        body { background-color: #f8fbfd; font-family: "Poppins", sans-serif; padding-top: 90px; }
        header { background-color: #005f73; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .btn-main { background-color: #22a593; color: white; font-weight: bold; border: none; }
        .btn-main:hover { background-color: #1d8b7a; }
        .product-container { display: flex; gap: 40px; align-items: start; justify-content: center; margin-top: 40px; }
        .product-img { width: 420px; height: 420px; object-fit: cover; border-radius: 15px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .product-details { max-width: 480px; }
        footer { background-color: #005f73; color: white; text-align: center; padding: 15px 0; margin-top: 60px; position: fixed; bottom: 0; width: 100%; }
        .popup-carrito { position: fixed; top: 80px; right: 40px; background: #fff; border: 2px solid #22a593;
                         border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.2);
                         padding: 15px; display: none; z-index: 9999; animation: aparecer 0.4s ease-out; width: 320px; }
        .popup-carrito img { width: 70px; height: 70px; border-radius: 8px; object-fit: cover; }
        .popup-info { display: flex; flex-direction: column; justify-content: center; }
        .popup-actions { display: flex; justify-content: space-between; align-items: center; margin-top: 8px; }
        .cantidad-btn { border: none; background: #22a593; color: white; width: 25px; height: 25px; border-radius: 50%; }
        @keyframes aparecer { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
    </style>
</head>
<body>

<header class="d-flex flex-wrap align-items-center justify-content-between py-3 px-4 fixed-top">
    <a href="index.jsp" class="d-flex align-items-center text-white text-decoration-none">
        <img src="images/friolisto.png" width="50" height="50">
        <span class="fs-2 fw-bold ms-3">FrioListo</span>
    </a>
    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="index.jsp" class="nav-link px-2 text-white">Inicio</a></li>
        <li><a href="sobre.jsp" class="nav-link px-2 text-white">Sobre nosotros</a></li>
        <li><a href="ProductoServlet?action=listar" class="nav-link px-2 text-white">Productos y servicios</a></li>
        <li><a href="contacto.jsp" class="nav-link px-2 text-white">Contacto</a></li>
    </ul>
    <div class="text-end">
        <a href="CarritoServlet?action=listar" class="btn btn-light cart-badge position-relative">
            <i class="fi fi-ts-cart-shopping-fast"></i>
            <span class="cart-count"><%= totalItems %></span>
        </a>
    </div>
</header>

<section class="container">
    <div class="product-container">
        <img src="<%= producto.getImagen() %>" alt="<%= producto.getNombre() %>" class="product-img">
        <div class="product-details">
            <h2 class="fw-bold" style="color:#005f73;"><%= producto.getNombre() %></h2>
            <p class="text-muted"><%= producto.getDescripcion() %></p>
            <h4 class="fw-bold text-success mb-4">S/. <%= producto.getPrecioUnitario() %></h4>

            <form id="formAgregar" method="post" action="CarritoServlet">
                <input type="hidden" name="idProducto" value="<%= producto.getIdProducto() %>">
                <input type="hidden" name="action" value="agregar">
                <button type="submit" class="btn btn-main me-2">Agregar al carrito</button>
                <a href="ProductoServlet?action=listar" class="btn btn-secondary">Seguir comprando</a>
            </form>
        </div>
    </div>
</section>

<!-- Popup debajo del icono del carrito -->
<div id="popupCarrito" class="popup-carrito">
    <div class="d-flex align-items-center gap-3">
        <img id="popupImg" src="" alt="">
        <div class="popup-info">
            <h6 id="popupNombre" class="fw-bold mb-1"></h6>
            <p id="popupPrecio" class="text-success fw-bold mb-0"></p>
        </div>
    </div>
    <div class="popup-actions">
        <div class="d-flex align-items-center gap-2">
            <button class="cantidad-btn" id="btnMenos">-</button>
            <span id="popupCantidad">1</span>
            <button class="cantidad-btn" id="btnMas">+</button>
        </div>
        <a href="CarritoServlet?action=listar" class="btn btn-main btn-sm">Ir al carrito</a>
    </div>
</div>

<footer>
    <p>© 2025 FrioListo. Todos los derechos reservados.</p>
</footer>

<script>
document.getElementById("formAgregar").addEventListener("submit", function(e) {
    e.preventDefault();
    const formData = new FormData(this);

    fetch("CarritoServlet", {
        method: "POST",
        body: formData,
        headers: { "X-Requested-With": "XMLHttpRequest" }
    })
    .then(res => res.json())
    .then(data => {
        if (data.success) {
            // Mostrar popup
            const popup = document.getElementById("popupCarrito");
            document.getElementById("popupImg").src = data.imagen;
            document.getElementById("popupNombre").textContent = data.nombre;
            document.getElementById("popupPrecio").textContent = "S/. " + data.precio;
            document.getElementById("popupCantidad").textContent = data.cantidad;
            popup.style.display = "block";

            // Actualizar contador del carrito
            document.querySelector(".cart-count").textContent = data.totalItems;

            // Temporizador para desaparecer popup
            setTimeout(() => popup.style.display = "none", 5000);

            // Controlar cantidad dentro del popup
            document.getElementById("btnMas").onclick = () => actualizarCantidad(data.idProducto, 1);
            document.getElementById("btnMenos").onclick = () => actualizarCantidad(data.idProducto, -1);
        }
    });
});

function actualizarCantidad(idProducto, cambio) {
    fetch("CarritoServlet?action=actualizarCantidad&idProducto=" + idProducto + "&cambio=" + cambio, {
        method: "GET",
        headers: { "X-Requested-With": "XMLHttpRequest" }
    })
    .then(res => res.json())
    .then(data => {
        if (data.success) {
            document.getElementById("popupCantidad").textContent = data.cantidad;
            document.querySelector(".cart-count").textContent = data.totalItems;
        }
    });
}
</script>
</body>
</html>
