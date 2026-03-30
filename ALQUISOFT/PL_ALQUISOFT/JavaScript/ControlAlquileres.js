$(document).ready(function () {
    cargaDatosUsuario();

    setTimeout(function () {
        cargaCombosEstados();
    }, 1000);

    //Se espera 2 segundos para llamar a la función
    setTimeout(function () {
        cargaCombosCategorias();
    }, 2000);

    setTimeout(function () {
        cargaCombosCondicion();
    }, 3000);


    setTimeout(function () {
        cargaListaAlquileres();
    }, 4000);

});

//función que carga los datos del usuario en la pantalla de control de alquileres
function cargaDatosUsuario() {
    $("#lblUsuario").html($.cookie("USRNOM"));
    $("#lblEmail").html($.cookie("USREML"));
    $("#Usuario").html($.cookie("USRNOM"));
    $("#Email").html($.cookie("USREML"));

}

function cargaCombosCategorias() {
    //Definimos el arreglo que contiene los valores del objeto de parametros de js que vamos a enviar al code behind
    var obj_Parametros_JS = new Array();

    //Capturar los valores del formulario
    obj_Parametros_JS[0] = $.cookie("USRUNI");

    //Crear la estructura de parámetros en formato JSON
    var parametros = JSON.stringify({ 'obj_Parametros_JS': obj_Parametros_JS })

    if ((obj_Parametros_JS[0] != 0) && (obj_Parametros_JS[0] != undefined)) {
        //A través de métodos AJAX de JQUERY vamos a consumir el web method del code behinf
        //Indicamos el nombre del web mehotd y el formulario en donde está ese web method
        jQuery.ajax({
            type: "POST",
            url: "frmControlAlquileres.aspx/CargaListaCategoriasCombo",
            data: parametros,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (msg) {
                var res = msg.d;

                if (res == undefined) {
                    Swal.fire({
                        position: 'center-center',
                        icon: "error",
                        title: "Error en la conexión",
                        text: "Error en la conexión a la base de datos",
                        confirmButtonColor: '#78be84',
                    })
                }
                else {

                    if (res == "No se encontraron registros") {
                        $("#cboCategoria").html("");

                        Swal.fire({
                            position: 'center-center',
                            icon: 'info',
                            title: 'Información de registros',
                            text: res + " de Categorias de Apartamentos Disponibles. Contacte al administrador del sistema.",
                            confirmButtonColor: '#78be84',
                        });
                    }
                    else {
                        $("#cboCategoria").html(res);
                    }
                }
            },
            failure: function (msg) {

            },
            error: function (msg) {

            }
        });
    }
    else {
        Swal.fire({
            position: 'center-center',
            icon: 'error',
            title: 'Información de credenciales',
            text: "No se ha podido validar la información del usuario. Por favor, inicie sesión en el sistema.",
            showConfirmButton: false,
            timer: 4500,
            timerProgressBar: true,
            confirmButtonColor: '#78be84',
        });

        setTimeout(function () {
            location.href = "../Login/frmInicioSesion.aspx";
        }, 4500);
    }

}

function cargaCombosEstados() {
    //Definimos el arreglo que contiene los valores del objeto de parametros de js que vamos a enviar al code behind
    var obj_Parametros_JS = new Array();

    //Capturar los valores del formulario
    obj_Parametros_JS[0] = $.cookie("USRUNI");

    //Crear la estructura de parámetros en formato JSON
    var parametros = JSON.stringify({ 'obj_Parametros_JS': obj_Parametros_JS })

    if ((obj_Parametros_JS[0] != 0) && (obj_Parametros_JS[0] != undefined)) {
        //A través de métodos AJAX de JQUERY vamos a consumir el web method del code behinf
        //Indicamos el nombre del web mehotd y el formulario en donde está ese web method
        jQuery.ajax({
            type: "POST",
            url: "frmControlAlquileres.aspx/CargaListaEstadosCombo",
            data: parametros,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (msg) {
                var res = msg.d;

                if (res == undefined) {
                    Swal.fire({
                        position: 'center-center',
                        icon: "error",
                        title: "Error en la conexión",
                        text: "Error en la conexión a labase de datos"
                    })
                }
                else {

                    if (res == "No se encontraron registros") {
                        $("#bsqEstado").html("");
                        $("#cboEstado").html("");
                        bsqEstado
                        Swal.fire({
                            position: 'center-center',
                            icon: 'info',
                            title: 'Información de registros',
                            text: res + " de Estados de Alquileres Disponibles. Contacte al administrador del sistema.",
                            confirmButtonColor: '#78be84',
                        });
                    }
                    else {
                        $("#bsqEstado").html("<option value='0'>Todos</option>" + res);
                        $("#cboEstado").html(res);
                    }
                }
            },
            failure: function (msg) {

            },
            error: function (msg) {

            }
        });
    }
    else {
        Swal.fire({
            position: 'center-center',
            icon: 'error',
            title: 'Información de credenciales',
            text: "No se ha podido validar la información del usuario. Por favor, inicie sesión en el sistema.",
            confirmButtonColor: '#78be84',
            showConfirmButton: false,
            timer: 4500,
            timerProgressBar: true
        });

        setTimeout(function () {
            location.href = "../Login/frmInicioSesion.aspx";
        }, 4500);
    }

}

