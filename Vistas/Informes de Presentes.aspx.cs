using Negocio;
using System;
using System.Collections.Generic;
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
    }
}