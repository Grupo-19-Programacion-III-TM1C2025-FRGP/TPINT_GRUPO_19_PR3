using System;

namespace Entidades
{
    public class Paciente
    {
        public string DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public char Sexo { get; set; }
        public string Nacionalidad { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public int CodProvincia { get; set; }
        public int CodLocalidad { get; set; } 
        public string CorreoElectronico { get; set; }
        public string Telefono { get; set; }
        public bool Estado { get; set; }
      
        public Paciente() { }

        
        public Paciente(string dni, string nombre, string apellido, char sexo, string nacionalidad,
                        DateTime fechaNacimiento, string direccion, int provincia, int localidad,
                        string correoElectronico, string telefono, bool estado)
        {
            DNI = dni;
            Nombre = nombre;
            Apellido = apellido;
            Sexo = sexo;
            Nacionalidad = nacionalidad;
            FechaNacimiento = fechaNacimiento;
            Direccion = direccion;
            CodProvincia = provincia;
            CodLocalidad = localidad;
            CorreoElectronico = correoElectronico;
            Telefono = telefono;
            Estado = estado;
        }
    }
}
