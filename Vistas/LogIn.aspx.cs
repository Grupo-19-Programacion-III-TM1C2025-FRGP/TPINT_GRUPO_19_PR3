using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Vistas.Clases;

namespace Vistas
{
    public partial class LogIn : System.Web.UI.Page
    {
        private NegocioLogin _negocioLogin = new NegocioLogin();

        protected void Page_Load(object sender, EventArgs e)
        {
           AuxiliarVistas.ManejarRedireccionPorCookies();
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text;
            string password = txtPassword.Text;

            Dictionary<string, string> resultado = _negocioLogin.ValidarCredenciales(usuario, password);

            if (resultado["success"] == "false")
            {
                lblMensaje.Text = resultado["error"];
                return;
            }

            string rol = resultado["rol"];

            Response.Cookies["Usuario"].Value = resultado["usuario"];
            Response.Cookies["Usuario"].Expires = DateTime.Now.AddHours(2); // Cookie expira en 2 horas
            Response.Cookies["Rol"].Value = rol;

            AuxiliarVistas.RedirigirPorRol(rol);
        }


    }
}