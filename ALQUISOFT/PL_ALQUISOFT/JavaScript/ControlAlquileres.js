$(document).ready(function () {
    cargaDatosUsuario();

    setTimeout(function () {
        cargaCombosEstados();
    }, 1000);

    //Se espera 2.5 para llamar a la función
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
                        $("#bsqEstado").html(res);
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

// Se la función para llamar a una pantalla emergente de tipo modal
//bootstrap es la librería que contiene este tipo de elemento "bootstrap.Modal(document.getElementByI"
function crearAlquiler() {
    var modal = new bootstrap.Modal(document.getElementById("exampleModal"));
    modal.show();
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


function formatearColones(input) {
    let valor = input.value.replace(/[^\d]/g, "");

    if (valor) {
        input.value = "₡ " + parseInt(valor).toLocaleString("es-CR");
    } else {
        input.value = "";
    }
}