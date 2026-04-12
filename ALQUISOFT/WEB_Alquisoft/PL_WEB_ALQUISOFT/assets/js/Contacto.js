//COOKIES: Almacenamiento de información en el navegador
//WEB METHODS: Consumir / Invocar los web methods que están en el code behind del formulario

var g_Dominio = "localhost"; //Dominio de las cookies
var TLC = 60 // Tiempo de vida que van a tener las cookies

//Función para iniciar sesión en el sistema
function EnvioCorreos() {
    //Definimos el arreglo que contiene los valores del objeto de parametros de js que vamos a enviar al code behind
    var obj_Parametros_JS = new Array();

    //Capturar los valores del formulario
    obj_Parametros_JS[0] = $("#w3lName").val();
    obj_Parametros_JS[1] = $("#w3lPhone").val();
    obj_Parametros_JS[2] = $("#w3lSender").val();
    obj_Parametros_JS[3] = $("#w3lAsunto").val();
    obj_Parametros_JS[4] = $("#w3lMessage").val();
    //Crear la estructura de parámetros en formato JSON
    var parametros = JSON.stringify({ 'obj_Parametros_JS': obj_Parametros_JS })

    //A través de métodos AJAX de JQUERY vamos a consumir el web method del code behinf
    //Indicamos el nombre del web mehotd y el formulario en donde está ese web method
    jQuery.ajax({
        type: "POST",
        url: "contact.aspx/EnvioCorreos",
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

                if (resultado != "0"){                   
                    Swal.fire({
                        position: 'center-center',
                        icon: 'success',
                        title: 'Solicitud de contacto',
                        text: arreglo[1],
                        showConfirmButton: false,
                        timer: 4500,
                        timerProgressBar: true
                    });

                    setTimeout(function () {
                        location.href = "../contact.aspx";
                    }, 4500);
                }
                else {
                    Swal.fire({
                        position: 'center-center',
                        icon: 'error',
                        title: 'Solicitud de contacto',
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