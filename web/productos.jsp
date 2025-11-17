<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*" %>
<%
    String nombreSesion = (String) session.getAttribute("nombreUsuario");
    String apellidoSesion = (String) session.getAttribute("apellidoUsuario");
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Productos y Servicios - FrioListo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    .section-title {
      font-size: 2.5rem;
      font-weight: bold;
      color: #005f73;
      margin-bottom: 1rem;
    }
    .section-subtitle {
      color: #6c757d;
      font-size: 1.1rem;
      margin-bottom: 3rem;
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
    }
    .btn-main:hover {
      background-color: #1d8b7a;
      color: white;
    }
  </style>
</head>
<body style="margin:0; padding-top:75px; background-color:#f8fbfd;">

  <!-- Header -->
  <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 px-4 fixed-top"
          style="background-color:#005f73; z-index:1040;">
      <a href="index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-white text-decoration-none">
          <img src="images/friolisto.png" alt="FrioListo" width="50" height="50">
          <span class="fs-2 fw-bold ms-3">FrioListo</span>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="index.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Inicio</a></li>
        <li><a href="sobre.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Sobre nosotros</a></li>
        <li><a href="productos.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Productos y servicios</a></li>
        <li><a href="contacto.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Contacto</a></li>
      </ul>  

      <div class="col-md-3 text-end">
            <% if (nombreSesion != null) { %>
                <span class="text-white fw-bold me-3">
                    Hola, <%= nombreSesion %> <%= apellidoSesion %>
                </span>
                <a href="logout.jsp" class="btn btn-danger">Salir</a>
            <% } else { %>
                <a href="login.jsp" class="btn me-2" style="background-color:#22a593; color:white; border:none;">Ingresar</a>
                <a href="registro.jsp" class="btn" style="background-color:#22a593; color:white; border:none;">Registrarse</a>
            <% } %>
        </div>
  </header>

