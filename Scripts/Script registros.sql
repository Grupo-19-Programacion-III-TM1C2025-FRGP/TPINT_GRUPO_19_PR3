USE Clinica
GO

INSERT INTO Especialidades (CodEspecialidad_Es, NombreEspecialidad_Es)
SELECT 1, 'Kinesiología'
UNION SELECT 2, 'Traumatología'
UNION SELECT 3, 'Cardiología'
UNION SELECT 4, 'Clínica Médica'
UNION SELECT 5, 'Pediatría'
UNION SELECT 6, 'Dermatología'
UNION SELECT 7, 'Ginecología'
UNION SELECT 8, 'Neurología'
UNION SELECT 9, 'Urología'
UNION SELECT 10, 'Oncología'
UNION SELECT 11, 'Psiquiatría'
UNION SELECT 12, 'Traumatología'
UNION SELECT 13, 'Reumatología'
UNION SELECT 14, 'Endocrinología'
UNION SELECT 15, 'Infectología'
UNION SELECT 16, 'Neumonología'
UNION SELECT 17, 'Hematología'
UNION SELECT 18, 'Fonoaudiología'
UNION SELECT 19, 'Nutrición'
GO

INSERT INTO DiasAtencion (CodDiaAtencion_DA, NombreDia_DA)
SELECT 1, 'Lunes'
UNION SELECT 2, 'Martes'
UNION SELECT 3, 'Miércoles'
UNION SELECT 4, 'Jueves'
UNION SELECT 5, 'Viernes'
UNION SELECT 6, 'Sábado'
UNION SELECT 7, 'Domingo'
GO

INSERT INTO HorariosAtencion (CodHorarioAtencion_HA, HoraInicio_HA, HoraFin_HA)
SELECT 1, '07:00', '08:00'
UNION SELECT 2, '08:00', '09:00'
UNION SELECT 3, '09:00', '10:00'
UNION SELECT 4, '10:00', '11:00'
UNION SELECT 5, '11:00', '12:00'
UNION SELECT 6, '12:00', '13:00'
GO

INSERT INTO HorariosDeAtencionPorDia (CodDiaAtencion_HAD, CodHorarioAtencion_HAD)
-- Lunes de 7 a 13
SELECT 1, 1
UNION SELECT 1, 2
UNION SELECT 1, 3
UNION SELECT 1, 4
UNION SELECT 1, 5
UNION SELECT 1, 6
-- Martes de 7 a 13
UNION SELECT 2, 1
UNION SELECT 2, 2
UNION SELECT 2, 3
UNION SELECT 2, 4
UNION SELECT 2, 5
UNION SELECT 2, 6
-- Miércoles de 7 a 13
UNION SELECT 3, 1
UNION SELECT 3, 2
UNION SELECT 3, 3
UNION SELECT 3, 4
UNION SELECT 3, 5
UNION SELECT 3, 6
-- Jueves de 7 a 13
UNION SELECT 4, 1
UNION SELECT 4, 2
UNION SELECT 4, 3
UNION SELECT 4, 4
UNION SELECT 4, 5
UNION SELECT 4, 6
-- Viernes de 7 a 13
UNION SELECT 5, 1
UNION SELECT 5, 2
UNION SELECT 5, 3
UNION SELECT 5, 4
UNION SELECT 5, 5
UNION SELECT 5, 6
GO

INSERT INTO Provincias (IDProvincia, NombreProvincia) VALUES
(1, 'Buenos Aires'),
(2, 'Córdoba'),
(3, 'Santa Fe'),
(4, 'Mendoza'),
(5, 'Tucumán'),
(6, 'Salta'),
(7, 'Chubut'),
(8, 'Neuquén'),
(9, 'Entre Ríos'),
(10, 'Misiones');
GO

