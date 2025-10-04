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
  <title>Sobre nosotros - FrioListo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    /* Íconos redondos */
    .contact-icon {
      width: 70px;
      height: 70px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 50%;
      background-color: #e9f7f9;
      color: #22a593;
      font-size: 30px;
      margin: auto;
      margin-bottom: 15px;
    }
    /* Inputs */
    .form-control:focus {
      border-color: #22a593;
      box-shadow: 0 0 8px rgba(34, 165, 147, 0.3);
    }
    /* Mapa */
    .map-container {
      position: relative;
      overflow: hidden;
      border-radius: 15px;
      min-height: 350px;
    }
    .map-container iframe {
      width: 100%;
      height: 100%;
      border: 0;
    }
  </style>
</head>
<body style="margin:0; padding-top:75px; background-color:#ffffff;">

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

  <!-- Presentación -->
<section class="py-5 text-center about-section">
  <div class="container">
    <h2 class="fw-bold mb-3" style="color:#005f73;">Sobre nosotros</h2>
    <p class="text-muted mb-5">
      En FrioListo trabajamos para ofrecer soluciones de refrigeración modernas, eficientes y sostenibles, 
      aportando calidad de vida a nuestros clientes y contribuyendo al cuidado del medio ambiente.
    </p>

    <div class="row g-4 justify-content-center">
      <!-- Misión -->
      <div class="col-md-6">
        <div class="p-4 rounded-4 shadow-sm bg-white h-100">
          <div class="contact-icon">🎯</div>
          <h5 class="fw-bold" style="color:#22a593;">Misión</h5>
          <p class="mb-0">
            Brindar productos y servicios de refrigeración confiables y de calidad, 
            que garanticen frescura y eficiencia, superando siempre las expectativas de nuestros clientes.
          </p>
        </div>
      </div>

      <!-- Visión -->
      <div class="col-md-6">
        <div class="p-4 rounded-4 shadow-sm bg-white h-100">
          <div class="contact-icon">🌟</div>
          <h5 class="fw-bold" style="color:#22a593;">Visión</h5>
          <p class="mb-0">
            Ser la empresa líder en soluciones de refrigeración en el país, 
            reconocida por su innovación, compromiso y responsabilidad social y ambiental.
          </p>
        </div>
      </div>
    </div>
  </div>
</section>




  <!-- Nuestros valores -->
  <section class="py-5" style="background-color:#f8fbfd;">
    <div class="container">
      <h3 class="fw-bold text-center mb-5" style="color:#005f73;">Nuestros valores</h3>
      <div class="row g-4 text-center">
        <div class="col-md-4">
          <div class="p-4 bg-white rounded-4 shadow-sm h-100">
            <div class="about-icon">🤝</div>
            <h5 class="fw-bold" style="color:#22a593;">Compromiso</h5>
            <p class="text-muted">Atendemos con responsabilidad y dedicación a cada uno de nuestros clientes.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="p-4 bg-white rounded-4 shadow-sm h-100">
            <div class="about-icon">💡</div>
            <h5 class="fw-bold" style="color:#22a593;">Innovación</h5>
            <p class="text-muted">Aplicamos la tecnología más moderna para soluciones prácticas y sostenibles.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="p-4 bg-white rounded-4 shadow-sm h-100">
            <div class="about-icon">🌍</div>
            <h5 class="fw-bold" style="color:#22a593;">Responsabilidad</h5>
            <p class="text-muted">Respetamos al medio ambiente y contribuimos al bienestar de la comunidad.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="text-center py-4 mt-4" style="background-color:#005f73; color:white;">
    <p class="mb-0">© 2025 FrioListo. Todos los derechos reservados.</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
