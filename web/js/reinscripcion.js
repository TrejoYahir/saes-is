/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var clases=0;
var otrocont=0;
$(document).ready(function () {
    var materias=0;
    (function ($) {
        $('#filtrar').keyup(function () {
            var rex = new RegExp($(this).val(), 'i');
            $('.buscar tr').hide();
            $('.buscar tr').filter(function () {
                return rex.test($(this).text());
            }).show();
        })
    }(jQuery)); 
    
});

function agregar(boton){
    var padre=$(boton).parent().parent();
//    var input=$(padre).find("input.clase");
//    $(input).attr("name","materia"+clases);
    $(padre).appendTo("#tablaHorario");
    $(boton).html("Quitar");
    $(boton).attr("onclick","quitar(this)");
    var contador=$("#contador");
    clases++;
    $(contador).attr("value",clases);
    if(validarDisponibilidad() && validarHorario() && validarNombre()){
       actualizarNombres(); 
    }else{
        quitar(boton);
    }
}

function actualizarNombres(){
    var tabla=$("#tablaHorario");
    var clasest=$(tabla).find("tr");
    clases=0;
    for (var i = 0; i < clasest.length-1; i++) {
        var input=$(clasest[i+1]).find("input.materia");
        $(input).attr("name","materia"+(i+1));
        clases++;
    }
    $(contador).attr("value",clases);
}

function quitar(boton){
    var padre=$(boton).parent().parent();
    $(padre).appendTo("#tablaBusqueda");
    $(boton).html("Agregar");
    $(boton).attr("onclick","agregar(this)");
    clases--;
    $(contador).attr("value",clases);
    actualizarNombres();
}

function validar(){
    if(clases==0){
        alert("Debes inscribir al menos la carga minima de creditos");
        return false;
    }else{
        if(validarDisponibilidad()){
            if(validarCreditos() && validarHorario() && validarNombre()){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
       
        
    }
}

function validarDisponibilidad(){
    var tabla=$("#tablaHorario");
    var clase=$(tabla).find("tr");
    var len=clase.length;
    for (var i = 0; i < len-1; i++) {
        var cupo=$(clase[i+1]).children(".cupo").html();
        if(cupo=="0"){
            alert("Esta clase no tiene lugares disponibles");
            return false;
        }
    }
    return true;
}

function validarCreditos(){
    var tabla=$("#tablaHorario");
    var clasest=$(tabla).find("tr");
    var sumacreditos=0.0;
    for (var i = 0; i < clasest.length-1; i++) {
        var elementcreditos=$(clasest[i+1]).find("input[name=creditos]");
        var creditos=parseFloat($(elementcreditos).val());
        sumacreditos=sumacreditos+creditos;
    }
    console.info("suma "+sumacreditos);
    if(sumacreditos<=19 || sumacreditos>=45){
        alert("No se encuentra en el rango de creditos");
        return false;
    }else{
        return true;
    }
}

function validarHorario(){
    var tabla=$("#tablaHorario");
    var filas=$(tabla).find("tr");
    var lenfilas=filas.length;
    var horarios=[];
    for (var i = 0; i < lenfilas-1; i++) {
        var elementcreditos=$(filas[i+1]).find("input[name=horario]");
        var creditos=$(elementcreditos).val();
        if(repiteHorario(horarios,creditos)){
            alert("Algunas clases tiene el mismo horario");
            return false;
        }else{
            horarios.push(creditos);
        }
    }
    return true;
}

function repiteHorario(horarios,horario){
    for (var i = 0; i < horarios.length; i++) {
        if(horarios[i]===horario){
            return true;
        }
    }
    return false;
}

function validarNombre(){
    var tabla=$("#tablaHorario");
    var clase=$(tabla).find("tr");
    var len=clase.length;
    var nombreMaterias=[];
    for (var i = 0; i < len-1; i++) {
        var nombre=$(clase[i+1]).children(".nombreMateria").html();
        if(repiteNombre(nombre,nombreMaterias)){
            alert("No puedes inscribir dos veces la misma materia");
            return false;
        }else{
            nombreMaterias.push(nombre);
        }
    }
    return true;
}

function repiteNombre(nombre,nombreMateria){
    var lennM=nombreMateria.length;
    for (var i = 0; i < lennM; i++) {
        if(nombreMateria[i]==nombre){
            return true;
        }
    }
    return false;
}

function agregarHorario(idUsuario,nombreHorario){
    console.info("entre a agregarHorario");
    var parametros = {
        "idUsuario" : idUsuario,
        "nombreHorario" : nombreHorario
    };
    $.ajax({
        data:  parametros,
        url:   'AgregarHorarioGuardado',
        type:  'get',
        async: false,
        beforeSend: function () {
            
        },
        success:  function (response) {
            alert("response "+response);
            $(response).appendTo("#tablaHorario");
            actualizarNombres();
        },
        fail: function(){
            
        }
    });
}