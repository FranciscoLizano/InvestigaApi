USE AlquiSoft
GO

DECLARE @Su_Correo VARCHAR(100) = '' -- Se debe de ingresar el correo
DECLARE @Su_Nombre VARCHAR(100) = '' -- Se debe de ingresar el nombre


IF (
	@Su_Correo='' OR @Su_Nombre=''
   )
BEGIN 
	SELECT 'ERROR!!!! Defina sus datos personales' AS ERROR_DATOS_NO_VALIDOS
END
ELSE
BEGIN

	/*	Se registran los datos basicos de los usuarios*/
	INSERT INTO Usuarios
	(
	Correo, Nombre, Actividad, Estado, Password
	)
	SELECT 
	@Su_Correo,@Su_Nombre,'Propietario de apartamentos','A','123'

	INSERT INTO Usuarios
	(
	Correo, Nombre, Actividad, Estado, Password
	)
	VALUES
	(
	'saul.campos@uamcr.net','Saul Andres Campos Sojo','Propietario de apartamentos','A','123'
	),
	(
	'esteban.fallas1@uamcr.net','Esteban Josue Fallas Herrera','Propietario de apartamentos','A','123'
	),
	(
	'francisco.lizano@uamcr.net','Francisco Angel Lizano Guzmán','Propietario de apartamentos','A','123'
	)
		
	/*	Inserta las Categorias de los apartamentos	*/
	INSERT INTO Categoria_Apartamento
	(
	Categoria
	)
	VALUES
	(
	'Sin amueblar'
	),
	(
	'Semi amueblado'
	),
	(
	'Amueblado'
	),
	(
	'Totalmente equipado'
	)
	/*	Inserta los estados de los alquileres	*/
	INSERT INTO Estado_Alquileres
	(
	Estado
	)
	VALUES
	(
	'Sin Iniciar'
	),
	(
	'Iniciado'
	),
	(
	'Finalizado'
	)
	
	/*	Inserta las condiciones de pago	*/
	INSERT INTO Condicion_Pago
	(
	CondPago
	)
	VALUES 
	(
	'Al día'
	), 
	(
	'Pendiente de pago'
	),
	(
	'Atrasado'
	),
	(
	'En mora'
	),
	(
	'Sin Alquilar'
	)

	DECLARE @FECHA DATETIME = GETDATE()
	DECLARE @FECHA_FIN DATETIME = GETDATE() + 365
	
	--EXEC USP_Insertar_Alquileres @Apartamento, @Nombre_Inquilino, @Correo, @Telefono, @Fecha_Inicio,
	--					@Fecha_Fin, @Mensualidad, @Id_Categoria, @Id_Usuario, @Id_Estado, @Id_CondPago
	EXEC [USP_Insertar_Alquileres] 'Apt-101', 'Enrique Vargas S', 'evargas@vargas.com', '84125678', @FECHA,
						@FECHA_FIN, 480000, 1, 1, 2, 1
	EXEC [USP_Insertar_Alquileres] 'Apt-102', '--', '--', '--', '1990-01-01',
						'1990-01-01', 750, 2, 1, 1, 5
	EXEC [USP_Insertar_Alquileres] 'Apt-103', '--', '--', '--', '1990-01-01',
						'1990-01-01', 750000, 3, 1, 3, 5

	EXEC [USP_Insertar_Alquileres] 'Apt-104', 'Yanina Ramirez F', 'cobros@remirezyasoc.com', '87459023', @FECHA,
						@FECHA_FIN, 1450, 1, 2, 2, 1
	EXEC [USP_Insertar_Alquileres] 'Apt-105', 'Jairo Solano A', 'solano_jairo@microsoft.com', '88561234', @FECHA,
						@FECHA_FIN, 1200000, 4, 2, 2, 4
	EXEC [USP_Insertar_Alquileres] 'Apt-106', 'Wendy Saldiva P', 'wendy1990@yahoo.com', '89673485', @FECHA,
						@FECHA_FIN, 2300, 4, 2, 2, 2

END
GO

/*	Se consulta los datos insertados	*/
SELECT * FROM Usuarios
SELECT * FROM Estado_Alquileres
SELECT * FROM Categoria_Apartamento
SELECT * FROM Condicion_Pago
SELECT * FROM Alquileres
SELECT * FROM Auditoria