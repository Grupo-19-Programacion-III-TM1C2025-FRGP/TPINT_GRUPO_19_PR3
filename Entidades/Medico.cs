using System;

namespace Entidades
{
    public class Medico
{
    public int LegajoMedico { get; set; }
    public int DNI { get; set; }
    public string NombreMedico { get; set; }
    public string ApellidoMedico { get; set; }
    public char Sexo { get; set; }
    public string Nacionalidad { get; set; }
    public DateTime FechaNacimiento { get; set; }
    public int Localidad { get; set; }
    public int Especialidad { get; set; }
    public int DiaAtencion { get; set; }
    public int Horario { get; set; }
    public string Email { get; set; }
    public string Telefono { get; set; }

    // Constructor vacío
    public Medico() { }
    
    public Medico(int legajo, int dni, string nombre, string apellido, char sexo, string nacionalidad,
              DateTime fechaNacimiento, int localidad, int especialidad, int diaAtencion,
              int horario, string email, string telefono)
{
    LegajoMedico = legajo;
    DNI = dni;
    NombreMedico = nombre;
    ApellidoMedico = apellido;
    Sexo = sexo;
    Nacionalidad = nacionalidad;
    FechaNacimiento = fechaNacimiento;
    Localidad = localidad;
    Especialidad = especialidad;
    DiaAtencion = diaAtencion;
    Horario = horario;
    Email = email;
    Telefono = telefono;
}

        // Constructor SIN Legajo
    public Medico(int dni, string nombre, string apellido, char sexo, string nacionalidad,
                  DateTime fechaNacimiento, int localidad, int especialidad, int diaAtencion,
                  int horario, string email, string telefono)
        {
            DNI = dni;
            NombreMedico = nombre;
            ApellidoMedico = apellido;
            Sexo = sexo;
            Nacionalidad = nacionalidad;
            FechaNacimiento = fechaNacimiento;
            Localidad = localidad;
            Especialidad = especialidad;
            DiaAtencion = diaAtencion;
            Horario = horario;
            Email = email;
            Telefono = telefono;
        }

    }


}