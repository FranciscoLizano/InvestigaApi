using BLL_AlQUISOFT.BD;
using DAL_ALQUISOFT.BD;
using DAL_ALQUISOFT.ControlAlquileres;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_ALQUISOFT.ControlAlquileres
{
    public class cls_Estado_Alquileres_BLL
    {
        /// <summary>
        /// Consulta y obtiene la lista de estados de alquileres
        /// desde la base de datos, ejecutando el procedimiento almacenado correspondiente.
        /// El resultado se almacena en el DataTable del objeto de Estado_Alquileres.
        /// </summary>
        /// <param name="obj_Estado_Alquileres_DAL"></param>
        public void listarEstadosAlquileres(ref cls_Estado_Alquileres_DAL obj_Estado_Alquileres_DAL)
        {
            try
            {
                /*Objetos de comunicación al ámbito de base de datos (siempre va a ser necesario)*/
                cls_BD_DAL obj_BD_DAL = new cls_BD_DAL();
                cls_BD_BLL obj_BD_BLL = new cls_BD_BLL();

                /*Dar forma al atributo de DataTable de parámetros del objeto con el que estamos trabajando*/
                obj_Estado_Alquileres_DAL.dtParametros = null;

                /*Definir el nombre del KEY que contiene el nombre del procedimiento almacenado de la base de datos*/
                obj_BD_DAL.sNomSP = ConfigurationManager.AppSettings["SP_LST_Estado_Alquileres"];
                /*Le asignamos al DT Parametros del objeto de BD la misma estructura del DT Parametros de la entidad con la que estamos trabajando*/
                obj_BD_DAL.DT_Parametros = obj_Estado_Alquileres_DAL.dtParametros;
                /*Definimos un nombre lógico a la tabla de respuesta*/
                obj_BD_DAL.sNomTabla = "Estado_Alquileres";

                /*Ejecutar en base de datos la sentencia o la instruccion de SQL*/
                obj_BD_BLL.EjecutaProcesosTabla(ref obj_BD_DAL);

                /*Validar los resultados o la respuesta de bd*/
                /*Si el mensaje de error de base de datos es vacío..... entonces eso significa que todo salió de forma correcta y podemos recuperar los valores*/
                if (obj_BD_DAL.sMsjErrorBD == string.Empty)
                {
                    obj_Estado_Alquileres_DAL.dtDatos = obj_BD_DAL.DS.Tables[0];
                }
                else
                {
                    obj_Estado_Alquileres_DAL.dtDatos = null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
