using System;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class Conexion
    {
        private string _cadenaConexion = "Data Source=localhost\\SQLEXPRESS;Initial Catalog=Clinica;Integrated Security=True;Encrypt=False";
        private readonly SqlConnection _sqlConnection;

        public Conexion()
        {
            _sqlConnection = new SqlConnection(_cadenaConexion);
        }

        public DataTable TraerTabla(string consultaSql, string nombreTabla)
        {
            _sqlConnection.Open();

            SqlDataAdapter adapter = new SqlDataAdapter(consultaSql, _sqlConnection);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet, nombreTabla);

            _sqlConnection.Close();

            return dataSet.Tables[nombreTabla];
        }

        public SqlConnection ObtenerConexion()
        {
            return _sqlConnection;
        }
        public int ejecutarConsulta(string consultaSQL)
        {
            _sqlConnection.Open();

            SqlCommand sqlCommand = new SqlCommand(consultaSQL, _sqlConnection);
            var filasAfectadas = sqlCommand.ExecuteNonQuery();

            _sqlConnection.Close();

            return filasAfectadas;
        }

        public int ejecutarConsultaConResultado(string consultaSQL)
        {
            _sqlConnection.Open();

            SqlCommand sqlCommand = new SqlCommand(consultaSQL, _sqlConnection);
            var filasAfectadas = sqlCommand.ExecuteScalar();

            _sqlConnection.Close();

            return Convert.ToInt32(filasAfectadas);
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand comando, string nombreSP)
        {
            SqlConnection conexion = ObtenerConexion();
            comando.Connection = conexion;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = nombreSP;

            conexion.Open();
            int filasAfectadas = comando.ExecuteNonQuery();
            conexion.Close();

            return filasAfectadas;
        }
        public int EjecutarEscalar(SqlCommand comando, string nombreSP)
        {
            SqlConnection conexion = ObtenerConexion();
            comando.Connection = conexion;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = nombreSP;

            conexion.Open();
            int resultado = Convert.ToInt32(comando.ExecuteScalar());
            conexion.Close();

            return resultado;
        }

        public int EjecutarProcedimientoAlmacenadoConResultado(SqlCommand comando, string nombreSP)
        {
            SqlConnection conexion = ObtenerConexion();
            comando.Connection = conexion;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = nombreSP;

            conexion.Open();
            var filasAfectadas = comando.ExecuteScalar();
            conexion.Close();

            return Convert.ToInt32(filasAfectadas);
        }

        public DataTable EjecutarSP_Select(string nombreSP)
        {
            SqlConnection conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(nombreSP, conexion);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable tabla = new DataTable();
            da.Fill(tabla);
            return tabla;
        }
    }
}
