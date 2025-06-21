using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{

    public class DaoUsuario : GenericDao
    {
        public DataTable ValidarCredenciales(string usuario, string contraseña)
        {
            try
            {
                string consulta = $"SELECT NombreUsuario, TipoUsuario FROM dbo.Usuarios WHERE NombreUsuario = '{usuario}' AND Contraseña = '{contraseña}'";
                DataTable tabla = _conexion.TraerTabla(consulta, "Usuario");

                return tabla;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
