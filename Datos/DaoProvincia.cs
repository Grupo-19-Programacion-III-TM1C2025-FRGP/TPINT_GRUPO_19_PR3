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
        readonly string consulta = "SELECT CodProvincia_Pr AS Codigo, NombreProvincia_Pr AS Provincia FROM Provincias";
        public DataTable getTablaProvincia()
        {
            Conexion con = new Conexion();
            return con.TraerTabla(consulta, "Provincias");
        }
    }
}
