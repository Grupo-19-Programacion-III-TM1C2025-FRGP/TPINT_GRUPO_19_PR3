using System;

namespace Entidades
{
    public class Medico
    {
        public int LegajoMedico_Med { get; set; }
        public int DNIMedico_Med { get; set; }
        public string NombreMedico_Med { get; set; }
        public string ApellidoMedico_Med { get; set; }
        public string Sexo_Med { get; set; }
        public string Nacionalidad_Med { get; set; }
        public DateTime? FechaNacimiento_Med { get; set; }
        public int CodLocalidad_Med { get; set; }
        public int CodEspecialidad_Med { get; set; }
        public string Email_Med { get; set; }
        public string Telefono_Med { get; set; }
    }
}