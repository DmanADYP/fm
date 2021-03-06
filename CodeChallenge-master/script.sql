USE [master]
GO
/****** Object:  Database [Region]    Script Date: 12/23/2016 1:27:58 PM ******/
CREATE DATABASE [Region]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Region', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.VIRTUSA\MSSQL\DATA\Region.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Region_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.VIRTUSA\MSSQL\DATA\Region_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Region] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Region].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Region] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Region] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Region] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Region] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Region] SET ARITHABORT OFF 
GO
ALTER DATABASE [Region] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Region] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Region] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Region] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Region] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Region] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Region] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Region] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Region] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Region] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Region] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Region] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Region] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Region] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Region] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Region] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Region] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Region] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Region] SET RECOVERY FULL 
GO
ALTER DATABASE [Region] SET  MULTI_USER 
GO
ALTER DATABASE [Region] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Region] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Region] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Region] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Region', N'ON'
GO
USE [Region]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 12/23/2016 1:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Regions](
	[Name] [varchar](255) NULL,
	[ID] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ZipCodes]    Script Date: 12/23/2016 1:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZipCodes](
	[Start] [varchar](255) NULL,
	[End] [varchar](255) NULL,
	[iid] [int] IDENTITY(1,1) NOT NULL,
	[ID] [varchar](255) NULL,
 CONSTRAINT [PK_ZipCodes] PRIMARY KEY CLUSTERED 
(
	[iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zips]    Script Date: 12/23/2016 1:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zips](
	[ZipCode] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Zips] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[RegionZipCodes]    Script Date: 12/23/2016 1:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW   [dbo].[RegionZipCodes]
As


SELECT R.Name, Z.Start,Z.[End],R.ID FROM [dbo].[Regions] R
INNER JOIN ZipCodes Z ON R.ID = Z.ID

GO
INSERT [dbo].[Regions] ([Name], [ID]) VALUES (N'TEST', N'3bb961ed-9780-431a-ab44-4801708ef5cd')
INSERT [dbo].[Regions] ([Name], [ID]) VALUES (N't2', N'55c5c4fd-1c42-412c-b063-2b685d0a75d2')
SET IDENTITY_INSERT [dbo].[ZipCodes] ON 

INSERT [dbo].[ZipCodes] ([Start], [End], [iid], [ID]) VALUES (N'09888', N'975545', 1, NULL)
INSERT [dbo].[ZipCodes] ([Start], [End], [iid], [ID]) VALUES (N'ooo', N'0000', 2, NULL)
INSERT [dbo].[ZipCodes] ([Start], [End], [iid], [ID]) VALUES (N'06002', N'06010', 4, N'4ab8e7ba-2248-4627-9c82-1cc2c3789b95')
INSERT [dbo].[ZipCodes] ([Start], [End], [iid], [ID]) VALUES (N'06801', N'06801', 5, N'af9a4c7f-ecd6-460f-a9b4-be821dca0dce')
INSERT [dbo].[ZipCodes] ([Start], [End], [iid], [ID]) VALUES (N'06011', N'06011', 6, N'976f0869-6117-451e-ba93-a5270ce452b1')
INSERT [dbo].[ZipCodes] ([Start], [End], [iid], [ID]) VALUES (N'06001', N'06002', 10, N'55c5c4fd-1c42-412c-b063-2b685d0a75d2')
SET IDENTITY_INSERT [dbo].[ZipCodes] OFF
SET IDENTITY_INSERT [dbo].[Zips] ON 

INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06001', 1)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06002', 2)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06006', 3)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06010', 4)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06011', 5)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06013', 6)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06016', 7)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06018', 8)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06019', 9)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06020', 10)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06021', 11)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06022', 12)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06023', 13)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06024', 14)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06025', 15)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06026', 16)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06027', 17)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06028', 18)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06029', 19)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06030', 20)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06031', 21)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06032', 22)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06033', 23)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06034', 24)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06035', 25)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06037', 26)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06039', 27)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06040', 28)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06041', 29)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06042', 30)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06043', 31)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06045', 32)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06050', 33)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06051', 34)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06052', 35)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06053', 36)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06057', 37)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06058', 38)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06059', 39)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06060', 40)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06061', 41)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06062', 42)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06063', 43)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06064', 44)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06065', 45)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06066', 46)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06067', 47)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06068', 48)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06069', 49)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06070', 50)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06071', 51)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06072', 52)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06073', 53)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06074', 54)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06075', 55)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06076', 56)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06077', 57)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06078', 58)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06079', 59)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06080', 60)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06081', 61)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06082', 62)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06083', 63)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06084', 64)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06085', 65)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06087', 66)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06088', 67)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06089', 68)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06090', 69)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06091', 70)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06092', 71)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06093', 72)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06094', 73)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06095', 74)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06096', 75)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06098', 76)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06101', 77)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06102', 78)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06103', 79)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06104', 80)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06105', 81)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06106', 82)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06107', 83)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06108', 84)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06109', 85)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06110', 86)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06111', 87)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06112', 88)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06114', 89)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06115', 90)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06117', 91)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06118', 92)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06119', 93)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06120', 94)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06123', 95)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06126', 96)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06127', 97)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06128', 98)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06129', 99)
GO
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06131', 100)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06132', 101)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06133', 102)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06134', 103)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06137', 104)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06138', 105)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06140', 106)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06141', 107)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06142', 108)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06143', 109)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06144', 110)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06145', 111)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06146', 112)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06147', 113)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06150', 114)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06151', 115)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06152', 116)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06153', 117)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06154', 118)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06155', 119)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06156', 120)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06160', 121)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06161', 122)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06167', 123)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06176', 124)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06180', 125)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06183', 126)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06199', 127)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06226', 128)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06230', 129)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06231', 130)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06232', 131)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06233', 132)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06234', 133)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06235', 134)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06237', 135)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06238', 136)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06239', 137)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06241', 138)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06242', 139)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06243', 140)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06244', 141)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06245', 142)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06246', 143)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06247', 144)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06248', 145)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06249', 146)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06250', 147)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06251', 148)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06254', 149)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06255', 150)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06256', 151)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06258', 152)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06259', 153)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06260', 154)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06262', 155)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06263', 156)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06264', 157)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06265', 158)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06266', 159)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06267', 160)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06268', 161)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06269', 162)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06277', 163)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06278', 164)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06279', 165)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06280', 166)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06281', 167)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06282', 168)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06320', 169)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06330', 170)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06331', 171)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06332', 172)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06333', 173)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06334', 174)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06335', 175)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06336', 176)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06338', 177)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06339', 178)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06340', 179)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06349', 180)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06350', 181)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06351', 182)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06353', 183)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06354', 184)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06355', 185)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06357', 186)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06359', 187)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06360', 188)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06365', 189)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06370', 190)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06371', 191)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06372', 192)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06373', 193)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06374', 194)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06375', 195)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06376', 196)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06377', 197)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06378', 198)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06379', 199)
GO
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06380', 200)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06382', 201)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06383', 202)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06384', 203)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06385', 204)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06386', 205)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06387', 206)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06388', 207)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06389', 208)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06401', 209)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06403', 210)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06404', 211)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06405', 212)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06408', 213)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06409', 214)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06410', 215)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06411', 216)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06412', 217)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06413', 218)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06414', 219)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06415', 220)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06416', 221)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06417', 222)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06418', 223)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06419', 224)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06420', 225)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06422', 226)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06423', 227)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06424', 228)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06426', 229)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06437', 230)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06438', 231)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06439', 232)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06440', 233)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06441', 234)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06442', 235)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06443', 236)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06444', 237)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06447', 238)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06450', 239)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06451', 240)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06454', 241)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06455', 242)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06456', 243)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06457', 244)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06459', 245)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06460', 246)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06461', 247)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06467', 248)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06468', 249)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06469', 250)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06470', 251)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06471', 252)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06472', 253)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06473', 254)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06474', 255)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06475', 256)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06477', 257)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06478', 258)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06479', 259)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06480', 260)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06481', 261)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06482', 262)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06483', 263)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06484', 264)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06487', 265)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06488', 266)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06489', 267)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06491', 268)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06492', 269)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06493', 270)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06494', 271)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06495', 272)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06497', 273)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06498', 274)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06501', 275)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06502', 276)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06503', 277)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06504', 278)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06505', 279)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06506', 280)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06507', 281)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06508', 282)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06509', 283)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06510', 284)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06511', 285)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06512', 286)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06513', 287)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06514', 288)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06515', 289)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06516', 290)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06517', 291)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06518', 292)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06519', 293)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06520', 294)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06521', 295)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06524', 296)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06525', 297)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06530', 298)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06531', 299)
GO
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06532', 300)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06533', 301)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06534', 302)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06535', 303)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06536', 304)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06537', 305)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06538', 306)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06540', 307)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06601', 308)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06602', 309)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06604', 310)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06605', 311)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06606', 312)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06607', 313)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06608', 314)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06610', 315)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06611', 316)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06612', 317)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06614', 318)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06615', 319)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06650', 320)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06673', 321)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06699', 322)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06701', 323)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06702', 324)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06703', 325)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06704', 326)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06705', 327)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06706', 328)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06708', 329)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06710', 330)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06712', 331)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06716', 332)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06720', 333)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06721', 334)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06722', 335)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06723', 336)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06724', 337)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06725', 338)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06726', 339)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06749', 340)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06750', 341)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06751', 342)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06752', 343)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06753', 344)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06754', 345)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06755', 346)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06756', 347)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06757', 348)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06758', 349)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06759', 350)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06762', 351)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06763', 352)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06770', 353)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06776', 354)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06777', 355)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06778', 356)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06779', 357)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06781', 358)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06782', 359)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06783', 360)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06784', 361)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06785', 362)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06786', 363)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06787', 364)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06790', 365)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06791', 366)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06792', 367)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06793', 368)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06794', 369)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06795', 370)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06796', 371)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06798', 372)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06801', 373)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06804', 374)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06807', 375)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06810', 376)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06811', 377)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06812', 378)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06813', 379)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06814', 380)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06816', 381)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06817', 382)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06820', 383)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06824', 384)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06825', 385)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06828', 386)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06829', 387)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06830', 388)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06831', 389)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06832', 390)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06836', 391)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06838', 392)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06840', 393)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06842', 394)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06850', 395)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06851', 396)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06852', 397)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06853', 398)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06854', 399)
GO
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06855', 400)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06856', 401)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06857', 402)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06858', 403)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06859', 404)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06860', 405)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06870', 406)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06875', 407)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06876', 408)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06877', 409)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06878', 410)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06879', 411)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06880', 412)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06881', 413)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06883', 414)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06888', 415)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06889', 416)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06890', 417)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06896', 418)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06897', 419)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06901', 420)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06902', 421)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06903', 422)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06904', 423)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06905', 424)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06906', 425)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06907', 426)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06910', 427)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06911', 428)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06912', 429)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06913', 430)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06914', 431)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06920', 432)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06921', 433)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06922', 434)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06925', 435)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06926', 436)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06927', 437)
INSERT [dbo].[Zips] ([ZipCode], [ID]) VALUES (N'06928', 438)
SET IDENTITY_INSERT [dbo].[Zips] OFF
USE [master]
GO
ALTER DATABASE [Region] SET  READ_WRITE 
GO
