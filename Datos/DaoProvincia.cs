using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoProvincia
    {
        public DataTable getTablaProvincia()
        {
            Conexion con = new Conexion();
            string consulta = "SELECT * FROM Provincias";
            return con.TraerTabla(consulta, "Provincias");
        }
    }

}
