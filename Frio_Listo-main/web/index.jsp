<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FrioListo - Delivery de Bebidas</title>
  
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- CSS personalizado -->
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap">
</head>
<body>
  <header class="d-flex justify-content-between align-items-center px-4 py-3">
    <h1 class="d-flex align-items-center text-white">
      <img src="images/friolisto.png" alt="FrioListo Logo" class="me-2" style="height: 40px;">
      FrioListo
    </h1>
    <nav>
      <ul class="nav">
        <li class="nav-item"><a class="nav-link text-white" href="index.jsp">Inicio</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="nosotros.jsp">Sobre nosotros</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="servicios.jsp">Productos y Servicios</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="contacto.jsp">Contacto</a></li>
        <li class="nav-item"><a class="btn btn-light ms-2" href="login.jsp">Iniciar sesión</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <section class="hero d-flex flex-column justify-content-center align-items-center text-center">
      <h2 class="mb-3">¡Tus bebidas favoritas, frías y al instante!</h2>
      <p class="lead">Desde la heladera directa a tu mano, sin esperas, sin excusas. Con FrioListo, refrescarte es más fácil que abrir la botella.</p>
    </section>

    <section class="features container my-5">
      <div class="row g-4">
        <div class="col-md-4">
          <div class="feature p-4 rounded text-center shadow">
            <h3>Entrega Rápida</h3>
            <p>Llega en menos de 30 minutos, garantizado. ¡Para que nunca te falte una bebida fría!</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="feature p-4 rounded text-center shadow">
            <h3>Variedad de Bebidas</h3>
            <p>Gaseosas, energizantes, aguas saborizadas y más. ¡Todo a un clic de distancia!</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="feature p-4 rounded text-center shadow">
            <h3>Pedidos Online</h3>
            <p>Fácil, rápido y desde donde estés. ¡FrioListo llega a ti sin complicaciones!</p>
          </div>
        </div>
      </div>
    </section>

    <section class="info-extra text-center py-5">
      <div class="container">
        <h2 class="mb-3">¿Por qué elegir FrioListo?</h2>
        <p class="lead">Porque somos más que un delivery. Somos el salvavidas de tus reuniones, el héroe de tus celebraciones y el aliado perfecto para combatir el calor. ¡No dejes que el hielo se derrita sin nosotros!</p>
      </div>
    </section>

    <section class="testimonios text-center py-5">
      <div class="container">
        <h2 class="mb-4">Lo que dicen nuestros clientes</h2>
        <div class="testimonio mb-3 shadow-sm">
          <p>"Increíble servicio, llegó más rápido de lo que esperaba y las bebidas estaban heladas. ¡FrioListo salvó mi fiesta!"</p>
          <strong>- Mariana R.</strong>
        </div>
        <div class="testimonio mb-3 shadow-sm">
          <p>"Muy fácil de usar y el catálogo es super amplio. ¡Pido todas las semanas!"</p>
          <strong>- Jorge T.</strong>
        </div>
        <div class="testimonio mb-3 shadow-sm">
          <p>"Excelente atención al cliente, rapidez y variedad. ¡100% recomendado!"</p>
          <strong>- Lucía M.</strong>
        </div>
        <a href="servicios.jsp" class="btn btn-primary btn-lg mt-4">Comprar Ahora</a>
      </div>
    </section>
  </main>

  <footer class="text-center py-4">
    <p>&copy; 2025 FrioListo. Todos los derechos reservados.</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
