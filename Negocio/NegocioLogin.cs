using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioLogin
    {
        DaoUsuario daoUsuario = new DaoUsuario();

        public Dictionary<string, string> ValidarCredenciales(string usuario, string contraseña)
        {
            try
            {

                DataTable tabla = daoUsuario.ValidarCredenciales(usuario, contraseña);
                var resultado = new Dictionary<string, string>();

                //Exception handling del DaoUsuario
                if (tabla == null)
                {
                    resultado["success"] = "false";
                    resultado["error"] = "Hemos tenido un error interno, por favor intente de nuevo más tarde";
                    return resultado;
                }

                if (tabla.Rows.Count > 0)
                {
                    resultado["success"] = "true";
                    resultado["usuario"] = tabla.Rows[0]["NombreUsuario_Usu"].ToString();
                    resultado["rol"] = tabla.Rows[0]["TipoUsuario_Usu"].ToString() == "True" ? "Administrador" : "Medico"; // 1 = Administrador, 0 = Medico

                }
                else
                {
                    resultado["success"] = "false";
                    resultado["error"] = "Usuario o contraseña incorrectos";
                }
                return resultado;
            }
            catch (Exception ex)
            {
                return new Dictionary<string, string>
                {
                    { "success", "false" },
                    { "error", ex.Message }
                };
            }
        }
    }
}
