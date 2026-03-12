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
    Clave       VARCHAR(50)     NOT NULL,
	
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
    Fecha_Inicio        DATE            NOT NULL,
    Fecha_Fin           DATE,
    Mensualidad         DECIMAL(10,2)   NOT NULL,
    Id_Categoria        INT             NOT NULL,
    Id_Usuario          INT             NOT NULL,
    Id_Estado           INT             NOT NULL,
    Id_CondPago         INT             NOT NULL,
	
	CONSTRAINT [PK_Alquileres] PRIMARY KEY CLUSTERED
	(
		[Id_Alquiler] DESC
	),

    CONSTRAINT UQ_Apartamento UNIQUE (Apartamento)
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