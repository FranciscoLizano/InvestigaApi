-- Se selecciona la base Master
USE [master]
GO

-- Se crea la base de datos [AlquiSoft]
CREATE DATABASE [AlquiSoft]
GO

USE [AlquiSoft]
GO

-- Se crea la tabla [Categoria_Apartamento]
CREATE TABLE [Categoria_Apartamento]
(
    Id_Categoria    INT             IDENTITY(1,1),
    Categoria       VARCHAR(50)     NOT NULL,
	
	CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED
	(
		[Id_Categoria] DESC
	),

    CONSTRAINT UQ_Categoria UNIQUE (Categoria)
)
GO

-- Se crea la tabla [Estado_Alquileres]
CREATE TABLE [Estado_Alquileres]
(
    Id_Estado   INT         IDENTITY(1,1),
    Estado      VARCHAR(50) NOT NULL,
	
	CONSTRAINT [PK_Estado_Alquileres] PRIMARY KEY CLUSTERED
	(
		[Id_Estado] DESC
	),

    CONSTRAINT UQ_Estado UNIQUE (Estado)
)
GO

-- Se crea la tabla [Condicion_Pago]
CREATE TABLE [Condicion_Pago]
(
    Id_CondPago     INT         IDENTITY(1,1),
    CondPago        VARCHAR(50) NOT NULL,
	
	CONSTRAINT [PK_Condicion_Pago] PRIMARY KEY CLUSTERED
	(
		[Id_CondPago] DESC
	),

    CONSTRAINT UQ_CondPago UNIQUE (CondPago)
)
GO

-- Se crea la tabla [Usuarios]
CREATE TABLE [Usuarios]
(
    Id_Usuario  INT             IDENTITY(1,1),
    Correo      VARCHAR(50)     NOT NULL,
    Nombre      VARCHAR(100)    NOT NULL,
    Actividad   VARCHAR(100)    NOT NULL,   -- Como: Propietario de apartamentos, Administrador de bienes raíces,
                                            --  Inversionista inmobiliario, Empresa inmobiliaria, Administrador de condominios
    Estado      CHAR(1)         NOT NULL,
    Password    VARCHAR(50)     NOT NULL,
	
	CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED
	(
		[Id_Usuario] DESC
	),

    CONSTRAINT UQ_Correo UNIQUE (Correo)
)
GO

-- Se crea la tabla [Alquileres]
CREATE TABLE [Alquileres]
(
    Id_Alquiler         INT             IDENTITY(1,1),
    Apartamento         VARCHAR(20)     NOT NULL,
    Nombre_Inquilino    VARCHAR(100)    NOT NULL,
    Correo              VARCHAR(50),
    Telefono            VARCHAR(20),
    Fecha_Registro      DATE DEFAULT (getdate()),
    Fecha_Inicio        DATE,
    Fecha_Fin           DATE,
    Mensualidad         DECIMAL(10,2)   NOT NULL,
    Id_Categoria        INT             NOT NULL,
    Id_Usuario          INT             NOT NULL,
    Id_Estado           INT             NOT NULL,
    Id_CondPago         INT             NOT NULL,
	
	CONSTRAINT [PK_Alquileres] PRIMARY KEY CLUSTERED
	(
		[Id_Alquiler] DESC
	)
)
GO
ALTER TABLE [Alquileres] WITH NOCHECK 
ADD	
	CONSTRAINT [FK_Alquileres_Categoria_Apartamento_Id_Categoria] 
        FOREIGN KEY (Id_Categoria) 
        REFERENCES [Categoria_Apartamento](Id_Categoria),
	CONSTRAINT [FK_Alquileres_Usuarios_Id_Usuario] 
        FOREIGN KEY (Id_Usuario) 
        REFERENCES [Usuarios](Id_Usuario),
	CONSTRAINT [FK_Alquileres_Estado_Alquileres_Id_Estado] 
        FOREIGN KEY (Id_Estado) 
        REFERENCES [Estado_Alquileres](Id_Estado),
	CONSTRAINT FK_Alquileres_CondicionPago_Id_CondPago
        FOREIGN KEY (Id_CondPago) 
        REFERENCES [Condicion_Pago](Id_CondPago)
