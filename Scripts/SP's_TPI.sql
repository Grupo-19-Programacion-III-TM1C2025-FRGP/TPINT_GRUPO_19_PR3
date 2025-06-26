USE Clinica;
GO

CREATE PROCEDURE spAltaMedico
(
    @DNI CHAR(8),
    @NombreMedico VARCHAR(20),
    @ApellidoMedico VARCHAR(20),
    @Sexo CHAR(1),
    @Nacionalidad VARCHAR(30),
    @FechaNacimiento DATE,
	@Provincia INT,
    @Localidad INT,
    @Especialidad INT,
    @DiaAtencion INT,
    @HoraEntrada TIME(0),
	@HoraSalida TIME(0),
    @Email VARCHAR(30),
    @Telefono VARCHAR(20)
)
AS
BEGIN
    INSERT INTO Medicos (
	DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me, CodProvincia_Pr_Me,
        CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, Email_Me, Telefono_Me, HorarioEntrada_Me, HorarioSalida_Me
    )
    VALUES (
        @DNI, @NombreMedico, @ApellidoMedico, @Sexo, @Nacionalidad, @FechaNacimiento, @Provincia,
        @Localidad, @Especialidad, @Email, @Telefono, @HoraEntrada, @HoraSalida
    )
END
GO

CREATE PROCEDURE spTraerTablaMedicos
AS
	BEGIN
		SELECT
			M.Legajo_Me AS Legajo,
			M.DNI_Me AS DNI,
			M.Apellido_Me AS Nombre,
			M.Nombre_Me AS Apellido,
			M.Sexo_Me AS Sexo,
			M.Nacionalidad_Me AS Nacionalidad,
			M.FechaNacimiento_Me AS [Fecha de nacimiento],
			M.Email_Me AS [Correo electronico],
			M.Telefono_Me AS Telefono,
			M.HorarioEntrada_Me AS [Horario de entrada],
			M.HorarioSalida_Me AS [Horario de salida],

			E.NombreEspecialidad_Es AS Especialidad,

			P.NombreProvincia_Pr AS Provincia,

			L.NombreLocalidad_Lo AS Localidad,

			M.Estado_Me AS Estado

			FROM Medicos AS M

				INNER JOIN Especialidades AS E
				ON E.CodEspecialidad_Es = M.CodEspecialidad_Es_Me
					INNER JOIN Localidades AS L
					ON L.CodLocalidad_Lo = M.CodLocalidad_Lo_Me
						INNER JOIN Provincias AS P
						ON P.CodProvincia_Pr = L.CodProvincia_Pr_Lo

			ORDER BY Estado DESC
	END;
GO

CREATE PROCEDURE spTraerTablaMedicosCodificada
AS
	BEGIN
		SELECT
			M.Legajo_Me AS Legajo,
			M.DNI_Me AS DNI,
			M.Apellido_Me AS Nombre,
			M.Nombre_Me AS Apellido,
			M.Sexo_Me AS Sexo,
			M.Nacionalidad_Me AS Nacionalidad,
			M.FechaNacimiento_Me AS [Fecha de nacimiento],
			M.Email_Me AS [Correo electronico],
			M.Telefono_Me AS Telefono,
			M.HorarioEntrada_Me AS [Horario de entrada],
			M.HorarioSalida_Me AS [Horario de salida],

			M.CodEspecialidad_Es_Me AS Especialidad,

			M.CodProvincia_Pr_Me AS Provincia,

			M.CodLocalidad_Lo_Me AS Localidad,

			M.Estado_Me AS Estado

			FROM Medicos AS M

			ORDER BY Estado DESC
	END;
GO

CREATE PROCEDURE dbo.spAltaPaciente
    @DNI CHAR(8),
    @Nombre VARCHAR(20),
    @Apellido VARCHAR(20),
    @Sexo CHAR(1),
    @Nacionalidad VARCHAR(30),
    @FechaNacimiento DATE,
    @Direccion VARCHAR(50),
	@Provincia INT,
    @Localidad INT,
    @CorreoElectronico VARCHAR(30),
    @Telefono VARCHAR(20)
AS
BEGIN
    INSERT INTO Pacientes (
        DNI_Pa, Nombre_Pa, Apellido_Pa, Sexo_Pa, Nacionalidad_Pa,
        FechaNacimiento_Pa, Direccion_Pa, CodProvincia_Pr_Pa, CodLocalidad_Lo_Pa,
        Email_Pa, Telefono_Pa
    )
    VALUES (
        @DNI, @Nombre, @Apellido, @Sexo, @Nacionalidad,
        @FechaNacimiento, @Direccion, @Provincia, @Localidad,
        @CorreoElectronico, @Telefono
    )
END;
GO

