using Entidades;
using MiProyecto;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vistas.Clases;

namespace Vistas
{
    public partial class Pacientes : System.Web.UI.Page
    {
        NegocioPaciente negocioP = new NegocioPaciente();
        NegocioProvincia negocioProvincia = new NegocioProvincia();
        NegocioLocalidad negocioLocalidad = new NegocioLocalidad();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //AuxiliarVistas.ValidarSesionAdministrador();
            //lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            if (!IsPostBack)
            {
                CargarGvPacientes();
                CargarGvLocalidades();
                CargarGvProvincia();

                ddlSexo.Items.Insert(0, new ListItem("Seleccione Sexo", "0"));
                CargarProvincias();
            }
        }
        private void CargarGvPacientes()
        {
            gvPacientes.DataSource = negocioP.getTabla(); // retorna DataTable
            gvPacientes.DataBind();
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

        private void CargarProvincias()
        {
            NegocioProvincia negocio = new NegocioProvincia();
            ddlProvincia.DataSource = negocio.getTabla();
            ddlProvincia.DataTextField = "Provincia";
            ddlProvincia.DataValueField = "Codigo";
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
            string dni = txtDNI.Text;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            Char sexo = Convert.ToChar(ddlSexo.SelectedValue);
            string nacionalidad = txtNacionalidad.Text;
            DateTime fechaNac = DateTime.Parse(txtFechaNacimiento.Text);
            string direccion = txtDireccion.Text;
            int provincia = int.Parse(ddlProvincia.SelectedValue);
            int localidad = int.Parse(ddlLocalidad.SelectedValue);
            string email = txtEmail.Text;
            string telefono = txtTelefono.Text;

            Paciente paciente = new Paciente(dni, nombre, apellido, sexo, nacionalidad, fechaNac, direccion, provincia, localidad, email, telefono, true);

            // Llamar a la capa de negocio
            int resultado = negocioP.AgregarPaciente(paciente);

            if (resultado > 0)
                lblMensaje.Text = "Paciente agregado con éxito.";
            else
                lblMensaje.Text = "Error al agregar paciente.";

            LimpiarFormulario();
            CargarGvPacientes();
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
        private void LimpiarFormulario()
        {
            txtDNI.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            ddlSexo.SelectedIndex = 0;
            txtNacionalidad.Text = string.Empty;
            txtFechaNacimiento.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            ddlLocalidad.SelectedIndex = 0;
            ddlProvincia.SelectedIndex = 0;
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario(); 
        }

        protected void gvPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPacientes.PageIndex = e.NewPageIndex;
            CargarGvPacientes();
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

        protected void BsAs_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.BuenosAires();
            gvPacientes.DataBind();
        }

        protected void Cordoba_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Cordoba();
            gvPacientes.DataBind();
        }

        protected void SantaFe_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.SantaFe();
            gvPacientes.DataBind();
        }

        protected void Catamarca_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Catamarca();
            gvPacientes.DataBind();
        }

        protected void Chaco_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Chaco();
            gvPacientes.DataBind();
        }

        protected void Chubut_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Chubut();
            gvPacientes.DataBind();
        }

        protected void Corrientes_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Corrientes();
            gvPacientes.DataBind();
        }

        protected void EntreRios_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.EntreRios();
            gvPacientes.DataBind();
        }

        protected void Formosa_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Formosa();
            gvPacientes.DataBind();
        }

        protected void Jujuy_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Jujuy();
            gvPacientes.DataBind();
        }

        protected void LaPampa_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.LaPampa();
            gvPacientes.DataBind();
        }

        protected void LaRioja_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.LaRioja();
            gvPacientes.DataBind();
        }

        protected void Mendoza_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Mendoza();
            gvPacientes.DataBind();
        }

        protected void Misiones_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Misiones();
            gvPacientes.DataBind();
        }

        protected void Neuquen_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Neuquen();
            gvPacientes.DataBind();
        }

        protected void RioNegro_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.RioNegro();
            gvPacientes.DataBind();
        }

        protected void Salta_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Salta();
            gvPacientes.DataBind();
        }

        protected void SanJuan_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.SanJuan();
            gvPacientes.DataBind();
        }

        protected void SanLuis_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.SanLuis();
            gvPacientes.DataBind();
        }

        protected void SantaCruz_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.SantaCruz();
            gvPacientes.DataBind();
        }

        protected void SantiagoEstero_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.SantiagoEstero();
            gvPacientes.DataBind();
        }

        protected void TierraDelFuego_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.TierraDelFuego();
            gvPacientes.DataBind();
        }

        protected void Tucuman_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.Tucuman();
            gvPacientes.DataBind();
        }

        protected void Todo_Click(object sender, EventArgs e)
        {
            CargarGvPacientes();
        }

        protected void BuscarDNI_Click(object sender, EventArgs e)
        {
            int dni = Convert.ToInt32(txtDNI2.Text);
            gvPacientes.DataSource = negocioP.BuscarDNI(dni);
            gvPacientes.DataBind();
            txtDNI2.Text = "";
        }

        protected void BuscarNombre_Click(object sender, EventArgs e)
        {
            gvPacientes.DataSource = negocioP.BuscarNombre(txtNombre2.Text);
            gvPacientes.DataBind();
            txtNombre2.Text = "";
        }
    }
}