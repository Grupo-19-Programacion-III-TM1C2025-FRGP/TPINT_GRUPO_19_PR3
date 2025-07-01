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
            string consulta = $"SELECT * FROM Localidades WHERE CodProvincia_Pr_Lo = {idProvincia}";
            return con.TraerTabla(consulta, "Localidades");
        }

        public DataTable getTablaLocalidad()
        {
            Conexion con = new Conexion();
            string consulta = "SELECT CodLocalidad_Lo AS Codigo, NombreLocalidad_Lo AS Localidad FROM Localidades";
            return con.TraerTabla(consulta, "Localidades");
        }
    }
}
