USE [master]
GO
/****** Object:  Database [unisexShop]    Script Date: 12/23/2022 1:16:27 AM ******/
CREATE DATABASE [unisexShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'unisexShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\unisexShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'unisexShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\unisexShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [unisexShop] SET QUERY_STORE = OFF
GO
USE [unisexShop]
GO
/****** Object:  Table [dbo].[account]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[blog]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[category]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[color]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[custommer]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[location]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[order]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[orderDetails]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[pages]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[product]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[roles]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[shipper]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[size]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[transactStatus]    Script Date: 12/23/2022 1:16:27 AM ******/
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
/****** Object:  Table [dbo].[userEvaluation]    Script Date: 12/23/2022 1:16:27 AM ******/
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

INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (1, N'DIOR VÀ CHANEL “ĐỐI ĐẦU” TRÊN SÂN KHẤU BORN PINK CỦA BLACKPINK', N'https://bazaarvietnam.vn/wp-content/uploads/2022/12/BLACKPINK-world-tour-347x260.jpg', N'abc', N'1         ', CAST(N'2022-12-19T16:47:38.760' AS DateTime), CAST(N'2022-12-19T16:47:38.760' AS DateTime), 1, 1, 1, NULL, N'Hiện tại, tour lưu diễn BORN PINK của nhóm BLACKPINK đã đến Paris. Là một trong bốn kinh đô thời trang lớn nhất thế giới, 
đêm diễn ở Paris hẳn phải nhận được sự quan tâm đặc biệt. Và kết quả là sự kiện hi hữu khi Dior và Chanel cùng xuất hiện chung trên một sân khấu, khi hai thương hiệu thời trang cao cấp này may đo phục trang biểu diễn cho các đại sứ Jennie và Jisoo BLACKPINK. Jennie hiện là đại sứ toàn cầu cho Chanel. Việc thiết kế một phục trang biểu diễn cho world tour BORN PINK như cách Chanel chào mừng Jennie BLACKPINK đến Paris biểu diễn. World tour BORN PINK dừng chân hai ngày ở Paris. Và Chanel cũng thiết kế hai mẫu phục trang khác nhau cho Jennie. Trên trang mạng xã hội cá nhân, Jennie hào hứng khoe bộ trang phục cho sân khấu solo ở Paris. Được biết từ đầu tới chân Jennie đều là những thiết kế do chính Giám đốc sáng tạo Chanel Virginie Viard thực hiện riêng cho cô.')

INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (4, N'5 THIẾT KẾ CÔNG TRÍ ĐƯỢC TRUYỀN THÔNG MỸ BẦU CHỌN VÀO TOP BEST DRESSED', N'https://bazaarvietnam.vn/wp-content/uploads/2022/12/5-my-nhan-hollywood-toa-sang-trong-thiet-ke-cua-cong-tri-bia-347x260.jpeg', N'abc', N'2         ', CAST(N'2022-12-19T16:47:38.760' AS DateTime), CAST(N'2022-12-19T16:47:38.760' AS DateTime), 1, 1, 1, NULL, N'Kendall Jenner được biết là người thích trao cơ hội cho các nhà thiết kế tiềm năng. Vì vậy, tại buổi dạ tiệc LACMA Art + Film 2022, người mẫu không chọn hàng hiệu nổi tiếng, ngược lại xuất hiện trong nguyên set từ nhà thiết kế người Pháp gốc Thổ Nhĩ Kỳ Burca Akyol.

Nàng mẫu đắt giá nhất hành tinh luôn biết cách tỏa sáng vóc dáng theo cách riêng. Điểm nhấn nằm ở phần trên của bộ trang phục được làm bằng lưới trong suốt màu đen và vòng một chỉ được che chắn với hai mảnh vải táo bạo. Đối với nửa trên đầy quyến rũ này, Kendall đã chọn một chiếc váy cùng thương hiệu có phần lưng hạ thấp giúp nhấn nhá phần hông quả táo. Ở độ tuổi tứ tuần, Paris Hilton khoe vóc dáng thon gọn và săn chắc đáng ghen tị khi bước cùng chồng trên thảm đỏ LACMA. Nữ doanh nhân mặc một chiếc váy lấp lánh với phần vạt áo được xếp nếp cầu kỳ cố tình để lộ eo. Bộ cánh gợi nhớ đến thiết kế cô đã mặc khi kết show Versace Xuân Hè 2023. Nữ ca sỹ của Stars Are Blind đã chọn phụ kiện tối đa để phù hợp với vẻ quyến rũ của chiếc váy của cô, bao gồm hoa tai kim cương và vòng tay bạc xếp chồng lên nhau.')

INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (5, N'Tin BDỰ SHOW JACQUEMUS XUÂN HÈ 2023, JENNIE MẶC ĐẦM MAY ĐO RIÊNG', N'https://bazaarvietnam.vn/wp-content/uploads/2022/12/jennie-blackpink-jacquemus-xuan-he-2023-00-thumb-347x260.jpg', N'abc', N'3         ', CAST(N'2022-12-19T16:47:38.760' AS DateTime), CAST(N'2022-12-19T16:47:38.760' AS DateTime), 1, 1, 1, NULL, N'Chuyến lưu diễn toàn cầu BORN PINK của nhóm BLACKPINK đã hạ cánh Bắc Mỹ. Các cô gái vừa có hai đêm diễn bùng nổ ở thành phố Dallas của tiểu bang Texas.

Như thường lệ, những buổi diễn của BLACKPINK luôn là sự kết hợp giữa âm nhạc và thời trang. Từ khi bốn cô gái diễn show ở Seoul, hội fan BLINK đã mau chóng điểm danh hàng hiệu được BLACKPINK sử dụng trên sân khấu. Các cô gái liên tục thay đổi phong cách trên sân khấu. Lúc thì lấp lánh với phục trang dát pha lê và sequin. Lúc lại tươi trẻ với chân váy thể thao Adidas và hoodie BORN PINK. Trong số các bộ cánh biểu diễn từ Jennie BLACKPINK, đáng chú ý là set đồ phong cách balletcore. Cô diện chiếc váy mini cột dây (wrap dress) giống kiểu chân váy được các vũ công mặc trong phòng tập. Chân mang đôi vớ giữ ấm ống chân (leg warmer) cũng là một phụ kiện khác cần thiết cho những buổi tập. Vẻ thể thao của các item này được cân bằng với chất liệu tulle xếp tầng nữ tính.

Cách diện đồ phong cách balletcore của Jennie BLACKPINK là ý tưởng hay cho những ai muốn thử nghiệm với phong cách thời trang này mà không muốn trông quá “bánh bèo”.')

INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (28, N'JISOO LÀM MỚI ÁO CORSET VERSACE VỚI THỦ THUẬT ĐƠN GIẢN', N'https://bazaarvietnam.vn/wp-content/uploads/2022/11/jisoo-blackpink-ao-corset-versace-born-pink-world-tour-blackpink-00-thumb-347x260.jpg', N'abc', N'4         ', CAST(N'2022-11-04T00:00:00.000' AS DateTime), CAST(N'2019-01-01T00:00:00.000' AS DateTime), 0, 1, 1, NULL, N'Hailey Bieber, J Balvin cùng nhiều sao quốc tế tham dự buổi tiệc khai trương cửa hàng Pop Up mùa lễ hội và Tiffany Café của Tiffany & Co. Khi giám đốc sáng tạo Virginie Viard giới thiệu bộ sưu tập Chanel Xuân Hè 2023 ở Grand Palais Éphémère, hàng ghế đầu không thể thiếu hai nữ đại sứ thân thiết của nhà mốt nước Pháp là Kristen Stewart và Jennie Kim của nhóm BLACKPINK.

Hai nữ đại sứ trò chuyện thân thiết khi an tọa ở front row. Kristen Stewart khoác lên mình một bộ cánh phong cách grunge với áo jumper kẻ sọc, chân váy mini, bốt da bóng loáng và trang sức mắt xích. Từ khi xác nhận giới tính, nữ diễn viên Spencer đã không còn chuộng thời trang quá nữ tính.')

INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (30, N'MIN, ISAAC, JUN PHẠM CỰC CHẤT VỚI DENIM CALVIN KLEIN THU ĐÔNG 2022', N'https://bazaarvietnam.vn/wp-content/uploads/2022/12/dan-sao-dinh-dam-hoi-tu-tai-su-kien-denim-thu-dong-2022-cua-calvin-klein-bia-347x260.png', N'abc', N'5         ', CAST(N'2019-05-25T00:00:00.000' AS DateTime), CAST(N'2018-05-06T00:00:00.000' AS DateTime), 1, 1, 1, NULL, N'Ngày 02/12 vừa qua, Calvin Klein tổ chức sự kiện tôn vinh, đánh dấu một kỷ nguyên mới của Denim tại TTTM Crescent Mall, Thành phố Hồ Chí Minh. Khi giám đốc sáng tạo Virginie Viard giới thiệu bộ sưu tập Chanel Xuân Hè 2023 ở Grand Palais Éphémère, hàng ghế đầu không thể thiếu hai nữ đại sứ thân thiết của nhà mốt nước Pháp là Kristen Stewart và Jennie Kim của nhóm BLACKPINK.

Hai nữ đại sứ trò chuyện thân thiết khi an tọa ở front row. Kristen Stewart khoác lên mình một bộ cánh phong cách grunge với áo jumper kẻ sọc, chân váy mini, bốt da bóng loáng và trang sức mắt xích. Từ khi xác nhận giới tính, nữ diễn viên Spencer đã không còn chuộng thời trang quá nữ tính.')

INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (33, N'SAU LISA BLACKPINK, MAI DAVIKA LÀ MỸ NHÂN NGƯỜI THÁI KẾ TIẾP BẮT TAY CÙNG BULGARI', N'https://bazaarvietnam.vn/wp-content/uploads/2022/11/mai-davika-tro-thanh-friend-of-bulgari-high-jewelry-eden-the-garden-of-wonders-05.jpg', N'abc', N'6         ', CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-08-09T00:00:00.000' AS DateTime), 0, 1, 1, NULL, N'Mai Davika đang thu hút sự quan tâm của giới thời trang và trang sức cao cấp. Hôm trước vừa được Gucci mời tham dự sự kiện ra mắt BST trang sức cao cấp, hôm nay lại được tuyên bố là người bạn thân của thương hiệu Bulgari tại khu vực Đông Nam Á. 
Mai Davika không khỏi bồi hồi: “Từ lâu tôi đã ngưỡng mộ thương hiệu kinh điển Bulgari và hôm nay, giấc mơ của tôi trở thành sự thật. Thật vinh dự khi trở thành người bạn thân của thương hiệu ở khu vực Nam Á – Thái Bình Dương. Hôm nay đánh dấu một chương mới trong hành trình của tôi”. Màn hợp tác của Mai Davika và Bulgari được thông báo tại sự kiện trình làng bộ sưu tập trang sức cao cấp Eden: The Garden of Wonder tại Bangkok, Thái Lan. Nữ diễn viên xuất hiện trong bộ cánh Zuhair Murad trang nhã, làm nổi bật set trang sức nạm toàn ngọc rubellite thuộc họ đá bích tỷ quý giá.')

INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (35, N'PHẢI CÓ CHO DỊP LỄ HỘI: TÚI XÁCH ĐÍNH ĐÁ LẤP LÁNH', N'https://bazaarvietnam.vn/wp-content/uploads/2022/11/tui-xach-dinh-da-versace-la-medusa-thu-dong-2022-347x260.jpg', N'abc', N'7         ', CAST(N'2020-08-07T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime), 1, 1, 1, NULL, N'Chiếc túi xách đính đá pha lê có sức hút vượt thời gian không kém gì các mẫu túi da thuộc cổ điển. Trong khi đó, đối lập với Kristen Stewart, Jennie của nhóm BLACKPINK lại yểu điệu thục nữ với chiếc đầm terry cloth đến từ BST Chanel Resort 2023. Bộ móng của Jennie được tô vẽ color block với các gam màu từ chính chiếc đầm của cô.

Phong cách bất đối xứng là điểm nhấn chính của bộ cánh Jennie mặc: đầm lệch vai, bông tai một bên. Thậm chí mái tóc cột cao với hoa sơn trà trắng biểu tượng của Chanel cũng được cài lệch một bên. Bề ngoài thời thượng của Jennie khiến các fan trầm trồ và cũng ngay lập tức lọt top trending các mạng xã hội.')

INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (37, N'GIẢI MÃ DRESS CODE CỦA TIỆC HARPER’S BAZAAR STAR AWARDS 2022', N'https://bazaarvietnam.vn/wp-content/uploads/2022/11/BZ-Lan-Phuong-ava-347x260.jpg', N'abc', N'8         ', CAST(N'2019-03-04T00:00:00.000' AS DateTime), CAST(N'2019-09-09T00:00:00.000' AS DateTime), 1, 1, 1, NULL, N'Nữ diễn viên của Thương ngày nắng về từng học trường chuyên và Đại học Ngoại Thương. Cô ghi điểm tại Hanoi International Film Festival bởi khả năng ngoại ngữ lưu loát. Đêm tiệc ngập tràn trong vô vàn các loại hoa cùng hòa quyện với ánh đèn sắc hồng, tím chủ đạo làm cả một không gian lung linh tựa như lạc trong một vườn hồng hoàng gia. Khách mời còn được thưởng thức rượu vang hồng Donnafugata Dolce&Gabbana Rosa đến từ miền Tây Sicily xa xôi. Với vị chát nhẹ, hương thơm nồng nàn, khi kết hợp với những món ăn tinh tế trên nền nhạc acoustic Ý du dương với đàn harp, cello cùng nhiều loại nhạc cụ khác đã mang đến những giây phút thư giãn; tạo nên những cảm xúc khó tả và không thể nào quên.

Phần hai của chương trình được khuấy động bởi DJ nổi tiếng David De Barce. Anh khiến toàn bộ không gian khu vườn và khu vực hồ bơi hoa hồng như trở thành một bar sang trọng, lộng lẫy, độc đáo.')

INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (38, N'HAI TẠO HÌNH ĐỐI LẬP CỦA ANGELABABY TẠI LỄ TRAO GIẢI KIM KÊ 2022', N'https://bazaarvietnam.vn/wp-content/uploads/2022/11/angelababy-le-trao-giai-kim-ke-2022-00-thumb-347x260.jpg', N'abc', N'9         ', CAST(N'2018-06-23T00:00:00.000' AS DateTime), CAST(N'2019-08-07T00:00:00.000' AS DateTime), 1, 1, 1, NULL, N'Angelababy (Dương Dĩnh) chứng tỏ vẻ đẹp mặn mà của "gái một con ngó mòn con mắt". Trong khi đó, đối lập với Kristen Stewart, Jennie của nhóm BLACKPINK lại yểu điệu thục nữ với chiếc đầm terry cloth đến từ BST Chanel Resort 2023. Bộ móng của Jennie được tô vẽ color block với các gam màu từ chính chiếc đầm của cô.

Phong cách bất đối xứng là điểm nhấn chính của bộ cánh Jennie mặc: đầm lệch vai, bông tai một bên. Thậm chí mái tóc cột cao với hoa sơn trà trắng biểu tượng của Chanel cũng được cài lệch một bên. Bề ngoài thời thượng của Jennie khiến các fan trầm trồ và cũng ngay lập tức lọt top trending các mạng xã hội.')
INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (39, N'H’HEN NIÊ DIỆN THỜI TRANG SÂN BAY KHOE VÒNG EO 59CM, PHỐI PHỤ KIỆN DIOR CÁ TÍNH', N'https://bazaarvietnam.vn/wp-content/uploads/2022/11/ava1-347x260.jpg', N'abc', N'10        ', CAST(N'2018-06-30T00:00:00.000' AS DateTime), CAST(N'2019-12-07T00:00:00.000' AS DateTime), 1, 1, 1, NULL, N'H''Hen Niê có chuyến công tác tại Singapore trong vài ngày tới, cô sẽ xuất hiện với dàn sao đình đám quốc tế. Kể từ khi ra mắt, dòng nước hoa Eau Sauvage của Dior vẫn luôn gắn liền với hình ảnh mạnh mẽ, phóng khoáng, có chút nổi loạn của nam diễn viên Johnny Depp. Sốt nhiều năm liền, Johnny Depp đã trở thành tượng đài, là gương mặt thương hiệu của chiến dịch Eau Sauvage.

Tuy nhiên, trước những thay đổi của thị trường làm đẹp, Dior đã quyết định đổi mới chiến lược, muốn trẻ hoá thương hiệu vẫn giữ được tinh thần vốn có của dòng nước hoa. Cuối năm 2021, thương hiệu đã chọn Kylian Mbappé, cầu thủ trẻ đáng gờm nhất hiện nay, là gương mặt đại diện cho chiến dịch Eau Sauvage Elixir.'.)
INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (41, N'HƯƠNG GIANG ĐEO TÚI XÁCH HÀNG HIỆU PHÁP MANG TÊN SÀI GÒN', N'https://bazaarvietnam.vn/wp-content/uploads/2022/10/huong-giang-tui-xach-goyard-saigon-structured-00-thumb-347x260.jpg', N'abc', N'11        ', CAST(N'2018-08-18T00:00:00.000' AS DateTime), CAST(N'2019-09-19T00:00:00.000' AS DateTime), 1, 1, 1, NULL, N'Không nhiều thương hiệu cao cấp chế tác sản phẩm lấy cảm hứng từ Việt Nam. Nhưng trong số các sản phẩm hiếm hoi mang tên Hòn ngọc Viễn Đông, có một mẫu thiết kế được khao khát vì rất khó đặt mua. Đó là chiếc túi xách Goyard Saigon. Kể từ khi ra mắt, dòng nước hoa Eau Sauvage của Dior vẫn luôn gắn liền với hình ảnh mạnh mẽ, phóng khoáng, có chút nổi loạn của nam diễn viên Johnny Depp. Sốt nhiều năm liền, Johnny Depp đã trở thành tượng đài, là gương mặt thương hiệu của chiến dịch Eau Sauvage.

Tuy nhiên, trước những thay đổi của thị trường làm đẹp, Dior đã quyết định đổi mới chiến lược, muốn trẻ hoá thương hiệu vẫn giữ được tinh thần vốn có của dòng nước hoa. Cuối năm 2021, thương hiệu đã chọn Kylian Mbappé, cầu thủ trẻ đáng gờm nhất hiện nay, là gương mặt đại diện cho chiến dịch Eau Sauvage Elixir.')
INSERT [dbo].[blog] ([blogID], [title], [image], [author], [accountID], [createDate], [modifyDate], [isHot], [isNewfeed], [published], [listImage], [Contents]) VALUES (42, N'CÁCH PHỐI ĐỒ VỚI QUẦN PARACHUTE ĐẸP CHUẨN IT GIRL', N'https://bazaarvietnam.vn/wp-content/uploads/2022/10/cach-phoi-do-voi-quan-parachute-00-thumb-347x260.jpg', N'abc', N'12        ', CAST(N'2017-05-14T00:00:00.000' AS DateTime), CAST(N'2018-07-19T00:00:00.000' AS DateTime), 1, 1, 1, NULL, N'Làm sao phối đồ đẹp với xu hướng quần parachute? Hãy cùng tham khảo những bí quyết từ Khánh Linh, Tú Hảo, TyhD Thùy Dương...Trong khi đó, đối lập với Kristen Stewart, Jennie của nhóm BLACKPINK lại yểu điệu thục nữ với chiếc đầm terry cloth đến từ BST Chanel Resort 2023. Bộ móng của Jennie được tô vẽ color block với các gam màu từ chính chiếc đầm của cô.

Phong cách bất đối xứng là điểm nhấn chính của bộ cánh Jennie mặc: đầm lệch vai, bông tai một bên. Thậm chí mái tóc cột cao với hoa sơn trà trắng biểu tượng của Chanel cũng được cài lệch một bên. Bề ngoài thời thượng của Jennie khiến các fan trầm trồ và cũng ngay lập tức lọt top trending các mạng xã hội.')
SET IDENTITY_INSERT [dbo].[blog] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([catId], [catName], [description], [Levels], [Odering], [Published], [Thumb]) VALUES (2, N'Áo khoác', N'áo khoác', NULL, 1, 1, N'ao-khoac.jpg')
INSERT [dbo].[category] ([catId], [catName], [description], [Levels], [Odering], [Published], [Thumb]) VALUES (3, N'Áo len', N'<b>Đây là một cái áo len <u>cực kì đẹp</u></b>', NULL, 2, 1, N'ao-len.png')
INSERT [dbo].[category] ([catId], [catName], [description], [Levels], [Odering], [Published], [Thumb]) VALUES (4, N'Áo khoác', N'áo khoác', NULL, 1, 1, N'ao-khoac.jpg')
INSERT [dbo].[category] ([catId], [catName], [description], [Levels], [Odering], [Published], [Thumb]) VALUES (5, N'Áo polo', N'<b>Đây là một cái áo len <u>cực kì đẹp</u></b>', NULL, 2, 1, N'ao-len.png')
INSERT [dbo].[category] ([catId], [catName], [description], [Levels], [Odering], [Published], [Thumb]) VALUES (6, N'Áo thun', N'Áo thun', NULL, 3, 1, NULL)
INSERT [dbo].[category] ([catId], [catName], [description], [Levels], [Odering], [Published], [Thumb]) VALUES (7, N'Áo hoodie', N'Áo hoodie', NULL, 4, 1, NULL)
INSERT [dbo].[category] ([catId], [catName], [description], [Levels], [Odering], [Published], [Thumb]) VALUES (8, N'Sweater', N'Sweater', NULL, 5, 1, NULL)
INSERT [dbo].[category] ([catId], [catName], [description], [Levels], [Odering], [Published], [Thumb]) VALUES (9, N'Sơ mi', N'Sơ mi', NULL, 6, 1, NULL)
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
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (216, N'Áo thun đen hình sói Hades', NULL, 200000, NULL, 0, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/3a/d4/41/08a54a2f156aae94cfb8b6ecae724f01.jpg', N'https://media3.scdn.vn/img3/2019/8_5/O4mZhL.jpg', NULL, N'Áo chất liệu thun lạnh, khi có ánh sáng chiếu vào áo các họa tiết trong áo sẽ chiếu lại ánh sáng', N'Một chiếc áo thun cá tính sẽ làm nổi bật bạn giữa bao nhiêu người')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (217, N'Unisex Trái tim', NULL, 120000, NULL, 0, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/0c/71/fa/f4f6f25d798557643e3b8d28cf70ebcc.jpg', N'https://dongphuchaianh.com/wp-content/uploads/2022/05/ao-thun-unisex-hinh-trai-tim-an-tuong.jpg', NULL, N'Áo chất liệu thun mền, họa tiết trái tim', N'Áo thun có họa tiết chữ hình trái tim, chất chơi, cá tính')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (218, N'Unisex girl cartoon', NULL, 120000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://image.voso.vn/users/vosoimage/images/a57e89c8cfa8cb194bd83fd3321ee2b6?t%5B0%5D=compress%3Alevel%3D100&accessToken=5bcad5f2ee83295ed43559ee74a67042f67dcfc264963a37884359a44e3946fc', N'https://image.voso.vn/users/vosoimage/images/a57e89c8cfa8cb194bd83fd3321ee2b6?t%5B0%5D=compress%3Alevel%3D100&accessToken=5bcad5f2ee83295ed43559ee74a67042f67dcfc264963a37884359a44e3946fc', NULL, N'NULLÁo chất liệu thun lạnh, có họa tiết dễ thương, cổ tròn', N'Áo thun màu xanh lá, có họa tiết cô gái dễ thương')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (219, N'Unisex loang màu', NULL, 120000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/a0/f3/a6/9a8c27f07b135cb2b4539bc45666450b.jpg', N'https://cf.shopee.vn/file/eb5424d6e3398241a5966b4c06e2ab90', NULL, N'Áo chất liệu thun lạnh, cá tính', N'Áo thun có họa tiết phối màu loang lỗ phù hợp cả nam và nữ')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (220, N'Áo thun Cheap', NULL, 120000, NULL, 0, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/10a5f59d6a0476f5fff34850d1f034de', N'https://cf.shopee.vn/file/c223cffa805c69445da2937508a37c56', NULL, N'Áo chất liệu thun dày,cổ tròn, unisex', N'Áo thun có họa tiết phối màu loang lỗ phù hợp cả nam và nữ')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (221, N'Áo thun đen đơn giản', NULL, 120000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://cdn2.yame.vn/pimg/ao-thun-co-tron-toi-gian-m7-0020769/c96b4b6e-a933-7300-ed74-0018ff091363.jpg?w=540&h=756', N'https://cf.shopee.vn/file/15e1cdd3edaeb499d242d4a2bae89318', NULL, N'Thun cổ tròn tối giản', N'Áo thun trơn, phù hợp với mọi người')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (222, N'Áo jacket Yinxx', NULL, 350000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/3a/cd/84/38ae939efac64e7088cbbd8a5cf04643.jpg', N'https://yinxx.vn/wp-content/uploads/2021/05/ao-khoac-du-jacket-ulzzang.jpg', NULL, N'Áo khoác gió phong cách', N'Áo khoác nữ form rộng
Chất liệu : gió 2 lớp
Màu sắc như hình')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (223, N'Áo jacket phát sáng', NULL, 350000, NULL, 0, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/66/9c/da/00376c76cd29e19431fdaeb2996579a7.jpg', N'https://cf.shopee.vn/file/af5f6cfcab09a08a18640485485d4fa6', NULL, N'Áo khoác gió 2 lớp', N'áo khoác trơn, unisex')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (224, N'Khoác dù ABJ', NULL, 200000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/7f/09/00/287188ba7468fee68c11d3c3d052174c.jpg', N'https://cf.shopee.vn/file/c9aa0729a912c9b99406de2179402b54', NULL, N'ÁO KHOÁC DÙ BOMBER NAM NỮ UNISEX HOTTREND THỜI TRANG HÀN QUỐC 2021 MẪU MỚI NHẤT HIỆN NAY', N'thoáng mát, giúp bạn thoải mái khi vận động. Sản phẩm được may đo cẩn thận, tỉ mỉ. Màu sắc đậm đà, tươi trẻ nhằm tạo sự trẻ trung cho người mặc')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (225, N'Áo khoác Beecost', NULL, 350000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/1b/82/3f/c78e742eaa6c528e07974114ba2c1fce.jpg', N'https://salt.tikicdn.com/cache/280x280/ts/product/17/b1/10/66016b1e4ca6122917fdc67cab4cd8b7.jpg', NULL, N'Áo khoác bomber jacket dù 2 lớp form rộng unisex thu đông nam nữ bóng style bóng chày 3 màu kiểu hàn quốc', N'️Chất vải mềm mại, bền đẹp, không bai xù

️Áo khoác bomber jacket cực kỳ dễ phối đồ')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (226, N'Áo khoác in chữ cá tính', NULL, 300000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/88/36/5e/5f8192be13075c5f3b933c1969fdd1d3.jpg', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsr9gtm3bxZyxJRc0hGb9HDFb2fgmPyf8k30iCriXNXsvknBk52fuKgaAHADNVA4m8bGY&usqp=CAU', NULL, N'Áo có họa tiết hình chữ, phong cách thời thượng', N'Vải somi dày, phong cách, thời thượng ')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (227, N'Áo hoodies phối chữ', NULL, 300000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/7dfd806ad116e13d57e8bdee6a45bf5b', N'https://lzd-img-global.slatic.net/g/p/a276e4621d994c6a65506bda5d02ff4c.jpg_720x720q80.jpg_.webp', NULL, N'Áo vải nỉ có mũ', N'Áo Hoodie Notimitate, bao ngầu, vải nỉ siêu giữ ấm mùa đông')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (228, N'Áo hoodies jujutsu kaisen', NULL, 300000, NULL, 0, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://ae04.alicdn.com/kf/H33927a89ef3448688e4f30aa50699f18m.jpg', N'https://vn-test-11.slatic.net/p/9c6a371affca8c616da093bc8fc8a9a2.jpg', NULL, N'Áo vải nỉ 2 lớp, dày dặn, có mũ lớn', N'Áo Hoodie Notimitate, bao ngầu, vải nỉ siêu giữ ấm mùa đông')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (229, N'Áo khoác dù ulzzang', NULL, 200000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/750x750/ts/product/d5/1f/67/d6f908e21c6dc343b59e999cdd3125b9.jpg.webp', N'https://cf.shopee.vn/file/470c72a754808586e0749eaf949f1b36', NULL, N'Xuất xứ Việt Nam', N'Áo khoác ulzzang unisex bigsize')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (230, N'Áo khoác tecki', NULL, 200000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/36c5cd054feeb41f68c762ce538e07fb', N'https://cf.shopee.vn/file/b8dd144cf4dc9b979881d11704ee7d25', NULL, N'Xuất xứ Quảng Châu', N'Áo phù hợp với thời tiết lạnh, phong cách')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (231, N'Áo kaki lót sọc caro', NULL, 350000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/b6/c0/87/9893e48aa01848e4b16957128ee93497.jpg', N'https://cf.shopee.vn/file/1efd08116a532e69f3e945d8955fa74a', NULL, N'Xuất xứ Quảng Châu', N'Áo phù hợp với thời tiết lạnh, phong cách')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (232, N'Áo khoác ngoài bomber', NULL, 200000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/5d/fc/80/d751b04550f7b7d248d7a95830a7636d.jpg', N'https://cf.shopee.vn/file/9cac73252936b70592b23c0b580aa3e7', NULL, N'Xuất xứ Quảng Châu', N'️Chất vải mềm mại, bền đẹp, không bai xù

️Áo khoác bomber jacket cực kỳ dễ phối đồ')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (233, N'Áo khoác freesize', NULL, 200000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/e3d29dce2abe1915274d79329bcdc59c', N'https://cf.shopee.vn/file/ca934c8ba977528571ace497c5c56d97', NULL, N'Xuất xứ Việt Nam, vải kaki', N'Chất vải dày dặn, ấm, phong cách')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (234, N'Áo khoác Bigo', NULL, 200000, NULL, 0, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/7d/5c/f9/50974b51f43a5626d69d6490820c209c.jpg', N'https://cf.shopee.vn/file/4c30af62d24813566ef201821ad7bf3f', NULL, N'Xuất xứ hàn Quốc', N'Áo khoác bomber cho nữ nhung tăm CHOOSE bóng chày cute hàn quốc')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (235, N'Áo khoác sơ mi sọc caro', NULL, 200000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/25/b2/6d/d7ffbbe5353b6c62568659c4735bf9a4.jpg', N'https://cf.shopee.vn/file/7b958bf3cdfb1e89570eb7cac9b20869', NULL, N'Áo sơ mi unisex form rộng - somi nam nữ sọc số ', N'Áo đen với đường kẽ trắng tạo nên sự mạnh mẽ cá tính')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (236, N'Áo sơ mi Unisex phối 2 màu', NULL, 150000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/6f/48/42/fa69affef574ecaceb8cac0c54c04962.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/3c/67/a1/155d0fc29fb9b6e0f2c254d2ee6abd34.jpg', NULL, N'Áo sơ mi unisex form rộng - somi nam nữ phối 2 màu', N'chất liệu kate dày dặn được lựa chọn kĩ lưỡng để phù hợp với mọi hoàn cảnh.
Thiết kế Unisex sẽ mang đến một outfit năng động và cá tính dù không cần mix-match cầu kì.')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (237, N'Áo sơ mi nhung tăm', NULL, 150000, NULL, 0, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://salt.tikicdn.com/cache/750x750/ts/product/21/5a/52/f6f478efa359399898bb92dcd6c7a3c5.jpg.webp', N'https://salt.tikicdn.com/cache/200x280/ts/product/2f/8b/a3/01c99aeb2a7069e6d6a2ac4a3b535922.jpg', NULL, N'Áo Sơ Mi Nhung TĂM Unisex Form Rộng - Áo Sơ Mi Nam Nữ phong cách Ulzzang Hàn Quốc dáng rộng', N'Áo Sơ Mi Nhung TĂM Unisex Form Rộng - Áo Sơ Mi Nam Nữ phong cách Ulzzang Hàn Quốc dáng rộng

Chất liệu: Vải phủ nhung tăm dày dặn')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (238, N'Áo sơ mi butterfly', NULL, 150000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/ea/47/cf/6656bc2f113916146e471db57c2567de.jpg', N'https://vn-test-11.slatic.net/p/1568d0d5e08df19b97acff8710e9ebb3.jpg', NULL, N'Áo sơ mi bướm HSU1 TTPM', N'Chất Thô có hai màu in hình bướm ,áo sơ mi ngắn tay')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (239, N'Áo sơ mi tay lỡ viền nổi', NULL, 150000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/7d/78/3d/a37fd070f2a57e7cea0f324c784e7e79.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/32/08/94/7dcb83cbd7e03d6e65267e5b15a8cee5.jpg', NULL, N'Áo Sơ Mi Nam Tay Lỡ Viền Chỉ Nổi Phong Cách Unisex 2 màu Đen Trắng', N'Vải : cotton thái')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (240, N'Áo Sơ mi Universe', NULL, 150000, N'1                                                                                                   ', 0, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 1, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/e0/ff/db/814487548565a7a9d3ddaef184acda4e.jpg', N'https://media3.scdn.vn/img4/2021/03_20/dQahZlDnVTP1OnsWA9FY_simg_de2fe0_500x500_maxb.jpg', NULL, N'Áo sơ mi nam nữ in hình VỆ TINH cực hot', N'Chất liệu: Lụa

• Màu sắc: Đa dạng, phong phú')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (241, N'Áo sơ mi hoạt hình Universe', NULL, 150000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/35/61/c5/06196cd4d6122bb6fc10600dec2ab778.jpg', N'https://vn-test-11.slatic.net/p/6322766c2ed569b01a4a6f738cf2dfbd.jpg', NULL, N'Áo sơ mi nam Husky truyện tranh kiểu siêu hot', N'Form Regular-Fit thoải mái, trẻ trung vừa phải phù hợp với mọi dáng người')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (242, N'Áo sơ mi túi bảng to', NULL, 150000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'	https://cf.shopee.vn/file/77328a482ce8b811f099bad93d5c6635', N'https://cf.shopee.vn/file/c93682eab780834a5f784d9653bd5351', NULL, N'ÁO SƠ MI CỘC TAY ĐEN TRẮNG UNISEX', N'Thành phần nguyên liệu: Cotton')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (243, N'Áo sơ mi tay lỡ phối túi hộp', NULL, 150000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/d4c0422e843b5f2bd721ac7bb19f6a89', N'https://cf.shopee.vn/file/c93682eab780834a5f784d9653bd5351', NULL, N'Áo Sơ Mi Ulzzang Tay Lỡ Túi Hộp ZHILIAGHO Vải Kaki Cotton Đẹp Và Thoáng Mát', N'Thông tin Áo Sơ Mi Tay Nam Lỡ Túi Hộp ZHILIAGHO Unisex:')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (244, N'Sơ mi tay lỡ phối vai', NULL, 150000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'	https://cf.shopee.vn/file/19f12d2e43b3224d2c2ee1bcebbcbcf2', N'https://cf.shopee.vn/file/0412409df596238101bbea6a0a6a7d07', NULL, N'Áo sơ mi ngắn tay thời trang hàn quốc dành cho nam', N'Cổ áo truyền thống, mẫu trơn, kiểu dáng áo rộng')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (245, N'Sweeter Sugil', NULL, 180000, NULL, 0, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/4c/fe/cb/2a1d589e341186fa5818049b8a4f1f4c.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/b1/b2/8a/7720baebfc14e33ef8fcca6f65b09bff.jpg', NULL, N'Áo Sweater Sugirl Nỉ Ngoại Unisex Nam Nữ Xinh Áo Swt Tay Phồng Chất Nỉ Đẹp, Áo sweater unisex form siêu rộng, áo nỉ in hình họa tiết chữ ngang ngực form rộng unisex, áo nỉ form rộng chất nỉ bông dày ảnh tự chụp', N'Form rộng Unisex Nam Nữ Couple đều mặc được.

Cam kết: Chất lượng và Mẫu mã Sản phẩm giống với Hình ảnh')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (246, N'Sweeter họa tiết bánh mì', NULL, 180000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://bizweb.dktcdn.net/100/345/647/products/f9624f6cf1f717a94ee6.jpg?v=1573534874027', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/345/647/products/9655904e2ed5c88b91c4.jpg', NULL, N'Áo Sweater Baguette', N'Form rộng Unisex Nam Nữ Couple đều mặc được.

Cam kết: Chất lượng và Mẫu mã Sản phẩm giống với Hình ảnh')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (247, N'Sweeter chỉ nổi', NULL, 180000, NULL, 0, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'	https://cf.shopee.vn/file/c9f2e256c65c7d4bcbbddca02f9762f5', N'https://vn-live-01.slatic.net/p/a569e7181216cd0ae2a0f94941902cfa.jpg', NULL, N'Áo khoác nỉ bông sweater form rộng họa tiết số ngược dành cho nam nữ - BoBo Store', N'Áo khoác nỉ bông sweater form rộng họa tiết số ngược dành cho nam nữ - BoBo Store, tay dài')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (248, N'Sweeter layer Cookie', NULL, 180000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/0d/d4/bd/e4a6bee460690823f71a9012315d96bc.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/00/7a/dc/6c318e6f533f1f9708db691b9f4dd19a.jpg', NULL, N'ÁO SWEATER Gấu Hello, Áo Nỉ Thụng Tay Phồng ', N'Áo khoác nỉ bông sweater form rộng họa tiết số ngược dành cho nam nữ - BoBo Store, tay dài')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (249, N'Sweeter Harry', NULL, 180000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/d9/c7/0f/fb7c1704fc3d2406f3d1c4e34f55ec78.jpg', N'https://lzd-img-global.slatic.net/g/p/73fd5b5ba007cf598a9ff738050a3415.jpg_720x720q80.jpg_.webp', NULL, N'Áo sweater tay dài chữ harypotter', N'Áo khoác nỉ bông sweater form rộng họa tiết số ngược dành cho nam nữ - BoBo Store, tay dài')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (250, N'Sweeter VietNam', NULL, 180000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://d2kp3z9dlcgkqf.cloudfront.net/nrasdzke/products/61971d8a255347df5d6ea789/den/-rBUpIe7oG/regular.jpg', N'https://cf.shopee.vn/file/sg-11134201-22110-8zga7r9pcujv67', NULL, N'Áo nỉ sweater nam nữ thắng cảnh Việt Nam', N'Áo khoác nỉ bông sweater form rộng họa tiết số ngược dành cho nam nữ - BoBo Store, tay dài')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (251, N'Sweeter HaNoi', NULL, 180000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/750x750/ts/product/99/a3/c8/7e3cf3ab2682581b2006de8ca4a9a45a.jpg.webp', N'https://vn-test-11.slatic.net/p/088cd81fd413020e6a0017bb6bacdb39.jpg', NULL, N'Áo Hoodie Sweater chất NỈ under Hà Nội, ÁO phom Rộng 100% Cotton Nam Nữ Unisex', N'Được thiết kế với form dễ mặc, giúp bạn vừa thể hiện phong cách thời trang của mình, vừa thoải mái trong mọi hoạt động, mang lại sự tự tin trước những người xung quanh.')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (252, N'Sweeter nỉ', NULL, 180000, N'1                                                                                                   ', 0, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/a2/61/57/0f7d58027b922edfc2ebf4dc3046339a.jpg', N'https://yinxx.vn/wp-content/uploads/2021/12/ao-ni-sweater-cap-doi-nam-nu-form-rong-yinxx.jpg', NULL, N'Áo nỉ sweater cặp đôi nam nữ Yinxx, áo tay dài nỉ bông unisex form rộng SWT812', N'Form rộng Unisex Nam Nữ Couple đều mặc được.

Cam kết: Chất lượng và Mẫu mã Sản phẩm giống với Hình ảnh')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (253, N'Áo polo sọc', NULL, 130000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://cf.shopee.vn/file/4d971c8b8f50bcd201d9b27e49a7cf0d', N'https://dongphuchaianh.vn/wp-content/uploads/2022/03/ao-polo-unisex-nam-dep.jpg', NULL, N'Áo thun Lovito cổ polo kẻ sọc phong cách đi học', N'Áo phối màu đen trắng, năng động, dễ phối đồ')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (254, N'Áo polo DRWH', NULL, 130000, NULL, 0, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/73c9ec4b299f874548a8c68dbc0474b6', N'https://vn-live-01.slatic.net/p/de50b16a6c5e507711551b696aed0a92.jpg_1500x1500q80.jpg', NULL, N'Áo Thun Ngắn Tay Dáng Rộng Có Cổ Thời Trang Mùa Hè', N'Áo tay lửng, có cổ, họa tiết chữ đơn giản')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (255, N'Áo polo Dmplus', NULL, 130000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/cec2ed9e853bb7084a4af88f53574946', N'https://cf.shopee.vn/file/178c8b79041bb95ac307a1016c4680d8', NULL, N'Áo thun có cổ ,áo polo form rộng tay lỡ chữ dập nổi ', N'Áo tay lửng, có cổ, họa tiết chữ đơn giản')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (256, N'Áo polo sọc to', NULL, 130000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'	https://cf.shopee.vn/file/a25f4effe7e63206fb9bbcae26e65d88', N'https://bucket.nhanh.vn/store/25618/artCT/86074/ao_polo_unisex_(1).png', NULL, N'Áo polo cộc tay Unisex Jack Lane giá sốc', N'Thun 100% Cotton cao cấp, thấm hút mồ hôi rất tốt, thoáng mát, bề mặt vải mịn, ko xù, ko gião')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (257, N'Áo polo TSUN', NULL, 130000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/b36c003555d536da99ee8434a9e7f6b1', N'https://cf.shopee.vn/file/sg-11134201-22110-frk7j7oavwjv09', NULL, N'Áo Thun Có Cổ , Áo Phông Polo Chất Liệu 100% Cotton Mát Mịn Thấm Hút Mồ Hôi.', N'Áo phong cách Hàn Quốc, trẻ trung, năng động, tối giản, dễ phối đồ')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (258, N'Áo polo Snazyy', NULL, 130000, N'1                                                                                                   ', 0, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://bucket.nhanh.vn/store3/93650/ps/20210918/z2772360717202_32cf16e1bcc36ba1e364f9e4bc524b32.jpg', N'https://dosi-in.com/images/detailed/475/dosiin-snazzy-ao-polo-nam-thun-co-be-vai-cotton-unisex-phong-cach-snazzy-inseparable-polo-475367475367.jpg', NULL, N'Áo có cổ, tay ngắn, xuất xứa Hàn Quốc', N'Áo phong cách Hàn Quốc, trẻ trung, năng động, tối giản, dễ phối đồ')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (259, N'Áo polo Einsinght', NULL, 130000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://hazomi.com/wp-content/uploads/2022/08/8523779211532ac97dc8b92555d65e22.jpg', N'https://hazomi.com/wp-content/uploads/2022/08/da2a0ef2f73f624719d5334b489c821a.jpg', NULL, N'Áo Polo Einsicht Cotton Cá Sấu Form Rộng Nam Nữ Unisex / Áo Thun Polo Oversize Có Cổ Tay Lỡ Local Brand', N'Áo Polo Einsicht Cotton Cá Sấu Form Rộng Nam Nữ Unisex / Áo Thun Polo Oversize Có Cổ Tay Lỡ Local Brand
Áo Polo EINSICHT Cotton Form Rộng Nam Nữ Unisex')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (260, N'Áo polo Weuseery', NULL, 130000, NULL, 1, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/75d7f76053bc7ba5c1525d9afb29a2e8', N'https://salt.tikicdn.com/cache/280x280/ts/product/34/40/0c/edeb07191236abf8ab5476a1c848de25.jpg', NULL, N'Áo Polo Seery Dáng Thụng Nam Nữ Tay Phối Kẻ 2 Màu', N'Cổ áo truyền thống, mẫu trơn, kiểu dáng áo rộng')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (261, N'Áo polo Hiddle', NULL, 130000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/75161077834024bd10e7bcb2c1467eab', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/399/392/products/2-1.jpg', NULL, N'Áo polo nam cao cấp HÀNG THIẾT KẾ, áo thun nam có cổ chính hãng', N'Áo Polo Einsicht Cotton Cá Sấu Form Rộng Nam Nữ Unisex / Áo Thun Polo Oversize Có Cổ Tay Lỡ Local Brand
Áo Polo EINSICHT Cotton Form Rộng Nam Nữ Unisex')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (262, N'Áo polo tay lỡ Hàn Quốc', NULL, 130000, NULL, 1, CAST(N'2022-12-19T13:55:34.000' AS DateTime), CAST(N'2022-12-19T14:18:39.953' AS DateTime), 1, 1, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/7f/f5/9e/6aa090096eb01f4cf017934087bb67aa.jpg', N'https://cf.shopee.vn/file/2b3f0f261dc0a452836496040bd34ef7', NULL, N'Áo polo unisex có phối logo trước ngực, chất cotton mền và mát ', N'Một chiếc áo thun cá tính sẽ làm nổi bật bạn giữa bao nhiêu người')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (263, N'Áo hoodies Essential', NULL, 130000, NULL, 0, CAST(N'2022-12-19T14:44:53.267' AS DateTime), CAST(N'2022-12-19T14:44:53.263' AS DateTime), 0, 0, 1, 12, N'https://cf.shopee.vn/file/7058cc707f616eb65e46edec37c0c21b', N'https://cf.shopee.vn/file/7a6b271f5b7ac10659297e457b2e09fb', NULL, N'Áo Hoodie chữ Essential form rộng hoodie nam nữ', N'Nhắc đến những trang phục cực hot của phong cách đường phố, áo Hoodie và Sweater luôn được xướng tên đầu tiên. 
Item này đã hơn một lần tạo nên “cơn sốt” trong làng thời trang. ')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (264, N'Áo hoodies hoạt họa khủng long', NULL, 120000, N'1                                                                                                   ', 1, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 0, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/2e/f6/b6/c6e9e449828e116f8a78cb10f253ee40.jpg', N'https://cf.shopee.vn/file/e9a1464780d98ef4ef9b9c32ce8e02b8', NULL, N'ÁO KHOÁC HOODIE NAM NỮ CÁ TÍNH', N'Mẫu mã đẹp, kiểu dáng mới lạ, thiết kế độc đáo

Có đủ size phù hợp với mọi kiểu dáng')
INSERT [dbo].[product] ([id_sp], [name], [cateID], [price], [status], [discount], [dateCreate], [dateModified], [bestSeller], [homeFlag], [active], [unitslnStock], [thumb], [image], [video], [shortDescrip], [Descrip]) VALUES (265, N'Áo hoodies THIS FACLY', NULL, 100000, N'1                                                                                                   ', 0, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 1, 0, 1, 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/6b/c5/53/4dce97c1b6527690e767efad318fdf69.jpg', N'https://salt.tikicdn.com/cache/w1200/ts/product/df/1e/a1/d2bd28db6ea3ec34aebe7104bf17d84f.jpg', NULL, N'Áo Hoodie Form Rộng ULLANG', N'Mẫu mã đẹp, kiểu dáng mới lạ, thiết kế độc đáo

Có đủ size phù hợp với mọi kiểu dáng')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([roleID], [roleName], [description]) VALUES (1, N'Admin', N'Quản trị viên')
INSERT [dbo].[roles] ([roleID], [roleName], [description]) VALUES (2, N'Staff', N'Nhân viên')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[size] ON 

INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 7, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 8, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 9, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 10, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 11, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 12, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 13, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 14, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 15, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 16, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 17, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 18, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 19, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 20, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 21, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 22, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 23, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 24, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 25, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 26, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 27, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 28, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 29, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 30, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 31, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 32, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 33, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 34, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 35, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 36, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 37, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 38, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 39, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 40, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 41, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 42, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 43, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 44, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 45, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 46, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 47, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 48, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 49, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 50, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 51, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 52, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 53, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 54, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 55, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 56, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 57, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 58, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 59, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 60, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 61, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 62, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 63, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 64, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 65, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 66, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 67, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 68, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 69, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 70, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 71, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 72, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 73, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 74, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 75, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 76, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 77, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 78, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 79, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 80, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 81, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 82, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 83, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 84, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 85, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 86, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 87, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 88, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 89, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 90, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 91, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 92, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 93, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 94, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 95, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 96, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 97, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 98, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 99, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 100, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 101, N'L         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 102, N'XL        ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 103, N'S         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 104, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 105, N'L         ')
GO
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 106, N'M         ')
INSERT [dbo].[size] ([id_sp], [id_size], [nameSize]) VALUES (NULL, 107, N'L         ')
SET IDENTITY_INSERT [dbo].[size] OFF
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
