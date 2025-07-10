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
        public DataTable BuenosAires()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.BuenosAires();
        }
        public DataTable Cordoba()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Cordoba();
        }
        public DataTable SantaFe()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.SantaFe();
        }
        public DataTable Catamarca()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Catamarca();
        }
        public DataTable Chaco()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Chaco();
        }
        public DataTable Chubut()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Chubut();
        }
        public DataTable Corrientes()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Corrientes();
        }
        public DataTable EntreRios()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.EntreRios();
        }
        public DataTable Formosa()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Formosa();
        }
        public DataTable Jujuy()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Jujuy();
        }
        public DataTable LaPampa()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.LaPampa();
        }
        public DataTable LaRioja()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.LaRioja();
        }
        public DataTable Mendoza()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Mendoza();
        }
        public DataTable Misiones()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Misiones();
        }
        public DataTable Neuquen()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Neuquen();
        }
        public DataTable RioNegro()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.RioNegro();
        }
        public DataTable Salta()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Salta();
        }
        public DataTable SanJuan()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.SanJuan();
        }
        public DataTable SanLuis()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.SanLuis();
        }
        public DataTable SantaCruz()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.SantaCruz();
        }
        public DataTable SantiagoEstero()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.SantiagoEstero();
        }
        public DataTable TierraDelFuego()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.TierraDelFuego();
        }
        public DataTable Tucuman()
        {
            DaoPaciente dao = new DaoPaciente();
            return dao.Tucuman();
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
