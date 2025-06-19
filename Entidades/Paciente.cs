using System;

namespace Entidades
{
    public class Paciente
    {
        public int DNIPaciente_Pac { get; set; }
        public string NombrePaciente_Pac { get; set; }
        public string ApellidoPaciente_Pac { get; set; }
        public string Sexo_Pac { get; set; }
        public string Nacionalidad_Pac { get; set; }
        public DateTime? FechaNacimiento_Pac { get; set; }
        public string Direccion_Pac { get; set; }
        public int CodLocalidad_Pac { get; set; }
        public string CorreoElectronico_Pac { get; set; }
        public string NumTelefono_Pac { get; set; }
    }
}