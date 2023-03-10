USE [master]
GO
/****** Object:  Database [unisexShop]    Script Date: 12/20/2022 5:14:34 PM ******/
CREATE DATABASE [unisexShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'unisexShop', FILENAME = N'D:\App\SQL\MSSQL15.MSSQLSERVER01\MSSQL\DATA\unisexShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'unisexShop_log', FILENAME = N'D:\App\SQL\MSSQL15.MSSQLSERVER01\MSSQL\DATA\unisexShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [unisexShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [unisexShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [unisexShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [unisexShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [unisexShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [unisexShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [unisexShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [unisexShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [unisexShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [unisexShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [unisexShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [unisexShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [unisexShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [unisexShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [unisexShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [unisexShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [unisexShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [unisexShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [unisexShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [unisexShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [unisexShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [unisexShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [unisexShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [unisexShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [unisexShop] SET RECOVERY FULL 
GO
ALTER DATABASE [unisexShop] SET  MULTI_USER 
GO
ALTER DATABASE [unisexShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [unisexShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [unisexShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [unisexShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [unisexShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [unisexShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'unisexShop', N'ON'
GO
ALTER DATABASE [unisexShop] SET QUERY_STORE = OFF
GO
USE [unisexShop]
GO
/****** Object:  Table [dbo].[account]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[AccountID] [char](10) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[RoleID] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[blogID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](150) NULL,
	[image] [nvarchar](250) NULL,
	[author] [nvarchar](150) NULL,
	[accountID] [char](10) NULL,
	[createDate] [datetime] NULL,
	[modifyDate] [datetime] NULL,
	[isHot] [bit] NOT NULL,
	[isNewfeed] [bit] NOT NULL,
	[published] [bit] NOT NULL,
	[listImage] [nvarchar](max) NULL,
	[Contents] [nvarchar](max) NULL,
 CONSTRAINT [PK_blog] PRIMARY KEY CLUSTERED 
(
	[blogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[catId] [int] IDENTITY(1,1) NOT NULL,
	[catName] [nvarchar](250) NULL,
	[description] [nvarchar](max) NULL,
	[Levels] [int] NULL,
	[Odering] [int] NULL,
	[Published] [bit] NOT NULL,
	[Thumb] [nvarchar](250) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[catId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[id_sp] [int] NOT NULL,
	[id_color] [int] IDENTITY(1,1) NOT NULL,
	[color_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED 
(
	[id_color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[custommer]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custommer](
	[CustommerID] [char](10) NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[Birthday] [datetime] NULL,
	[Avatar] [nvarchar](255) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[LocationID] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[Password] [nvarchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_custommer] PRIMARY KEY CLUSTERED 
(
	[CustommerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Conscious] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustommerID] [char](10) NOT NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[TransactStatusID] [int] NULL,
	[Deleted] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
	[PaymentDate] [datetime] NULL,
	[Note] [nvarchar](255) NULL,
	[orderDetailsID] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[OrderNumber] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	[Total] [int] NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_orderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pages]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](50) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Published] [bit] NOT NULL,
	[CreateAt] [datetime] NULL,
	[Ordering] [int] NULL,
 CONSTRAINT [PK_pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id_sp] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[cateID] [int] NULL,
	[price] [float] NULL,
	[status] [char](100) NULL,
	[discount] [float] NULL,
	[dateCreate] [datetime] NULL,
	[dateModified] [datetime] NULL,
	[bestSeller] [bit] NOT NULL,
	[homeFlag] [bit] NOT NULL,
	[active] [bit] NOT NULL,
	[unitslnStock] [int] NULL,
	[thumb] [varchar](255) NULL,
	[image] [nvarchar](max) NULL,
	[video] [nvarchar](max) NULL,
	[shortDescrip] [nvarchar](250) NULL,
	[Descrip] [nvarchar](max) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id_sp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipper]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipper](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](250) NULL,
	[Phone] [nchar](10) NULL,
	[Company] [nvarchar](150) NULL,
 CONSTRAINT [PK_shipper] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[id_sp] [int] NULL,
	[id_size] [int] IDENTITY(1,1) NOT NULL,
	[nameSize] [char](10) NOT NULL,
 CONSTRAINT [PK_size] PRIMARY KEY CLUSTERED 
(
	[id_size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactStatus]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactStatus](
	[TransactStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Descripsion] [nvarchar](max) NULL,
	[ShipperID] [int] NULL,
 CONSTRAINT [PK_transactStatus] PRIMARY KEY CLUSTERED 
(
	[TransactStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userEvaluation]    Script Date: 12/20/2022 5:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userEvaluation](
	[id_danhgia] [int] IDENTITY(1,1) NOT NULL,
	[id_sp] [int] NULL,
	[AccountID] [char](10) NULL,
	[point] [float] NULL,
	[message] [nvarchar](255) NULL,
	[evaluationDate] [datetime] NULL,
 CONSTRAINT [PK_userEvaluation] PRIMARY KEY CLUSTERED 
(
	[id_danhgia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([AccountID], [Phone], [Email], [Password], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (N'ac123001  ', N'0123041', N'abc@gmail.com', N'123', 1, N'Nguyễn Văn A', 1, CAST(N'2012-12-01T00:00:00.000' AS DateTime), CAST(N'2001-12-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[blog] ON 

INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (1, N'tin A', NULL, N'abc', NULL, NULL, NULL, 1, 1, 1, NULL, N'Ở mỗi mùa thời trang, luôn có những xu hướng lớn nhất và những xu hướng nhỏ hơn. Cho mùa Xuân Hè 2023, Harper’s Bazaar ghi nhận những xu hướng thời trang dự kiến sẽ có sức ảnh hưởng nhất. Đa phần là sự kéo dài hoặc biến chuyển của những xu hướng trước đây. Tuy nhiên cũng có những phong cách mới lạ hoàn toàn ít ai lường trước, ví dụ như Mermaidcore. Dù có nhiều khác biệt thì có điểm chung các xu hướng lớn đều đề cao việc phô diễn vẻ đẹp vóc dáng và cá tính riêng.

Có vẻ như bộ phim live action Nàng tiên cá của Disney chưa ra mắt đã gây xôn xao giới thời trang. Những phục trang gợi nhắc đến cuộc sống bí ẩn dưới đáy đại dương trở thành một xu hướng thời trang lớn trên sàn diễn Xuân Hè 2023. Tất nhiên thì những lựa chọn này cũng rất hợp với thời trang may đo sẵn, do chúng ta thường có xu hướng thích đi biển vào mùa nắng ấm.

 Phom dáng tiên cá. Từ trái sang: Fendi, Alberta Ferretti, Versace, Burberry. Ảnh: ImaxTree
Nói đến ma thuật của biển khơi, hình ảnh những nàng tiên cá xuất hiện đầu tiên trong tâm trí chúng ta. Những chiếc đầm có thân trên ôm sát và đuôi loe rộng miêu tả vẻ đẹp lả lơi của những nàng tiên cá. Chắc chắn trong mùa Xuân Hè 2023, một xu hướng thời trang lớn sẽ là Mermaidcore – cảm hứng thời trang từ tiên cá.

Cảm hứng biển khơi không bị giới hạn trong chỉ những chiếc đầm thướt tha. Chất liệu như vỏ sò, sequin hay vải lurex lấp lánh tựa vây cá, vải sóng sánh như nước… cho thấy những cách biến chuyển xu hướng thời trang Xuân Hè 2023 này.

 Cách cấu tạo bề mặt gợi nhớ đến biển khơi. Ảnh: ImaxTree
Chất liệu hot trên sàn diễn mùa này là lamé và lurex, trông như kim loại nung chảy từ xa. Chất liệu lamé có thể xem như một biến tấu nhỏ từ phong cách Y2K, vì nó vốn thịnh hành vào thập niên 1990–2000.

Chất liệu ánh kim tất nhiên không thể thay thế độ lấp lánh của sequin và pha lê. Tuy nhiên, mùa Xuân Hè 2023 chứng kiến sự kết hợp giữa chất liệu xuyên thấu và những mảng đính kết lấp lánh. Vẫn rất gợi cảm nhưng vẫn đủ trang trọng cho những buổi tiệc.

')
INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (4, N'tin A', NULL, N'abc', NULL, NULL, NULL, 1, 1, 1, NULL, N'<p>acbasclkajc</p>')
INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (5, N'Tin B', N'tin-b.png', N'abc', NULL, CAST(N'2022-12-19T16:47:38.760' AS DateTime), CAST(N'2022-12-19T16:47:38.760' AS DateTime), 1, 1, 1, NULL, N'<p>ádascascascasc</p>')
SET IDENTITY_INSERT [dbo].[blog] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([catId], [catName], [description], [Levels], [Odering], [Published], [Thumb]) VALUES (2, N'Áo khoác', N'áo khoác', NULL, 1, 1, N'ao-khoac.jpg')
INSERT [dbo].[category] ([catId], [catName], [description], [Levels], [Odering], [Published], [Thumb]) VALUES (3, N'Áo len', N'<b>Đây là một cái áo len <u>cực kì đẹp</u></b>', NULL, 2, 1, N'ao-len.png')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
INSERT [dbo].[custommer] ([CustommerID], [FullName], [Birthday], [Avatar], [Email], [Phone], [LocationID], [CreateDate], [Password], [LastLogin], [Active], [Address]) VALUES (N'ct1239012 ', N'abc', CAST(N'1911-01-01T00:00:00.000' AS DateTime), NULL, N'abc@gmail.com', N'0921312', 2, CAST(N'2012-12-12T00:00:00.000' AS DateTime), N'123', CAST(N'2012-12-12T00:00:00.000' AS DateTime), 1, N'abc/abc')
GO
SET IDENTITY_INSERT [dbo].[location] ON 

INSERT [dbo].[location] ([LocationID], [Conscious]) VALUES (2, N'Bình Dương')
SET IDENTITY_INSERT [dbo].[location] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([OrderID], [CustommerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [Note], [orderDetailsID]) VALUES (1, N'ct1239012 ', CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-12-15T22:56:00.000' AS DateTime), 2, 0, 1, NULL, N'<p>không có</p>', NULL)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[orderDetails] ON 

INSERT [dbo].[orderDetails] ([OrderDetailsID], [ProductID], [OrderNumber], [Quantity], [Discount], [Total], [ShipDate]) VALUES (4, 8, 1, 1, 1, 120000, CAST(N'2022-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[orderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[pages] ON 

INSERT [dbo].[pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [CreateAt], [Ordering]) VALUES (2, N'Hướng dẫn thanh toán', N'abcxyz...', N'huong-dan-thanh-toan.jpg', 1, NULL, 2)
SET IDENTITY_INSERT [dbo].[pages] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (8, N'Áo Khoác', 2, 120000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'ao-khoac.jpg', NULL, NULL, N'aokhoac', N'23123123123')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (10, N'Áo Khoác 1', 2, 120000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'ao-khoac-1.jpg', NULL, NULL, N'aokhoac', N'sadascdsacac')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([roleID], [roleName], [description]) VALUES (1, N'Admin', N'Quản trị viên')
INSERT [dbo].[roles] ([roleID], [roleName], [description]) VALUES (2, N'Staff', N'Nhân viên')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[transactStatus] ON 

INSERT [dbo].[transactStatus] ([TransactStatusID], [Status], [Descripsion], [ShipperID]) VALUES (1, N'Đang giao', N'abc', NULL)
INSERT [dbo].[transactStatus] ([TransactStatusID], [Status], [Descripsion], [ShipperID]) VALUES (2, N'Đã giao', NULL, NULL)
SET IDENTITY_INSERT [dbo].[transactStatus] OFF
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_roles2] FOREIGN KEY([RoleID])
REFERENCES [dbo].[roles] ([roleID])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_roles2]
GO
ALTER TABLE [dbo].[color]  WITH CHECK ADD  CONSTRAINT [FK_color_product] FOREIGN KEY([id_sp])
REFERENCES [dbo].[product] ([id_sp])
GO
ALTER TABLE [dbo].[color] CHECK CONSTRAINT [FK_color_product]
GO
ALTER TABLE [dbo].[custommer]  WITH CHECK ADD  CONSTRAINT [FK_custommer_location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[location] ([LocationID])
GO
ALTER TABLE [dbo].[custommer] CHECK CONSTRAINT [FK_custommer_location]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_custommer] FOREIGN KEY([CustommerID])
REFERENCES [dbo].[custommer] ([CustommerID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_custommer]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_orderDetails] FOREIGN KEY([orderDetailsID])
REFERENCES [dbo].[orderDetails] ([OrderDetailsID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_orderDetails]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_transactStatus] FOREIGN KEY([TransactStatusID])
REFERENCES [dbo].[transactStatus] ([TransactStatusID])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_transactStatus]
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD  CONSTRAINT [FK_orderDetails_product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([id_sp])
GO
ALTER TABLE [dbo].[orderDetails] CHECK CONSTRAINT [FK_orderDetails_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([cateID])
REFERENCES [dbo].[category] ([catId])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[size]  WITH CHECK ADD  CONSTRAINT [FK_size_product] FOREIGN KEY([id_sp])
REFERENCES [dbo].[product] ([id_sp])
GO
ALTER TABLE [dbo].[size] CHECK CONSTRAINT [FK_size_product]
GO
ALTER TABLE [dbo].[transactStatus]  WITH CHECK ADD  CONSTRAINT [FK_transactStatus_shipper] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[shipper] ([ShipperID])
GO
ALTER TABLE [dbo].[transactStatus] CHECK CONSTRAINT [FK_transactStatus_shipper]
GO
ALTER TABLE [dbo].[userEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_userEvaluation_product] FOREIGN KEY([id_sp])
REFERENCES [dbo].[product] ([id_sp])
GO
ALTER TABLE [dbo].[userEvaluation] CHECK CONSTRAINT [FK_userEvaluation_product]
GO
USE [master]
GO
ALTER DATABASE [unisexShop] SET  READ_WRITE 
GO
