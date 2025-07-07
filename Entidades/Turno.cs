using System;

namespace Entidades
{
    public class Turno
    {
        public int CodTurno_Tur { get; set; }
        public string DNIPaciente_Tur { get; set; }
        public DateTime FechaTurno_Tur { get; set; }
        public int CodHorarioTurno_Tur { get; set; }
        public string LegajoMedico_Tur { get; set; }
        public int CodEspecialidad_Tur { get; set; }

        public string Asistencia_Tur { get; set; }

        // Constructor
        public Turno(string legajoMedico, DateTime fechaTurno, int codHorario, string dniPaciente)
        {
            LegajoMedico_Tur = legajoMedico;
            FechaTurno_Tur = fechaTurno;
            CodHorarioTurno_Tur = codHorario;
            DNIPaciente_Tur = dniPaciente;
        }

        public Turno(DateTime fechaTurno, string dni)
        {
            DNIPaciente_Tur = dni;
            FechaTurno_Tur = fechaTurno;
        }

        public Turno(int codigo, string asistencia)
        {
            CodTurno_Tur = codigo;
            Asistencia_Tur = asistencia;
        }


        public Turno() { }

    }
}