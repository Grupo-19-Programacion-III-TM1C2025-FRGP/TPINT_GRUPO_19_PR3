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
        readonly string consultaTabla = "SELECT * FROM Turnos";
        readonly string consultaFecha = "SELECT FechaTurno_TU FROM Turnos";
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
        public void ArmarParametrosAsignarTurno(ref SqlCommand comando, Turno tur)
        {
            SqlParameter ParamF;

            ParamF = comando.Parameters.Add("@LegajoMedico", SqlDbType.Int);
            ParamF.Value = tur.LegajoMedico_Tur;

            ParamF = comando.Parameters.Add("@CodigoHora", SqlDbType.Int);
            ParamF.Value = tur.CodHorarioTurno_Tur;

            ParamF = comando.Parameters.Add("@Fecha", SqlDbType.Date);
            ParamF.Value = tur.FechaTurno_Tur;

            ParamF = comando.Parameters.Add("@DNIPaciente", SqlDbType.Char, 8);
            ParamF.Value = tur.DNIPaciente_Tur;
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
        public int AltaTurno(Turno turno)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAsignarTurno(ref comando, turno);
            return con.EjecutarProcedimientoAlmacenado(comando, "spAsignarTurno");
        }
    }
}
