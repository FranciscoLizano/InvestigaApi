$(document).ready(function () {
    cargaDatosUsuario();

    //setTimeout(function () {
    //    cargaCombosEstados();
    //}, 1000);

    //setTimeout(function () {
    //    cargaCombosActividades();
    //}, 2500);

    //setTimeout(function () {
    //    cargaCombosPrioridades();
    //}, 3500);


    //setTimeout(function () {
    //    cargaListaTareas();
    //}, 4500);

});

function cargaDatosUsuario() {
    $("#lblUsuario").html($.cookie("USRNOM"));
    $("#lblEmail").html($.cookie("USREML"));
    $("#Usuario").html($.cookie("USRNOM"));
    $("#Email").html($.cookie("USREML"));

}