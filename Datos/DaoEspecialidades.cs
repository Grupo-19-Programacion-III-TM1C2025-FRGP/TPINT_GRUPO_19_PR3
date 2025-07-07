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
        readonly string consultaTabla = "SELECT CodEspecialidad_Es AS Codigo, NombreEspecialidad_Es AS Especialidad FROM Especialidades";

        public DaoEspecialidades() { }

        public DataTable getTablaEspecialdades()
        {
            DataTable tabla = _conexion.TraerTabla(consultaTabla, "Especialidades");
            return tabla;
        }
    }
}