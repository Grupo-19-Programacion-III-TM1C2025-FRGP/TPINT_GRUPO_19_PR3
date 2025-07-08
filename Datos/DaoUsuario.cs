using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

        private void ArmarParametrosModificarUsuario(ref SqlCommand comando, string legajo, string usuario, string contrasenia)
        {
            SqlParameter param;
            param = comando.Parameters.Add("@Legajo", SqlDbType.Int);
            param.Value = legajo;
            param = comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            param.Value = usuario;
            param = comando.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50);
            param.Value = contrasenia;
        }
        private void ArmarParametrosVerificarNombreUsuario(ref SqlCommand comando, string legajo, string nuevoNombre)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@Legajo", SqlDbType.Int);
            param.Value = legajo;

            param = comando.Parameters.Add("@NuevoNombre", SqlDbType.VarChar, 100);
            param.Value = nuevoNombre;
        }
        public int ModificarUsuario(string legajo, string usuario, string contrasenia)
        {

            Conexion _conexion = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosModificarUsuario(ref comando, legajo, usuario, contrasenia);
            int filasAfectadas = _conexion.EjecutarProcedimientoAlmacenado(comando, "spModificarUsuario");

            return filasAfectadas;

        }
        public int VerificarNombreUsuario(string legajo, string nuevoNombre)
        {
            Conexion _conexion = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosVerificarNombreUsuario(ref comando, legajo, nuevoNombre);
            int resultado = _conexion.EjecutarProcedimientoAlmacenado(comando, "spVerificarNombreUsuario");
            // Devuelvo la cantidad de nombres en la bdd
            return resultado;
        }
    }
}
