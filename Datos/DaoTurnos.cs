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
        readonly string consultaContarTabla = "SELECT COUNT(*) FROM Turnos";
        readonly string consultaFecha = "SELECT FechaTurno_TU FROM Turnos";
        //readonly string consultaAusentes = "SELECT COUNT (*) FROM Turnos WHERE Asistencia_Tu = 'Ausente' AND FechaTurno >= ";

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

        public int Cantidad() //CANTIDAD DE TURNOS
        {
            Conexion conexion = new Conexion();
            int resultado = conexion.ejecutarConsultaConResultado(consultaContarTabla);
            return resultado;
        }

        public void PorcentajeAusente()
        {

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

        public void ArmarParametrosAsistencia(ref SqlCommand comando, Turno tur)
        {
            SqlParameter ParamF;
            ParamF = comando.Parameters.Add("@Fecha", SqlDbType.Date);
            ParamF.Value = tur.FechaTurno_Tur;
        }

        public float SacarPorcentajeAsistencia(Turno tur)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosFechas(ref comando, tur);
            return con.EjecutarProcedimientoAlmacenadoConResultado(comando, "CalcularPorcentajeEstado");
        }

        public int FiltroPresentes(Turno turno, DateTime Inicio, DateTime Final)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            SqlParameter ParamF;
            string NuevoInicio = Inicio.ToString("yyyy-MM-dd");
            comando.Parameters.Add("@FechaInicio", SqlDbType.Date).Value = NuevoInicio;
            //ParamF.Value = Inicio;
            string NuevoFinal = Final.ToString("yyyy-MM-dd");
            comando.Parameters.Add("@FechaFin", SqlDbType.Date).Value = NuevoFinal;
            //ParamF.Value = Final;
            return con.EjecutarProcedimientoAlmacenadoConResultado(comando, "Filtro_Presentes");
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
            return con.EjecutarProcedimientoAlmacenadoConResultado(comando, "spAsignarTurno");
        }
    }
}
