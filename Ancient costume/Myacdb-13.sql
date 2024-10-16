USE [master]
GO
/****** Object:  Database [AcDB]    Script Date: 2024/7/17 下午 05:23:56 ******/
CREATE DATABASE [AcDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AcDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AcDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AcDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AcDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AcDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AcDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AcDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AcDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AcDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AcDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AcDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AcDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AcDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AcDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AcDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AcDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AcDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AcDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AcDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AcDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AcDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AcDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AcDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AcDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AcDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AcDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AcDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AcDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AcDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AcDB] SET  MULTI_USER 
GO
ALTER DATABASE [AcDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AcDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AcDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AcDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AcDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AcDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AcDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [AcDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AcDB]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[JourneyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JourneyName] [nvarchar](50) NULL,
	[JourneyDate] [date] NULL,
	[JourneyContent] [nvarchar](max) NULL,
	[JourneyShort] [nvarchar](50) NULL,
	[Sights] [nvarchar](50) NULL,
	[Stay] [nvarchar](50) NULL,
	[Stay_img1] [nvarchar](max) NULL,
	[Stay_img2] [nvarchar](max) NULL,
	[Stay_img3] [nvarchar](max) NULL,
	[Stay_title] [nvarchar](max) NULL,
	[Stay_text] [nvarchar](max) NULL,
	[ExpenseItems] [nvarchar](50) NULL,
	[Remarks] [nvarchar](50) NULL,
	[AssemblyPlace] [nvarchar](50) NULL,
	[DailyItinerary] [nvarchar](50) NULL,
	[EditImage] [nvarchar](max) NULL,
	[Location] [nvarchar](50) NULL,
	[Sights_img1] [nvarchar](max) NULL,
	[Sights_img2] [nvarchar](max) NULL,
	[Sights_img3] [nvarchar](max) NULL,
	[Sights_title] [nvarchar](max) NULL,
	[Sights_text] [nvarchar](max) NULL,
	[Journey_StaysId] [int] NULL,
	[TraveItems] [nvarchar](50) NULL,
	[MakeUpExpenses] [money] NULL,
	[Photo] [money] NULL,
	[Transportation] [money] NULL,
	[StayExpenses] [money] NULL,
	[Activity] [money] NULL,
	[CarFare] [money] NULL,
	[Food] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_Ancientcostume]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_Ancientcostume](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JourneyID] [int] NULL,
	[Hairstyle] [nvarchar](50) NULL,
	[Makeupstyle] [nvarchar](50) NULL,
	[Costumestyle] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_Contact]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](50) NOT NULL,
	[MakeupArtist] [nvarchar](50) NOT NULL,
	[Photographer] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](50) NOT NULL,
	[InstantMessage] [nvarchar](50) NOT NULL,
	[LineGroup] [nvarchar](50) NOT NULL,
	[JourneyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_costumestyle]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_costumestyle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Journey_AncientcostumeID] [int] NULL,
	[Style1] [nvarchar](max) NULL,
	[Style2] [nvarchar](max) NULL,
	[Style3] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_Grouptype]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_Grouptype](
	[Id] [int] NOT NULL,
	[JourneyID] [int] NULL,
	[Stock] [int] NULL,
	[Maxstock] [int] NULL,
	[Discount] [int] NULL,
	[Departuredate] [datetime] NULL,
	[Ruturndate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_hairstyle]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_hairstyle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Journey_AncientcostumeID] [int] NULL,
	[Style1] [nvarchar](50) NULL,
	[Style2] [nvarchar](50) NULL,
	[Style3] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_makeupstyle]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_makeupstyle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Style1] [nvarchar](50) NULL,
	[Style2] [nvarchar](50) NULL,
	[Style3] [nvarchar](50) NULL,
	[Journey_AncientcostumeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_Stays]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_Stays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StayName] [nvarchar](50) NULL,
	[StayImage] [nvarchar](max) NULL,
	[StayInfo] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Num_of_bed] [int] NULL,
	[Max_of_exlra_prople] [int] NULL,
	[Discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_Travellertype]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_Travellertype](
	[Id] [int] NOT NULL,
	[JourneyID] [int] NULL,
	[People] [int] NULL,
	[Bed_count] [int] NULL,
	[Discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NULL,
	[EmployeeID] [int] NULL,
	[Customersname] [nvarchar](50) NULL,
	[E-mail] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[TwId] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[SelectPerson] [nvarchar](50) NULL,
	[Selectfood] [nvarchar](50) NULL,
	[Selectchild] [nvarchar](50) NULL,
	[Message] [nvarchar](50) NULL,
	[JourneyId] [int] NULL,
	[JourneyName] [nvarchar](50) NULL,
	[JourneyContent] [nvarchar](max) NULL,
	[Sights] [nvarchar](50) NULL,
	[Stay] [nvarchar](50) NULL,
	[ExpenseItems] [nvarchar](50) NULL,
	[MakeUpExpenses] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Transportation] [nvarchar](50) NULL,
	[CarFare] [nvarchar](50) NULL,
	[StayExpenses] [nvarchar](50) NULL,
	[Activity] [nvarchar](50) NULL,
	[Food] [nvarchar](50) NULL,
	[AssemblyPlace] [nvarchar](50) NULL,
	[DailyItinerary] [nvarchar](50) NULL,
	[custom] [nvarchar](max) NULL,
	[makeup] [nvarchar](max) NULL,
	[hair] [nvarchar](max) NULL,
	[OrderDate] [date] NULL,
	[RequiredDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Customerinfo]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Customerinfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IDnumber] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Creditcard] [nvarchar](50) NULL,
	[People] [int] NULL,
	[Eatinghabits] [nvarchar](50) NULL,
	[OrderID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customersname] [nvarchar](50) NULL,
	[E-mail] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Paymentmethod] [nvarchar](50) NULL,
	[Deposit] [money] NULL,
	[Orderfullamount] [money] NULL,
	[Paymentdate] [datetime] NULL,
	[Servicebase] [nvarchar](50) NULL,
	[Departuredate] [datetime] NULL,
	[Returndate] [datetime] NULL,
	[Journeyname] [nvarchar](50) NULL,
	[Orderdate] [datetime] NULL,
	[Groupnumber] [nvarchar](50) NULL,
	[Orderstate] [nvarchar](50) NULL,
	[OrderID] [int] NULL,
	[JourneyID] [int] NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Statusrecord]    Script Date: 2024/7/17 下午 05:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Statusrecord](
	[Id] [int] NOT NULL,
	[Oldstatus] [int] NULL,
	[Newstatus] [int] NULL,
	[Updatetime] [datetime] NULL,
	[OrderID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Phone], [Email], [Position]) VALUES (1, N'Arrow', N'111', N'aa@gmail.com', N'boss')
INSERT [dbo].[Employees] ([Id], [Name], [Phone], [Email], [Position]) VALUES (2, N'Josie', N'000', N'bb@gmil.com', N'manager')
INSERT [dbo].[Employees] ([Id], [Name], [Phone], [Email], [Position]) VALUES (3, N'Kelly', N'222', N'cc@gmail.com', N'saleser')
INSERT [dbo].[Employees] ([Id], [Name], [Phone], [Email], [Position]) VALUES (4, N'Clara', N'333', N'dd@gmail.com', N'saleser')
INSERT [dbo].[Employees] ([Id], [Name], [Phone], [Email], [Position]) VALUES (5, N'Joanne', N'444', N'dd@gmail.com', N'saleser')
INSERT [dbo].[Employees] ([Id], [Name], [Phone], [Email], [Position]) VALUES (6, N'Nico', N'555', N'ee@gmail.com', N'makeupartist')
INSERT [dbo].[Employees] ([Id], [Name], [Phone], [Email], [Position]) VALUES (8, N'Kelly', N'666', N'ff@gmail.com', N'makeupartist')
INSERT [dbo].[Employees] ([Id], [Name], [Phone], [Email], [Position]) VALUES (9, N'Allen', N'777', N'gg@gmail.com', N'photographer')
INSERT [dbo].[Employees] ([Id], [Name], [Phone], [Email], [Position]) VALUES (10, N'Bob', N'888', N'hh@gmail.com', N'photographer')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorite] ON 

INSERT [dbo].[Favorite] ([Id], [MemberId], [JourneyId]) VALUES (1, 1, 3)
INSERT [dbo].[Favorite] ([Id], [MemberId], [JourneyId]) VALUES (3, 1, 6)
INSERT [dbo].[Favorite] ([Id], [MemberId], [JourneyId]) VALUES (4, 2, 5)
INSERT [dbo].[Favorite] ([Id], [MemberId], [JourneyId]) VALUES (5, 1, 13)
INSERT [dbo].[Favorite] ([Id], [MemberId], [JourneyId]) VALUES (6, 1, 5)
SET IDENTITY_INSERT [dbo].[Favorite] OFF
GO
SET IDENTITY_INSERT [dbo].[Journey] ON 

INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (3, N'宜蘭傳藝園區', CAST(N'2024-06-03' AS Date), N'台北車站集合 ~ 搭乘台鐵列車出發【台北-宜蘭】

10:40 抵達傳藝園區
12:00 享用在地午餐
13:30 傳藝園區探索 ~ 體驗傳統工藝、觀賞表演
14:40 國立傳統藝術中心→參觀各式展館與手工藝坊
16:20 綠色博物館 ~ 了解宜蘭的自然與人文歷史
17:00 羅東夜市 ~ 品嚐美食、感受當地熱鬧氛圍
19:00 宜蘭市區飯店 ~ 晚安






', N'園區拍照攝影', N'登義參藥行', N'煙波花時間 – 宜蘭傳藝', N's1-2.jpg', N's1-3.jpg', N's1-4.jpg', N'關於煙波
夜宿蘭陽藝城 漫遊古味巷陌
「煙波花時間 – 宜蘭傳藝」坐落於國立傳統藝術中心-宜蘭傳藝園區。以「夜宿蘭陽藝城 漫遊古味巷陌」為概念，讓旅客住得自在、玩得自由、歡聚在傳藝中心，發掘藏在日常裡的文化藝術軌跡，深度感受、傳揚台灣傳統藝術。全區客房建築出自黃聲遠建築師事務所設計，懷舊磨石地、迴廊池塘、涼亭木椅，自由穿梭濃厚閩南式建築中，彷彿穿越到舊時台灣，留下充滿濃厚文化氣息的片刻回憶。
', N'宜蘭縣五結鄉五濱路二段201號
 +886-3-9506666  rvta@lakeshore.com.tw', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'注意事項', N'台北車站', N'當日行程', N's1.jpg', N'tw', N's1-3.jpg', N's1-4.jpg', N's1-5.jpg', N'登義DengYi 來自一間創立半甲子有餘的中藥行，中藥店', N'我們認為唯有透過用心觀察與實作，去了解「漢藥」與「中藥行」在現代人生活的扮演角色，才能持續讓中藥行在當代茁壯與永續，並且走入大眾日常，讓漢藥的美能透過場域的衍繹與中藥行職人的互動，與大家一起實踐漢方生活。
我們憑著搭配過各式香料滷包、以及獨門的漢藥配方，搭配豐富的選材經驗與炮製漢藥材的專業，透過盅湯與滷味，打造充滿漢藥文化的食體驗，讓中藥行走進尋常百姓廚房！
園區位置
文昌街33號
營業時間
0900-1800', NULL, NULL, 1000.0000, 2000.0000, 1000.0000, 3000.0000, 2000.0000, 1000.0000, 2000.0000)
INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (5, N'卓也小屋渡假園區', CAST(N'2024-06-05' AS Date), N'集合地點: 台北車站
出發方式: 搭乘台鐵列車
行程: 台北 → 卓也小屋渡假園區

行程安排:

10:40 集合於台北車站，搭乘台鐵列車前往卓也小屋渡假園區
12:00 抵達卓也小屋渡假園區，享用在地午餐
13:30 探索園區內的自然步道，欣賞美麗景色
14:40 參加園區內的DIY手作活動，體驗農家樂趣
16:00 參觀傳統手工藝展區，了解地方文化
17:00 休息片刻，品嚐園區內的特色下午茶
18:30 前往住宿區，辦理入住手續
19:00 自由活動時間，可在園區內散步或參加夜間活動
21:00 回到住宿區，準備休息，晚安

在卓也小屋渡假園區度過充實的一天，感受大自然的美好與傳統文化的魅力，讓身心得到全方位的放鬆與充電。', N'園區拍照攝影', N'螢火蟲季、客家油桐花、蝴蝶季等', N'卓也小屋旅宿', N's2-2.jpg', N's2-3.jpg', N's2-4.jpg', N'VIP雙人房-感恩1', N'一杯好茶配上幾本閒書，
屋外傳來陣陣竹的呢喃。
安眠也好，挑燈夜讀也好，
皆是偷得浮生半日閒。', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'注意事項', N'台北車站', N'當日行程', N's2.jpg', N'tw', N's2-1.jpg', N's2-2.jpg', N's2-3.jpg', N'距離三義車站只要十分鐘車程的「卓也小屋」是個位於山腰上的休閒園區', N'園內除了滿山遍野的鮮花和蝴蝶外，也有提供住宿，讓身心都能在大自然中好好放鬆。
豐富多樣的藍染商品和藍染DIY工坊都充滿濃濃的客家文化，下午茶餐廳的甜點非常推薦，不輸外面的知名店面，甜點中也加入藍染的元素，門票同時還能折抵消費，選對時間還能看到螢火蟲或盛開的白色油桐花。「卓也小屋」同時也是超好拍照的地點，
可愛的小穀倉屋就像小矮人的家，連住宿的房間都很有復古的味道，雖然已經不是新景點，但還是一個放假出遊的好地點', NULL, NULL, 1000.0000, 2000.0000, 1000.0000, 3000.0000, 2000.0000, 1000.0000, 2000.0000)
INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (6, N'林本源園邸', CAST(N'2024-06-07' AS Date), N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'園區拍照攝影', N'林本源園邸', N'台北清翼居旅店', N's5.jpg', N's5.jpg', N's5.jpg', N'台北清翼居旅店是您旅遊住宿板橋的最佳選擇。結合了超值、舒適及方便性，
親子風格且同時提供旅客多樣的設備與服務。', N'台北清翼居旅店靠近數個人氣地標，例如：板橋慈惠宮 (0.4 km) 和新北市市民廣場 (0.7 km) 等，入住的旅客可方便就近參觀板橋這幾個知名景點。

台北清翼居旅店客房提供冰箱和空調設施為您的旅程增添舒適與便利。旅客還可利用免費無線網路隨時上網。

提供免費早餐的服務讓你體會美好的入住經驗。

板橋有著眾多絕佳壽司。所以當您到這裡旅遊時，要記得選擇幾家知名人氣餐廳，例如：板橋壽司、千壽司日本料理和小春日本料理以品嘗美食滿足味蕾。

在當地旅遊時，一定要撥空參觀幾個著名景點，例如：林本源園邸 (0.7 km)、板橋車站 (0.8 km) 和慈恵宮 (0.4 km) 等，皆位於汽車旅館步行範圍距離內。', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'注意事項', N'台北車站', N'當日行程', N's5.jpg', N'tw', N's5-1.jpg', N's5-1.jpg', N's5-1.jpg', N'現存超過百年的林本源園邸，為清朝時期林家的租館，
後由林國華、林國芳兩兄弟擴建，經過戰火洗禮與百年風霜，雖幾度呈現斑駁痕跡，
但在政府的修復下，再度以精雕細琢的建築形貌，帶給旅客濃濃復古情懷。', N'踏入林本源園邸，映入眼簾的是古典雅致的亭台樓閣、小橋流水，以及倒映在湖上的青青垂柳，
在喧鬧的都市中帶給旅客靜謐之感。林本源園邸分為「板橋林家花園」與「林本源宅邸」，
板橋林家花園指宅邸外的庭院，包含園區內最高且最華麗的來青閣，因從前登樓眺望時可見觀音山及大屯山，
因此取名「來青」，過去也是接待貴賓的場所；在水池中央，可賞月的月波水榭；園區內面積最大的「定靜堂」，
則為昔日林家舉辦大型宴會之地；還有多樣優美人造山水，旅客可在涼亭上觀賞湖中生態。
', NULL, NULL, 1000.0000, 2000.0000, 1000.0000, 3000.0000, 2000.0000, 1000.0000, 2000.0000)
INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (8, N'林安泰古厝', CAST(N'2024-06-10' AS Date), N'台北車站集合 ~ 搭乘台鐵列車出發【台北 - 圓山】 10:40
圓山林安泰古厝 12:00
享用在地午餐 13:30
圓山文物館、圓山大飯店 14:40
圓山美食採購 16:20
圓山夜市 17:00', N'園區拍照攝影', N'林安泰古厝', N'圓山大飯店', N's6.jpg', N's6.jpg', N's6.jpg', N'台北圓山大飯店外觀採用金色屋頂瓦片和紅色柱子的宮殿風格，提供從捷運圓山站出發的免費接駁服務，
車程約 8 分鐘。館內提供大型宴會廳和會議設施。', N'飯店距離士林夜市有 10 分鐘車程，距離台北火車站和台北松山機場有 15 分鐘車程，距離國立故宮博物館有 20 分鐘車程，距離桃園國際機場有 40 分鐘路程。附近也有 24 小時便利商店。

寬敞的客房配有空調、平面電視、電熱水壺和淋浴設施，部分客房設有私人衛浴，內附浴缸。

全館提供免費 WiFi。住客可在室外游泳池暢遊，在健身中心健身或前往桑拿區。館內亦設有設有商店、商務中心和 24 小時接待櫃台，提供免費行李寄存服務。

館內設有 4 個餐飲場所，金龍餐廳供應單點粵菜和粵式點心，圓苑餐廳則提供中國北方菜色，圓山牛排館提供乾式熟成和濕式熟成牛排、燒烤菜餚、新鮮沙拉和起士吧以及各種義式風味美食。', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'注意事項', N'台北車站', N'當日行程', N's6.jpg', N'tw', N's6-1.jpg', N's6-1.jpg', N's6-1.jpg', N'林安泰古厝，又稱榮泰厝（臺語：Îng-thài-tshù），
是位於臺灣臺北市中山區濱江公園的四合院，原於乾隆年間建在今大安區，
1978年因敦化南路拓寬而面臨拆除，引起古蹟保護運動，促進《文化資產保存法》立法，
1984年遷建後作民俗文物館之用，今列歷史建築。', N'林安泰古厝為一座中國傳統式的四合院閩式建築，建於清乾隆48年(西元1783年)，迄今已超過二百年歷史，古厝採民間地理風水之設計，建造出閩南單層二進四合院，其石材、木材多半取自原建材，在林安泰古厝前埕有月眉池，池底舖設壓船艙專用的紅普石，有防滑及防苔的功用，而古厝正屋設計有前低後高的藍尾式尾脊，冬暖夏涼且日曬通風，有著象徵步步高升的用意，整座古厝格局嚴謹、主從分明，在全宅的重心正廳內，有著雕刻精美的神龕，而門廳窗櫺亦鏤刻圖形於上，如此極為考究的建物選材與手工，
讓林安泰古厝於清朝充分展現出台灣富商家庭的排場', NULL, NULL, 1000.0000, 2000.0000, 1000.0000, 3000.0000, 2000.0000, 1000.0000, 2000.0000)
INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (9, N'至善園', CAST(N'2024-06-12' AS Date), N'【台北-至善園】
09:00 台北車站集合
09:30 搭乘台鐵列車出發
11:00 抵達至善園，探索園區
12:30 享用在地特色午餐
14:00 參觀至善園文物展示館
15:30 漫步園區，感受自然之美
17:00 享用下午茶
18:30 回程台北
20:00 抵達台北，自由活動', N'園區拍照攝影', N'至善園', N'有誠商旅', N's7.jpg', N's7.jpg', N's7.jpg', N'有誠商旅位居士林近郊的外雙溪，與文薈藝藏的故宮比鄰相居，
前有至德園、至善園、臨溪公園步道及雞南山步道，後有連緜秀麗的五指山系，
並有外雙溪流貫，窗外景觀山高水豐，層疊秀麗，
實有陶淵明之『結廬在人境、而無車馬喧』之境意。', N'有誠商旅位於台北，距離故宮博物院 600 公尺，距離芝山文化生態綠園 1.4 公里，館內附設餐廳及免費私人停車場。

每間客房均配備空調和平面電視。部分客房更享有山景或市景。房內私人衛浴設有浴缸，提供浴袍、拖鞋、免費盥洗用品和吹風機。飯店全館提供免費 WiFi。

館內設有 24 小時櫃台。', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'注意事項', N'台北車站', N'當日行程', N's7.jpg', N'tw', N's7-1.jpg', N's7-1.jpg', N's7-1.jpg', N'至善園占地五千六百八十七坪，擷取中國傳統造園經驗，構築出具有豐富文人氣息的仿古宋明庭園景緻。
有人形容中國庭園有如一首委婉迴環的詩，或一幅徐徐展開的山水長卷，在飽覽故宮文物菁華之餘，
不妨放鬆心情，徜徉於古代文人的理想世界！
', N'位於台北市士林區故宮博物院旁的至善園，佔地約五千六百八十七坪，依王羲之天下第一行書為藍本規劃，宛若博物館的庭園內院。

至善園設計藍圖為王羲之的八大勝景：蘭亭、籠鵝、曲水流觴、松風閣、水榭、碧橋西、洗筆池，及招鶴聽鶯，充分表現精緻典雅的造景藝術，和中國庭園與書香氣息暢遊一回，每每讓人發思古之幽情。', NULL, NULL, 1000.0000, 2000.0000, 1000.0000, 3000.0000, 2000.0000, 1000.0000, 2000.0000)
INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (11, N'老塘湖藝術村', CAST(N'2024-06-13' AS Date), N'高雄老塘湖藝術村一日遊行程
07:00 台北車站集合，搭乘台鐵列車出發【台北-高雄】

10:40 抵達高雄，前往老塘湖藝術村，感受藝術與自然的完美融合

12:00 享用在地午餐，品嚐高雄的美味特色菜餚

13:30 參觀藝術村內的各個展區，欣賞藝術作品，參加DIY工藝活動

14:40 探索藝術村周邊的自然景點，漫步在風景如畫的湖畔

16:20 造訪老塘湖藝術村內的古裝拍攝區，穿上古裝拍照留念

17:00 前往高雄六合夜市，品嘗當地小吃，感受夜市的熱鬧氛圍

19:00 返回高雄市區飯店，結束一天愉快的行程，晚安

讓我們一起在高雄老塘湖藝術村體驗藝術與古裝的魅力，度過難忘的一天！', N'園區拍照攝影', N'老塘湖藝術村', N'林桂園石泉會館', N's8.jpg', N's8.jpg', N's8.jpg', N'關子嶺林桂園石泉會館設有溫泉浴池，周圍綠意盎然，是個寵物友善的度假去處。度假村提供免費私人停車位，
全區均可使用免費 WiFi。', N'這間度假村距離紅葉公園僅 5 分鐘車程，距離關子嶺公車站 15～20 分鐘步行路程，距離阿里山 26 公里。

每間住宿單位均予人極簡而沉穩之感，鋪設木地板，並提供平面電視和電熱水壺。衛浴設有浴缸，備有免費盥洗用品。

住客可在美麗的花園裡與大自然親密接觸，或在公共休息區度過休閒時光。

各種餐館沿主要街道林立，只需步行 10 分鐘即可到達。', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'注意事項', N'台北車站', N'每日行程', N's8.jpg', N'tw', N's8-1.jpg', N's8-1.jpg', N's8-1.jpg', N'老塘湖藝術村佔地四公頃，原為一處私人地，地主經整理後開放給民眾參觀，
為一座用頹廢風打造成的古村莊。 藝術家匡進福（匡乙）收集30年的古建物古建材，
花了十多年，自己親手監建再造的古鎮古蹟，彷彿穿梭時光隧道回到以前五零年代的農村生活，
有仿古紅樓、茶樓、客棧...還有戶外仿江南的池塘風光，
充滿懷舊詩意，有著美麗的復古風情。', N'遊客們在老塘湖藝術村不僅能夠欣賞到獨特的藝術環境，還能夠體驗到傳統的台灣文化。例如，財神廟作為村內的一個重要景點，讓遊客能夠感受到台灣傳統信仰的深厚底蘊。園區內的消費也十分注重融入當地的特色，例如提供以古厝材料為基礎的特色商品，讓遊客可以一邊欣賞藝術，一邊感受台灣的古早味。

藝術村的大眾交通便利，讓遊客可以輕鬆到達這個充滿魅力的地方。
而船遊湖濱更是一種特有的交通方式，讓遊客可以在湖光山色中欣賞到藝術村的美景。老
塘湖藝術村不僅是一個展現藝術創作的場所，更是一個融合了歷史、文化、環保和藝術的綜合體驗。
在這裡，遊客可以感受到台灣豐富多彩的藝術風貌，同時也能夠領略到古老農村生活和現代文化的和諧交融。
老塘湖藝術村無疑是台灣藝術領域一顆璀璨的明珠，值得每位藝術愛好者前來親自體驗。', NULL, NULL, 1000.0000, 2000.0000, 1000.0000, 3000.0000, 2000.0000, 1000.0000, 2000.0000)
INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (13, N'鳳儀書院', CAST(N'2024-06-15' AS Date), N'台北車站集合~搭乘台鐵列車出發【台北-高雄】

10:40 鳳儀書院步道

12:00 享用在地午餐

13:30 鳳儀書院~書法體驗

14:40 岡山之眼→壽山動物園→高雄哈瑪星文創園區

16:20 打狗英國領事館

17:00 六合夜市

19:00 高雄市區飯店~晚安', N'園區拍照攝影', N'鳳儀書院', N'康橋商旅覺民館', N's9.jpg', N's9.jpg', N's9.jpg', N'位於高雄市區, 離國道交流道3分鐘,交通便利,離大昌路商圈、高應大商圈、澄清湖風景區皆只要10分鐘車程。
附近也有各式在地小吃店、咖啡店可供您自由選擇!', N'
友善的服務、友善的環境、友善的價格 。

康橋商旅長期以穩定優良的品質為經營理念,提供旅客 及出差客更多乾淨舒適的住宿環境。', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'注意事項', N'台北車站', N'每日行程', N's9.jpg', N'tw', N's9-1.jpg', N's9-1.jpg', N's9-1.jpg', N'位於城隍廟旁的鳳儀書院興建於1814年，於民國74年列為三級古蹟。', N'由鳳山候選訓導歲貢生張廷欽所建，當年有屋舍37間，
院內原祀文昌、奎昌、倉聖神位，並有桌椅，是古時生員求學歲試的場所，
建築細節十分講究，也是現存全臺規模最大書院，書院門廳前的照壁和正門兩旁的石鼓，
均顯示了鳳儀書院當初建築設計時的考究。在民國98年規畫整修後，的園區增設許多Q版塑像，並規畫2個展覽空間，
提供書院歷史沿革與文物擺設等詳細介紹，寓教於樂。', NULL, NULL, 1000.0000, 2000.0000, 1000.0000, 3000.0000, 2000.0000, 1000.0000, 2000.0000)
INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (15, N'橫店影視城', CAST(N'2024-06-17' AS Date), N'07:00 台北車站集合，搭乘高速列車出發【台北-橫店】
10:30 抵達橫店影視城，開啟穿越之旅
10:40 探索秦王宮，感受古代帝王風範
12:00 享用當地午餐，品味特色美食
13:30 前往明清宮苑，重現大清盛世
14:40 步入廣州街·香港街，體驗民國風情
16:00 拜訪清明上河圖，漫步古街古巷
17:00 探索華夏文化園，感受中國文化精髓
18:00 享用晚餐，品嘗地道美味
19:00 前往橫店影視城主題公園，觀賞精彩表演
21:00 返回橫店市區酒店，晚安休息', N'園區拍照攝影', N'橫店影視城', N'義烏萬豪大酒店', N's3.jpg', N's3-2.jpg', N's3-3.jpg', N'義烏萬豪飯店位於福田路，坐擁城市繁華的中央商務區CBD，鳥瞰義烏較大的濕地公園', N'距離國內4A級旅遊購物中心——國際商貿城僅咫尺之遙，距離新客運中心約5分鐘車程，驅車前往義烏機場、火車站約20分鐘，至橫店影視城約40分鐘左右車程。
飯店高聳38層，別具匠心的設計給您帶來前所未有的體驗，一切盡顯萬豪高端商務飯店卓爾不凡的尊貴品質。
飯店小憩大廳吧，周邊CBD景觀盡收眼底。都會尚膳崇尚自然，現代而頗含流行元素以及古世界地圖的設計，宛如邀您開啟環球美食之旅。在萬豪中餐廳精緻優雅的環境中演繹臻品粵菜，淮揚特色，本地美食。
飯店專業的宴會團隊，個性化的客戶關懷服務，為您打造難忘的獨特活動記憶。宴會廳配備先進視聽設備，是您大型宴會、會議等活動的理想之選。', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'注意事項', N'台北車站', N'每日行程', N's3.jpg', N'it', N's3-2.jpg', N's3-2.jpg', N's3-2.jpg', N'橫店影視城位於浙江中部東陽市境內，距杭州180公里，金華95公里，與中國小商品城義烏市相鄰，是目前中國最大的影視拍攝基地，被譽為「中國好萊塢」。', N'大多數中國的古裝影視作品都在這裡取景拍攝，如大家耳熟能詳的《英雄》、《無極》、《宮》和《步步驚心》等。在這裡不僅可以隨處碰到劇組和明星，甚至在街頭巷尾或者某個街角的餐廳裡，都有人談論拍戲或者背誦劇本。
橫店影視城其實不是一個城，而是一個鎮，由十幾個分佈在橫店鎮內外的大小景區組成，這些景點加起來統稱為橫店影視城。目前開放的景區共有九個，分佈在鎮南和鎮北兩個區域。鎮南景區主要有依據《清明上河圖》而建的清明上河圖、有恢弘壯觀的秦王宮、有適合晚上遊玩的大型遊樂場夢幻谷以及明清民居博覽城和大智禪寺。鎮北景區主要有再現了1840年至20世紀初的羊城舊貌和香江風韻的廣州街香港街、號稱1:1複製故宮的明清宮苑以及屏巖洞府和華夏文化園。
影視城內有那麼多的景區，一日游的行程可能只能看2-3個景區，如果時間充裕的話，建議住上一晚，慢慢逛，多看幾場演出，這樣才能感受到橫店真正的魅力。
一日遊行程推薦
如果你只有一天的時間，建議購買三個景點加夢幻谷的聯票，從秦王宮、清明上河圖、廣州街香港街、明清宮苑、華夏文化園、明清民居博覽城中任選3個特別感興趣的景點，一個上午遊玩，一個下午遊玩，然後晚上一定再去玩一下夢幻谷。秦王宮和明清宮苑遊覽的人會更多一些。
二日遊行程推薦
如果有兩天的時間，建議購買5個景點的聯票，最佳的遊玩路線為第一天遊玩秦王宮、清明上河圖，晚上玩夢幻谷，第二天逛逛明清宮苑和廣州街香港街。
當然如果時間更充裕的話，你還可以到屏巖洞府坐纜車，到大智禪寺拜拜佛，或到華夏文化園和明清民居博覽城遊覽一番。
娛樂
影視城內每個景區上午和下午基本上都有2場演出，你可以去秦王宮看《夢迴秦漢》，或去明清宮苑看《紫禁大典》。如果不想浪費門票，真正感受景區的魅力的話，可以上午看一場演出，下午看一場，其他時間一步一移的看看每個角落。當然，在進入每個景區門口時也不要忘記看看當天的演出時間表，有些景區需要你提前拿好門票的。此外，影視城內還有KTV、酒吧等娛樂項目，滿足你的夜生活。', NULL, NULL, 1000.0000, 2000.0000, 1000.0000, 3000.0000, 2000.0000, 1000.0000, 2000.0000)
INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (16, N'敦煌沙漠', CAST(N'2024-06-20' AS Date), N'敦煌沙漠探險一日遊行程：

07:30 台北車站集合
07:50 搭乘班機出發【台北-敦煌】
09:50 抵達敦煌機場
10:30 鳴沙山月牙泉
12:00 享用在地午餐
13:30 探索莫高窟
15:00 駱駝騎行沙漠體驗
16:30 敦煌博物館
17:30 沙洲夜市
19:00 回到酒店，晚安', N'園區拍照攝影', N'敦煌沙漠', N'敦煌鳴沙山野奢國際沙漠度假酒店', N's4-2.jpg', N's4-3.jpg', N's4-4.jpg', N'我們致力於在極境的沙漠美學裏打造舒享靜謐之地。
', N'在這裏探尋自然與心靈的聯結，領略獨特的四季光影。', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'注意事項', N'台北車站', N'每日行程', N's4.jpg', N'it', N's4-2.jpg', N's4-2.jpg', N's4-2.jpg', N'「 鳴沙山-月牙泉」風景區，位於敦煌市區以南約5公里處，來這裡，觀賞黃沙與清泉相伴為鄰的奇景、爬一爬鳴沙山、騎一騎駱駝，感受不一般的西北大漠風光。', N'遊覽景區的時間最好是下午，這樣即可以避開中午沙漠中的酷熱，還能在夕陽西下時，爬到山頂遙望遠處的沙海和山下的月牙泉。
鳴沙山的山體由流沙堆積而成，遠遠望去，沙丘高低起伏，蔚為壯觀。當遊客從山頂下滑時，就會聽到咚咚咚的響聲，似敲鑼打鼓，讓人膽戰心驚又頗感刺激，鳴沙山因此得名。月牙泉位於鳴沙山下，處在沙丘環抱之中，因為地勢的關係，颳風時沙子不往山下走，而是往山上流動，所以月牙泉永遠不會被沙子埋沒。
景區目前提供多種遊樂項目，如：騎駱駝、滑沙、滑草、沙漠摩托車、射箭等，其中騎駱駝和滑沙最受遊客歡迎。', NULL, NULL, 1000.0000, 2000.0000, 1000.0000, 3000.0000, 2000.0000, 1000.0000, 2000.0000)
INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (19, N'測試老塘湖藝術村', CAST(N'2024-07-16' AS Date), N'高雄老塘湖藝術村一日遊行程07:00 台北車站集合，搭乘台鐵列車出發【台北 - 高雄】10: 40 抵達高雄，前往老塘湖藝術村，感受藝術與自然的完美融合12:00 享用在地午餐，品嚐高雄的美味特色菜餚13: 30 參觀藝術村內的各個展區，欣賞藝術作品，參加DIY工藝活動14: 40 探索藝術村周邊的自然景點，漫步在風景如畫的湖畔16: 20 造訪老塘湖藝術村內的古裝拍攝區，穿上古裝拍照留念17:00 前往高雄六合夜市，品嘗當地小吃，感受夜市的熱鬧氛圍19:00 返回高雄市區飯店，結束一天愉快的行程，晚安讓我們一起在高雄老塘湖藝術村體驗藝術與古裝的魅力，度過難忘的一天！', NULL, N'老塘湖藝術村', N'林桂園石泉會館', N'teststay1.jpg', N'teststay2.jpg', N'teststay3.jpg', N'關子嶺林桂園石泉會館設有溫泉浴池，周圍綠意盎然，是個寵物友善的度假去處。度假村提供免費私人停車位，全區均可使用免費 WiFi。', N'這間度假村距離紅葉公園僅 5 分鐘車程，距離關子嶺公車站 15～20 分鐘步行路程，距離阿里山 26 公里。每間住宿單位均予人極簡而沉穩之感，鋪設木地板，並提供平面電視和電熱水壺。衛浴設有浴缸，備有免費盥洗用品。住客可在美麗的花園裡與大自然親密接觸，或在公共休息區度過休閒時光。各種餐館沿主要街道林立，只需步行 10 分鐘即可到達。', N'化妝、攝影拍照、運輸、住宿、活動、車資、食物', N'注意事項', N'台北車站', N'每日行程', N'testsight0.jpg', N'tw', N'testsight1.jpg', N'testsight2.jpg', N'testsight3.jpg', N'老塘湖藝術村佔地四公頃，原為一處私人地，地主經整理後開放給民眾參觀，為一座用頹廢風打造成的古村莊。 藝術家匡進福（匡乙）收集30年的古建物古建材，花了十多年，自己親手監建再造的古鎮古蹟，彷彿穿梭時光隧道回到以前五零年代的農村生活，有仿古紅樓、茶樓、客棧...還有戶外仿江南的池塘風光，充滿懷舊詩意，有著美麗的復古風情。', N'遊客們在老塘湖藝術村不僅能夠欣賞到獨特的藝術環境，還能夠體驗到傳統的台灣文化。例如，財神廟作為村內的一個重要景點，讓遊客能夠感受到台灣傳統信仰的深厚底蘊。園區內的消費也十分注重融入當地的特色，例如提供以古厝材料為基礎的特色商品，讓遊客可以一邊欣賞藝術，一邊感受台灣的古早味。藝術村的大眾交通便利，讓遊客可以輕鬆到達這個充滿魅力的地方。而船遊湖濱更是一種特有的交通方式，讓遊客可以在湖光山色中欣賞到藝術村的美景。老塘湖藝術村不僅是一個展現藝術創作的場所，更是一個融合了歷史、文化、環保和藝術的綜合體驗。 在這裡，遊客可以感受到台灣豐富多彩的藝術風貌，同時也能夠領略到古老農村生活和現代文化的和諧交融。 老塘湖藝術村無疑是台灣藝術領域一顆璀璨的明珠，值得每位藝術愛好者前來親自體驗。', NULL, NULL, 1000.0000, 2000.0000, 1000.0000, 3000.0000, 3000.0000, 1000.0000, 3000.0000)
INSERT [dbo].[Journey] ([Id], [JourneyName], [JourneyDate], [JourneyContent], [JourneyShort], [Sights], [Stay], [Stay_img1], [Stay_img2], [Stay_img3], [Stay_title], [Stay_text], [ExpenseItems], [Remarks], [AssemblyPlace], [DailyItinerary], [EditImage], [Location], [Sights_img1], [Sights_img2], [Sights_img3], [Sights_title], [Sights_text], [Journey_StaysId], [TraveItems], [MakeUpExpenses], [Photo], [Transportation], [StayExpenses], [Activity], [CarFare], [Food]) VALUES (22, N'修改老塘湖藝術村', CAST(N'2024-07-17' AS Date), N'高雄老塘湖藝術村一日遊行程07:00 台北車站集合，搭乘台鐵列車出發【台北 - 高雄】10: 40 抵達高雄，前往老塘湖藝術村，感受藝術與自然的完美融合12:00 享用在地午餐，品嚐高雄的美味特色菜餚13: 30 參觀藝術村內的各個展區，欣賞藝術作品，參加DIY工藝活動14: 40 探索藝術村周邊的自然景點，漫步在風景如畫的湖畔16: 20 造訪老塘湖藝術村內的古裝拍攝區，穿上古裝拍照留念17:00 前往高雄六合夜市，品嘗當地小吃，感受夜市的熱鬧氛圍19:00 返回高雄市區飯店，結束一天愉快的行程，晚安讓我們一起在高雄老塘湖藝術村體驗藝術與古裝的魅力，度過難忘的一天！', NULL, N'老塘湖藝術村', N'林桂園石泉會館', N'edit1.jpg', N'edit2.jpg', N'edit3.jpg', N'關子嶺林桂園石泉會館設有溫泉浴池，周圍綠意盎然，是個寵物友善的度假去處。度假村提供免費私人停車位，全區均可使用免費 WiFi。', N'這間度假村距離紅葉公園僅 5 分鐘車程，距離關子嶺公車站 15～20 分鐘步行路程，距離阿里山 26 公里。每間住宿單位均予人極簡而沉穩之感，鋪設木地板，並提供平面電視和電熱水壺。衛浴設有浴缸，備有免費盥洗用品。住客可在美麗的花園裡與大自然親密接觸，或在公共休息區度過休閒時光。各種餐館沿主要街道林立，只需步行 10 分鐘即可到達。', N'化妝、攝影拍照、運輸、住宿、活動、車資、食物', N'注意事項', N'台北車站', N'每日行程', N'edit4.jpg', N'tw', N'edit5.jpg', N'edit6.jpg', N'edit7.jpg', N'老塘湖藝術村佔地四公頃，原為一處私人地，地主經整理後開放給民眾參觀，為一座用頹廢風打造成的古村莊。 藝術家匡進福（匡乙）收集30年的古建物古建材，花了十多年，自己親手監建再造的古鎮古蹟，彷彿穿梭時光隧道回到以前五零年代的農村生活，有仿古紅樓、茶樓、客棧...還有戶外仿江南的池塘風光，充滿懷舊詩意，有著美麗的復古風情。', N'遊客們在老塘湖藝術村不僅能夠欣賞到獨特的藝術環境，還能夠體驗到傳統的台灣文化。例如，財神廟作為村內的一個重要景點，讓遊客能夠感受到台灣傳統信仰的深厚底蘊。園區內的消費也十分注重融入當地的特色，例如提供以古厝材料為基礎的特色商品，讓遊客可以一邊欣賞藝術，一邊感受台灣的古早味。藝術村的大眾交通便利，讓遊客可以輕鬆到達這個充滿魅力的地方。而船遊湖濱更是一種特有的交通方式，讓遊客可以在湖光山色中欣賞到藝術村的美景。老塘湖藝術村不僅是一個展現藝術創作的場所，更是一個融合了歷史、文化、環保和藝術的綜合體驗。 在這裡，遊客可以感受到台灣豐富多彩的藝術風貌，同時也能夠領略到古老農村生活和現代文化的和諧交融。 老塘湖藝術村無疑是台灣藝術領域一顆璀璨的明珠，值得每位藝術愛好者前來親自體驗。', NULL, NULL, 3000.0000, 2000.0000, 1000.0000, 3000.0000, 3000.0000, 1000.0000, 1000.0000)
SET IDENTITY_INSERT [dbo].[Journey] OFF
GO
SET IDENTITY_INSERT [dbo].[Journey_Ancientcostume] ON 

INSERT [dbo].[Journey_Ancientcostume] ([Id], [JourneyID], [Hairstyle], [Makeupstyle], [Costumestyle]) VALUES (1, NULL, N'1', N'1', N'1')
INSERT [dbo].[Journey_Ancientcostume] ([Id], [JourneyID], [Hairstyle], [Makeupstyle], [Costumestyle]) VALUES (2, NULL, N'2', N'2', N'2')
INSERT [dbo].[Journey_Ancientcostume] ([Id], [JourneyID], [Hairstyle], [Makeupstyle], [Costumestyle]) VALUES (3, NULL, N'3', N'3', N'3')
SET IDENTITY_INSERT [dbo].[Journey_Ancientcostume] OFF
GO
SET IDENTITY_INSERT [dbo].[Journey_Contact] ON 

INSERT [dbo].[Journey_Contact] ([Id], [Customer], [MakeupArtist], [Photographer], [Contact], [Message], [InstantMessage], [LineGroup], [JourneyID]) VALUES (1, N'陳小姐', N'Nico、Kelly', N'Allen、Bob', N'2024/6/3 化妝、拍照、錄影', N'提醒事項', N'討論事項', N'Line群組', NULL)
INSERT [dbo].[Journey_Contact] ([Id], [Customer], [MakeupArtist], [Photographer], [Contact], [Message], [InstantMessage], [LineGroup], [JourneyID]) VALUES (3, N'劉先生', N'Nico、Kelly', N'Allen', N'聯絡事項', N'提醒事項', N'討論事項', N'Line', NULL)
SET IDENTITY_INSERT [dbo].[Journey_Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Journey_costumestyle] ON 

INSERT [dbo].[Journey_costumestyle] ([Id], [Journey_AncientcostumeID], [Style1], [Style2], [Style3]) VALUES (1, NULL, N'costume_woman1', N'costume_woman2', N'costume_woman3')
INSERT [dbo].[Journey_costumestyle] ([Id], [Journey_AncientcostumeID], [Style1], [Style2], [Style3]) VALUES (2, NULL, N'costume_man1', N'costume_man2', N'costume_man3')
SET IDENTITY_INSERT [dbo].[Journey_costumestyle] OFF
GO
SET IDENTITY_INSERT [dbo].[Journey_hairstyle] ON 

INSERT [dbo].[Journey_hairstyle] ([Id], [Journey_AncientcostumeID], [Style1], [Style2], [Style3]) VALUES (1, NULL, N'hair_woman1.jpg', N'hair_woman2.jpg', N'hair_woman3.jpg')
INSERT [dbo].[Journey_hairstyle] ([Id], [Journey_AncientcostumeID], [Style1], [Style2], [Style3]) VALUES (2, NULL, N'hair_man1.jpg', N'hair_man2.jpg', N'hair_man3.jpg')
SET IDENTITY_INSERT [dbo].[Journey_hairstyle] OFF
GO
SET IDENTITY_INSERT [dbo].[Journey_makeupstyle] ON 

INSERT [dbo].[Journey_makeupstyle] ([Id], [Style1], [Style2], [Style3], [Journey_AncientcostumeID]) VALUES (1, N'makeup_woman1.jpg', N'makeup_woman2.jpg', N'makeup_woman3.jpg', NULL)
INSERT [dbo].[Journey_makeupstyle] ([Id], [Style1], [Style2], [Style3], [Journey_AncientcostumeID]) VALUES (2, N'makeup_man1.jpg', N'makeup_man2.jpg', N'makeup_man3.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Journey_makeupstyle] OFF
GO
SET IDENTITY_INSERT [dbo].[Journey_Stays] ON 

INSERT [dbo].[Journey_Stays] ([Id], [StayName], [StayImage], [StayInfo], [Type], [Num_of_bed], [Max_of_exlra_prople], [Discount]) VALUES (2, N'煙波花時間 – 宜蘭傳藝', N's1-3.jpg', N'「煙波花時間 – 宜蘭傳藝」坐落於國立傳統藝術中心-宜蘭傳藝園區。', NULL, NULL, NULL, NULL)
INSERT [dbo].[Journey_Stays] ([Id], [StayName], [StayImage], [StayInfo], [Type], [Num_of_bed], [Max_of_exlra_prople], [Discount]) VALUES (4, N'卓也小屋旅宿', N's2-2.jpg', N'穿過掛著大燈籠的竹門即進入宛如一舊時落的卓也園區三義民宿', NULL, NULL, NULL, NULL)
INSERT [dbo].[Journey_Stays] ([Id], [StayName], [StayImage], [StayInfo], [Type], [Num_of_bed], [Max_of_exlra_prople], [Discount]) VALUES (5, N'台北清翼居旅店', N's5.jpg', N'在當地旅遊時，一定要撥空參觀幾個著名景點，例如：林本源園邸', NULL, NULL, NULL, NULL)
INSERT [dbo].[Journey_Stays] ([Id], [StayName], [StayImage], [StayInfo], [Type], [Num_of_bed], [Max_of_exlra_prople], [Discount]) VALUES (6, N'圓山大飯店', N's6.jpg', N'中山區也是著名特色建築物五福財神爺廟的所在地，而且位於圓山大飯店附近。', NULL, NULL, NULL, NULL)
INSERT [dbo].[Journey_Stays] ([Id], [StayName], [StayImage], [StayInfo], [Type], [Num_of_bed], [Max_of_exlra_prople], [Discount]) VALUES (8, N'有誠商旅', N's7.jpg', N'有誠商旅的地理位置讓體驗士林幾個絕佳景點更加方便。例如：草山玉溪園，是一受歡迎的美術館。', NULL, NULL, NULL, NULL)
INSERT [dbo].[Journey_Stays] ([Id], [StayName], [StayImage], [StayInfo], [Type], [Num_of_bed], [Max_of_exlra_prople], [Discount]) VALUES (9, N'林桂園石泉會館', N's8.jpg', N'關子嶺林桂園石泉會館 讓你倘徉桂花飄香處', NULL, NULL, NULL, NULL)
INSERT [dbo].[Journey_Stays] ([Id], [StayName], [StayImage], [StayInfo], [Type], [Num_of_bed], [Max_of_exlra_prople], [Discount]) VALUES (10, N'康橋商旅覺民館', N's9.jpg', N'康橋商旅長期以穩定優良的品質為經營理念,提供旅客 及出差客更多乾淨舒適的住宿環境', NULL, NULL, NULL, NULL)
INSERT [dbo].[Journey_Stays] ([Id], [StayName], [StayImage], [StayInfo], [Type], [Num_of_bed], [Max_of_exlra_prople], [Discount]) VALUES (11, N'義烏萬豪大酒店', N's3.jpg', N'義烏萬豪飯店位於福田路，坐擁城市繁華的中央商務區CBD，鳥瞰義烏較大的濕地公園', NULL, NULL, NULL, NULL)
INSERT [dbo].[Journey_Stays] ([Id], [StayName], [StayImage], [StayInfo], [Type], [Num_of_bed], [Max_of_exlra_prople], [Discount]) VALUES (12, N'敦煌鳴沙山野奢國際沙漠度假酒店', N's4-2.jpg', N'我們致力於在極境的沙漠美學裏打造舒享靜謐之地。
在這裏探尋自然與心靈的聯結，領略獨特的四季光影。', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Journey_Stays] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (1, N'Arrow', N'00000', N'0912333333', N'sara15560132@gmail.com')
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (2, N'Kelly', N'11111', N'0912444444', N'ccc@gmail.com')
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (3, N'Mary', N'22222', NULL, NULL)
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (4, N'Mark', N'33333', NULL, NULL)
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (5, N'Karen', N'44444', NULL, NULL)
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (6, N'Joanne', N'55555', NULL, NULL)
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (7, N'tony', N'66666', N'0912345678', N'aaa@gmail.com')
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (8, N'bob', N'77777', N'0912345678', N'aaa@gmail.com')
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (9, N'mary2', N'88888', N'0912345678', N'aaa@gmail.com')
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (10, N'Lala', N'99999', N'0912999999', N'lala@gmail.com')
INSERT [dbo].[Members] ([Id], [UserName], [Password], [Phone], [Email]) VALUES (11, N'jacky', N'12345', N'0912345678', N'sara15560132@gmail.com')
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (49, 1, NULL, N'Joy', NULL, N'09123456789', N'F123456789', N'test', N'1', N'不限', N'0', N'123', 3, N'宜蘭傳藝園區', N'在傳藝園區搭乘遊船並漢茶體驗，參觀登義參藥行', N'登義參藥行', N'煙波花時間 – 宜蘭傳藝', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'costume_woman3', N'makeup_woman3', N'hair_woman3', CAST(N'2024-07-04' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (52, 2, NULL, N'kelly', NULL, N'09123456789', N'F123456789', N'test', N'2', N'不吃羊', N'1', N'123', 6, N'林本源園邸', N'在林本源園邸，園區拍照攝影', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'costume_woman3', N'makeup_woman3', N'hair_woman3', CAST(N'2024-07-06' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (53, 2, NULL, N'kelly', NULL, N'', N'F123456789', N'test', N'1', N'不吃羊', N'2', N'123', 11, N'老塘湖藝術村', N'在老塘湖藝術村，園區拍照攝影', N'老塘湖藝術村', N'林桂園石泉會館', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'每日行程', N'costume_woman3', N'makeup_woman3', N'hair_woman3', CAST(N'2024-07-06' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (54, 1, NULL, N'Joy', NULL, N'09123456789', N'F123456789', N'test', N'1', N'不限', N'0', N'fv', 3, N'宜蘭傳藝園區', N'在傳藝園區搭乘遊船並漢茶體驗，參觀登義參藥行', N'登義參藥行', N'煙波花時間 – 宜蘭傳藝', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'costume_woman1', N'makeup_woman2', N'hair_woman2', CAST(N'2024-07-06' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (55, 1, NULL, N'111', NULL, N'12111', N'11111', N'11111', N'1', N'不限', N'0', N'123123', 3, N'宜蘭傳藝園區', N'在傳藝園區搭乘遊船並漢茶體驗，參觀登義參藥行', N'登義參藥行', N'煙波花時間 – 宜蘭傳藝', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'costume_woman3', N'makeup_woman3', N'hair_woman1', CAST(N'2024-07-07' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (56, 1, NULL, N'Arrow', NULL, N'0912345678', N'F123456789', N'test', N'1', N'不限', N'0', N'', 5, N'卓也小屋渡假園區', N'在卓也小屋渡假園區，體驗藍染DIY', N'螢火蟲季、客家油桐花、蝴蝶季等', N'卓也小屋旅宿', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-14' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (57, 1, NULL, N'Josie', NULL, N'0912345678', N'F123456789', N'test', N'1', N'不限', N'0', N'test', 6, N'林本源園邸', N'在林本源園邸，園區拍照攝影', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-14' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (58, 1, NULL, N'Joy', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'2', N'123', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', NULL, NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (59, 1, NULL, N'kelly', NULL, N'0912333333', N'', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'提前抵達', 9, N'至善園', N'【台北-至善園】
09:00 台北車站集合
09:30 搭乘台鐵列車出發
11:00 抵達至善園，探索園區
12:30 享用在地特色午餐
14:00 參觀至善園文物展示館
15:30 漫步園區，感受自然之美
17:00 享用下午茶
18:30 回程台北
20:00 抵達台北，自由活動', N'至善園', N'有誠商旅', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'costume_woman3', N'makeup_woman3', N'hair_woman3', NULL, NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (60, 1, NULL, N'kelly', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'13點抵達', 8, N'林安泰古厝', N'台北車站集合 ~ 搭乘台鐵列車出發【台北 - 圓山】 10:40
圓山林安泰古厝 12:00
享用在地午餐 13:30
圓山文物館、圓山大飯店 14:40
圓山美食採購 16:20
圓山夜市 17:00', N'林安泰古厝', N'圓山大飯店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'costume_woman1', N'makeup_woman1', N'hair_woman1', NULL, NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (61, 1, NULL, N'kelly', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'2', N'13點抵達', 13, N'鳳儀書院', N'台北車站集合~搭乘台鐵列車出發【台北-高雄】

10:40 鳳儀書院步道

12:00 享用在地午餐

13:30 鳳儀書院~書法體驗

14:40 岡山之眼→壽山動物園→高雄哈瑪星文創園區

16:20 打狗英國領事館

17:00 六合夜市

19:00 高雄市區飯店~晚安', N'鳳儀書院', N'康橋商旅覺民館', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'每日行程', N'costume_woman1', N'makeup_woman1', N'hair_woman1', NULL, NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (62, 1, NULL, N'tony', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'', 11, N'老塘湖藝術村', N'高雄老塘湖藝術村一日遊行程
07:00 台北車站集合，搭乘台鐵列車出發【台北-高雄】

10:40 抵達高雄，前往老塘湖藝術村，感受藝術與自然的完美融合

12:00 享用在地午餐，品嚐高雄的美味特色菜餚

13:30 參觀藝術村內的各個展區，欣賞藝術作品，參加DIY工藝活動

14:40 探索藝術村周邊的自然景點，漫步在風景如畫的湖畔

16:20 造訪老塘湖藝術村內的古裝拍攝區，穿上古裝拍照留念

17:00 前往高雄六合夜市，品嘗當地小吃，感受夜市的熱鬧氛圍

19:00 返回高雄市區飯店，結束一天愉快的行程，晚安

讓我們一起在高雄老塘湖藝術村體驗藝術與古裝的魅力，度過難忘的一天！', N'老塘湖藝術村', N'林桂園石泉會館', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'每日行程', N'無', N'無', N'無', CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (63, 1, NULL, N'kelly', NULL, N'', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'', 9, N'至善園', N'【台北-至善園】
09:00 台北車站集合
09:30 搭乘台鐵列車出發
11:00 抵達至善園，探索園區
12:30 享用在地特色午餐
14:00 參觀至善園文物展示館
15:30 漫步園區，感受自然之美
17:00 享用下午茶
18:30 回程台北
20:00 抵達台北，自由活動', N'至善園', N'有誠商旅', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (64, 1, NULL, N'Joy', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (65, 1, NULL, N'Joy', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (66, 1, NULL, N'Joy', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'', 11, N'老塘湖藝術村', N'高雄老塘湖藝術村一日遊行程
07:00 台北車站集合，搭乘台鐵列車出發【台北-高雄】

10:40 抵達高雄，前往老塘湖藝術村，感受藝術與自然的完美融合

12:00 享用在地午餐，品嚐高雄的美味特色菜餚

13:30 參觀藝術村內的各個展區，欣賞藝術作品，參加DIY工藝活動

14:40 探索藝術村周邊的自然景點，漫步在風景如畫的湖畔

16:20 造訪老塘湖藝術村內的古裝拍攝區，穿上古裝拍照留念

17:00 前往高雄六合夜市，品嘗當地小吃，感受夜市的熱鬧氛圍

19:00 返回高雄市區飯店，結束一天愉快的行程，晚安

讓我們一起在高雄老塘湖藝術村體驗藝術與古裝的魅力，度過難忘的一天！', N'老塘湖藝術村', N'林桂園石泉會館', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'每日行程', N'無', N'無', N'無', CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (67, 1, NULL, N'Joy', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (68, 1, NULL, N'Joy', NULL, N'', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'', 11, N'老塘湖藝術村', N'高雄老塘湖藝術村一日遊行程
07:00 台北車站集合，搭乘台鐵列車出發【台北-高雄】

10:40 抵達高雄，前往老塘湖藝術村，感受藝術與自然的完美融合

12:00 享用在地午餐，品嚐高雄的美味特色菜餚

13:30 參觀藝術村內的各個展區，欣賞藝術作品，參加DIY工藝活動

14:40 探索藝術村周邊的自然景點，漫步在風景如畫的湖畔

16:20 造訪老塘湖藝術村內的古裝拍攝區，穿上古裝拍照留念

17:00 前往高雄六合夜市，品嘗當地小吃，感受夜市的熱鬧氛圍

19:00 返回高雄市區飯店，結束一天愉快的行程，晚安

讓我們一起在高雄老塘湖藝術村體驗藝術與古裝的魅力，度過難忘的一天！', N'老塘湖藝術村', N'林桂園石泉會館', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'每日行程', N'無', N'無', N'無', CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (69, 1, NULL, N'Joy', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'', 13, N'鳳儀書院', N'台北車站集合~搭乘台鐵列車出發【台北-高雄】

10:40 鳳儀書院步道

12:00 享用在地午餐

13:30 鳳儀書院~書法體驗

14:40 岡山之眼→壽山動物園→高雄哈瑪星文創園區

16:20 打狗英國領事館

17:00 六合夜市

19:00 高雄市區飯店~晚安', N'鳳儀書院', N'康橋商旅覺民館', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'每日行程', N'無', N'無', N'無', CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (70, 1, NULL, N'Joy', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'0', N'', 20, N'老塘湖藝術村', N'高雄老塘湖藝術村一日遊行程07:00 台北車站集合，搭乘台鐵列車出發【台北 - 高雄】10: 40 抵達高雄，前往老塘湖藝術村，感受藝術與自然的完美融合12:00 享用在地午餐，品嚐高雄的美味特色菜餚13: 30 參觀藝術村內的各個展區，欣賞藝術作品，參加DIY工藝活動14: 40 探索藝術村周邊的自然景點，漫步在風景如畫的湖畔16: 20 造訪老塘湖藝術村內的古裝拍攝區，穿上古裝拍照留念17:00 前往高雄六合夜市，品嘗當地小吃，感受夜市的熱鬧氛圍19:00 返回高雄市區飯店，結束一天愉快的行程，晚安讓我們一起在高雄老塘湖藝術村體驗藝術與古裝的魅力，度過難忘的一天！', N'老塘湖藝術村', N'林桂園石泉會館', N'化妝、攝影拍照、運輸、住宿、活動、車資、食物', N'3000', N'2000', N'1000', N'1000', N'3000', N'3000', N'1000', N'台北車站', NULL, N'無', N'無', N'無', CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (71, 1, NULL, N'kelly', NULL, N'0912333333', N'F123456789', N'台北市松山區復興北路99號14樓', N'1', N'不限', N'3', N'提前抵達', 3, N'宜蘭傳藝園區', N'台北車站集合 ~ 搭乘台鐵列車出發【台北-宜蘭】

10:40 抵達傳藝園區
12:00 享用在地午餐
13:30 傳藝園區探索 ~ 體驗傳統工藝、觀賞表演
14:40 國立傳統藝術中心→參觀各式展館與手工藝坊
16:20 綠色博物館 ~ 了解宜蘭的自然與人文歷史
17:00 羅東夜市 ~ 品嚐美食、感受當地熱鬧氛圍
19:00 宜蘭市區飯店 ~ 晚安






', N'登義參藥行', N'煙波花時間 – 宜蘭傳藝', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-16' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (72, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (73, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 11, N'老塘湖藝術村', N'高雄老塘湖藝術村一日遊行程
07:00 台北車站集合，搭乘台鐵列車出發【台北-高雄】

10:40 抵達高雄，前往老塘湖藝術村，感受藝術與自然的完美融合

12:00 享用在地午餐，品嚐高雄的美味特色菜餚

13:30 參觀藝術村內的各個展區，欣賞藝術作品，參加DIY工藝活動

14:40 探索藝術村周邊的自然景點，漫步在風景如畫的湖畔

16:20 造訪老塘湖藝術村內的古裝拍攝區，穿上古裝拍照留念

17:00 前往高雄六合夜市，品嘗當地小吃，感受夜市的熱鬧氛圍

19:00 返回高雄市區飯店，結束一天愉快的行程，晚安

讓我們一起在高雄老塘湖藝術村體驗藝術與古裝的魅力，度過難忘的一天！', N'老塘湖藝術村', N'林桂園石泉會館', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'每日行程', N'costume_man1', N'makeup_man1', N'hair_man1', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (74, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 5, N'卓也小屋渡假園區', N'集合地點: 台北車站
出發方式: 搭乘台鐵列車
行程: 台北 → 卓也小屋渡假園區

行程安排:

10:40 集合於台北車站，搭乘台鐵列車前往卓也小屋渡假園區
12:00 抵達卓也小屋渡假園區，享用在地午餐
13:30 探索園區內的自然步道，欣賞美麗景色
14:40 參加園區內的DIY手作活動，體驗農家樂趣
16:00 參觀傳統手工藝展區，了解地方文化
17:00 休息片刻，品嚐園區內的特色下午茶
18:30 前往住宿區，辦理入住手續
19:00 自由活動時間，可在園區內散步或參加夜間活動
21:00 回到住宿區，準備休息，晚安

在卓也小屋渡假園區度過充實的一天，感受大自然的美好與傳統文化的魅力，讓身心得到全方位的放鬆與充電。', N'螢火蟲季、客家油桐花、蝴蝶季等', N'卓也小屋旅宿', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'costume_woman3', N'makeup_woman3', N'hair_woman3', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (75, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 11, N'老塘湖藝術村', N'高雄老塘湖藝術村一日遊行程
07:00 台北車站集合，搭乘台鐵列車出發【台北-高雄】

10:40 抵達高雄，前往老塘湖藝術村，感受藝術與自然的完美融合

12:00 享用在地午餐，品嚐高雄的美味特色菜餚

13:30 參觀藝術村內的各個展區，欣賞藝術作品，參加DIY工藝活動

14:40 探索藝術村周邊的自然景點，漫步在風景如畫的湖畔

16:20 造訪老塘湖藝術村內的古裝拍攝區，穿上古裝拍照留念

17:00 前往高雄六合夜市，品嘗當地小吃，感受夜市的熱鬧氛圍

19:00 返回高雄市區飯店，結束一天愉快的行程，晚安

讓我們一起在高雄老塘湖藝術村體驗藝術與古裝的魅力，度過難忘的一天！', N'老塘湖藝術村', N'林桂園石泉會館', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'每日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (76, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (77, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (78, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 3, N'宜蘭傳藝園區', N'台北車站集合 ~ 搭乘台鐵列車出發【台北-宜蘭】

10:40 抵達傳藝園區
12:00 享用在地午餐
13:30 傳藝園區探索 ~ 體驗傳統工藝、觀賞表演
14:40 國立傳統藝術中心→參觀各式展館與手工藝坊
16:20 綠色博物館 ~ 了解宜蘭的自然與人文歷史
17:00 羅東夜市 ~ 品嚐美食、感受當地熱鬧氛圍
19:00 宜蘭市區飯店 ~ 晚安






', N'登義參藥行', N'煙波花時間 – 宜蘭傳藝', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (79, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 5, N'卓也小屋渡假園區', N'集合地點: 台北車站
出發方式: 搭乘台鐵列車
行程: 台北 → 卓也小屋渡假園區

行程安排:

10:40 集合於台北車站，搭乘台鐵列車前往卓也小屋渡假園區
12:00 抵達卓也小屋渡假園區，享用在地午餐
13:30 探索園區內的自然步道，欣賞美麗景色
14:40 參加園區內的DIY手作活動，體驗農家樂趣
16:00 參觀傳統手工藝展區，了解地方文化
17:00 休息片刻，品嚐園區內的特色下午茶
18:30 前往住宿區，辦理入住手續
19:00 自由活動時間，可在園區內散步或參加夜間活動
21:00 回到住宿區，準備休息，晚安

在卓也小屋渡假園區度過充實的一天，感受大自然的美好與傳統文化的魅力，讓身心得到全方位的放鬆與充電。', N'螢火蟲季、客家油桐花、蝴蝶季等', N'卓也小屋旅宿', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (80, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 5, N'卓也小屋渡假園區', N'集合地點: 台北車站
出發方式: 搭乘台鐵列車
行程: 台北 → 卓也小屋渡假園區

行程安排:

10:40 集合於台北車站，搭乘台鐵列車前往卓也小屋渡假園區
12:00 抵達卓也小屋渡假園區，享用在地午餐
13:30 探索園區內的自然步道，欣賞美麗景色
14:40 參加園區內的DIY手作活動，體驗農家樂趣
16:00 參觀傳統手工藝展區，了解地方文化
17:00 休息片刻，品嚐園區內的特色下午茶
18:30 前往住宿區，辦理入住手續
19:00 自由活動時間，可在園區內散步或參加夜間活動
21:00 回到住宿區，準備休息，晚安

在卓也小屋渡假園區度過充實的一天，感受大自然的美好與傳統文化的魅力，讓身心得到全方位的放鬆與充電。', N'螢火蟲季、客家油桐花、蝴蝶季等', N'卓也小屋旅宿', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (81, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 13, N'鳳儀書院', N'台北車站集合~搭乘台鐵列車出發【台北-高雄】

10:40 鳳儀書院步道

12:00 享用在地午餐

13:30 鳳儀書院~書法體驗

14:40 岡山之眼→壽山動物園→高雄哈瑪星文創園區

16:20 打狗英國領事館

17:00 六合夜市

19:00 高雄市區飯店~晚安', N'鳳儀書院', N'康橋商旅覺民館', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'每日行程', N'costume_woman1', N'makeup_woman2', N'hair_woman1', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (82, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 3, N'宜蘭傳藝園區', N'台北車站集合 ~ 搭乘台鐵列車出發【台北-宜蘭】

10:40 抵達傳藝園區
12:00 享用在地午餐
13:30 傳藝園區探索 ~ 體驗傳統工藝、觀賞表演
14:40 國立傳統藝術中心→參觀各式展館與手工藝坊
16:20 綠色博物館 ~ 了解宜蘭的自然與人文歷史
17:00 羅東夜市 ~ 品嚐美食、感受當地熱鬧氛圍
19:00 宜蘭市區飯店 ~ 晚安






', N'登義參藥行', N'煙波花時間 – 宜蘭傳藝', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'costume_man1', N'makeup_man1', N'hair_man1', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (83, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (84, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (85, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (86, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (87, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (88, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (89, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (90, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 5, N'卓也小屋渡假園區', N'集合地點: 台北車站
出發方式: 搭乘台鐵列車
行程: 台北 → 卓也小屋渡假園區

行程安排:

10:40 集合於台北車站，搭乘台鐵列車前往卓也小屋渡假園區
12:00 抵達卓也小屋渡假園區，享用在地午餐
13:30 探索園區內的自然步道，欣賞美麗景色
14:40 參加園區內的DIY手作活動，體驗農家樂趣
16:00 參觀傳統手工藝展區，了解地方文化
17:00 休息片刻，品嚐園區內的特色下午茶
18:30 前往住宿區，辦理入住手續
19:00 自由活動時間，可在園區內散步或參加夜間活動
21:00 回到住宿區，準備休息，晚安

在卓也小屋渡假園區度過充實的一天，感受大自然的美好與傳統文化的魅力，讓身心得到全方位的放鬆與充電。', N'螢火蟲季、客家油桐花、蝴蝶季等', N'卓也小屋旅宿', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (91, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 3, N'宜蘭傳藝園區', N'台北車站集合 ~ 搭乘台鐵列車出發【台北-宜蘭】

10:40 抵達傳藝園區
12:00 享用在地午餐
13:30 傳藝園區探索 ~ 體驗傳統工藝、觀賞表演
14:40 國立傳統藝術中心→參觀各式展館與手工藝坊
16:20 綠色博物館 ~ 了解宜蘭的自然與人文歷史
17:00 羅東夜市 ~ 品嚐美食、感受當地熱鬧氛圍
19:00 宜蘭市區飯店 ~ 晚安






', N'登義參藥行', N'煙波花時間 – 宜蘭傳藝', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (92, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 9, N'至善園', N'【台北-至善園】
09:00 台北車站集合
09:30 搭乘台鐵列車出發
11:00 抵達至善園，探索園區
12:30 享用在地特色午餐
14:00 參觀至善園文物展示館
15:30 漫步園區，感受自然之美
17:00 享用下午茶
18:30 回程台北
20:00 抵達台北，自由活動', N'至善園', N'有誠商旅', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (93, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'costume_man1', N'makeup_man1', N'hair_man1', CAST(N'2024-07-17' AS Date), NULL)
INSERT [dbo].[Order] ([Id], [MemberID], [EmployeeID], [Customersname], [E-mail], [Phone], [TwId], [Address], [SelectPerson], [Selectfood], [Selectchild], [Message], [JourneyId], [JourneyName], [JourneyContent], [Sights], [Stay], [ExpenseItems], [MakeUpExpenses], [Photo], [Transportation], [CarFare], [StayExpenses], [Activity], [Food], [AssemblyPlace], [DailyItinerary], [custom], [makeup], [hair], [OrderDate], [RequiredDate]) VALUES (94, 1, NULL, N'周潤發', NULL, N'0912345678', N'F123456789', N'台北市松山區復興北路99號14樓', N'2', N'不吃牛', N'0', N'下午2點抵達', 6, N'林本源園邸', N'台北車站集合~搭乘台鐵列車出發【台北-板橋】
09:00 集合於台北車站
09:30 搭乘台鐵列車出發前往板橋

10:00 林本源園邸
欣賞古典園林建築，漫步於悠久歷史的庭園中
12:00 享用在地午餐
品嚐道地的板橋美食，體驗當地風味
13:30 大漢溪河濱公園
感受大自然的寧靜，享受輕鬆的散步時光
14:40 板橋慈惠宮
參觀這座充滿歷史和文化的廟宇，了解當地的宗教信仰
16:00 板橋435藝文特區
探索當地的藝術文化展覽，參加DIY手工藝活動
17:30 板橋夜市
在夜市中品嚐各式各樣的小吃，享受熱鬧的夜生活
19:00 板橋市區飯店~晚安
回到飯店，結束一天的行程，享受舒適的夜晚
這次旅程將帶您探索板橋的歷史和文化，體驗當地的美食和風土人情。讓我們一起度過一個充滿驚喜和樂趣的愉快日子！', N'林本源園邸', N'台北清翼居旅店', N'化妝、攝影拍照、交通、車資、住宿、活動、食物', N'1000', N'2000', N'1000', N'1000', N'3000', N'2000', N'2000', N'台北車站', N'當日行程', N'無', N'無', N'無', CAST(N'2024-07-17' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Customerinfo] ON 

INSERT [dbo].[Order_Customerinfo] ([Id], [Name], [IDnumber], [Phone], [Address], [Creditcard], [People], [Eatinghabits], [OrderID]) VALUES (1, N'蔡依琳', N'F123456789', N'0912345678', N'台北市松山區復興北路99號14樓', N'1234567890123456', 2, N'不限', NULL)
INSERT [dbo].[Order_Customerinfo] ([Id], [Name], [IDnumber], [Phone], [Address], [Creditcard], [People], [Eatinghabits], [OrderID]) VALUES (2, N'周杰倫', N'G123456789', N'0912345677', N'台北市松山區復興北路99號14樓', N'1234567890123456', 2, N'不限', NULL)
INSERT [dbo].[Order_Customerinfo] ([Id], [Name], [IDnumber], [Phone], [Address], [Creditcard], [People], [Eatinghabits], [OrderID]) VALUES (3, N'告五人', N'H123456789', N'0912345676', N'台北市松山區復興北路99號14樓', N'1234567890123456', 2, N'不限', NULL)
INSERT [dbo].[Order_Customerinfo] ([Id], [Name], [IDnumber], [Phone], [Address], [Creditcard], [People], [Eatinghabits], [OrderID]) VALUES (4, N'周潤發', N'I123456789', N'0912345675', N'台北市松山區復興北路99號14樓', N'1234567890123456', 2, N'不吃牛', NULL)
INSERT [dbo].[Order_Customerinfo] ([Id], [Name], [IDnumber], [Phone], [Address], [Creditcard], [People], [Eatinghabits], [OrderID]) VALUES (5, N'吳奇隆', N'J123456789', N'0912345674', N'台北市松山區復興北路99號14樓', N'1234567890123456', 2, N'不吃羊', NULL)
SET IDENTITY_INSERT [dbo].[Order_Customerinfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 

INSERT [dbo].[Order_Details] ([Id], [Customersname], [E-mail], [Phone], [Paymentmethod], [Deposit], [Orderfullamount], [Paymentdate], [Servicebase], [Departuredate], [Returndate], [Journeyname], [Orderdate], [Groupnumber], [Orderstate], [OrderID], [JourneyID]) VALUES (1, N'蔡依琳', N'aa@gmail.com', N'0912345678', N'匯款', 5000.0000, 10000.0000, CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'台北', CAST(N'2024-06-15T00:00:00.000' AS DateTime), CAST(N'2023-06-16T00:00:00.000' AS DateTime), N'宜蘭傳藝園區', CAST(N'2024-06-10T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Order_Details] ([Id], [Customersname], [E-mail], [Phone], [Paymentmethod], [Deposit], [Orderfullamount], [Paymentdate], [Servicebase], [Departuredate], [Returndate], [Journeyname], [Orderdate], [Groupnumber], [Orderstate], [OrderID], [JourneyID]) VALUES (2, N'周杰倫', N'bb@gmail.com', N'0912345677', N'匯款', 5000.0000, 10000.0000, CAST(N'2024-06-12T00:00:00.000' AS DateTime), N'台北', CAST(N'2024-06-16T00:00:00.000' AS DateTime), CAST(N'2023-06-17T00:00:00.000' AS DateTime), N'卓也小屋渡假園區', CAST(N'2024-06-11T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Order_Details] ([Id], [Customersname], [E-mail], [Phone], [Paymentmethod], [Deposit], [Orderfullamount], [Paymentdate], [Servicebase], [Departuredate], [Returndate], [Journeyname], [Orderdate], [Groupnumber], [Orderstate], [OrderID], [JourneyID]) VALUES (3, N'告五人', N'cc@gmail.com', N'0912345676', N'匯款', 5000.0000, 10000.0000, CAST(N'2024-06-14T00:00:00.000' AS DateTime), N'台北', CAST(N'2024-06-17T00:00:00.000' AS DateTime), CAST(N'2023-06-18T00:00:00.000' AS DateTime), N'林本源園邸', CAST(N'2024-06-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Order_Details] ([Id], [Customersname], [E-mail], [Phone], [Paymentmethod], [Deposit], [Orderfullamount], [Paymentdate], [Servicebase], [Departuredate], [Returndate], [Journeyname], [Orderdate], [Groupnumber], [Orderstate], [OrderID], [JourneyID]) VALUES (4, N'周潤發', N'dd@gmail.com', N'0912345675', N'匯款', 5000.0000, 10000.0000, CAST(N'2024-06-16T00:00:00.000' AS DateTime), N'台北', CAST(N'2024-06-18T00:00:00.000' AS DateTime), CAST(N'2023-06-19T00:00:00.000' AS DateTime), N'林安泰古厝', CAST(N'2024-06-13T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Order_Details] ([Id], [Customersname], [E-mail], [Phone], [Paymentmethod], [Deposit], [Orderfullamount], [Paymentdate], [Servicebase], [Departuredate], [Returndate], [Journeyname], [Orderdate], [Groupnumber], [Orderstate], [OrderID], [JourneyID]) VALUES (5, N'吳奇隆', N'ee@gmail.com', N'0912345674', N'匯款', 5000.0000, 10000.0000, CAST(N'2024-06-18T00:00:00.000' AS DateTime), N'台北', CAST(N'2024-06-19T00:00:00.000' AS DateTime), CAST(N'2023-06-20T00:00:00.000' AS DateTime), N'至善園', CAST(N'2024-06-14T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Journey] FOREIGN KEY([JourneyId])
REFERENCES [dbo].[Journey] ([Id])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Journey]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Members]
GO
ALTER TABLE [dbo].[Journey]  WITH CHECK ADD  CONSTRAINT [FK_Journey_Journey_Stays] FOREIGN KEY([Journey_StaysId])
REFERENCES [dbo].[Journey_Stays] ([Id])
GO
ALTER TABLE [dbo].[Journey] CHECK CONSTRAINT [FK_Journey_Journey_Stays]
GO
ALTER TABLE [dbo].[Journey_Ancientcostume]  WITH CHECK ADD  CONSTRAINT [FK_Journey_Ancientcostume_Journey] FOREIGN KEY([JourneyID])
REFERENCES [dbo].[Journey] ([Id])
GO
ALTER TABLE [dbo].[Journey_Ancientcostume] CHECK CONSTRAINT [FK_Journey_Ancientcostume_Journey]
GO
ALTER TABLE [dbo].[Journey_Contact]  WITH CHECK ADD  CONSTRAINT [FK_OrderContact_Journey] FOREIGN KEY([JourneyID])
REFERENCES [dbo].[Journey] ([Id])
GO
ALTER TABLE [dbo].[Journey_Contact] CHECK CONSTRAINT [FK_OrderContact_Journey]
GO
ALTER TABLE [dbo].[Journey_costumestyle]  WITH CHECK ADD  CONSTRAINT [FK_Journey_costumestyle_Journey_Ancientcostume] FOREIGN KEY([Journey_AncientcostumeID])
REFERENCES [dbo].[Journey_Ancientcostume] ([Id])
GO
ALTER TABLE [dbo].[Journey_costumestyle] CHECK CONSTRAINT [FK_Journey_costumestyle_Journey_Ancientcostume]
GO
ALTER TABLE [dbo].[Journey_Grouptype]  WITH CHECK ADD  CONSTRAINT [FK_Journey_Grouptype_Journey] FOREIGN KEY([JourneyID])
REFERENCES [dbo].[Journey] ([Id])
GO
ALTER TABLE [dbo].[Journey_Grouptype] CHECK CONSTRAINT [FK_Journey_Grouptype_Journey]
GO
ALTER TABLE [dbo].[Journey_hairstyle]  WITH CHECK ADD  CONSTRAINT [FK_Journey_hairstyle_Journey_Ancientcostume] FOREIGN KEY([Journey_AncientcostumeID])
REFERENCES [dbo].[Journey_Ancientcostume] ([Id])
GO
ALTER TABLE [dbo].[Journey_hairstyle] CHECK CONSTRAINT [FK_Journey_hairstyle_Journey_Ancientcostume]
GO
ALTER TABLE [dbo].[Journey_makeupstyle]  WITH CHECK ADD  CONSTRAINT [FK_Journey_makeupstyle_Journey_Ancientcostume] FOREIGN KEY([Journey_AncientcostumeID])
REFERENCES [dbo].[Journey_Ancientcostume] ([Id])
GO
ALTER TABLE [dbo].[Journey_makeupstyle] CHECK CONSTRAINT [FK_Journey_makeupstyle_Journey_Ancientcostume]
GO
ALTER TABLE [dbo].[Journey_Travellertype]  WITH CHECK ADD  CONSTRAINT [FK_Journey_Travellertype_Journey] FOREIGN KEY([JourneyID])
REFERENCES [dbo].[Journey] ([Id])
GO
ALTER TABLE [dbo].[Journey_Travellertype] CHECK CONSTRAINT [FK_Journey_Travellertype_Journey]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employees]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Members]
GO
ALTER TABLE [dbo].[Order_Customerinfo]  WITH CHECK ADD  CONSTRAINT [FK_Customerinfo_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Order_Customerinfo] CHECK CONSTRAINT [FK_Customerinfo_Order]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Journey] FOREIGN KEY([JourneyID])
REFERENCES [dbo].[Journey] ([Id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Journey]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Order]
GO
USE [master]
GO
ALTER DATABASE [AcDB] SET  READ_WRITE 
GO
