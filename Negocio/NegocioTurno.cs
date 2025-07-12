using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioTurno
    {
        public NegocioTurno() { }
        public DataTable getTabla_Turno()
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.getTablaTurno();
        }
        public DataTable getTabla_Fecha()
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.getTablaFecha();
        }

        private string FormatearFechas(string fecha)
        {   
            DateTime nuevaFecha = DateTime.ParseExact(fecha, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            return nuevaFecha.ToString("yyyy-MM-dd");
        }

        public int AgregarTurno(Turno turno)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.AltaTurno(turno);
        }

        public float SacarPorcentaje(Turno turno)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.SacarPorcentajeAsistencia(turno);
        }
        public int FiltrarPresentes(Turno turno, DateTime Inicio, DateTime Final)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.FiltroPresentes(turno, Inicio, Final);
        }
        public int FiltrarAusentes(Turno turno, DateTime Inicio, DateTime Final)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.FiltroAusentes(turno, Inicio, Final);
        }

        public int Cantidad(DateTime Inicio, DateTime Final)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.Cantidad(Inicio, Final);
        }
        public DataTable ListarTurnos(int legajoMedico)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.TraerTablaTurnos(legajoMedico);
        }
        public DataTable GVPresentes(DateTime Inicio, DateTime Final)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.GVPresente(Inicio, Final);
        }
        public DataTable GVAusentes(DateTime Inicio, DateTime Final)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.GVAusente(Inicio, Final);
        }
        public DataTable Filtrar_DNI(int DNI, int legajo)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.FiltrarDNI(DNI, legajo);
        }
        public DataTable FiltrarPresente(int legajo)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.FiltrarPresente(legajo);
        }
        public DataTable FiltrarPendiente(int legajo)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.FiltrarPendiente(legajo);
        }
        public DataTable FiltrarAusente(int legajo)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.FiltrarAusente(legajo);
        }
        public DataTable FiltrarNombre(string nombre, int legajo)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.FiltrarNombre(nombre, legajo);
        }
        public int ModificarAsistencia(Turno turno, string textoHorario)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.modificarAsistencia(turno, textoHorario);
        }

    }
}
