USE [Solvy]
GO
/****** Object:  User [solvy_user]    Script Date: 21/6/2025 16:46:30 ******/
CREATE USER [solvy_user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [solvy_user]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [solvy_user]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [solvy_user]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [solvy_user]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [solvy_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [solvy_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [solvy_user]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [solvy_user]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [solvy_user]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[subtotal] [float] NOT NULL,
	[cantidadProductos] [int] NOT NULL,
	[IdMedioDePago] [int] NULL,
	[direccionEntrega] [varchar](150) NULL,
 CONSTRAINT [PK_Carrito] PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrito_producto]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito_producto](
	[IdCarrito] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[IdCarritoProducto] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Carrito_producto] PRIMARY KEY CLUSTERED 
(
	[IdCarritoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[nombre_usuario] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[fotoDNIfrente] [varchar](255) NOT NULL,
	[fotoDNIdorso] [varchar](255) NOT NULL,
	[fotoPersonal] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedioDePago]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedioDePago](
	[IdMedioDePago] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[datos] [varchar](255) NOT NULL,
	[nroDeCuenta] [varchar](50) NOT NULL,
	[IdCliente] [int] NULL,
 CONSTRAINT [PK_MedioDePago] PRIMARY KEY CLUSTERED 
(
	[IdMedioDePago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[imagen_url] [varchar](255) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precioUnitario] [decimal](18, 2) NOT NULL,
	[descripcion] [text] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReseniaCliente]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReseniaCliente](
	[IdReseniaCliente] [int] IDENTITY(1,1) NOT NULL,
	[IdSolicitud] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdSolver] [int] NOT NULL,
	[puntuacion] [float] NOT NULL,
	[comentario] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ReseñaCliente] PRIMARY KEY CLUSTERED 
(
	[IdReseniaCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReseniaSolver]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReseniaSolver](
	[IdReseniaSolver] [int] IDENTITY(1,1) NOT NULL,
	[IdSolicitud] [int] NOT NULL,
	[IdSolver] [int] NOT NULL,
	[puntuacion] [float] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[comentario] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ReseñaSolver] PRIMARY KEY CLUSTERED 
