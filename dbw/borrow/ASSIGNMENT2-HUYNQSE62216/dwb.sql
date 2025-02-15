USE [master]
GO
/****** Object:  Database [DBW301]    Script Date: 3/23/2019 10:27:13 PM ******/
CREATE DATABASE [DBW301]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBW301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBW301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBW301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBW301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBW301] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBW301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBW301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBW301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBW301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBW301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBW301] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBW301] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBW301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBW301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBW301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBW301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBW301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBW301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBW301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBW301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBW301] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBW301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBW301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBW301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBW301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBW301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBW301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBW301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBW301] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBW301] SET  MULTI_USER 
GO
ALTER DATABASE [DBW301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBW301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBW301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBW301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBW301] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DBW301]
GO
/****** Object:  Table [dbo].[D_Mark]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Mark](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [nvarchar](50) NULL,
	[Mark] [float] NULL,
 CONSTRAINT [PK_Mark] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[D_OJTCompany]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_OJTCompany](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Staves] [int] NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_OJTCompany] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[D_Relationship]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Relationship](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Level] [nvarchar](50) NULL,
 CONSTRAINT [PK_D_Relationship] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[D_SchoolSupport]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_SchoolSupport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Problem] [nvarchar](50) NULL,
	[Solution] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_D_SchoolSupport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[D_Time]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_Time](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Semester] [nvarchar](50) NULL,
	[Month] [int] NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[D_WorkProgress]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[D_WorkProgress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
 CONSTRAINT [PK_D_Student_join_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[F_AcademicAfterOJT]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_AcademicAfterOJT](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RelationshipId] [int] NULL,
	[WorkProgressId] [int] NULL,
	[TimeId] [int] NULL,
	[NumOfSoftSkill] [int] NULL,
	[AbsenceTime] [int] NULL,
	[NumOfAppliedSkill] [int] NULL,
 CONSTRAINT [PK_F_AcademicAfterOJT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[F_OJTResult]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_OJTResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkProgressId] [int] NULL,
	[OJTCompanyId] [int] NULL,
	[TimeId] [int] NULL,
	[MarkId] [int] NULL,
	[AbsentTime] [int] NULL,
	[NumOfAward] [int] NULL,
 CONSTRAINT [PK_F_OJTResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[F_SatisfactionOfStudent]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[F_SatisfactionOfStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OJTCompanyId] [int] NULL,
	[WorkingProgressId] [int] NULL,
	[SchoolSupportId] [int] NULL,
	[Salary] [float] NULL,
	[NumOfProviding] [int] NULL,
	[NumOfLearntSkill] [int] NULL,
	[NumOfCompain] [int] NULL,
	[NumOfJoinedActivity] [int] NULL,
 CONSTRAINT [PK_F_SatisfactionOfStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Language] [nvarchar](50) NULL,
	[OTTime] [int] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Grade] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkProgress_has_Project]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkProgress_has_Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkProgressId] [int] NULL,
	[ProjectId] [int] NULL,
 CONSTRAINT [PK_WorkProgress_has_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[D_Mark] ON 

INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (1, N'Bad', 5)
INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (2, N'Accept', 6)
INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (3, N'Accept', 6.5)
INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (4, N'Accept', 6.75)
INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (5, N'Accept', 7)
INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (6, N'Good', 7.5)
INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (7, N'Good', 7.75)
INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (8, N'Good', 8)
INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (9, N'Good', 8.5)
INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (10, N'Excellent', 9)
INSERT [dbo].[D_Mark] ([Id], [Rating], [Mark]) VALUES (11, N'Excellent', 10)
SET IDENTITY_INSERT [dbo].[D_Mark] OFF
SET IDENTITY_INSERT [dbo].[D_OJTCompany] ON 

INSERT [dbo].[D_OJTCompany] ([Id], [Name], [Type], [Staves], [Location]) VALUES (1, N'FSoft', N'Product', 1000, N'Q9')
INSERT [dbo].[D_OJTCompany] ([Id], [Name], [Type], [Staves], [Location]) VALUES (2, N'Mina', N'Product', 200, N'Q3')
INSERT [dbo].[D_OJTCompany] ([Id], [Name], [Type], [Staves], [Location]) VALUES (3, N'Misa', N'Product', 300, N'Q12')
INSERT [dbo].[D_OJTCompany] ([Id], [Name], [Type], [Staves], [Location]) VALUES (4, N'Fetch', N'Outsource', 200, N'Q9')
INSERT [dbo].[D_OJTCompany] ([Id], [Name], [Type], [Staves], [Location]) VALUES (5, N'GlobalCybersoft', N'OutSource', 200, N'Q12')
SET IDENTITY_INSERT [dbo].[D_OJTCompany] OFF
SET IDENTITY_INSERT [dbo].[D_Relationship] ON 

INSERT [dbo].[D_Relationship] ([Id], [Type], [Level]) VALUES (1, N'Colleage', N'Casual')
INSERT [dbo].[D_Relationship] ([Id], [Type], [Level]) VALUES (2, N'Leader', N'Casual')
INSERT [dbo].[D_Relationship] ([Id], [Type], [Level]) VALUES (3, N'Company', N'Contract')
SET IDENTITY_INSERT [dbo].[D_Relationship] OFF
SET IDENTITY_INSERT [dbo].[D_SchoolSupport] ON 

INSERT [dbo].[D_SchoolSupport] ([Id], [Problem], [Solution], [Status]) VALUES (1, N'CV', N'Mail', N'Solved')
INSERT [dbo].[D_SchoolSupport] ([Id], [Problem], [Solution], [Status]) VALUES (2, N'Benefit', N'Mail', N'Not  Solved')
INSERT [dbo].[D_SchoolSupport] ([Id], [Problem], [Solution], [Status]) VALUES (3, N'Order', N'Mail', N'Not Solved')
INSERT [dbo].[D_SchoolSupport] ([Id], [Problem], [Solution], [Status]) VALUES (4, N'Conference', N'Mail', N'Solved')
INSERT [dbo].[D_SchoolSupport] ([Id], [Problem], [Solution], [Status]) VALUES (5, N'ITSupport', N'Mail', N'Not Solved')
INSERT [dbo].[D_SchoolSupport] ([Id], [Problem], [Solution], [Status]) VALUES (6, N'Infomation', N'Mail', N'Solved')
SET IDENTITY_INSERT [dbo].[D_SchoolSupport] OFF
SET IDENTITY_INSERT [dbo].[D_Time] ON 

INSERT [dbo].[D_Time] ([Id], [Semester], [Month]) VALUES (1, N'Spring', 4)
INSERT [dbo].[D_Time] ([Id], [Semester], [Month]) VALUES (2, N'Summer', 4)
INSERT [dbo].[D_Time] ([Id], [Semester], [Month]) VALUES (3, N'Fall', 4)
INSERT [dbo].[D_Time] ([Id], [Semester], [Month]) VALUES (4, N'Spring', 6)
INSERT [dbo].[D_Time] ([Id], [Semester], [Month]) VALUES (5, N'Summer', 6)
INSERT [dbo].[D_Time] ([Id], [Semester], [Month]) VALUES (6, N'Fall', 6)
SET IDENTITY_INSERT [dbo].[D_Time] OFF
SET IDENTITY_INSERT [dbo].[D_WorkProgress] ON 

INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (1, 1)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (2, 2)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (3, 3)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (4, 4)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (5, 5)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (6, 6)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (7, 7)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (8, 8)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (9, 9)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (10, 10)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (11, 11)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (12, 12)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (13, 13)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (14, 14)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (15, 15)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (16, 16)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (17, 17)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (18, 18)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (19, 19)
INSERT [dbo].[D_WorkProgress] ([Id], [StudentId]) VALUES (20, 20)
SET IDENTITY_INSERT [dbo].[D_WorkProgress] OFF
SET IDENTITY_INSERT [dbo].[F_AcademicAfterOJT] ON 

INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (1, 3, 1, 1, 1, 5, 4)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (2, 3, 2, 1, 2, 10, 3)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (3, 2, 3, 2, 3, 11, 5)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (4, 1, 4, 1, 4, 2, 5)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (5, 2, 5, 1, 1, 2, 1)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (6, 3, 6, 2, 2, 7, 2)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (7, 3, 7, 1, 3, 8, 3)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (8, 3, 8, 3, 1, 8, 4)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (9, 3, 9, 1, 1, 6, 5)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (10, 3, 10, 5, 1, 7, 6)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (11, 3, 11, 1, 4, 8, 1)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (12, 2, 12, 5, 2, 2, 2)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (13, 1, 13, 4, 1, 1, 2)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (14, 3, 14, 5, 2, 1, 2)
INSERT [dbo].[F_AcademicAfterOJT] ([Id], [RelationshipId], [WorkProgressId], [TimeId], [NumOfSoftSkill], [AbsenceTime], [NumOfAppliedSkill]) VALUES (15, 2, 15, 3, 2, 3, 2)
SET IDENTITY_INSERT [dbo].[F_AcademicAfterOJT] OFF
SET IDENTITY_INSERT [dbo].[F_OJTResult] ON 

INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (1, 1, 1, 1, 5, 10, 1)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (2, 2, 1, 1, 7, 1, 2)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (3, 3, 1, 1, 1, 20, 2)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (4, 4, 1, 2, 2, 5, 4)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (5, 5, 2, 1, 3, 5, 1)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (6, 6, 3, 3, 4, 4, 1)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (7, 7, 4, 1, 7, 3, 2)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (8, 8, 4, 1, 8, 1, 1)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (9, 9, 4, 5, 9, 1, 3)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (10, 10, 4, 6, 10, 0, 2)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (11, 11, 3, 2, 5, 20, 1)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (12, 12, 2, 6, 5, 20, 2)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (13, 13, 4, 4, 4, 21, 1)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (14, 14, 4, 4, 8, 2, 3)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (15, 15, 1, 4, 7, 5, 2)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (16, 16, 1, 2, 6, 10, 3)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (17, 17, 2, 3, 5, 12, 3)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (18, 18, 3, 5, 6, 9, 3)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (19, 19, 5, 3, 5, 22, 1)
INSERT [dbo].[F_OJTResult] ([Id], [WorkProgressId], [OJTCompanyId], [TimeId], [MarkId], [AbsentTime], [NumOfAward]) VALUES (20, 20, 5, 2, 9, 2, 3)
SET IDENTITY_INSERT [dbo].[F_OJTResult] OFF
SET IDENTITY_INSERT [dbo].[F_SatisfactionOfStudent] ON 

INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (1, 1, 1, 1, 3000000, 2, 3, 2, 2)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (2, 2, 2, 2, 4000000, 2, 4, 2, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (3, 3, 3, 3, 5000000, 2, 3, 2, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (4, 4, 4, 4, 7000000, 3, 5, 2, 4)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (5, 5, 5, 5, 3500000, 3, 5, 6, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (6, 1, 6, 6, 4700000, 2, 6, 7, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (7, 2, 7, 1, 3500000, 2, 3, 8, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (8, 3, 8, 1, 3500000, 3, 4, 9, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (9, 4, 9, 2, 4000000, 2, 4, 3, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (10, 5, 10, 3, 3500000, 2, 4, 2, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (11, 1, 11, 4, 3500000, 2, 3, 2, 2)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (12, 1, 12, 1, 3500000, 3, 5, 1, 2)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (13, 1, 13, 5, 3500000, 3, 6, 2, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (14, 2, 14, 6, 3500000, 3, 3, 5, 2)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (15, 3, 15, 1, 4000000, 2, 4, 5, 4)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (16, 4, 16, 1, 3500000, 3, 5, 7, 5)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (17, 5, 17, 1, 5000000, 2, 6, 8, 4)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (18, 2, 18, 1, 3500000, 2, 6, 9, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (19, 3, 19, 1, 4000000, 2, 5, 7, 3)
INSERT [dbo].[F_SatisfactionOfStudent] ([Id], [OJTCompanyId], [WorkingProgressId], [SchoolSupportId], [Salary], [NumOfProviding], [NumOfLearntSkill], [NumOfCompain], [NumOfJoinedActivity]) VALUES (20, 5, 20, 1, 4000000, 3, 5, 6, 3)
SET IDENTITY_INSERT [dbo].[F_SatisfactionOfStudent] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [Name], [Type], [Language], [OTTime]) VALUES (1, N'SuonBoWeb', N'Web', N'JAVA', 10)
INSERT [dbo].[Project] ([Id], [Name], [Type], [Language], [OTTime]) VALUES (2, N'PassioWeb', N'Web', N'CSharp', 100)
INSERT [dbo].[Project] ([Id], [Name], [Type], [Language], [OTTime]) VALUES (3, N'POS', N'Winform', N'CSharp', 40)
INSERT [dbo].[Project] ([Id], [Name], [Type], [Language], [OTTime]) VALUES (4, N'DroneDriver', N'Console', N'C', 19)
INSERT [dbo].[Project] ([Id], [Name], [Type], [Language], [OTTime]) VALUES (5, N'MarketIndex', N'Console', N'C++', 25)
INSERT [dbo].[Project] ([Id], [Name], [Type], [Language], [OTTime]) VALUES (6, N'VideoConfference', N'Desktop', N'JAVA', 70)
INSERT [dbo].[Project] ([Id], [Name], [Type], [Language], [OTTime]) VALUES (7, N'IniUT', N'Test', N'JAVA', 40)
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (1, N'Trần Văn A', N'K10')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (2, N'Trần Văn B', N'K10')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (3, N'Trần Văn C
', N'K10')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (4, N'Trần Văn D
', N'K10')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (5, N'Trần Văn E
', N'K10')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (6, N'Trần Văn H
', N'K10')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (7, N'Trần Văn I
', N'K10')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (8, N'Trần Văn J
', N'K10')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (9, N'Trần Văn K
', N'K11
')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (10, N'Trần Văn L
', N'K11
')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (11, N'Trần Văn M
', N'K11
')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (12, N'Trần Văn N
', N'K11
')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (13, N'Trần Văn O
', N'K11
')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (14, N'Trần Văn P
', N'K11
')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (15, N'Trần Văn Q
', N'K11
')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (16, N'Trần Văn S
', N'K11
')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (17, N'Trần Văn T
', N'K11
')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (18, N'Trần Văn V
', N'K11
')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (19, N'Trần Văn U', N'K11')
INSERT [dbo].[Student] ([Id], [Name], [Grade]) VALUES (20, N'Trần Văn W', N'K11')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[WorkProgress_has_Project] ON 

INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (1, 1, 1)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (2, 2, 1)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (3, 3, 1)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (4, 4, 1)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (5, 5, 2)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (6, 6, 3)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (7, 7, 4)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (8, 8, 5)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (9, 9, 6)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (10, 10, 7)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (11, 11, 2)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (12, 12, 3)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (13, 13, 4)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (14, 14, 5)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (15, 15, 6)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (16, 16, 7)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (17, 17, 7)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (18, 18, 4)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (19, 19, 5)
INSERT [dbo].[WorkProgress_has_Project] ([Id], [WorkProgressId], [ProjectId]) VALUES (20, 20, 6)
SET IDENTITY_INSERT [dbo].[WorkProgress_has_Project] OFF
ALTER TABLE [dbo].[D_WorkProgress]  WITH CHECK ADD  CONSTRAINT [FK_D_WorkProgress_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[D_WorkProgress] CHECK CONSTRAINT [FK_D_WorkProgress_Student]
GO
ALTER TABLE [dbo].[F_AcademicAfterOJT]  WITH CHECK ADD  CONSTRAINT [FK_F_AcademicAfterOJT_D_Relationship] FOREIGN KEY([RelationshipId])
REFERENCES [dbo].[D_Relationship] ([Id])
GO
ALTER TABLE [dbo].[F_AcademicAfterOJT] CHECK CONSTRAINT [FK_F_AcademicAfterOJT_D_Relationship]
GO
ALTER TABLE [dbo].[F_AcademicAfterOJT]  WITH CHECK ADD  CONSTRAINT [FK_F_AcademicAfterOJT_D_Time] FOREIGN KEY([TimeId])
REFERENCES [dbo].[D_Time] ([Id])
GO
ALTER TABLE [dbo].[F_AcademicAfterOJT] CHECK CONSTRAINT [FK_F_AcademicAfterOJT_D_Time]
GO
ALTER TABLE [dbo].[F_AcademicAfterOJT]  WITH CHECK ADD  CONSTRAINT [FK_F_AcademicAfterOJT_D_WorkProgress] FOREIGN KEY([WorkProgressId])
REFERENCES [dbo].[D_WorkProgress] ([Id])
GO
ALTER TABLE [dbo].[F_AcademicAfterOJT] CHECK CONSTRAINT [FK_F_AcademicAfterOJT_D_WorkProgress]
GO
ALTER TABLE [dbo].[F_OJTResult]  WITH CHECK ADD  CONSTRAINT [FK_F_OJTResult_D_Mark] FOREIGN KEY([MarkId])
REFERENCES [dbo].[D_Mark] ([Id])
GO
ALTER TABLE [dbo].[F_OJTResult] CHECK CONSTRAINT [FK_F_OJTResult_D_Mark]
GO
ALTER TABLE [dbo].[F_OJTResult]  WITH CHECK ADD  CONSTRAINT [FK_F_OJTResult_D_OJTCompany] FOREIGN KEY([OJTCompanyId])
REFERENCES [dbo].[D_OJTCompany] ([Id])
GO
ALTER TABLE [dbo].[F_OJTResult] CHECK CONSTRAINT [FK_F_OJTResult_D_OJTCompany]
GO
ALTER TABLE [dbo].[F_OJTResult]  WITH CHECK ADD  CONSTRAINT [FK_F_OJTResult_D_Time] FOREIGN KEY([TimeId])
REFERENCES [dbo].[D_Time] ([Id])
GO
ALTER TABLE [dbo].[F_OJTResult] CHECK CONSTRAINT [FK_F_OJTResult_D_Time]
GO
ALTER TABLE [dbo].[F_OJTResult]  WITH CHECK ADD  CONSTRAINT [FK_F_OJTResult_D_WorkProgress] FOREIGN KEY([WorkProgressId])
REFERENCES [dbo].[D_WorkProgress] ([Id])
GO
ALTER TABLE [dbo].[F_OJTResult] CHECK CONSTRAINT [FK_F_OJTResult_D_WorkProgress]
GO
ALTER TABLE [dbo].[F_SatisfactionOfStudent]  WITH CHECK ADD  CONSTRAINT [FK_F_SatisfactionOfStudent_D_OJTCompany] FOREIGN KEY([OJTCompanyId])
REFERENCES [dbo].[D_OJTCompany] ([Id])
GO
ALTER TABLE [dbo].[F_SatisfactionOfStudent] CHECK CONSTRAINT [FK_F_SatisfactionOfStudent_D_OJTCompany]
GO
ALTER TABLE [dbo].[F_SatisfactionOfStudent]  WITH CHECK ADD  CONSTRAINT [FK_F_SatisfactionOfStudent_D_SchoolSupport] FOREIGN KEY([SchoolSupportId])
REFERENCES [dbo].[D_SchoolSupport] ([Id])
GO
ALTER TABLE [dbo].[F_SatisfactionOfStudent] CHECK CONSTRAINT [FK_F_SatisfactionOfStudent_D_SchoolSupport]
GO
ALTER TABLE [dbo].[F_SatisfactionOfStudent]  WITH CHECK ADD  CONSTRAINT [FK_F_SatisfactionOfStudent_D_WorkProgress] FOREIGN KEY([WorkingProgressId])
REFERENCES [dbo].[D_WorkProgress] ([Id])
GO
ALTER TABLE [dbo].[F_SatisfactionOfStudent] CHECK CONSTRAINT [FK_F_SatisfactionOfStudent_D_WorkProgress]
GO
ALTER TABLE [dbo].[WorkProgress_has_Project]  WITH CHECK ADD  CONSTRAINT [FK_WorkProgress_has_Project_D_WorkProgress] FOREIGN KEY([WorkProgressId])
REFERENCES [dbo].[D_WorkProgress] ([Id])
GO
ALTER TABLE [dbo].[WorkProgress_has_Project] CHECK CONSTRAINT [FK_WorkProgress_has_Project_D_WorkProgress]
GO
ALTER TABLE [dbo].[WorkProgress_has_Project]  WITH CHECK ADD  CONSTRAINT [FK_WorkProgress_has_Project_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[WorkProgress_has_Project] CHECK CONSTRAINT [FK_WorkProgress_has_Project_Project]
GO

/****** Object:  StoredProcedure [dbo].[AcademicAbsent]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AcademicAbsent]
AS
BEGIN
	SELECT dt.Semester, SUM(f.AbsenceTime) Absents
	FROM F_AcademicAfterOJT f, D_Relationship dr, D_Time dt
	WHERE	f.RelationshipId = dr.Id AND
			f.TimeId = dt.Id AND
			dr.Level = 'Contract'
	GROUP BY dt.Semester
END
GO
/****** Object:  StoredProcedure [dbo].[OJTAverageSalary]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OJTAverageSalary]
	@companyName nvarchar(50)
AS
BEGIN
SELECT AVG(f.Salary) AS Salary
FROM F_SatisfactionOfStudent f, D_WorkProgress dw, D_OJTCompany dc
WHERE	f.OJTCompanyId = dc.Id AND
		dc.Name = @companyName
END
GO
/****** Object:  StoredProcedure [dbo].[OJTInfomation]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OJTInfomation] 
	@TimeName nvarchar(50)
AS
BEGIN
SELECT	s.Name, s.Grade, dc.Name, dc.Type, dm.Mark, dm.Rating
FROM	F_OJTResult f, D_OJTCompany dc, D_Time dt, D_Mark dm, D_WorkProgress dw, Student s
WHERE	f.WorkProgressId = dw.Id AND
		f.MarkId = dm.Id AND
		s.Id = dw.StudentId AND
		f.OJTCompanyId = dc.Id AND
		f.TimeId = dt.Id AND
		dt.Semester = @TimeName
END

GO
/****** Object:  StoredProcedure [dbo].[OJTLocation]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OJTLocation]
	@location nvarchar(50)
AS
BEGIN
SELECT	dc.Name, SUM(f.AbsentTime) AS Absents
FROM	F_OJTResult f, D_OJTCompany dc, D_Mark dm
WHERE	f.OJTCompanyId = dc.Id AND
		dc.Location = @location
GROUP BY dc.Name
END

GO
/****** Object:  StoredProcedure [dbo].[OJTSumSkill]    Script Date: 3/23/2019 10:27:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OJTSumSkill]
	@companyType nvarchar(50)
AS
BEGIN
SELECT dc.Name, SUM(f.NumOfLearntSkill) AS Learn_Skill
FROM F_SatisfactionOfStudent f, D_OJTCompany dc
WHERE	f.WorkingProgressId = dc.Id AND
		dc.Type = @companyType
GROUP BY dc.Name
END

GO
USE [master]
GO
ALTER DATABASE [DBW301] SET  READ_WRITE 
GO
