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

 --POBLAR MÉDICOS
 INSERT INTO Medicos (
   DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
   CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
 ) VALUES
 (32230989, 'Juan', 'Pérez', 'M', 'Argentina', '1980-05-10', 1, 1, 1, 3, 11, 'juan.perez@mail.com', '2211234567');
 DECLARE @LegajoJuan INT = SCOPE_IDENTITY();
 INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
 ('juan.perez@mail.com', 'medpass123', 0, @LegajoJuan);
 GO

 INSERT INTO Medicos (
   DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
   CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
 ) VALUES
 (34547665, 'Ana', 'Gómez', 'F', 'Argentina', '1985-08-22', 2, 3, 2, 1, 9, 'ana.gomez@mail.com', '3519876543');
 DECLARE @LegajoAna INT = SCOPE_IDENTITY();
 INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
 ('ana.gomez@mail.com', 'medpass456', 0, @LegajoAna);
 GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(27544872, 'María', 'González', 'F', 'Argentina', '1975-09-23', 2, 4, 3, 2, 8, 'maria.gonzalez@mail.com', '3514567890');
DECLARE @LegajoMaria INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('maria.gonzalez@mail.com', 'gonzalez75', 0, @LegajoMaria);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(30987654, 'Carlos', 'López', 'M', 'Argentina', '1988-12-15', 3, 7, 2, 1, 9, 'carlos.lopez@mail.com', '3416543210');
DECLARE @LegajoCarlos INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('carlos.lopez@mail.com', 'lopez1988', 0, @LegajoCarlos);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(29876543, 'Laura', 'Martínez', 'F', 'Argentina', '1982-07-08', 5, 13, 4, 4, 10, 'laura.martinez@mail.com', '3725443322');
DECLARE @LegajoLaura INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('laura.martinez@mail.com', 'marti82', 0, @LegajoLaura);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(31234567, 'Sofía', 'Rodríguez', 'F', 'Argentina', '1990-03-21', 7, 19, 6, 5, 12, 'sofia.rodriguez@mail.com', '3794433221');
DECLARE @LegajoSofia INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('sofia.rodriguez@mail.com', 'rodsofia90', 0, @LegajoSofia);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(29567890, 'Diego', 'Fernández', 'M', 'Argentina', '1985-01-30', 8, 21, 8, 6, 13, 'diego.fernandez@mail.com', '3431122334');
DECLARE @LegajoDiego INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('diego.fernandez@mail.com', 'fernandezD85', 0, @LegajoDiego);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(31111222, 'Lucía', 'Ramírez', 'F', 'Argentina', '1993-11-12', 13, 37, 9, 7, 14, 'lucia.ramirez@mail.com', '2619988776');
DECLARE @LegajoLucia INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('lucia.ramirez@mail.com', 'luciaR93', 0, @LegajoLucia);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(32345678, 'Martín', 'Suárez', 'M', 'Argentina', '1981-06-18', 17, 49, 5, 2, 12, 'martin.suarez@mail.com', '3871234567');
DECLARE @LegajoMartin INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('martin.suarez@mail.com', 'msuarez81', 0, @LegajoMartin);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(29998877, 'Julieta', 'Díaz', 'F', 'Argentina', '1987-02-27', 20, 58, 10, 9, 13, 'julieta.diaz@mail.com', '2966123456');
DECLARE @LegajoJulieta INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('julieta.diaz@mail.com', 'jdiaz87', 0, @LegajoJulieta);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(30123456, 'Federico', 'Alvarez', 'M', 'Argentina', '1979-04-04', 10, 28, 7, 10, 14, 'federico.alvarez@mail.com', '3882345678');
DECLARE @LegajoFederico INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('federico.alvarez@mail.com', 'falvarez79', 0, @LegajoFederico);
GO
INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(30111222, 'Valeria', 'Moreno', 'F', 'Argentina', '1983-11-02', 4, 10, 1, 1, 8, 'valeria.moreno@mail.com', '3835123456');
DECLARE @LegajoValeria INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('valeria.moreno@mail.com', 'valmoren83', 0, @LegajoValeria);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(31445566, 'Ricardo', 'Torres', 'M', 'Argentina', '1977-08-14', 6, 16, 11, 5, 14, 'ricardo.torres@mail.com', '2801456789');
DECLARE @LegajoRicardo INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('ricardo.torres@mail.com', 'rtorres77', 0, @LegajoRicardo);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(29994433, 'Paula', 'Vega', 'F', 'Argentina', '1991-01-19', 9, 25, 12, 3, 10, 'paula.vega@mail.com', '3701234567');
DECLARE @LegajoPaula INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('paula.vega@mail.com', 'paulita91', 0, @LegajoPaula);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(28880011, 'Esteban', 'Gutiérrez', 'M', 'Argentina', '1984-04-07', 12, 34, 13, 6, 12, 'esteban.gutierrez@mail.com', '3825123987');
DECLARE @LegajoEsteban INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('esteban.gutierrez@mail.com', 'esteg84', 0, @LegajoEsteban);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(27889955, 'Camila', 'Ortiz', 'F', 'Argentina', '1995-09-03', 14, 40, 3, 2, 9, 'camila.ortiz@mail.com', '3769123456');
DECLARE @LegajoCamila INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('camila.ortiz@mail.com', 'camort95', 0, @LegajoCamila);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(31558877, 'Federico', 'Silva', 'M', 'Argentina', '1989-06-22', 18, 52, 15, 1, 7, 'federico.silva@mail.com', '2648123456');
DECLARE @LegajoFederico2 INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('federico.silva@mail.com', 'fsilva89', 0, @LegajoFederico2);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(31334455, 'Brenda', 'Sosa', 'F', 'Argentina', '1994-02-28', 15, 46, 14, 4, 11, 'brenda.sosa@mail.com', '2996123456');
DECLARE @LegajoBrenda INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('brenda.sosa@mail.com', 'brensosa94', 0, @LegajoBrenda);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(30993322, 'Julio', 'Mansilla', 'M', 'Argentina', '1986-10-10', 21, 61, 4, 3, 13, 'julio.mansilla@mail.com', '3854123456');
DECLARE @LegajoJulio INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('julio.mansilla@mail.com', 'jmans86', 0, @LegajoJulio);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(30445566, 'Martina', 'Navarro', 'F', 'Argentina', '1992-07-15', 16, 47, 10, 6, 13, 'martina.navarro@mail.com', '2920147852');
DECLARE @LegajoMartina INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('martina.navarro@mail.com', 'navarro92', 0, @LegajoMartina);
GO

