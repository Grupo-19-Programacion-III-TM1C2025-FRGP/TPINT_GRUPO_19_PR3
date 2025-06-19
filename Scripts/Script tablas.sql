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

