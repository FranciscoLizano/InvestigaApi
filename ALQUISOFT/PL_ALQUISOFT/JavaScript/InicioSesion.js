//COOKIES: Almacenamiento de información en el navegador
//WEB METHODS: Consumir / Invocar los web methods que están en el code behind del formulario

var g_Dominio = "localhost"; //Dominio de las cookies
var TLC = 60 // Tiempo de vida que van a tener las cookies

//Función para iniciar sesión en el sistema
function InicioSesion() {
    //Definimos el arreglo que contiene los valores del objeto de parametros de js que vamos a enviar al code behind
    var obj_Parametros_JS = new Array();

    //Capturar los valores del formulario
    obj_Parametros_JS[0] = $("#Eml_Login").val();
    obj_Parametros_JS[1] = $("#Pwd_Login").val();

    //Crear la estructura de parámetros en formato JSON
    var parametros = JSON.stringify({ 'obj_Parametros_JS': obj_Parametros_JS })

    //A través de métodos AJAX de JQUERY vamos a consumir el web method del code behinf
    //Indicamos el nombre del web mehotd y el formulario en donde está ese web method
    jQuery.ajax({
        type: "POST",
        url: "frmInicioSesion.aspx/InicioSesionUsuarios",
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
                var arreglo = new Array()
                var str;
                str = res;

                arreglo = (str.split("<SPLITER>"));

                var resultado = arreglo[0];

                if ((resultado != "0") && (resultado != "-1")) {
                    $.cookie('USRUNI', arreglo[0], { expires: TLC, path: "/", dommain: g_Dominio });
                    $.cookie('USREML', arreglo[2], { expires: TLC, path: "/", dommain: g_Dominio });
                    $.cookie('USRNOM', arreglo[3], { expires: TLC, path: "/", dommain: g_Dominio });

                    Swal.fire({
                        position: 'center-center',
                        icon: 'success',
                        title: 'Inicio de Sesión de Usuarios',
                        text: arreglo[1],
                        showConfirmButton: false,
                        timer: 4500,
                        timerProgressBar: true
                    });

                    setTimeout(function () {
                        location.href = "../ControlAlquileres/frmControlAlquileres.aspx";
                    }, 4500);
                }
                else {
                    Swal.fire({
                        position: 'center-center',
                        icon: 'error',
                        title: 'Inicio de Sesión de Usuarios',
                        text: arreglo[1],
                        showConfirmButton: false,
                        timer: 4500,
                        timerProgressBar: true
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


function RegistroUsuario() {
    //Definimos el arreglo que contiene los valores del objeto de parametros de js que vamos a enviar al code behind
    var obj_Parametros_JS = new Array();

    //Capturar los valores del formulario
    obj_Parametros_JS[0] = $("#Nom_Registro").val();
    obj_Parametros_JS[1] = $("#Eml_Registro").val();
    obj_Parametros_JS[2] = $("#Pwd_Registro").val();
    obj_Parametros_JS[3] = $("#Esp_Registro").val();

    //Crear la estructura de parámetros en formato JSON
    var parametros = JSON.stringify({ 'obj_Parametros_JS': obj_Parametros_JS })

    //A través de métodos AJAX de JQUERY vamos a consumir el web method del code behinf
    //Indicamos el nombre del web mehotd y el formulario en donde está ese web method
    jQuery.ajax({
        type: "POST",
        url: "frmInicioSesion.aspx/RegistroUsuarios",
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
                var arreglo = new Array()
                var str;
                str = res;

                arreglo = (str.split("<SPLITER>"));

                var resultado = arreglo[0];

                if ((resultado != "0") && (resultado != "-1")) {
                    Swal.fire({
                        position: 'center-center',
                        icon: 'success',
                        title: 'Registro de Usuarios',
                        text: arreglo[1],
                        showConfirmButton: false,
                        timer: 4500,
                        timerProgressBar: true
                    });

                    setTimeout(function () {
                        location.href = "frmInicioSesion.aspx";
                    }, 4500);
                }
                else {
                    Swal.fire({
                        position: 'center-center',
                        icon: 'error',
                        title: 'Registro de Usuarios',
                        text: arreglo[1],
                        showConfirmButton: false,
                        timer: 4500,
                        timerProgressBar: true
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