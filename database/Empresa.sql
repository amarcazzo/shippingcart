USE [master]
GO
/****** Object:  Database [Empresa]    Script Date: 01/12/2016 0:29:40 ******/
CREATE DATABASE [Empresa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Empresa', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Empresa.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Empresa_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Empresa_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Empresa] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Empresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Empresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Empresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Empresa] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Empresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Empresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Empresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Empresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Empresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Empresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Empresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Empresa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Empresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Empresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Empresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Empresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Empresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Empresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Empresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Empresa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Empresa] SET  MULTI_USER 
GO
ALTER DATABASE [Empresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Empresa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Empresa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Empresa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Empresa]
GO
/****** Object:  StoredProcedure [dbo].[SP_AltaDetalleVenta]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_AltaDetalleVenta]
(
	@IDVenta int,
	@IDProducto int,
	@Precio money,
	@Cantidad int
)
as
begin

	insert into DetalleVenta (IDVenta, IDProducto, Precio, Cantidad)
	values (@IDVenta, @IDProducto, @Precio, @Cantidad) 

end


GO
/****** Object:  StoredProcedure [dbo].[SP_AltaProducto]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[SP_AltaProducto]
(
	@Descripcion varchar(300),
	@Marca varchar(30),
	@IDCategoria int,
	@Nombre varchar(50),
	@Precio money,
	@Imagen varchar(200)	
)
as
begin

	insert into Productos (Descripcion, Marca, Nombre, Precio, Imagen, IDCategoria, Estado, Stock, StockMin)
	values	(@Descripcion,
			@Marca,
			@Nombre,
			@Precio,
			@Imagen,
			@IDCategoria,
			1,
			3,
			2)

end



GO
/****** Object:  StoredProcedure [dbo].[SP_AltaUsuario]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_AltaUsuario]
(
	@Usuario varchar(12),
	@Pass varchar(10),
	@Email varchar(50),
	@Nombre varchar(20),
	@Apellido varchar(20)	
)
as
begin

	insert into Usuarios (IdCategoriaUsuario, Usuario, Pass, Nombre, Apellido, Email)
	values (2, @Usuario, @Pass, @Nombre, @Apellido, @Email) 

end



GO
/****** Object:  StoredProcedure [dbo].[SP_AltaVenta]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_AltaVenta]
(
	@IdUsuario int,
	@Monto money,
	@Fecha datetime
)
as
begin

	insert into Ventas (IDUsuario, IDSucursal, IDEmpleado, Fecha, Monto)
	values (@IdUsuario, 1, 1, @Fecha, @Monto) 
	
end


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateProducto]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_UpdateProducto]
(
	@Id int,
	@Descripcion varchar(300),
	@Marca varchar(30),
	@IDCategoria int,
	@Nombre varchar(50),
	@Precio money,
	@Imagen varchar(200)	
)
as
begin

	update Productos
	set Descripcion = @Descripcion,
		Marca = @Marca,
		Nombre = @Nombre,
		Precio = @Precio,
		Imagen = @Imagen,
		IDCategoria = @IDCategoria
	where IDProducto =  @Id

end



GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateUsuario]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[SP_UpdateUsuario]
(
	@Id int,
	@Usuario varchar(12),
	@Pass varchar(10),
	@Email varchar(50),
	@Nombre varchar(20),
	@Apellido varchar(20)	
)
as
begin

	update Usuarios
	set Usuario=@Usuario,
		Pass=@Pass,
		Nombre=@Nombre,
		Apellido=@Apellido,
		Email=@Email
	where IdUsuario =  @Id

end



GO
/****** Object:  Table [dbo].[Catalogos]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogos](
	[IDCatalogo] [int] NOT NULL,
	[FechaCreacion] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoriasEmpleados]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoriasEmpleados](
	[IDCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoriasProductos]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoriasProductos](
	[IDCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoriasUsuario]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoriasUsuario](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellido] [varchar](30) NOT NULL,
	[DNI] [varchar](20) NOT NULL,
	[CP] [int] NULL,
	[EMail] [varchar](20) NULL,
	[FechaNacimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleEnvio]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleEnvio](
	[IDEnvio] [int] IDENTITY(1,1) NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEnvio] ASC,
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IDVenta] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDVenta] ASC,
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleados](
	[Legajo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellido] [varchar](30) NOT NULL,
	[DNI] [varchar](10) NOT NULL,
	[IDCategoria] [int] NULL,
	[CP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpleadoxSucursal]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadoxSucursal](
	[IDEmpleado] [int] NOT NULL,
	[IDSucursal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEmpleado] ASC,
	[IDSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Envios]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Envios](
	[IDEnvio] [int] IDENTITY(1,1) NOT NULL,
	[IDFlete] [int] NULL,
	[Estado] [varchar](50) NOT NULL,
	[Desde] [varchar](50) NOT NULL,
	[Hasta] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fletes]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fletes](
	[IDFlete] [int] IDENTITY(1,1) NOT NULL,
	[IDEmpleado] [int] NULL,
	[Patente] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDFlete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Localidades](
	[CP] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[IDProvincia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[IDProducto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](300) NOT NULL,
	[Marca] [varchar](30) NOT NULL,
	[IDCategoria] [int] NULL,
	[Stock] [int] NOT NULL,
	[StockMin] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Imagen] [varchar](200) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductosxCatalogo]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductosxCatalogo](
	[IDProducto] [int] NOT NULL,
	[IDCatalogo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC,
	[IDCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedores](
	[IDProveedor] [int] IDENTITY(1,1) NOT NULL,
	[CUIT] [varchar](20) NOT NULL,
	[RazonSocial] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProveedoresxSucursal]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProveedoresxSucursal](
	[IDProveedor] [int] NOT NULL,
	[IDSucursal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProveedor] ASC,
	[IDSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincias](
	[IDProvincia] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursales](
	[IDSucursal] [int] IDENTITY(1,1) NOT NULL,
	[IDCatalogo] [int] NULL,
	[CP] [int] NULL,
	[Descripcion] [varchar](30) NULL,
	[Direccion] [varchar](100) NULL,
	[Mapa] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoriaUsuario] [int] NULL,
	[Usuario] [varchar](12) NOT NULL,
	[Pass] [varchar](10) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[IDVenta] [int] IDENTITY(1,1) NOT NULL,
	[IDSucursal] [int] NULL,
	[IDEmpleado] [int] NULL,
	[IDUsuario] [int] NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[DetalleVentas]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[DetalleVentas] as
select IDVenta, Nombre, Productos.Precio, Cantidad from DetalleVenta
inner join Productos on Productos.IDProducto = DetalleVenta.IDProducto



GO
/****** Object:  View [dbo].[VW_Empleados]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_Empleados] as
select Legajo, Nombre, Apellido, DNI, CE.Descripcion from Empleados as E
inner join CategoriasEmpleados as CE on CE.IdCategoria = E.IDCategoria

GO
/****** Object:  View [dbo].[VW_MasVendidos]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_MasVendidos] as
select top 4 count(DV.IDProducto) as MasVendido, P.IDProducto, P.Nombre, P.Imagen from DetalleVenta as DV
inner join Productos as P on P.IDProducto = DV.IDProducto
group by P.Nombre, P.Imagen, P.IDProducto
order by MasVendido desc
GO
/****** Object:  View [dbo].[VW_Usuarios]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VW_Usuarios] as
select IdUsuario, Usuario, Nombre, Apellido, Email, C.Descripcion from Usuarios as P
inner join CategoriasUsuario as C on C.IdCategoria = P.IdCategoriaUsuario 



GO
/****** Object:  View [dbo].[VW_Ventas]    Script Date: 01/12/2016 0:29:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_Ventas] as
select IDVenta, Fecha, Monto, ce.Nombre, ce.Apellido from Ventas as V
inner join Usuarios as CE on CE.IdUsuario = v.IDUsuario

GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([CP])
REFERENCES [dbo].[Localidades] ([CP])
GO
ALTER TABLE [dbo].[DetalleEnvio]  WITH CHECK ADD FOREIGN KEY([IDEnvio])
REFERENCES [dbo].[Envios] ([IDEnvio])
GO
ALTER TABLE [dbo].[DetalleEnvio]  WITH CHECK ADD FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Productos] ([IDProducto])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Productos] ([IDProducto])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IDVenta])
REFERENCES [dbo].[Ventas] ([IDVenta])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([CP])
REFERENCES [dbo].[Localidades] ([CP])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[CategoriasEmpleados] ([IDCategoria])
GO
ALTER TABLE [dbo].[EmpleadoxSucursal]  WITH CHECK ADD FOREIGN KEY([IDEmpleado])
REFERENCES [dbo].[Empleados] ([Legajo])
GO
ALTER TABLE [dbo].[EmpleadoxSucursal]  WITH CHECK ADD FOREIGN KEY([IDSucursal])
REFERENCES [dbo].[Sucursales] ([IDSucursal])
GO
ALTER TABLE [dbo].[Envios]  WITH CHECK ADD FOREIGN KEY([IDFlete])
REFERENCES [dbo].[Fletes] ([IDFlete])
GO
ALTER TABLE [dbo].[Fletes]  WITH CHECK ADD FOREIGN KEY([IDEmpleado])
REFERENCES [dbo].[Empleados] ([Legajo])
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD FOREIGN KEY([IDProvincia])
REFERENCES [dbo].[Provincias] ([IDProvincia])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[CategoriasProductos] ([IDCategoria])
GO
ALTER TABLE [dbo].[ProductosxCatalogo]  WITH CHECK ADD FOREIGN KEY([IDCatalogo])
REFERENCES [dbo].[Catalogos] ([IDCatalogo])
GO
ALTER TABLE [dbo].[ProductosxCatalogo]  WITH CHECK ADD FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Productos] ([IDProducto])
GO
ALTER TABLE [dbo].[ProveedoresxSucursal]  WITH CHECK ADD FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedores] ([IDProveedor])
GO
ALTER TABLE [dbo].[ProveedoresxSucursal]  WITH CHECK ADD FOREIGN KEY([IDSucursal])
REFERENCES [dbo].[Sucursales] ([IDSucursal])
GO
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD FOREIGN KEY([IDCatalogo])
REFERENCES [dbo].[Catalogos] ([IDCatalogo])
GO
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD FOREIGN KEY([CP])
REFERENCES [dbo].[Localidades] ([CP])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([IdCategoriaUsuario])
REFERENCES [dbo].[CategoriasUsuario] ([IdCategoria])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([IDEmpleado])
REFERENCES [dbo].[Empleados] ([Legajo])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([IDSucursal])
REFERENCES [dbo].[Sucursales] ([IDSucursal])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
USE [master]
GO
ALTER DATABASE [Empresa] SET  READ_WRITE 
GO
