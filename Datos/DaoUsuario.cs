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
                string consulta = $"SELECT Nombre_Usu, Tipo_Usu, Legajo_Me_Usu FROM dbo.Usuarios left JOIN dbo.Medicos ON Legajo_Me = Legajo_Me_Usu WHERE Nombre_Usu = '{usuario}' AND Contrasenia_Usu = '{contraseña}'";
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
