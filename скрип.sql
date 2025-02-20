USE [master]
GO
/****** Object:  Database [BlogodatKIA]    Script Date: 01.02.2025 0:11:07 ******/
CREATE DATABASE [BlogodatKIA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogodatKIA', FILENAME = N'D:\15\MSSQL15.MSSQLSERVER\MSSQL\DATA\BlogodatKIA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlogodatKIA_log', FILENAME = N'D:\15\MSSQL15.MSSQLSERVER\MSSQL\DATA\BlogodatKIA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlogodatKIA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogodatKIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogodatKIA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogodatKIA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogodatKIA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogodatKIA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogodatKIA] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogodatKIA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogodatKIA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogodatKIA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogodatKIA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogodatKIA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogodatKIA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogodatKIA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogodatKIA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogodatKIA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogodatKIA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlogodatKIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogodatKIA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogodatKIA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogodatKIA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogodatKIA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogodatKIA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogodatKIA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogodatKIA] SET RECOVERY FULL 
GO
ALTER DATABASE [BlogodatKIA] SET  MULTI_USER 
GO
ALTER DATABASE [BlogodatKIA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogodatKIA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogodatKIA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogodatKIA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlogodatKIA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlogodatKIA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BlogodatKIA', N'ON'
GO
ALTER DATABASE [BlogodatKIA] SET QUERY_STORE = OFF
GO
USE [BlogodatKIA]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 01.02.2025 0:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientCode] [int] NOT NULL,
	[Surname] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Patronymic] [varchar](50) NULL,
	[Passport] [varchar](50) NULL,
	[Birthday] [date] NULL,
	[Adress] [text] NULL,
	[Email] [text] NULL,
	[Password] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 01.02.2025 0:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Login] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Patronymic] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IDRole] [int] NULL,
	[Photo] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 01.02.2025 0:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[IDHIistory] [int] IDENTITY(1,1) NOT NULL,
	[UserLogin] [varchar](50) NOT NULL,
	[LastDate] [datetime] NOT NULL,
	[EnterType] [varchar](15) NOT NULL,
 CONSTRAINT [PK__History__0199FD182079B586] PRIMARY KEY CLUSTERED 
