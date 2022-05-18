USE [master]
GO
/****** Object:  Database [VizsgaAdatbazis]    Script Date: 2022. 05. 08. 17:21:58 ******/
CREATE DATABASE [VizsgaAdatbazis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VizsgaAdatbazis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VizsgaAdatbazis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VizsgaAdatbazis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VizsgaAdatbazis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VizsgaAdatbazis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VizsgaAdatbazis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VizsgaAdatbazis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET ARITHABORT OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VizsgaAdatbazis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VizsgaAdatbazis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VizsgaAdatbazis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VizsgaAdatbazis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VizsgaAdatbazis] SET  MULTI_USER 
GO
ALTER DATABASE [VizsgaAdatbazis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VizsgaAdatbazis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VizsgaAdatbazis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VizsgaAdatbazis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VizsgaAdatbazis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VizsgaAdatbazis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VizsgaAdatbazis] SET QUERY_STORE = OFF
GO
USE [VizsgaAdatbazis]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2022. 05. 08. 17:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[JobTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTypes]    Script Date: 2022. 05. 08. 17:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_JobType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_JobType] FOREIGN KEY([JobTypeId])
REFERENCES [dbo].[JobTypes] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_JobType]
GO
USE [master]
GO
ALTER DATABASE [VizsgaAdatbazis] SET  READ_WRITE 
GO
