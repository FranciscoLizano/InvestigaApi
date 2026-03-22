using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_ALQUISOFT.ControlAlquileres
{
    public class cls_Alquileres_DAL
    {
        #region Variables Privadas
        //Sección de campos de la tabla        
        private int _iId_Alquiler, _iId_Usuario, _iId_Estado, _iId_Categoria, _iId_CondPagoad;
        private string _sApartamento, _sNombre_Inquilino, _sCorreo, _sTelefono;
        private DateTime _dFecha_Registro, _dFecha_Inicio, _dFecha_Finn;
        private SqlMoney _mMensualidad;
        //Sección de campos de la tabla
        //Sección presente en todas las clases
        private string _sValorScalar, _sAXN, _sMSJError;
        private DataTable _dtDatos, _dtParametros;

        //Sección presente en todas las clases
        #endregion

        #region Variables Públicas o Constructores
        public int iId_Alquiler { get => _iId_Alquiler; set => _iId_Alquiler = value; }
        public int iId_Usuario { get => _iId_Usuario; set => _iId_Usuario = value; }
        public int iId_Estado { get => _iId_Estado; set => _iId_Estado = value; }
        public int iId_Categoria { get => _iId_Categoria; set => _iId_Categoria = value; }
        public int iId_CondPagoad { get => _iId_CondPagoad; set => _iId_CondPagoad = value; }
        public string sApartamento { get => _sApartamento; set => _sApartamento = value; }
        public string sNombre_Inquilino { get => _sNombre_Inquilino; set => _sNombre_Inquilino = value; }
        public string sCorreo { get => _sCorreo; set => _sCorreo = value; }
        public string sTelefono { get => _sTelefono; set => _sTelefono = value; }
        public DateTime dFecha_Registro { get => _dFecha_Registro; set => _dFecha_Registro = value; }
        public DateTime dFecha_Inicio { get => _dFecha_Inicio; set => _dFecha_Inicio = value; }
        public DateTime dFecha_Finn { get => _dFecha_Finn; set => _dFecha_Finn = value; }
        public SqlMoney mMensualidad { get => _mMensualidad; set => _mMensualidad = value; }
        public string sValorScalar { get => _sValorScalar; set => _sValorScalar = value; }
        public string sAXN { get => _sAXN; set => _sAXN = value; }
        public string sMSJError { get => _sMSJError; set => _sMSJError = value; }
        public DataTable dtDatos { get => _dtDatos; set => _dtDatos = value; }
        public DataTable dtParametros { get => _dtParametros; set => _dtParametros = value; }

        #endregion
    }
}
