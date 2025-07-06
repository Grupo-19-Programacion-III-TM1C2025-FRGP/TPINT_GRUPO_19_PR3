using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vistas.Clases
{
    public class AuxiliarVistas
    {
        public static void ManejarRedireccionPorCookies()
        {
            if (HttpContext.Current.Request.Cookies["Usuario"] != null && HttpContext.Current.Request.Cookies["Rol"] != null)
            {
                // Si ya hay un usuario logueado, redirigir a la página correspondiente
                string rol = HttpContext.Current.Request.Cookies["Rol"].Value;
                RedirigirPorRol(rol);
            }

        }

        public static void ValidarSesion()
        {
            // Redirigir a la página de inicio de sesión si no hay cookies de usuario
            if (HttpContext.Current.Request.Cookies["Usuario"] == null)
            {
                HttpContext.Current.Response.Redirect("LogIn.aspx");
            }
        }

        public static void ValidarSesionMedico()
        {
            ValidarSesion(); //Validar que haya una sesion, si no redirecciona a LogIn.aspx

            if (HttpContext.Current.Request.Cookies["Rol"].Value != "Medico")
            {
                HttpContext.Current.Response.Redirect("LogIn.aspx");
            }
        }

        public static void ValidarSesionAdministrador()
        {
            ValidarSesion();

            if (HttpContext.Current.Request.Cookies["Rol"].Value != "Administrador")
            {
                HttpContext.Current.Response.Redirect("LogIn.aspx");
            }
        }

        public static void RedirigirPorRol(string rol)
        {

            if (rol == "Administrador")
            {
                HttpContext.Current.Response.Redirect("AsignacionTurno.aspx");
            }
            else if (rol == "Medico")
            {
                HttpContext.Current.Response.Redirect("VistaTurnos.aspx");
            }
        }

        public static void CerrarSesion()
        {
            // Eliminar las cookies de usuario y rol
            if (HttpContext.Current.Request.Cookies["Usuario"] != null)
            {
                HttpContext.Current.Response.Cookies["Usuario"].Expires = DateTime.Now.AddDays(-1);
            }
            if (HttpContext.Current.Request.Cookies["Rol"] != null)
            {
                HttpContext.Current.Response.Cookies["Rol"].Expires = DateTime.Now.AddDays(-1);
            }
            // Redirigir a la página de inicio de sesión
            HttpContext.Current.Response.Redirect("LogIn.aspx");
        }

        public static string ObtenerUsuario()
        {
            if (HttpContext.Current.Request.Cookies["Usuario"] == null)
            {
                HttpContext.Current.Response.Redirect("LogIn.aspx");
                return null;
            }

            return HttpContext.Current.Request.Cookies["Usuario"].Value;
        }

        public static string ObtenerLegajo()
        {
            if (HttpContext.Current.Request.Cookies["Legajo"] == null)
            {
                HttpContext.Current.Response.Redirect("LogIn.aspx");
                return null;
            }

            return HttpContext.Current.Request.Cookies["Legajo"].Value;
        }

        public static string ObtenerRol()
        {
            if (HttpContext.Current.Request.Cookies["Rol"] == null)
            {
                HttpContext.Current.Response.Redirect("LogIn.aspx");
                return null;
            }
            return HttpContext.Current.Request.Cookies["Rol"].Value;
        }

    }
}