GO
ALTER TABLE [Alquileres] CHECK CONSTRAINT [FK_Alquileres_Categoria_Apartamento_Id_Categoria]
GO
ALTER TABLE [Alquileres] CHECK CONSTRAINT [FK_Alquileres_Usuarios_Id_Usuario]
GO
ALTER TABLE [Alquileres] CHECK CONSTRAINT [FK_Alquileres_Estado_Alquileres_Id_Estado]
GO
ALTER TABLE [Alquileres] CHECK CONSTRAINT FK_Alquileres_CondicionPago_Id_CondPago
GO

-- Se crea la tabla [Auditoria]
CREATE TABLE [Auditoria]
(
    Id_Auditoria    INT             IDENTITY(1,1),
    Id_Usuario      INT             NOT NULL,
    Accion          CHAR(1)         NOT NULL,
    Descripcion     VARCHAR(255),
    FechaHora       DATETIME DEFAULT GETDATE(),
	
	CONSTRAINT [PK_Auditoria] PRIMARY KEY CLUSTERED
	(
		[Id_Auditoria] DESC
	)
)
GO
ALTER TABLE [Auditoria] WITH NOCHECK 
ADD	
	CONSTRAINT [FK_Auditoria_Usuarios_Id_Usuario] 
        FOREIGN KEY (Id_Usuario) 
        REFERENCES [Usuarios](Id_Usuario)
GO
ALTER TABLE [Auditoria] CHECK CONSTRAINT [FK_Auditoria_Usuarios_Id_Usuario]
GO

-- Procedimiento CRUD para el inicio de sesión de usuario
CREATE PROCEDURE [dbo].[USP_InicioSesion_Usuarios]
(
@Correo varchar(50),
@Password varchar(25)
)
AS BEGIN 
DECLARE @IdUsuario int
DECLARE @Estado char(1)
BEGIN TRY

	IF EXISTS(SELECT Id_Usuario FROM Usuarios WHERE Correo=@Correo and Password=@Password) 
	BEGIN
		SELECT @IdUsuario=Id_Usuario, @Estado=Estado FROM Usuarios WHERE Correo=@Correo and Password=@Password

		IF @Estado='A'
		BEGIN
			SELECT @IdUsuario
			
			/*				Este proceso se utiliza para el control de la auditoria del sistema					*/
			DECLARE @DSC VARCHAR(MAX)
			DECLARE @USRNOM VARCHAR(300)
			DECLARE @ACC CHAR(1)

			SELECT @USRNOM = Nombre FROM Usuarios Where Id_Usuario=@IdUsuario
			SET @DSC = 'Inicio de Sesión del Usuario: ' + CONVERT(VARCHAR,@USRNOM)
			SET @ACC = 'I'

			INSERT INTO Auditoria
			(
			Id_Usuario, Accion, Descripcion, FechaHora
			)
			SELECT
			@IdUsuario, @ACC, RTRIM(LTRIM(@DSC)) , GETDATE()
			/*				Este proceso se utiliza para el control de la auditoria del sistema					*/

		END
		ELSE
		BEGIN
			SELECT -1
		END
	END
	ELSE
	BEGIN
		SELECT 0
	END
END TRY 
BEGIN CATCH
	SELECT 0
END CATCH
END
GO

-- Procedimiento CRUD para el cierre de sesión de usuario
CREATE PROCEDURE [dbo].[USP_CierraSesion_Usuarios]
(
@IdUsuario INT
)
AS BEGIN 
DECLARE @Estado char(1)
BEGIN TRY

	IF EXISTS(SELECT Id_Usuario FROM Usuarios WHERE Id_Usuario=@IdUsuario) 
	BEGIN
			SELECT @IdUsuario
			
			/*				Este proceso se utiliza para el control de la auditoria del sistema					*/
			DECLARE @DSC VARCHAR(MAX)
			DECLARE @USRNOM VARCHAR(300)
			DECLARE @ACC CHAR(1)

			SELECT @USRNOM = Nombre FROM Usuarios Where Id_Usuario=@IdUsuario
			SET @DSC = 'Cierra de Sesión del Usuario: ' + CONVERT(VARCHAR,@USRNOM)
			SET @ACC = 'I'

			INSERT INTO Auditoria
			(
			Id_Usuario, Accion, Descripcion, FechaHora
			)
			SELECT
			@IdUsuario, @ACC, RTRIM(LTRIM(@DSC)) , GETDATE()
			/*				Este proceso se utiliza para el control de la auditoria del sistema					*/
	END
	ELSE
	BEGIN
		SELECT 0
	END
