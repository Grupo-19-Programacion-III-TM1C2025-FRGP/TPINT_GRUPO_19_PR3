using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoEspecialidades : GenericDao
    {
        readonly string consultaTabla = "SELECT * FROM Especialidades";

        public DaoEspecialidades() { }

        public DataTable getTablaEspecialdades()
        {
            DataTable tabla = _conexion.TraerTabla(consultaTabla, "Especialidades");
            return tabla;
        }
    }
}