using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoDiasAtencion : GenericDao
    {
        readonly string consultaTabla = "SELECT * FROM DiasAtencion";

        public DaoDiasAtencion() { }

        public DataTable getTablaDias()
        {
            DataTable tabla = _conexion.TraerTabla(consultaTabla, "DiasAtencion");
            return tabla;
        }
    }
}
