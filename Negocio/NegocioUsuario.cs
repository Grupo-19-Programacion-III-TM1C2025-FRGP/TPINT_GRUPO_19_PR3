using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioUsuario
    {
        readonly DaoUsuario dao = new DaoUsuario();
        public NegocioUsuario()
        {
            // Constructor vacío
        }

        public int ModificarUsuario(string legajo, string usuario, string contrasenia)
        {
            try
            {

                int result = dao.ModificarUsuario(legajo, usuario, contrasenia);
                return result;
            }
            catch (Exception ex)
            {
                return 0;

            }
        }
    }
}
