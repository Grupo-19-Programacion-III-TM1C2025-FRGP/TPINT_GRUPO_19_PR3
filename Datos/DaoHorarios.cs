﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
namespace Datos
{
    public class DaoHorarios : GenericDao
    {
        readonly string consultaTabla = "SELECT * FROM HorariosTurno";

        public DaoHorarios() { }

        public DataTable getTablaHorarios()
        {
            DataTable tabla = _conexion.TraerTabla(consultaTabla, "HorariosTurno");
            return tabla;
        }
    }
    
}
