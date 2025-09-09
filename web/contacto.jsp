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
