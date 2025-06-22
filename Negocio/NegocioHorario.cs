using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;

namespace Negocio
{
    public class NegocioHorario
    {
        public DataTable getTabla()
        {
            DaoHorarios dao = new DaoHorarios();
            return dao.getTablaHorarios();
        }
    }

}
