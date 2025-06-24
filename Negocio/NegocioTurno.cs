using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioTurno
    {
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

        public float SacarPorcentaje(Turno turno)
      {
          DaoTurnos dao = new DaoTurnos();
          return dao.SacarPorcentajeAsistencia(turno);
      }

        public float FiltrarPresentes(Turno turno)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.FiltroPresentes(turno);
        }

        public float FiltrarAusentes(Turno turno)
        {
            DaoTurnos dao=new DaoTurnos();
            return dao.FiltroAusentes(turno);
        }
    }
}
