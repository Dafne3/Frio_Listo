const usuarioInput = document.getElementById('usuario');
const ayudaUsuario = document.getElementById('ayudaUsuario');
const contraseñaInput = document.getElementById('contraseña');

const popover = document.getElementById('popover');
const popoverMensaje = document.getElementById('popoverMensaje');

// Lista de usuarios simulados con roles
const usuarios = [
  { email: 'admin@mail.com', password: '123456', rol: 'administrador' },
  { email: 'cliente@mail.com', password: '123456', rol: 'cliente' },
];

// Mostrar popover
function mostrarPopover(mensaje, tipo) {
  popoverMensaje.textContent = mensaje;
  popover.classList.add('mostrar');
  popover.classList.remove('oculto');

  setTimeout(() => {
    popover.classList.add('oculto');
    popover.classList.remove('mostrar');
  }, 3000);
}

// Validación de correo y contraseña
function validarCredenciales(email, password) {
  return usuarios.find(
    (usuario) => usuario.email === email && usuario.password === password
  );
}

// Validación en tiempo real del correo
usuarioInput.addEventListener('input', () => {
  const valor = usuarioInput.value;
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (regex.test(valor)) {
    usuarioInput.classList.add('valid');
    usuarioInput.classList.remove('invalid');
    ayudaUsuario.style.color = 'var(--success)';
  } else {
    usuarioInput.classList.add('invalid');
    usuarioInput.classList.remove('valid');
    ayudaUsuario.style.color = 'var(--error)';
  }
});

// Mostrar / ocultar contraseña
document.getElementById('verPass').addEventListener('change', function () {
  contraseñaInput.type = this.checked ? 'text' : 'password';
});

// Login
document.getElementById('loginForm').addEventListener('submit', function (e) {
  e.preventDefault();

  const email = usuarioInput.value.trim();
  const password = contraseñaInput.value.trim();

  const usuarioValidado = validarCredenciales(email, password);

  if (usuarioValidado) {
    mostrarPopover(`✅ Bienvenido ${usuarioValidado.rol}, redirigiendo...`, 'success');
    
    // Guardar sesión simulada (preparación para backend)
    localStorage.setItem('usuario', JSON.stringify(usuarioValidado));

    setTimeout(() => {
      if (usuarioValidado.rol === 'administrador') {
        window.location.href = 'admin-panel.html';
      } else {
        window.location.href = 'cliente-panel.html';
      }
    }, 2000);
  } else {
    mostrarPopover('❌ Usuario o contraseña incorrectos.', 'error');
  }
});