END TRY 
BEGIN CATCH
	SELECT 0
END CATCH
END
GO

-- Procedimiento CRUD para insertar la información del usuario
CREATE PROCEDURE [dbo].[USP_Insertar_Usuarios]
(
@Nombre varchar(100),
@Actividad varchar(100),
@Correo varchar(50),
@Estado varchar(10),
@Password varchar(50)
)
AS BEGIN 
BEGIN TRY
	IF NOT EXISTS(SELECT Id_Usuario FROM Usuarios WHERE Correo=@Correo)
	BEGIN 
		INSERT INTO  [dbo].[Usuarios]
		(
			   [Nombre]
			  ,[Actividad]
			  ,[Estado]
			  ,[Correo]
			  ,[Password]
		)
		VALUES
		(
			@Nombre,
			@Actividad,
			'A',
			@Correo,
			@Password
		)
		SELECT @@IDENTITY
	END
	ELSE
	BEGIN
		SELECT -1
	END
	
END TRY
BEGIN CATCH
		SELECT 0
END CATCH
END
GO

-- Procedimiento CRUD para consultar la información del usuario
CREATE PROCEDURE [dbo].[USP_Informacion_Usuarios]
(
@IdUsuario INT
)
AS BEGIN 

SELECT [Id_Usuario]
      ,[Nombre]
	  ,[Actividad]
	  ,[Correo]
	  ,CASE LTRIM(RTRIM([Estado])) WHEN 'A' THEN 'Activo' ELSE 'Inactivo' END [Estado]
	  ,[Password]
  FROM [dbo].[Usuarios]
  WHERE [Id_Usuario]=@IdUsuario
END
GO

/* Procedimiento CRUD para consultar la información de los procesos auditados 
	se consulta por usuario la acción y un rango de fechas */
CREATE PROCEDURE [dbo].[USP_Filtrar_Auditoria]
(
@Usuario int,
@Accion nvarchar(10),
@Desde DATETIME,
@Hasta DATETIME
)
AS BEGIN 
SET DATEFORMAT DMY
SELECT 
	   [FechaHora] as [Fecha / Hora]
      ,CASE LTRIM(RTRIM([Accion])) 
			WHEN 'A' THEN 'Actualizar' 
			WHEN 'E' THEN 'Eliminar' 
			WHEN 'I' THEN 'Insertar' 
			ELSE 'N/A' END [Accion]
      ,[Descripcion]
      
  FROM [dbo].[Auditoria]
  WHERE Id_Usuario=@Usuario 
		AND 
			(
				CAST(FechaHora as DATE)>=CAST(@Desde AS DATE) 
					AND 
				CAST(FechaHora as DATE)<=CAST(@Hasta AS DATE) 
			 )
		AND Accion = CASE LTRIM(RTRIM(@Accion)) 
						WHEN 'T' THEN Accion 
						ELSE @Accion END
END
GO

-- Procedimiento CRUD para listar el estado de los alquileres
CREATE PROCEDURE [dbo].[USP_Listar_Estado_Alquileres]
AS BEGIN
SELECT [Id_Estado]
      ,[Estado]
  FROM [dbo].[Estado_Alquileres]
END
GO

-- Procedimiento CRUD para listar las categorías de los apartamentos
CREATE PROCEDURE [dbo].[USP_Listar_Categoria_Apartamento]
AS BEGIN
SELECT [Id_Categoria]
      ,[Categoria]
  FROM [dbo].[Categoria_Apartamento]
END
GO

-- Procedimiento CRUD para listar las Condicion_Pago
CREATE PROCEDURE [dbo].[USP_Listar_Condicion_Pago]
AS BEGIN
SELECT [Id_CondPago]
      ,[CondPago]
  FROM [dbo].[Condicion_Pago]
END
GO

