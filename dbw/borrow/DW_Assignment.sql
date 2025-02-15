USE [master]
GO
/****** Object:  Database [DW_Assignment]    Script Date: 11/3/2018 8:59:18 PM ******/
CREATE DATABASE [DW_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DW_Assignment', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DW_Assignment.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DW_Assignment_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DW_Assignment_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DW_Assignment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DW_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DW_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DW_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DW_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DW_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DW_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [DW_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DW_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DW_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DW_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DW_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DW_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DW_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DW_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DW_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DW_Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DW_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DW_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DW_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DW_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DW_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DW_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DW_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DW_Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [DW_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [DW_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DW_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DW_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DW_Assignment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DW_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DW_Assignment', N'ON'
GO
USE [DW_Assignment]
GO
/****** Object:  Table [dbo].[CapstoneProject]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CapstoneProject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Topic] [varchar](255) NULL,
	[Result] [varchar](50) NULL,
	[Evaluation] [varchar](50) NULL,
 CONSTRAINT [PK_CapstoneProject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanySize]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanySize](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumberOfStaff] [int] NULL,
	[BudgetOfProject] [float] NULL,
	[NumberOfOffice] [int] NULL,
 CONSTRAINT [PK_CompanySize] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EffectFact]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EffectFact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Experiences] [float] NULL,
	[Vision] [varchar](255) NULL,
	[SkillSupportID] [int] NOT NULL,
	[CapstoneProjectID] [int] NOT NULL,
	[WorkProcessID] [int] NOT NULL,
 CONSTRAINT [PK_EffectFact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NumberOfComplaints]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NumberOfComplaints](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentComplained] [varchar](50) NULL,
	[CompanyComplaining] [varchar](50) NULL,
	[Place] [varchar](50) NULL,
	[Level] [int] NULL,
 CONSTRAINT [PK_NumberOfComplaints] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NumberOfSkills]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NumberOfSkills](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](50) NULL,
	[JobPosition] [varchar](50) NULL,
 CONSTRAINT [PK_NumberOfSkills] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NumberOfStudent]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumberOfStudent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OJTOnTime] [int] NULL,
	[OJTOnJob] [int] NULL,
 CONSTRAINT [PK_NumberOfStudent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NumberOfVehicles]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NumberOfVehicles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyAddress] [varchar](50) NULL,
	[StudentAddress] [varchar](50) NULL,
 CONSTRAINT [PK_NumberOfVehicles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResultFact]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResultFact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FeedBack] [varchar](255) NULL,
	[ScoreID] [int] NOT NULL,
	[NumberOfStudentID] [int] NOT NULL,
	[SkillsID] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
 CONSTRAINT [PK_ResultFact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Salary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Unit] [varchar](50) NULL,
	[Level] [int] NULL,
	[StartSalary] [float] NULL,
 CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SatisfactionFact]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SatisfactionFact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SalaryID] [int] NOT NULL,
	[Salary] [float] NULL,
	[TimeID] [int] NOT NULL,
	[NumberOfSkillID] [int] NOT NULL,
	[NumberOfComplaintID] [int] NOT NULL,
	[NumberOfVehicleID] [int] NOT NULL,
	[CompanySizeID] [int] NOT NULL,
	[NumberOfComplaints] [int] NULL,
	[Bonus] [float] NULL,
 CONSTRAINT [PK_SatisfactionFact_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Score]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Score](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varbinary](50) NULL,
	[Student] [varchar](50) NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TechnicalSkill] [int] NULL,
	[SoftSkills] [int] NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SkillSupportPostSubjects]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillSupportPostSubjects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TechnicalSkills] [int] NULL,
	[SoftSkills] [int] NULL,
	[Languages] [int] NULL,
 CONSTRAINT [PK_SkillSupportPostSubjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Hour] [float] NULL,
	[TaskCompleted] [int] NULL,
	[DifficultyLevel] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Time]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NULL,
	[Quater] [float] NULL,
	[Month] [int] NULL,
	[Week] [int] NULL,
	[Day] [int] NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkProcess]    Script Date: 11/3/2018 8:59:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkProcess](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Goal] [varchar](255) NULL,
	[TimeManagement] [varchar](255) NULL,
	[ResourceManagement] [varchar](255) NULL,
 CONSTRAINT [PK_WorkProcess] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[EffectFact]  WITH CHECK ADD  CONSTRAINT [FK_EffectFact_CapstoneProject] FOREIGN KEY([CapstoneProjectID])
REFERENCES [dbo].[CapstoneProject] ([ID])
GO
ALTER TABLE [dbo].[EffectFact] CHECK CONSTRAINT [FK_EffectFact_CapstoneProject]
GO
ALTER TABLE [dbo].[EffectFact]  WITH CHECK ADD  CONSTRAINT [FK_EffectFact_SkillSupportPostSubjects] FOREIGN KEY([SkillSupportID])
REFERENCES [dbo].[SkillSupportPostSubjects] ([ID])
GO
ALTER TABLE [dbo].[EffectFact] CHECK CONSTRAINT [FK_EffectFact_SkillSupportPostSubjects]
GO
ALTER TABLE [dbo].[EffectFact]  WITH CHECK ADD  CONSTRAINT [FK_EffectFact_WorkProcess] FOREIGN KEY([WorkProcessID])
REFERENCES [dbo].[WorkProcess] ([ID])
GO
ALTER TABLE [dbo].[EffectFact] CHECK CONSTRAINT [FK_EffectFact_WorkProcess]
GO
ALTER TABLE [dbo].[ResultFact]  WITH CHECK ADD  CONSTRAINT [FK_ResultFact_NumberOfStudent] FOREIGN KEY([NumberOfStudentID])
REFERENCES [dbo].[NumberOfStudent] ([ID])
GO
ALTER TABLE [dbo].[ResultFact] CHECK CONSTRAINT [FK_ResultFact_NumberOfStudent]
GO
ALTER TABLE [dbo].[ResultFact]  WITH CHECK ADD  CONSTRAINT [FK_ResultFact_Score] FOREIGN KEY([ScoreID])
REFERENCES [dbo].[Score] ([ID])
GO
ALTER TABLE [dbo].[ResultFact] CHECK CONSTRAINT [FK_ResultFact_Score]
GO
ALTER TABLE [dbo].[ResultFact]  WITH CHECK ADD  CONSTRAINT [FK_ResultFact_Skills] FOREIGN KEY([SkillsID])
REFERENCES [dbo].[Skills] ([ID])
GO
ALTER TABLE [dbo].[ResultFact] CHECK CONSTRAINT [FK_ResultFact_Skills]
GO
ALTER TABLE [dbo].[ResultFact]  WITH CHECK ADD  CONSTRAINT [FK_ResultFact_Task] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task] ([ID])
GO
ALTER TABLE [dbo].[ResultFact] CHECK CONSTRAINT [FK_ResultFact_Task]
GO
ALTER TABLE [dbo].[SatisfactionFact]  WITH CHECK ADD  CONSTRAINT [FK_SatisfactionFact_CompanySize] FOREIGN KEY([CompanySizeID])
REFERENCES [dbo].[CompanySize] ([ID])
GO
ALTER TABLE [dbo].[SatisfactionFact] CHECK CONSTRAINT [FK_SatisfactionFact_CompanySize]
GO
ALTER TABLE [dbo].[SatisfactionFact]  WITH CHECK ADD  CONSTRAINT [FK_SatisfactionFact_NumberOfComplaints] FOREIGN KEY([NumberOfComplaintID])
REFERENCES [dbo].[NumberOfComplaints] ([ID])
GO
ALTER TABLE [dbo].[SatisfactionFact] CHECK CONSTRAINT [FK_SatisfactionFact_NumberOfComplaints]
GO
ALTER TABLE [dbo].[SatisfactionFact]  WITH CHECK ADD  CONSTRAINT [FK_SatisfactionFact_NumberOfSkills] FOREIGN KEY([NumberOfSkillID])
REFERENCES [dbo].[NumberOfSkills] ([ID])
GO
ALTER TABLE [dbo].[SatisfactionFact] CHECK CONSTRAINT [FK_SatisfactionFact_NumberOfSkills]
GO
ALTER TABLE [dbo].[SatisfactionFact]  WITH CHECK ADD  CONSTRAINT [FK_SatisfactionFact_NumberOfVehicles] FOREIGN KEY([NumberOfVehicleID])
REFERENCES [dbo].[NumberOfVehicles] ([ID])
GO
ALTER TABLE [dbo].[SatisfactionFact] CHECK CONSTRAINT [FK_SatisfactionFact_NumberOfVehicles]
GO
ALTER TABLE [dbo].[SatisfactionFact]  WITH CHECK ADD  CONSTRAINT [FK_SatisfactionFact_Salary] FOREIGN KEY([SalaryID])
REFERENCES [dbo].[Salary] ([ID])
GO
ALTER TABLE [dbo].[SatisfactionFact] CHECK CONSTRAINT [FK_SatisfactionFact_Salary]
GO
ALTER TABLE [dbo].[SatisfactionFact]  WITH CHECK ADD  CONSTRAINT [FK_SatisfactionFact_Time] FOREIGN KEY([TimeID])
REFERENCES [dbo].[Time] ([ID])
GO
ALTER TABLE [dbo].[SatisfactionFact] CHECK CONSTRAINT [FK_SatisfactionFact_Time]
GO
USE [master]
GO
ALTER DATABASE [DW_Assignment] SET  READ_WRITE 
GO