function cargaCombosCondicion() {
    //Definimos el arreglo que contiene los valores del objeto de parametros de js que vamos a enviar al code behind
    var obj_Parametros_JS = new Array();

    //Capturar los valores del formulario
    obj_Parametros_JS[0] = $.cookie("USRUNI");

    //Crear la estructura de parámetros en formato JSON
    var parametros = JSON.stringify({ 'obj_Parametros_JS': obj_Parametros_JS })

    if ((obj_Parametros_JS[0] != 0) && (obj_Parametros_JS[0] != undefined)) {
        //A través de métodos AJAX de JQUERY vamos a consumir el web method del code behinf
        //Indicamos el nombre del web mehotd y el formulario en donde está ese web method
        jQuery.ajax({
            type: "POST",
            url: "frmControlAlquileres.aspx/CargaListaCondicionCombo",
            data: parametros,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (msg) {
                var res = msg.d;

                if (res == undefined) {
                    Swal.fire({
                        position: 'center-center',
                        icon: "error",
                        title: "Error en la conexión",
                        text: "Error en la conexión a labase de datos",
                        confirmButtonColor: '#78be84',
                    })
                }
                else {

                    if (res == "No se encontraron registros") {
                        $("#cboCondicion").html("");

                        Swal.fire({
                            position: 'center-center',
                            icon: 'info',
                            title: 'Información de registros',
                            text: res + " de Condiciones de Pago Disponibles. Contacte al administrador del sistema.",
                            confirmButtonColor: '#78be84',
                        });
                    }
                    else {
                        $("#cboCondicion").html(res);
                    }
                }
            },
            failure: function (msg) {

            },
            error: function (msg) {

            }
        });
    }
    else {
        Swal.fire({
            position: 'center-center',
            icon: 'error',
            title: 'Información de credenciales',
            text: "No se ha podido validar la información del usuario. Por favor, inicie sesión en el sistema.",
            confirmButtonColor: '#78be84',
            showConfirmButton: false,
            timer: 4500,
            timerProgressBar: true
        });

        setTimeout(function () {
            location.href = "../Login/frmInicioSesion.aspx";
        }, 4500);
    }

}

