using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vistas.Clases;
using System.Data;

using Entidades;
using Negocio;

namespace Vistas
{
    public partial class AsignacionTurno : System.Web.UI.Page
    {
        NegocioEspecialidad especialidades = new NegocioEspecialidad();
        NegocioHorario horario = new NegocioHorario();
        NegocioMedico medico = new NegocioMedico();
        NegocioTurno negocioTurno = new NegocioTurno();
        NegocioPaciente negocioPaciente = new NegocioPaciente();

        DataTable table;
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            AuxiliarVistas.ValidarSesionAdministrador();
            lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            if (!IsPostBack)
            {
                // ddl especialidades
                table = especialidades.getTabla();
                ddlEspecialidad.DataSource = table;
                ddlEspecialidad.DataTextField = "Especialidad";
                ddlEspecialidad.DataValueField = "Codigo";
                ddlEspecialidad.DataBind();
                ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione especialidad", "0"));

                // ddl horarios
                table = horario.getTabla();
                ddlHorario.DataSource = table;
                ddlHorario.DataTextField = "Horario_HT";
                ddlHorario.DataValueField = "CodHorarioTurno_HT";
                ddlHorario.DataBind();
                ddlHorario.Items.Insert(0, new ListItem("Seleccione horario", "0"));
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
            ddlMedico.DataTextField = "Apellido_Me";
            ddlMedico.DataValueField = "Legajo_Me";
            ddlMedico.DataBind();
            ddlMedico.Items.Insert(0, new ListItem("Seleccione médico", "0"));
        }
        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarDdlMedicos();
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //! pasar las validaciones al negocio

            // Verificar existencia de paciente

            string DNIPaciente = txtDNIPaciente.Text;

            if (negocioPaciente.ContarPacientes(DNIPaciente) == 0)
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "No se econtró Paciente registrado con el DNI ingresado. Por favor verificar o dar de alta";
                return;
            }

            // Chequear disponibilidad (paciente)

            DateTime fechaTurno = DateTime.Parse(txtFecha.Text);
            int codHorario = int.Parse(ddlHorario.SelectedValue.ToString());

            if (negocioPaciente.ContarTurnos(DNIPaciente, codHorario, fechaTurno) > 0)
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "El paciente ya tiene asignado un turno esta fecha y horario";
                return;
            }

            // Chequear disponibilidad (médico)

            string legajoMedico = ddlMedico.SelectedValue.ToString();

            if(medico.ContarTurnos(legajoMedico, codHorario, fechaTurno) > 0)
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "El médico ya tiene asignado un turno esta fecha y horario";
                return;
            }

            Turno turno = new Turno(legajoMedico, fechaTurno, codHorario, DNIPaciente);

            int filasAfectadas = negocioTurno.AgregarTurno(turno);

            if(filasAfectadas == 1)
            {
                lblMensaje.ForeColor = System.Drawing.Color.Green;
                lblMensaje.Text = "Turno asignado correctamente";
            }
            else
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "Ocurrió un error al asignar el turno, intente verificar los datos ingresados";
            }
            limpiarFormulario();
        }
        protected void limpiarFormulario()
        {
            ddlEspecialidad.SelectedIndex = 0;
            ddlMedico.SelectedIndex = 0;
            txtFecha.Text = string.Empty;
            ddlHorario.SelectedIndex = 0;
            txtDNIPaciente.Text = string.Empty;
        }
        protected void txtLimpiar_Click(object sender, EventArgs e)
        {
            limpiarFormulario();
        }
    }
}