INSERT INTO Localidades (IDLocalidad, NombreLocalidad, IDProvincia) VALUES
(1, 'La Plata', 1),
(2, 'Mar del Plata', 1),
(3, 'Villa Carlos Paz', 2),
(4, 'Río Cuarto', 2),
(5, 'Rosario', 3),
(6, 'Santa Fe Capital', 3),
(7, 'Godoy Cruz', 4),
(8, 'San Rafael', 4),
(9, 'San Miguel de Tucumán', 5),
(10, 'Yerba Buena', 5),
(11, 'Salta Capital', 6),
(12, 'Tartagal', 6),
(13, 'Comodoro Rivadavia', 7),
(14, 'Puerto Madryn', 7),
(15, 'Neuquén Capital', 8),
(16, 'Plottier', 8),
(17, 'Paraná', 9),
(18, 'Concordia', 9),
(19, 'Posadas', 10),
(20, 'Oberá', 10);
GO

INSERT INTO Medico (DNI, NombreMedico, ApellidoMedico, Sexo, Nacionalidad, FechaNacimiento, Localidad, Especialidad, Email, Telefono) VALUES
('27123456', 'Lucía', 'Martínez', 'F', 'Argentina', '1980-05-12', 1, 1, 'lucia.martinez@hospital.com', '1123456789'),
('27234567', 'Julián', 'Pérez', 'M', 'Argentina', '1975-09-03', 2, 2, 'julian.perez@hospital.com', '1134567890'),
('27345678', 'Romina', 'Gómez', 'F', 'Argentina', '1988-11-22', 3, 3, 'romina.gomez@hospital.com', '1145678901'),
('27456789', 'Carlos', 'López', 'M', 'Argentina', '1982-01-15', 4, 4, 'carlos.lopez@hospital.com', '1156789012'),
('27567890', 'Ana', 'Rodríguez', 'F', 'Argentina', '1990-03-30', 5, 5, 'ana.rodriguez@hospital.com', '1167890123'),
('27678901', 'Federico', 'Torres', 'M', 'Argentina', '1985-07-19', 6, 6, 'federico.torres@hospital.com', '1178901234'),
('27789012', 'Carla', 'Fernández', 'F', 'Argentina', '1979-12-08', 7, 7, 'carla.fernandez@hospital.com', '1189012345'),
('27890123', 'Gustavo', 'Ramírez', 'M', 'Argentina', '1983-06-25', 8, 8, 'gustavo.ramirez@hospital.com', '1190123456'),
('27901234', 'Verónica', 'Sánchez', 'F', 'Argentina', '1986-04-10', 9, 9, 'veronica.sanchez@hospital.com', '1101234567'),
('28012345', 'Matías', 'Alvarez', 'M', 'Argentina', '1981-08-05', 10, 10, 'matias.alvarez@hospital.com', '1112345678'),
('28123456', 'Laura', 'Ruiz', 'F', 'Argentina', '1984-02-12', 11, 11, 'laura.ruiz@hospital.com', '1123456790'),
('28234567', 'Nicolás', 'Sosa', 'M', 'Argentina', '1977-07-17', 12, 12, 'nicolas.sosa@hospital.com', '1134567891'),
('28345678', 'Vanesa', 'Mendoza', 'F', 'Argentina', '1991-10-23', 13, 13, 'vanesa.mendoza@hospital.com', '1145678912'),
('28456789', 'Santiago', 'Ibarra', 'M', 'Argentina', '1980-12-30', 14, 14, 'santiago.ibarra@hospital.com', '1156789123'),
('28567890', 'Belén', 'Ortiz', 'F', 'Argentina', '1987-09-11', 15, 15, 'belen.ortiz@hospital.com', '1167891234'),
('28678901', 'Tomás', 'Moreno', 'M', 'Argentina', '1985-06-06', 16, 16, 'tomas.moreno@hospital.com', '1178912345'),
('28789012', 'Cecilia', 'Aguirre', 'F', 'Argentina', '1976-04-19', 17, 17, 'cecilia.aguirre@hospital.com', '1189123456'),
('28890123', 'Ignacio', 'Luna', 'M', 'Argentina', '1992-01-01', 18, 18, 'ignacio.luna@hospital.com', '1191234567'),
('28901234', 'Paula', 'Domínguez', 'F', 'Argentina', '1983-03-27', 19, 19, 'paula.dominguez@hospital.com', '1102345678');
