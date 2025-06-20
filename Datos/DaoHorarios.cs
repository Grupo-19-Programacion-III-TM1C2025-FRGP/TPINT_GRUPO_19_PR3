using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoHorarios : GenericDao
    {
        readonly string consultaTabla = "SELECT * FROM HorariosAtencion";

        public DaoHorarios() { }

        public DataTable getTablaHorarios()
        {
            DataTable tabla = _conexion.TraerTabla(consultaTabla, "HorariosAtencion");
            return tabla;
        }
    }
}