-- Procedimiento CRUD para listar los apartamentos del usuario por estado
CREATE PROCEDURE [dbo].[USP_Listar_Alquileres]
(
@IdUsuario int,
@Titulo VARCHAR(50),
@Estado int
)
AS BEGIN 
  SELECT ALQ.[Id_Alquiler] AS [Id_Alquiler]
      ,ALQ.[Apartamento] AS [Apartamento]
      ,ALQ.[Nombre_Inquilino] AS [Nombre_Inquilino]
      ,ALQ.[Correo] AS [Correo]
      ,ALQ.[Telefono] AS [Telefono]
      ,CAST(ALQ.[Fecha_Inicio] AS date) AS [Fecha_Inicio_Contrato]
	  ,CAST(ALQ.[Fecha_Fin] AS date) AS [Fecha_Fin_Contrato]
      ,ALQ.[Mensualidad] AS [Mensualidad]
	  ,CATA.[Categoria] AS [Categoria]
	  ,CONP.[CondPago] AS [CondPago]
	  ,EST.[Estado] AS [Estado]
  FROM [dbo].[Alquileres] ALQ
  INNER JOIN Categoria_Apartamento CATA ON CATA.Id_Categoria = ALQ.Id_Categoria
  INNER JOIN Condicion_Pago CONP ON CONP.Id_CondPago = ALQ.Id_Estado
  INNER JOIN Estado_Alquileres EST ON EST.Id_Estado = ALQ.Id_Estado
  WHERE LTRIM(RTRIM(ALQ.[Apartamento])) LIKE '%' + LTRIM(RTRIM(@Titulo)) +'%'
		AND ALQ.[Id_Usuario]=@IdUsuario 
		AND ALQ.[Id_Estado] = CASE WHEN @Estado = 0 THEN ALQ.[Id_Estado] ELSE @Estado END
END
GO

-- Procedimiento CRUD para consultar la información de un alquiler
CREATE PROCEDURE [dbo].[USP_Informacion_Alquileres]
(
@IdAlquiler INT
)
AS BEGIN 
  SELECT ALQ.[Id_Alquiler] AS [Id_Alquiler]
      ,ALQ.[Apartamento] AS [Apartamento]
	  ,ALQ.[Nombre_Inquilino] AS [Nombre_Inquilino]
	  ,ALQ.[Correo] AS [Correo]
	  ,ALQ.[Telefono] AS [Telefono]
      ,CAST(ALQ.[Fecha_Inicio] AS date) AS [Fecha_Inicio_Contrato]
	  ,CAST(ALQ.[Fecha_Fin] AS date) AS [Fecha_Fin_Contrato]
      ,ALQ.[Mensualidad] AS [Mensualidad]
	  ,ALQ.[Id_Categoria] AS [Categoria]
	  ,ALQ.[Id_CondPago] AS [Condicion_Pago]
	  ,ALQ.[Id_Estado] AS [Estado]
  FROM [dbo].[Alquileres] ALQ
  WHERE ALQ.[Id_Alquiler]=@IdAlquiler
END
GO

-- Procedimiento CRUD para insertar un alquiler
CREATE PROCEDURE [dbo].[USP_Insertar_Alquileres]
(
@Apartamento varchar(20),
@Nombre_Inquilino varchar(100),
@Correo varchar(50),
@Telefono varchar(20),
@Fecha_Inicio datetime,
@Fecha_Fin datetime,
@Mensualidad decimal,
@IdCategoria int,
@IdUsuario int,
@IdEstado int,
@IdCondPago int
)
AS BEGIN 
BEGIN TRY
	IF NOT EXISTS(SELECT Id_Alquiler FROM Alquileres WHERE Apartamento=@Apartamento AND Id_Usuario=@IdUsuario)
	BEGIN
		INSERT INTO  [dbo].[Alquileres]
		( 
			[Apartamento], 
			[Nombre_Inquilino], 
			[Correo], 
			[Telefono], 
			[Fecha_Registro], 
			[Fecha_Inicio], 
			[Fecha_Fin], 
			[Mensualidad],  
			[Id_Categoria], 
			[Id_Usuario],
			[Id_Estado],
			[Id_CondPago]
		)
		VALUES
		(
			@Apartamento,
			@Nombre_Inquilino,
			@Correo,
			@Telefono,
			GETDATE(),
			CAST(@Fecha_Inicio AS date),
			CAST(@Fecha_Fin AS date),
			@Mensualidad,
			@IdCategoria,
			@IdUsuario,
			@IdEstado,
			@IdCondPago
		)

		SELECT @@IDENTITY
		
		/*	Este proceso se utiliza para el control de la auditoria del sistema	*/
		DECLARE @DSC VARCHAR(MAX)
		DECLARE @ACC CHAR(1)
		SET @DSC = 'Inserta la información del Alquiler ' 
					+ RTRIM(LTRIM(@Apartamento)) 
					+ ' | Inquilino: ' 
					+ RTRIM(LTRIM(@Nombre_Inquilino)) 
					+ '. Id Registro: ' 
					+ CONVERT(VARCHAR,@@IDENTITY)
		SET @ACC = 'I'

		INSERT INTO Auditoria
		(
		Id_Usuario, Accion, Descripcion, FechaHora
		)
		SELECT
		@IdUsuario, @ACC, RTRIM(LTRIM(@DSC)) , GETDATE()
		/*	Este proceso se utiliza para el control de la auditoria del sistema	*/
	END
	ELSE
	BEGIN
		SELECT -1
	END
