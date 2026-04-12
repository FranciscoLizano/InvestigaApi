using BLL_WEB_ALQUISOFT.WEB;
using DAL_WEB_ALQUISOFT.WEB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB_Alquisoft
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string EnvioCorreos(List<string> obj_Parametros_JS)
        {
            try
            {
                string _mensaje = string.Empty;

                /*Objetos de la entidad con la que estamos trabajando*/
                cls_WEB_DAL obj_WEB_DAL = new cls_WEB_DAL();
                cls_WEB_BLL obj_WEB_BLL = new cls_WEB_BLL();


                /*Descomponer el objeto de parametros de JS y lo asignamos a los atributos de nuestra entidad*/
                obj_WEB_DAL.sNombre = obj_Parametros_JS[0].ToString();
                obj_WEB_DAL.sTelefono = obj_Parametros_JS[1].ToString();
                obj_WEB_DAL.sCorreo = obj_Parametros_JS[2].ToString();
                obj_WEB_DAL.sAsunto = obj_Parametros_JS[3].ToString();
                obj_WEB_DAL.sMensaje = obj_Parametros_JS[4].ToString();
                /*Ejecutar la lógica de negocio correspondiente*/
                obj_WEB_BLL.EnvioCorreoContacto(ref obj_WEB_DAL);

                /*Recuperamos los valores y los evaluamos (VALORES SCALARES / TABLAS DE DATOS)*/
                if (obj_WEB_DAL.sValorScalar == "0")
                {
                    _mensaje = "0" + "<SPLITER>" + "No se pudo enviar la notificación por correo electrónico";
                }
                else
                {
                    _mensaje = "1" + "<SPLITER>" + "Gracias por contactarnos, será atendido por nuestro equipo en la brevedad de lo posible.";
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