CREATE DATABASE Clinica
GO

USE Clinica
GO

-- TABLA ESPECIALIDADES
CREATE TABLE Especialidades (
	CodEspecialidad_Es INT IDENTITY(1,1) NOT NULL,
	NombreEspecialidad_Es VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Especialidades PRIMARY KEY (CodEspecialidad_Es)
);
GO

-- TABLA HORARIOS DE ATENCIÓN
CREATE TABLE HorariosAtencion (
	CodHorarioAtencion_HA INT IDENTITY(1,1) NOT NULL,
	HoraInicio_HA TIME NOT NULL,
	HoraFin_HA TIME NOT NULL,
	CONSTRAINT PK_HorariosAtencion PRIMARY KEY (CodHorarioAtencion_HA)
);
GO

-- TABLA DÍAS DE ATENCIÓN
CREATE TABLE DiasAtencion (
	CodDiaAtencion_DA INT IDENTITY(1,1) NOT NULL,
	NombreDia_DA VARCHAR(20) NOT NULL,
	CONSTRAINT PK_DiaAtencion PRIMARY KEY (CodDiaAtencion_DA)
);
GO

-- TABLA HORARIOS DE ATENCIÓN POR DÍA
CREATE TABLE HorariosDeAtencionPorDia (
	CodDiaAtencion_HAD INT NOT NULL,
	CodHorarioAtencion_HAD INT NOT NULL,
	CONSTRAINT PK_HorariosDeAtencionPorDia PRIMARY KEY (CodDiaAtencion_HAD, CodHorarioAtencion_HAD),
	CONSTRAINT FK_HorariosDeAtencionPorDia_Dia FOREIGN KEY (CodDiaAtencion_HAD) REFERENCES DiasAtencion(CodDiaAtencion_DA),
	CONSTRAINT FK_HorariosDeAtencionPorDia_Horario FOREIGN KEY (CodHorarioAtencion_HAD) REFERENCES HorariosAtencion(CodHorarioAtencion_HA)
);
GO

-- TABLA PROVINCIAS
CREATE TABLE Provincias (
	IDProvincia INT IDENTITY(1,1) NOT NULL,
	NombreProvincia VARCHAR(100) NOT NULL,
	CONSTRAINT PK_Provincias PRIMARY KEY (IDProvincia)
);
GO

-- TABLA LOCALIDADES
CREATE TABLE Localidades (
	IDLocalidad INT IDENTITY(1,1) NOT NULL,
	NombreLocalidad VARCHAR(100) NOT NULL,
	IDProvincia INT NOT NULL,
	CONSTRAINT PK_Localidades PRIMARY KEY (IDLocalidad),
	CONSTRAINT FK_Localidades_Provincia FOREIGN KEY (IDProvincia) REFERENCES Provincias(IDProvincia)
);
GO

-- TABLA MÉDICO
CREATE TABLE Medico (
	LegajoMedico INT IDENTITY(1,1) NOT NULL,
	DNI INT NOT NULL,
	NombreMedico VARCHAR(100) NOT NULL,
	ApellidoMedico VARCHAR(100) NOT NULL,
	Sexo CHAR(1) CHECK (Sexo IN('M', 'F')),
	Nacionalidad VARCHAR(50),
	FechaNacimiento DATE,
	Localidad INT NOT NULL,
	Especialidad INT NOT NULL,
	DiaAtencion INT NOT NULL,
	Horario INT NOT NULL,
	Email VARCHAR(100),
	Telefono VARCHAR(20),
	CONSTRAINT PK_Medico PRIMARY KEY (LegajoMedico),
	CONSTRAINT FK_Medico_Localidad FOREIGN KEY (Localidad) REFERENCES Localidades(IDLocalidad),
	CONSTRAINT FK_Medico_Especialidad FOREIGN KEY (Especialidad) REFERENCES Especialidades(CodEspecialidad_Es),
	CONSTRAINT FK_Medico_DiaAtencion FOREIGN KEY (DiaAtencion) REFERENCES DiasAtencion(CodDiaAtencion_DA),
    CONSTRAINT FK_Medico_Horario FOREIGN KEY (Horario) REFERENCES HorariosAtencion(CodHorarioAtencion_HA)

);
GO

-- TABLA PACIENTES
CREATE TABLE Pacientes (
	DNI INT NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	Apellido VARCHAR(100) NOT NULL,
	Sexo VARCHAR(10),
	Nacionalidad VARCHAR(50),
	FechaNacimiento DATE,
	Direccion VARCHAR(200),
	IDLocalidad INT NOT NULL,
	CorreoElectronico VARCHAR(100),
	Telefono VARCHAR(20),
	CONSTRAINT PK_Pacientes PRIMARY KEY (DNI),
	CONSTRAINT FK_Pacientes_Localidad FOREIGN KEY (IDLocalidad) REFERENCES Localidades(IDLocalidad)
);
GO

-- TABLA USUARIOS
CREATE TABLE Usuarios (
	IDUsuario INT IDENTITY(1,1) NOT NULL,
	NombreUsuario VARCHAR(100) NOT NULL,
	Contraseña VARCHAR(100) NOT NULL,
	TipoUsuario BIT NOT NULL, -- 0 = paciente, 1 = médico/admin
	CONSTRAINT PK_Usuarios PRIMARY KEY (IDUsuario)
);
GO

-- TABLA HORARIO x DÍA x MÉDICO
CREATE TABLE Horario_x_Dia_x_Medico (
	CodDiaAtencion INT NOT NULL,
	CodHorarioAtencion INT NOT NULL,
	LegajoMedico INT NOT NULL,
	CONSTRAINT PK_HorarioDiaMedico PRIMARY KEY (CodDiaAtencion, CodHorarioAtencion, LegajoMedico),
	CONSTRAINT FK_HDM_HorariosDeAtencionPorDia FOREIGN KEY (CodDiaAtencion, CodHorarioAtencion)
		REFERENCES HorariosDeAtencionPorDia(CodDiaAtencion_HAD, CodHorarioAtencion_HAD),
	CONSTRAINT FK_HDM_Medico FOREIGN KEY (LegajoMedico) REFERENCES Medico(LegajoMedico)
);
GO

-- TABLA HORARIOS DE TURNOS
CREATE TABLE HorariosDeTurnos (
	IDHorarioTurno INT IDENTITY(1,1) NOT NULL,
	HoraTurno TIME NOT NULL,
	CONSTRAINT PK_HorariosDeTurnos PRIMARY KEY (IDHorarioTurno)
);
GO

-- TABLA TURNOS
CREATE TABLE Turnos (
	IDTurno INT IDENTITY(1,1) NOT NULL,
	DNIPaciente INT NOT NULL,
	FechaTurno DATE NOT NULL,
	IDHorarioTurno INT NOT NULL,
	LegajoMedico INT NOT NULL,
	CodEspecialidad INT NOT NULL,
	CONSTRAINT PK_Turnos PRIMARY KEY (IDTurno),
	CONSTRAINT FK_Turno_Paciente FOREIGN KEY (DNIPaciente) REFERENCES Pacientes(DNI),
	CONSTRAINT FK_Turno_Horario FOREIGN KEY (IDHorarioTurno) REFERENCES HorariosDeTurnos(IDHorarioTurno),
	CONSTRAINT FK_Turno_Medico FOREIGN KEY (LegajoMedico) REFERENCES Medico(LegajoMedico),
	CONSTRAINT FK_Turno_Especialidad FOREIGN KEY (CodEspecialidad) REFERENCES Especialidades(CodEspecialidad_Es)
);
GO
