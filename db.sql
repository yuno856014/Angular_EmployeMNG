USE [master]
GO
/****** Object:  Database [HRM]    Script Date: 2/24/2022 5:10:48 PM ******/
CREATE DATABASE [HRM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HRM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HRM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HRM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HRM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HRM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HRM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HRM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HRM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HRM] SET ARITHABORT OFF 
GO
ALTER DATABASE [HRM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HRM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HRM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HRM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HRM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HRM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HRM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HRM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HRM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HRM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HRM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HRM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HRM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HRM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HRM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HRM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HRM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HRM] SET  MULTI_USER 
GO
ALTER DATABASE [HRM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HRM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HRM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HRM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HRM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HRM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HRM] SET QUERY_STORE = OFF
GO
USE [HRM]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2/24/2022 5:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2/24/2022 5:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpLastName] [nvarchar](250) NOT NULL,
	[EmpName] [nvarchar](250) NOT NULL,
	[Position] [nvarchar](250) NOT NULL,
	[Avatar] [nvarchar](250) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/24/2022 5:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (1, N'Ban giám đốc')
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (2, N'Ban tổng giám đốc')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [EmpLastName], [EmpName], [Position], [Avatar], [Title], [DepartmentId]) VALUES (1, N'Trần Văn', N'Duy', N'Quản lý', N'messages-3.jpg', N'Duy Trần', 2)
INSERT [dbo].[Employees] ([Id], [EmpLastName], [EmpName], [Position], [Avatar], [Title], [DepartmentId]) VALUES (2, N'Hồ Xuân', N'Thanh', N'Quản lý', N'messages-2.jpg', N'XuânThanh', 2)
INSERT [dbo].[Employees] ([Id], [EmpLastName], [EmpName], [Position], [Avatar], [Title], [DepartmentId]) VALUES (25, N'Nguyễn', N'Ngọc', N'Nhân sự', N'card.jpg', N'Nhân Sự', 2)
INSERT [dbo].[Employees] ([Id], [EmpLastName], [EmpName], [Position], [Avatar], [Title], [DepartmentId]) VALUES (27, N'Sapiente earum sed n', N'Autem voluptates sae', N'Incidunt tenetur qu', N'news-5.jpg', N'Culpa laboriosam ea', 1)
INSERT [dbo].[Employees] ([Id], [EmpLastName], [EmpName], [Position], [Avatar], [Title], [DepartmentId]) VALUES (28, N'Et exercitation occa', N'Itaque quos ipsam pa', N'Quod nobis labore et', N'slides-3.jpg', N'Mollit vel aliquid t', 2)
INSERT [dbo].[Employees] ([Id], [EmpLastName], [EmpName], [Position], [Avatar], [Title], [DepartmentId]) VALUES (29, N'Quis officia eos rem', N'Iusto rerum veniam ', N'Saepe sint sapiente ', N'profile-img.jpg', N'Praesentium aspernat', 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FullName], [UserName], [Password], [Mobile], [UserType]) VALUES (1, N'Admin', N'Admin', N'123456', N'4239418', N'Admin')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDepartment]    Script Date: 2/24/2022 5:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllDepartment]
AS
BEGIN
	select * from Departments
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmpByListDep]    Script Date: 2/24/2022 5:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetEmpByListDep]
	@depId int
AS
BEGIN
	select * from Employees where @depId = DepartmentId
END
GO
USE [master]
GO
ALTER DATABASE [HRM] SET  READ_WRITE 
GO