CREATE PROCEDURE spTraerTablaPacientes 
AS
	BEGIN
		SELECT 
			PA.DNI_Pa AS DNI,
			PA.Apellido_Pa AS Nombre,
			PA.Nombre_Pa AS Apellido,
			PA.Sexo_Pa AS Sexo,
			PA.Nacionalidad_Pa AS Nacionalidad,
			PA.FechaNacimiento_Pa AS [Fecha de nacimiento],
			PA.Direccion_Pa AS Direccion,
			PA.Email_Pa AS [Correo electronico],
			PA.Telefono_Pa AS Telefono,

			PR.NombreProvincia_Pr AS Provincia,

			L.NombreLocalidad_Lo AS Localidad,

			PA.Estado_Pa AS Estado

			FROM Pacientes AS PA

				INNER JOIN Localidades AS L
				ON L.CodLocalidad_Lo = PA.CodLocalidad_Pr_Pa
					INNER JOIN Provincias AS PR
					ON PR.CodProvincia_Pr = L.CodProvincia_Pr_Lo

		ORDER BY Estado DESC
	END;
GO

CREATE PROCEDURE spTraerTablaPacientesCodificada
AS
	BEGIN
		SELECT
			PA.DNI_Pa AS DNI,
			PA.Apellido_Pa AS Nombre,
			PA.Nombre_Pa AS Apellido,
			PA.Sexo_Pa AS Sexo,
			PA.Nacionalidad_Pa AS Nacionalidad,
			PA.FechaNacimiento_Pa AS [Fecha de nacimiento],
			PA.Direccion_Pa AS Direccion,
			PA.Email_Pa AS [Correo electronico],
			PA.Telefono_Pa AS Telefono,

			PA.CodProvincia_Pr_Pa AS Provincia,

			PA.CodLocalidad_Lo_Pa AS Localidad,

			PA.Estado_Pa AS Estado

			FROM Pacientes AS PA

			ORDER BY Estado DESC
	END;
GO

CREATE PROCEDURE spBajaPaciente @DNI CHAR(8)
AS
	BEGIN
		UPDATE Pacientes
			SET Estado_Pa = 0
			WHERE DNI_Pa = @DNI
	END;
GO

CREATE PROCEDURE spBajaMedico @LEGAJO CHAR(5)
AS
	BEGIN
		UPDATE Medicos
			SET Estado_Me = 0
			WHERE Legajo_Me = @LEGAJO
	END;
GO

CREATE PROCEDURE spModificarMedico
(
	@LEGAJO CHAR(5),
    @DNI CHAR(8),
    @NombreMedico VARCHAR(20),
    @ApellidoMedico VARCHAR(20),
    @Sexo CHAR(1),
    @Nacionalidad VARCHAR(30),
    @FechaNacimiento DATE,
	@Provincia INT,
    @Localidad INT,
    @Especialidad INT,
    @Email VARCHAR(30),
    @Telefono VARCHAR(20),
    @HoraEntrada TIME,
	@HoraSalida TIME,
	@Estado BIT
)
AS
	BEGIN
		UPDATE Medicos
			SET DNI_Me = @DNI,
				Nombre_Me = @NombreMedico,
				Apellido_Me = @ApellidoMedico,
				Sexo_Me = @Sexo,
				Nacionalidad_Me = @Nacionalidad,
				FechaNacimiento_Me = @FechaNacimiento,
				CodProvincia_Pr_Me = @Provincia,
				CodLocalidad_Lo_Me = @Localidad,
				CodEspecialidad_Es_Me = @Especialidad,
				Email_Me = @Email,
				Telefono_Me = @Telefono,
				HorarioEntrada_Me = @HoraEntrada,
				HorarioSalida_Me = @HoraSalida,
				Estado_Me = @Estado
			WHERE Legajo_Me = @LEGAJO
	END;
GO

CREATE PROCEDURE spModificarPaciente
(
    @DNI CHAR(8),
    @NombrePaciente VARCHAR(20),
    @ApellidoPaciente VARCHAR(20),
    @Sexo CHAR(1),
    @Nacionalidad VARCHAR(30),
    @FechaNacimiento DATE,
	@Direccion VARCHAR(50),
	@Provincia INT,
    @Localidad INT,
    @Email VARCHAR(30),
    @Telefono VARCHAR(20),
	@Estado BIT
)
AS
	BEGIN
		UPDATE Pacientes
			SET
				Nombre_Pa = @NombrePaciente,
				Apellido_Pa = @ApellidoPaciente,
				Sexo_Pa = @Sexo,
				Nacionalidad_Pa = @Nacionalidad,
				FechaNacimiento_Pa = @FechaNacimiento,
				CodProvincia_Pr_Pa = @Provincia,
				CodLocalidad_Lo_Pa = @Localidad,
				Email_Pa = @Email,
				Telefono_Pa = @Telefono,
				Estado_Pa = @Estado
			WHERE DNI_Pa = @DNI
	END;
GO

