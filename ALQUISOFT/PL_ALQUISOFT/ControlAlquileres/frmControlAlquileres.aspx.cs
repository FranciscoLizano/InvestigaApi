using BLL_ALQUISOFT.ControlAlquileres;
using DAL_ALQUISOFT.ControlAlquileres;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL_ALQUISOFT.ControlAlquileres
{
    public partial class frmControlAlquileres : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string CargaListaCategoriasCombo(List<string> obj_Parametros_JS)
        {
            try
            {
                string _mensaje = string.Empty;

                /*Objetos de la entidad con la que estamos trabajando*/
                cls_Categoria_Apartamento_DAL obj_Categoria_Apartamento_DAL = new cls_Categoria_Apartamento_DAL();
                cls_Categoria_Apartamento_BLL obj_Categoria_Apartamento_BLL = new cls_Categoria_Apartamento_BLL();

                /*Ejecutar la lógica de negocio correspondiente*/
                obj_Categoria_Apartamento_BLL.listarCategoriasApartamento(ref obj_Categoria_Apartamento_DAL);

                /*Recuperamos los valores y los evaluamos (VALORES SCALARES / TABLAS DE DATOS)*/
                if (obj_Categoria_Apartamento_DAL.dtDatos.Rows.Count != 0)
                {
                    /*<option value="el valor del value">la descripción del campo</option>  */
                    for (int i = 0; i < obj_Categoria_Apartamento_DAL.dtDatos.Rows.Count; i++)
                    {
                        _mensaje += "<option value='" + obj_Categoria_Apartamento_DAL.dtDatos.Rows[i][0] + "'>" +
                                obj_Categoria_Apartamento_DAL.dtDatos.Rows[i][1] + "</option>";
                    }
                }
                else
                {
                    _mensaje = "No se encontraron registros";
                }

                return _mensaje;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public static string CargaListaEstadosCombo(List<string> obj_Parametros_JS)
        {
            try
            {
                string _mensaje = string.Empty;

                /*Objetos de la entidad con la que estamos trabajando*/
                cls_Estado_Alquileres_DAL obj_Estado_Alquileres_DAL = new cls_Estado_Alquileres_DAL();
                cls_Estado_Alquileres_BLL obj_Estado_Alquileres_BLL = new cls_Estado_Alquileres_BLL();

                /*Ejecutar la lógica de negocio correspondiente*/
                obj_Estado_Alquileres_BLL.listarEstadosAlquileres(ref obj_Estado_Alquileres_DAL);

                /*Recuperamos los valores y los evaluamos (VALORES SCALARES / TABLAS DE DATOS)*/
                if (obj_Estado_Alquileres_DAL.dtDatos.Rows.Count != 0)
                {
                    /*<option value="el valor del value">la descripción del campo</option>  */
                    for (int i = 0; i < obj_Estado_Alquileres_DAL.dtDatos.Rows.Count; i++)
                    {
                        _mensaje += "<option value='" + obj_Estado_Alquileres_DAL.dtDatos.Rows[i][0] + "'>" +
                                obj_Estado_Alquileres_DAL.dtDatos.Rows[i][1] + "</option>";
                    }
                }
                else
                {
                    _mensaje = "No se encontraron registros";
                }

                return _mensaje;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static string CargaListaCondicionCombo(List<string> obj_Parametros_JS)
        {
            try
            {
                string _mensaje = string.Empty;

                /*Objetos de la entidad con la que estamos trabajando*/
                cls_Condicion_Pago_DAL obj_Condicion_Pago_DAL = new cls_Condicion_Pago_DAL();
                cls_Condicion_Pago_BLL obj_Condicion_Pago_BLL = new cls_Condicion_Pago_BLL();

                /*Ejecutar la lógica de negocio correspondiente*/
                obj_Condicion_Pago_BLL.listarCondicionPago(ref obj_Condicion_Pago_DAL);

                /*Recuperamos los valores y los evaluamos (VALORES SCALARES / TABLAS DE DATOS)*/
                if (obj_Condicion_Pago_DAL.dtDatos.Rows.Count != 0)
                {
                    /*<option value="el valor del value">la descripción del campo</option>  */
                    for (int i = 0; i < obj_Condicion_Pago_DAL.dtDatos.Rows.Count; i++)
                    {
                        _mensaje += "<option value='" + obj_Condicion_Pago_DAL.dtDatos.Rows[i][0] + "'>" +
                                obj_Condicion_Pago_DAL.dtDatos.Rows[i][1] + "</option>";
                    }
                }
                else
                {
                    _mensaje = "No se encontraron registros";
                }

                return _mensaje;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static string CargaListaAlquileres(List<string> obj_Parametros_JS)
        {
            try
            {
                string _mensaje = string.Empty;

                /*Objetos de la entidad con la que estamos trabajando*/
                cls_Alquileres_DAL obj_Alquileres_DAL = new cls_Alquileres_DAL();
                cls_Alquileres_BLL obj_Alquileres_BLL = new cls_Alquileres_BLL();

                obj_Alquileres_DAL.iId_Usuario = Convert.ToInt32(obj_Parametros_JS[0].ToString());
                obj_Alquileres_DAL.sApartamento = obj_Parametros_JS[1].ToString();
                obj_Alquileres_DAL.iId_Estado = Convert.ToInt32(obj_Parametros_JS[2].ToString());

                /*Ejecutar la lógica de negocio correspondiente*/
                obj_Alquileres_BLL.cargaListarAlquileres(ref obj_Alquileres_DAL);

                /*Recuperamos los valores y los evaluamos (VALORES SCALARES / TABLAS DE DATOS)*/
                if (obj_Alquileres_DAL.dtDatos.Rows.Count != 0)
                {
                    /*Encabezado de la tabla*/
                    _mensaje += "" +
                            "<thead>" +
                                "<tr>" +
                                    "<th>Id Alquiler</th>" +
                                    "<th>Apartamento</th>" +
                                    "<th>Nombre del Inquilino</th>" +
                                    "<th>Correo</th>" +
                                    "<th>Telefono</th>" +
                                    "<th>Fecha Inicio Contrato</th>" +
                                    "<th>Fecha Fin Contrato</th>" +
                                    "<th>Mensualidad</th>" +
                                    "<th>Categoría</th>" +
                                    "<th>Condición Pago</th>" +
                                    "<th>Estado</th>" +
                                    "<th style='text-align:center'>Eliminar</th>" +
                                "</tr>" +
                            "</thead>" +
                            "<tbody>";


                    for (int i = 0; i < obj_Alquileres_DAL.dtDatos.Rows.Count; i++)
                    {
                        _mensaje += "<tr>" +
                                        "<td style='cursor: pointer' onclick='javascript: defineAlquiler(" + obj_Alquileres_DAL.dtDatos.Rows[i][0].ToString() + ")'>" +
                                            obj_Alquileres_DAL.dtDatos.Rows[i][0].ToString() + "</td>" +
                                        "<td>" + obj_Alquileres_DAL.dtDatos.Rows[i][1].ToString() + "</td>" +
                                        "<td>" + obj_Alquileres_DAL.dtDatos.Rows[i][2].ToString() + "</td>" +
                                        "<td>" + obj_Alquileres_DAL.dtDatos.Rows[i][3].ToString() + "</td>" +
                                        "<td>" + obj_Alquileres_DAL.dtDatos.Rows[i][4].ToString() + "</td>" +
                                        "<td>" + Convert.ToDateTime(obj_Alquileres_DAL.dtDatos.Rows[i][5].ToString()).ToShortDateString() + "</td>" +
                                        "<td>" + Convert.ToDateTime(obj_Alquileres_DAL.dtDatos.Rows[i][6].ToString()).ToShortDateString() + "</td>" +
                                        "<td>" + Convert.ToDouble(obj_Alquileres_DAL.dtDatos.Rows[i][7].ToString()).ToString("C") + "</td>" +
                                        "<td>" + obj_Alquileres_DAL.dtDatos.Rows[i][8].ToString() + "</td>" +
                                        "<td>" + obj_Alquileres_DAL.dtDatos.Rows[i][9].ToString() + "</td>" +
                                        "<td>" + obj_Alquileres_DAL.dtDatos.Rows[i][10].ToString() + "</td>" +
                                        "<td style='text-align: center'><i class='fa fa-trash-o' onclick='javascript: eliminaAlquiler(" + obj_Alquileres_DAL.dtDatos.Rows[i][0].ToString() +
                                            ")' style='cursor:pointer'></i></td>" +
                                    "</tr>";
                    }

                    _mensaje += "</tbody>";
                }
                else
                {
                    _mensaje = "No se encontraron registros";
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