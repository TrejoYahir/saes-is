var inputNombre = document.getElementById('nombre');
var inputCreditos = document.getElementById('creditos');

inputNombre.addEventListener("input", function (event) {
  if (inputNombre.validity.patternMismatch) {
    inputNombre.setCustomValidity("El formato es inválido");
  }
  else if (inputNombre.validity.valueMissing) {
    inputNombre.setCustomValidity("Se dejaron campos en blanco");
  }
  else {
    inputNombre.setCustomValidity("");
  }
});

inputCreditos.addEventListener("input", function (event) {
  if (inputCreditos.validity.patternMismatch) {
    inputCreditos.setCustomValidity("El formato es inválido");
  }
  else if (inputCreditos.validity.valueMissing) {
    inputCreditos.setCustomValidity("Se dejaron campos en blanco");
  }
  else {
    inputCreditos.setCustomValidity("");
  }
});