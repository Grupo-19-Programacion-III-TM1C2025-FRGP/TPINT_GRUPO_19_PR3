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
    public class DaoPaciente : GenericDao
    {
        // Propiedades
        readonly string consultaTabla = "SELECT * FROM Pacientes";
        DataTable tabla;
        // Métodos
        public void ArmarParametrosPacienteAgregar(ref SqlCommand comando, Paciente pac)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@DNI", SqlDbType.Int);
            param.Value = pac.DNI;

            param = comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 100);
            param.Value = pac.Nombre;

            param = comando.Parameters.Add("@Apellido", SqlDbType.VarChar, 100);
            param.Value = pac.Apellido;

            param = comando.Parameters.Add("@Sexo", SqlDbType.Char, 1);
            param.Value = pac.Sexo;

            param = comando.Parameters.Add("@Nacionalidad", SqlDbType.VarChar, 50);
            param.Value = pac.Nacionalidad;

            param = comando.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            param.Value = pac.FechaNacimiento;

            param = comando.Parameters.Add("@Direccion", SqlDbType.VarChar, 200);
            param.Value = pac.Direccion;

            param = comando.Parameters.Add("@IDLocalidad", SqlDbType.Int);
            param.Value = pac.IDLocalidad;


            param = comando.Parameters.Add("@CorreoElectronico", SqlDbType.VarChar, 100);
            param.Value = pac.CorreoElectronico;

            param = comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            param.Value = pac.Telefono;
        }

        private void ArmarParametrosPacienteModificar(ref SqlCommand comando, Paciente pac)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@DNI", SqlDbType.Int);
            param.Value = pac.DNI;

            param = comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 100);
            param.Value = pac.Nombre;

            param = comando.Parameters.Add("@Apellido", SqlDbType.VarChar, 100);
            param.Value = pac.Apellido;

            param = comando.Parameters.Add("@Sexo", SqlDbType.Char, 1);
            param.Value = pac.Sexo;

            param = comando.Parameters.Add("@Nacionalidad", SqlDbType.VarChar, 50);
            param.Value = pac.Nacionalidad;

            param = comando.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            param.Value = pac.FechaNacimiento;

            param = comando.Parameters.Add("@Direccion", SqlDbType.VarChar, 200);
            param.Value = pac.Direccion;

            param = comando.Parameters.Add("@IDLocalidad", SqlDbType.Int);
            param.Value = pac.IDLocalidad;


            param = comando.Parameters.Add("@CorreoElectronico", SqlDbType.VarChar, 100);
            param.Value = pac.CorreoElectronico;

            param = comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            param.Value = pac.Telefono;
        }

        public int agregarPaciente(Paciente pac)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosPacienteAgregar(ref comando, pac);
            return con.EjecutarProcedimientoAlmacenado(comando, "spAgregarPaciente");
        }

        public int modificarPaciente(Paciente pac)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosPacienteModificar(ref comando, pac);
            return con.EjecutarProcedimientoAlmacenado(comando, "spModificarPaciente");
        }

        public DataTable traerTablaPacientes()
        {
            tabla = _conexion.TraerTabla(consultaTabla, "Pacientes");
            return tabla;
        }
    }
}
