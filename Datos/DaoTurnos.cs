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
        public int Cantidad(DateTime Inicio, DateTime Final) //CANTIDAD DE TURNOS
        {
            string fechaInicio = Inicio.ToString("yyyy-MM-dd");
            string fechaFinal = Final.ToString("yyyy-MM-dd");
            string CantConsulta = $"SELECT COUNT(*) FROM Turnos WHERE FechaTurno_Tu >= '{fechaInicio}' AND FechaTurno_Tu <= '{fechaFinal}'";
            int resultado = _conexion.ejecutarConsultaConResultado(CantConsulta);
            return resultado;
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
        public int FiltroAusentes(Turno turno, DateTime Inicio, DateTime Final)
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
            return con.EjecutarProcedimientoAlmacenadoConResultado(comando, "Filtro_Ausentes");
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
        public DataTable GVPresente(DateTime Inicio, DateTime Final)
        {
            Conexion con = new Conexion();
            string fechaInicio = Inicio.ToString("yyyy-MM-dd");
            string fechaFinal = Final.ToString("yyyy-MM-dd");
            string GVconsulta = $"SELECT * FROM Turnos WHERE Asistencia_Tu = 'Presente' AND FechaTurno_Tu >= '{fechaInicio}' AND FechaTurno_Tu <= '{fechaFinal}'"; ;

            DataTable tabla = con.TraerTabla(GVconsulta, "Turnos");
            return tabla;
        }
        public DataTable GVAusente(DateTime Inicio, DateTime Final)
        {
            Conexion con = new Conexion();
            string fechaInicio = Inicio.ToString("yyyy-MM-dd");
            string fechaFinal = Final.ToString("yyyy-MM-dd");
            string GVconsulta = $"SELECT * FROM Turnos WHERE Asistencia_Tu = 'Ausente' AND FechaTurno_Tu >= '{fechaInicio}' AND FechaTurno_Tu <= '{fechaFinal}'"; ;

            DataTable tabla = con.TraerTabla(GVconsulta, "Turnos");
            return tabla;
        }
    }
}
