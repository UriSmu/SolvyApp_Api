USE [master]
GO
/****** Object:  Database [Solvy ]    Script Date: 9/6/2025 09:33:44 ******/
CREATE DATABASE [Solvy ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Solvy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Solvy .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Solvy _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Solvy _log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Solvy ] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Solvy ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Solvy ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Solvy ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Solvy ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Solvy ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Solvy ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Solvy ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Solvy ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Solvy ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Solvy ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Solvy ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Solvy ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Solvy ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Solvy ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Solvy ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Solvy ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Solvy ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Solvy ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Solvy ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Solvy ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Solvy ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Solvy ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Solvy ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Solvy ] SET RECOVERY FULL 
GO
ALTER DATABASE [Solvy ] SET  MULTI_USER 
GO
ALTER DATABASE [Solvy ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Solvy ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Solvy ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Solvy ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Solvy ] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Solvy ', N'ON'
GO
ALTER DATABASE [Solvy ] SET QUERY_STORE = OFF
GO
USE [Solvy ]
GO
/****** Object:  User [alumno]    Script Date: 9/6/2025 09:33:44 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 9/6/2025 09:33:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[IdCarrito] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Carrito] PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrito_producto]    Script Date: 9/6/2025 09:33:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito_producto](
	[IdCarrito] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 9/6/2025 09:33:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[telefono] [int] NOT NULL,
	[nombre_usuario] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 9/6/2025 09:33:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] NOT NULL,
	[imagen_url] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReseñaCliente]    Script Date: 9/6/2025 09:33:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReseñaCliente](
	[IdReseñaCliente] [int] NOT NULL,
	[IdSolicitud] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdSolver] [int] NOT NULL,
	[puntuacion] [float] NOT NULL,
	[comentario] [varchar](250) NOT NULL,
 CONSTRAINT [PK_ReseñaCliente] PRIMARY KEY CLUSTERED 
(
	[IdReseñaCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReseñaSolver]    Script Date: 9/6/2025 09:33:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReseñaSolver](
	[IdReseñaSolver] [int] NOT NULL,
	[IdSolicitud] [int] NOT NULL,
	[IdSolver] [int] NOT NULL,
	[puntuacion] [float] NOT NULL,
 CONSTRAINT [PK_ReseñaSolver] PRIMARY KEY CLUSTERED 
(
	[IdReseñaSolver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 9/6/2025 09:33:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[IdServicio] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[icono_url] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitudes]    Script Date: 9/6/2025 09:33:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitudes](
	[IdSolicitud] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdSolver] [int] NOT NULL,
	[IdServicio] [int] NOT NULL,
	[direccion_servicio] [varchar](50) NOT NULL,
	[duracion_servicio] [int] NOT NULL,
	[horainicial] [int] NOT NULL,
	[horafinal] [int] NOT NULL,
	[monto] [int] NOT NULL,
 CONSTRAINT [PK_Solicitudes] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solvers]    Script Date: 9/6/2025 09:33:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solvers](
	[IdSolver] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[dni] [int] NOT NULL,
	[nacionalidad] [varchar](50) NOT NULL,
	[telefono] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[movilidad_propia] [tinyint] NOT NULL,
	[tipo_vehiculo] [varchar](50) NULL,
	[servicios] [varchar](50) NOT NULL,
	[añosExperiencia] [int] NOT NULL,
	[estudiosOcursos] [varchar](50) NULL,
	[fotoDNIfrente] [varchar](50) NOT NULL,
	[fotoDNIdorso] [varchar](50) NOT NULL,
	[fotoPersonal] [varchar](50) NOT NULL,
	[certificadoAP] [varchar](50) NOT NULL,
	[CUILOCUIT] [int] NOT NULL,
 CONSTRAINT [PK_Solvers] PRIMARY KEY CLUSTERED 
(
	[IdSolver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carrito_producto]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_producto_Carrito] FOREIGN KEY([IdCarrito])
REFERENCES [dbo].[Carrito] ([IdCarrito])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carrito_producto] CHECK CONSTRAINT [FK_Carrito_producto_Carrito]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Clientes]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_Servicios] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Servicios]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_Solvers] FOREIGN KEY([IdSolver])
REFERENCES [dbo].[Solvers] ([IdSolver])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Solvers]
GO
USE [master]
GO
ALTER DATABASE [Solvy ] SET  READ_WRITE 
GO
