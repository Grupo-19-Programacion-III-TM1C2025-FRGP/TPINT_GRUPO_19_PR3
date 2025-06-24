using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using Vistas.Clases;

namespace Vistas
{
    public partial class Pacientes : System.Web.UI.Page
    {
        NegocioPaciente negocioP = new NegocioPaciente();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //AuxiliarVistas.ValidarSesionAdministrador();
            //lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            if (!IsPostBack)
            {
                CargarProvincias();
              
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
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
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

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Paciente paciente = new Paciente(
                int.Parse(txtDNI.Text),
                txtNombre.Text,
                txtApellido.Text,
               Convert.ToChar(txtSexo.Text.ToUpper()),
                txtNacionalidad.Text,
                DateTime.Parse(txtFechaNacimiento.Text),
                txtDireccion.Text,
                int.Parse(ddlLocalidad.SelectedValue),
                txtEmail.Text,
                txtTelefono.Text);


            // Llamar a la capa de negocio
            NegocioPaciente negocio = new NegocioPaciente();
            int resultado = negocio.agregarPaciente(paciente);

            if (resultado > 0)
                lblMensaje.Text = "Médico agregado con éxito.";
            else
                lblMensaje.Text = "Error al agregar médico.";
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int dni = Convert.ToInt32(gvPacientes.DataKeys[e.NewEditIndex].Value);

            string nombre = gvPacientes.Rows[e.NewEditIndex].Cells[2].Text;
            string apellido = gvPacientes.Rows[e.NewEditIndex].Cells[3].Text;
            Char sexo = Char.Parse(gvPacientes.Rows[e.NewEditIndex].Cells[4].Text);
            string nacionalidad = gvPacientes.Rows[e.NewEditIndex].Cells[5].Text;
            DateTime fecha = DateTime.Parse(gvPacientes.Rows[e.NewEditIndex].Cells[6].Text);
            string direccion = gvPacientes.Rows[e.NewEditIndex].Cells[7].Text;
            int idLocalidad = Convert.ToInt32(gvPacientes.Rows[e.NewEditIndex].Cells[8].Text);
            string email = gvPacientes.Rows[e.NewEditIndex].Cells[9].Text;
            string telefono = gvPacientes.Rows[e.NewEditIndex].Cells[10].Text;

            Paciente paciente = new Paciente(dni, nombre, apellido, sexo, nacionalidad, fecha, direccion, idLocalidad, email, telefono);

            negocioP.modificarPaciente(paciente);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            e.Cancel = true;

            int dni = Convert.ToInt32(gvPacientes.DataKeys[e.RowIndex].Value);

            negocioP.bajaPaciente(dni);
        }

        protected void gvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvPacientes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}