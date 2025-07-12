USE Clinica;
GO

CREATE OR ALTER PROCEDURE spVerificarExistenciaPaciente
    @DNIPaciente CHAR(8)
AS
BEGIN
    SELECT COUNT(DNI_Pa) AS Cantidad
    FROM Pacientes
    WHERE DNI_Pa = @DNIPaciente
END;
GO

CREATE OR ALTER PROCEDURE spVerificarDisponibilidadPaciente @DNIPaciente CHAR(8), @CodHorario INT, @Fecha DATE
	AS
		BEGIN
			SELECT COUNT(*) FROM Turnos
				WHERE DNI_Pa_Tu = @DNIPaciente
				AND CodHorarioTurno_HT_Tu = @CodHorario
				AND FechaTurno_Tu = @Fecha
		END;
GO

CREATE OR ALTER PROCEDURE spVerificarDisponibilidadMedico @LegajoMedico INT, @CodHorario INT, @Fecha Date
AS
	BEGIN
		SELECT COUNT(*) FROM Turnos
			WHERE Legajo_Me_Tu = @LegajoMedico
			AND CodHorarioTurno_HT_Tu = @CodHorario
			AND FechaTurno_Tu = @Fecha
	END;
GO

CREATE OR ALTER PROCEDURE spAsignarTurno
    @LegajoMedico INT,
    @CodigoHora INT,
    @Fecha DATE,
    @DNIPaciente CHAR(8)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Turnos (Legajo_Me_Tu, CodHorarioTurno_HT_Tu, FechaTurno_Tu, DNI_Pa_Tu)
        VALUES (@LegajoMedico, @CodigoHora, @Fecha, @DNIPaciente)

        RETURN 1  -- OK
    END TRY
    BEGIN CATCH
        RETURN 0  -- Error
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE spAltaMedico
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
    @CodHoraEntrada INT,
	@CodHoraSalida INT,
    @Email VARCHAR(100),
    @Telefono VARCHAR(20),
	@Usuario VARCHAR(100),
	@Contrasenia VARCHAR(100)
)
AS
BEGIN
    INSERT INTO Medicos (
	DNI_Me, Nombre_Me, Apellido_Me, Sexo_Me, Nacionalidad_Me, FechaNacimiento_Me, CodProvincia_Pr_Me,
        CodLocalidad_Lo_Me, CodEspecialidad_Es_Me, Email_Me, Telefono_Me, CodHoraEntrada_HT_Me, CodHoraSalida_HT_Me
    )
    VALUES (
        @DNI, @NombreMedico, @ApellidoMedico, @Sexo, @Nacionalidad, @FechaNacimiento, @Provincia,
        @Localidad, @Especialidad, @Email, @Telefono, @CodHoraEntrada, @CodHoraSalida
    )
	
	 -- Obtener el Legajo del médico recién insertado
    DECLARE @LegajoMedico INT;
    SET @LegajoMedico = SCOPE_IDENTITY(); -- Trae el Ultimo valor IDENTITY generado en la consulta

    -- Insertar en Usuarios
    INSERT INTO Usuarios (
        Nombre_Usu, Contrasenia_Usu, Tipo_Usu, Legajo_Me_Usu
    )
    VALUES (
        @Usuario, @Contrasenia, 0, @LegajoMedico
    );
END
GO

CREATE OR ALTER PROCEDURE spTraerTablaMedicos
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
			M.CodHoraEntrada_HT_Me AS [Horario de entrada],
			M.CodHoraSalida_HT_Me AS [Horario de salida],

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

CREATE OR ALTER PROCEDURE spTraerTablaMedicosConUsuarios
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
			M.CodHoraEntrada_HT_Me AS [Horario de entrada],
			M.CodHoraSalida_HT_Me AS [Horario de salida],

			M.CodEspecialidad_Es_Me AS Especialidad,

			M.CodProvincia_Pr_Me AS Provincia,

			M.CodLocalidad_Lo_Me AS Localidad,

			U.Nombre_Usu,
			U.Contrasenia_Usu,

			M.Estado_Me AS Estado

			FROM Medicos AS M

				INNER JOIN Usuarios AS U
				ON U.Legajo_Me_Usu = M.Legajo_Me

			ORDER BY Estado DESC
	END;
GO

CREATE OR ALTER PROCEDURE spTraerTablaMedicosCodificada
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
			M.CodHoraEntrada_HT_Me AS [Horario de entrada],
			M.CodHoraSalida_HT_Me AS [Horario de salida],

			M.CodEspecialidad_Es_Me AS Especialidad,

			M.CodProvincia_Pr_Me AS Provincia,

			M.CodLocalidad_Lo_Me AS Localidad,

			M.Estado_Me AS Estado

			FROM Medicos AS M

			ORDER BY Estado DESC
	END;
GO

CREATE OR ALTER PROCEDURE dbo.spAltaPaciente
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

CREATE OR ALTER PROCEDURE spTraerTablaPacientes 
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
				ON L.CodLocalidad_Lo = PA.CodLocalidad_Lo_Pa
					INNER JOIN Provincias AS PR
					ON PR.CodProvincia_Pr = L.CodProvincia_Pr_Lo

		ORDER BY Estado DESC
	END;
GO

CREATE OR ALTER PROCEDURE spTraerTablaPacientesCodificada
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

CREATE OR ALTER PROCEDURE spBajaPaciente @DNI CHAR(8)
AS
	BEGIN
		UPDATE Pacientes
			SET Estado_Pa = 0
			WHERE DNI_Pa = @DNI
	END;
GO

