CREATE DATABASE Clinica;
GO

USE Clinica;
GO

-- TABLA USUARIOS
CREATE TABLE Usuarios (
	CodUsuario_Usu INT IDENTITY(1,1) NOT NULL,
	Nombre_Usu VARCHAR(100) NOT NULL,
	Contrasenia_Usu VARCHAR(100) NOT NULL,
	Tipo_Usu BIT NOT NULL, -- 0 = medico, 1 = admin

	CONSTRAINT PK_Usuarios PRIMARY KEY (codUsuario_Usu),

	CONSTRAINT UK_Usuarios UNIQUE (Nombre_Usu)
);
GO

-- TABLA ESPECIALIDADES
CREATE TABLE Especialidades (
	CodEspecialidad_Es INT IDENTITY(1,1) NOT NULL,
	NombreEspecialidad_Es VARCHAR(50) NOT NULL,

	CONSTRAINT PK_Especialidades PRIMARY KEY (CodEspecialidad_Es)
);
GO

-- TABLA PROVINCIAS
CREATE TABLE Provincias (
	CodProvincia_Pr INT IDENTITY(1,1) NOT NULL,
	NombreProvincia_Pr VARCHAR(100) NOT NULL,

	CONSTRAINT PK_Provincias PRIMARY KEY (CodProvincia_Pr)
);
GO

-- TABLA LOCALIDADES
CREATE TABLE Localidades (
	CodLocalidad_Lo INT IDENTITY(1,1) NOT NULL,
	NombreLocalidad_Lo VARCHAR(100) NOT NULL,
	CodProvincia_Pr_Lo INT NOT NULL,

	CONSTRAINT PK_Localidades PRIMARY KEY (CodLocalidad_Lo),

	CONSTRAINT FK_Localidades_Provincias FOREIGN KEY (CodProvincia_Pr_Lo) REFERENCES Provincias(CodProvincia_Pr)
);
GO

-- TABLA MÉDICOS
CREATE TABLE Medicos (
	Legajo_Me INT IDENTITY(1,1) NOT NULL,
	DNI_Me INT UNIQUE NOT NULL,
	Nombre_Me VARCHAR(100) NOT NULL,
	Apellido_Me VARCHAR(100) NOT NULL,
	Sexo_Me CHAR(1) CHECK (Sexo_Me IN('M', 'F')),
	Nacionalidad_Me VARCHAR(50),
	FechaNacimiento_Me DATE,
	CodProvincia_Pr_Me INT NOT NULL,
	CodLocalidad_Lo_Me INT NOT NULL,
	CodEspecialidad_Es_Me INT NOT NULL,
	HoraEntrada_Me TIME(0) NOT NULL,
	HoraSalida_Me TIME(0) NOT NULL,
	Email_Me VARCHAR(100),
	Telefono_Me VARCHAR(20),
	Estado_Me BIT DEFAULT(1),

	CONSTRAINT PK_Medicos PRIMARY KEY (Legajo_Me),

	CONSTRAINT FK_Medicos_Provincias FOREIGN KEY (CodProvincia_Pr_Me) REFERENCES Provincias(CodProvincia_Pr),
	CONSTRAINT FK_Medicos_Localidades FOREIGN KEY (CodLocalidad_Lo_Me) REFERENCES Localidades(CodLocalidad_Lo),
	CONSTRAINT FK_Medicos_Especialidades FOREIGN KEY (CodEspecialidad_Es_Me) REFERENCES Especialidades(CodEspecialidad_Es),

	CONSTRAINT UQ_Medicos UNIQUE (DNI_Me)
);
GO

-- TABLA PACIENTES
CREATE TABLE Pacientes (
	DNI_Pa INT NOT NULL,
	Nombre_Pa VARCHAR(100) NOT NULL,
	Apellido_Pa VARCHAR(100) NOT NULL,
	Sexo_Pa CHAR(1) CHECK (Sexo_Pa IN('M', 'F')),
	Nacionalidad_Pa VARCHAR(50),
	FechaNacimiento_Pa DATE,
	Direccion_Pa VARCHAR(200),
	CodProvincia_Pr_Pa INT NOT NULL,
	CodLocalidad_Lo_Pa INT NOT NULL,
	Email_Pa VARCHAR(100),
	Telefono_Pa VARCHAR(20),
	Estado_Pa BIT DEFAULT(1),

	CONSTRAINT PK_Pacientes PRIMARY KEY (DNI_Pa),

	CONSTRAINT FK_Pacientes_Provincias FOREIGN KEY (CodProvincia_Pr_Pa) REFERENCES Localidades(CodLocalidad_Lo),
	CONSTRAINT FK_Pacientes_Localidad FOREIGN KEY (CodLocalidad_Pr_Pa) REFERENCES Localidades(CodLocalidad_Lo),

	CONSTRAINT UQ_Pacientes UNIQUE (DNI_Pa)
);
GO

-- TABLA HORARIOS DE TURNOS
CREATE TABLE HorariosTurno (
	CodHorarioTurno_HT INT IDENTITY(1,1) NOT NULL,
	Horario_HT TIME NOT NULL

	CONSTRAINT PK_HorariosTurnos PRIMARY KEY (CodHorarioTurno_HT)
);
GO

-- TABLA TURNOS
CREATE TABLE Turnos (
	Legajo_Me_Tu INT NOT NULL,
	CodHorarioTurno_HT_Tu INT NOT NULL,
	FechaTurno_Tu DATE NOT NULL,
	DNI_Pa_Tu INT NOT NULL,

	CONSTRAINT PK_Turnos PRIMARY KEY (Legajo_Me_Tu, CodHorarioTurno_HT_Tu, FechaTurno_Tu), -- Esto evita que un médico tenga dos turnos superpuestos

	CONSTRAINT FK_Turnos_Medicos FOREIGN KEY (Legajo_Me_Tu) REFERENCES Medicos(Legajo_Me),
	CONSTRAINT FK_Turnos_HorariosTurnos FOREIGN KEY (CodHorarioTurno_HT_Tu) REFERENCES HorariosTurno(CodHorarioTurno_HT),
	CONSTRAINT FK_Turnos_Pacientes FOREIGN KEY (DNI_Pa_Tu) REFERENCES Pacientes(DNI_Pa),

	CONSTRAINT UK_Turnos UNIQUE (CodHorarioTurno_HT_Tu, FechaTurno_Tu, DNI_Pa_Tu) -- Esto evita que un paciente tenga dos turnos superpuestos
);
GO