function cargaListaAlquileres() {

    $.cookie('ALQUNI', 0, { expires: TLC, path: "/", domain: g_Dominio });

    //Definimos el arreglo que contiene los valores del objeto de parametros de js que vamos a enviar al code behind
    var obj_Parametros_JS = new Array();

    //Capturar los valores del formulario
    obj_Parametros_JS[0] = $.cookie("USRUNI");
    obj_Parametros_JS[1] = $("#bsqApartamento").val();
    obj_Parametros_JS[2] = $("#bsqEstado").val();

    //Crear la estructura de parámetros en formato JSON
    var parametros = JSON.stringify({ 'obj_Parametros_JS': obj_Parametros_JS })

    if ((obj_Parametros_JS[0] != 0) && (obj_Parametros_JS[0] != undefined)) {
        //A través de métodos AJAX de JQUERY vamos a consumir el web method del code behinf
        //Indicamos el nombre del web mehotd y el formulario en donde está ese web method
        jQuery.ajax({
            type: "POST",
            url: "frmControlAlquileres.aspx/CargaListaAlquileres",
            data: parametros,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (msg) {
                var res = msg.d;

                if (res == undefined) {
                    Swal.fire({
                        position: 'center-center',
                        icon: "error",
                        title: "Error en la conexión",
                        text: "Error en la conexión a labase de datos"
                    })
                }
                else {

                    if (res == "No se encontraron registros") {
                        $("#tblAlquileres").html("");

                        Swal.fire({
                            position: 'center-center',
                            icon: 'info',
                            title: 'Información de registros',
                            text: res + " de Alquileres con los filtros de búsqueda.",
                            confirmButtonColor: '#78be84',
                        });
                    }
                    else {
                        $("#tblAlquileres").html(res);
                        paginar("#tblAlquileres");
                    }
                }
            },
            failure: function (msg) {

            },
            error: function (msg) {

            }
        });
    }
    else {
        Swal.fire({
            position: 'center-center',
            icon: 'error',
            title: 'Información de credenciales',
            text: "No se ha podido validar la información del usuario. Por favor, inicie sesión en el sistema.",
            showConfirmButton: false,
            timer: 4500,
            timerProgressBar: true,
            confirmButtonColor: '#78be84',
        });

        setTimeout(function () {
            location.href = "../Login/frmInicioSesion.aspx";
        }, 4500);
    }

}

// Esta función es para llamar a una pantalla emergente de tipo modal
//bootstrap es la librería que contiene este tipo de elemento "bootstrap.Modal(document.getElementByI"
function crearAlquiler() {

    $.cookie('ALQUNI', 0, { expires: TLC, path: "/", domain: g_Dominio });

    $("#txtApartamento").val("");
    $("#txtInquilino").val("");
    $("#txtCorreo").val("");
    $("#txtTelefono").val("");
    $("#txtFecIni").val("");
    $("#txtFecFin").val("");
    $("#txtMensualidad").val("");

    var modal = new bootstrap.Modal(document.getElementById("exampleModal"));
    modal.show();
}

function defineAlquiler(pUni) {

    $("#txtApartamento").val("");
    $("#txtInquilino").val("");
    $("#txtCorreo").val("");
    $("#txtTelefono").val("");
    $("#txtFecIni").val("");
    $("#txtFecFin").val("");
    $("#txtMensualidad").val("");


    $.cookie('ALQUNI', pUni, { expires: TLC, path: "/", domain: g_Dominio });

    //Definimos el arreglo que contiene los valores del objeto de parametros de js que vamos a enviar al code behind
    var obj_Parametros_JS = new Array();

    //Capturar los valores del formulario
    obj_Parametros_JS[0] = $.cookie("USRUNI");
    obj_Parametros_JS[1] = $.cookie("ALQUNI");

    //Crear la estructura de parámetros en formato JSON
    var parametros = JSON.stringify({ 'obj_Parametros_JS': obj_Parametros_JS })

    if ((obj_Parametros_JS[0] != 0) && (obj_Parametros_JS[0] != undefined)) {
        //A través de métodos AJAX de JQUERY vamos a consumir el web method del code behinf
        //Indicamos el nombre del web mehotd y el formulario en donde está ese web method
        jQuery.ajax({
            type: "POST",
            url: "frmControlAlquileres.aspx/CargaInformacionAlquileres",
            data: parametros,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (msg) {
                var res = msg.d;

                if (res == undefined) {
                    Swal.fire({
                        position: 'center-center',
                        icon: "error",
                        title: "Error en la conexión",
                        text: "Error en la conexión a labase de datos"
                    })
                }
                else {
                    var arreglo = new Array();
                    var str;

                    str = res;
                    arreglo = (str.split("<SPLITER>"));
                    var resultado = arreglo[0];

                    if (resultado == "No se encontraron registros") {

                        Swal.fire({
                            position: 'center-center',
                            icon: 'info',
                            title: 'Información de registros',
                            text: res + " del alquiler seleccionado.",
                        });
                    }
                    else {
                        if (resultado != "") {
                            $("#txtApartamento").val(arreglo[1]);
                            $("#txtInquilino").val(arreglo[2]);
                            $("#txtCorreo").val(arreglo[3]);
                            $("#txtTelefono").val(arreglo[4]);
                            $("#txtFecIni").val(formatDate(arreglo[5]));
                            $("#txtFecFin").val(formatDate(arreglo[6]));
                            $("#txtMensualidad").val(arreglo[7]);
                            $("#cboEstado").val(arreglo[8]);
                            $("#cboCondicion").val(arreglo[9]);
                            $("#cboCategoria").val(arreglo[10]);
                        }
                    }
                }
            },
            failure: function (msg) {

            },
            error: function (msg) {

            }
        });
    }
    else {
        Swal.fire({
            position: 'center-center',
            icon: 'error',
            title: 'Información de credenciales',
            text: "No se ha podido validar la información del usuario. Por favor, inicie sesión en el sistema.",
            showConfirmButton: false,
            timer: 4500,
            timerProgressBar: true
        });

        setTimeout(function () {
            location.href = "../Login/frmInicioSesion.aspx";
        }, 4500);
    }

    var modal = new bootstrap.Modal(document.getElementById("exampleModal"));
    modal.show();
}