CREATE OR ALTER PROCEDURE spBajaMedico @LEGAJO INT
AS
	BEGIN
		UPDATE Medicos
			SET Estado_Me = 0
			WHERE Legajo_Me = @LEGAJO
	END;
GO

CREATE OR ALTER PROCEDURE spModificarMedico
(
	@LEGAJO INT,
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
    @CodHoraEntrada INT,
	@CodHoraSalida INT,
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
				CodHoraEntrada_HT_Me = @CodHoraEntrada,
				CodHoraSalida_HT_Me = @CodHoraSalida,
				Estado_Me = @Estado
			WHERE Legajo_Me = @LEGAJO
	END;
GO

CREATE OR ALTER PROCEDURE spModificarAsistencia
(
    @DNI INT,
	@Fecha DATE,
    @TextoHorario VARCHAR(100),
    --@CodHorario INT,
    @Legajo INT,
    @Asistencia_Tur VARCHAR(15),
    @Comentario_Tur VARCHAR(100)
)
AS
BEGIN
    UPDATE Turnos
    SET Asistencia_Tu = @Asistencia_Tur,
        Comentario_Tu = @Comentario_Tur
    WHERE DNI_Pa_Tu= @DNI
      AND FechaTurno_Tu = @Fecha
      AND CodHorarioTurno_HT_Tu = (SELECT CodHorarioTurno_HT FROM HorariosTurno WHERE Horario_HT = @TextoHorario)
      AND Legajo_Me_Tu = @Legajo;
END;
GO


CREATE OR ALTER PROCEDURE spModificarPaciente
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

CREATE OR ALTER PROCEDURE spVerificarNombreUsuario
	@LegajoMedico INT,
	@NuevoNombre VARCHAR(100)
AS
	BEGIN
		-- Encontrar el codUsuario a editar
		DECLARE @CodUsuarioActual INT
			SELECT @CodUsuarioActual = CodUsuario_Usu
				FROM Medicos M
					INNER JOIN Usuarios U ON M.Legajo_Me = U.Legajo_Me_Usu
						WHERE M.Legajo_Me = @LegajoMedico
			-- Ver que no haya un nombre de usuario igual 
			SELECT COUNT(*)
				FROM Usuarios
					WHERE Nombre_Usu = @NuevoNombre
					AND CodUsuario_Usu <> @CodUsuarioActual
	END;
GO

CREATE OR ALTER PROCEDURE spModificarUsuario
(
	@Legajo INT,
    @Nombre VARCHAR(100),
	@Contrasenia VARCHAR(100)
)
AS
	BEGIN
		UPDATE Usuarios
			SET Nombre_Usu = @Nombre,
			Contrasenia_Usu = @Contrasenia
			WHERE Legajo_Me_Usu = @Legajo
	END;
GO

-- Chequear
CREATE OR ALTER PROCEDURE CalcularPorcentajeEstado(
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
    WHERE FechaTurno_Tu BETWEEN @FechaInicio AND @FechaFin;

    -- Contar ausentes y presentes
    SELECT 
        @Ausentes = COUNT(CASE WHEN Asistencia_Tu = 'Ausente' THEN 1 END),
        @Presentes = COUNT(CASE WHEN Asistencia_Tu = 'Presente' THEN 1 END)
    FROM Turnos
    WHERE FechaTurno_Tu BETWEEN @FechaInicio AND @FechaFin;

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

CREATE OR ALTER PROCEDURE spModificacionUsuario @Codigo INT, @Nombre VARCHAR(100), @Contrasenia VARCHAR(100)
	AS
	 BEGIN
		UPDATE Usuarios
			SET Nombre_Usu = @Nombre, Contrasenia_Usu = @Contrasenia
		WHERE CodUsuario_Usu = @Codigo
	 END;
GO

CREATE OR ALTER PROCEDURE Filtro_Ausentes(
    @FechaInicio DATE,
    @FechaFin DATE
)
AS
BEGIN

SELECT M.Apellido_Me + ' ' + M.Nombre_Me AS NombreMedico,Es.NombreEspecialidad_Es, HT.Horario_HT, T.FechaTurno_Tu, T.DNI_Pa_Tu, T.Asistencia_Tu 
FROM Turnos AS T 
INNER JOIN HorariosTurno AS HT ON T.CodHorarioTurno_HT_Tu = HT.CodHorarioTurno_HT
INNER JOIN Medicos AS M ON T.Legajo_Me_Tu = M.Legajo_Me
INNER JOIN Especialidades AS ES ON Es.CodEspecialidad_Es = M.CodEspecialidad_Es_Me
WHERE T.Asistencia_Tu = 'Ausente' AND FechaTurno_Tu >= @FechaInicio AND FechaTurno_Tu <= @FechaFin

END
GO

CREATE OR ALTER PROCEDURE Filtro_Presentes(
    @FechaInicio DATE,
    @FechaFin DATE
)
AS
BEGIN

SELECT M.Apellido_Me + ' ' + M.Nombre_Me AS NombreMedico,Es.NombreEspecialidad_Es, HT.Horario_HT, T.FechaTurno_Tu, T.DNI_Pa_Tu, T.Asistencia_Tu 
FROM Turnos AS T 
INNER JOIN HorariosTurno AS HT ON T.CodHorarioTurno_HT_Tu = HT.CodHorarioTurno_HT
INNER JOIN Medicos AS M ON T.Legajo_Me_Tu = M.Legajo_Me
INNER JOIN Especialidades AS ES ON Es.CodEspecialidad_Es = M.CodEspecialidad_Es_Me
WHERE T.Asistencia_Tu = 'Presente' AND FechaTurno_Tu >= @FechaInicio AND FechaTurno_Tu <= @FechaFin

END
GO
