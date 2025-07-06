using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vistas.Clases;

namespace Vistas
{
    public partial class Informes_de_Presentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //AuxiliarVistas.ValidarSesionAdministrador();
            //lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            if (!IsPostBack)
            {
                CargarFechas();
            }

        }
        private void CargarFechas()
        {
            NegocioTurno fecha = new NegocioTurno();
            ddFechaFinalp.DataSource = fecha.getTabla_Fecha();
            ddFechaFinalp.DataTextField = "FechaTurno_TU";
            ddFechaFinalp.DataValueField = "FechaTurno_TU";
            ddFechaFinalp.DataBind();
            ddFechaFinalp.Items.Insert(0, new ListItem("Seleccione una fecha final", "0"));

            ddFechaInicialP.DataSource = fecha.getTabla_Fecha();
            ddFechaInicialP.DataTextField = "FechaTurno_TU";
            ddFechaInicialP.DataValueField = "FechaTurno_TU";
            ddFechaInicialP.DataBind();
            ddFechaInicialP.Items.Insert(0, new ListItem("Seleccione una fecha Inicial", "0"));
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
        }

        protected void btnCalcularP_Click(object sender, EventArgs e)
        {
            NegocioTurno Datos = new NegocioTurno();
            string fechaDDL = ddFechaInicialP.Text;
            DateTime Inicio = DateTime.Parse(fechaDDL);
            string fechaDDL2 = ddFechaFinalp.Text;
            DateTime Final = DateTime.Parse(fechaDDL2);
            Turno turno = new Turno();
            SqlCommand comando = new SqlCommand();
            //gvPresentes.DataSource = Datos.FiltrarPresentes(turno, Inicio, Final);
            //gvPresentes.DataBind();
            int Presentes = Datos.FiltrarPresentes(turno, Inicio, Final);
            int Cantidad = Datos.Cantidad();
            float Resultado = Presentes * 100f / Cantidad;
            lblPresentes.Text = Resultado + "%";

        }
    }
}