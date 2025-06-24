using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoTurnos : GenericDao
    {
        readonly string consultaTabla = "SELECT * FROM Turno";
        readonly string consultaFecha = "SELECT FechaTurno FROM Turno";
        public DaoTurnos() { }

        public DataTable getTablaTurno()
        {
            DataTable tabla = _conexion.TraerTabla(consultaTabla, "Turnos");
            return tabla;
        }
        public DataTable getTablaFecha()
        {
            DataTable tabla = _conexion.TraerTabla(consultaFecha, "Turnos");
            return tabla;
        }
        public void ArmarParametrosFechas(ref SqlCommand comando, Turno tur)
        {
            SqlParameter ParamF;

            ParamF = comando.Parameters.Add("@FechaInicio", SqlDbType.Date);
            ParamF.Value = tur.FechaTurno_Tur;

            ParamF = comando.Parameters.Add("@FechaFinal", SqlDbType.Date);
            ParamF.Value = tur.FechaTurno_Tur;

        }

        public float SacarPorcentajeAsistencia(Turno tur)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosFechas(ref comando, tur);
            return con.EjecutarProcedimientoAlmacenado(comando, "CalcularPorcentajeEstado");
        }

        public float FiltroPresentes(Turno tur)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosFechas(ref comando, tur);
            return con.EjecutarProcedimientoAlmacenado(comando, "Filtro_Presentes");
        }

        public float FiltroAusentes(Turno tur)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosFechas(ref comando, tur);
            return con.EjecutarProcedimientoAlmacenado(comando, "Filtro_Ausentes");
        }
    }
}
