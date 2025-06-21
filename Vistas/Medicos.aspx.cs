using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Vistas.Clases;
using Entidades;

namespace MiProyecto
{
    public partial class Medicos : Page
    {
        // Lista estática para simular una base de datos
        private static List<Medico> listaMedicos = new List<Medico>();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            AuxiliarVistas.ValidarSesionAdministrador();
            lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            if (!IsPostBack)
            {
                CargarProvincias();
                CargarEspecialidades();
                CargarDias();
                CargarHorarios();
            }
        }

        private void CargarProvincias()
        {
            NegocioProvincia negocio = new NegocioProvincia();
            ddlProvincia.DataSource = negocio.getTabla();
            ddlProvincia.DataTextField = "NombreProvincia";
            ddlProvincia.DataValueField = "IDProvincia";
            ddlProvincia.DataBind();
            ddlProvincia.Items.Insert(0, new ListItem("Seleccione una provincia", "0"));
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idProvincia = int.Parse(ddlProvincia.SelectedValue);
            NegocioLocalidad negocio = new NegocioLocalidad();
            ddlLocalidad.DataSource = negocio.getLocalidadesPorProvincia(idProvincia);
            ddlLocalidad.DataTextField = "NombreLocalidad";
            ddlLocalidad.DataValueField = "IDLocalidad";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("Seleccione una localidad", "0"));
        }

        private void CargarEspecialidades()
        {
            NegocioEspecialidad negocio = new NegocioEspecialidad();
            ddlEspecialidad.DataSource = negocio.getTabla();
            ddlEspecialidad.DataTextField = "NombreEspecialidad_Es";
            ddlEspecialidad.DataValueField = "CodEspecialidad_Es";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione una especialidad", "0"));
        }

        private void CargarDias()
        {
            NegocioDiaAtencion negocio = new NegocioDiaAtencion();
            ddlDiaAtencion.DataSource = negocio.getTabla();
            ddlDiaAtencion.DataTextField = "NombreDia_DA";
            ddlDiaAtencion.DataValueField = "CodDiaAtencion_DA";
            ddlDiaAtencion.DataBind();
            ddlDiaAtencion.Items.Insert(0, new ListItem("Seleccione un día", "0"));
        }

        private void CargarHorarios()
        {
            NegocioHorario negocio = new NegocioHorario();
            ddlHorarios.DataSource = negocio.getTabla();
            ddlHorarios.DataTextField = "HoraInicio_HA";
            ddlHorarios.DataValueField = "CodHorarioAtencion_HA";
            ddlHorarios.DataBind();
            ddlHorarios.Items.Insert(0, new ListItem("Seleccione un horario", "0"));
        }


        protected void gvMedicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Evento de edición del GridView
        }

        protected void gvMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Evento de eliminación del GridView
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Medico medico = new Medico(
                int.Parse(txtDNI.Text),
                txtNombre.Text,
                txtApellido.Text,
                Convert.ToChar(txtSexo.Text.ToUpper()),
                txtNacionalidad.Text,
                DateTime.Parse(txtNacimiento.Text),
                int.Parse(ddlLocalidad.SelectedValue),
                int.Parse(ddlEspecialidad.SelectedValue),
                int.Parse(ddlDiaAtencion.SelectedValue),
                int.Parse(ddlHorarios.SelectedValue),
                txtEmail.Text,
                txtTelefono.Text);


            // Llamar a la capa de negocio
            NegocioMedico negocio = new NegocioMedico();
            int resultado = negocio.agregarMedico(medico);

            if (resultado > 0)
                lblMensaje.Text = "Médico agregado con éxito.";
            else
                lblMensaje.Text = "Error al agregar médico.";
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            NegocioMedico negocio = new NegocioMedico();
            int dni = int.Parse(txtDNI.Text);
            int legajo = negocio.traerLegajoPorDNI(dni);

            if (legajo == -1)
            {
                lblMensaje.Text = "No se encontró el médico con ese DNI.";
                return;
            }

            Medico medico = new Medico(
                legajo,
                dni,
                txtNombre.Text,
                txtApellido.Text,
                Convert.ToChar(txtSexo.Text.ToUpper()),
                txtNacionalidad.Text,
                DateTime.Parse(txtNacimiento.Text),
                int.Parse(ddlLocalidad.SelectedValue),
                int.Parse(ddlEspecialidad.SelectedValue),
                int.Parse(ddlDiaAtencion.SelectedValue),
                int.Parse(ddlHorarios.SelectedValue),
                txtEmail.Text,
                txtTelefono.Text
            );

            int resultado = negocio.modificarMedico(medico);

            if (resultado > 0)
                lblMensaje.Text = "Médico modificado correctamente.";
            else
                lblMensaje.Text = "Error al modificar médico.";
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            // Lógica para limpiar formulario
        }

        protected void rptMedicos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Lógica para manejar comandos del repeater (editar/eliminar)
        }

        private void CargarMedicos()
        {
            // Lógica para cargar lista de medicos
        }

        private void LimpiarFormulario()
        {
            // Lógica para limpiar formulario
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
        }

        protected void gvMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

    // Clase para representar un medico
    /*public class Medico
    {
        public string Legajo { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Especialidad { get; set; }
        public string Horarios { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
    }*/
}