<!-- Sección Productos -->
<section class="py-5 text-center">
  <div class="container">
    <h2 class="fw-bold mb-3" style="color:#005f73;">Nuestros productos</h2>
    <p class="text-muted mb-5">Encuentra las mejores bebidas frías y refrescantes para cada ocasión.</p>
    
    <div class="row g-4">
      <!-- Producto 1 -->
      <div class="col-md-2">
        <div class="card card-product shadow-sm h-100">
          <img src="images/prod1.jpg" class="card-img-top" alt="Coca-Cola">
          <div class="card-body">
            <h5 class="fw-bold" style="color:#22a593;">Coca-Cola 500ml</h5>
            <p class="fw-bold text-dark">S/. 5.00</p>
            <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal1">Ver más</button>
          </div>
          
        </div>
      </div>
      <!-- Producto 2 -->
      <div class="col-md-2">
        <div class="card card-product shadow-sm h-100">
          <img src="images/prod2.jpg" class="card-img-top" alt="Inca Kola">
          <div class="card-body">
            <h5 class="fw-bold" style="color:#22a593;">Inca Kola 500ml</h5>
            <p class="fw-bold text-dark">S/. 4.50</p>
            <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal2">Ver más</button>
          </div>
        </div>
      </div>
      <!-- Producto 3 -->
      <div class="col-md-2">
        <div class="card card-product shadow-sm h-100">
          <img src="images/prod3.jpg" class="card-img-top" alt="Agua Cielo">
          <div class="card-body">
            <h5 class="fw-bold" style="color:#22a593;">Agua 600ml</h5>
            <p class="fw-bold text-dark">S/. 3.00</p>
            <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal3">Ver más</button>
          </div>
        </div>
      </div>
      <!-- Producto 4 -->
      <div class="col-md-2">
        <div class="card card-product shadow-sm h-100">
          <img src="images/prod4.jpg" class="card-img-top" alt="Red Bull">
          <div class="card-body">
            <h5 class="fw-bold" style="color:#22a593;">Red Bull 250ml</h5>
            <p class="fw-bold text-dark">S/. 8.00</p>
            <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal4">Ver más</button>
          </div>
        </div>
      </div>
      <!-- Producto 5 -->
      <div class="col-md-2">
        <div class="card card-product shadow-sm h-100">
          <img src="images/prod5.jpg" class="card-img-top" alt="Sprite">
          <div class="card-body">
            <h5 class="fw-bold" style="color:#22a593;">Sprite 500ml</h5>
            <p class="fw-bold text-dark">S/. 4.80</p>
            <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal5">Ver más</button>
          </div>
        </div>
      </div>
      <!-- Producto 6 -->
      <div class="col-md-2">
        <div class="card card-product shadow-sm h-100">
          <img src="images/prod6.jpg" class="card-img-top" alt="Fanta">
          <div class="card-body">
            <h5 class="fw-bold" style="color:#22a593;">Fanta 500ml</h5>
            <p class="fw-bold text-dark">S/. 4.50</p>
            <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal6">Ver más</button>
          </div>
        </div>
      </div>
      <!-- Producto 7 -->
    <div class="col-md-2">
      <div class="card card-product shadow-sm h-100">
        <img src="images/prod7.jpg" class="card-img-top" alt="Pepsi">
        <div class="card-body">
          <h5 class="fw-bold" style="color:#22a593;">Pepsi 500ml</h5>
          <p class="fw-bold text-dark">S/. 4.70</p>
          <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal7">Ver más</button>
        </div>
      </div>
    </div>

    <!-- Producto 8 -->
    <div class="col-md-2">
      <div class="card card-product shadow-sm h-100">
        <img src="images/prod8.jpg" class="card-img-top" alt="Guaraná">
        <div class="card-body">
          <h5 class="fw-bold" style="color:#22a593;">Guaraná 500ml</h5>
          <p class="fw-bold text-dark">S/. 4.20</p>
          <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal8">Ver más</button>
        </div>
      </div>
    </div>

    <!-- Producto 9 -->
    <div class="col-md-2">
      <div class="card card-product shadow-sm h-100">
        <img src="images/prod9.jpg" class="card-img-top" alt="7Up">
        <div class="card-body">
          <h5 class="fw-bold" style="color:#22a593;">7Up 500ml</h5>
          <p class="fw-bold text-dark">S/. 4.50</p>
          <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal9">Ver más</button>
        </div>
      </div>
    </div>

    <!-- Producto 10 -->
    <div class="col-md-2">
      <div class="card card-product shadow-sm h-100">
        <img src="images/prod10.jpg" class="card-img-top" alt="Gatorade">
        <div class="card-body">
          <h5 class="fw-bold" style="color:#22a593;">Gatorade 500ml</h5>
          <p class="fw-bold text-dark">S/. 6.50</p>
          <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal10">Ver más</button>
        </div>
      </div>
    </div>

    <!-- Producto 11 -->
    <div class="col-md-2">
      <div class="card card-product shadow-sm h-100">
        <img src="images/prod11.jpg" class="card-img-top" alt="Powerade">
        <div class="card-body">
          <h5 class="fw-bold" style="color:#22a593;">Powerade 500ml</h5>
          <p class="fw-bold text-dark">S/. 6.00</p>
          <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal11">Ver más</button>
        </div>
      </div>
    </div>

    <!-- Producto 12 -->
    <div class="col-md-2">
      <div class="card card-product shadow-sm h-100">
        <img src="images/prod12.jpg" class="card-img-top" alt="Té Helado">
        <div class="card-body">
          <h5 class="fw-bold" style="color:#22a593;">Té Helado 500ml</h5>
          <p class="fw-bold text-dark">S/. 4.00</p>
          <button class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#modal12">Ver más</button>
        </div>
      </div>
    </div>

</section>

<!-- MODALS DE PRODUCTOS -->
<!-- Modal 1 -->
<div class="modal fade" id="modal1" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Coca-Cola 500ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod1.jpg" class="img-fluid rounded mb-3" alt="Coca-Cola">
        <p>Refrescante bebida gaseosa original, ideal para acompañar cualquier momento.</p>
        <p class="fw-bold">Precio: S/. 5.00</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty1" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Coca-Cola 500ml', 5.00, document.getElementById('qty1').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 2 -->
<div class="modal fade" id="modal2" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Inca Kola 500ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod2.jpg" class="img-fluid rounded mb-3" alt="Inca Kola">
        <p>La bebida de sabor nacional que acompaña perfectamente todas tus comidas.</p>
        <p class="fw-bold">Precio: S/. 4.50</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty2" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Inca Kola 500ml', 4.50, document.getElementById('qty2').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>  

