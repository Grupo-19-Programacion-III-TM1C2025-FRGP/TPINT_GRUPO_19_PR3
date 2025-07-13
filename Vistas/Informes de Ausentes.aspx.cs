using Entidades;
using Negocio;
using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vistas.Clases;

namespace Vistas
{
    public partial class Informes_de_Ausentes : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            AuxiliarVistas.ValidarSesionAdministrador();
            lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            if (!IsPostBack)
            {
                //CargarFechas();

            }

        }
        //private void CargarFechas()
        //{
        //    NegocioTurno fecha = new NegocioTurno();
        //    ddFechaFinalA.DataSource = fecha.getTabla_Fecha();
        //    ddFechaFinalA.DataTextField = "FechaTurno_TU";
        //    ddFechaFinalA.DataValueField = "FechaTurno_TU";
        //    ddFechaFinalA.DataBind();
        //    ddFechaFinalA.Items.Insert(0, new ListItem("Seleccione una fecha final", "0"));

        //    ddFechaInicialA.DataSource = fecha.getTabla_Fecha();
        //    ddFechaInicialA.DataTextField = "FechaTurno_TU";
        //    ddFechaInicialA.DataValueField = "FechaTurno_TU";
        //    ddFechaInicialA.DataBind();
        //    ddFechaInicialA.Items.Insert(0, new ListItem("Seleccione una fecha Inicial", "0"));
        //}

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
        }


        protected void btnCalcularA_Click(object sender, EventArgs e)
        {
            NegocioTurno Datos = new NegocioTurno();
            string fechatxt = txtAusentesIni.Text;
            DateTime Inicio = DateTime.Parse(fechatxt);
            string fechatxt2 = txtAusentesFin.Text;
            DateTime Final = DateTime.Parse(fechatxt2);
            Turno turno = new Turno();
            SqlCommand comando = new SqlCommand();

            int Ausentes = Datos.FiltrarAusentes(turno, Inicio, Final);
            int Cantidad = Datos.Cantidad(Inicio, Final);
            float Resultado = Ausentes * 100f / Cantidad;
            if(float.IsNaN(Resultado) )
            {
                lblAusentes.Text = "No hay turnos en ese rango de fechas";
            }
            else 
            {
            lblAusentes.Text = Resultado + "%";
            }

            gvAusentes.DataSource = Datos.GVAusentes(Inicio, Final);
            gvAusentes.DataBind();
        }
    }
}