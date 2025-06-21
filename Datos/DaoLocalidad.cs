using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoLocalidad
    {
        public DataTable getLocalidadesPorProvincia(int idProvincia)
        {
            Conexion con = new Conexion();
            string consulta = $"SELECT * FROM Localidades WHERE IDProvincia = {idProvincia}";
            return con.TraerTabla(consulta, "Localidades");
        }
    }

}
