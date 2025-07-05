USE Clinica;
GO

-- POBLAR PROVINCIAS
INSERT INTO Provincias (NombreProvincia_Pr) VALUES
('Buenos Aires'),
('Córdoba'),
('Santa Fe');
GO

-- POBLAR LOCALIDADES
INSERT INTO Localidades (NombreLocalidad_Lo, CodProvincia_Pr_Lo) VALUES
('La Plata', 1),
('Mar del Plata', 1),
('Córdoba Capital', 2),
('Rosario', 3);
GO

-- POBLAR ESPECIALIDADES
INSERT INTO Especialidades (NombreEspecialidad_Es) VALUES
('Cardiología'),
('Dermatología'),
('Pediatría'),
('Neurología');
GO

-- POBLAR MÉDICOS
INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, HoraEntrada_Me, HoraSalida_Me, Email_Me, Telefono_Me
) VALUES
(30123456, 'Juan', 'Pérez', 'M', 'Argentina', '1980-05-10', 1, 1, 1, '10:00', '18:00', 'juan.perez@mail.com', '2211234567');
DECLARE @LegajoJuan INT = SCOPE_IDENTITY();

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, HoraEntrada_Me, HoraSalida_Me, Email_Me, Telefono_Me
) VALUES
(34435562, 'Ana', 'Gómez', 'F', 'Argentina', '1985-08-22', 2, 3, 2, '08:00', '16:00', 'ana.gomez@mail.com', '3519876543');
DECLARE @LegajoAna INT = SCOPE_IDENTITY();

-- POBLAR USUARIOS (admins y médicos)
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('admin1', 'adminpass123', 1, NULL),
('juan.perez@mail.com', 'medpass123', 0, @LegajoJuan),
('ana.gomez@mail.com', 'medpass456', 0, @LegajoAna);

-- POBLAR PACIENTES
INSERT INTO Pacientes (
  DNI_Pa, Nombre_Pa, Apellido_Pa, Sexo_Pa, Nacionalidad_Pa, FechaNacimiento_Pa,
  Direccion_Pa, CodProvincia_Pr_Pa, CodLocalidad_Lo_Pa, Email_Pa, Telefono_Pa
) VALUES
(40123456, 'Carlos', 'Lopez', 'M', 'Argentina', '1990-12-15', 'Calle Falsa 123', 1, 2, 'carlos.lopez@mail.com', '2233445566'),
(40234567, 'María', 'Fernandez', 'F', 'Argentina', '1995-07-30', 'Av Siempre Viva 456', 3, 4, 'maria.fernandez@mail.com', '3412233445');
GO

-- POBLAR HORARIOS DE TURNOS
INSERT INTO HorariosTurno (Horario_HT) VALUES
('08:00'),
('09:00'),
('10:00'),
('11:00'),
('14:00'),
('15:00');
GO

-- POBLAR TURNOS
INSERT INTO Turnos (
  Legajo_Me_Tu, CodHorarioTurno_HT_Tu, FechaTurno_Tu, DNI_Pa_Tu
) VALUES
(1, 1, '2025-07-01', 40123456),
(1, 2, '2025-07-01', 40234567),
(2, 3, '2025-07-02', 40123456);
GO

UPDATE Turnos SET Asistencia_Tu = 'Pendiente' 


