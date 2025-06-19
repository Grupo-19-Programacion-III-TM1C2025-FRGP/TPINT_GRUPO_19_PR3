using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vistas.Clases;


namespace Vistas
{
    public partial class VistaTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            AuxiliarVistas.ValidarSesionMedico();
            lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
        }

        protected void gvPacientes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}