using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vistas;
using Vistas.Clases;
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
        NegocioHorario negocioHorario = new NegocioHorario();

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

                CargarProvincias();
                CargarEspecialidades();
                CargarHorariosEntrada();
            }
        }
        private void CargarGvMedicos()
        {
            gvMedicos.DataSource = negocioMedico.getTablaConUsuarios(); // retorna DataTable
            gvMedicos.DataBind();
        }
        private void CargarProvincias()
        {
            ddlProvincia.DataSource = negocioProvincia.getTabla();
            ddlProvincia.DataTextField = "Provincia";
            ddlProvincia.DataValueField = "Codigo";
            ddlProvincia.DataBind();
            ddlProvincia.Items.Insert(0, new ListItem("Seleccione una provincia", "0"));

            ddlProvinciasFiltro.DataSource = negocioProvincia.getTabla();
            ddlProvinciasFiltro.DataTextField = "Provincia";
            ddlProvinciasFiltro.DataValueField = "Codigo";
            ddlProvinciasFiltro.DataBind();
            ddlProvinciasFiltro.Items.Insert(0, new ListItem("Todas las provincias", "0"));
        }
        private void CargarHorariosEntrada()
        {
            ddlHoraEntrada.DataSource = negocioHorario.getTabla();
            ddlHoraEntrada.DataTextField = "Horario_HT";
            ddlHoraEntrada.DataValueField = "CodHorarioTurno_HT";
            ddlHoraEntrada.DataBind();
            ddlHoraEntrada.Items.Insert(0, new ListItem("Seleccione hora de entrada", "0"));
        }
        private void CargarEspecialidades()
        {   //alta medico
            ddlEspecialidad.DataSource = negocioEspecialidad.getTabla();
            ddlEspecialidad.DataTextField = "Especialidad";
            ddlEspecialidad.DataValueField = "Codigo";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione una especialidad", "0"));
            //filtrar por especialidad
            ddlEspecialidadesFiltrar.DataSource = negocioEspecialidad.getTabla();
            ddlEspecialidadesFiltrar.DataTextField = "Especialidad";
            ddlEspecialidadesFiltrar.DataValueField = "Codigo";
            ddlEspecialidadesFiltrar.DataBind();
            ddlEspecialidadesFiltrar.Items.Insert(0, new ListItem("Todas las especialidades", "0"));
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
            int horaEntrada = int.Parse(ddlHoraEntrada.SelectedValue);
            int horaSalida = int.Parse(ddlHoraSalida.SelectedValue);
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
            txtUsuario.Text = string.Empty;
            txtContrasenia.Text = string.Empty;
            txtRepetirContrasenia.Text = string.Empty;
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
            GridViewRow fila = gvMedicos.Rows[e.RowIndex];

            string legajo = gvMedicos.DataKeys[e.RowIndex].Value.ToString();

            // Verificar si el nombre de usuario está disponible

            //datos del usuario
            string usuario = ((TextBox)fila.Cells[15].Controls[0]).Text;
            string contrasenia = ((TextBox)fila.Cells[16].Controls[0]).Text;

            if (negocioUsuario.VerificarUsuario(legajo, usuario) == 0)
            {
                negocioUsuario.ModificarUsuario(legajo, usuario, contrasenia);
            }
            else
            {
                labelUsername.Text = "Nombre de usuario no disponible";
            }

            string dni = ((TextBox)fila.Cells[2].Controls[0]).Text;
            string nombre = ((TextBox)fila.Cells[3].Controls[0]).Text;
            string apellido = ((TextBox)fila.Cells[4].Controls[0]).Text;
            char sexo = Char.Parse(((TextBox)fila.Cells[5].Controls[0]).Text);
            string nacionalidad = ((TextBox)fila.Cells[6].Controls[0]).Text;
            DateTime fechaNac = DateTime.Parse(((TextBox)fila.Cells[7].Controls[0]).Text);
            string email = ((TextBox)fila.Cells[8].Controls[0]).Text;
            string telefono = ((TextBox)fila.Cells[9].Controls[0]).Text;
            int horaEntrada = int.Parse(((TextBox)fila.Cells[10].Controls[0]).Text);
            int horaSalida = int.Parse(((TextBox)fila.Cells[11].Controls[0]).Text);
            int especialidad = int.Parse(((TextBox)fila.Cells[12].Controls[0]).Text);
            int provincia = int.Parse(((TextBox)fila.Cells[13].Controls[0]).Text);
            int localidad = int.Parse(((TextBox)fila.Cells[14].Controls[0]).Text);

            bool estado = ((CheckBox)fila.Cells[17].Controls[0]).Checked;

            Medico medico = new Medico(legajo, dni, nombre, apellido, sexo, nacionalidad, fechaNac, provincia, localidad, especialidad, email, telefono, horaEntrada, horaSalida, estado);

            int filasAfectadas = negocioMedico.modificarMedico(medico);

            gvMedicos.EditIndex = -1;
            gvMedicos.DataSource = negocioMedico.getTablaConUsuarios();
            gvMedicos.DataBind();

            if (filasAfectadas == 1)
            {
                lblMensajeExito.Text = "Médico actualizado con éxito";
            }
            else
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensajeExito.Text = "Error al actualizar los datos del médico";
            }
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
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idProvincia = int.Parse(ddlProvincia.SelectedValue);

            ddlLocalidad.DataSource = negocioLocalidad.getLocalidadesPorProvincia(idProvincia);
            ddlLocalidad.DataTextField = "NombreLocalidad_Lo";
            ddlLocalidad.DataValueField = "CodLocalidad_Lo";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("Seleccione una localidad", "0"));
        }

        // Por ahora solo se actualiza al cambiar el index de la provincia 
        protected void ddlHoraEntrada_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idHoraEntrada = int.Parse(ddlHoraEntrada.SelectedValue);
            CargarDdlHorariosSalida(idHoraEntrada);
            
        }
        protected void CargarDdlHorariosSalida(int codHoraEntrada)
        {
            ddlHoraSalida.DataSource = negocioHorario.GetTablaSalida(codHoraEntrada);
            ddlHoraSalida.DataTextField = "Horario_HT";
            ddlHoraSalida.DataValueField = "CodHorarioTurno_HT";
            ddlHoraSalida.DataBind();
            ddlHoraSalida.Items.Insert(0, new ListItem("Seleccione hora de salida", "0"));
        }

        protected void ddlEspecialidadesFiltrar_SelectedIndexChanged(object sender, EventArgs e)
        {
            int codEspecialidad = int.Parse(ddlEspecialidadesFiltrar.SelectedValue);
            gvMedicos.DataSource = negocioMedico.getTablaFiltrada(codEspecialidad);
            gvMedicos.DataBind();
        }
        protected void ddlProvinciasFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            int codProvincia = int.Parse(ddlProvinciasFiltro.SelectedValue);
            gvMedicos.DataSource = negocioMedico.FiltroProvincia(codProvincia);
            gvMedicos.DataBind();
        }

        protected void btnDNI_Click(object sender, EventArgs e)
        {
            if(txtDNI2.Text == "")
            {
                CargarGvMedicos();
            }
            else
            {
                int dni = Convert.ToInt32(txtDNI2.Text);
                gvMedicos.DataSource = negocioMedico.BuscarDNI(dni);
                gvMedicos.DataBind();
                txtDNI2.Text = "";
            }
        }

        protected void btnNombre_Click(object sender, EventArgs e)
        {
            if(txtNombre2.Text == "")
            {
                CargarGvMedicos();
            }
            else
            {
                gvMedicos.DataSource = negocioMedico.BuscarNombre(txtNombre2.Text);
                gvMedicos.DataBind();
                txtNombre2.Text = "";
            }
            
        }
    }
}