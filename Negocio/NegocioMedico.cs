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
    public class NegocioMedico
    {
        public int agregarMedico(Medico medico)
        {
            DaoMedico dao = new DaoMedico();
            return dao.AltaMedico(medico);
        }

        public int modificarMedico(Medico medico)
        {
            DaoMedico dao = new DaoMedico();
            return dao.modificarMedico(medico);
        }

        public int bajaMedico(string legajo)
        {
            DaoMedico dao = new DaoMedico();
            return dao.BajaMedico(legajo);
        }

        public int traerLegajoPorDNI(int dni)
        {
            DaoMedico dao = new DaoMedico();
            return dao.traerLegajoPorDNI(dni);
        }
        public DataTable getTabla()
        {
            DaoMedico dao = new DaoMedico();
            return dao.traerTablaMedicos();
        }
        public DataTable getTablaFiltrada(string codEspecialidad)
        {
            DaoMedico dao = new DaoMedico();
            return dao.FiltrarPorEspecialidad(codEspecialidad);
        }
    }
}
