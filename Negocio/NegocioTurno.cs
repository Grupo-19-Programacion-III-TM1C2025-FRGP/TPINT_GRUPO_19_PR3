using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
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

        public int Cantidad()
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.Cantidad();
        }

        public float FiltrarAusentes(Turno turno)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.FiltroAusentes(turno);
        }

        //public int CantidadAusentes(DateTime Inicio, DateTime Final)
        //{
        //    DaoTurnos dao = new DaoTurnos();
        //    return dao.CantidadAusentes(Inicio, Final);
        //}
    }
}
