using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiProyecto;
using Negocio;
using Entidades;
using Vistas.Clases;


namespace Vistas
{
    public partial class VistaTurnos : System.Web.UI.Page
    {
        NegocioTurno negocioTurno;
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
            //int legajo = 1;

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
        protected void gvTurnos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int legajo = 1;
            gvTurnos.EditIndex = e.NewEditIndex;
            gvTurnos.DataSource = negocioTurno.ListarTurnos(legajo);
            gvTurnos.DataBind();
        }

        protected void gvTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int codTurno = Convert.ToInt32(gvTurnos.DataKeys[e.RowIndex].Value);
            GridViewRow fila = gvTurnos.Rows[e.RowIndex];
            string nuevaAsistencia = ((TextBox)fila.Cells[6].Controls[0]).Text;

            Turno turno = new Turno(codTurno, nuevaAsistencia);
            turno.CodTurno_Tur = codTurno;
            turno.Asistencia_Tur = nuevaAsistencia;

            negocioTurno.ModificarAsistencia(turno);

            gvTurnos.EditIndex = -1;
            CargarGvTurnos();
        }


        protected void gvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;
            CargarGvTurnos();
        }

        protected void btnPresente_Click(object sender, EventArgs e)
        {
            int legajo = 1;
            DataTable tabla = negocioTurno.FiltrarPresente(legajo);
            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron presentes";
                return;
            }
            gvTurnos.DataSource = tabla;
            gvTurnos.DataBind();
        }

        protected void btnAusente_Click(object sender, EventArgs e)
        {
            int legajo = 1;
            DataTable tabla = negocioTurno.FiltrarAusente(legajo);
            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron ausentes";
                return;
            }
            gvTurnos.DataSource = tabla;
            gvTurnos.DataBind();
        }

        protected void btnPendiente_Click(object sender, EventArgs e)
        {
            int legajo = 1;
            DataTable tabla = negocioTurno.FiltrarPendiente(legajo);
            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron pendientes";
                return;
            }
            gvTurnos.DataSource = tabla;
            gvTurnos.DataBind();
        }

        protected void btnBuscarDNI_Click(object sender, EventArgs e)
        {
            int legajo = 1;
            int dni = Convert.ToInt32(txtDNI.Text);
            DataTable tabla = negocioTurno.Filtrar_DNI(dni, legajo);
            gvTurnos.DataSource = tabla;
            gvTurnos.DataBind();
            txtDNI.Text = "";
        }

        protected void btnBuscarNombre_Click(object sender, EventArgs e)
        {
            int legajo = 1;

            DataTable tabla = negocioTurno.FiltrarNombre(txtNombre.Text, legajo);

            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron turnos pendientes";
                return;
            }
            gvTurnos.DataSource = tabla;
            gvTurnos.DataBind();

            txtNombre.Text = "";
        }

        protected void btnTodo_Click(object sender, EventArgs e)
        {
            int legajo = 1;

            DataTable tabla = negocioTurno.ListarTurnos(legajo);

            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron turnos pendientes";
                return;
            }
            gvTurnos.DataSource = tabla;
            gvTurnos.DataBind();
        }

        protected void gvTurnos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int index = e.NewSelectedIndex;
            int codTurno = Convert.ToInt32(gvTurnos.DataKeys[index].Value);
            //HiddenField1.Value = codTurno.ToString();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}