(
	[IDHIistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 01.02.2025 0:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IDOrder] [int] NOT NULL,
	[OrderCode] [varchar](25) NULL,
	[DateCreated] [date] NULL,
	[OrderTime] [time](7) NULL,
	[ClientCode] [int] NULL,
	[IDStatus] [int] NULL,
	[CloseDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 01.02.2025 0:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[IDOrder] [int] NOT NULL,
	[IDService] [int] NOT NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[IDOrder] ASC,
	[IDService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 01.02.2025 0:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IDRole] [int] NOT NULL,
	[NameRole] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 01.02.2025 0:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] NOT NULL,
	[NameService] [text] NULL,
	[CodeService] [varchar](50) NULL,
	[PriceHour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 01.02.2025 0:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[IDStatus] [int] NOT NULL,
	[Status] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462526, N'Фролов', N'Андрей', N'Иванович', N'Серия 1180 Номер 176596', CAST(N'2001-07-14' AS Date), N'344288, г. Барнаул, ул. Чехова, 1, кв. 34', N'gohufreilagrau-3818@yopmail.com', N'cl12345')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462527, N'Николаев', N'Даниил', N'Всеволодович', N'Серия 2280 Номер 223523', CAST(N'2001-02-10' AS Date), N'614164, г. Барнаул, ул. Степная, 30, кв. 75', N'xawugosune-1385@yopmail.com', N'cl12346')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462528, N'Снегирев', N'Макар', N'Иванович', N'Серия 4560 Номер 354155', CAST(N'1998-05-21' AS Date), N'394242, г. Барнаул, ул. Коммунистическая, 43, кв. 57', N'satrahuddusei-4458@yopmail.com', N'cl12347')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462529, N'Иванов', N'Иван', N'Ильич', N'Серия 9120 Номер 554296', CAST(N'1998-10-01' AS Date), N'660540, г. Барнаул, ул. Солнечная, 25, кв. 78', N'boippaxeufrepra-7093@yopmail.com', N'cl12348')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462530, N'Филиппова', N'Анна', N'Глебовна', N'Серия 2367 Номер 558134', CAST(N'1976-05-31' AS Date), N'125837, г. Барнаул, ул. Шоссейная, 40, кв. 92', N'zapramaxesu-7741@yopmail.com', N'cl12349')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462531, N'Иванов', N'Михаил', N'Владимирович', N'Серия 7101 Номер 669343', CAST(N'1985-11-04' AS Date), N'125703, г. Барнаул, ул. Партизанская, 49, кв. 84', N'rouzecroummegre-3899@yopmail.com', N'cl12350')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462532, N'Власов', N'Дмитрий', N'Александрович', N'Серия 3455 Номер 719630', CAST(N'1998-08-17' AS Date), N'625283, г. Барнаул, ул. Победы, 46, кв. 7', N'ziyeuddocrabri-4748@yopmail.com', N'cl12351')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462533, N'Серова', N'Екатерина', N'Львовна', N'Серия 2377 Номер 871623', CAST(N'1984-10-24' AS Date), N'614611, г. Барнаул, ул. Молодежная, 50, кв. 78', N'ketameissoinnei-1951@yopmail.com', N'cl12352')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462534, N'Борисова', N'Ирина', N'Ивановна', N'Серия 8755 Номер 921148', CAST(N'1976-10-14' AS Date), N'454311, г. Барнаул, ул. Новая, 19, кв. 78', N'yipraubaponou-5849@yopmail.com', N'cl12353')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462535, N'Зайцев', N'Никита', N'Артёмович', N'Серия 4355 Номер 104594', CAST(N'1999-10-14' AS Date), N'660007, г. Барнаул, ул. Октябрьская, 19, кв. 42', N'crapedocouca-3572@yopmail.com', N'cl12354')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462536, N'Медведев', N'Святослав', N'Евгеньевич', N'Серия 2791 Номер 114390', CAST(N'1985-07-13' AS Date), N'603036, г. Барнаул, ул. Садовая, 4, кв. 13', N'ceigoixakaunni-9227@yopmail.com', N'cl12355')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462537, N'Коротков', N'Кирилл', N'Алексеевич', N'Серия 5582 Номер 126286', CAST(N'1976-05-26' AS Date), N'450983, г. Барнаул, ул. Комсомольская, 26, кв. 60', N'yeimmeiwauzomo-7054@yopmail.com', N'cl12356')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462538, N'Калашникова', N'Арина', N'Максимовна', N'Серия 2978 Номер 133653', CAST(N'1999-08-13' AS Date), N'394782, г. Барнаул, ул. Чехова, 3, кв. 14', N'poleifenevi-1560@yopmail.com', N'cl12357')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462539, N'Минина', N'Таисия', N'Кирилловна', N'Серия 7512 Номер 141956', CAST(N'1985-10-13' AS Date), N'603002, г. Барнаул, ул. Дзержинского, 28, кв. 56', N'kauprezofautei-6607@yopmail.com', N'cl12358')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462540, N'Наумов', N'Серафим', N'Романович', N'Серия 5046 Номер 158433', CAST(N'1999-04-15' AS Date), N'450558, г. Барнаул, ул. Набережная, 30, кв. 71', N'quaffaullelourei-1667@yopmail.com', N'cl12359')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462541, N'Воробьева', N'Василиса', N'Евгеньевна', N'Серия 2460 Номер 169505', CAST(N'1999-01-13' AS Date), N'394060, г. Барнаул, ул. Фрунзе, 43, кв. 79', N'jsteele@rojas-robinson.net', N'cl12360')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462542, N'Калинин', N'Александр', N'Андреевич', N'Серия 3412 Номер 174593', CAST(N'1999-01-07' AS Date), N'410661, г. Барнаул, ул. Школьная, 50, кв. 53', N'vhopkins@lewis-mullen.com', N'cl12361')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462543, N'Кузнецова', N'Милана', N'Владиславовна', N'Серия 4950 Номер 183034', CAST(N'1999-01-24' AS Date), N'625590, г. Барнаул, ул. Коммунистическая, 20, кв. 34', N'nlewis@yahoo.com', N'cl12362')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462544, N'Фирсов', N'Егор', N'Романович', N'Серия 5829 Номер 219464', CAST(N'1993-09-02' AS Date), N'625683, г. Барнаул, ул. 8 Марта, 20, кв. 21', N'garciadavid@mckinney-mcbride.com', N'cl12363')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462545, N'Зимина', N'Агния', N'Александровна', N'Серия 6443 Номер 208059', CAST(N'1998-09-03' AS Date), N'400562, г. Барнаул, ул. Зеленая, 32, кв. 67', N'cbradley@castro.com', N'cl12364')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462546, N'Титов', N'Андрей', N'Глебович', N'Серия 7079 Номер 213265', CAST(N'1985-10-23' AS Date), N'614510, г. Барнаул, ул. Маяковского, 47, кв. 72', N'cuevascatherine@carlson.biz', N'cl12365')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462547, N'Орлов', N'Николай', N'Егорович', N'Серия 8207 Номер 522702', CAST(N'1985-07-27' AS Date), N'410542, г. Барнаул, ул. Светлая, 46, кв. 82', N'thomasmoore@wilson-singh.net', N'cl12366')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462548, N'Кузнецова', N'Аиша', N'Михайловна', N'Серия 9307 Номер 232158', CAST(N'1998-10-04' AS Date), N'620839, г. Барнаул, ул. Цветочная, 8, кв. 100', N'jessica84@hotmail.com', N'cl12367')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462549, N'Куликов', N'Никита', N'Георгиевич', N'Серия 1357 Номер 242839', CAST(N'1999-04-23' AS Date), N'443890, г. Барнаул, ул. Коммунистическая, 1, кв. 10', N'jessicapark@hotmail.com', N'cl12368')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462550, N'Карпова', N'София', N'Егоровна', N'Серия 1167 Номер 256636', CAST(N'1993-10-01' AS Date), N'603379, г. Барнаул, ул. Спортивная, 46, кв. 95', N'ginaritter@schneider-buchanan.com', N'cl12369')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462551, N'Смирнова', N'Дарья', N'Макаровна', N'Серия 1768 Номер 266986', CAST(N'1976-03-22' AS Date), N'603721, г. Барнаул, ул. Гоголя, 41, кв. 57', N'stephen99@yahoo.com', N'cl12370')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462552, N'Абрамова', N'Александра', N'Мироновна', N'Серия 1710 Номер 427875', CAST(N'1999-03-26' AS Date), N'410172, г. Барнаул, ул. Северная, 13, кв. 86', N'lopezlisa@hotmail.com', N'cl12371')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462553, N'Наумов', N'Руслан', N'Михайлович', N'Серия 1806 Номер 289145', CAST(N'1999-10-11' AS Date), N'420151, г. Барнаул, ул. Вишневая, 32, кв. 81', N'lori17@hotmail.com', N'cl12372')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462554, N'Бочаров', N'Никита', N'Матвеевич', N'Серия 1587 Номер 291249', CAST(N'1997-06-29' AS Date), N'125061, г. Барнаул, ул. Подгорная, 8, кв. 74', N'campbellkevin@gardner.com', N'cl12373')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462555, N'Соловьев', N'Давид', N'Ильич', N'Серия 1647 Номер 306372', CAST(N'1984-03-06' AS Date), N'630370, г. Барнаул, ул. Шоссейная, 24, кв. 81', N'morganhoward@clark.com', N'cl12374')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462556, N'Васильева', N'Валерия', N'Дмитриевна', N'Серия 1742 Номер 316556', CAST(N'1999-09-30' AS Date), N'614753, г. Барнаул, ул. Полевая, 35, кв. 39', N'carsontamara@gmail.com', N'cl12375')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462557, N'Макарова', N'Василиса', N'Андреевна', N'Серия 1474 Номер 326347', CAST(N'1999-04-08' AS Date), N'426030, г. Барнаул, ул. Маяковского, 44, кв. 93', N'kevinpatel@gmail.com', N'cl12376')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462558, N'Алексеев', N'Матвей', N'Викторович', N'Серия 1452 Номер 339539', CAST(N'1998-08-02' AS Date), N'450375, г. Барнаул, ул. Клубная, 44, кв. 80', N'sethbishop@yahoo.com', N'cl12377')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462559, N'Никитина', N'Полина', N'Александровна', N'Серия 2077 Номер 443480', CAST(N'1976-09-19' AS Date), N'625560, г. Барнаул, ул. Некрасова, 12, кв. 66', N'drollins@schultz-soto.net', N'cl12378')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462560, N'Окулова', N'Олеся', N'Алексеевна', N'Серия 2147 Номер 357518', CAST(N'1999-04-03' AS Date), N'630201, г. Барнаул, ул. Комсомольская, 17, кв. 25', N'pblack@copeland-winters.org', N'cl12379')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462561, N'Захарова', N'Полина', N'Яновна', N'Серия 2687 Номер 363884', CAST(N'1976-04-21' AS Date), N'190949, г. Барнаул, ул. Мичурина, 26, кв. 93', N'johnathon.oberbrunner@yahoo.com', N'cl12380')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462562, N'Зайцев', N'Владимир', N'Давидович', N'Серия 2376 Номер 443711', CAST(N'1998-01-26' AS Date), N'350501, г. Барнаул, ул. Парковая, 2, кв. 7', N'bradly29@gmail.com', N'cl12381')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462563, N'Иванов', N'Виталий', N'Даниилович', N'Серия 2568 Номер 386237', CAST(N'1976-08-11' AS Date), N'450048, г. Барнаул, ул. Коммунистическая, 21, кв. 3', N'stark.cristina@hilpert.biz', N'cl12382')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462564, N'Захаров', N'Матвей', N'Романович', N'Серия 2556 Номер 439376', CAST(N'1993-07-12' AS Date), N'644921, г. Барнаул, ул. Школьная, 46, кв. 37', N'bruen.eleanore@yahoo.com', N'cl12383')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462565, N'Иванов', N'Степан', N'Степанович', N'Серия 2737 Номер 407501', CAST(N'1998-09-19' AS Date), N'614228, г. Барнаул, ул. Дорожная, 36, кв. 54', N'percival.halvorson@yahoo.com', N'cl12384')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462566, N'Ткачева', N'Милана', N'Тимуровна', N'Серия 2581 Номер 441645', CAST(N'1998-05-24' AS Date), N'350940, г. Барнаул, ул. Первомайская, 23, кв. 2', N'javonte71@kuhlman.biz', N'cl12385')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462567, N'Семенов', N'Даниил', N'Иванович', N'Серия 2675 Номер 427933', CAST(N'1976-01-04' AS Date), N'344990, г. Барнаул, ул. Красноармейская, 19, кв. 92', N'vconnelly@kautzer.com', N'cl12386')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462568, N'Виноградов', N'Вячеслав', N'Дмитриевич', N'Серия 2967 Номер 434531', CAST(N'1976-07-12' AS Date), N'410248, г. Барнаул, ул. Чкалова, 11, кв. 75', N'anabelle07@schultz.info', N'cl12387')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462569, N'Соболева', N'Николь', N'Фёдоровна', N'Серия 3070 Номер 449655', CAST(N'1976-05-02' AS Date), N'400839, г. Барнаул, ул. 8 Марта, 46, кв. 44', N'nitzsche.katlynn@yahoo.com', N'cl12388')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462570, N'Тихонова', N'Анна', N'Львовна', N'Серия 3108 Номер 451174', CAST(N'1985-03-23' AS Date), N'450539, г. Барнаул, ул. Заводская, 3, кв. 81', N'corine16@von.com', N'cl12389')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462571, N'Кузнецова', N'Ульяна', N'Савельевна', N'Серия 3250 Номер 464705', CAST(N'1999-06-03' AS Date), N'614591, г. Барнаул, ул. Цветочная, 20, кв. 40', N'otha.wisozk@lubowitz.org', N'cl12390')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462572, N'Смирнова', N'Анна', N'Германовна', N'Серия 3392 Номер 471644', CAST(N'1997-07-18' AS Date), N'400260, г. Барнаул, ул. Больничная, 30, кв. 53', N'may.kirlin@hotmail.com', N'cl12391')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462573, N'Черепанова', N'Анна', N'Давидовна', N'Серия 3497 Номер 487819', CAST(N'1985-11-06' AS Date), N'660924, г. Барнаул, ул. Молодежная, 32, кв. 59', N'bryana.kautzer@yahoo.com', N'cl12392')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462574, N'Григорьев', N'Максим', N'Кириллович', N'Серия 3560 Номер 491260', CAST(N'1999-05-26' AS Date), N'644133, г. Барнаул, ул. Гагарина, 28, кв. 69', N'deborah.christiansen@quigley.biz', N'cl12393')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462575, N'Голубев', N'Даниэль', N'Александрович', N'Серия 3620 Номер 506034', CAST(N'1999-06-14' AS Date), N'450698, г. Барнаул, ул. Вокзальная, 14, кв. 37', N'connelly.makayla@yahoo.com', N'cl12394')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462576, N'Миронов', N'Юрий', N'Денисович', N'Серия 3774 Номер 511438', CAST(N'1985-01-26' AS Date), N'620653, г. Барнаул, ул. Западная, 15, кв. 25', N'tatum.collins@fay.org', N'cl12395')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462577, N'Терехов', N'Михаил', N'Андреевич', N'Серия 3862 Номер 521377', CAST(N'1976-07-06' AS Date), N'644321, г. Барнаул, ул. Клубная, 32, кв. 10', N'itzel73@anderson.com', N'cl12396')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462578, N'Орлова', N'Алиса', N'Михайловна', N'Серия 3084 Номер 535966', CAST(N'1997-02-24' AS Date), N'603653, г. Барнаул, ул. Молодежная, 2, кв. 45', N'arjun39@hotmail.com', N'cl12397')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462579, N'Кулаков', N'Константин', N'Даниилович', N'Серия 4021 Номер 541528', CAST(N'1993-06-20' AS Date), N'410181, г. Барнаул, ул. Механизаторов, 16, кв. 74', N'ohara.rebeka@yahoo.com', N'cl12398')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462580, N'Кудрявцев', N'Максим', N'Романович', N'Серия 4109 Номер 554053', CAST(N'1998-05-10' AS Date), N'394207, г. Барнаул, ул. Свердлова, 31, кв. 28', N'danika58@rath.com', N'cl12399')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462581, N'Соболева', N'Кира', N'Фёдоровна', N'Серия 4537 Номер 564868', CAST(N'1998-03-14' AS Date), N'420633, г. Барнаул, ул. Матросова, 18, кв. 41', N'janae.bogan@gmail.com', N'cl12400')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462582, N'Коновалов', N'Арсений', N'Максимович', N'Серия 4914 Номер 572471', CAST(N'1985-02-18' AS Date), N'445720, г. Барнаул, ул. Матросова, 50, кв. 67', N'vern91@yahoo.com', N'cl12401')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462583, N'Гусев', N'Михаил', N'Дмитриевич', N'Серия 4445 Номер 581302', CAST(N'1999-11-23' AS Date), N'400646, г. Барнаул, ул. Октябрьская, 47, кв. 65', N'mariana.leannon@larkin.net', N'cl12402')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462584, N'Суханова', N'Варвара', N'Матвеевна', N'Серия 4743 Номер 598180', CAST(N'1993-09-13' AS Date), N'644410, г. Барнаул, ул. Красная, 17, кв. 69', N'vmoore@gmail.com', N'cl12403')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462585, N'Орлова', N'Ясмина', N'Васильевна', N'Серия 4741 Номер 601821', CAST(N'1984-06-24' AS Date), N'400750, г. Барнаул, ул. Школьная, 36, кв. 71', N'damon.mcclure@mills.com', N'cl12404')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462586, N'Васильева', N'Ксения', N'Константиновна', N'Серия 4783 Номер 612567', CAST(N'1999-08-01' AS Date), N'660590, г. Барнаул, ул. Дачная, 37, кв. 70', N'grady.reilly@block.com', N'cl12405')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462587, N'Борисова', N'Тамара', N'Данииловна', N'Серия 4658 Номер 621200', CAST(N'1993-05-29' AS Date), N'426083, г. Барнаул, ул. Механизаторов, 41, кв. 26', N'boyd.koss@yahoo.com', N'cl12406')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462588, N'Дмитриев', N'Мирон', N'Ильич', N'Серия 4908 Номер 634613', CAST(N'1985-04-13' AS Date), N'410569, г. Барнаул, ул. Парковая, 36, кв. 17', N'obartell@franecki.info', N'cl12407')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462589, N'Лебедева', N'Анна', N'Александровна', N'Серия 5092 Номер 642468', CAST(N'1985-03-30' AS Date), N'443375, г. Барнаул, ул. Дзержинского, 50, кв. 95', N'reina75@ferry.net', N'cl12408')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462590, N'Пономарев', N'Артём', N'Маркович', N'Серия 5155 Номер 465274', CAST(N'1984-06-02' AS Date), N'614316, г. Барнаул, ул. Первомайская, 48, кв. 31', N'karson28@hotmail.com', N'cl12409')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462591, N'Борисова', N'Елена', N'Михайловна', N'Серия 5086 Номер 666893', CAST(N'1976-05-23' AS Date), N'445685, г. Барнаул, ул. Зеленая, 7, кв. 47', N'damaris61@okon.com', N'cl12410')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462592, N'Моисеев', N'Камиль', N'Максимович', N'Серия 5333 Номер 675375', CAST(N'1999-06-17' AS Date), N'614505, г. Барнаул, ул. Нагорная, 37, кв. 31', N'carroll.jerod@hotmail.com', N'cl12411')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462593, N'Герасимова', N'Дарья', N'Константиновна', N'Серия 5493 Номер 684572', CAST(N'1984-10-13' AS Date), N'426629, г. Барнаул, ул. Весенняя, 32, кв. 46', N'ron.treutel@quitzon.com', N'cl12412')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462594, N'Михайлова', N'Мария', N'Марковна', N'Серия 5150 Номер 696226', CAST(N'1976-12-02' AS Date), N'603743, г. Барнаул, ул. Матросова, 19, кв. 20', N'olen79@yahoo.com', N'cl12413')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462595, N'Коршунов', N'Кирилл', N'Максимович', N'Серия 1308 Номер 703305', CAST(N'1985-05-22' AS Date), N'450750, г. Барнаул, ул. Клубная, 23, кв. 90', N'pacocha.robbie@yahoo.com', N'cl12414')
