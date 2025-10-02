<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Nosotros - FrioListo</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

  <!-- Estilos personalizados -->
  <link rel="stylesheet" href="css/normalize.css"/>
  <link rel="stylesheet" href="css/nosotros.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" />
</head>
<body>
  <header class="d-flex justify-content-between align-items-center p-3" style="background: linear-gradient(90deg, var(--primario), var(--secundario));">
    <h1 class="d-flex align-items-center text-white m-0">
      <img src="images/friolisto.png" alt="FrioListo logo" height="40" class="me-2"/>
      FrioListo
    </h1>
    <nav>
      <ul class="nav">
        <li class="nav-item"><a href="index.jsp" class="nav-link text-white">Inicio</a></li>
        <li class="nav-item"><a href="nosotros.jsp" class="nav-link activo">Sobre nosotros</a></li>
        <li class="nav-item"><a href="servicios.jsp" class="nav-link text-white">Productos y Servicios</a></li>
        <li class="nav-item"><a href="contacto.jsp" class="nav-link text-white">Contacto</a></li>
        <li class="nav-item"><a href="login.jsp" class="nav-link text-white">Iniciar sesión</a></li>
      </ul>
    </nav>
  </header>

  <main class="container my-5">
    <section class="nosotros-container text-center">
      <h2>Conócenos</h2>
      <p>
        FrioListo nació con una misión clara: llevar tus bebidas favoritas,
        frías y al instante, hasta la puerta de tu casa. Creemos que un buen
        momento siempre debe estar acompañado de una bebida perfecta, sin importar
        la hora o el lugar.
      </p>

      <div class="row mt-4">
        <div class="col-md-6 mb-3">
          <div class="caja h-100">
            <h3>Misión</h3>
            <p>
              Brindar un servicio de delivery rápido, confiable y de calidad,
              asegurando que cada bebida llegue fría y lista para disfrutar.
            </p>
          </div>
        </div>
        <div class="col-md-6 mb-3">
          <div class="caja h-100">
            <h3>Visión</h3>
            <p>
              Ser la plataforma líder en distribución de bebidas frías en
              Latinoamérica, innovando constantemente para satisfacer las
              necesidades de nuestros clientes.
            </p>
          </div>
        </div>
      </div>
    </section>

    <section class="productos mt-5">
      <h2>Productos Destacados</h2>
      <div class="row g-4 mt-3">
        <div class="col-6 col-md-4 col-lg-2">
          <div class="producto h-100">
            <img src="images/coca-cola.jpg" alt="Coca-Cola" class="img-fluid"/>
            <h3>Coca-Cola 1.5L</h3>
            <p>S/. 5.50</p>
            <a href="servicios.jsp" class="btn-comprar">Comprar</a>
          </div>
        </div>
        <div class="col-6 col-md-4 col-lg-2">
          <div class="producto h-100">
            <img src="images/red-bull.jpg" alt="Red Bull" class="img-fluid"/>
            <h3>Red Bull 250ml</h3>
            <p>S/. 6.00</p>
            <a href="servicios.jsp" class="btn-comprar">Comprar</a>
          </div>
        </div>
        <div class="col-6 col-md-4 col-lg-2">
          <div class="producto h-100">
            <img src="images/agua-cielo.jpg" alt="Agua Cielo" class="img-fluid"/>
            <h3>Agua Cielo 625ml</h3>
            <p>S/. 2.00</p>
            <a href="servicios.jsp" class="btn-comprar">Comprar</a>
          </div>
        </div>
        <div class="col-6 col-md-4 col-lg-2">
          <div class="producto h-100">
            <img src="images/inca-kola.jpg" alt="Inca Kola" class="img-fluid"/>
            <h3>Inca Kola 1.5L</h3>
            <p>S/. 5.50</p>
            <a href="servicios.jsp" class="btn-comprar">Comprar</a>
          </div>
        </div>
        <div class="col-6 col-md-4 col-lg-2">
          <div class="producto h-100">
            <img src="images/gatorade.jpg" alt="Gatorade" class="img-fluid"/>
            <h3>Gatorade 500ml</h3>
            <p>S/. 4.50</p>
            <a href="servicios.jsp" class="btn-comprar">Comprar</a>
          </div>
        </div>
        <div class="col-6 col-md-4 col-lg-2">
          <div class="producto h-100">
            <img src="images/pepsi.jpg" alt="Pepsi" class="img-fluid"/>
            <h3>Pepsi 1.5L</h3>
            <p>S/. 4.80</p>
            <a href="servicios.jsp" class="btn-comprar">Comprar</a>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer class="text-center py-4" style="background-color: var(--secundario); color: white;">
    <p class="mb-0">&copy; 2025 FrioListo. Todos los derechos reservados.</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