function mantenimientoAlquileres() {
    //Definimos el arreglo que contiene los valores del objeto de parametros de js que vamos a enviar al code behind
    var obj_Parametros_JS = new Array();

    //Capturar los valores del formulario
    obj_Parametros_JS[0] = $.cookie("USRUNI");
    obj_Parametros_JS[1] = $.cookie("ALQUNI");
    obj_Parametros_JS[2] = $("#txtApartamento").val();
    obj_Parametros_JS[3] = $("#txtInquilino").val();
    obj_Parametros_JS[4] = $("#txtCorreo").val();
    obj_Parametros_JS[5] = $("#txtTelefono").val();
    obj_Parametros_JS[6] = $("#txtFecIni").val();
    obj_Parametros_JS[7] = $("#txtFecFin").val();
    obj_Parametros_JS[8] = $("#txtMensualidad").val();
    obj_Parametros_JS[9] = $("#cboEstado").val();
    obj_Parametros_JS[10] = $("#cboCondicion").val();
    obj_Parametros_JS[11] = $("#cboCategoria").val();


    //Crear la estructura de parámetros en formato JSON
    var parametros = JSON.stringify({ 'obj_Parametros_JS': obj_Parametros_JS })

    if ((obj_Parametros_JS[0] != 0) && (obj_Parametros_JS[0] != undefined)) {
        //A través de métodos AJAX de JQUERY vamos a consumir el web method del code behinf
        //Indicamos el nombre del web mehotd y el formulario en donde está ese web method
        jQuery.ajax({
            type: "POST",
            url: "frmControlAlquileres.aspx/MantenimientoAlquileres",
            data: parametros,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (msg) {
                var res = msg.d;

                if (res == undefined) {
                    Swal.fire({
                        position: 'center-center',
                        icon: "error",
                        title: "Error en la conexión",
                        text: "Error en la conexión a labase de datos"
                    })
                }
                else {
                    var arreglo = new Array();
                    var str;

                    str = res;
                    arreglo = (str.split("<SPLITER>"));
                    var resultado = arreglo[0];

                    if ((resultado != "0") && (resultado != "-1")) {

                        Swal.fire({
                            position: 'center-center',
                            icon: 'success',
                            title: 'Información de registros',
                            text: arreglo[1],
                            showConfirmButton: false,
                            timer: 2500,
                            timerProgressBar: true
                        });

                        setTimeout(function () {
                            location.href = "frmControlAlquileres.aspx";
                        }, 2500);
                    }
                    else {
                        Swal.fire({
                            position: 'center-center',
                            icon: 'error',
                            title: 'Información de registros',
                            text: arreglo[1],
                        });
                    }
                }
            },
            failure: function (msg) {

            },
            error: function (msg) {

            }
        });
    }
    else {
        Swal.fire({
            position: 'center-center',
            icon: 'error',
            title: 'Información de credenciales',
            text: "No se ha podido validar la información del usuario. Por favor, inicie sesión en el sistema.",
            showConfirmButton: false,
            timer: 4500,
            timerProgressBar: true
        });

        setTimeout(function () {
            location.href = "../Login/frmInicioSesion.aspx";
        }, 4500);
    }

    var modal = new bootstrap.Modal(document.getElementById("exampleModal"));
    modal.show();

}

