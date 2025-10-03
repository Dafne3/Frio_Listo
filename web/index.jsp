<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FrioListo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body style="margin:0; padding-top:75px;">
  
    <!-- Header -->
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 px-4 fixed-top"
            style="background-color:#005f73; z-index:1040;">
        <!-- Icono -->
        <a href="index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-white text-decoration-none">
            <img src="images/friolisto.png" alt="FrioListo" width="50" height="50">
            <span class="fs-2 fw-bold ms-3">FrioListo</span>
        </a>
        
        <!-- Men� -->
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a href="index.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Inicio</a></li>
          <li><a href="sobre.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Sobre nosotros</a></li>
          <li><a href="productos.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Productos y servicios</a></li>
          <li><a href="contacto.jsp" class="nav-link px-2 fw-bold" style="color:#0bbca5;">Contacto</a></li>
        </ul>  
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FrioListo - Delivery de Bebidas</title>
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap">
</head>
<body>
  <header>
    <h1><img src="images/friolisto.png" alt="FrioListo Logo"> FrioListo </h1>
    <nav>
      <ul>
        <li><a href="index.jsp">Inicio</a></li>
        <li><a href="nosotros.jsp">Sobre nosotros</a></li>
        <li><a href="servicios.jsp">Productos y Servicios</a></li>
        <li><a href="contacto.jsp">Contacto</a></li>
        <li><a href="login.jsp">Iniciar sesión</a></li>
      </ul>
    </nav>
  </header>

        <!-- Botones -->
        <div class="col-md-3 text-end">
            <a href="login.jsp" class="btn me-2" style="background-color:#22a593; color:white; border:none;">Ingresar</a>
            <a href="registro.jsp" class="btn" style="background-color:#22a593; color:white; border:none;">Registrarse</a>
        </div>
    </header>
  
    <!-- Hero -->
    <section class="text-center text-white d-flex align-items-center justify-content-center"
             style="background: url('images/fondo.gif') center/cover no-repeat; min-height: calc(100vh - 75px);">
        <div>
          <h1 class="display-3 fw-bold bg-dark bg-opacity-50 p-3 rounded">
              �Tus bebidas favoritas, fr�as y al instante!
          </h1>
          
          <p class="lead mt-4 bg-dark bg-opacity-50 p-3 rounded mx-auto" style="max-width:680px;">
              Desde la heladera directa a tu mano, sin esperas, sin excusas.  
              Con FrioListo, refrescarte es m�s f�cil que abrir la botella.
          </p>
      
          <div class="mt-4">
              <a href="productos.jsp" class="btn btn-lg" style="background-color:#22a593; color:white; border:none;">Ver productos</a>
              <a href="contacto.jsp" class="btn btn-outline-light btn-lg ms-2">Cont�ctanos</a>
          </div>
        </div>
    </section>

    <!-- Beneficios -->
    <section class="py-5" style="background-color:#f8fbfd;">
      <div class="container p-4 rounded-4 shadow-sm" style="background-color:#ffffff;">
        <div class="row text-center g-4">
          <!-- Tarjeta 1 -->
          <div class="col-md-4">
            <div class="card h-100 border-0" 
                 style="background-color:#22a593; color:white; border-radius:15px; transition:all 0.3s ease;" 
                 onmouseover="this.style.transform='translateY(-10px) scale(1.05)'; this.style.boxShadow='0 8px 20px rgba(0,0,0,0.25)';" 
                 onmouseout="this.style.transform='none'; this.style.boxShadow='none';">
              <div class="card-body">
                <h3 class="fw-bold">Entrega R�pida</h3>
                <p class="mt-3">
                  Llega en menos de 30 minutos, garantizado.  
                  �Para que nunca te falte una bebida fr�a!
                </p>
              </div>
            </div>
          </div>

          <!-- Tarjeta 2 -->
          <div class="col-md-4">
            <div class="card h-100 border-0" 
                 style="background-color:#22a593; color:white; border-radius:15px; transition:all 0.3s ease;" 
                 onmouseover="this.style.transform='translateY(-10px) scale(1.05)'; this.style.boxShadow='0 8px 20px rgba(0,0,0,0.25)';" 
                 onmouseout="this.style.transform='none'; this.style.boxShadow='none';">
              <div class="card-body">
                <h3 class="fw-bold">Variedad de Bebidas</h3>
                <p class="mt-3">
                  Gaseosas, energizantes, aguas saborizadas y m�s.  
                  �Todo a un clic de distancia!
                </p>
              </div>
            </div>
          </div>

          <!-- Tarjeta 3 -->
          <div class="col-md-4">
            <div class="card h-100 border-0" 
                 style="background-color:#22a593; color:white; border-radius:15px; transition:all 0.3s ease;" 
                 onmouseover="this.style.transform='translateY(-10px) scale(1.05)'; this.style.boxShadow='0 8px 20px rgba(0,0,0,0.25)';" 
                 onmouseout="this.style.transform='none'; this.style.boxShadow='none';">
              <div class="card-body">
                <h3 class="fw-bold">Pedidos Online</h3>
                <p class="mt-3">
                  F�cil, r�pido y desde donde est�s,  
                  �FrioListo llega a ti sin complicaciones!
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- �Porque elegirnos? -->
    <section class="py-5 text-center" style="background-color:#e9f7f9;">
      <div class="container">
        <h2 class="fw-bold mb-4">�Por qu� elegir FrioListo?</h2>
        <p class="lead mx-auto" style="max-width:750px;">
          Porque somos m�s que un delivery. Somos el salvavidas de tus reuniones, el h�roe de tus celebraciones y el aliado perfecto para combatir el calor. 
          �No dejes que el hielo se derrita sin nosotros!
        </p>
      </div>
      <a href="servicios.jsp" class="comprar-btn">Comprar Ahora</a>
    </section>

    <!-- Testimonios -->
    <section class="py-5" style="background-color:#f8fbfd;">
      <div class="container text-center">
        <h2 class="fw-bold mb-5">Lo que dicen nuestros clientes</h2>

        <div class="row justify-content-center">
          <!-- Testimonio 1 -->
          <div class="col-md-8 mb-4">
            <div class="p-4 rounded-4" style="border:1px solid #22a593;">
              <p class="mb-2">"Incre�ble servicio, lleg� m�s r�pido de lo que esperaba y las bebidas estaban heladas. �FrioListo salv� mi fiesta!"</p>
              <p class="fw-bold mb-0">- Mariana R.</p>
            </div>
          </div>

          <!-- Testimonio 2 -->
          <div class="col-md-8 mb-4">
            <div class="p-4 rounded-4" style="border:1px solid #22a593;">
              <p class="mb-2">"Muy f�cil de usar y el cat�logo es super amplio. �Pido todas las semanas!"</p>
              <p class="fw-bold mb-0">- Jorge T.</p>
            </div>
          </div>

          <!-- Testimonio 3 -->
          <div class="col-md-8 mb-4">
            <div class="p-4 rounded-4" style="border:1px solid #22a593;">
              <p class="mb-2">"Excelente atenci�n al cliente, rapidez y variedad. �100% recomendado!"</p>
              <p class="fw-bold mb-0">- Luc�a M.</p>
            </div>
          </div>
        </div>

        <!-- Bot�n final -->
        <div class="mt-4">
          <a href="productos.jsp" class="btn btn-lg" style="background-color:#22a593; color:white; border:none;">Explorar bebidas</a>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="text-center py-4" style="background-color:#005f73; color:white;">
      <p>� 2025 FrioListo. Todos los derechos reservados.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
