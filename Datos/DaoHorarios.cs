using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
namespace Datos
{
    public class DaoHorarios : GenericDao
    {
        readonly string consultaTabla = "SELECT * FROM HorariosAtencion";

        public DaoHorarios() { }

        public DataTable getTablaHorarios()
        {
            DataTable tabla = _conexion.TraerTabla(consultaTabla, "HorariosAtencion");
            return tabla;
        }
        public void ArmarParametrosFechas(ref SqlCommand comando, Turno tur )
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
            ArmarParametrosFechas (ref comando, tur );
            return con.EjecutarProcedimientoAlmacenado(comando, "spCalcularPorcentajeEstado");
        }
    }
    
}
