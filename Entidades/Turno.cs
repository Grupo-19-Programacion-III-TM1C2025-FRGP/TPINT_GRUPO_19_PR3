using System;

namespace Entidades
{
    public class Turno
    {
        public int CodTurno_Tur { get; set; }
        public int DNIPaciente_Tur { get; set; }
        public DateTime FechaTurno_Tur { get; set; }
        public int CodHorarioTurno_Tur { get; set; }
        public int LegajoMedico_Tur { get; set; }
        public int CodEspecialidad_Tur { get; set; }
    }
}