END TRY
BEGIN CATCH
	SELECT 0
END CATCH
END
GO

-- Procedimiento CRUD para modificar un alquiler
CREATE PROCEDURE [dbo].[USP_Modificar_Alquiler]
(
@IdAlquiler int,
@Apartamento varchar(20),
@Nombre_Inquilino varchar(100),
@Correo varchar(50),
@Telefono varchar(20),
@Fecha_Inicio datetime,
@Fecha_Fin datetime,
@Mensualidad decimal,
@IdCategoria int,
@IdUsuario int,
@IdEstado int,
@IdCondPago int
)
AS BEGIN 
BEGIN TRY
SET DATEFORMAT DMY
	IF NOT EXISTS(SELECT Id_Alquiler 
					FROM Alquileres 
					WHERE	Apartamento=@Apartamento 
							AND Id_Usuario=@IdUsuario 
							AND Id_Alquiler NOT IN (@IdAlquiler))
	BEGIN
		UPDATE [dbo].[Alquileres]
		SET
			   [Nombre_Inquilino]=@Nombre_Inquilino
			  ,[Correo]=@Correo
			  ,[Telefono]=@Telefono
			  ,[Fecha_Inicio]=CAST(@Fecha_Inicio AS DATE)
			  ,[Fecha_Fin]=CAST(@Fecha_Fin AS DATE)
			  ,[Mensualidad]=@Mensualidad
			  ,[Id_Categoria]=@IdCategoria
			  ,[Id_Estado]=@IdEstado
			  ,Id_CondPago=@IdCondPago
		WHERE Id_Alquiler=@IdAlquiler

		SELECT @IdAlquiler
		/*	Este proceso se utiliza para el control de la auditoria del sistema	*/
		DECLARE @DSC VARCHAR(MAX)
		DECLARE @ACC CHAR(1)
		SET @DSC = 'Actualiza la información del Alquiler ' 
					+ RTRIM(LTRIM(@Apartamento)) 
					+ ' | Inquilino: ' 
					+ RTRIM(LTRIM(@Nombre_Inquilino)) 
					+ '. Id Registro: ' 
					+ CONVERT(VARCHAR,@IdAlquiler)
		SET @ACC = 'A'

		INSERT INTO Auditoria
		(
		Id_Usuario, Accion, Descripcion, FechaHora
		)
		SELECT
		@IdUsuario, @ACC, RTRIM(LTRIM(@DSC)) , GETDATE()
		/*	Este proceso se utiliza para el control de la auditoria del sistema	*/
	END
	ELSE
	BEGIN
		SELECT -1
	END
END TRY
BEGIN CATCH
	SELECT 0
END CATCH
END
GO

