using DAL_ConsumoAPI;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Services.Description;
using System.Xml.Linq;

namespace PL_ConsumoAPI
{
    public partial class CambioDolar : System.Web.UI.Page
    {

        protected async void btnConsultar_Click(object sender, EventArgs e)
        {
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    cls_CambioDolar servicio = new cls_CambioDolar();

                    string json = await servicio.ObtenerTipoCambioAsync();

                    JObject datos = JObject.Parse(json);

                    string venta = datos["venta"]["valor"].ToString();
                    string compra = datos["compra"]["valor"].ToString();

                    lblResultado.Text = "Compra: ₡" + compra +
                                        " | Venta: ₡" + venta;
                    lblResultado.Visible = true;

                }
                catch (Exception ex)
                {
                    lblResultado.Text = "Error: " + ex.Message;
                    lblResultado.Visible = true;
                }
            }
        }
        protected async void btnHistorico_Click(object sender, EventArgs e)
        {
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    cls_CambioDolar servicio = new cls_CambioDolar();
                    string json = await servicio.ObtenerHistoricoCambioAsynx();

                    JArray historico = JArray.Parse(json);

                    string resultado = "<table class='tabla-historico'>"; resultado += "<tr>";
                    resultado += "<td>Fecha</td>";
                    resultado += "<td>Compra</td>";
                    resultado += "<td>Venta</td>";
                    resultado += "</tr>";

                    foreach (var item in historico)
                    {
                        DateTime fecha = DateTime.Parse(item["fecha"].ToString());
                        resultado += "<tr>";
                        resultado += "<td>" + fecha.ToString("dd/MM/yyyy") + "</td>";
                        resultado += "<td>₡" + item["compra"] + "</td>";
                        resultado += "<td>₡" + item["venta"] + "</td>";
                        resultado += "</tr>";
                    }

                    resultado += "</table>";

                    divTablaHistorico.InnerHtml = resultado; 
                }
                catch (Exception ex)
                {
                    divTablaHistorico.InnerText = "Error: " + ex.Message;
                }
            }
        }
    }
}