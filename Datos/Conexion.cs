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
            int filasAfectadas = sqlCommand.ExecuteNonQuery();

            _sqlConnection.Close();

            return filasAfectadas;
        }
    }
}