function eliminaAlquiler(pUni) {
    //Definimos el arreglo que contiene los valores del objeto de parametros de js que vamos a enviar al code behind
    var obj_Parametros_JS = new Array();

    //Capturar los valores del formulario
    obj_Parametros_JS[0] = $.cookie("USRUNI");
    obj_Parametros_JS[1] = pUni;


    //Crear la estructura de parámetros en formato JSON
    var parametros = JSON.stringify({ 'obj_Parametros_JS': obj_Parametros_JS })

    if ((obj_Parametros_JS[0] != 0) && (obj_Parametros_JS[0] != undefined)) {
        //A través de métodos AJAX de JQUERY vamos a consumir el web method del code behinf
        //Indicamos el nombre del web mehotd y el formulario en donde está ese web method
        jQuery.ajax({
            type: "POST",
            url: "frmControlAlquileres.aspx/EliminarAlquileres",
            data: parametros,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: function (msg) {
                var res = msg.d;

                if (res == undefined) {
                    Swal.fire({
                        position: 'center-center',
                        icon: "error",
                        title: "Error en la conexión",
                        text: "Error en la conexión a labase de datos"
                    })
                }
                else {
                    var arreglo = new Array();
                    var str;

                    str = res;
                    arreglo = (str.split("<SPLITER>"));
                    var resultado = arreglo[0];

                    if ((resultado != "0") && (resultado != "-1")) {

                        Swal.fire({
                            position: 'center-center',
                            icon: 'success',
                            title: 'Información de registros',
                            text: arreglo[1],
                            showConfirmButton: false,
                            timer: 2500,
                            timerProgressBar: true
                        });

                        setTimeout(function () {
                            location.href = "frmControlAlquileres.aspx";
                        }, 2500);
                    }
                    else {
                        Swal.fire({
                            position: 'center-center',
                            icon: 'error',
                            title: 'Información de registros',
                            text: arreglo[1],
                        });
                    }
                }
            },
            failure: function (msg) {

            },
            error: function (msg) {

            }
        });
    }
    else {
        Swal.fire({
            position: 'center-center',
            icon: 'error',
            title: 'Información de credenciales',
            text: "No se ha podido validar la información del usuario. Por favor, inicie sesión en el sistema.",
            showConfirmButton: false,
            timer: 4500,
            timerProgressBar: true
        });

        setTimeout(function () {
            location.href = "../Login/frmInicioSesion.aspx";
        }, 4500);
    }
}

//Esta función se encarga de dar formato de fecha
function formatDate(dateStr) {
    var dateParts = dateStr.split("/");
    var day = dateParts[0].padStart(2, '0');
    var month = dateParts[1].padStart(2, '0');
    var year = dateParts[2].substring(0, 4);
    return `${year}-${month}-${day}`;
}

//Esta función se encarga de dar formatos a la tabla que se va a mostrar
function paginar(elemento) {


    var table;

    if ($.fn.DataTable.isDataTable(elemento)) {

        table = $(elemento).DataTable({

            "iDisplayLength": 10,
            "aLengthMenu": [[5, 10, 50, 100], [5, 10, 50, 100]],
            "oLanguage":
            {
                "sLengthMenu": " Mostrar _MENU_  registros por p&aacute;gina",
                "sProcessing": "Procesando...",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Filtrar:",
                "sUrl": "",
                "sInfoThousands": ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                }
            },
            paging: true,
            destroy: true
        });
    }
    else {
        table = $(elemento).DataTable({

            "iDisplayLength": 10,
            "aLengthMenu": [[5, 10, 50, 100], [5, 10, 50, 100]],
            "oLanguage":
            {
                "sLengthMenu": " Mostrar _MENU_  registros por p&aacute;gina",
                "sProcessing": "Procesando...",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Filtrar:",
                "sUrl": "",
                "sInfoThousands": ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                }
            },
            paging: true,
            destroy: true
        });

    }
};

//Esta función se encarga de formato de colones a la información que ingresa el usuario
function formatearColones(input) {
    let valor = input.value.replace(/[^\d]/g, "");

    if (valor) {
        input.value = "₡ " + parseInt(valor).toLocaleString("es-CR");
    } else {
        input.value = "";
    }
}