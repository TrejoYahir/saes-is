/*----------------Alumno------------------------*/
function validar(){
    console.info("Entro a validar");
    if(validarActual()){
        console.info("Contra actual validada");
        if(validarConfirmar()){
            console.info("Validado v");
            return true;
        }
    }
    console.info("No Validado v");
    return false;
}

function validarActual(){
    console.info("Entro a validarActual");
    var contra=$("#contraAc").val();
    var validado=false;
    $.ajax({
        url:   'ConsultarContra',
        type:  'get',
        async: false,
        beforeSend: function () {
            
        },
        success:  function (response) {
            if(contra==response){
                console.info("Regreso true vA");
                validado=true;
            }else{
                alert("Contraseña incorrecta");
                console.info("Regreso false vA");
            }
        },
        fail: function(){
            
        }
    });
    return validado;
}

function validarConfirmar(){
    console.info("Entro a validarConfirmar");
    var contra1=$("#contra1").val();
    var contra2=$("#contra2").val();
    console.info(contra1+" "+contra2);
    if(contra1==contra2){
        return true;
    }else{
        alert("Las contraseñas no coinciden");
        return false;
    }
}

/*----------------Jefe de gestion------------------------*/

function validarJG(){
    console.info("Entro a validar");
    if(validarActualJG()){
        console.info("Contra actual validada");
        if(validarConfirmarJG()){
            console.info("Validado v");
            return true;
        }
    }
    console.info("No Validado v");
    return false;
}

function validarActualJG(){
    console.info("Entro a validarActual");
    var contra=$("#contraAc").val();
    var validado=false;
    $.ajax({
        url:   'ConsultarContraJG',
        type:  'get',
        async: false,
        beforeSend: function () {
            
        },
        success:  function (response) {
            if(contra==response){
                console.info("Regreso true vA "+response);
                validado=true;
            }else{
                alert("Contraseña incorrecta");
                console.info("Regreso false vA "+response);
            }
        },
        fail: function(){
            
        }
    });
    return validado;
}

function validarConfirmarJG(){
    console.info("Entro a validarConfirmar");
    var contra1=$("#contra1").val();
    var contra2=$("#contra2").val();
    console.info(contra1+" "+contra2);
    if(contra1==contra2){
        return true;
    }else{
        alert("Las contraseñas no coinciden");
        return false;
    }
}

/*----------------Analista------------------------*/

function validarAn(){
    console.info("Entro a validar");
    if(validarActualAn()){
        console.info("Contra actual validada");
        if(validarConfirmarAn()){
            console.info("Validado v");
            return true;
        }
    }
    console.info("No Validado v");
    return false;
}

function validarActualAn(){
    console.info("Entro a validarActual");
    var contra=$("#contraAc").val();
    var validado=false;
    $.ajax({
        url:   'ConsultarContraAn',
        type:  'get',
        async: false,
        beforeSend: function () {
            
        },
        success:  function (response) {
            if(contra==response){
                console.info("Regreso true vA "+response);
                validado=true;
            }else{
                alert("Contraseña incorrecta");
                console.info("Regreso false vA "+response);
            }
        },
        fail: function(){
            
        }
    });
    return validado;
}

function validarConfirmarAn(){
    console.info("Entro a validarConfirmar");
    var contra1=$("#contra1").val();
    var contra2=$("#contra2").val();
    console.info(contra1+" "+contra2);
    if(contra1==contra2){
        return true;
    }else{
        alert("Las contraseñas no coinciden");
        return false;
    }
}

/*----------------Academico------------------------*/

function validarAc(){
    console.info("Entro a validar");
    if(validarActualAc()){
        console.info("Contra actual validada");
        if(validarConfirmarAc()){
            console.info("Validado v");
            return true;
        }
    }
    console.info("No Validado v");
    return false;
}

function validarActualAc(){
    console.info("Entro a validarActual");
    var contra=$("#contraAc").val();
    var validado=false;
    $.ajax({
        url:   'ConsultarContraAc',
        type:  'get',
        async: false,
        beforeSend: function () {
            
        },
        success:  function (response) {
            if(contra==response){
                console.info("Regreso true vA "+response);
                validado=true;
            }else{
                alert("Contraseña incorrecta");
                console.info("Regreso false vA "+response);
            }
        },
        fail: function(){
            
        }
    });
    return validado;
}

function validarConfirmarAc(){
    console.info("Entro a validarConfirmar");
    var contra1=$("#contra1").val();
    var contra2=$("#contra2").val();
    console.info(contra1+" "+contra2);
    if(contra1==contra2){
        return true;
    }else{
        alert("Las contraseñas no coinciden");
        return false;
    }
}

/*---------------reestablecer----------------*/
function validarRC(){
    console.info("Entro a validarConfirmar");
    var contra1=$("#contra1").val();
    var contra2=$("#contra2").val();
    console.info(contra1+" "+contra2);
    if(contra1==contra2){
        return true;
    }else{
        alert("Las contraseñas no coinciden");
        return false;
    }
}