INSERT INTO Medicos (
  DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me,
  CodProvincia_Pr_Me, CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me, Email_Me, Telefono_Me
) VALUES
(29001122, 'Ignacio', 'Paz', 'M', 'Argentina', '1980-12-05', 22, 64, 5, 2, 9, 'ignacio.paz@mail.com', '2964123456');
DECLARE @LegajoIgnacio INT = SCOPE_IDENTITY();
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('ignacio.paz@mail.com', 'pazignacio80', 0, @LegajoIgnacio);
GO



-- POBLAR USUARIOS (admin)
INSERT INTO Usuarios (Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu) VALUES
('admin1', 'adminpass123', 1, NULL);
GO

-- POBLAR PACIENTES
INSERT INTO Pacientes (
  DNI_Pa, Nombre_Pa, Apellido_Pa, Sexo_Pa, Nacionalidad_Pa, FechaNacimiento_Pa,
  Direccion_Pa, CodProvincia_Pr_Pa, CodLocalidad_Lo_Pa, Email_Pa, Telefono_Pa
) VALUES
(40311223, 'Lucía', 'Alvarez', 'F', 'Argentina', '1992-05-14', 'San Martín 1234', 1, 3, 'lucia.alvarez@mail.com', '2213344556'),
(40422334, 'Fernando', 'Sosa', 'M', 'Argentina', '1988-11-22', 'Belgrano 221', 2, 4, 'fernando.sosa@mail.com', '3516677889'),
(40533445, 'Julieta', 'Martínez', 'F', 'Argentina', '1996-09-10', 'Italia 456', 5, 13, 'julieta.martinez@mail.com', '3621234567'),
(40644556, 'Andrés', 'Gómez', 'M', 'Argentina', '1985-04-03', 'España 789', 6, 16, 'andres.gomez@mail.com', '2974567890'),
(40755667, 'Camila', 'Díaz', 'F', 'Argentina', '1993-06-27', 'Mitre 555', 7, 19, 'camila.diaz@mail.com', '3799988776'),
(40866778, 'Joaquín', 'Moreno', 'M', 'Argentina', '1990-10-12', '25 de Mayo 101', 8, 22, 'joaquin.moreno@mail.com', '3437654321'),
(40977889, 'Rocío', 'Luna', 'F', 'Argentina', '1997-03-18', 'Rivadavia 333', 13, 38, 'rocio.luna@mail.com', '2614433221'),
(41088990, 'Tomás', 'Vega', 'M', 'Argentina', '1989-08-05', 'Urquiza 999', 17, 50, 'tomas.vega@mail.com', '3872211445'),
(41199001, 'Valentina', 'Paz', 'F', 'Argentina', '1994-12-25', 'Lavalle 808', 21, 62, 'valentina.paz@mail.com', '3855332211'),
(41210112, 'Franco', 'Silva', 'M', 'Argentina', '1991-01-09', 'Dorrego 202', 23, 66, 'franco.silva@mail.com', '3817788996'),
(40234567, 'María', 'Fernandez', 'F', 'Argentina', '1995-07-30', 'Av Siempre Viva 456', 3, 4, 'maria.fernandez@mail.com', '3412233445'),
(41321223, 'Martina', 'Gutiérrez', 'F', 'Argentina', '1998-02-17', 'Av. Libertad 1240', 10, 28, 'martina.gutierrez@mail.com', '3884455122'),
(41432334, 'Elías', 'Rojas', 'M', 'Argentina', '1986-07-21', 'San Juan 350', 11, 31, 'elias.rojas@mail.com', '2954123489'),
(41543445, 'Florencia', 'Mansilla', 'F', 'Argentina', '1993-05-06', 'Pellegrini 1199', 14, 41, 'flor.mansilla@mail.com', '3766543210'),
(41654556, 'Agustín', 'Reynoso', 'M', 'Argentina', '1990-01-28', 'Alberdi 600', 15, 45, 'agustin.reynoso@mail.com', '2997766554'),
(41765667, 'Melina', 'Herrera', 'F', 'Argentina', '1997-09-09', 'Av. Alem 1450', 16, 48, 'melina.herrera@mail.com', '2920123456'),
(41876778, 'Benjamín', 'Cáceres', 'M', 'Argentina', '1984-03-13', 'Castelli 332', 18, 51, 'benjamin.caceres@mail.com', '2641122334'),
(41987889, 'Antonella', 'Acosta', 'F', 'Argentina', '1995-11-30', 'Juan B. Justo 422', 19, 54, 'antonella.acosta@mail.com', '2655342211'),
(42098990, 'Facundo', 'Ibarra', 'M', 'Argentina', '1987-06-16', 'Av. Perón 707', 20, 57, 'facundo.ibarra@mail.com', '2966547890'),
(42109001, 'Bárbara', 'Salas', 'F', 'Argentina', '1996-04-22', 'Paso 877', 22, 65, 'barbara.salas@mail.com', '2901123456'),
(42210112, 'Gastón', 'Quiroga', 'M', 'Argentina', '1992-12-01', 'Obligado 188', 23, 68, 'gaston.quiroga@mail.com', '3819988771');
GO


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
INSERT INTO Turnos (
  Legajo_Me_Tu, CodHorarioTurno_HT_Tu, FechaTurno_Tu, DNI_Pa_Tu
) VALUES
(1, 4, '2025-07-03', 40311223),
(2, 5, '2025-07-03', 40422334),
(3, 6, '2025-07-04', 40533445),
(4, 7, '2025-07-04', 40644556),
(5, 8, '2025-07-05', 40755667),
(6, 9, '2025-07-05', 40866778),
(7, 10, '2025-07-06', 40977889),
(8, 11, '2025-07-06', 41088990),
(9, 12, '2025-07-07', 41199001),
(10, 13, '2025-07-07', 41210112),
(11, 1, '2025-07-08', 41321223),
(12, 2, '2025-07-08', 41432334),
(13, 3, '2025-07-09', 41543445),
(14, 4, '2025-07-09', 41654556),
(15, 5, '2025-07-10', 41765667),
(16, 6, '2025-07-10', 41876778),
(17, 7, '2025-07-11', 41987889),
(18, 8, '2025-07-11', 42098990),
(19, 9, '2025-07-12', 42109001),
(20, 10, '2025-07-12', 42210112);
GO

