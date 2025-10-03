<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Contacto - FrioListo</title>
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
<body style="margin:0; padding-top:75px; background-color:#f8fbfd;">

  <!-- Header -->
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 px-4 fixed-top"
            style="background-color:#005f73; z-index:1040;">
        <!-- Icono -->
        <a href="index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-white text-decoration-none">
            <img src="images/friolisto.png" alt="FrioListo" width="50" height="50">
            <span class="fs-2 fw-bold ms-3">FrioListo</span>
        </a>
        
        <!-- Menú -->
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a href="index.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Inicio</a></li>
          <li><a href="sobre.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Sobre nosotros</a></li>
          <li><a href="productos.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Productos y servicios</a></li>
          <li><a href="contacto.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Contacto</a></li>
        </ul>  

        <!-- Botones -->
        <div class="col-md-3 text-end">
            <a href="login.jsp" class="btn me-2" style="background-color:#22a593; color:white; border:none;">Ingresar</a>
            <a href="registro.jsp" class="btn" style="background-color:#22a593; color:white; border:none;">Registrarse</a>
        </div>
    </header>

  <!-- Información de contacto -->
  <section class="py-5 text-center">
    <div class="container">
      <h2 class="fw-bold mb-3" style="color:#005f73;">Contáctanos</h2>
      <p class="text-muted mb-5">Estamos para ayudarte en todo momento. Aquí tienes nuestras formas de contacto:</p>
      <div class="row g-4">
        <div class="col-md-4">
          <div class="p-4 rounded-4 shadow-sm bg-white h-100">
            <div class="contact-icon">📍</div>
            <h5 class="fw-bold" style="color:#22a593;">Dirección</h5>
            <p class="mb-0">Av. Siempre Viva 123, Lima - Perú</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="p-4 rounded-4 shadow-sm bg-white h-100">
            <div class="contact-icon">📞</div>
            <h5 class="fw-bold" style="color:#22a593;">Teléfono</h5>
            <p class="mb-0">+51 987 654 321</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="p-4 rounded-4 shadow-sm bg-white h-100">
            <div class="contact-icon">✉️</div>
            <h5 class="fw-bold" style="color:#22a593;">Correo</h5>
            <p class="mb-0">soporte@friolisto.com</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Formulario y mapa lado a lado -->
  <section class="py-5">
    <div class="container">
      <div class="row g-4 align-items-stretch">
        
        <!-- Formulario -->
        <div class="col-lg-6">
          <div class="card shadow-lg border-0 rounded-4 p-4 h-100">
            <h4 class="fw-bold mb-3" style="color:#005f73;">Envíanos un mensaje</h4>
            <form>
              <div class="row g-3">
                <div class="col-md-6">
                  <label class="form-label fw-bold">Nombre</label>
                  <input type="text" class="form-control" placeholder="Tu nombre completo" required>
                </div>
                <div class="col-md-6">
                  <label class="form-label fw-bold">Correo</label>
                  <input type="email" class="form-control" placeholder="ejemplo@mail.com" required>
                </div>
                <div class="col-md-6">
                  <label class="form-label fw-bold">Teléfono</label>
                  <input type="tel" class="form-control" placeholder="+51 999 999 999">
                </div>
                <div class="col-md-6">
                  <label class="form-label fw-bold">Asunto</label>
                  <input type="text" class="form-control" placeholder="Motivo de tu mensaje">
                </div>
                <div class="col-12">
                  <label class="form-label fw-bold">Mensaje</label>
                  <textarea class="form-control" rows="4" placeholder="Escribe tu mensaje aquí..." required></textarea>
                </div>
              </div>
              <div class="d-grid mt-4">
                <button class="btn fw-bold py-2" style="background-color:#22a593; color:white;">Enviar</button>
              </div>
            </form>
          </div>
        </div>

        <!-- Mapa -->
        <div class="col-lg-6">
          <div class="map-container shadow h-100">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3900.858715130392!2d-77.04279388561606!3d-12.04637479146343!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c8c1b1e2b5c9%3A0x7b98e5fa4c0f3e0f!2sLima!5e0!3m2!1ses-419!2spe!4v1695000000000!5m2!1ses-419!2spe" allowfullscreen="" loading="lazy"></iframe>
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
<%-- 
    Document   : contacto
    Created on : 8 set. 2025, 11:45:59 p. m.
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Contacto - FrioListo</title>
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/contacto.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet" />
</head>
<body>
  <header>
    <h1>
      <img src="images/friolisto.png" alt="FrioListo Logo"> 
      FrioListo
    </h1>
    <nav>
      <ul>
        <li><a href="index.jsp">Inicio</a></li>
        <li><a href="nosotros.jsp">Sobre nosotros</a></li>
        <li><a href="servicios.jsp">Productos y Servicios</a></li>
        <li><a class="active" href="contacto.jsp">Contacto</a></li>
        <li><a href="login.jsp">Iniciar sesión</a></li>
      </ul>
    </nav>
  </header>
  
  <main>
    <!-- FORMULARIO -->
    <section aria-labelledby="contact-form-title">
      <h2 id="contact-form-title">¡Escríbenos!</h2>
      
      <form action="procesarContacto.jsp" method="post">
        <label for="nombre">Nombre completo</label>
        <input type="text" id="nombre" name="nombre" placeholder="Tu nombre" required />

        <label for="email">Correo electrónico</label>
        <input type="email" id="email" name="email" placeholder="ejemplo@correo.com" required />

        <label for="telefono">Teléfono</label>
        <input type="tel" id="telefono" name="telefono" placeholder="912345678" required />

        <label for="asunto">Asunto</label>
        <input type="text" id="asunto" name="asunto" placeholder="Motivo de tu mensaje" required />

        <label for="mensaje">Mensaje</label>
        <textarea id="mensaje" name="mensaje" placeholder="¿En qué podemos ayudarte?" required></textarea>

        <button type="submit">Enviar</button>
      </form>
    </section>

    <!-- INFORMACIÓN DE CONTACTO + MAPA -->
    <section aria-labelledby="contact-info-title">
      <h2 id="contact-info-title">Nuestros datos de contacto</h2>
      
      <table>
        <thead>
          <tr>
            <th>Teléfono</th>
            <th>Correo</th>
            <th>Dirección</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>(51) 912 345 678</td>
            <td>FrioListo@gmail.com</td>
            <td>Avenida Principal 123, Lima, Perú</td>
          </tr>
        </tbody>
      </table>

      <div class="mapa-container">
        <iframe 
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3900.739373062143!2d-77.0427930845947!3d-12.04637324584207!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c8c7e!2sLima%20Centro!5e0!3m2!1ses!2spe!4v1694010000000!5m2!1ses!2spe"
          width="100%" 
          height="100%" 
          style="border:0;" 
          allowfullscreen="" 
          loading="lazy" 
          referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      </div>
    </section>
  </main>

  <footer>
    <p style="text-align:center; padding:1rem; background-color: var(--secundario); color:white;">
      &copy; 2025 FrioListo. Todos los derechos reservados.
    </p>
  </footer>
</body>
</html>
