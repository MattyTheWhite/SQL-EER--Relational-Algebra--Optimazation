USE [master]
GO
/****** Object:  Database [Alizadeh Airport]    Script Date: 8/8/2021 11:23:29 AM ******/
CREATE DATABASE [Alizadeh Airport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Alizadeh Airport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Alizadeh Airport.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Alizadeh Airport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Alizadeh Airport_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Alizadeh Airport] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Alizadeh Airport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Alizadeh Airport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET ARITHABORT OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Alizadeh Airport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Alizadeh Airport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Alizadeh Airport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Alizadeh Airport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET RECOVERY FULL 
GO
ALTER DATABASE [Alizadeh Airport] SET  MULTI_USER 
GO
ALTER DATABASE [Alizadeh Airport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Alizadeh Airport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Alizadeh Airport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Alizadeh Airport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Alizadeh Airport] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Alizadeh Airport] SET QUERY_STORE = OFF
GO
USE [Alizadeh Airport]
GO
/****** Object:  Table [dbo].[Airline]    Script Date: 8/8/2021 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airline](
	[AirlineIATACode] [nchar](3) NOT NULL,
	[Policy] [nvarchar](max) NOT NULL,
	[Webstie] [nvarchar](max) NOT NULL,
	[TravelGuide] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Airline] PRIMARY KEY CLUSTERED 
(
	[AirlineIATACode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 8/8/2021 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[AirportIATACode] [nchar](3) NOT NULL,
	[Latitude] [decimal](8, 6) NOT NULL,
	[Longitude] [decimal](9, 6) NOT NULL,
	[Info] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Airport] PRIMARY KEY CLUSTERED 
(
	[AirportIATACode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 8/8/2021 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlightNumber] [nchar](15) NOT NULL,
	[AirlineIATACode] [nchar](3) NOT NULL,
	[SrcAirportIATACode] [nchar](3) NOT NULL,
	[DestAirportIATACode] [nchar](3) NOT NULL,
	[OptionId] [int] NOT NULL,
	[Takeoff] [datetime] NOT NULL,
	[Landing] [datetime] NOT NULL,
	[Class] [nchar](10) NOT NULL,
	[PassengersLimit] [int] NOT NULL,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[FlightNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightOptions]    Script Date: 8/8/2021 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightOptions](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_FlightOptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operator]    Script Date: 8/8/2021 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operator](
	[Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[AirlineIATACode] [nchar](3) NOT NULL,
 CONSTRAINT [PK_Operator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 8/8/2021 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PassportNumber] [nchar](9) NOT NULL,
 CONSTRAINT [PK_Passenger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 8/8/2021 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [int] NOT NULL,
	[OperatorId] [int] NOT NULL,
	[PassengerId] [int] NOT NULL,
	[FlightNumber] [nchar](15) NOT NULL,
	[TotalPrice] [money] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/8/2021 11:23:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airline] FOREIGN KEY([AirlineIATACode])
REFERENCES [dbo].[Airline] ([AirlineIATACode])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airline]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airport_Dest] FOREIGN KEY([DestAirportIATACode])
REFERENCES [dbo].[Airport] ([AirportIATACode])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airport_Dest]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Airport_Src] FOREIGN KEY([SrcAirportIATACode])
REFERENCES [dbo].[Airport] ([AirportIATACode])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Airport_Src]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_FlightOptions] FOREIGN KEY([OptionId])
REFERENCES [dbo].[FlightOptions] ([Id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_FlightOptions]
GO
ALTER TABLE [dbo].[Operator]  WITH CHECK ADD  CONSTRAINT [FK_Operator_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Operator] CHECK CONSTRAINT [FK_Operator_User]
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_User]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Flight] FOREIGN KEY([FlightNumber])
REFERENCES [dbo].[Flight] ([FlightNumber])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Flight]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Operator] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[Operator] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Operator]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Passenger] FOREIGN KEY([PassengerId])
REFERENCES [dbo].[Passenger] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Passenger]
GO
USE [master]
GO
ALTER DATABASE [Alizadeh Airport] SET  READ_WRITE 
GO
