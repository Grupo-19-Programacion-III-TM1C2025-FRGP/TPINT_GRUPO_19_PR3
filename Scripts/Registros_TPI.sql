USE Clinica;
GO

-- POBLAR PROVINCIAS
INSERT INTO Provincias (NombreProvincia_Pr) VALUES
('Buenos Aires'),
('Córdoba'),
('Santa Fe'),
('Catamarca'),
('Chaco'),
('Chubut'),
('Corrientes'),
('Entre Ríos'),
('Formosa'),
('Jujuy'),
('La Pampa'),
('La Rioja'),
('Mendoza'),
('Misiones'),
('Neuquén'),
('Rio Negro'),
('Salta'),
('San Juan'),
('San Luis'),
('Santa Cruz'),
('Santiago del Estero'),
('Tierra del Fuego'),
('Tucumán');
GO

-- POBLAR LOCALIDADES
INSERT INTO Localidades (NombreLocalidad_Lo, CodProvincia_Pr_Lo) VALUES
('La Plata', 1),
('Mar del Plata', 1),
('Buenos Aires', 1),

('Córdoba Capital', 2),
('Potrerillos', 2),
('Villa Allende', 2),

('Colón', 3),
('Rafaela', 3),
('Rosario', 3),

('San Fernando del Valle de Catamarca', 7),
('Belén', 7),
('Andalgalá', 7),

('Resistencia', 8),
('Presidencia Roque Sáenz Peña', 8),
('Villa Ángela', 8),

('Rawson', 9),
('Comodoro Rivadavia', 9),
('Puerto Madryn', 9),

('Corrientes', 10),
('Goya', 10),
('Paso de los Libres', 10),

('Paraná', 11),
('Concordia', 11),
('Gualeguaychú', 11),

('Formosa', 12),
('Clorinda', 12),
('Pirané', 12),

('San Salvador de Jujuy', 13),
('Palpalá', 13),
('Perico', 13),

('Santa Rosa', 14),
('General Pico', 14),
('Toay', 14),

('La Rioja', 15),
('Chilecito', 15),
('Aimogasta', 15),

('Mendoza', 16),
('San Rafael', 16),
('Godoy Cruz', 16),

('Posadas', 17),
('Eldorado', 17),
('Oberá', 17),

('Neuquén', 18),
('Cutral Có', 18),
('San Martín de los Andes', 18),

('Viedma', 19),
('Bariloche', 19),
('General Roca', 19),

('Salta', 20),
('San Ramón de la Nueva Orán', 20),
('Tartagal', 20),

('San Juan', 21),
('Rawson', 21),
('Chimbas', 21),

('San Luis', 22),
('Villa Mercedes', 22),
('Merlo', 22),

('Río Gallegos', 23),
('Caleta Olivia', 23),
('Puerto Deseado', 23),

('Santiago del Estero', 24),
('La Banda', 24),
('Termas de Río Hondo', 24),

('Ushuaia', 25),
('Río Grande', 25),
('Tolhuin', 25),

('San Miguel de Tucumán', 26),
('Tafí Viejo', 26),
('Concepción', 26);
GO

-- POBLAR ESPECIALIDADES
INSERT INTO Especialidades (NombreEspecialidad_Es) VALUES
('Cardiología'),
('Dermatología'),
('Pediatría'),
('Neurología'),
('Gastroenterología'),
('Traumatología'),
('Oncología'),
('Oftalmología'),
('Urología'),
('Endocrinología'),
('Ginecología'),
('Proctología'),
('Kinesiología'),
('Psicología'),
('Otorrinolaringología');
GO

-- POBLAR MÉDICOS
-- INSERT INTO Medicos (
--   DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
--   CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, HoraEntrada_Me, HoraSalida_Me, Email_Me, Telefono_Me
-- ) VALUES
-- (32230989, 'Juan', 'Pérez', 'M', 'Argentina', '1980-05-10', 1, 1, 1, '10:00', '18:00', 'juan.perez@mail.com', '2211234567');
-- DECLARE @LegajoJuan INT = SCOPE_IDENTITY();
-- INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
-- ('juan.perez@mail.com', 'medpass123', 0, @LegajoJuan);
-- GO

-- INSERT INTO Medicos (
--   DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
--   CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, HoraEntrada_Me, HoraSalida_Me, Email_Me, Telefono_Me
-- ) VALUES
-- (34547665, 'Ana', 'Gómez', 'F', 'Argentina', '1985-08-22', 2, 3, 2, '08:00', '16:00', 'ana.gomez@mail.com', '3519876543');
-- DECLARE @LegajoAna INT = SCOPE_IDENTITY();
-- INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
-- ('ana.gomez@mail.com', 'medpass456', 0, @LegajoAna);
-- GO

-- POBLAR USUARIOS (admin)
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('admin1', 'adminpass123', 1, NULL);
GO

-- POBLAR PACIENTES
-- INSERT INTO Pacientes (
--   DNI_Pa, Nombre_Pa, Apellido_Pa, Sexo_Pa, Nacionalidad_Pa, FechaNacimiento_Pa,
--   Direccion_Pa, CodProvincia_Pr_Pa, CodLocalidad_Lo_Pa, Email_Pa, Telefono_Pa
-- ) VALUES
--  (40123456, 'Carlos', 'Lopez', 'M', 'Argentina', '1990-12-15', 'Calle Falsa 123', 1, 2, 'carlos.lopez@mail.com', '2233445566'),
--  (40234567, 'María', 'Fernandez', 'F', 'Argentina', '1995-07-30', 'Av Siempre Viva 456', 3, 4, 'maria.fernandez@mail.com', '3412233445');
-- GO

-- POBLAR HORARIOS DE TURNOS
INSERT INTO HorariosTurno (Horario_HT) VALUES
('08:00'),
('09:00'),
('10:00'),
('11:00'),
('12:00'),
('13:00'),
('14:00'),
('15:00'),
('16:00'),
('17:00'),
('18:00'),
('19:00'),
('20:00'),
('21:00');
GO

-- POBLAR TURNOS
-- INSERT INTO Turnos (
--   Legajo_Me_Tu, CodHorarioTurno_HT_Tu, FechaTurno_Tu, DNI_Pa_Tu
-- ) VALUES
-- (14, 1, '2025-07-01', 40123456),
-- (14, 2, '2025-07-01', 40123456),
-- (14, 3, '2025-07-02', 40123456);
-- GO
