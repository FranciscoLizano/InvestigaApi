using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace DAL_ConsumoAPI
{
    public class cls_CambioDolar
    {
        private readonly HttpClient _client;

        // Constructor
        public cls_CambioDolar()
        {
            _client = new HttpClient();
        }

        public async Task<string> ObtenerTipoCambioAsync()
        {
            var response = await _client.GetAsync("https://api.hacienda.go.cr/indicadores/tc/dolar");

            response.EnsureSuccessStatusCode();

            return await response.Content.ReadAsStringAsync();
        }
        public async Task<string> ObtenerHistoricoCambioAsynx()
        {
            var response = await _client.GetAsync("https://api.hacienda.go.cr/indicadores/tc/dolar/historico?d=2026-01-01&h=2026-01-31");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadAsStringAsync();
        }
    }
}