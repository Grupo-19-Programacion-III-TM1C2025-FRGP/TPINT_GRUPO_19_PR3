using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Vistas.Clases;
using Entidades;
using Vistas;

namespace MiProyecto
{
    public partial class Medicos : Page
    {
        NegocioMedico negocioMedico = new NegocioMedico();
       

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
           // AuxiliarVistas.ValidarSesionAdministrador();
           //lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

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
           // e.Cancel = true;

            int legajo = Convert.ToInt32(gvMedicos.DataKeys[e.NewEditIndex].Value);

            string nombre = gvMedicos.Rows[e.NewEditIndex].Cells[2].Text;
            string apellido = gvMedicos.Rows[e.NewEditIndex].Cells[3].Text;
            int DNI = int.Parse(gvMedicos.Rows[e.NewEditIndex].Cells[4].Text);

            char sexo = Char.Parse(gvMedicos.Rows[e.NewEditIndex].Cells[5].Text);
            string nacionalidad = gvMedicos.Rows[e.NewEditIndex].Cells[6].Text;
            DateTime fechanacimiento = DateTime.Parse(gvMedicos.Rows[e.NewEditIndex].Cells[7].Text);
            int localidad = int.Parse(gvMedicos.Rows[e.NewEditIndex].Cells[8].Text);
            int especialidad = int.Parse(gvMedicos.Rows[e.NewEditIndex].Cells[9].Text);
            int diasAtencion = int.Parse(gvMedicos.Rows[e.NewEditIndex].Cells[10].Text);
            int horario = int.Parse(gvMedicos.Rows[e.NewEditIndex].Cells[11].Text);
            string email = gvMedicos.Rows[e.NewEditIndex].Cells[12].Text;
            string telefono = gvMedicos.Rows[e.NewEditIndex].Cells[13].Text;

            Medico medico = new Medico(legajo, DNI, nombre, apellido, sexo, nacionalidad, fechanacimiento, localidad, especialidad, diasAtencion, horario, email, telefono);

            negocioMedico.modificarMedico(medico);
        }

        protected void gvMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            e.Cancel = true;

            int legajo = Convert.ToInt32(gvMedicos.DataKeys[e.RowIndex].Value);

            negocioMedico.bajaMedico(legajo);
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


        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }


        private void LimpiarFormulario()
        {
            txtDNI.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtSexo.Text = string.Empty;
            txtNacionalidad.Text = string.Empty;
            txtNacimiento.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            ddlDiaAtencion.SelectedIndex = 0;
            ddlEspecialidad.SelectedIndex = 0;
            ddlHorarios.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;
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