-- Chequear
CREATE PROCEDURE CalcularPorcentajeEstado(
    @FechaInicio DATE,
    @FechaFin DATE
)
AS
BEGIN
    DECLARE @TotalTurnos INT;
    DECLARE @Ausentes INT;
    DECLARE @Presentes INT;
    DECLARE @PorcentajeAusentes DECIMAL(5, 2);
    DECLARE @PorcentajePresentes DECIMAL(5, 2);

    -- Obtener el total de turnos dentro del rango de fechas
    SELECT @TotalTurnos = COUNT(*)
    FROM Turnos
    WHERE FechaTurno BETWEEN @FechaInicio AND @FechaFin;

    -- Contar ausentes y presentes
    SELECT 
        @Ausentes = COUNT(CASE WHEN EstadoAsistencia = 'Ausente' THEN 1 END),
        @Presentes = COUNT(CASE WHEN EstadoAsistencia = 'Presente' THEN 1 END)
    FROM Turnos
    WHERE FechaTurno BETWEEN @FechaInicio AND @FechaFin;

    -- Calcular porcentajes
    IF @TotalTurnos > 0
    BEGIN
        SET @PorcentajeAusentes = (CONVERT(DECIMAL(5, 2), @Ausentes) / @TotalTurnos) * 100;
        SET @PorcentajePresentes = (CONVERT(DECIMAL(5, 2), @Presentes) / @TotalTurnos) * 100;
    END
    ELSE
    BEGIN
        SET @PorcentajeAusentes = 0.00;
        SET @PorcentajePresentes = 0.00;
    END

    -- Mostrar resultados
    SELECT 
        TotalTurnos = @TotalTurnos,
        Ausentes = @Ausentes,
        Presentes = @Presentes,
        PorcentajeAusentes = @PorcentajeAusentes,
        PorcentajePresentes = @PorcentajePresentes;
END;
GO 

CREATE PROCEDURE ObtenerTurnosPorEspecialidad(
    @FechaInicio DATE,
    @FechaFin DATE
)
AS
BEGIN
    SELECT 
        E.NombreEspecialidad_Es,
        COUNT(*) AS TotalTurnos
    FROM Turnos T
    INNER JOIN Especialidades E ON T.CodEspecialidad = E.NombreEspecialidad_Es
    WHERE 
        T.FechaTurno BETWEEN @FechaInicio AND @FechaFin
        AND E.NombreEspecialidad_Es IN (
            'Kinesiolog�a',
            'Traumatolog�a',
            'Cardiolog�a',
            'Cl�nica M�dica',
            'Pediatr�a',
            'Dermatolog�a',
            'Ginecolog�a',
            'Neurolog�a',
            'Urolog�a',
            'Oncolog�a',
            'Psiquiatr�a',
            'Reumatolog�a',
            'Endocrinolog�a',
            'Infectolog�a',
            'Neumonolog�a',
            'Hematolog�a',
            'Fonoaudiolog�a',
            'Nutrici�n'
        )
    GROUP BY E.NombreEspecialidad_Es
    ORDER BY TotalTurnos DESC;
END;
GO

CREATE PROCEDURE Filtro_Ausentes(
    @FechaInicio DATE,
    @FechaFin DATE
)
AS
BEGIN

SELECT T.DNIPaciente, T.FechaTurno, HT.HoraTurno, (M.NombreMedico + ' ' + M.ApellidoMedico) AS Nombre_Apellido_Medico, ES.NombreEspecialidad_Es, T.EstadoAsistencia
FROM Turnos AS T 
INNER JOIN HorariosDeTurnos AS HT ON T.IDHorarioTurno = HT.IDHorarioTurno
INNER JOIN Medico AS M ON T.LegajoMedico = M.LegajoMedico
INNER JOIN Especialidades AS ES ON T.CodEspecialidad = ES.CodEspecialidad_Es
WHERE T.EstadoAsistencia = 'Ausente' AND FechaNacimiento >= @FechaInicio AND FechaTurno <= @FechaFin

END
GO

CREATE PROCEDURE Filtro_Presentes(

    @FechaInicio DATE,
    @FechaFin DATE
)
AS
BEGIN

SELECT T.DNIPaciente, T.FechaTurno, HT.HoraTurno, (M.NombreMedico + ' ' + M.ApellidoMedico) AS Nombre_Apellido_Medico, ES.NombreEspecialidad_Es, T.EstadoAsistencia
FROM Turnos AS T 
INNER JOIN HorariosDeTurnos AS HT ON T.IDHorarioTurno = HT.IDHorarioTurno
INNER JOIN Medico AS M ON T.LegajoMedico = M.LegajoMedico
INNER JOIN Especialidades AS ES ON T.CodEspecialidad = ES.CodEspecialidad_Es
WHERE T.EstadoAsistencia = 'Presentes' AND FechaNacimiento >= @FechaInicio AND FechaTurno <= @FechaFin

END