<!-- Modal 3 -->
<div class="modal fade" id="modal3" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Agua Cielo 600ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod3.jpg" class="img-fluid rounded mb-3" alt="Agua Cielo">
        <p>Agua purificada y ligera, perfecta para mantenerte hidratado durante el día.</p>
        <p class="fw-bold">Precio: S/. 3.00</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty3" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Agua Cielo 600ml', 3.00, document.getElementById('qty3').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 4 -->
<div class="modal fade" id="modal4" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Red Bull 250ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod4.jpg" class="img-fluid rounded mb-3" alt="Red Bull">
        <p>Bebida energética que te da alas para rendir al máximo en tus actividades.</p>
        <p class="fw-bold">Precio: S/. 8.00</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty4" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Red Bull 250ml', 8.00, document.getElementById('qty4').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 5 -->
<div class="modal fade" id="modal5" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Sprite 500ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod5.jpg" class="img-fluid rounded mb-3" alt="Sprite">
        <p>Bebida gaseosa de limón, refrescante y con un sabor único.</p>
        <p class="fw-bold">Precio: S/. 4.80</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty5" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Sprite 500ml', 4.80, document.getElementById('qty5').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 6 -->
<div class="modal fade" id="modal6" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Fanta 500ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod6.jpg" class="img-fluid rounded mb-3" alt="Fanta">
        <p>Bebida gaseosa de naranja, burbujeante y llena de sabor frutal.</p>
        <p class="fw-bold">Precio: S/. 4.50</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty6" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Fanta 500ml', 4.50, document.getElementById('qty6').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 7 -->
<div class="modal fade" id="modal7" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Pepsi 500ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod7.jpg" class="img-fluid rounded mb-3" alt="Pepsi">
        <p>Bebida gaseosa con sabor único, refrescante y con burbujas intensas.</p>
        <p class="fw-bold">Precio: S/. 4.70</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty7" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Pepsi 500ml', 4.70, document.getElementById('qty7').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 8 -->
<div class="modal fade" id="modal8" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Guaraná 500ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod8.jpg" class="img-fluid rounded mb-3" alt="Guaraná">
        <p>Bebida gaseosa con extracto de guaraná, dulce y con un sabor tropical.</p>
        <p class="fw-bold">Precio: S/. 4.20</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty8" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Guaraná 500ml', 4.20, document.getElementById('qty8').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 9 -->
<div class="modal fade" id="modal9" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">7Up 500ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod9.jpg" class="img-fluid rounded mb-3" alt="7Up">
        <p>Refrescante gaseosa de lima-limón, ligera y burbujeante.</p>
        <p class="fw-bold">Precio: S/. 4.50</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty9" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('7Up 500ml', 4.50, document.getElementById('qty9').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 10 -->
<div class="modal fade" id="modal10" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Gatorade 500ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod10.jpg" class="img-fluid rounded mb-3" alt="Gatorade">
        <p>Bebida deportiva que repone sales y energiza durante el ejercicio.</p>
        <p class="fw-bold">Precio: S/. 6.50</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty10" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Gatorade 500ml', 6.50, document.getElementById('qty10').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 11 -->
<div class="modal fade" id="modal11" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Powerade 500ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod11.jpg" class="img-fluid rounded mb-3" alt="Powerade">
        <p>Bebida isotónica que te ayuda a recuperar energía tras la actividad física.</p>
        <p class="fw-bold">Precio: S/. 6.00</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty11" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Powerade 500ml', 6.00, document.getElementById('qty11').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 12 -->
<div class="modal fade" id="modal12" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Té Helado 500ml</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <img src="images/prod12.jpg" class="img-fluid rounded mb-3" alt="Té Helado">
        <p>Bebida refrescante a base de té frío, ligera y natural.</p>
        <p class="fw-bold">Precio: S/. 4.00</p>
        <div class="input-group mb-3">
          <span class="input-group-text">Cantidad</span>
          <input type="number" id="qty12" class="form-control" min="1" value="1">
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-main" onclick="addToCart('Té Helado 500ml', 4.00, document.getElementById('qty12').value)" data-bs-dismiss="modal">Agregar al carrito</button>
      </div>
    </div>
  </div>
