using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades;
using System.Runtime.Remoting.Messaging;
using System.Net;

namespace Datos
{
    public class DaoPaciente : GenericDao
    {
        // Propiedades
        DataTable tabla;

        // Métodos
        public void ArmarParametrosPacienteAgregar(ref SqlCommand comando, Paciente pac)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@DNI", SqlDbType.Char, 8);
            param.Value = pac.DNI;

            param = comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 25);
            param.Value = pac.Nombre;

            param = comando.Parameters.Add("@Apellido", SqlDbType.VarChar, 25);
            param.Value = pac.Apellido;

            param = comando.Parameters.Add("@Sexo", SqlDbType.Char, 1);
            param.Value = pac.Sexo;

            param = comando.Parameters.Add("@Nacionalidad", SqlDbType.VarChar, 30);
            param.Value = pac.Nacionalidad;

            param = comando.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            param.Value = pac.FechaNacimiento;

            param = comando.Parameters.Add("@Direccion", SqlDbType.VarChar, 50);
            param.Value = pac.Direccion;

            param = comando.Parameters.Add("@Provincia", SqlDbType.Int);
            param.Value = pac.CodProvincia;

            param = comando.Parameters.Add("@Localidad", SqlDbType.Int);
            param.Value = pac.CodLocalidad;

            param = comando.Parameters.Add("@CorreoElectronico", SqlDbType.VarChar, 30);
            param.Value = pac.CorreoElectronico;

            param = comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            param.Value = pac.Telefono;
        }
        private void ArmarParametrosPacienteModificar(ref SqlCommand comando, Paciente pac)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@DNI", SqlDbType.Char, 8);
            param.Value = pac.DNI;

            param = comando.Parameters.Add("@NombrePaciente", SqlDbType.VarChar, 20);
            param.Value = pac.Nombre;

            param = comando.Parameters.Add("@ApellidoPaciente", SqlDbType.VarChar, 20);
            param.Value = pac.Apellido;

            param = comando.Parameters.Add("@Sexo", SqlDbType.Char, 1);
            param.Value = pac.Sexo;

            param = comando.Parameters.Add("@Nacionalidad", SqlDbType.VarChar, 30);
            param.Value = pac.Nacionalidad;

            param = comando.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            param.Value = pac.FechaNacimiento;

            param = comando.Parameters.Add("@Direccion", SqlDbType.VarChar, 50);
            param.Value = pac.Direccion;

            param = comando.Parameters.Add("@Provincia", SqlDbType.Int);
            param.Value = pac.CodProvincia;

            param = comando.Parameters.Add("@Localidad", SqlDbType.Int);
            param.Value = pac.CodLocalidad;

            param = comando.Parameters.Add("@Email", SqlDbType.VarChar, 30);
            param.Value = pac.CorreoElectronico;

            param = comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            param.Value = pac.Telefono;

            param = comando.Parameters.Add("@Estado", SqlDbType.Bit);
            param.Value = pac.Estado;
        }
        private void ArmarParametrosPacienteDarDeBaja(ref SqlCommand comando, string dni)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@DNI", SqlDbType.Char, 8);
            param.Value = dni;
        }
        private void ArmarParametrosPacienteVerificarExistencia(ref SqlCommand comando, string dni)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@DNIPaciente", SqlDbType.Char, 8);
            param.Value = dni;
        }
        private void ArmarParametrosPacienteVerificarDisponibilidad(ref SqlCommand comando, string dni, int codHorario, DateTime fecha)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@DNIPaciente", SqlDbType.Char, 8);
            param.Value = dni;

            param = comando.Parameters.Add("@CodHorario", SqlDbType.Int);
            param.Value = codHorario;

            param = comando.Parameters.Add("@Fecha", SqlDbType.Date);
            param.Value = fecha;
        }

        public int AltaPaciente(Paciente pac)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosPacienteAgregar(ref comando, pac);
            return con.EjecutarProcedimientoAlmacenado(comando, "spAltaPaciente");
        }
        public int modificarPaciente(Paciente pac)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosPacienteModificar(ref comando, pac);
            return con.EjecutarProcedimientoAlmacenado(comando, "spModificarPaciente");
        }
        public int BajaPaciente(string dni)
        { 
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosPacienteDarDeBaja(ref comando, dni);
            return con.EjecutarProcedimientoAlmacenado(comando, "spBajaPaciente");
        }
        public DataTable traerTablaPacientes()
        {
            Conexion con = new Conexion();
            DataTable tabla = con.EjecutarSP_Select("spTraerTablaPacientesCodificada");
            return tabla;
        }
        public int VerificarExistenciaPaciente(string DNIPaciente)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();

            ArmarParametrosPacienteVerificarExistencia(ref comando, DNIPaciente);

            // Ejecuta el SP y devuelve el COUNT directamente
            return con.EjecutarEscalar(comando, "spVerificarExistenciaPaciente");
        }
        public int VerificarDisponibilidadPaciente(string DNIPaciente, int codHorario, DateTime fecha)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();

            ArmarParametrosPacienteVerificarDisponibilidad(ref comando, DNIPaciente, codHorario, fecha);

            // Ejecuta el SP y devuelve el COUNT directamente
            return con.EjecutarEscalar(comando, "spVerificarDisponibilidadPaciente");
        }
    }
}
