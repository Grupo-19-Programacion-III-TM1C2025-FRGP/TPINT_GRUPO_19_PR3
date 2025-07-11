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
        public int AgregarPaciente(Paciente paciente)
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.AltaPaciente(paciente);
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

        public int ContarPacientes(string DNIPaciente)
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.VerificarExistenciaPaciente(DNIPaciente);    // Devuelve la cantidad de paciente con el DNI pasado (0 ó 1)
        }
        public int ContarTurnos(string DNIPaciente, int codHorario, DateTime fecha)
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.VerificarDisponibilidadPaciente(DNIPaciente, codHorario, fecha);
        }
        public DataTable FiltroProvincia(int prov)
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.FiltroProvincia(prov);
        }
        public DataTable BuscarDNI(int dni) 
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.BuscarDNI(dni);
        }
        public DataTable BuscarNombre(string nombre)
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.BuscarNombre(nombre);
        }
    }
}
