using Entidades;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoPaciente : GenericDao
    {
        // Propiedades
        DataTable tabla;

        string consultaProvincia = "SELECT PA.DNI_Pa AS DNI, PA.Apellido_Pa AS Nombre, PA.Nombre_Pa AS Apellido, PA.Sexo_Pa AS Sexo, PA.Nacionalidad_Pa AS Nacionalidad, PA.FechaNacimiento_Pa AS [Fecha de nacimiento], PA.Direccion_Pa AS Direccion, PA.Email_Pa AS [Correo electronico], PA.Telefono_Pa AS Telefono, PA.CodProvincia_Pr_Pa AS Provincia, PA.CodLocalidad_Lo_Pa AS Localidad, PA.Estado_Pa AS Estado FROM Pacientes AS PA ";
        string consultaDNI = "SELECT PA.DNI_Pa AS DNI, PA.Apellido_Pa AS Nombre, PA.Nombre_Pa AS Apellido, PA.Sexo_Pa AS Sexo, PA.Nacionalidad_Pa AS Nacionalidad, PA.FechaNacimiento_Pa AS [Fecha de nacimiento], PA.Direccion_Pa AS Direccion, PA.Email_Pa AS [Correo electronico], PA.Telefono_Pa AS Telefono, PA.CodProvincia_Pr_Pa AS Provincia, PA.CodLocalidad_Lo_Pa AS Localidad, PA.Estado_Pa AS Estado FROM Pacientes AS PA WHERE PA.DNI_Pa LIKE ";
        string consultaNombre = "SELECT PA.DNI_Pa AS DNI, PA.Apellido_Pa AS Nombre, PA.Nombre_Pa AS Apellido, PA.Sexo_Pa AS Sexo, PA.Nacionalidad_Pa AS Nacionalidad, PA.FechaNacimiento_Pa AS [Fecha de nacimiento], PA.Direccion_Pa AS Direccion, PA.Email_Pa AS [Correo electronico], PA.Telefono_Pa AS Telefono, PA.CodProvincia_Pr_Pa AS Provincia, PA.CodLocalidad_Lo_Pa AS Localidad, PA.Estado_Pa AS Estado FROM Pacientes AS PA WHERE (PA.Apellido_Pa + ', ' + PA.Nombre_Pa) LIKE  ";


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
        public DataTable FiltroProvincia(int prov)
        {
            if (prov == 0)
            {
                consultaProvincia += "ORDER BY Estado DESC";
            }
            else
            {
                consultaProvincia += $"WHERE CodProvincia_Pr_Pa = {prov} ORDER BY Estado DESC";
            }
            tabla = _conexion.TraerTabla(consultaProvincia, "Pacientes");
            return tabla;
        }
        public DataTable BuscarDNI(int dni)
        {
            consultaDNI += $"'{dni}%'";
            tabla = _conexion.TraerTabla(consultaDNI, "Pacientes");
            return tabla;
        }
        public DataTable BuscarNombre(string nombre)
        {
            consultaNombre += $"'%{nombre}%'";
            tabla = _conexion.TraerTabla(consultaNombre, "Pacientes");
            return tabla;
        }
    }
}