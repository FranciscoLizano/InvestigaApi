using BLL_AlQUISOFT.ControlAlquileres;
using DAL_ALQUISOFT.ControlAlquileres;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL_ALQUISOFT.Login
{
    public partial class frmInicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string InicioSesionUsuarios(List<string> obj_Parametros_JS)
        {
            try
            {
                string _mensaje = string.Empty;

                /*Objetos de la entidad con la que estamos trabajando*/
                cls_Usuarios_DAL obj_Usuarios_DAL = new cls_Usuarios_DAL();
                cls_Usuarios_BLL obj_Usuarios_BLL = new cls_Usuarios_BLL();


                /*Descomponer el objeto de parametros de JS y lo asignamos a los atributos de nuestra entidad*/
                obj_Usuarios_DAL.sCorreo = obj_Parametros_JS[0].ToString();
                obj_Usuarios_DAL.sPassword = obj_Parametros_JS[1].ToString();

                /*Ejecutar la lógica de negocio correspondiente*/
                obj_Usuarios_BLL.Inicio_Sesion_Usuarios(ref obj_Usuarios_DAL);

                /*Recuperamos los valores y los evaluamos (VALORES SCALARES / TABLAS DE DATOS)*/
                if (obj_Usuarios_DAL.sValorScalar == "-1")
                {
                    _mensaje = "-1" + "<SPLITER>" + "El usuario se encuentra inactivo. Por favor contacte al administrador del sistema.";
                }
                else if (obj_Usuarios_DAL.sValorScalar == "0")
                {
                    _mensaje = "0" + "<SPLITER>" + "Las credenciales no son válidas. Verifique!!!";
                }
                else
                {
                    obj_Usuarios_DAL.iId_Usuario = Convert.ToInt32(obj_Usuarios_DAL.sValorScalar);

                    obj_Usuarios_BLL.Obtiene_Informacion_Usuario(ref obj_Usuarios_DAL);

                    _mensaje = obj_Usuarios_DAL.dtDatos.Rows[0][0].ToString() + "<SPLITER>" +
                               "Bienvenido de nuevo " + obj_Usuarios_DAL.dtDatos.Rows[0][1].ToString() + "<SPLITER>" +
                               obj_Usuarios_DAL.dtDatos.Rows[0][3].ToString() + "<SPLITER>" +
                               obj_Usuarios_DAL.dtDatos.Rows[0][1].ToString();
                }

                return _mensaje;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        [WebMethod]
        public static string RegistroUsuarios(List<string> obj_Parametros_JS)
        {
            try
            {
                string _mensaje = string.Empty;

                /*Objetos de la entidad con la que estamos trabajando*/
                cls_Usuarios_DAL obj_Usuarios_DAL = new cls_Usuarios_DAL();
                cls_Usuarios_BLL obj_Usuarios_BLL = new cls_Usuarios_BLL();

                /*Descomponer el objeto de parametros de JS y lo asignamos a los atributos de nuestra entidad*/
                obj_Usuarios_DAL.sNombre = obj_Parametros_JS[0].ToString();
                obj_Usuarios_DAL.sCorreo = obj_Parametros_JS[1].ToString();
                obj_Usuarios_DAL.sPassword = obj_Parametros_JS[2].ToString();
                obj_Usuarios_DAL.sActividad = obj_Parametros_JS[3].ToString();
                obj_Usuarios_DAL.sEstado = "A";

                /*Ejecutar la lógica de negocio correspondiente*/
                obj_Usuarios_BLL.Registrar_Usuarios(ref obj_Usuarios_DAL);

                /*Recuperamos los valores y los evaluamos (VALORES SCALARES / TABLAS DE DATOS)*/
                if (obj_Usuarios_DAL.sValorScalar == "-1")
                {
                    _mensaje = "-1" + "<SPLITER>" + "Ya existe un usuario registrado con el mismo correo electrónico.";
                }
                else if (obj_Usuarios_DAL.sValorScalar == "0")
                {
                    _mensaje = "0" + "<SPLITER>" + "Ocurrió un error al intentar registrar la información del usuario. Contacte al administrador del sistema.";
                }
                else
                {
                    _mensaje = obj_Usuarios_DAL.sValorScalar + "<SPLITER>" + "El usuario ha sido registrado en el sistema.";
                }

                return _mensaje;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        [WebMethod]
        public static string CierraSesionUsuarios(List<string> obj_Parametros_JS)
        {
            try
            {
                string _mensaje = string.Empty;

                /*Objetos de la entidad con la que estamos trabajando*/
                cls_Usuarios_DAL obj_Usuarios_DAL = new cls_Usuarios_DAL();
                cls_Usuarios_BLL obj_Usuarios_BLL = new cls_Usuarios_BLL();

                /*Descomponemos o extraemos los valores del objeto que nos envía el JS y 
                 * lo asignamos a los atributos del objeto con el que estamos trabajando*/
                obj_Usuarios_DAL.iId_Usuario = Convert.ToInt32(obj_Parametros_JS[0].ToString());


                /*Ejecutamos en lógica de negocio el proceso o la acción necesaria*/
                obj_Usuarios_BLL.Cerrar_Sesion_Usuarios(ref obj_Usuarios_DAL);

                /*Recuperamos los valores y los evaluamos (Valores SCALAR y / o valores de respuesta de BD */
                if (obj_Usuarios_DAL.sValorScalar != "0")
                {
                    _mensaje = obj_Usuarios_DAL.sValorScalar;
                }

                return _mensaje;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}