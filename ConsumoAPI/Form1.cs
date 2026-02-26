using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ConsumoAPI
    // Prueba
{
    public partial class Form1 : Form
    {
        private readonly string baseUrl = "https://localhost:44306/api/productos";
        public Form1()
        {
            InitializeComponent();
        }
        
        private async void btnAgregar_Click(object sender, EventArgs e)
        {
            using (HttpClient client = new HttpClient())
            { 
                try
                {
                    var nuevoProducto = new Producto
                    {
                        Id = Convert.ToInt32(txtId.Text),
                        Nombre = txtNombre.Text,
                        Precio = Convert.ToDouble(txtPRECIO.Text)
                    };

                    string json = JsonConvert.SerializeObject(nuevoProducto);
                    StringContent content = new StringContent(json, Encoding.UTF8, "application/json");

                    HttpResponseMessage responde = await client.PostAsync(baseUrl, content);
                    responde.EnsureSuccessStatusCode();

                    MessageBox.Show("Producto agregado de forma correcta.");
                    txtId.Clear();
                    txtNombre.Clear();
                    txtPRECIO.Clear();
                    btnListar_Click(sender, e);
                }
                catch (Exception ex)
                {

                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private async void btnListar_Click(object sender, EventArgs e)
        {
            using (HttpClient client  = new HttpClient() )
            {
                try
                {
                    HttpResponseMessage response = await client.GetAsync(baseUrl );
                    response.EnsureSuccessStatusCode();
                    string responseBodey = await response.Content.ReadAsStringAsync();
                    var productos = JsonConvert.DeserializeObject<List<Producto>>(responseBodey);
                    DGVDatos.DataSource = productos;
                }
                catch (Exception ex)
                {

                    MessageBox.Show("Error al listas los productos: " + ex.Message);
                }
            }
        }

        private async void btnEditar_Click(object sender, EventArgs e)
        {
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    int id = Convert.ToInt32(txtId.Text);
                    var editarProducto = new Producto
                    {
                      
                        Nombre = txtNombre.Text,
                        Precio = Convert.ToDouble(txtPRECIO.Text)
                    };

                    string json = JsonConvert.SerializeObject(editarProducto);
                    StringContent content = new StringContent(json, Encoding.UTF8, "application/json");

                    HttpResponseMessage responde = await client.PutAsync($"{baseUrl}/{id}", content);
                    responde.EnsureSuccessStatusCode();

                    MessageBox.Show("Producto actualizado de forma correcta.");
                    txtId.Clear();
                    txtNombre.Clear();
                    txtPRECIO.Clear();
                    btnListar_Click(sender, e);
                }
                catch (Exception ex)
                {

                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private async void btnEliminar_Click(object sender, EventArgs e)
        {
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    int id = Convert.ToInt32(txtId.Text);
                    

                  
                    HttpResponseMessage responde = await client.DeleteAsync($"{baseUrl}/{id}");
                    responde.EnsureSuccessStatusCode();

                    MessageBox.Show("Producto eliminado de forma correcta.");
                    txtId.Clear();
                    txtNombre.Clear();
                    txtPRECIO.Clear();
                    btnListar_Click(sender, e);
                }
                catch (Exception ex)
                {

                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }
    }
}