INSERT [dbo].[Client] ([ClientCode], [Surname], [Name], [Patronymic], [Passport], [Birthday], [Adress], [Email], [Password]) VALUES (45462596, N'asd', N'asd', N'asd', N'1234 13456', CAST(N'2024-12-30' AS Date), NULL, N'kozyavki@mail.com', NULL)
GO
INSERT [dbo].[Employee] ([Login], [Surname], [Name], [Patronymic], [Password], [IDRole], [Photo]) VALUES (N'belyeva@@namecomp.ru', N'Беляева', N'Лилия', N'Наумовна', N'AtnDjr', 1, N'\photoempl\Беляева.jpeg')
INSERT [dbo].[Employee] ([Login], [Surname], [Name], [Patronymic], [Password], [IDRole], [Photo]) VALUES (N'fedorov@namecomp.ru', N'Федоров', N'Федор', N'Федорович', N'8ntwUp', 2, N'\photoempl\Федоров.jpeg')
INSERT [dbo].[Employee] ([Login], [Surname], [Name], [Patronymic], [Password], [IDRole], [Photo]) VALUES (N'hohlov@namecomp.ru', N'Хохлов', N'Владимир', N'Мэлсович', N'LdNyos', 1, N'\photoempl\Хохлов.jpeg')
INSERT [dbo].[Employee] ([Login], [Surname], [Name], [Patronymic], [Password], [IDRole], [Photo]) VALUES (N'ignatov@namecomp.ru', N'Игнатов', N'Кассиан', N'Васильевич', N'rwVDh9', 3, N'\photoempl\Игнатов.jpeg')
INSERT [dbo].[Employee] ([Login], [Surname], [Name], [Patronymic], [Password], [IDRole], [Photo]) VALUES (N'Ivanov@namecomp.ru', N'Иванов', N'Иван', N'Иванович', N'2L6KZG', 1, N'\photoempl\Иванов.jpeg')
INSERT [dbo].[Employee] ([Login], [Surname], [Name], [Patronymic], [Password], [IDRole], [Photo]) VALUES (N'mironov@namecomp.ru', N'Миронов', N'Вениамин', N'Куприянович', N'YOyhfR1', 3, N'\photoempl\Миронов.jpeg')
INSERT [dbo].[Employee] ([Login], [Surname], [Name], [Patronymic], [Password], [IDRole], [Photo]) VALUES (N'petrov@namecomp.ru', N'Петров', N'Петр', N'Петрович', N'uzWC67', 1, N'\photoempl\Петров.jpeg')
INSERT [dbo].[Employee] ([Login], [Surname], [Name], [Patronymic], [Password], [IDRole], [Photo]) VALUES (N'shiryev@namecomp.ru', N'Ширяев', N'Ермолай', N'Вениаминович', N'RSbvHv', 3, N'\photoempl\Ширяев.jpeg')
INSERT [dbo].[Employee] ([Login], [Surname], [Name], [Patronymic], [Password], [IDRole], [Photo]) VALUES (N'smirnova@@namecomp.ru', N'Смирнова', N'Ульяна', N'Гордеевна', N'JlFRCZ', 1, N'\photoempl\Смирнова.jpeg')
INSERT [dbo].[Employee] ([Login], [Surname], [Name], [Patronymic], [Password], [IDRole], [Photo]) VALUES (N'strelkov@namecomp.ru', N'Стрелков', N'Мстислав', N'Георгьевич', N'gynQMT', 1, N'\photoempl\Стрелков.jpeg')
GO
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (1, N'Ivanov@namecomp.ru', CAST(N'2022-05-15T13:13:00.000' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (2, N'petrov@namecomp.ru', CAST(N'2022-05-15T13:13:00.000' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (3, N'fedorov@namecomp.ru', CAST(N'2022-05-15T13:13:00.003' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (4, N'mironov@namecomp.ru', CAST(N'2022-05-15T13:13:00.003' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (5, N'shiryev@namecomp.ru', CAST(N'2022-05-15T13:13:00.003' AS DateTime), N'Неуспешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (6, N'ignatov@namecomp.ru', CAST(N'2022-05-15T13:13:00.007' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (7, N'hohlov@namecomp.ru', CAST(N'2022-05-15T13:13:00.007' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (8, N'strelkov@namecomp.ru', CAST(N'2022-05-15T13:13:00.007' AS DateTime), N'Неуспешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (9, N'belyeva@@namecomp.ru', CAST(N'2022-05-15T13:13:00.007' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (10, N'smirnova@@namecomp.ru', CAST(N'2022-05-15T13:13:00.010' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (11, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T19:50:54.963' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (12, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:21:56.807' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (13, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:22:38.837' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (14, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:25:17.850' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (15, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:25:37.160' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (16, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:27:00.217' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (17, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:27:29.913' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (18, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:30:08.653' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (19, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:30:42.690' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (20, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:33:54.553' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (21, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:35:01.957' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (22, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:49:58.253' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (23, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T20:57:46.580' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (24, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T21:00:57.777' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (25, N'belyeva@@namecomp.ru', CAST(N'2025-01-28T21:06:52.560' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (26, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T19:07:41.630' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (27, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T19:08:11.790' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (28, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T19:09:39.980' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (29, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T19:18:40.593' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (30, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T19:19:43.857' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (31, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T20:02:13.777' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (32, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T20:05:07.437' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (33, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T20:05:42.567' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (34, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T20:08:09.460' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (35, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T20:09:34.797' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (36, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T20:12:12.457' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (37, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T20:13:04.330' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (38, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T20:14:55.900' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (39, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T20:15:17.960' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (40, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T20:36:39.737' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (41, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T21:25:09.163' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (42, N'belyeva@@namecomp.ru', CAST(N'2025-01-29T21:25:31.513' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (43, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T17:59:41.477' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (44, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:01:00.377' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (45, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:08:41.317' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (46, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:09:34.533' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (47, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:10:01.230' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (48, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:35:06.523' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (49, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:35:27.197' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (50, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:36:13.897' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (51, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:37:10.170' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (52, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:37:32.520' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (53, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:38:47.063' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (54, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:40:18.330' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (55, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:40:37.493' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (56, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T18:47:18.190' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (57, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:03:47.073' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (58, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:04:07.920' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (59, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:07:04.263' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (60, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:07:34.323' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (61, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:10:46.187' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (62, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:23:02.757' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (63, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:23:18.397' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (64, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:23:53.553' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (65, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:24:52.567' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (66, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:27:29.860' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (67, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:28:05.103' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (68, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:30:18.353' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (69, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T19:31:54.237' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (70, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T20:54:21.917' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (71, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T20:54:50.387' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (72, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T20:55:34.820' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (73, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T20:55:50.970' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (74, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T20:58:06.577' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (75, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T20:58:32.507' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (76, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:00:04.257' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (77, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:17:03.410' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (78, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:39:45.053' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (79, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:40:19.440' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (80, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:41:07.320' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (81, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:41:51.097' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (82, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:43:59.010' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (83, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:44:42.767' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (84, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:46:00.530' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (85, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:46:31.990' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (86, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:47:13.357' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (87, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:50:10.993' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (88, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:51:12.977' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (89, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:52:02.850' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (90, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:52:45.617' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (91, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:53:04.280' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (92, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:53:43.367' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (93, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:54:11.243' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (94, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:54:27.687' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (95, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:57:08.280' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (96, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:59:03.660' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (97, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T21:59:47.403' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (98, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T22:09:44.767' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (99, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T22:12:30.827' AS DateTime), N'Успешно')
GO
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (100, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T22:44:01.573' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (101, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T22:48:53.810' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (102, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T22:49:37.347' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (103, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T22:50:57.893' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (104, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T22:51:17.893' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (105, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T22:52:22.420' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (106, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T23:04:55.110' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (107, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T23:05:26.500' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (108, N'belyeva@@namecomp.ru', CAST(N'2025-01-30T23:07:12.190' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (109, N'belyeva@@namecomp.ru', CAST(N'2025-01-31T18:53:00.863' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (110, N'belyeva@@namecomp.ru', CAST(N'2025-01-31T18:58:29.820' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (111, N'belyeva@@namecomp.ru', CAST(N'2025-01-31T19:20:08.807' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (112, N'belyeva@@namecomp.ru', CAST(N'2025-01-31T19:22:35.137' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (113, N'belyeva@@namecomp.ru', CAST(N'2025-01-31T19:26:18.303' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (114, N'belyeva@@namecomp.ru', CAST(N'2025-01-31T19:28:45.997' AS DateTime), N'Успешно')
INSERT [dbo].[History] ([IDHIistory], [UserLogin], [LastDate], [EnterType]) VALUES (115, N'belyeva@@namecomp.ru', CAST(N'2025-01-31T21:09:00.767' AS DateTime), N'Успешно')
SET IDENTITY_INSERT [dbo].[History] OFF
GO
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (1, N'45462526/12.03.2022', CAST(N'2022-03-12' AS Date), CAST(N'09:10:00' AS Time), 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (2, N'45462527/13.03.2022', CAST(N'2022-03-13' AS Date), CAST(N'10:10:00' AS Time), 45462527, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (3, N'45462528/14.03.2022', CAST(N'2022-03-14' AS Date), CAST(N'11:10:00' AS Time), 45462528, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (4, N'45462529/15.03.2022', CAST(N'2022-03-15' AS Date), CAST(N'12:10:00' AS Time), 45462529, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (5, N'45462530/16.03.2022', CAST(N'2022-03-16' AS Date), CAST(N'13:10:00' AS Time), 45462530, 3, CAST(N'2022-04-16' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (6, N'45462531/17.03.2022', CAST(N'2022-03-17' AS Date), CAST(N'14:10:00' AS Time), 45462531, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (7, N'45462532/18.03.2022', CAST(N'2022-03-18' AS Date), CAST(N'15:10:00' AS Time), 45462532, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (8, N'45462533/19.03.2022', CAST(N'2022-03-19' AS Date), CAST(N'16:10:00' AS Time), 45462533, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (9, N'45462534/20.03.2022', CAST(N'2022-03-20' AS Date), CAST(N'10:00:00' AS Time), 45462534, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (10, N'45462535/21.03.2022', CAST(N'2022-03-21' AS Date), CAST(N'11:00:00' AS Time), 45462535, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (11, N'45462536/22.03.2022', CAST(N'2022-03-22' AS Date), CAST(N'12:00:00' AS Time), 45462536, 3, CAST(N'2022-03-22' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (12, N'45462537/23.03.2022', CAST(N'2022-03-23' AS Date), CAST(N'13:00:00' AS Time), 45462537, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (13, N'45462538/24.03.2022', CAST(N'2022-03-24' AS Date), CAST(N'14:00:00' AS Time), 45462538, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (14, N'45462539/25.03.2022', CAST(N'2022-03-25' AS Date), CAST(N'15:00:00' AS Time), 45462539, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (15, N'45462540/26.03.2022', CAST(N'2022-03-26' AS Date), CAST(N'16:00:00' AS Time), 45462540, 3, CAST(N'2022-04-26' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (16, N'45462541/27.03.2022', CAST(N'2022-03-27' AS Date), CAST(N'17:00:00' AS Time), 45462541, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (17, N'45462542/28.03.2022', CAST(N'2022-03-28' AS Date), CAST(N'18:00:00' AS Time), 45462542, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (18, N'45462543/29.03.2022', CAST(N'2022-03-29' AS Date), CAST(N'19:00:00' AS Time), 45462543, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (19, N'45462544/30.03.2022', CAST(N'2022-03-30' AS Date), CAST(N'12:30:00' AS Time), 45462544, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (20, N'45462545/31.03.2022', CAST(N'2022-03-31' AS Date), CAST(N'13:30:00' AS Time), 45462545, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (21, N'45462546/01.04.2022', CAST(N'2022-04-01' AS Date), CAST(N'14:30:00' AS Time), 45462546, 3, CAST(N'2022-04-01' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (22, N'45462547/02.04.2022', CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), 45462547, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (23, N'45462548/03.04.2022', CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), 45462548, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (24, N'45462549/04.04.2022', CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), 45462549, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (25, N'45462550/05.04.2022', CAST(N'2022-04-05' AS Date), CAST(N'18:30:00' AS Time), 45462550, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (26, N'45462551/06.04.2022', CAST(N'2022-04-06' AS Date), CAST(N'15:30:00' AS Time), 45462551, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (27, N'45462552/07.04.2022', CAST(N'2022-04-07' AS Date), CAST(N'16:30:00' AS Time), 45462552, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (28, N'45462553/08.04.2022', CAST(N'2022-04-08' AS Date), CAST(N'17:30:00' AS Time), 45462553, 3, CAST(N'2022-04-08' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (29, N'45462554/09.04.2022', CAST(N'2022-04-09' AS Date), CAST(N'18:30:00' AS Time), 45462554, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (30, N'45462555/10.04.2022', CAST(N'2022-04-10' AS Date), CAST(N'19:30:00' AS Time), 45462555, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (31, N'45462556/11.04.2022', CAST(N'2022-04-11' AS Date), CAST(N'10:30:00' AS Time), 45462556, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (32, N'45462557/12.04.2022', CAST(N'2022-04-12' AS Date), CAST(N'11:30:00' AS Time), 45462557, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (33, N'45462558/13.04.2022', CAST(N'2022-04-13' AS Date), CAST(N'12:30:00' AS Time), 45462558, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (34, N'45462559/14.04.2022', CAST(N'2022-04-14' AS Date), CAST(N'13:30:00' AS Time), 45462559, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (35, N'45462560/15.04.2022', CAST(N'2022-04-15' AS Date), CAST(N'14:30:00' AS Time), 45462560, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (36, N'45462561/02.04.2022', CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), 45462561, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (37, N'45462562/03.04.2022', CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), 45462562, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (38, N'45462563/04.04.2022', CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), 45462563, 3, CAST(N'2022-04-04' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (39, N'45462564/05.04.2022', CAST(N'2022-04-05' AS Date), CAST(N'10:15:00' AS Time), 45462564, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (40, N'45462565/06.04.2022', CAST(N'2022-04-06' AS Date), CAST(N'11:15:00' AS Time), 45462565, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (41, N'45462566/07.04.2022', CAST(N'2022-04-07' AS Date), CAST(N'12:15:00' AS Time), 45462566, 3, CAST(N'2022-04-07' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (42, N'45462567/08.04.2022', CAST(N'2022-04-08' AS Date), CAST(N'13:15:00' AS Time), 45462567, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (43, N'45462568/09.04.2022', CAST(N'2022-04-09' AS Date), CAST(N'14:15:00' AS Time), 45462568, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (44, N'45462569/01.04.2022', CAST(N'2022-04-01' AS Date), CAST(N'15:15:00' AS Time), 45462569, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (45, N'45462570/02.04.2022', CAST(N'2022-04-02' AS Date), CAST(N'16:15:00' AS Time), 45462570, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (46, N'45462571/03.04.2022', CAST(N'2022-04-03' AS Date), CAST(N'10:45:00' AS Time), 45462571, 2, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (47, N'45462572/04.04.2022', CAST(N'2022-04-04' AS Date), CAST(N'11:45:00' AS Time), 45462572, 3, CAST(N'2022-04-04' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (48, N'45462573/05.04.2022', CAST(N'2022-04-05' AS Date), CAST(N'12:45:00' AS Time), 45462573, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (49, N'45462574/06.04.2022', CAST(N'2022-04-06' AS Date), CAST(N'13:45:00' AS Time), 45462574, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (50, N'45462575/07.04.2022', CAST(N'2022-04-07' AS Date), CAST(N'14:45:00' AS Time), 45462575, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (51, N'0/2025-30-30', CAST(N'2025-01-30' AS Date), NULL, 45462526, 1, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (52, N'45462526/2025-32-30', CAST(N'2025-01-30' AS Date), NULL, 45462526, 1, CAST(N'2025-01-14' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (53, N'45462526/2025-39-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (54, N'45462526/2025-40-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (55, N'45462526/2025-41-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (56, N'45462526/2025-41-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (57, N'45462526/2025-46-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (58, N'45462526/2025-46-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, CAST(N'2025-01-06' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (59, N'45462526/2025-47-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (60, N'45462526/2025-54-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, CAST(N'2025-01-02' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (61, N'45462526/2025-54-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, CAST(N'2025-01-01' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (62, N'45462527/2025-57-31', CAST(N'2025-01-31' AS Date), NULL, 45462527, 1, CAST(N'2024-12-30' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (63, N'45462526/2025-59-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, CAST(N'2025-01-02' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (64, N'45462528/2025-59-31', CAST(N'2025-01-31' AS Date), NULL, 45462528, 1, CAST(N'2025-01-02' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (65, N'45462526/2025-09-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, CAST(N'2024-12-30' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (66, N'45462526/2025-12-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, CAST(N'2024-12-30' AS Date))
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (67, N'45462526/2025-44-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (68, N'45462526/2025-48-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (69, N'45462526/2025-49-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (70, N'45462526/2025-51-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (71, N'45462526/2025-51-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (72, N'45462528/2025-52-31', CAST(N'2025-01-31' AS Date), NULL, 45462528, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (73, N'45462526/2025-04-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (74, N'45462526/2025-05-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (75, N'45462526/2025-07-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
INSERT [dbo].[Order] ([IDOrder], [OrderCode], [DateCreated], [OrderTime], [ClientCode], [IDStatus], [CloseDate]) VALUES (76, N'45462526/2025-28-31', CAST(N'2025-01-31' AS Date), NULL, 45462526, 1, NULL)
GO
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (1, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (1, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (1, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (1, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (2, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (2, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (2, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (2, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (2, 123)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (3, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (3, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (3, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (3, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (4, 44)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (4, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (4, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (4, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (4, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (5, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (5, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (5, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (5, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (5, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (5, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (6, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (6, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (6, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (6, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (7, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (7, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (7, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (7, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (7, 123)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (8, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (8, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (8, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (8, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (9, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (9, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (9, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (9, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (10, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (10, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (10, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (10, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (10, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (10, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (11, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (11, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (11, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (11, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (12, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (12, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (12, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (12, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (12, 123)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (13, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (13, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (13, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (14, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (14, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (14, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (14, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (15, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (15, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (15, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (15, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (15, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (15, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (16, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (16, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (16, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (16, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (17, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (17, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (17, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (17, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (17, 123)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (18, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (18, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (18, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (19, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (19, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (19, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (19, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (19, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (20, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (20, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (20, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (20, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (20, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (20, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (21, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (21, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (21, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (22, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (22, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (22, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (22, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (23, 45)
GO
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (23, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (23, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (24, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (24, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (24, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (24, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (25, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (25, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (25, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (25, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (25, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (25, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (26, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (26, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (26, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (26, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (27, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (27, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (27, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (27, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (27, 123)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (28, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (28, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (28, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (29, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (29, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (29, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (29, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (29, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (30, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (30, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (30, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (30, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (30, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (30, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (31, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (31, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (31, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (31, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (32, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (32, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (32, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (32, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (32, 123)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (33, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (33, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (33, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (33, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (34, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (34, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (34, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (34, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (34, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (35, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (35, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (35, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (35, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (35, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (35, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (36, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (36, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (36, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (36, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (37, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (37, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (37, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (37, 123)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (38, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (38, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (38, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (38, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (39, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (39, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (39, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (39, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (39, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (40, 44)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (40, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (40, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (40, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (40, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (40, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (41, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (41, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (41, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (41, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (42, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (42, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (42, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (42, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (42, 123)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (43, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (43, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (43, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (43, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (44, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (44, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (44, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (44, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (44, 92)
GO
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (45, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (45, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (45, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (45, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (45, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (46, 31)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (46, 34)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (46, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (46, 353)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (47, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (47, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (47, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (47, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (47, 123)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (48, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (48, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (48, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (48, 99)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (49, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (49, 57)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (49, 88)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (49, 92)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (49, 123)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (50, 44)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (50, 45)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (50, 89)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (50, 98)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (50, 336)
INSERT [dbo].[OrderService] ([IDOrder], [IDService]) VALUES (50, 353)
GO
INSERT [dbo].[Role] ([IDRole], [NameRole]) VALUES (1, N'Продавец')
INSERT [dbo].[Role] ([IDRole], [NameRole]) VALUES (2, N'Администратор')
INSERT [dbo].[Role] ([IDRole], [NameRole]) VALUES (3, N'Старший смены')
GO
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (31, N'Прокат сноуборда', N'JUR8R', 1200)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (34, N'Прокат обуви для сноуборда', N'JKFBJ09', 400)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (44, N'Прокат коньков', N'DHBGFY563', 450)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (45, N'Прокат защитных подушек для сноубордистов', N'JFH7382', 300)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (57, N'Подъем на 1 уровень', N'JHVSJF6', 300)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (88, N'Подъем на 2  уровень', N'DJHGBS982', 700)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (89, N'Прокат очков для лыжников', N'OIJNB12', 150)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (92, N'Прокат санок', N'HJBUJE21J', 300)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (98, N'Прокат шлема', N'63748HF', 300)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (99, N'Прокат вартушки', N'BSFBHV63', 100)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (123, N'Подъем на 3 уровень', N'638VVNQ3', 1200)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (336, N'Прокат лыж', N'8HFJHG443', 800)
INSERT [dbo].[Service] ([ID], [NameService], [CodeService], [PriceHour]) VALUES (353, N'Прокат лыжных палок', N'87FDJKHJ', 100)
GO
INSERT [dbo].[Status] ([IDStatus], [Status]) VALUES (1, N'Новая')
INSERT [dbo].[Status] ([IDStatus], [Status]) VALUES (2, N'В прокате')
INSERT [dbo].[Status] ([IDStatus], [Status]) VALUES (3, N'Закрыта')
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([IDRole])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Employee] FOREIGN KEY([UserLogin])
REFERENCES [dbo].[Employee] ([Login])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Employee]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientCode])
REFERENCES [dbo].[Client] ([ClientCode])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([IDStatus])
REFERENCES [dbo].[Status] ([IDStatus])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Order] FOREIGN KEY([IDOrder])
REFERENCES [dbo].[Order] ([IDOrder])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Order]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Service] FOREIGN KEY([IDService])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Service]
GO
USE [master]
GO
ALTER DATABASE [BlogodatKIA] SET  READ_WRITE 
GO
