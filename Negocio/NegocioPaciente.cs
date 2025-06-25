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
    public class NegocioPaciente
    {
        public int agregarPaciente(Paciente paciente)
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.agregarPaciente(paciente);
        }

        public int modificarPaciente(Paciente paciente)
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.modificarPaciente(paciente);
        }

        public int bajaPaciente(string dni)
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.BajaPaciente(dni);
        }

        public DataTable getTabla()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.traerTablaPacientes();
        }
    }
}
