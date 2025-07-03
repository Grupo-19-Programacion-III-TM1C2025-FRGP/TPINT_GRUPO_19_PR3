using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vistas.Clases;
using System.Data;

using Negocio;

namespace Vistas
{
    public partial class AsignacionTurno : System.Web.UI.Page
    {
        NegocioEspecialidad especialidades = new NegocioEspecialidad();
        NegocioHorario horario = new NegocioHorario();
        NegocioMedico medico = new NegocioMedico();

        DataTable table;

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //AuxiliarVistas.ValidarSesionAdministrador();
            //lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            if (!IsPostBack)
            {
                // ddl especialidades
                table = especialidades.getTabla();
                ddlEspecialidad.DataSource = table;
                ddlEspecialidad.DataTextField = "NombreEspecialidad_Es";
                ddlEspecialidad.DataValueField = "CodEspecialidad_Es";
                ddlEspecialidad.DataBind();

                // ddl horarios
                table = horario.getTabla();
                ddlHorario.DataSource = table;
                ddlHorario.DataTextField = "Horario_HT";
                ddlHorario.DataValueField = "CodHorarioTurno_HT";
                ddlHorario.DataBind();
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
        }

        // ddl médicos
        protected void ActualizarDdlMedicos()
        {
            string codEspecialidad = ddlEspecialidad.SelectedValue.ToString();

            table = medico.getTablaFiltrada(codEspecialidad);
            ddlMedico.DataSource = table;
            ddlMedico.DataTextField = "NombreMedico";
            ddlMedico.DataValueField = "LegajoMedico";
            ddlMedico.DataBind();
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarDdlMedicos();
        }
    }
}