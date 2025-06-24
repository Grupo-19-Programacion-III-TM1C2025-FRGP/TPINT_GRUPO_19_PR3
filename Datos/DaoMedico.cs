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
            param.Value = med.DNI;

            param = comando.Parameters.Add("@NombreMedico", SqlDbType.VarChar, 100);
            param.Value = med.NombreMedico;

            param = comando.Parameters.Add("@ApellidoMedico", SqlDbType.VarChar, 100);
            param.Value = med.ApellidoMedico;

            param = comando.Parameters.Add("@Sexo", SqlDbType.Char, 1);
            param.Value = med.Sexo;

            param = comando.Parameters.Add("@Nacionalidad", SqlDbType.VarChar, 50);
            param.Value = med.Nacionalidad;

            param = comando.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            param.Value = med.FechaNacimiento;

            param = comando.Parameters.Add("@Localidad", SqlDbType.Int);
            param.Value = med.Localidad;

            param = comando.Parameters.Add("@Especialidad", SqlDbType.Int);
            param.Value = med.Especialidad;

            param = comando.Parameters.Add("@DiaAtencion", SqlDbType.Int);
            param.Value = med.DiaAtencion;

            param = comando.Parameters.Add("@Horario", SqlDbType.Int);
            param.Value = med.Horario;

            param = comando.Parameters.Add("@Email", SqlDbType.VarChar, 100);
            param.Value = med.Email;

            param = comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            param.Value = med.Telefono;
        }

        private void ArmarParametrosMedicoModificar(ref SqlCommand comando, Medico med)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@LegajoMedico", SqlDbType.Int);
            param.Value = med.LegajoMedico;

            param = comando.Parameters.Add("@DNI", SqlDbType.Int);
            param.Value = med.DNI;

            param = comando.Parameters.Add("@NombreMedico", SqlDbType.VarChar, 100);
            param.Value = med.NombreMedico;

            param = comando.Parameters.Add("@ApellidoMedico", SqlDbType.VarChar, 100);
            param.Value = med.ApellidoMedico;

            param = comando.Parameters.Add("@Sexo", SqlDbType.Char, 1);
            param.Value = med.Sexo;

            param = comando.Parameters.Add("@Nacionalidad", SqlDbType.VarChar, 50);
            param.Value = med.Nacionalidad;

            param = comando.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            param.Value = med.FechaNacimiento;

            param = comando.Parameters.Add("@Localidad", SqlDbType.Int);
            param.Value = med.Localidad;

            param = comando.Parameters.Add("@Especialidad", SqlDbType.Int);
            param.Value = med.Especialidad;

            param = comando.Parameters.Add("@DiaAtencion", SqlDbType.Int);
            param.Value = med.DiaAtencion;

            param = comando.Parameters.Add("@Horario", SqlDbType.Int);
            param.Value = med.Horario;

            param = comando.Parameters.Add("@Email", SqlDbType.VarChar, 100);
            param.Value = med.Email;

            param = comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            param.Value = med.Telefono;
        }

        private void ArmarParametrosMedicoDarDeBaja(ref SqlCommand comando, int dni)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@DNI", SqlDbType.Int);
            param.Value = dni;
        }

        public int agregarMedico(Medico med)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicoAgregar(ref comando, med);
            return con.EjecutarProcedimientoAlmacenado(comando, "spAgregarMedico");
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
            tabla = _conexion.TraerTabla(consultaTabla, "Medico");
            return tabla;
        }
        public DataTable FiltrarPorEspecialidad(string codEspecialidad)
        {
            consultaTablaFiltrada += codEspecialidad;
            tabla = _conexion.TraerTabla(consultaTablaFiltrada, "Medico");
            return tabla;
        }

        public int BajaMedico(int dni)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicoDarDeBaja(ref comando, dni);
            return con.EjecutarProcedimientoAlmacenado(comando, "spBajaMedico");
        }

    }
}
