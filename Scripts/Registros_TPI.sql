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

('San Fernando del Valle de Catamarca', 4),
('Belén', 4),
('Andalgalá', 4),

('Resistencia', 5),
('Presidencia Roque Sáenz Peña', 5),
('Villa Ángela', 5),

('Rawson', 6),
('Comodoro Rivadavia', 6),
('Puerto Madryn', 6),

('Corrientes', 7),
('Goya', 7),
('Paso de los Libres', 7),

('Paraná', 8),
('Concordia', 8),
('Gualeguaychú', 8),

('Formosa', 9),
('Clorinda', 9),
('Pirané', 9),

('San Salvador de Jujuy', 10),
('Palpalá', 10),
('Perico', 10),

('Santa Rosa', 11),
('General Pico', 11),
('Toay', 11),

('La Rioja', 12),
('Chilecito', 12),
('Aimogasta', 12),

('Mendoza', 13),
('San Rafael', 13),
('Godoy Cruz', 13),

('Posadas', 14),
('Eldorado', 14),
('Oberá', 14),

('Neuquén', 15),
('Cutral Có', 15),
('San Martín de los Andes', 15),

('Viedma', 16),
('Bariloche', 16),
('General Roca', 16),

('Salta', 17),
('San Ramón de la Nueva Orán', 17),
('Tartagal', 17),

('San Juan', 18),
('Rawson', 18),
('Chimbas', 18),

('San Luis', 19),
('Villa Mercedes', 19),
('Merlo', 19),

('Río Gallegos', 20),
('Caleta Olivia', 20),
('Puerto Deseado', 20),

('Santiago del Estero', 21),
('La Banda', 21),
('Termas de Río Hondo', 21),

('Ushuaia', 22),
('Río Grande', 22),
('Tolhuin', 22),

('San Miguel de Tucumán', 23),
('Tafí Viejo', 23),
('Concepción', 23);
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
