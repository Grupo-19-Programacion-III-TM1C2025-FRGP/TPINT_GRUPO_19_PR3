using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocio
{
    public class NegocioEspecialidad
    {
        public DataTable getTabla()
        {
            DaoEspecialidades dao = new DaoEspecialidades();
            return dao.getTablaEspecialdades();
        }
    }
}
