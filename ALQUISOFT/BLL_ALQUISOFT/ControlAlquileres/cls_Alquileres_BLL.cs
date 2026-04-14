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
    public class cls_Alquileres_BLL
    {
        #region Lógica de negocio para cargar la información de los alquileres

        /// <summary>
        /// Consulta y carga la lista de alquileres según los filtros especificados,
        /// como usuario, apartamento y estado, ejecutando el procedimiento almacenado correspondiente.
        /// El resultado se almacena en el DataTable del objeto de alquileres.
        /// </summary>
        /// <param name="obj_Alquileres_DAL"></param>
        public void cargaListarAlquileres(ref cls_Alquileres_DAL obj_Alquileres_DAL)
        {
            try
            {
                /*Objetos de comunicación al ámbito de base de datos (siempre va a ser necesario)*/
                cls_BD_DAL obj_BD_DAL = new cls_BD_DAL();
                cls_BD_BLL obj_BD_BLL = new cls_BD_BLL();

                /*Dar forma al atributo de DataTable de parámetros del objeto con el que estamos trabajando*/
                obj_Alquileres_DAL.dtParametros = null;
                obj_Alquileres_DAL.dtParametros = obj_BD_BLL.ObtieneDTParametros(obj_Alquileres_DAL.dtParametros);

                /*Agregar los parámetros que requiere el procedimiento almacenado*/
                /*Regla: Orden los valores de los parametros ==> Nombre del parámetro, Código de tipo de parámetro, Valor (atributo del objeto)*/
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdUsuario", "1", obj_Alquileres_DAL.iId_Usuario);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Apartamento", "6", obj_Alquileres_DAL.sApartamento);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Estado", "1", obj_Alquileres_DAL.iId_Estado);

                /*Definir el nombre del KEY que contiene el nombre del procedimiento almacenado de la base de datos*/
                obj_BD_DAL.sNomSP = ConfigurationManager.AppSettings["SP_LST_Alquileres"];
                /*Le asignamos al DT Parametros del objeto de BD la misma estructura del DT Parametros de la entidad con la que estamos trabajando*/
                obj_BD_DAL.DT_Parametros = obj_Alquileres_DAL.dtParametros;
                /*Definimos un nombre lógico a la tabla de respuesta*/
                obj_BD_DAL.sNomTabla = "ListaAlquileres";

                /*Ejecutar en base de datos la sentencia o la instruccion de SQL*/
                obj_BD_BLL.EjecutaProcesosTabla(ref obj_BD_DAL);

                /*Validar los resultados o la respuesta de bd*/
                /*Si el mensaje de error de base de datos es vacío..... entonces eso significa que todo salió de forma correcta y podemos recuperar los valores*/
                if (obj_BD_DAL.sMsjErrorBD == string.Empty)
                {
                    obj_Alquileres_DAL.dtDatos = obj_BD_DAL.DS.Tables[0];
                }
                else
                {
                    obj_Alquileres_DAL.dtDatos = null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region Lógica de negocio para el CRUD de los alquileres

        /// <summary>
        /// Consulta y obtiene la información detallada de un alquiler específico
        /// según su identificador, ejecutando el procedimiento almacenado correspondiente.
        /// El resultado se almacena en el DataTable del objeto de alquileres.
        /// </summary>
        /// <param name="obj_Alquileres_DAL"></param>
        public void ObtieneInformacioAlquileres(ref cls_Alquileres_DAL obj_Alquileres_DAL)
        {
            try
            {
                /*Objetos de comunicación al ámbito de base de datos (siempre va a ser necesario)*/
                cls_BD_DAL obj_BD_DAL = new cls_BD_DAL();
                cls_BD_BLL obj_BD_BLL = new cls_BD_BLL();

                /*Dar forma al atributo de DataTable de parámetros del objeto con el que estamos trabajando*/
                obj_Alquileres_DAL.dtParametros = null;
                obj_Alquileres_DAL.dtParametros = obj_BD_BLL.ObtieneDTParametros(obj_Alquileres_DAL.dtParametros);

                /*Agregar los parámetros que requiere el procedimiento almacenado*/
                /*Regla: Orden los valores de los parametros ==> Nombre del parámetro, Código de tipo de parámetro, Valor (atributo del objeto)*/
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdAlquiler", "1", obj_Alquileres_DAL.iId_Alquiler);

                /*Definir el nombre del KEY que contiene el nombre del procedimiento almacenado de la base de datos*/
                obj_BD_DAL.sNomSP = ConfigurationManager.AppSettings["SP_INFO_Alquileres"];
                /*Le asignamos al DT Parametros del objeto de BD la misma estructura del DT Parametros de la entidad con la que estamos trabajando*/
                obj_BD_DAL.DT_Parametros = obj_Alquileres_DAL.dtParametros;
                /*Definimos un nombre lógico a la tabla de respuesta*/
                obj_BD_DAL.sNomTabla = "InfoAlquileres";

                /*Ejecutar en base de datos la sentencia o la instruccion de SQL*/
                obj_BD_BLL.EjecutaProcesosTabla(ref obj_BD_DAL);

                /*Validar los resultados o la respuesta de bd*/
                /*Si el mensaje de error de base de datos es vacío..... entonces eso significa que todo salió de forma correcta y podemos recuperar los valores*/
                if (obj_BD_DAL.sMsjErrorBD == string.Empty)
                {
                    obj_Alquileres_DAL.dtDatos = obj_BD_DAL.DS.Tables[0];
                }
                else
                {
                    obj_Alquileres_DAL.dtDatos = null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        ///  Inserta un nuevo registro de alquiler en la base de datos.
        /// </summary>
        /// <param name="obj_Alquileres_DAL"></param>
        public void CrearAlquileres(ref cls_Alquileres_DAL obj_Alquileres_DAL)
        {
            try
            {
                /*Objetos de comunicación al ámbito de base de datos (siempre va a ser necesario)*/
                cls_BD_DAL obj_BD_DAL = new cls_BD_DAL();
                cls_BD_BLL obj_BD_BLL = new cls_BD_BLL();

                /*Dar forma al atributo de DataTable de parámetros del objeto con el que estamos trabajando*/
                obj_Alquileres_DAL.dtParametros = null;
                obj_Alquileres_DAL.dtParametros = obj_BD_BLL.ObtieneDTParametros(obj_Alquileres_DAL.dtParametros);

                /*Agregar los parámetros que requiere el procedimiento almacenado*/
                /*Regla: Orden los valores de los parametros ==> Nombre del parámetro, Código de tipo de parámetro, Valor (atributo del objeto)*/
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Apartamento", "6", obj_Alquileres_DAL.sApartamento);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Nombre_Inquilino", "6", obj_Alquileres_DAL.sNombre_Inquilino);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Correo", "6", obj_Alquileres_DAL.sCorreo);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Telefono", "6", obj_Alquileres_DAL.sTelefono);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Fecha_Inicio", "8", obj_Alquileres_DAL.dFecha_Inicio);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Fecha_Fin", "8", obj_Alquileres_DAL.dFecha_Fin);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Mensualidad", "2", obj_Alquileres_DAL.dMensualidad);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdCategoria", "1", obj_Alquileres_DAL.iId_Categoria);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdUsuario", "1", obj_Alquileres_DAL.iId_Usuario);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdEstado", "1", obj_Alquileres_DAL.iId_Estado);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdCondPago", "1", obj_Alquileres_DAL.iId_CondPagoad);

                /*Definir el nombre del KEY que contiene el nombre del procedimiento almacenado de la base de datos*/
                obj_BD_DAL.sNomSP = ConfigurationManager.AppSettings["SP_Insertar_Alquileres"];
                /*Definimos el tipo de acción que vamos a ejecutar (SCALAR / NORMAL)*/
                obj_BD_DAL.sIndAxn = "SCALAR";
                /*Le asignamos al DT Parametros del objeto de BD la misma estructura del DT Parametros de la entidad con la que estamos trabajando*/
                obj_BD_DAL.DT_Parametros = obj_Alquileres_DAL.dtParametros;

                /*Ejecutar en base de datos la sentencia o la instruccion de SQL*/
                obj_BD_BLL.EjecutaProcesosComando(ref obj_BD_DAL);

                /*Validar los resultados o la respuesta de bd*/
                /*Si el mensaje de error de base de datos es vacío..... entonces eso significa que todo salió de forma correcta y podemos recuperar los valores*/
                if (obj_BD_DAL.sMsjErrorBD == string.Empty)
                {
                    obj_Alquileres_DAL.sMSJError = obj_BD_DAL.sMsjErrorBD;
                    obj_Alquileres_DAL.sValorScalar = obj_BD_DAL.sValorScalar;
                }
                else
                {
                    obj_Alquileres_DAL.sMSJError = obj_BD_DAL.sMsjErrorBD;
                    obj_Alquileres_DAL.sValorScalar = null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Modifica un registro de alquiler existente en la base de datos.
        /// </summary>
        /// <param name="obj_Alquileres_DAL"></param>
        public void ModificarAlquileres(ref cls_Alquileres_DAL obj_Alquileres_DAL)
        {
            try
            {
                /*Objetos de comunicación al ámbito de base de datos (siempre va a ser necesario)*/
                cls_BD_DAL obj_BD_DAL = new cls_BD_DAL();
                cls_BD_BLL obj_BD_BLL = new cls_BD_BLL();

                /*Dar forma al atributo de DataTable de parámetros del objeto con el que estamos trabajando*/
                obj_Alquileres_DAL.dtParametros = null;
                obj_Alquileres_DAL.dtParametros = obj_BD_BLL.ObtieneDTParametros(obj_Alquileres_DAL.dtParametros);

                /*Agregar los parámetros que requiere el procedimiento almacenado*/
                /*Regla: Orden los valores de los parametros ==> Nombre del parámetro, Código de tipo de parámetro, Valor (atributo del objeto)*/
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdAlquiler", "1", obj_Alquileres_DAL.iId_Alquiler);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Apartamento", "6", obj_Alquileres_DAL.sApartamento);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Nombre_Inquilino", "6", obj_Alquileres_DAL.sNombre_Inquilino);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Correo", "6", obj_Alquileres_DAL.sCorreo);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Telefono", "6", obj_Alquileres_DAL.sTelefono);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Fecha_Inicio", "8", obj_Alquileres_DAL.dFecha_Inicio);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Fecha_Fin", "8", obj_Alquileres_DAL.dFecha_Fin);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Mensualidad", "2", obj_Alquileres_DAL.dMensualidad);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdCategoria", "1", obj_Alquileres_DAL.iId_Categoria);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdUsuario", "1", obj_Alquileres_DAL.iId_Usuario);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdEstado", "1", obj_Alquileres_DAL.iId_Estado);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdCondPago", "1", obj_Alquileres_DAL.iId_CondPagoad);

                /*Definir el nombre del KEY que contiene el nombre del procedimiento almacenado de la base de datos*/
                obj_BD_DAL.sNomSP = ConfigurationManager.AppSettings["SP_Actualiza_Alquileres"];
                /*Definimos el tipo de acción que vamos a ejecutar (SCALAR / NORMAL)*/
                obj_BD_DAL.sIndAxn = "SCALAR";
                /*Le asignamos al DT Parametros del objeto de BD la misma estructura del DT Parametros de la entidad con la que estamos trabajando*/
                obj_BD_DAL.DT_Parametros = obj_Alquileres_DAL.dtParametros;

                /*Ejecutar en base de datos la sentencia o la instruccion de SQL*/
                obj_BD_BLL.EjecutaProcesosComando(ref obj_BD_DAL);

                /*Validar los resultados o la respuesta de bd*/
                /*Si el mensaje de error de base de datos es vacío..... entonces eso significa que todo salió de forma correcta y podemos recuperar los valores*/
                if (obj_BD_DAL.sMsjErrorBD == string.Empty)
                {
                    obj_Alquileres_DAL.sMSJError = obj_BD_DAL.sMsjErrorBD;
                    obj_Alquileres_DAL.sValorScalar = obj_BD_DAL.sValorScalar;
                }
                else
                {
                    obj_Alquileres_DAL.sMSJError = obj_BD_DAL.sMsjErrorBD;
                    obj_Alquileres_DAL.sValorScalar = null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Elimina un registro de alquiler existente en la base de datos.
        /// </summary>
        /// <param name="obj_Alquileres_DAL"></param>
        public void EliminarAlquileres(ref cls_Alquileres_DAL obj_Alquileres_DAL)
        {
            try
            {
                /*Objetos de comunicación al ámbito de base de datos (siempre va a ser necesario)*/
                cls_BD_DAL obj_BD_DAL = new cls_BD_DAL();
                cls_BD_BLL obj_BD_BLL = new cls_BD_BLL();

                /*Dar forma al atributo de DataTable de parámetros del objeto con el que estamos trabajando*/
                obj_Alquileres_DAL.dtParametros = null;
                obj_Alquileres_DAL.dtParametros = obj_BD_BLL.ObtieneDTParametros(obj_Alquileres_DAL.dtParametros);

                /*Agregar los parámetros que requiere el procedimiento almacenado*/
                /*Regla: Orden los valores de los parametros ==> Nombre del parámetro, Código de tipo de parámetro, Valor (atributo del objeto)*/
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdAlquiler", "1", obj_Alquileres_DAL.iId_Alquiler);
                obj_Alquileres_DAL.dtParametros.Rows.Add("@IdUsuario", "1", obj_Alquileres_DAL.iId_Usuario);

                /*Definir el nombre del KEY que contiene el nombre del procedimiento almacenado de la base de datos*/
                obj_BD_DAL.sNomSP = ConfigurationManager.AppSettings["SP_Eliminar_Alquileres"];
                /*Definimos el tipo de acción que vamos a ejecutar (SCALAR / NORMAL)*/
                obj_BD_DAL.sIndAxn = "SCALAR";
                /*Le asignamos al DT Parametros del objeto de BD la misma estructura del DT Parametros de la entidad con la que estamos trabajando*/
                obj_BD_DAL.DT_Parametros = obj_Alquileres_DAL.dtParametros;

                /*Ejecutar en base de datos la sentencia o la instruccion de SQL*/
                obj_BD_BLL.EjecutaProcesosComando(ref obj_BD_DAL);

                /*Validar los resultados o la respuesta de bd*/
                /*Si el mensaje de error de base de datos es vacío..... entonces eso significa que todo salió de forma correcta y podemos recuperar los valores*/
                if (obj_BD_DAL.sMsjErrorBD == string.Empty)
                {
                    obj_Alquileres_DAL.sMSJError = obj_BD_DAL.sMsjErrorBD;
                    obj_Alquileres_DAL.sValorScalar = obj_BD_DAL.sValorScalar;
                }
                else
                {
                    obj_Alquileres_DAL.sMSJError = obj_BD_DAL.sMsjErrorBD;
                    obj_Alquileres_DAL.sValorScalar = null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region Lógica de negocio utilizada para consultar la información de los gráficos

        /// <summary>
        /// Consulta y carga el resumen general de los alquileres asociados
        /// a un usuario específico, ejecutando el procedimiento almacenado correspondiente.
        /// El resultado se almacena en el DataTable del objeto de alquileres.
        /// </summary>
        /// <param name="obj_Alquileres_DAL"></param>
        public void cargaResumenAlquileres(ref cls_Alquileres_DAL obj_Alquileres_DAL)
        {
            try
            {
                /*Objetos de comunicación al ámbito de base de datos (siempre va a ser necesario)*/
                cls_BD_DAL obj_BD_DAL = new cls_BD_DAL();
                cls_BD_BLL obj_BD_BLL = new cls_BD_BLL();

                /*Dar forma al atributo de DataTable de parámetros del objeto con el que estamos trabajando*/
                obj_Alquileres_DAL.dtParametros = null;
                obj_Alquileres_DAL.dtParametros = obj_BD_BLL.ObtieneDTParametros(obj_Alquileres_DAL.dtParametros);

                /*Agregar los parámetros que requiere el procedimiento almacenado*/
                /*Regla: Orden los valores de los parametros ==> Nombre del parámetro, Código de tipo de parámetro, Valor (atributo del objeto)*/
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Id_Usuario", "1", obj_Alquileres_DAL.iId_Usuario);

                /*Definir el nombre del KEY que contiene el nombre del procedimiento almacenado de la base de datos*/
                obj_BD_DAL.sNomSP = ConfigurationManager.AppSettings["SP_Resumen_Alquileres"];
                /*Le asignamos al DT Parametros del objeto de BD la misma estructura del DT Parametros de la entidad con la que estamos trabajando*/
                obj_BD_DAL.DT_Parametros = obj_Alquileres_DAL.dtParametros;
                /*Definimos un nombre lógico a la tabla de respuesta*/
                obj_BD_DAL.sNomTabla = "ResumenAlquileres";

                /*Ejecutar en base de datos la sentencia o la instruccion de SQL*/
                obj_BD_BLL.EjecutaProcesosTabla(ref obj_BD_DAL);

                /*Validar los resultados o la respuesta de bd*/
                /*Si el mensaje de error de base de datos es vacío..... entonces eso significa que todo salió de forma correcta y podemos recuperar los valores*/
                if (obj_BD_DAL.sMsjErrorBD == string.Empty)
                {
                    obj_Alquileres_DAL.dtDatos = obj_BD_DAL.DS.Tables[0];
                }
                else
                {
                    obj_Alquileres_DAL.dtDatos = null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Consulta y obtiene la cantidad de alquileres agrupados por estado
        /// para un usuario específico, ejecutando el procedimiento almacenado correspondiente.
        /// El resultado se almacena en el DataTable del objeto de alquileres.
        /// </summary>
        /// <param name="obj_Alquileres_DAL"></param>
        public void listarCantidadAlquileresXEstado(ref cls_Alquileres_DAL obj_Alquileres_DAL)
        {
            try
            {
                /*Objetos de comunicación al ámbito de base de datos (siempre va a ser necesario)*/
                cls_BD_DAL obj_BD_DAL = new cls_BD_DAL();
                cls_BD_BLL obj_BD_BLL = new cls_BD_BLL();

                /*Dar forma al atributo de DataTable de parámetros del objeto con el que estamos trabajando*/
                obj_Alquileres_DAL.dtParametros = null;
                obj_Alquileres_DAL.dtParametros = obj_BD_BLL.ObtieneDTParametros(obj_Alquileres_DAL.dtParametros);

                /*Agregar los parámetros que requiere el procedimiento almacenado*/
                /*Regla: Orden los valores de los parametros ==> Nombre del parámetro, Código de tipo de parámetro, Valor (atributo del objeto)*/
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Id_Usuario", "1", obj_Alquileres_DAL.iId_Usuario);

                /*Definir el nombre del KEY que contiene el nombre del procedimiento almacenado de la base de datos*/
                obj_BD_DAL.sNomSP = ConfigurationManager.AppSettings["SP_LST_Cantidad_AlquileresXEstado"];
                /*Le asignamos al DT Parametros del objeto de BD la misma estructura del DT Parametros de la entidad con la que estamos trabajando*/
                obj_BD_DAL.DT_Parametros = obj_Alquileres_DAL.dtParametros;
                /*Definimos un nombre lógico a la tabla de respuesta*/
                obj_BD_DAL.sNomTabla = "CantidadAlquileresXEstado";

                /*Ejecutar en base de datos la sentencia o la instruccion de SQL*/
                obj_BD_BLL.EjecutaProcesosTabla(ref obj_BD_DAL);

                /*Validar los resultados o la respuesta de bd*/
                /*Si el mensaje de error de base de datos es vacío..... entonces eso significa que todo salió de forma correcta y podemos recuperar los valores*/
                if (obj_BD_DAL.sMsjErrorBD == string.Empty)
                {
                    obj_Alquileres_DAL.dtDatos = obj_BD_DAL.DS.Tables[0];
                }
                else
                {
                    obj_Alquileres_DAL.dtDatos = null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Consulta y obtiene la cantidad de alquileres agrupados por condición de pago
        /// para un usuario específico, ejecutando el procedimiento almacenado correspondiente.
        /// El resultado se almacena en el DataTable del objeto de alquileres.
        /// </summary>
        /// <param name="obj_Alquileres_DAL"></param>
        public void listarCantidadAlquileresXCondicionPago(ref cls_Alquileres_DAL obj_Alquileres_DAL)
        {
            try
            {
                /*Objetos de comunicación al ámbito de base de datos (siempre va a ser necesario)*/
                cls_BD_DAL obj_BD_DAL = new cls_BD_DAL();
                cls_BD_BLL obj_BD_BLL = new cls_BD_BLL();

                /*Dar forma al atributo de DataTable de parámetros del objeto con el que estamos trabajando*/
                obj_Alquileres_DAL.dtParametros = null;
                obj_Alquileres_DAL.dtParametros = obj_BD_BLL.ObtieneDTParametros(obj_Alquileres_DAL.dtParametros);

                /*Agregar los parámetros que requiere el procedimiento almacenado*/
                /*Regla: Orden los valores de los parametros ==> Nombre del parámetro, Código de tipo de parámetro, Valor (atributo del objeto)*/
                obj_Alquileres_DAL.dtParametros.Rows.Add("@Id_Usuario", "1", obj_Alquileres_DAL.iId_Usuario);

                /*Definir el nombre del KEY que contiene el nombre del procedimiento almacenado de la base de datos*/
                obj_BD_DAL.sNomSP = ConfigurationManager.AppSettings["SP_LST_Cantidad_AlquileresXCondicionPago"];
                /*Le asignamos al DT Parametros del objeto de BD la misma estructura del DT Parametros de la entidad con la que estamos trabajando*/
                obj_BD_DAL.DT_Parametros = obj_Alquileres_DAL.dtParametros;
                /*Definimos un nombre lógico a la tabla de respuesta*/
                obj_BD_DAL.sNomTabla = "CantidadAlquileresXCondicionPago";

                /*Ejecutar en base de datos la sentencia o la instruccion de SQL*/
                obj_BD_BLL.EjecutaProcesosTabla(ref obj_BD_DAL);

                /*Validar los resultados o la respuesta de bd*/
                /*Si el mensaje de error de base de datos es vacío..... entonces eso significa que todo salió de forma correcta y podemos recuperar los valores*/
                if (obj_BD_DAL.sMsjErrorBD == string.Empty)
                {
                    obj_Alquileres_DAL.dtDatos = obj_BD_DAL.DS.Tables[0];
                }
                else
                {
                    obj_Alquileres_DAL.dtDatos = null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }
}
