using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocio
{
    public class NegocioLocalidad
    {
        public DataTable getLocalidadesPorProvincia(int idProvincia)
        {
            DaoLocalidad dao = new DaoLocalidad();
            return dao.getLocalidadesPorProvincia(idProvincia);
        }

        public DataTable getTabla()
        {
            DaoLocalidad dao = new DaoLocalidad();
            return dao.getTablaLocalidad();
        }
    }

}
