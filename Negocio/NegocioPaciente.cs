using System;
using System.Data;
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

        public DataTable getTabla()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.traerTablaPacientes();
        }
    }
}
