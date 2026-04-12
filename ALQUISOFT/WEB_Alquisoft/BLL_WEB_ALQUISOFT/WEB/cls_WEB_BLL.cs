using BLL_WEB_ALQUISOFT.BD;
using DAL_WEB_ALQUISOFT.BD;
using DAL_WEB_ALQUISOFT.WEB;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_WEB_ALQUISOFT.WEB
{
    public class cls_WEB_BLL
    {
        public void EnvioCorreoContacto(ref cls_WEB_DAL obj_WEB_DAL)
        {
            try
            {
                /*Objetos de comunicación al ámbito de base de datos (siempre va a ser necesario)*/
                cls_BD_DAL obj_BD_DAL = new cls_BD_DAL();
                cls_BD_BLL obj_BD_BLL = new cls_BD_BLL();

                /*Dar forma al atributo de DataTable de parámetros del objeto con el que estamos trabajando*/
                obj_WEB_DAL.dtParametros = null;
                obj_WEB_DAL.dtParametros = obj_BD_BLL.ObtieneDTParametros(obj_WEB_DAL.dtParametros);


                /*Agregar los parámetros que requiere el procedimiento almacenado*/
                /*Regla: Orden los valores de los parametros ==> Nombre del parámetro, Código de tipo de parámetro, Valor (atributo del objeto)*/
                obj_WEB_DAL.dtParametros.Rows.Add("@NOMBRE", "6", obj_WEB_DAL.sNombre);
                obj_WEB_DAL.dtParametros.Rows.Add("@EMAIL", "6", obj_WEB_DAL.sCorreo);
                obj_WEB_DAL.dtParametros.Rows.Add("@ASUNTO", "6", obj_WEB_DAL.sAsunto);
                obj_WEB_DAL.dtParametros.Rows.Add("@MENSAJE", "6", obj_WEB_DAL.sMensaje);
                obj_WEB_DAL.dtParametros.Rows.Add("@TELEFONO", "6", obj_WEB_DAL.sTelefono);

                /*Definir el nombre del KEY que contiene el nombre del procedimiento almacenado de la base de datos*/
                obj_BD_DAL.sNomSP = ConfigurationManager.AppSettings["SP_EnvioCorreos_WEB"];
                /*Definimos el tipo de acción que vamos a ejecutar (SCALAR / NORMAL)*/
                obj_BD_DAL.sIndAxn = "SCALAR";
                /*Le asignamos al DT Parametros del objeto de BD la misma estructura del DT Parametros de la entidad con la que estamos trabajando*/
                obj_BD_DAL.DT_Parametros = obj_WEB_DAL.dtParametros;

                /*Ejecutar en base de datos la sentencia o la instruccion de SQL*/
                obj_BD_BLL.EjecutaProcesosComando(ref obj_BD_DAL);

                /*Validar los resultados o la respuesta de bd*/
                /*Si el mensaje de error de base de datos es vacío..... entonces eso significa que todo salió de forma correcta y podemos recuperar los valores*/
                if (obj_BD_DAL.sMsjErrorBD == string.Empty)
                {
                    obj_WEB_DAL.sMSJError = obj_BD_DAL.sMsjErrorBD;
                    obj_WEB_DAL.sValorScalar = obj_BD_DAL.sValorScalar;
                }
                else
                {
                    obj_WEB_DAL.sMSJError = obj_BD_DAL.sMsjErrorBD;
                    obj_WEB_DAL.sValorScalar = null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
