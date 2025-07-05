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
                CargarFechas();

            }

        }

        private void CargarFechas()
        {
            NegocioTurno fecha = new NegocioTurno();
            ddFechaFinalA.DataSource = fecha.getTabla_Fecha();
            ddFechaFinalA.DataTextField = "FechaTurno";
            ddFechaFinalA.DataValueField = "FechaTurno";
            ddFechaFinalA.DataBind();
            ddFechaFinalA.Items.Insert(0, new ListItem("Seleccione una fecha final", "0"));

            ddFechaInicialA.DataSource = fecha.getTabla_Fecha();
            ddFechaInicialA.DataTextField = "FechaTurno";
            ddFechaInicialA.DataValueField = "FechaTurno";
            ddFechaInicialA.DataBind();
            ddFechaInicialA.Items.Insert(0, new ListItem("Seleccione una fecha Inicial", "0"));
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
        }

        protected void btnCalcularA_Click(object sender, EventArgs e)
        {
           NegocioTurno Datos = new NegocioTurno();
           Turno turno = new Turno();   
           SqlCommand comando = new SqlCommand();   
           dvAusentes.DataSource = Datos.FiltrarPresentes(turno);
           dvAusentes.DataBind();

          
           turno.FechaTurno_Tur = DateTime.Today;
           float porcentaje = Datos.SacarPorcentaje(turno);
           lblAusentes.Text = porcentaje.ToString("F2") + "%";
        }
}
}