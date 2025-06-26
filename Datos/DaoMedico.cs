using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades;
using System.Runtime.Remoting.Messaging;

namespace Datos
{
    public class DaoMedico : GenericDao
    {
        // Propiedades
        readonly string consultaTabla = "SELECT * FROM Medicos";
        string consultaTablaFiltrada = "select M.NombreMedico, M.LegajoMedico, M.Especialidad from Medico AS M inner join Especialidades AS E on M.Especialidad = E.CodEspecialidad_Es where M.Especialidad = ";
        DataTable tabla;

        // Métodos
        public void ArmarParametrosMedicoAgregar(ref SqlCommand comando, Medico med)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@DNI", SqlDbType.Int);
            param.Value = med._DNI;

            param = comando.Parameters.Add("@NombreMedico", SqlDbType.VarChar, 100);
            param.Value = med._NombreMedico;

            param = comando.Parameters.Add("@ApellidoMedico", SqlDbType.VarChar, 100);
            param.Value = med._ApellidoMedico;

            param = comando.Parameters.Add("@Sexo", SqlDbType.Char, 1);
            param.Value = med._Sexo;

            param = comando.Parameters.Add("@Nacionalidad", SqlDbType.VarChar, 50);
            param.Value = med._Nacionalidad;

            param = comando.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            param.Value = med._FechaNacimiento;

            param = comando.Parameters.Add("@Provincia", SqlDbType.Int);
            param.Value = med._Provincia;

            param = comando.Parameters.Add("@Localidad", SqlDbType.Int);
            param.Value = med._Localidad;

            param = comando.Parameters.Add("@Especialidad", SqlDbType.Int);
            param.Value = med._Especialidad;

            param = comando.Parameters.Add("@Email", SqlDbType.VarChar, 100);
            param.Value = med._Email;

            param = comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            param.Value = med._Telefono;

            param = comando.Parameters.Add("@HoraEntrada", SqlDbType.Time);
            param.Value = med._HoraEntrada;

            param = comando.Parameters.Add("@HoraSalida", SqlDbType.Time);
            param.Value = med._HoraSalida;
        }

        private void ArmarParametrosMedicoModificar(ref SqlCommand comando, Medico med)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@LEGAJO", SqlDbType.Char);
            param.Value = med._LegajoMedico;

            param = comando.Parameters.Add("@DNI", SqlDbType.Char);
            param.Value = med._DNI;

            param = comando.Parameters.Add("@NombreMedico", SqlDbType.VarChar, 20);
            param.Value = med._NombreMedico;

            param = comando.Parameters.Add("@ApellidoMedico", SqlDbType.VarChar, 20);
            param.Value = med._ApellidoMedico;

            param = comando.Parameters.Add("@Sexo", SqlDbType.Char, 1);
            param.Value = med._Sexo;

            param = comando.Parameters.Add("@Nacionalidad", SqlDbType.VarChar, 30);
            param.Value = med._Nacionalidad;

            param = comando.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            param.Value = med._FechaNacimiento;

            param = comando.Parameters.Add("@Provincia", SqlDbType.Int);
            param.Value = med._Provincia;

            param = comando.Parameters.Add("@Localidad", SqlDbType.Int);
            param.Value = med._Localidad;

            param = comando.Parameters.Add("@Especialidad", SqlDbType.Int);
            param.Value = med._Especialidad;

            param = comando.Parameters.Add("@Email", SqlDbType.VarChar, 30);
            param.Value = med._Email;

            param = comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            param.Value = med._Telefono;

            param = comando.Parameters.Add("@HoraEntrada", SqlDbType.Time);
            param.Value = med._HoraEntrada;

            param = comando.Parameters.Add("@HoraSalida", SqlDbType.Time);
            param.Value = med._HoraSalida;

            param = comando.Parameters.Add("@Estado", SqlDbType.Bit);
            param.Value = med._Estado;
        }

        private void ArmarParametrosMedicoDarDeBaja(ref SqlCommand comando, string legajo)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@LEGAJO", SqlDbType.Char);
            param.Value = legajo;
        }

        public int AltaMedico(Medico med)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicoAgregar(ref comando, med);
            return con.EjecutarProcedimientoAlmacenado(comando, "spAltaMedico");
        }

        public int modificarMedico(Medico med)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicoModificar(ref comando, med);
            return con.EjecutarProcedimientoAlmacenado(comando, "spModificarMedico");
        }

        public int traerLegajoPorDNI(int dni)
        {
            Conexion ds = new Conexion();
            string consulta = "SELECT LegajoMedico FROM Medico WHERE DNI = " + dni;
            tabla = ds.TraerTabla(consulta, "Medico");

            if (tabla.Rows.Count > 0)
                return Convert.ToInt32(tabla.Rows[0]["LegajoMedico"]);

            return -1; // O algún valor que indique que no se encontró
        }

        public DataTable traerTablaMedicos()
        {
            Conexion con = new Conexion();
            DataTable tabla = con.EjecutarSP_Select("spTraerTablaMedicosCodificada");
            return tabla;
        }

        public DataTable FiltrarPorEspecialidad(string codEspecialidad)
        {
            consultaTablaFiltrada += codEspecialidad;
            tabla = _conexion.TraerTabla(consultaTablaFiltrada, "Medico");
            return tabla;
        }

        public int BajaMedico(string legajo)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicoDarDeBaja(ref comando, legajo);
            return con.EjecutarProcedimientoAlmacenado(comando, "spBajaMedico");
        }

    }
}
