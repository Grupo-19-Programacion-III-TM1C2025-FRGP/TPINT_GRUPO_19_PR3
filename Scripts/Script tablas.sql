CREATE DATABASE Clinica
GO

USE Clinica
GO

CREATE TABLE Especialidades
(
	CodEspecialidad_Es INT NOT NULL,
	NombreEspecialidad_Es VARCHAR(20) NOT NULL

	CONSTRAINT PK_Especialidades PRIMARY KEY(CodEspecialidad_Es)
)
GO

CREATE TABLE HorariosAtencion
(
	CodHorarioAtencion_HA INT NOT NULL,
	HoraInicio_HA TIME NOT NULL,
	HoraFin_HA TIME NOT NULL

	CONSTRAINT PK_HorariosAtencion PRIMARY KEY(CodHorarioAtencion_HA)
)
GO

CREATE TABLE DiasAtencion
(
	CodDiaAtencion_DA INT NOT NULL,
	NombreDia_DA VARCHAR(9) NOT NULL

	CONSTRAINT PK_DiaAtencion PRIMARY KEY(CodDiaAtencion_DA)
)
GO

CREATE TABLE HorariosDeAtencionPorDia
(
	CodDiaAtencion_HAD INT NOT NULL,
	CodHorarioAtencion_HAD INT NOT NULL

	CONSTRAINT FK_HorariosDeAtencionPorDia_DiasAtencion FOREIGN KEY(CodDiaAtencion_HAD) REFERENCES DiasAtencion(CodDiaAtencion_DA),
	CONSTRAINT FK_HorariosDeAtencionPorDia_HorariosAtencion FOREIGN KEY(CodHorarioAtencion_HAD) REFERENCES HorariosAtencion(CodHorarioAtencion_HA),

	CONSTRAINT PK_HorariosDeAtencionPorDia PRIMARY KEY(CodDiaAtencion_HAD, CodHorarioAtencion_HAD)
)
GO

CREATE TABLE Provincias (
    IDProvincia INT PRIMARY KEY,
    NombreProvincia VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Localidades (
    IDLocalidad INT PRIMARY KEY,
    NombreLocalidad VARCHAR(100) NOT NULL,
    IDProvincia INT NOT NULL FOREIGN KEY REFERENCES Provincias(IDProvincia)
);
GO

CREATE TABLE Medico (
    LegajoMedico INT IDENTITY (1,1 )PRIMARY KEY,
    DNI INT NOT NULL,
    NombreMedico VARCHAR(100) NOT NULL,
    ApellidoMedico VARCHAR(100) NOT NULL,
    Sexo VARCHAR(10),
    Nacionalidad VARCHAR(50),
    FechaNacimiento DATE,
    Localidad INT NOT NULL FOREIGN KEY REFERENCES Localidades(IDLocalidad),
    Especialidad INT NOT NULL FOREIGN KEY REFERENCES Especialidades(CodEspecialidad_Es),
    Email VARCHAR(100),
    Telefono VARCHAR(20),
);
