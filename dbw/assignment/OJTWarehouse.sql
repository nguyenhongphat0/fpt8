USE [master]
GO
/****** Object:  Database [OJTWarehouse]    Script Date: 7/2/2019 9:48:25 PM ******/
CREATE DATABASE [OJTWarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OJTWarehouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\OJTWarehouse.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OJTWarehouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\OJTWarehouse_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OJTWarehouse] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OJTWarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OJTWarehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OJTWarehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OJTWarehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OJTWarehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OJTWarehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [OJTWarehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OJTWarehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OJTWarehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OJTWarehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OJTWarehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OJTWarehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OJTWarehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OJTWarehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OJTWarehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OJTWarehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OJTWarehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OJTWarehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OJTWarehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OJTWarehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OJTWarehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OJTWarehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OJTWarehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OJTWarehouse] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OJTWarehouse] SET  MULTI_USER 
GO
ALTER DATABASE [OJTWarehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OJTWarehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OJTWarehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OJTWarehouse] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OJTWarehouse] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OJTWarehouse]
GO
/****** Object:  Table [dbo].[D_Company]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[D_Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nation] [nchar](20) NULL,
	[Location] [varchar](100) NULL,
	[Type] [nchar](20) NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_D_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[D_Position]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Position](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NULL,
	[Level] [nchar](20) NULL,
 CONSTRAINT [PK_D_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[D_Project]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nchar](20) NULL,
	[Customer] [int] NULL,
	[Budget] [int] NULL,
 CONSTRAINT [PK_D_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[D_Student]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[D_Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IsMale] [bit] NULL,
	[Age] [int] NULL,
	[Location] [varchar](100) NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_D_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[D_Subject]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[D_Subject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Required] [bit] NULL,
	[Area] [nchar](20) NULL,
	[Cost] [int] NULL,
	[Teacher] [int] NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_D_Subject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[D_Technology]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Technology](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YearsOfMaturity] [int] NULL,
	[Purpose] [nchar](20) NULL,
	[ProgramingLanguage] [nchar](20) NULL,
	[LearningCurve] [nchar](10) NULL,
 CONSTRAINT [PK_D_Technology] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[D_Time]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Time](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NULL,
	[Semester] [nchar](12) NULL,
	[Month] [int] NULL,
	[Week] [int] NULL,
 CONSTRAINT [PK_D_Time] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[D_Transportation]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Transportation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nchar](20) NULL,
	[Cost] [int] NULL,
	[Speed] [int] NULL,
 CONSTRAINT [PK_D_Transportation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[F_PostSubjectResult]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_PostSubjectResult](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [int] NULL,
	[Student] [int] NULL,
	[Subject] [int] NULL,
	[Company] [int] NULL,
	[Technology] [int] NULL,
	[SubjectMark] [int] NULL,
	[Attendance] [int] NULL,
	[Bonus] [int] NULL,
	[AssignmentFinishedPercentage] [float] NULL,
 CONSTRAINT [PK_F_PostSubjectResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[F_Result]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Result](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [int] NULL,
	[Student] [int] NULL,
	[Company] [int] NULL,
	[Project] [int] NULL,
	[Technology] [int] NULL,
	[Mark] [int] NULL,
	[Salary] [int] NULL,
	[CompletedProject] [int] NULL,
	[NumberOfFeedbacks] [int] NULL,
	[Awards] [int] NULL,
 CONSTRAINT [PK_F_Result] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[F_Satisfaction]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_Satisfaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [int] NULL,
	[Student] [int] NULL,
	[Company] [int] NULL,
	[Position] [int] NULL,
	[Transportation] [int] NULL,
	[Salary] [int] NULL,
	[LearnedSkills] [int] NULL,
	[JoinedActivity] [int] NULL,
	[NewAccquaintance] [int] NULL,
 CONSTRAINT [PK_F_Satisfaction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[R_Customer]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R_Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nation] [nchar](20) NULL,
	[Location] [nchar](20) NULL,
	[Wealthiness] [int] NULL,
	[Area] [nchar](20) NULL,
 CONSTRAINT [PK_R_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[R_Teacher]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[R_Teacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IsMale] [bit] NULL,
	[Age] [int] NULL,
	[YearsOfTeaching] [int] NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_R_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[D_Project]  WITH CHECK ADD  CONSTRAINT [FK_D_Project_R_Customer] FOREIGN KEY([Customer])
REFERENCES [dbo].[R_Customer] ([ID])
GO
ALTER TABLE [dbo].[D_Project] CHECK CONSTRAINT [FK_D_Project_R_Customer]
GO
ALTER TABLE [dbo].[D_Subject]  WITH CHECK ADD  CONSTRAINT [FK_D_Subject_R_Teacher] FOREIGN KEY([Teacher])
REFERENCES [dbo].[R_Teacher] ([ID])
GO
ALTER TABLE [dbo].[D_Subject] CHECK CONSTRAINT [FK_D_Subject_R_Teacher]
GO
ALTER TABLE [dbo].[F_PostSubjectResult]  WITH CHECK ADD  CONSTRAINT [FK_F_PostSubjectResult_D_Company] FOREIGN KEY([Company])
REFERENCES [dbo].[D_Company] ([ID])
GO
ALTER TABLE [dbo].[F_PostSubjectResult] CHECK CONSTRAINT [FK_F_PostSubjectResult_D_Company]
GO
ALTER TABLE [dbo].[F_PostSubjectResult]  WITH CHECK ADD  CONSTRAINT [FK_F_PostSubjectResult_D_Student] FOREIGN KEY([Student])
REFERENCES [dbo].[D_Student] ([ID])
GO
ALTER TABLE [dbo].[F_PostSubjectResult] CHECK CONSTRAINT [FK_F_PostSubjectResult_D_Student]
GO
ALTER TABLE [dbo].[F_PostSubjectResult]  WITH CHECK ADD  CONSTRAINT [FK_F_PostSubjectResult_D_Subject] FOREIGN KEY([Subject])
REFERENCES [dbo].[D_Subject] ([ID])
GO
ALTER TABLE [dbo].[F_PostSubjectResult] CHECK CONSTRAINT [FK_F_PostSubjectResult_D_Subject]
GO
ALTER TABLE [dbo].[F_PostSubjectResult]  WITH CHECK ADD  CONSTRAINT [FK_F_PostSubjectResult_D_Technology] FOREIGN KEY([Technology])
REFERENCES [dbo].[D_Technology] ([ID])
GO
ALTER TABLE [dbo].[F_PostSubjectResult] CHECK CONSTRAINT [FK_F_PostSubjectResult_D_Technology]
GO
ALTER TABLE [dbo].[F_PostSubjectResult]  WITH CHECK ADD  CONSTRAINT [FK_F_PostSubjectResult_D_Time] FOREIGN KEY([Time])
REFERENCES [dbo].[D_Time] ([ID])
GO
ALTER TABLE [dbo].[F_PostSubjectResult] CHECK CONSTRAINT [FK_F_PostSubjectResult_D_Time]
GO
ALTER TABLE [dbo].[F_Result]  WITH CHECK ADD  CONSTRAINT [FK_F_Result_D_Company] FOREIGN KEY([Company])
REFERENCES [dbo].[D_Company] ([ID])
GO
ALTER TABLE [dbo].[F_Result] CHECK CONSTRAINT [FK_F_Result_D_Company]
GO
ALTER TABLE [dbo].[F_Result]  WITH CHECK ADD  CONSTRAINT [FK_F_Result_D_Project] FOREIGN KEY([Project])
REFERENCES [dbo].[D_Project] ([ID])
GO
ALTER TABLE [dbo].[F_Result] CHECK CONSTRAINT [FK_F_Result_D_Project]
GO
ALTER TABLE [dbo].[F_Result]  WITH CHECK ADD  CONSTRAINT [FK_F_Result_D_Student] FOREIGN KEY([Student])
REFERENCES [dbo].[D_Student] ([ID])
GO
ALTER TABLE [dbo].[F_Result] CHECK CONSTRAINT [FK_F_Result_D_Student]
GO
ALTER TABLE [dbo].[F_Result]  WITH CHECK ADD  CONSTRAINT [FK_F_Result_D_Technology] FOREIGN KEY([Technology])
REFERENCES [dbo].[D_Technology] ([ID])
GO
ALTER TABLE [dbo].[F_Result] CHECK CONSTRAINT [FK_F_Result_D_Technology]
GO
ALTER TABLE [dbo].[F_Result]  WITH CHECK ADD  CONSTRAINT [FK_F_Result_D_Time] FOREIGN KEY([Time])
REFERENCES [dbo].[D_Time] ([ID])
GO
ALTER TABLE [dbo].[F_Result] CHECK CONSTRAINT [FK_F_Result_D_Time]
GO
ALTER TABLE [dbo].[F_Satisfaction]  WITH CHECK ADD  CONSTRAINT [FK_F_Satisfaction_D_Company] FOREIGN KEY([Company])
REFERENCES [dbo].[D_Company] ([ID])
GO
ALTER TABLE [dbo].[F_Satisfaction] CHECK CONSTRAINT [FK_F_Satisfaction_D_Company]
GO
ALTER TABLE [dbo].[F_Satisfaction]  WITH CHECK ADD  CONSTRAINT [FK_F_Satisfaction_D_Position] FOREIGN KEY([Position])
REFERENCES [dbo].[D_Position] ([ID])
GO
ALTER TABLE [dbo].[F_Satisfaction] CHECK CONSTRAINT [FK_F_Satisfaction_D_Position]
GO
ALTER TABLE [dbo].[F_Satisfaction]  WITH CHECK ADD  CONSTRAINT [FK_F_Satisfaction_D_Student] FOREIGN KEY([Student])
REFERENCES [dbo].[D_Student] ([ID])
GO
ALTER TABLE [dbo].[F_Satisfaction] CHECK CONSTRAINT [FK_F_Satisfaction_D_Student]
GO
ALTER TABLE [dbo].[F_Satisfaction]  WITH CHECK ADD  CONSTRAINT [FK_F_Satisfaction_D_Time] FOREIGN KEY([Time])
REFERENCES [dbo].[D_Time] ([ID])
GO
ALTER TABLE [dbo].[F_Satisfaction] CHECK CONSTRAINT [FK_F_Satisfaction_D_Time]
GO
ALTER TABLE [dbo].[F_Satisfaction]  WITH CHECK ADD  CONSTRAINT [FK_F_Satisfaction_D_Transportation] FOREIGN KEY([Transportation])
REFERENCES [dbo].[D_Transportation] ([ID])
GO
ALTER TABLE [dbo].[F_Satisfaction] CHECK CONSTRAINT [FK_F_Satisfaction_D_Transportation]
GO
/****** Object:  StoredProcedure [dbo].[AverageSalaryPerTransportation]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AverageSalaryPerTransportation](@transportation AS VARCHAR(100))
AS
BEGIN
SELECT AVG(f.Salary) as 'Average Salary' FROM F_Satisfaction f, D_Transportation t
WHERE f.Transportation = t.ID AND t.Type = @transportation
GROUP BY t.Type
END;
GO
/****** Object:  StoredProcedure [dbo].[CompanyMakeAbsent]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CompanyMakeAbsent](@subject AS NCHAR(20))
AS
BEGIN
SELECT TOP 1 c.*, (30 - f.Attendance) AS Absent FROM F_PostSubjectResult f, D_Subject s, D_Company c
WHERE f.Subject = s.ID AND f.Company = c.ID AND s.Name = @subject
ORDER BY Absent DESC
END;

GO
/****** Object:  StoredProcedure [dbo].[CountStudents]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountStudents](@minMark AS FLOAT)
AS
BEGIN
SELECT COUNT(*) AS 'Number of students', s.IsMale
FROM F_RESULT r, D_Student s
WHERE r.Student = s.ID AND r.Mark >= @minMark
GROUP BY s.IsMale
END;
GO
/****** Object:  StoredProcedure [dbo].[FindProgramingLanguage]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindProgramingLanguage](@x AS FLOAT)
AS
BEGIN
SELECT t.ProgramingLanguage, COUNT(f.Student) AS NumberOfStudents FROM F_Result f, D_Technology t
WHERE f.Technology = t.ID
GROUP BY t.ProgramingLanguage
HAVING COUNT(f.Student) > @x
END;

GO
/****** Object:  StoredProcedure [dbo].[ListStudents]    Script Date: 7/2/2019 9:48:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListStudents](@semester AS NCHAR(20), @year AS INT)
AS
BEGIN
SELECT s.* FROM F_Result f, D_Student s, D_Time t
WHERE t.Semester = @semester AND t.Year = @year AND s.ID = f.Student AND t.ID = f.Time
END;
GO
USE [master]
GO
ALTER DATABASE [OJTWarehouse] SET  READ_WRITE 
GO