</div>

<!-- Botón Ver más productos -->
<div class="mt-5 d-flex justify-content-center">
  <a href="login.jsp" class="btn btn-main btn-lg fw-bold" 
     style="font-family: 'Arial', sans-serif; color: white;">
    Ver más productos
  </a>
</div>

<!-- 🛒 Carrito flotante -->
<div id="cartSidebar" class="cart-sidebar">
  <!-- Header -->
  <div class="cart-header d-flex justify-content-between align-items-center text-white px-3 py-2" style="background-color:#28a745;">
    <h5 class="m-0"><i class="bi bi-bag-fill"></i> Carrito</h5>
    <button class="btn-close btn-close-white" onclick="toggleCart()"></button>
  </div>

  <!-- Items -->
  <div id="cartItems" class="cart-items p-3"></div>

  <!-- Footer -->
  <div class="cart-footer p-3">
    <p class="fw-bold mb-2">Subtotal: <span id="cartTotal">S/ 0.00</span></p>
    <button class="btn btn-dark w-100 mb-2" onclick="toggleCart()">Seguir Comprando</button>
    <button class="btn btn-dark w-100">Finalizar Compra</button>
  </div>
</div>

<!-- Botón flotante carrito -->
<button class="cart-toggle-btn btn btn-success" onclick="toggleCart()">🛒</button>

<!-- 🎨 Estilos carrito -->
<style>
  .cart-sidebar {
    position: fixed;
    top: 0;
    right: -400px;
    width: 350px;
    height: 100%;
    background: #fff;
    box-shadow: -2px 0 10px rgba(0,0,0,0.2);
    transition: right 0.3s ease;
    z-index: 1055;
    display: flex;
    flex-direction: column;
  }
  .cart-sidebar.active { right: 0; }
  .cart-items { flex: 1; overflow-y: auto; }
  .cart-footer { border-top: 1px solid #ddd; }
  .cart-toggle-btn {
    position: fixed;
    bottom: 20px;
    right: 20px;
    border-radius: 50%;
    width: 60px;
    height: 60px;
    font-size: 24px;
    z-index: 1100;
  }
  .cart-item {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    border-bottom: 1px solid #eee;
    padding-bottom: 10px;
  }
  .cart-item img {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border-radius: 8px;
    margin-right: 10px;
  }
  .cart-item .info {
    flex: 1;
  }
  .cart-item .price {
    font-weight: bold;
    margin-left: 10px;
  }
</style>

<!-- ⚡ Lógica carrito -->
<script>
  let cart = [];

  function addToCart(name, price, quantity, img = "images/prod1.jpg") {
    quantity = parseInt(quantity);
    let existing = cart.find(item => item.name === name);
    if (existing) {
      existing.quantity += quantity;
    } else {
      cart.push({ name, price, quantity, img });
    }
    updateCart();
    toggleCart(true);
  }

  function updateCart() {
    let cartItemsDiv = document.getElementById("cartItems");
    cartItemsDiv.innerHTML = "";
    let total = 0;
    cart.forEach((item, index) => {
      let subtotal = item.price * item.quantity;
      total += subtotal;
      cartItemsDiv.innerHTML += `
        <div class="cart-item">
          <img src="${item.img}" alt="${item.name}">
          <div class="info">
            <strong>${item.name}</strong><br>
            ${item.quantity} x S/ ${item.price.toFixed(2)}
          </div>
          <div class="price">S/ ${subtotal.toFixed(2)}</div>
          <button class="btn btn-sm btn-danger ms-2" onclick="removeFromCart(${index})">🗑</button>
        </div>`;
    });
    document.getElementById("cartTotal").innerText = "S/ " + total.toFixed(2);
  }

  function removeFromCart(index) {
    cart.splice(index, 1);
    updateCart();
  }

  function toggleCart(forceOpen = false) {
    let cartSidebar = document.getElementById("cartSidebar");
    if (forceOpen) {
      cartSidebar.classList.add("active");
    } else {
      cartSidebar.classList.toggle("active");
    }
  }
</script>








  

  <!-- Footer -->
  <footer class="text-center py-4 mt-4" style="background-color:#005f73; color:white;">
    <p class="mb-0">© 2025 FrioListo. Todos los derechos reservados.</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