(
	[IdReseniaSolver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[IdServicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[icono_url] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitudes]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitudes](
	[IdSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdSolver] [int] NOT NULL,
	[IdServicio] [int] NOT NULL,
	[direccion_servicio] [varchar](150) NOT NULL,
	[duracion_servicio] [decimal](18, 2) NOT NULL,
	[horainicial] [datetime] NOT NULL,
	[horafinal] [datetime] NOT NULL,
	[monto] [float] NOT NULL,
	[fechaSolicitud] [date] NOT NULL,
	[fechaAcordada] [date] NOT NULL,
	[fechaServicio] [date] NOT NULL,
	[IdReseniaSolver] [int] NULL,
	[IdReseniaCliente] [int] NULL,
	[IdSubservicio] [int] NOT NULL,
 CONSTRAINT [PK_Solicitudes] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solvers]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solvers](
	[IdSolver] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[dni] [varchar](50) NOT NULL,
	[nacionalidad] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[movilidad_propia] [bit] NOT NULL,
	[tipo_vehiculo] [varchar](50) NULL,
	[fotoDNIfrente] [varchar](255) NOT NULL,
	[fotoDNIdorso] [varchar](255) NOT NULL,
	[fotoPersonal] [varchar](255) NOT NULL,
	[certificadoAntecedentesP] [varchar](50) NOT NULL,
	[CUIL_o_CUIT] [varchar](50) NULL,
 CONSTRAINT [PK_Solvers] PRIMARY KEY CLUSTERED 
(
	[IdSolver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolverServicio]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolverServicio](
	[IdSolverServicio] [int] IDENTITY(1,1) NOT NULL,
	[IdServicio] [int] NOT NULL,
	[IdSolver] [int] NOT NULL,
	[estudios] [bit] NOT NULL,
	[certificadoEstudios] [varchar](255) NULL,
	[experiencia] [int] NOT NULL,
 CONSTRAINT [PK_SolverServicio] PRIMARY KEY CLUSTERED 
(
	[IdSolverServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subservicios]    Script Date: 21/6/2025 16:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subservicios](
	[IdSubservicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[icono_url] [varchar](255) NOT NULL,
	[IdServicio] [int] NOT NULL,
	[tarifaBase] [float] NOT NULL,
	[precioPorTiempo] [float] NOT NULL,
 CONSTRAINT [PK_Subservicios] PRIMARY KEY CLUSTERED 
(
	[IdSubservicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([IdCliente], [nombre], [apellido], [direccion], [email], [telefono], [nombre_usuario], [contraseña], [fotoDNIfrente], [fotoDNIdorso], [fotoPersonal]) VALUES (1, N'Uriel', N'Smucler', N'Av Diaz Velez 5469 1a', N'urismu07@gmail.com', N'+54 9 11 23895698', N'UriSmu', N'Popi2025', N'wdosdwu', N'ubcuscbusbcs', N'BCUSBCUSBCSU')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Clientes1] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [FK_Carrito_Clientes1]
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_MedioDePago1] FOREIGN KEY([IdMedioDePago])
REFERENCES [dbo].[MedioDePago] ([IdMedioDePago])
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [FK_Carrito_MedioDePago1]
GO
ALTER TABLE [dbo].[Carrito_producto]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_producto_Carrito1] FOREIGN KEY([IdCarrito])
REFERENCES [dbo].[Carrito] ([IdCarrito])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carrito_producto] CHECK CONSTRAINT [FK_Carrito_producto_Carrito1]
GO
ALTER TABLE [dbo].[Carrito_producto]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_producto_Productos1] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carrito_producto] CHECK CONSTRAINT [FK_Carrito_producto_Productos1]
GO
ALTER TABLE [dbo].[MedioDePago]  WITH CHECK ADD  CONSTRAINT [FK_MedioDePago_Clientes1] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedioDePago] CHECK CONSTRAINT [FK_MedioDePago_Clientes1]
GO
ALTER TABLE [dbo].[ReseniaCliente]  WITH CHECK ADD  CONSTRAINT [FK_ReseniaCliente_Clientes1] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReseniaCliente] CHECK CONSTRAINT [FK_ReseniaCliente_Clientes1]
GO
ALTER TABLE [dbo].[ReseniaCliente]  WITH CHECK ADD  CONSTRAINT [FK_ReseniaCliente_Solicitudes1] FOREIGN KEY([IdSolicitud])
REFERENCES [dbo].[Solicitudes] ([IdSolicitud])
GO
ALTER TABLE [dbo].[ReseniaCliente] CHECK CONSTRAINT [FK_ReseniaCliente_Solicitudes1]
GO
ALTER TABLE [dbo].[ReseniaCliente]  WITH CHECK ADD  CONSTRAINT [FK_ReseniaCliente_Solvers1] FOREIGN KEY([IdSolver])
REFERENCES [dbo].[Solvers] ([IdSolver])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReseniaCliente] CHECK CONSTRAINT [FK_ReseniaCliente_Solvers1]
GO
ALTER TABLE [dbo].[ReseniaSolver]  WITH CHECK ADD  CONSTRAINT [FK_ReseniaSolver_Clientes1] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReseniaSolver] CHECK CONSTRAINT [FK_ReseniaSolver_Clientes1]
GO
ALTER TABLE [dbo].[ReseniaSolver]  WITH CHECK ADD  CONSTRAINT [FK_ReseniaSolver_Solicitudes1] FOREIGN KEY([IdSolicitud])
REFERENCES [dbo].[Solicitudes] ([IdSolicitud])
GO
ALTER TABLE [dbo].[ReseniaSolver] CHECK CONSTRAINT [FK_ReseniaSolver_Solicitudes1]
GO
ALTER TABLE [dbo].[ReseniaSolver]  WITH CHECK ADD  CONSTRAINT [FK_ReseniaSolver_Solvers1] FOREIGN KEY([IdSolver])
REFERENCES [dbo].[Solvers] ([IdSolver])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReseniaSolver] CHECK CONSTRAINT [FK_ReseniaSolver_Solvers1]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_Clientes1] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Clientes1]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_ReseniaCliente1] FOREIGN KEY([IdReseniaCliente])
REFERENCES [dbo].[ReseniaCliente] ([IdReseniaCliente])
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_ReseniaCliente1]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_ReseniaSolver1] FOREIGN KEY([IdReseniaSolver])
REFERENCES [dbo].[ReseniaSolver] ([IdReseniaSolver])
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_ReseniaSolver1]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_Servicios1] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Servicios1]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_Solvers1] FOREIGN KEY([IdSolver])
REFERENCES [dbo].[Solvers] ([IdSolver])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Solvers1]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_Subservicios] FOREIGN KEY([IdSubservicio])
REFERENCES [dbo].[Subservicios] ([IdSubservicio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Subservicios]
GO
ALTER TABLE [dbo].[SolverServicio]  WITH CHECK ADD  CONSTRAINT [FK_SolverServicio_Servicios1] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SolverServicio] CHECK CONSTRAINT [FK_SolverServicio_Servicios1]
GO
ALTER TABLE [dbo].[SolverServicio]  WITH CHECK ADD  CONSTRAINT [FK_SolverServicio_Solvers1] FOREIGN KEY([IdSolver])
REFERENCES [dbo].[Solvers] ([IdSolver])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SolverServicio] CHECK CONSTRAINT [FK_SolverServicio_Solvers1]
GO
