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
        string consultaTurnos = "SELECT T.FechaTurno_Tu as Fecha, H.Horario_HT AS Hora, P.Apellido_Pa + ', ' + P.Nombre_Pa AS Paciente, P.DNI_Pa AS DNI, T.Asistencia_Tu AS Asistencia FROM Turnos AS T INNER JOIN HorariosTurno AS H ON H.CodHorarioTurno_HT = T.CodHorarioTurno_HT_Tu INNER JOIN Pacientes AS P ON P.DNI_Pa = T.DNI_Pa_Tu WHERE T.Legajo_Me_Tu = ";

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
        public DataTable TraerTablaTurnos(int legajoMedico)
        {
            consultaTurnos += legajoMedico;
            DataTable tabla = _conexion.TraerTabla(consultaTurnos, "Medicos");
            return tabla;
        }
    }
}
