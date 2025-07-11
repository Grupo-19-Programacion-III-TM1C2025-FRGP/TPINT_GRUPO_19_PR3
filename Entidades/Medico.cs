using System;

namespace Entidades
{
    public class Medico
    {
        public string _LegajoMedico { get; set; }
        public string _DNI { get; set; }
        public string _NombreMedico { get; set; }
        public string _ApellidoMedico { get; set; }
        public char _Sexo { get; set; }
        public string _Nacionalidad { get; set; }
        public DateTime _FechaNacimiento { get; set; }
        public int _Provincia { get; set; }
        public int _Localidad { get; set; }
        public int _Especialidad { get; set; }
        public string _Email { get; set; }
        public string _Telefono { get; set; }
        public int _HoraEntrada { get; set; }
        public int _HoraSalida { get; set; }
        public bool _Estado { get; set; }

        // Constructor vacío
        public Medico() { }

        // Constructor lleno 
        public Medico(string legajo, string dni, string nombre, string apellido, char sexo, string nacionalidad,
                  DateTime fechaNacimiento, int provincia, int localidad, int especialidad, string email, string telefono, int horaEntrada, int horaSalida, bool estado)
        {
            _LegajoMedico = legajo;
            _DNI = dni;
            _NombreMedico = nombre;
            _ApellidoMedico = apellido;
            _Sexo = sexo;
            _Nacionalidad = nacionalidad;
            _FechaNacimiento = fechaNacimiento;
            _Provincia = provincia;
            _Localidad = localidad;
            _Especialidad = especialidad;
            _Email = email;
            _Telefono = telefono;
            _HoraEntrada = horaEntrada;
            _HoraSalida = horaSalida;
            _Estado = estado;
        }

        // Constructor SIN Legajo
        public Medico(string dni, string nombre, string apellido, char sexo, string nacionalidad,
                    DateTime fechaNacimiento, int provincia, int localidad, int especialidad, string email, string telefono, int horaEntrada, int horaSalida, bool estado)
        {
            _DNI = dni;
            _NombreMedico = nombre;
            _ApellidoMedico = apellido;
            _Sexo = sexo;
            _Nacionalidad = nacionalidad;
            _FechaNacimiento = fechaNacimiento;
            _Provincia = provincia;
            _Localidad = localidad;
            _Especialidad = especialidad;
            _Email = email;
            _Telefono = telefono;
            _HoraEntrada = horaEntrada;
            _HoraSalida = horaSalida;
            _Estado = estado;
        }
    }
}