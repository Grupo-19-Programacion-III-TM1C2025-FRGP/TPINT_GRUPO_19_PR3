using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using MiProyecto;
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

                CargarGvPacientes();

                ddlSexo.Items.Insert(0, new ListItem("Seleccione Sexo", "0"));
                CargarProvincias();
              
            }
        }
        private void CargarGvPacientes()
        {
            gvPacientes.DataSource = negocioP.getTabla(); // retorna DataTable
            gvPacientes.DataBind();
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
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
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

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            //Paciente paciente = new Paciente(
            //    int.Parse(txtDNI.Text),
            //    txtNombre.Text,
            //    txtApellido.Text,
            //   Convert.ToChar(txtSexo.Text.ToUpper()),
            //    txtNacionalidad.Text,
            //    DateTime.Parse(txtFechaNacimiento.Text),
            //    txtDireccion.Text,
            //    int.Parse(ddlLocalidad.SelectedValue),
            //    txtEmail.Text,
            //    txtTelefono.Text);


            //// Llamar a la capa de negocio
            //NegocioPaciente negocio = new NegocioPaciente();
            //int resultado = negocio.agregarPaciente(paciente);

            //if (resultado > 0)
            //    lblMensaje.Text = "Paciente agregado con éxito.";
            //else
            //    lblMensaje.Text = "Error al agregar paciente.";
        }

        protected void gvPacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPacientes.EditIndex = -1;
            gvPacientes.DataSource = negocioP.getTabla();
            gvPacientes.DataBind();
        }

        protected void gvPacientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string dni = gvPacientes.DataKeys[e.RowIndex].Value.ToString();

            negocioP.bajaPaciente(dni); // esto llama al SP desde Datos

            gvPacientes.DataSource = negocioP.getTabla();
            gvPacientes.DataBind();

            e.Cancel = true;
        }

        protected void gvPacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string dni = gvPacientes.DataKeys[e.RowIndex].Value.ToString();

            GridViewRow fila = gvPacientes.Rows[e.RowIndex];

            string nombre = ((TextBox)fila.Cells[2].Controls[0]).Text;
            string apellido = ((TextBox)fila.Cells[3].Controls[0]).Text;
            char sexo = Char.Parse(((TextBox)fila.Cells[4].Controls[0]).Text);
            string nacionalidad = ((TextBox)fila.Cells[5].Controls[0]).Text;
            DateTime fechaNac = DateTime.Parse(((TextBox)fila.Cells[6].Controls[0]).Text);
            string direccion = ((TextBox)fila.Cells[7].Controls[0]).Text;
            string email = ((TextBox)fila.Cells[8].Controls[0]).Text;
            string telefono = ((TextBox)fila.Cells[9].Controls[0]).Text;
            int provincia = int.Parse(((TextBox)fila.Cells[10].Controls[0]).Text);
            int localidad = int.Parse(((TextBox)fila.Cells[11].Controls[0]).Text);
            bool estado = ((CheckBox)fila.Cells[12].Controls[0]).Checked;

            Paciente paciente = new Paciente(dni, nombre, apellido, sexo, nacionalidad, fechaNac, direccion, provincia, localidad, email, telefono, estado);

            negocioP.modificarPaciente(paciente);

            gvPacientes.EditIndex = -1;
            gvPacientes.DataSource = negocioP.getTabla();
            gvPacientes.DataBind();

            e.Cancel = true;
        }

        protected void gvPacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPacientes.EditIndex = e.NewEditIndex;
            gvPacientes.DataSource = negocioP.getTabla();
            gvPacientes.DataBind();
        }

        //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    int dni = Convert.ToInt32(gvPacientes.DataKeys[e.NewEditIndex].Value);

        //    string nombre = gvPacientes.Rows[e.NewEditIndex].Cells[2].Text;
        //    string apellido = gvPacientes.Rows[e.NewEditIndex].Cells[3].Text;
        //    Char sexo = Char.Parse(gvPacientes.Rows[e.NewEditIndex].Cells[4].Text);
        //    string nacionalidad = gvPacientes.Rows[e.NewEditIndex].Cells[5].Text;
        //    DateTime fecha = DateTime.Parse(gvPacientes.Rows[e.NewEditIndex].Cells[6].Text);
        //    string direccion = gvPacientes.Rows[e.NewEditIndex].Cells[7].Text;
        //    int idLocalidad = Convert.ToInt32(gvPacientes.Rows[e.NewEditIndex].Cells[8].Text);
        //    string email = gvPacientes.Rows[e.NewEditIndex].Cells[9].Text;
        //    string telefono = gvPacientes.Rows[e.NewEditIndex].Cells[10].Text;

        //    Paciente paciente = new Paciente(dni, nombre, apellido, sexo, nacionalidad, fecha, direccion, idLocalidad, email, telefono);

        //    negocioP.modificarPaciente(paciente);
        //}

        //protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{

        //    e.Cancel = true;

        //    int dni = Convert.ToInt32(gvPacientes.DataKeys[e.RowIndex].Value);

        //    // Falta mensaje de confirmación
        //    negocioP.bajaPaciente(dni);

        //    gvPacientes.DataBind();
        //}

        //protected void gvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        //{

        //}

        //protected void gvPacientes_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}
    }
}