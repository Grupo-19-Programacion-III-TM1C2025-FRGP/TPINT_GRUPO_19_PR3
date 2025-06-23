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
                string consulta = $"SELECT NombreUsuario_Usu, TipoUsuario_Usu FROM dbo.Usuarios WHERE NombreUsuario_Usu = '{usuario}' AND Contraseña_Usu = '{contraseña}'";
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
