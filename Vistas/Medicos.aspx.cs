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
       

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
           // AuxiliarVistas.ValidarSesionAdministrador();
           //lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            if (!IsPostBack)
            {
                CargarGvMedicos();

                ddlSexo.Items.Insert(0, new ListItem("Seleccione Sexo", "0"));
                ddlHoraEntrada.Items.Insert(0, new ListItem("Seleccione hora de entrada", "0"));
                ddlHoraSalida.Items.Insert(0, new ListItem("Seleccione hora de salida", "0"));

                CargarProvincias();
                CargarEspecialidades();
            }
        }

        private void CargarGvMedicos()
        {
            gvMedicos.DataSource = negocioMedico.getTabla(); // retorna DataTable
            gvMedicos.DataBind();
        }

        private void CargarProvincias()
        {
            NegocioProvincia negocio = new NegocioProvincia();
            ddlProvincia.DataSource = negocio.getTabla();
            ddlProvincia.DataTextField = "NombreProvincia_Pr";
            ddlProvincia.DataValueField = "CodProvincia_Pr";
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
            ddlEspecialidad.DataTextField = "NombreEspecialidad_Es";
            ddlEspecialidad.DataValueField = "CodEspecialidad_Es";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione una especialidad", "0"));
        }

        

        //private void CargarHorarios()
        //{
        //    NegocioHorario negocio = new NegocioHorario();
        //    ddlHoraSalida.DataSource = negocio.getTabla();
        //    ddlHoraSalida.DataTextField = "Horario_HT";
        //    ddlHoraSalida.DataValueField = "CodHorarioTurno_HT";
        //    ddlHoraSalida.DataBind();
        //    ddlHoraSalida.Items.Insert(0, new ListItem("Seleccione un horario", "0"));
        //}
        //}

        //protected void gvMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{

        //    e.Cancel = true;

        //    string legajo = gvMedicos.DataKeys[e.RowIndex].Value.ToString();

        //    //Falta mensaje de confirmación

        //    negocioMedico.bajaMedico(legajo);

        //    gvMedicos.DataBind();
        //}

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            //Medico medico = new Medico(
            //    int.Parse(txtDNI.Text),
            //    txtNombre.Text,
            //    txtApellido.Text,
            //    //Convert.ToChar(txtSexo.Text.ToUpper()),
            //    txtNacionalidad.Text,
            //    DateTime.Parse(txtNacimiento.Text),
            //    int.Parse(ddlLocalidad.SelectedValue),
            //    int.Parse(ddlEspecialidad.SelectedValue),
            //    //int.Parse(ddlDiaAtencion.SelectedValue),
            //    int.Parse(ddlHoraSalida.SelectedValue),
            //    txtEmail.Text,
            //    txtTelefono.Text
            //);


            // Llamar a la capa de negocio
            NegocioMedico negocio = new NegocioMedico();
            //int resultado = negocio.agregarMedico(medico);

            //if (resultado > 0)
            //    lblMensaje.Text = "Médico agregado con éxito.";
            //else
            //    lblMensaje.Text = "Error al agregar médico.";
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
            //txtSexo.Text = string.Empty;
            txtNacionalidad.Text = string.Empty;
            txtNacimiento.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            //ddlDiaAtencion.SelectedIndex = 0;
            ddlEspecialidad.SelectedIndex = 0;
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
            bool estado = ((CheckBox)fila.Cells[15].Controls[0]).Checked;

            Medico medico = new Medico(legajo, dni, nombre, apellido, sexo, nacionalidad, fechaNac, provincia, localidad, especialidad, email, telefono, horaEntrada, horaSalida, estado);

            negocioMedico.modificarMedico(medico);

            gvMedicos.EditIndex = -1;
            gvMedicos.DataSource = negocioMedico.getTabla();
            gvMedicos.DataBind();

            e.Cancel = true;
        }

        protected void gvMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedicos.EditIndex = e.NewEditIndex;
            gvMedicos.DataSource = negocioMedico.getTabla();
            gvMedicos.DataBind();
        }

        protected void gvMedicos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedicos.EditIndex = -1;
            gvMedicos.DataSource = negocioMedico.getTabla();
            gvMedicos.DataBind();
        }

        protected void gvMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string legajo = gvMedicos.DataKeys[e.RowIndex].Value.ToString();

            negocioMedico.bajaMedico(legajo); // esto llama al SP desde Datos

            gvMedicos.DataSource = negocioMedico.getTabla();
            gvMedicos.DataBind();

            e.Cancel = true;
        }

        //    protected void gvMedicos_SelectedIndexChanged(object sender, EventArgs e)
        //    {

        //    }

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