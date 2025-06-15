using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiProyecto
{
    public partial class Medicos : Page
    {
        // Lista estática para simular una base de datos
        private static List<Medico> listaMedicos = new List<Medico>();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

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
            // Lógica para agregar medico
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            // Lógica para modificar medico
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
    }

    // Clase para representar un medico
    public class Medico
    {
        public string Legajo { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Especialidad { get; set; }
        public string Horarios { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
    }
}