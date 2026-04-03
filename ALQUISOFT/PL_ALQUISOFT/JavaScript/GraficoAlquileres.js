//Se define una variable de tipo arreglo para guardar todos los estados
var arreglo_Estados = new Array(); 

//Se define una variable de tipo arreglo para guardar las cantidades de alquileres por cada estado
var cantidad_AlquileresXEstado = new Array(); 

//Se define una variable de tipo arreglo para guardar las condiciones de pago
var arreglo_CondicionPago = new Array(); 

//Se define una variable de tipo arreglo para guardar las cantidades de alquileres por condición de pago
var cantidad_AlquileresXCondicionPago = new Array(); 

$(document).ready(function () {
    cargaResumenAlquileres();

    setTimeout(function () {
        cargaListaEstadosGrafico();
    }, 1000);

    setTimeout(function () {
        cargaListaCondicionPagoGrafico();
    }, 1500);
});

function cargaResumenAlquileres() {
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
            url: "frmControlAlquileres.aspx/cargaResumenAlquileres",
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
                            text: res + " de Estados de Tareas.",
                        });
                    }
                    else {
                        if (resultado != "") {
                            $("#TotalAlquileres").html(arreglo[0]);
                            $("#TotalSinIniciar").html(arreglo[1]);
                            $("#TotalIniciado").html(arreglo[2]);
                            $("#TotalFinalizados").html(arreglo[3]);
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
}

function cargaListaEstadosGrafico() {
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
            url: "frmControlAlquileres.aspx/CargaListaEstadosGrafico",
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
                    var str;
                    str = res;

                    arreglo_Estados = str.split("<SPLITER>").filter(function (el) {
                        return el.trim() != "";
                    });


                    var resultado = arreglo_Estados[0];

                    if (resultado == "No se encontraron registros") {

                        Swal.fire({
                            position: 'center-center',
                            icon: 'info',
                            title: 'Información de registros',
                            text: res + " de Estados de los Alquileres para el gráfico.",
                        });
                    }
                    else {
                        if (resultado != "") {
                            cargaListaCantidadAlquileresXEstado();
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
}

function cargaListaCantidadAlquileresXEstado() {
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
            url: "frmControlAlquileres.aspx/cargaListaCantidadAlquileresXEstadoGrafico",
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
                    var str;
                    str = res;

                    cantidad_AlquileresXEstado = str.split("<SPLITER>").filter(function (el) {
                        return el.trim() != "";
                    });

                    var resultado = cantidad_AlquileresXEstado[0];

                    if (resultado == "No se encontraron registros") {

                        Swal.fire({
                            position: 'center-center',
                            icon: 'info',
                            title: 'Información de registros',
                            text: res + " de Cantidades de Estados de los Alquileres para el gráfico.",
                        });
                    }
                    else {
                        if (resultado != "") {
                            genera_GraficoAlquileresXEstado();
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
}

function genera_GraficoAlquileresXEstado() {

    var coloresDisponibles = [
        'rgba(0,255,0, 0.7)', //Verde
        'rgba(197,218,187, 0.7)', //Verde Claro rgb(0,255,0)
        'rgba(122,190,136, 0.7)', //Verde Oscuro
        'rgba(0,255,255, 0.7)', //Celeste
        'rgba(75,183,210, 0.7)', //Celeste Claro
        'rgba(56,132,181, 0.7)', //Celeste Oscuro
        'rgba(48,118,175, 0.7)', //Azul Claro
        'rgba(0,0,255, 0.7)', //Azul
        'rgba(34,64,127, 0.7)' //Azul Oscuro
    ]

    var backgroundColores = [...coloresDisponibles]
        .sort(() => Math.random() - 0.5) //Mezclar aleatoriamente los colores
        .slice(0, arreglo_Estados.length); //Tomar solo los colores necesarios

    //se genera el gráfico con los datos
    new Chart(document.getElementById("grfAlquileresXEstadoPie"),
        {
            type: 'pie',
            data: {
                labels: arreglo_Estados,
                datasets: [
                    {
                        data: cantidad_AlquileresXEstado,
                        backgroundColor: backgroundColores
                    }
                ]
            },
            options: {
                responsive: true,
                legend: {
                    position: 'top',
                }
            }
        }
    );

}

function cargaListaCondicionPagoGrafico() {
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
            url: "frmControlAlquileres.aspx/CargaListaCondicionPagoGrafico",
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
                    var str;
                    str = res;

                    arreglo_CondicionPago = str.split("<SPLITER>").filter(function (el) {
                        return el.trim() != "";
                    });

                    var resultado = arreglo_CondicionPago[0];

                    if (resultado == "No se encontraron registros") {

                        Swal.fire({
                            position: 'center-center',
                            icon: 'info',
                            title: 'Información de registros',
                            text: res + " de Condición de Pago de los Alquileres para el gráfico.",
                        });
                    }
                    else {
                        if (resultado != "") {
                            cargaListaCantidadAlquileresXCondicinPago();
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
}

function cargaListaCantidadAlquileresXCondicinPago() {
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
            url: "frmControlAlquileres.aspx/cargaListaCantidadAlquileresXCondicinPagoGrafico",
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
                    var str;
                    str = res;

                    cantidad_AlquileresXCondicionPago = str.split("<SPLITER>").filter(function (el) {
                        return el.trim() != "";
                    });

                    var resultado = cantidad_AlquileresXCondicionPago[0];

                    if (resultado == "No se encontraron registros") {

                        Swal.fire({
                            position: 'center-center',
                            icon: 'info',
                            title: 'Información de registros',
                            text: res + " de Cantidades de Condición de Pago de los Alquileres para el gráfico.",
                        });
                    }
                    else {
                        if (resultado != "") {
                            genera_GraficoAlquileresXCondicionPago();
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
}

function genera_GraficoAlquileresXCondicionPago() {

    var coloresDisponibles = [
        'rgba(0,255,0, 0.7)', //Verde
        'rgba(197,218,187, 0.7)', //Verde Claro rgb(0,255,0)
        'rgba(122,190,136, 0.7)', //Verde Oscuro
        'rgba(0,255,255, 0.7)', //Celeste
        'rgba(75,183,210, 0.7)', //Celeste Claro
        'rgba(56,132,181, 0.7)', //Celeste Oscuro
        'rgba(48,118,175, 0.7)', //Azul Claro
        'rgba(0,0,255, 0.7)', //Azul
        'rgba(34,64,127, 0.7)' //Azul Oscuro
    ]

    var backgroundColores = [...coloresDisponibles]
        .sort(() => Math.random() - 0.5) //Mezclar aleatoriamente los colores
        .slice(0, arreglo_CondicionPago.length); //Tomar solo los colores necesarios

    new Chart(document.getElementById("grfAlquileresXCondicionPagoBarras"), {
        type: 'bar',
        data: {
            labels: arreglo_CondicionPago,
            datasets: [{
                label: 'Cantidad de alquileres',
                data: cantidad_AlquileresXCondicionPago,
                backgroundColor: backgroundColores
            }]
        },
        options: {
            responsive: true,
            legend: {
                display: false
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        min: 0,
                        stepSize: 1,
                        precision: 0
                    }
                }]
            }
        }
    });

}
