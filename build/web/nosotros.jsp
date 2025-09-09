<%-- 
    Document   : nosotros
    Created on : 9 set. 2025, 12:02:06 a. m.
    Author     : User
--%>

<%-- 
    Document   : nosotros
    Created on : 9 set. 2025
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Nosotros - FrioListo</title>
  <link rel="stylesheet" href="css/normalize.css"/>
  <link rel="stylesheet" href="css/nosotros.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" />
</head>
<body>
  <header>
    <h1>
      <img src="images/friolisto.png" alt="FrioListo logo" />
      FrioListo
    </h1>
    <nav>
      <ul>
        <li><a href="index.jsp">Inicio</a></li>
        <li><a href="nosotros.jsp" class="activo">Sobre nosotros</a></li>
        <li><a href="servicios.jsp">Productos y Servicios</a></li>
        <li><a href="contacto.jsp">Contacto</a></li>
        <li><a href="login.jsp">Iniciar sesión</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <section class="nosotros-container">
      <h2>Conócenos</h2>
      <p>
        FrioListo nació con una misión clara: llevar tus bebidas favoritas,
        frías y al instante, hasta la puerta de tu casa. Creemos que un buen
        momento siempre debe estar acompañado de una bebida perfecta, sin importar
        la hora o el lugar.
      </p>

      <div class="mision-vision">
        <div class="caja">
          <h3>Misión</h3>
          <p>
            Brindar un servicio de delivery rápido, confiable y de calidad,
            asegurando que cada bebida llegue fría y lista para disfrutar.
          </p>
        </div>
        <div class="caja">
          <h3>Visión</h3>
          <p>
            Ser la plataforma líder en distribución de bebidas frías en
            Latinoamérica, innovando constantemente para satisfacer las
            necesidades de nuestros clientes.
          </p>
        </div>
      </div>
    </section>

    <section class="productos">
      <h2>Productos Destacados</h2>
      <div class="grid-productos">
        <div class="producto">
          <img src="images/coca-cola.jpg" alt="Coca-Cola" />
          <h3>Coca-Cola 1.5L</h3>
          <p>S/. 5.50</p>
          <a href="servicios.jsp" class="btn-comprar">Comprar</a>
        </div>
        <div class="producto">
          <img src="images/red-bull.jpg" alt="Red Bull" />
          <h3>Red Bull 250ml</h3>
          <p>S/. 6.00</p>
          <a href="servicios.jsp" class="btn-comprar">Comprar</a>
        </div>
        <div class="producto">
          <img src="images/agua-cielo.jpg" alt="Agua Cielo" />
          <h3>Agua Cielo 625ml</h3>
          <p>S/. 2.00</p>
          <a href="servicios.jsp" class="btn-comprar">Comprar</a>
        </div>
        <div class="producto">
          <img src="images/inca-kola.jpg" alt="Inca Kola" />
          <h3>Inca Kola 1.5L</h3>
          <p>S/. 5.50</p>
          <a href="servicios.jsp" class="btn-comprar">Comprar</a>
        </div>
        <div class="producto">
          <img src="images/gatorade.jpg" alt="Gatorade" />
          <h3>Gatorade 500ml</h3>
          <p>S/. 4.50</p>
          <a href="servicios.jsp" class="btn-comprar">Comprar</a>
        </div>
        <div class="producto">
          <img src="images/pepsi.jpg" alt="Pepsi" />
          <h3>Pepsi 1.5L</h3>
          <p>S/. 4.80</p>
          <a href="servicios.jsp" class="btn-comprar">Comprar</a>
        </div>
      </div>
    </section>
  </main>

  <footer>
    <p>&copy; 2025 FrioListo. Todos los derechos reservados.</p>
  </footer>
</body>
</html>