-- Procedimiento CRUD para eliminar un alquiler
CREATE PROCEDURE [dbo].[USP_Eliminar_Alquiler]
(
@IdAlquiler int,
@IdUsuario int
)
AS BEGIN 
BEGIN TRY
	IF EXISTS(SELECT Id_Alquiler FROM Alquileres WHERE Id_Alquiler=@IdAlquiler)
	BEGIN
		/*	Este proceso se utiliza para el control de la auditoria del sistema	*/
		DECLARE @DSC VARCHAR(MAX)
		DECLARE @NOMBRE VARCHAR(200)
		DECLARE @ACC CHAR(1)

		SELECT @NOMBRE=RTRIM(LTRIM(Apartamento))  FROM Alquileres WHERE Id_Alquiler=@IdAlquiler

		SET @DSC = 'Elimina la información del alquiler ' 
					+ RTRIM(LTRIM(@NOMBRE)) 
					+ '. Id Registro: ' 
					+ CONVERT(VARCHAR,@IdAlquiler)
		SET @ACC = 'E'

		INSERT INTO Auditoria
		(
		Id_Usuario, Accion, Descripcion, FechaHora
		)
		SELECT
		@IdUsuario, @ACC, RTRIM(LTRIM(@DSC)) , GETDATE()
		/*	Este proceso se utiliza para el control de la auditoria del sistema	*/

		DELETE FROM Alquileres WHERE Id_Alquiler=@IdAlquiler	
		SELECT @IdAlquiler
	END
	ELSE
	BEGIN
		SELECT -1
	END
END TRY
BEGIN CATCH
	SELECT 0
END CATCH
END
GO

-- Procedimiento CRUD para mostrar en el panel de control
CREATE PROCEDURE [dbo].[USP_Resumen_Estado_Alquiler]
(
@Id_Usuario int
)
AS BEGIN
	
	DECLARE @Alquiler INT
	DECLARE @Libres INT
	DECLARE @Ocupados INT
	DECLARE @Mantenimiento INT

	SET @Alquiler= (SELECT ISNULL(COUNT(Id_Alquiler),0) 
						FROM Alquileres WHERE Id_Usuario=@Id_Usuario)
	SET @Libres= (SELECT ISNULL(COUNT(ALQ.Id_Alquiler),0) 
					FROM Alquileres ALQ INNER JOIN Estado_Alquileres ESTA 
						ON ESTA.Id_Estado=ALQ.Id_Estado 
					WHERE ESTA.Estado='Libres' AND ALQ.Id_Usuario=@Id_Usuario)
	SET @Ocupados= (SELECT ISNULL(COUNT(ALQ.Id_Alquiler),0) 
						FROM Alquileres ALQ INNER JOIN Estado_Alquileres ESTA 
							ON ESTA.Id_Estado=ALQ.Id_Estado 
						WHERE ESTA.Estado='Ocupados' AND ALQ.Id_Usuario=@Id_Usuario)
	SET @Mantenimiento= (SELECT ISNULL(COUNT(ALQ.Id_Alquiler),0) 
							FROM Alquileres ALQ INNER JOIN Estado_Alquileres ESTA 
								ON ESTA.Id_Estado=ALQ.Id_Estado 
								WHERE ESTA.Estado='Mantenimiento' AND ALQ.Id_Usuario=@Id_Usuario)

	SELECT @Alquiler AS Alquileres, @Libres AS Libres, @Ocupados AS Ocupado, @Mantenimiento AS Mantenimiento

END
GO

-- Procedimiento CRUD para listar la cantidad de alquileres por estado
CREATE PROCEDURE [dbo].[USP_Listar_Cantidad_AlquileresXEstado]
(
@Id_Usuario int
)
AS BEGIN
		SELECT  ESTA.Estado, COUNT(ALQ.Id_Alquiler) AS Total
		FROM Estado_Alquileres ESTA
		LEFT JOIN Alquileres ALQ ON ESTA.Id_Estado=ALQ.Id_Estado AND ALQ.Id_Usuario = @Id_Usuario
		GROUP BY ESTA.Estado
		ORDER BY ESTA.Estado
END
GO

-- Procedimiento CRUD para listar la cantidad de alquileres por condición de pago
CREATE PROCEDURE [dbo].[USP_Listar_Cantidad_AlquileresXCondicionPago]
(
@Id_Usuario int
)
AS BEGIN
		SELECT CONP.CondPago, COUNT(ALQ.Id_Alquiler) AS Total
		FROM Condicion_Pago CONP
		LEFT JOIN Alquileres ALQ  ON CONP.Id_CondPago = ALQ.Id_CondPago AND ALQ.Id_Usuario = @Id_Usuario 
		GROUP BY CONP.CondPago
		ORDER BY CONP.CondPago
END
GO