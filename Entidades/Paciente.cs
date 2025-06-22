using System;

namespace Entidades
{
    public class Paciente
    {
        public int DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public char Sexo { get; set; }
        public string Nacionalidad { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public int IDLocalidad { get; set; } 
        public string CorreoElectronico { get; set; }
        public string Telefono { get; set; }

      
        public Paciente() { }

        
        public Paciente(int dni, string nombre, string apellido, char sexo, string nacionalidad,
                        DateTime fechaNacimiento, string direccion, int localidad,
                        string correoElectronico, string telefono)
        {
            DNI = dni;
            Nombre = nombre;
            Apellido = apellido;
            Sexo = sexo;
            Nacionalidad = nacionalidad;
            FechaNacimiento = fechaNacimiento;
            Direccion = direccion;
            IDLocalidad = localidad;
            CorreoElectronico = correoElectronico;
            Telefono = telefono;
        }
    }
}
