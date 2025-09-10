const registroForm = document.getElementById('registroForm');
const verPassCheckbox = document.getElementById('verPass');
const contraseñaInput = document.getElementById('contraseña');
const confContraseñaInput = document.getElementById('confContraseña');
const mensajeConf = document.getElementById('mensajeConf');
const usuarioInput = document.getElementById('usuario');
const ayudaUsuario = document.getElementById('ayudaUsuario');
const telefonoInput = document.getElementById('telefono');
const emailInput = document.getElementById('email');

// Mostrar/ocultar contraseña
verPassCheckbox.addEventListener('change', () => {
  const tipo = verPassCheckbox.checked ? 'text' : 'password';
  contraseñaInput.type = tipo;
  confContraseñaInput.type = tipo;
});

// Validación usuario
usuarioInput.addEventListener('input', () => {
  const regex = /^[a-zA-Z0-9_]{3,20}$/;
  if (regex.test(usuarioInput.value)) {
    usuarioInput.classList.add('valid');
    usuarioInput.classList.remove('invalid');
    ayudaUsuario.style.color = '#4caf50';
  } else {
    usuarioInput.classList.add('invalid');
    usuarioInput.classList.remove('valid');
    ayudaUsuario.style.color = '#c62828';
  }
});

// Validación confirmación de contraseña
confContraseñaInput.addEventListener('input', () => {
  if (confContraseñaInput.value === contraseñaInput.value && confContraseñaInput.value !== '') {
    mensajeConf.textContent = '';
    confContraseñaInput.classList.add('valid');
    confContraseñaInput.classList.remove('invalid');
  } else {
    mensajeConf.textContent = '❌ Las contraseñas no coinciden';
    confContraseñaInput.classList.add('invalid');
    confContraseñaInput.classList.remove('valid');
  }
});

// Validación teléfono
telefonoInput.addEventListener('input', () => {
  telefonoInput.value = telefonoInput.value.replace(/\D/g, '');
});

// Validación correo
emailInput.addEventListener('input', () => {
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (regex.test(emailInput.value)) {
    emailInput.classList.add('valid');
    emailInput.classList.remove('invalid');
  } else {
    emailInput.classList.add('invalid');
    emailInput.classList.remove('valid');
  }
});

// Submit
registroForm.addEventListener('submit', (e) => {
  e.preventDefault();

  // Campos requeridos
  const camposValidos = [...registroForm.elements].every(input => {
    if (input.required && !input.value) return false;
    if (input.type === 'radio') return [...registroForm.elements[input.name]].some(r => r.checked);
    return true;
  });

  const contraseñasCoinciden = confContraseñaInput.value === contraseñaInput.value && contraseñaInput.value !== '';

  if (!camposValidos) {
    alert('❌ Por favor completa todos los campos.');
    return;
  }
  if (!contraseñasCoinciden) {
    confContraseñaInput.focus();
    return;
  }

  // Simulación de registro (a futuro con backend)
  registroForm.reset();
  mostrarPopoverRegistro();
});

// Popover registro
function mostrarPopoverRegistro() {
  const popoverRegistro = document.getElementById("popoverRegistro");
  const btnCerrar = document.getElementById("cerrarPopoverRegistro");

  popoverRegistro.style.display = "block";

  const timeoutId = setTimeout(() => {
    popoverRegistro.style.display = "none";
  }, 5000);

  if (btnCerrar) {
    btnCerrar.onclick = () => {
      popoverRegistro.style.display = "none";
      clearTimeout(timeoutId); 
    };
  }
}
