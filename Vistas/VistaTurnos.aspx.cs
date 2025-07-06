using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Vistas.Clases;


namespace Vistas
{
    public partial class VistaTurnos : System.Web.UI.Page
    {
        NegocioTurno negocioTurno = new NegocioTurno();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            AuxiliarVistas.ValidarSesionMedico();
            lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            CargarGvTurnos();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
        }

        protected void CargarGvTurnos()
        {
            int legajo = int.Parse(AuxiliarVistas.ObtenerLegajo());

            DataTable tabla = negocioTurno.ListarTurnos(legajo);

            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron turnos pendientes";
                return;
            }
            gvTurnos.DataSource = tabla;
            gvTurnos.DataBind();
        }

        protected void gvTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void gvTurnos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvTurnos_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}