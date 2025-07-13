using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoMedico : GenericDao
    {
        // Propiedades
        string consultaTablaFiltrada = "SELECT M.Legajo_Me AS Legajo, M.DNI_Me AS DNI, M.Apellido_Me AS Apellido, M.Nombre_Me AS Nombre, M.Sexo_Me AS Sexo, M.Email_Me AS Email, M.Telefono_Me AS Telefono, M.CodProvincia_Pr_Me AS Provincia, M.CodLocalidad_Lo_Me AS Localidad, M.CodEspecialidad_Es_Me, M.CodHoraEntrada_HT_Me AS Hora_Entrada, M.CodHoraSalida_HT_Me AS Hora_Salida, M.Estado_Me AS Estado FROM Medicos M ";
        DataTable tabla;

        // Métodos
        public void ArmarParametrosMedicoAgregar(ref SqlCommand comando, Medico med, string usuario, string contrasenia)
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

            param = comando.Parameters.Add("@CodHoraEntrada", SqlDbType.Int);
            param.Value = med._HoraEntrada;

            param = comando.Parameters.Add("@CodHoraSalida", SqlDbType.Int);
            param.Value = med._HoraSalida;

            // Agregar usuario y contraseña
            param = comando.Parameters.Add("@Usuario", SqlDbType.VarChar, 100);
            param.Value = usuario;
            param = comando.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 100);
            param.Value = contrasenia;
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

            param = comando.Parameters.Add("@CodHoraEntrada", SqlDbType.Int);
            param.Value = med._HoraEntrada;

            param = comando.Parameters.Add("@CodHoraSalida", SqlDbType.Int);
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
        private void ArmarParametrosPacienteVerificarDisponibilidad(ref SqlCommand comando, string legajoMedico, int codHorario, DateTime fecha)
        {
            SqlParameter param;

            param = comando.Parameters.Add("@LegajoMedico", SqlDbType.Int);
            param.Value = legajoMedico;

            param = comando.Parameters.Add("@CodHorario", SqlDbType.Int);
            param.Value = codHorario;

            param = comando.Parameters.Add("@Fecha", SqlDbType.Date);
            param.Value = fecha;
        }
        public int AltaMedico(Medico med, string usuario, string contrasenia)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicoAgregar(ref comando, med, usuario, contrasenia);
            return con.EjecutarProcedimientoAlmacenado(comando, "spAltaMedico");
        }

        public int modificarMedico(Medico med)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicoModificar(ref comando, med);
            return con.EjecutarProcedimientoAlmacenado(comando, "spModificarMedico");
        }

        public DataTable traerTablaMedicos()
        {
            Conexion con = new Conexion();
            DataTable tabla = con.EjecutarSP_Select("spTraerTablaMedicosCodificada");
            return tabla;
        }
        public DataTable FiltrarPorEspecialidad(int codEspecialidad)
        {
            if (codEspecialidad == 0)
            {
                consultaTablaFiltrada += "ORDER BY Estado_Me DESC";
            }
            else
            {
                consultaTablaFiltrada += $"WHERE M.CodEspecialidad_Es_Me = {codEspecialidad} ORDER BY Estado_Me DESC";
            }
            tabla = _conexion.TraerTabla(consultaTablaFiltrada, "Medicos");
            return tabla;
         
        }
        public DataTable FiltroProvincia(int prov)
        {
            if (prov == 0)
            {
                consultaTablaFiltrada += "ORDER BY M.Estado_Me DESC";
            }
            else
            {
                consultaTablaFiltrada += $"WHERE M.CodProvincia_Pr_Me = {prov} ORDER BY M.Estado_Me DESC";
            }
            tabla = _conexion.TraerTabla(consultaTablaFiltrada, "Medicos");
            return tabla;
        }
        public DataTable BuscarDNI(int dni)
        {
            consultaTablaFiltrada += $"WHERE M.DNI_Me LIKE '{dni}%'";
            tabla = _conexion.TraerTabla(consultaTablaFiltrada, "Medicos");
            return tabla;
        }
        public DataTable BuscarNombre(string nombre)
        {
            consultaTablaFiltrada += $"WHERE (M.Apellido_Me + ', ' + M.Nombre_Me) LIKE '%{nombre}%'";
            tabla = _conexion.TraerTabla(consultaTablaFiltrada, "Medicos");
            return tabla;
        }
        public int BajaMedico(string legajo)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();
            ArmarParametrosMedicoDarDeBaja(ref comando, legajo);
            return con.EjecutarProcedimientoAlmacenado(comando, "spBajaMedico");
        }

        public DataTable TraerTablaMedicosConUsuarios()
        {
            Conexion con = new Conexion();
            DataTable tabla = con.EjecutarSP_Select("spTraerTablaMedicosConUsuarios");
            return tabla;
        }
        public int VerificarDisponibilidadMedico(string legajoMedico, int codHorario, DateTime fecha)
        {
            Conexion con = new Conexion();
            SqlCommand comando = new SqlCommand();

            ArmarParametrosPacienteVerificarDisponibilidad(ref comando, legajoMedico, codHorario, fecha);

            // Ejecuta el SP y devuelve el COUNT directamente
            return con.EjecutarEscalar(comando, "spVerificarDisponibilidadMedico");
        }
       
    }
}
