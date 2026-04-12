using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_WEB_ALQUISOFT.WEB
{
    public class cls_WEB_DAL
    {
        #region Variables Privadas
        //Sección de campos de la tabla
        private int _iId_Email;
        private string _sCorreo, _sNombre, _sAsunto, _sMensaje, _sTelefono;
        //Sección de campos de la tabla

        //Sección presente en todas las clases
        private string _sValorScalar, _SAXN, _SMSJError;
        private DataTable _dtDatos, _dtParametros;


        //Sección presente en todas las clases
        #endregion

        #region Variables Publicas o Constructores
        public int iId_Email { get => _iId_Email; set => _iId_Email = value; }
        public string sCorreo { get => _sCorreo; set => _sCorreo = value; }
        public string sNombre { get => _sNombre; set => _sNombre = value; }
        public string sAsunto { get => _sAsunto; set => _sAsunto = value; }
        public string sMensaje { get => _sMensaje; set => _sMensaje = value; }
        public string sTelefono { get => _sTelefono; set => _sTelefono = value; }
        public string sValorScalar { get => _sValorScalar; set => _sValorScalar = value; }
        public string sAXN { get => _SAXN; set => _SAXN = value; }
        public string sMSJError { get => _SMSJError; set => _SMSJError = value; }
        public DataTable dtDatos { get => _dtDatos; set => _dtDatos = value; }
        public DataTable dtParametros { get => _dtParametros; set => _dtParametros = value; }
        #endregion
    }
}
