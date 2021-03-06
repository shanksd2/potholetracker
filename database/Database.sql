USE [master]
GO
/****** Object:  Database [Potholes]    Script Date: 4/12/2018 1:58:22 PM ******/
CREATE DATABASE [Potholes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Potholes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Potholes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Potholes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Potholes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Potholes] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Potholes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Potholes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Potholes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Potholes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Potholes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Potholes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Potholes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Potholes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Potholes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Potholes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Potholes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Potholes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Potholes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Potholes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Potholes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Potholes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Potholes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Potholes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Potholes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Potholes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Potholes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Potholes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Potholes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Potholes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Potholes] SET  MULTI_USER 
GO
ALTER DATABASE [Potholes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Potholes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Potholes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Potholes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Potholes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Potholes] SET QUERY_STORE = OFF
GO
USE [Potholes]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Potholes]
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 4/12/2018 1:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[User_ID] [int] NOT NULL,
	[Claims_ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Estimated_Cost] [decimal](18, 0) NOT NULL,
	[Submission_Date] [date] NOT NULL,
	[Status] [varchar](50) NULL,
	[PotHole_ID] [int] NOT NULL,
 CONSTRAINT [PK_Claims] PRIMARY KEY CLUSTERED 
(
	[Claims_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pothole]    Script Date: 4/12/2018 1:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pothole](
	[PotHole_ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Severity] [int] NULL,
	[Date_Reported] [date] NOT NULL,
	[Picture] [image] NULL,
	[User_ID] [int] NULL,
	[Longitude] [decimal](18, 6) NOT NULL,
	[Latitude] [decimal](18, 6) NOT NULL,
	[Repair_Date] [date] NULL,
	[Inspect_Date] [date] NULL,
 CONSTRAINT [PK_Pothole] PRIMARY KEY CLUSTERED 
(
	[PotHole_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/12/2018 1:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Is_Employee] [bit] NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Pothole] ON 

INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (9, N'Inspected', 5, CAST(N'2018-04-10' AS Date), NULL, NULL, CAST(-83.042815 AS Decimal(18, 6)), CAST(39.997694 AS Decimal(18, 6)), NULL, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (24, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042632 AS Decimal(18, 6)), CAST(39.997679 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (26, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042702 AS Decimal(18, 6)), CAST(39.997697 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (27, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042702 AS Decimal(18, 6)), CAST(39.997697 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (30, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042689 AS Decimal(18, 6)), CAST(39.997651 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (31, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042688 AS Decimal(18, 6)), CAST(39.997648 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (32, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042692 AS Decimal(18, 6)), CAST(39.997646 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (33, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042687 AS Decimal(18, 6)), CAST(39.997639 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (35, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042691 AS Decimal(18, 6)), CAST(39.997646 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (38, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042687 AS Decimal(18, 6)), CAST(39.997639 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (39, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042690 AS Decimal(18, 6)), CAST(39.997664 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (40, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042688 AS Decimal(18, 6)), CAST(39.997660 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (41, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042690 AS Decimal(18, 6)), CAST(39.997665 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (48, N'Reported', 5, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042682 AS Decimal(18, 6)), CAST(39.997632 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (49, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042691 AS Decimal(18, 6)), CAST(39.997637 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (50, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042760 AS Decimal(18, 6)), CAST(39.997861 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (51, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042686 AS Decimal(18, 6)), CAST(39.997634 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (52, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042686 AS Decimal(18, 6)), CAST(39.997634 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (53, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.043301 AS Decimal(18, 6)), CAST(39.992854 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (54, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.043301 AS Decimal(18, 6)), CAST(39.992854 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (55, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.043301 AS Decimal(18, 6)), CAST(39.992854 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (56, N'Reported', 5, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042702 AS Decimal(18, 6)), CAST(39.997662 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (58, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042680 AS Decimal(18, 6)), CAST(39.997641 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (59, N'Reported', 5, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.042692 AS Decimal(18, 6)), CAST(39.997665 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (60, N'Reported', 2, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-82.924644 AS Decimal(18, 6)), CAST(39.971961 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (61, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.127371 AS Decimal(18, 6)), CAST(39.957106 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (62, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.127371 AS Decimal(18, 6)), CAST(39.957106 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (63, N'Reported', 1, CAST(N'2018-04-11' AS Date), NULL, NULL, CAST(-83.127371 AS Decimal(18, 6)), CAST(39.957106 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (64, N'Reported', 1, CAST(N'2018-04-12' AS Date), NULL, NULL, CAST(-83.094228 AS Decimal(18, 6)), CAST(40.000873 AS Decimal(18, 6)), NULL, NULL)
INSERT [dbo].[Pothole] ([PotHole_ID], [Status], [Severity], [Date_Reported], [Picture], [User_ID], [Longitude], [Latitude], [Repair_Date], [Inspect_Date]) VALUES (72, N'reported', 3, CAST(N'2018-04-12' AS Date), NULL, NULL, CAST(-83.045653 AS Decimal(18, 6)), CAST(39.997540 AS Decimal(18, 6)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Pothole] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_ID], [Username], [Password], [FirstName], [LastName], [Is_Employee], [Email]) VALUES (1, N'admin', N'password', N'chris', N'halasa', 1, N'abd@gmail.com')
INSERT [dbo].[Users] ([User_ID], [Username], [Password], [FirstName], [LastName], [Is_Employee], [Email]) VALUES (2, N'shankie', N'12345678', N'david', N'shankie', 0, N'abc@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_Users] FOREIGN KEY([PotHole_ID])
REFERENCES [dbo].[Pothole] ([PotHole_ID])
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_Users]
GO
USE [master]
GO
ALTER DATABASE [Potholes] SET  READ_WRITE 
GO
