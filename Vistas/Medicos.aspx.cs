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
using System.Data;
using static System.Net.Mime.MediaTypeNames;

namespace MiProyecto
{
    public partial class Medicos : Page
    {
        NegocioMedico negocioMedico = new NegocioMedico();
        NegocioProvincia negocioProvincia = new NegocioProvincia();
        NegocioLocalidad negocioLocalidad = new NegocioLocalidad();
        NegocioEspecialidad negocioEspecialidad = new NegocioEspecialidad();
        NegocioUsuario negocioUsuario = new NegocioUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            AuxiliarVistas.ValidarSesionAdministrador();
            lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            if (!IsPostBack)
            {
                CargarGvMedicos();
                CargarGvLocalidades();
                CargarGvProvincia();
                CargarGvEspecialidades();

                ddlSexo.Items.Insert(0, new ListItem("Seleccione Sexo", "0"));
                ddlHoraEntrada.Items.Insert(0, new ListItem("Seleccione hora de entrada", "0"));
                ddlHoraSalida.Items.Insert(0, new ListItem("Seleccione hora de salida", "0"));

                CargarProvincias();
                CargarEspecialidades();
            }
        }
        private void CargarGvMedicos()
        {
            gvMedicos.DataSource = negocioMedico.getTablaConUsuarios(); // retorna DataTable
            gvMedicos.DataBind();
        }
        private void CargarProvincias()
        {
            NegocioProvincia negocio = new NegocioProvincia();
            ddlProvincia.DataSource = negocio.getTabla();
            ddlProvincia.DataTextField = "Provincia";
            ddlProvincia.DataValueField = "Codigo";
            ddlProvincia.DataBind();
            ddlProvincia.Items.Insert(0, new ListItem("Seleccione una provincia", "0"));
        }
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idProvincia = int.Parse(ddlProvincia.SelectedValue);
            NegocioLocalidad negocio = new NegocioLocalidad();
            ddlLocalidad.DataSource = negocio.getLocalidadesPorProvincia(idProvincia);
            ddlLocalidad.DataTextField = "NombreLocalidad_Lo";
            ddlLocalidad.DataValueField = "CodLocalidad_Lo";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("Seleccione una localidad", "0"));
        }
        private void CargarEspecialidades()
        {
            NegocioEspecialidad negocio = new NegocioEspecialidad();
            ddlEspecialidad.DataSource = negocio.getTabla();
            ddlEspecialidad.DataTextField = "Especialidad";
            ddlEspecialidad.DataValueField = "Codigo";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione una especialidad", "0"));
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string dni = txtDNI.Text;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            Char sexo = Convert.ToChar(ddlSexo.SelectedValue.ToUpper());
            string nacionalidad = txtNacionalidad.Text;
            DateTime fechaNacimiento = DateTime.Parse(txtNacimiento.Text);
            int provincia = int.Parse(ddlProvincia.SelectedValue);
            int localidad = int.Parse(ddlLocalidad.SelectedValue);
            int especialidad = int.Parse(ddlEspecialidad.SelectedValue);
            string horaEntrada = ddlHoraEntrada.SelectedValue;
            string horaSalida = ddlHoraSalida.SelectedValue;
            string email = txtEmail.Text;
            string telefono = txtTelefono.Text;
            string usuario = txtUsuario.Text;
            string contrasenia = txtContrasenia.Text;

            // Instanciar objeto médico
            Medico medico = new Medico(dni, nombre, apellido, sexo, nacionalidad, fechaNacimiento, provincia, localidad, especialidad, email, telefono, horaEntrada, horaSalida, true);

            // Llamar a la capa de negocio con los nuevos parámetros
            int resultado = negocioMedico.agregarMedico(medico, usuario, contrasenia);

            if (resultado > 0)
                lblMensaje.Text = "Médico agregado con éxito.";
            else
                lblMensaje.Text = "Error al agregar médico.";

            LimpiarFormulario();
            CargarGvMedicos();
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
            ddlSexo.SelectedIndex = 0;
            txtNacionalidad.Text = string.Empty;
            txtNacimiento.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            ddlEspecialidad.SelectedIndex = 0;
            ddlHoraEntrada.SelectedIndex = 0;
            ddlHoraSalida.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
        }
        protected void gvMedicos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string legajo = gvMedicos.DataKeys[e.RowIndex].Value.ToString();

            GridViewRow fila = gvMedicos.Rows[e.RowIndex];

            string dni = ((TextBox)fila.Cells[2].Controls[0]).Text;
            string nombre = ((TextBox)fila.Cells[3].Controls[0]).Text;
            string apellido = ((TextBox)fila.Cells[4].Controls[0]).Text;
            char sexo = Char.Parse(((TextBox)fila.Cells[5].Controls[0]).Text);
            string nacionalidad = ((TextBox)fila.Cells[6].Controls[0]).Text;
            DateTime fechaNac = DateTime.Parse(((TextBox)fila.Cells[7].Controls[0]).Text);
            string email = ((TextBox)fila.Cells[8].Controls[0]).Text;
            string telefono = ((TextBox)fila.Cells[9].Controls[0]).Text;
            string horaEntrada = ((TextBox)fila.Cells[10].Controls[0]).Text;
            string horaSalida = ((TextBox)fila.Cells[11].Controls[0]).Text;
            int especialidad = int.Parse(((TextBox)fila.Cells[12].Controls[0]).Text);
            int provincia = int.Parse(((TextBox)fila.Cells[13].Controls[0]).Text);
            int localidad = int.Parse(((TextBox)fila.Cells[14].Controls[0]).Text);

            //datos del usuario
            string usuario = ((TextBox)fila.Cells[15].Controls[0]).Text;
            string contrasenia = ((TextBox)fila.Cells[16].Controls[0]).Text;

            bool estado = ((CheckBox)fila.Cells[17].Controls[0]).Checked;

            Medico medico = new Medico(legajo, dni, nombre, apellido, sexo, nacionalidad, fechaNac, provincia, localidad, especialidad, email, telefono, horaEntrada, horaSalida, estado);

            negocioMedico.modificarMedico(medico);

            negocioUsuario.ModificarUsuario(legajo, usuario, contrasenia);

            gvMedicos.EditIndex = -1;
            gvMedicos.DataSource = negocioMedico.getTablaConUsuarios();
            gvMedicos.DataBind();

            e.Cancel = true;
        }
        protected void gvMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedicos.EditIndex = e.NewEditIndex;
            gvMedicos.DataSource = negocioMedico.getTablaConUsuarios();
            gvMedicos.DataBind();
        }
        protected void gvMedicos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedicos.EditIndex = -1;
            gvMedicos.DataSource = negocioMedico.getTablaConUsuarios();
            gvMedicos.DataBind();
        }
        protected void gvMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string legajo = gvMedicos.DataKeys[e.RowIndex].Value.ToString();

            negocioMedico.bajaMedico(legajo); // esto llama al SP desde Datos

            gvMedicos.DataSource = negocioMedico.getTablaConUsuarios();
            gvMedicos.DataBind();

            e.Cancel = true;
        }

        protected void txtUsuario_TextChanged(object sender, EventArgs e)
        {

        }
        private void CargarGvProvincia()
        {
            gvProvincia.DataSource = negocioProvincia.getTabla(); // retorna DataTable
            gvProvincia.DataBind();
        }

        private void CargarGvLocalidades()
        {
            gvLocalidad.DataSource = negocioLocalidad.getTabla(); // retorna DataTable
            gvLocalidad.DataBind();
        }
        private void CargarGvEspecialidades()
        {
            gvEspecialidad.DataSource = negocioEspecialidad.getTabla(); // retorna DataTable
            gvEspecialidad.DataBind();
        }

        protected void gvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedicos.PageIndex = e.NewPageIndex;
            CargarGvMedicos();
        }

        protected void gvProvincia_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProvincia.PageIndex = e.NewPageIndex;
            CargarGvProvincia();
        }

        protected void gvLocalidad_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLocalidad.PageIndex = e.NewPageIndex;
            CargarGvLocalidades();
        }

        protected void gvEspecialidad_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEspecialidad.PageIndex = e.NewPageIndex;
            CargarGvEspecialidades();
        }
    }
}