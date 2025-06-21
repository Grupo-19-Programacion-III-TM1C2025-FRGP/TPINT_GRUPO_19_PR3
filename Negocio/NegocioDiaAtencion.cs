using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Negocio
{
    public class NegocioDiaAtencion
    {
        public DataTable getTabla()
        {
            DaoDiasAtencion dao = new DaoDiasAtencion();
            return dao.getTablaDias();
        }
    }

}
