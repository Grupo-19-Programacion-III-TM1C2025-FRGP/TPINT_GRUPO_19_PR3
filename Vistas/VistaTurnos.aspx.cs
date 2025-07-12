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
using System.Globalization;


namespace Vistas
{
    public partial class VistaTurnos : System.Web.UI.Page
    {
        NegocioTurno negocioTurno = new NegocioTurno();

        int legajoMedico;
        private string nuevoEstado;

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            AuxiliarVistas.ValidarSesionMedico();
            lblUsuario.Text = AuxiliarVistas.ObtenerUsuario();

            legajoMedico = int.Parse(AuxiliarVistas.ObtenerLegajo());

            if (!IsPostBack)
            {
                CargarGvTurnos();

            }

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            AuxiliarVistas.CerrarSesion();
        }

        protected void CargarGvTurnos()
        {

            DataTable tabla = negocioTurno.ListarTurnos(legajoMedico);

            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron turnos pendientes";
                return;
            }
            gvTurnos.DataSource = tabla;
            gvTurnos.DataBind();
        }

        protected void gvTurnos_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
            {
                // Oculta la columna auto-generada de "Asistencia" (por ejemplo, en la posición 5)
                e.Row.Cells[6].Visible = false;
                
            }
        }

        protected void gvTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTurnos.EditIndex = -1;
            CargarGvDesdeViewState();
        }
        protected void gvTurnos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTurnos.EditIndex = e.NewEditIndex;
            CargarGvDesdeViewState();
        }

        protected void gvTurnos_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow &&
                e.Row.RowState.HasFlag(DataControlRowState.Edit))
            {
                //Recupera el estado de asistencia anterior y lo pone como selected en el ddl de asistencia
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlAsistencia");
                string asistenciaActual = DataBinder.Eval(e.Row.DataItem, "Asistencia")?.ToString();

                if (ddl != null && asistenciaActual != null)
                {
                    ListItem item = ddl.Items.FindByValue(asistenciaActual);
                    if (item != null)
                        item.Selected = true;
                }

            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DateTime fecha;
                if (DateTime.TryParse(e.Row.Cells[2].Text, out fecha)) // columna 1 = Fecha
                {
                    e.Row.Cells[2].Text = fecha.ToString("dd/MM/yyyy");
                }
            }
        }

        private void CargarGvDesdeViewState()
        {
            if (ViewState["TurnosFiltrados"] != null)
            {
                gvTurnos.DataSource = (DataTable)ViewState["TurnosFiltrados"];
                gvTurnos.DataBind();
            }
            else
            {
                CargarGvTurnos(); // método que carga todos los turnos
            }
        }

        protected void gvTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int codTurno = Convert.ToInt32(gvTurnos.DataKeys[e.RowIndex].Value);
            GridViewRow fila = gvTurnos.Rows[e.RowIndex];
            //string nuevaAsistencia = ((TextBox)fila.Cells[5].Controls[0]).Text;
            DropDownList ddlAsistencia = (DropDownList)fila.FindControl("ddlAsistencia");
            string nuevaAsistencia = ddlAsistencia?.SelectedValue ?? "";

            string comentario = ((TextBox)fila.Cells[7].Controls[0]).Text;
            string textoFecha = gvTurnos.DataKeys[e.RowIndex]["Fecha"].ToString();

            Turno turno = new Turno();
            turno.Asistencia_Tur = nuevaAsistencia;
            turno.Comentario_Tur = comentario;
            turno.LegajoMedico_Tur = legajoMedico.ToString();
            turno.DNIPaciente_Tur = gvTurnos.DataKeys[e.RowIndex]["DNI"].ToString();
            turno.FechaTurno_Tur = DateTime.Parse(textoFecha);


            var horario = gvTurnos.DataKeys[e.RowIndex]["Hora"].ToString();

            negocioTurno.ModificarAsistencia(turno, horario);

            gvTurnos.EditIndex = -1;
            CargarGvTurnos();
        }

        protected void gvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;
            CargarGvDesdeViewState();
        }

        protected void btnPresente_Click(object sender, EventArgs e)
        {

            DataTable tabla = negocioTurno.FiltrarPresente(legajoMedico);
            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron presentes";
                gvTurnos.Visible = false;     // oculto el GridView
            }
            else
            {
                lblError.Text = "";
                gvTurnos.Visible = true;
                gvTurnos.DataSource = tabla;
                gvTurnos.DataBind();
            }
            ViewState["TurnosFiltrados"] = tabla;
        }

        protected void btnAusente_Click(object sender, EventArgs e)
        {
            DataTable tabla = negocioTurno.FiltrarAusente(legajoMedico);
            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron ausentes";
                gvTurnos.Visible = false;     // oculto el GridView
            }
            else
            {
                lblError.Text = "";
                gvTurnos.Visible = true;
                gvTurnos.DataSource = tabla;
                gvTurnos.DataBind();
            }
            ViewState["TurnosFiltrados"] = tabla;
        }

        protected void btnPendiente_Click(object sender, EventArgs e)
        {
            DataTable tabla = negocioTurno.FiltrarPendiente(legajoMedico);
            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron pendientes";
                gvTurnos.Visible = false;     // oculto el GridView
            }
            else
            {
                lblError.Text = "";
                gvTurnos.Visible = true;
                gvTurnos.DataSource = tabla;
                gvTurnos.DataBind();
            }
            ViewState["TurnosFiltrados"] = tabla;
        }

        protected void btnBuscarDNI_Click(object sender, EventArgs e)
        {
            int dni = Convert.ToInt32(txtDNI.Text);
            DataTable tabla = negocioTurno.Filtrar_DNI(dni, legajoMedico);
            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron turnos pendientes";
                gvTurnos.Visible = false;     // oculto el GridView
            }
            else
            {
                lblError.Text = "";
                gvTurnos.Visible = true;
                gvTurnos.DataSource = tabla;
                gvTurnos.DataBind();
            }
            ViewState["TurnosFiltrados"] = tabla;
        }

        protected void btnBuscarNombre_Click(object sender, EventArgs e)
        {

            DataTable tabla = negocioTurno.FiltrarNombre(txtNombre.Text, legajoMedico);

            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron turnos pendientes";
                gvTurnos.Visible = false;     // oculto el GridView
            }
            else
            {
                lblError.Text = "";
                gvTurnos.Visible = true;
                gvTurnos.DataSource = tabla;
                gvTurnos.DataBind();
            }
            ViewState["TurnosFiltrados"] = tabla;
        }

        protected void btnTodo_Click(object sender, EventArgs e)
        {

            DataTable tabla = negocioTurno.ListarTurnos(legajoMedico);

            if (tabla.Rows.Count == 0)
            {
                lblError.Text = "No se encontraron turnos pendientes";
                gvTurnos.Visible = false;     // oculto el GridView
            }
            else
            {
                lblError.Text = "";
                gvTurnos.Visible = true;
                gvTurnos.DataSource = tabla;
                gvTurnos.DataBind();
            }
            ViewState["TurnosFiltrados"] = tabla;
        }

        protected void gvTurnos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int index = e.NewSelectedIndex;
            int codTurno = Convert.ToInt32(gvTurnos.DataKeys[index].Value);
        }

    }
}