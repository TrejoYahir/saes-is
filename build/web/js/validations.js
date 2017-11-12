//var inputNombre = document.getElementById('nombre');
//
//inputNombre.addEventListener("input", function (event) {
//  if (inputNombre.validity.patternMismatch) {
//    inputNombre.setCustomValidity("El nombre solo puede contener letras y espacios");
//  }
//  else if (inputNombre.validity.valueMissing) {
//    inputNombre.setCustomValidity("No puedes dejar este campo vacío");
//  }
//  else {
//    inputNombre.setCustomValidity("");
//  }
//});

function validarTHorario(){
    var dia=$("#dia").val();
    var hora=$("#hora").val();
    var tipohorario=$("#tipohorario").val();
    var valido=true;
    var parametros = {
        "dia" : dia,
        "hora" : hora,
        "tipohorario" : tipohorario
    };
//    alert(dia+" "+hora+" "+tipohorario);
    $.ajax({
        data:  parametros,
        url:   'ValidarHorario',
        type:  'get',
        async: false,
        beforeSend: function () {
            
        },
        success:  function (response) {
//            alert("response="+response);
            if(response=="mal"){
                alert("Ya se tiene una clase en este día");
                valido=false;
            }
        },
        fail: function(){
            
        }
    });
    return valido;
//    return false;
}

function validarTTipo(){
    console.info("Entre vtt");
    var tipo=$("#tipoh").val();
    var valido=true;
    var parametros = {
        "tipo" : tipo
    };
    console.info("tipo "+tipo);
    $.ajax({
        data:  parametros,
        url:   'ValidarTHorario',
        type:  'get',
        async: false,
        beforeSend: function () {
            
        },
        success:  function (response) {
            console.info("response="+response);
            if(response=="mal"){
                alert("Ya se tiene registrado un horario con este nombre");
                valido=false;
            }
        },
        fail: function(){
            
        }
    });
    console.info("return "+valido);
    return valido;
}