<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.Producto" %>
<%
    String nombreSesion = (String) session.getAttribute("nombreUsuario");
    String apellidoSesion = (String) session.getAttribute("apellidoUsuario");
    // Determinar cantidad total en carrito para mostrar en icono
    int totalItems = 0;
    Map<Integer, modelo.CarritoItem> carrito = (Map<Integer, modelo.CarritoItem>) session.getAttribute("carrito");
    if (carrito != null) {
        for (modelo.CarritoItem it : carrito.values()) totalItems += it.getCantidad();
    }
%>
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Productos y Servicios - FrioListo</title>

  <!-- Bootstrap y Flaticon -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn-uicons.flaticon.com/uicons-thin-straight/css/uicons-thin-straight.css">

  <style>
    /* ======== ESTILOS GENERALES ======== */
    body {
        margin: 0;
        padding-top: 80px;
        background-color: #f8fbfd;
        font-family: "Poppins", sans-serif;
    }

    header {
        background-color: #005f73;
        z-index: 1040;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    /* ======== NAVEGACIÓN ======== */
    .nav-link {
        color: #0bbca5 !important;
        font-weight: 600;
        transition: color 0.3s;
    }
    .nav-link:hover {
        color: #ffffff !important;
    }

    /* ======== CARRITO ======== */
    .cart-badge {
        position: relative;
        display: inline-block;
    }
    .cart-count {
        position: absolute;
        top: -8px;
        right: -10px;
        background: #e53935;
        color: #fff;
        padding: 2px 6px;
        border-radius: 50%;
        font-size: 12px;
    }

    /* ======== TARJETAS DE PRODUCTO ======== */
    .section-title {
        font-size: 2.5rem;
        font-weight: bold;
        color: #005f73;
        margin-bottom: 1rem;
        text-align: center;
    }
    .section-subtitle {
        color: #6c757d;
        font-size: 1.1rem;
        margin-bottom: 3rem;
        text-align: center;
    }

    .card-product {
        border: none;
        border-radius: 15px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .card-product:hover {
        transform: translateY(-8px);
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }
    .card-product img {
        border-radius: 15px 15px 0 0;
        height: 220px;
        object-fit: cover;
    }

    .btn-main {
        background-color: #22a593;
        color: white;
        font-weight: bold;
        border: none;
    }
    .btn-main:hover {
        background-color: #1d8b7a;
        color: white;
    }
  </style>
</head>
<body>

  <!-- ======== HEADER ======== -->
  <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 px-4 fixed-top">
      <a href="index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-white text-decoration-none">
          <img src="images/friolisto.png" alt="FrioListo" width="50" height="50">
          <span class="fs-2 fw-bold ms-3">FrioListo</span>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="index.jsp" class="nav-link px-2">Inicio</a></li>
        <li><a href="sobre.jsp" class="nav-link px-2">Sobre nosotros</a></li>
        <li><a href="ProductoServlet?action=listar" class="nav-link px-2">Productos y servicios</a></li>
        <li><a href="contacto.jsp" class="nav-link px-2">Contacto</a></li>
      </ul>  

      <div class="col-md-3 text-end">
        <% if (nombreSesion != null) { %>
            <span class="text-white fw-bold me-3">Hola, <%= nombreSesion %> <%= apellidoSesion %></span>
            <a href="logout.jsp" class="btn btn-danger">Salir</a>
            <a href="CarritoServlet?action=listar" class="btn btn-light ms-2 cart-badge" title="Ver carrito">
                <i class="fi fi-ts-cart-shopping-fast"></i>
                <span class="cart-count"><%= totalItems %></span>
            </a>
        <% } else { %>
            <a href="login.jsp" class="btn me-2 btn-main">Ingresar</a>
            <a href="CarritoServlet?action=listar" class="btn btn-light ms-2 cart-badge" title="Ver carrito">
                <i class="fi fi-ts-cart-shopping-fast"></i>
                <span class="cart-count"><%= totalItems %></span>
            </a>
        <% } %>
      </div>
  </header>

  <!-- Sección Productos -->
  <section class="py-5 text-center">
    <div class="container">
      <h2 class="fw-bold mb-3" style="color:#005f73;">Nuestros productos</h2>
      <p class="text-muted mb-5">Encuentra las mejores bebidas frías y refrescantes para cada ocasión.</p>
      
      <div class="row g-4 justify-content-center">
        <%
            // Tomamos 'productos' proporcionado por ProductoServlet. Si no existe, recomendamos llamar al servlet.
            List<Producto> productos = (List<Producto>) request.getAttribute("productos");
            if (productos == null) {
        %>
            <div class="alert alert-info">No se cargaron productos. Asegúrate de acceder por <strong>ProductoServlet?action=listar</strong>.</div>
        <%
            } else {
                for (Producto p : productos) {
        %>
            <div class="col-md-2">
              <div class="card card-product shadow-sm h-100">
                <img src="<%= p.getImagen() %>" class="card-img-top" alt="<%= p.getNombre() %>">
                <div class="card-body text-center">
                  <h5 class="fw-bold" style="color:#22a593;"><%= p.getNombre() %></h5>
                  <p class="fw-bold text-dark">S/. <%= p.getPrecioUnitario() %></p>
                  
                  
                  <!-- Botón comprar redirige al servlet detalle -->
                  <a href="ProductoServlet?action=detalle&id=<%= p.getIdProducto() %>" class="btn btn-main w-100">Comprar</a>
                </div>
              </div>
            </div>
        <%
                }
            }
        %>
      </div>
    </div>
  </section>
<style>
.popup-carrito {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background: #ffffff;
  border: 2px solid #0c4b9a;
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
  border-radius: 12px;
  padding: 15px;
  display: flex;
  align-items: center;
  z-index: 9999;
  animation: aparecer 0.3s ease-out;
}
.popup-content {
  display: flex;
  align-items: center;
  gap: 10px;
}
.popup-img {
  width: 60px;
  height: 60px;
  object-fit: cover;
  border-radius: 8px;
}
.popup-info h4 {
  margin: 0;
  color: #0c4b9a;
}
.popup-info p {
  margin: 2px 0;
  font-size: 14px;
}
#cerrarPopup {
  background: #0c4b9a;
  color: white;
  border: none;
  padding: 5px 10px;
  border-radius: 6px;
  cursor: pointer;
}
@keyframes aparecer {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>
      
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
    $("#formAgregarCarrito").submit(function(e) {
        e.preventDefault(); // Evita el envío normal del formulario

        $.ajax({
            type: "POST",
            url: "CarritoServlet",
            data: $(this).serialize() + "&action=agregar",
            headers: { "X-Requested-With": "XMLHttpRequest" },
            dataType: "json",
            success: function(response) {
                mostrarPopup(response);
            },
            error: function() {
                alert("Hubo un error al agregar el producto al carrito.");
            }
        });
    });

    function mostrarPopup(data) {
        const popup = `
        <div id="popupCarrito" class="popup-carrito">
            <div class="popup-content">
                <img src="images/${data.imagen}" alt="${data.nombre}" class="popup-img">
                <div class="popup-info">
                    <h4>${data.nombre}</h4>
                    <p>Cantidad: ${data.cantidad}</p>
                    <p>Precio: S/ ${data.precio}</p>
                    <p>Subtotal: S/ ${data.subtotal}</p>
                    <button id="cerrarPopup">Cerrar</button>
                </div>
            </div>
        </div>`;

        $("body").append(popup);

        $("#cerrarPopup").on("click", function() {
            $("#popupCarrito").fadeOut(300, function() {
                $(this).remove();
            });
        });

        // Desaparecer automáticamente después de 4 segundos
        setTimeout(() => $("#popupCarrito").fadeOut(300, function() { $(this).remove(); }), 4000);
    }
});
</script>


  <footer class="text-center py-4 mt-4" style="background-color:#005f73; color:white;">
    <p class="mb-0">© 2025 FrioListo. Todos los derechos reservados.</p>
  </footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>