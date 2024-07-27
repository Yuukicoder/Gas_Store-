USE [master]
GO
/****** Object:  Database [Gas_Management_Final]    Script Date: 27/07/2024 19:53:06 ******/
CREATE DATABASE [Gas_Management_Final]

USE [Gas_Management_Final]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[administratorID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[lastLogin] [datetime] NULL,
	[isActive] [bit] NOT NULL,
	[roleID] [int] NOT NULL,
	[email] [varchar](100) NULL,
	[img] [nvarchar](max) NULL,
	[adminName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[administratorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](max) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [ntext] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](100) NULL,
	[password] [varchar](100) NULL,
	[created] [datetime] NULL,
	[lastLogin] [datetime] NULL,
	[status] [bit] NULL,
	[gender] [bit] NULL,
	[image] [nvarchar](max) NULL,
	[firstName] [nvarchar](max) NULL,
	[lastName] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[phone] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[totalMoney] [money] NULL,
	[isCustomer] [bit] NULL,
	[totalPoint] [int] NULL,
	[memberShipTier] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[discountID] [int] IDENTITY(1,1) NOT NULL,
	[discountCode] [varchar](255) NOT NULL,
	[name] [nvarchar](max) NULL,
	[discountAmount] [decimal](10, 2) NOT NULL,
	[discountType] [varchar](10) NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountUsage]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountUsage](
	[usageID] [int] IDENTITY(1,1) NOT NULL,
	[discountID] [int] NULL,
	[useDate] [date] NULL,
	[orderID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[usageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Context] [nvarchar](max) NULL,
	[StarVoted] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackReply]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackReply](
	[id] [int] NOT NULL,
	[reply] [text] NULL,
	[date] [datetime] NULL,
	[account_id] [int] NULL,
	[feedback_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipTier]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipTier](
	[TierId] [int] IDENTITY(1,1) NOT NULL,
	[TierName] [nvarchar](50) NOT NULL,
	[MinPoints] [int] NOT NULL,
	[MaxPoints] [int] NULL,
	[DiscountPercentage] [decimal](5, 2) NOT NULL,
	[BonusPointsRate] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[notiID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[dateSend] [datetime] NOT NULL,
	[isRead] [bit] NOT NULL,
	[isForAdmins] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[notiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationReceiver]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationReceiver](
	[notiReceiverId] [int] IDENTITY(1,1) NOT NULL,
	[notiID] [int] NOT NULL,
	[receiverType] [int] NOT NULL,
	[receiverID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[notiReceiverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [int] NULL,
	[trackingNumber] [int] NULL,
	[totalMoney] [money] NULL,
	[orderDate] [datetime] NOT NULL,
	[shipAddress] [nvarchar](200) NOT NULL,
	[status] [int] NULL,
	[shipVia] [int] NULL,
	[payment] [nvarchar](1) NULL,
	[notes] [ntext] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NULL,
	[unitPrice] [money] NULL,
	[serialID] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[orderHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[status] [varchar](255) NOT NULL,
	[updatedDate] [nvarchar](50) NULL,
 CONSTRAINT [PK__OrderHistory] PRIMARY KEY CLUSTERED 
(
	[orderHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[PaymentMethod] [varchar](50) NULL,
	[PaymentStatus] [varchar](50) NULL,
	[PaymentDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[administratorID] [int] NOT NULL,
	[Title] [nvarchar](2550) NULL,
	[DateCreated] [nvarchar](50) NULL,
	[DateUpdated] [nvarchar](50) NULL,
	[Postbanner] [nvarchar](250) NULL,
	[Context] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[PostCategoryID] [int] NOT NULL,
	[updatedBy] [int] NULL,
 CONSTRAINT [PK__Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostCategory]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCategory](
	[PostCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](2550) NOT NULL,
 CONSTRAINT [PK__PostCategory] PRIMARY KEY CLUSTERED 
(
	[PostCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](max) NOT NULL,
	[name] [nvarchar](max) NULL,
	[keywords] [nvarchar](max) NULL,
	[shortDescription] [nvarchar](max) NULL,
	[description] [ntext] NULL,
	[categoryID] [int] NULL,
	[supplierId] [int] NULL,
	[isActive] [bit] NOT NULL,
	[unitPrice] [money] NULL,
	[image] [varchar](max) NULL,
	[stockQuantity] [int] NULL,
	[unitOnOrders] [int] NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[limit] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImg]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImg](
	[imgID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[Path] [nvarchar](max) NULL,
 CONSTRAINT [PK__ProductImg] PRIMARY KEY CLUSTERED 
(
	[imgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiverType]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiverType](
	[ReceiverTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReceiverTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](100) NULL,
	[name] [nvarchar](max) NULL,
	[description] [ntext] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SerialNumbers]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SerialNumbers](
	[SerialID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[SerialNumber] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SerialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[shipmentID] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [nvarchar](max) NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[status] [bit] NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
(
	[shipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplierId] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[createdDate] [datetime] NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](20) NULL,
	[homePage] [varchar](200) NULL,
	[password] [varchar](240) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[supplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warranties]    Script Date: 27/07/2024 19:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warranties](
	[WarrantyID] [int] IDENTITY(1,1) NOT NULL,
	[SerialID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ReciverDate] [datetime] NULL,
	[DoneDate] [datetime] NULL,
	[CustomerID] [int] NULL,
	[Process_By] [int] NULL,
	[ProofImg] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[expectedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WarrantyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON 

INSERT [dbo].[Administrator] ([administratorID], [userName], [password], [lastLogin], [isActive], [roleID], [email], [img], [adminName]) VALUES (1, N'admin', N'Qua3CCUdJoXNHnIq6rQW/tVqu1M=', CAST(N'2024-07-14T10:47:28.197' AS DateTime), 1, 1, N'vuanh957@gmail.com', N'anno.jpg', N'Admin Vũ Anh')
INSERT [dbo].[Administrator] ([administratorID], [userName], [password], [lastLogin], [isActive], [roleID], [email], [img], [adminName]) VALUES (2, N'staff', N'Qua3CCUdJoXNHnIq6rQW/tVqu1M=', NULL, 1, 2, N'vuanh957@gmail.com', N'avatar.png', N'Staff Vũ Anh')
SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryID], [code], [name], [description]) VALUES (1, N'binh-gas-1', N'Bình gas', N'Bình gas là một thiết bị chứa gas được chế tạo từ vật liệu thép chuyên dụng để bảo quản và giữ an toàn khi lưu trữ, vận chuyển và sử dụng gas.')
INSERT [dbo].[Category] ([categoryID], [code], [name], [description]) VALUES (2, N'bep-gas-2', N'Bếp gas', N'Bếp gas là một loại bếp sử dụng nhiên liệu là khí gas (khí thiên nhiên) để nấu ăn')
INSERT [dbo].[Category] ([categoryID], [code], [name], [description]) VALUES (3, N'do-gia-dung', N'Đồ Gia Dụng', N'Đồ gia dụng là các sản phẩm nội bộ được sử dụng trong nhà như xoong nồi, đồ dùng nhà bếp,...')
INSERT [dbo].[Category] ([categoryID], [code], [name], [description]) VALUES (4, N'bep-tu-dien', N'Bếp từ - Bếp điện', N'Bếp điện hoặc bếp điện từ là một loại bếp chuyển hóa năng lượng điện thành nhiệt để nấu nướng')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerID], [userName], [password], [created], [lastLogin], [status], [gender], [image], [firstName], [lastName], [address], [phone], [email], [totalMoney], [isCustomer], [totalPoint], [memberShipTier]) VALUES (1, N'duc', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=', NULL, NULL, 1, NULL, NULL, N'huy', N'nguyen', NULL, N'0377043909', N'test@gmail.com', NULL, 1, 0, 1)
INSERT [dbo].[Customer] ([customerID], [userName], [password], [created], [lastLogin], [status], [gender], [image], [firstName], [lastName], [address], [phone], [email], [totalMoney], [isCustomer], [totalPoint], [memberShipTier]) VALUES (2, N'minhduc', N'MlYTlk979MIHidcW+wQXgbf2aho=', NULL, NULL, NULL, NULL, N'sky.jpg', N'Minh', N' Duc', N'Ha Noi', N'0984327585', N'haquocminhduc2020@gmail.com', NULL, NULL, 0, 1)
INSERT [dbo].[Customer] ([customerID], [userName], [password], [created], [lastLogin], [status], [gender], [image], [firstName], [lastName], [address], [phone], [email], [totalMoney], [isCustomer], [totalPoint], [memberShipTier]) VALUES (3, N'Customer', N'Qua3CCUdJoXNHnIq6rQW/tVqu1M=', CAST(N'2024-07-24T00:00:00.000' AS DateTime), NULL, 1, 1, N'avatar.png', N'vu', N'anh 123', N'ha noi', N'0708366689', N'vuanh957@gmail.com', NULL, 1, 292, 2)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([discountID], [discountCode], [name], [discountAmount], [discountType], [startDate], [endDate], [quantity]) VALUES (1, N'9HKHBY4EMO', N'BLACK FRIDAY', CAST(500000.00 AS Decimal(10, 2)), N'FIXED', CAST(N'2024-07-15' AS Date), CAST(N'2024-07-20' AS Date), 10)
INSERT [dbo].[Discount] ([discountID], [discountCode], [name], [discountAmount], [discountType], [startDate], [endDate], [quantity]) VALUES (2, N'OA3UZK7N6X', N'DISCOUNT 2', CAST(20.00 AS Decimal(10, 2)), N'PERCENT', CAST(N'2024-07-24' AS Date), CAST(N'2024-07-26' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [OrderID], [ProductID], [Title], [Context], [StarVoted], [status]) VALUES (1, 34, 3, N'tốt', N'tốt', 5, 0)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[MembershipTier] ON 

INSERT [dbo].[MembershipTier] ([TierId], [TierName], [MinPoints], [MaxPoints], [DiscountPercentage], [BonusPointsRate]) VALUES (1, N'Bronze', 0, 100, CAST(0.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[MembershipTier] ([TierId], [TierName], [MinPoints], [MaxPoints], [DiscountPercentage], [BonusPointsRate]) VALUES (2, N'Silver', 101, 500, CAST(8.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[MembershipTier] ([TierId], [TierName], [MinPoints], [MaxPoints], [DiscountPercentage], [BonusPointsRate]) VALUES (3, N'Gold', 501, 900, CAST(15.00 AS Decimal(5, 2)), CAST(1.50 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[MembershipTier] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (1, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-14 20:12:11', CAST(N'2024-07-14T20:12:11.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (2, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-14 20:15:50', CAST(N'2024-07-14T20:15:50.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (3, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-14 20:18:34', CAST(N'2024-07-14T20:18:34.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (4, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-14 21:06:59', CAST(N'2024-07-14T21:06:59.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (5, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-14 21:36:32', CAST(N'2024-07-14T21:36:32.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (6, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-14 21:39:49', CAST(N'2024-07-14T21:39:49.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (7, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-15 11:08:41', CAST(N'2024-07-15T11:08:41.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (8, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-15 11:29:32', CAST(N'2024-07-15T11:29:32.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (9, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-16 09:27:45', CAST(N'2024-07-16T09:27:45.000' AS DateTime), 1, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (10, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-16 13:36:42', CAST(N'2024-07-16T13:36:42.000' AS DateTime), 1, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (11, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-16 13:50:56', CAST(N'2024-07-16T13:50:56.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (12, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-16 19:32:43', CAST(N'2024-07-16T19:32:43.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (13, N'Warning: Poor Quality Product', N'<p>Product Bếp Công Nghiệp Sào Rinnai TL 289RI</p>
<p>Taken for warranty exceed the safety limit compared to the total products in stock.</p>
<p>At 2024-07-16 19:34:32', CAST(N'2024-07-16T19:34:32.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (14, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-16 19:40:11', CAST(N'2024-07-16T19:40:11.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (15, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-16 19:49:07', CAST(N'2024-07-16T19:49:07.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (16, N'Warning: Poor Quality Product', N'<p>ProductID: 29</p>
<p>Product Name: Bếp ga đôi Rinnai RV-715Slim</p>
<p>Taken for warranty exceed the safety limit compared to the total products in stock.</p>
<p>At 2024-07-16 19:50:09', CAST(N'2024-07-16T19:50:09.000' AS DateTime), 1, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (17, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-17 00:20:18', CAST(N'2024-07-17T00:20:18.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (18, N'Warning: Poor Quality Product', N'<p>ProductID: 9</p>
<p>Product Name: Bình xám - Van POL</p>
<p>Taken for warranty exceed the safety limit compared to the total products in stock.</p>
<p>At 2024-07-17 00:21:58', CAST(N'2024-07-17T00:21:58.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (19, N'Update status on your warranty', N'<p>Your warranty with Serial Number:  null</p>
<p>Has an update with status: done</p>
<p>Sent time: 2024-07-17 00:23:02', CAST(N'2024-07-17T00:23:02.000' AS DateTime), 0, 0)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (20, N'Update status on your warranty', N'<p>Your warranty with Serial Number:  null</p>
<p>Has an update with status: accepted</p>
<p>Sent time: 2024-07-17 00:30:00', CAST(N'2024-07-17T00:30:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (21, N'Update status on your warranty', N'<p>Your warranty with Serial Number:  null</p>
<p>Has an update with status: accepted</p>
<p>Sent time: 2024-07-17 00:30:05', CAST(N'2024-07-17T00:30:05.000' AS DateTime), 1, 0)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (22, N'Update status on your warranty', N'<p>Your warranty with Serial Number:  null</p>
<p>Has an update with status: done</p>
<p>Sent time: 2024-07-17 00:32:04', CAST(N'2024-07-17T00:32:04.000' AS DateTime), 1, 0)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (23, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-17 00:51:58', CAST(N'2024-07-17T00:51:58.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (24, N'Warning: Poor Quality Product', N'<p>ProductID: 5</p>
<p>Product Name: Bình gas gia đình màu xanh VT</p>
<p>Taken for warranty exceed the safety limit compared to the total products in stock.</p>
<p>At 2024-07-17 00:53:42', CAST(N'2024-07-17T00:53:42.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (25, N'Update status on your warranty', N'<p>Your warranty with Serial Number:  <strong>SN0042</strong></p>
<p>Has an update with status: <strong>done</strong></p>
<p>Sent time: <strong>2024-07-17 00:53:51</strong></p>
', CAST(N'2024-07-17T00:53:51.000' AS DateTime), 1, 0)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (26, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-18 15:24:06', CAST(N'2024-07-18T15:24:06.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (27, N'Warning: Poor Quality Product', N'<p>ProductID: 31</p>
<p>Product Name: BẾP GAS ĐÔI ĐỂ BÀN MẶT KÍNH WINDO 719GL-A</p>
<p>Taken for warranty exceed the safety limit compared to the total products in stock.</p>
<p>At 2024-07-18 15:25:12', CAST(N'2024-07-18T15:25:12.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (28, N'Update status on your warranty', N'<p>Your warranty with Serial Number:  <strong>SN0301</strong></p>
<p>Has an update with status: <strong>done</strong></p>
<p>Sent time: <strong>2024-07-18 15:29:51</strong></p>
', CAST(N'2024-07-18T15:29:51.000' AS DateTime), 1, 0)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (29, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-18 15:34:38', CAST(N'2024-07-18T15:34:38.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (30, N'Warning: Poor Quality Product', N'<p>ProductID: 26</p>
<p>Product Name: Bếp gas mini Namilux NH-P3212PS</p>
<p>Taken for warranty exceed the safety limit compared to the total products in stock.</p>
<p>At 2024-07-18 15:35:50', CAST(N'2024-07-18T15:35:50.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (31, N'Update status on your warranty', N'<p>Your warranty with Serial Number:  <strong>SN0251</strong></p>
<p>Has an update with status: <strong>done</strong></p>
<p>Sent time: <strong>2024-07-18 15:36:37</strong></p>
', CAST(N'2024-07-18T15:36:37.000' AS DateTime), 1, 0)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (32, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-18 15:46:33', CAST(N'2024-07-18T15:46:33.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (33, N'Warning: Poor Quality Product', N'<p>ProductID: 25</p>
<p>Product Name: Bếp gas Namilux NH-041PF</p>
<p>Taken for warranty exceed the safety limit compared to the total products in stock.</p>
<p>At 2024-07-18 15:47:25', CAST(N'2024-07-18T15:47:25.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (34, N'Update status on your warranty', N'<p>Your warranty with Serial Number:  <strong>SN0241</strong></p>
<p>Has an update with status: <strong>done</strong></p>
<p>Sent time: <strong>2024-07-18 15:48:15</strong></p>
', CAST(N'2024-07-18T15:48:15.000' AS DateTime), 1, 0)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (35, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-18 15:59:37', CAST(N'2024-07-18T15:59:37.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (36, N'New Order place', N'<p>Customer huy nguyen</p>
<p>Have made a purchase</p>
<p>At 2024-07-18 16:04:03', CAST(N'2024-07-18T16:04:03.000' AS DateTime), 1, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (37, N'New Order place', N'<p>Customer Minh  Duc</p>
<p>Have made a purchase</p>
<p>At 2024-07-22 21:19:27', CAST(N'2024-07-22T21:19:27.000' AS DateTime), 1, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (38, N'New Order place', N'<p>Customer vu anh</p>
<p>Have made a purchase</p>
<p>At 2024-07-24 01:01:53', CAST(N'2024-07-24T01:01:53.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (39, N'New Order place', N'<p>Customer vu anh</p>
<p>Have made a purchase</p>
<p>At 2024-07-24 01:04:13', CAST(N'2024-07-24T01:04:13.000' AS DateTime), 1, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (40, N'New Order place', N'<p>Customer vu anh 123</p>
<p>Have made a purchase</p>
<p>At 2024-07-26 23:21:32', CAST(N'2024-07-26T23:21:32.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (41, N'New Order place', N'<p>Customer vu anh 123</p>
<p>Have made a purchase</p>
<p>At 2024-07-27 00:11:15', CAST(N'2024-07-27T00:11:15.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (42, N'New Order place', N'<p>Customer vu anh 123</p>
<p>Have made a purchase</p>
<p>At 2024-07-27 00:20:00', CAST(N'2024-07-27T00:20:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (43, N'New Order place', N'<p>Customer vu anh 123</p>
<p>Have made a purchase</p>
<p>At 2024-07-27 00:20:38', CAST(N'2024-07-27T00:20:38.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (44, N'New Order place', N'<p>Customer vu anh 123</p>
<p>Have made a purchase</p>
<p>At 2024-07-27 00:20:56', CAST(N'2024-07-27T00:20:56.000' AS DateTime), 0, 1)
INSERT [dbo].[Notification] ([notiID], [title], [content], [dateSend], [isRead], [isForAdmins]) VALUES (45, N'New Order place', N'<p>Customer vu anh 123</p>
<p>Have made a purchase</p>
<p>At 2024-07-27 00:25:58', CAST(N'2024-07-27T00:25:58.000' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationReceiver] ON 

INSERT [dbo].[NotificationReceiver] ([notiReceiverId], [notiID], [receiverType], [receiverID]) VALUES (1, 20, 1, 2)
INSERT [dbo].[NotificationReceiver] ([notiReceiverId], [notiID], [receiverType], [receiverID]) VALUES (2, 21, 1, 2)
INSERT [dbo].[NotificationReceiver] ([notiReceiverId], [notiID], [receiverType], [receiverID]) VALUES (3, 22, 1, 2)
INSERT [dbo].[NotificationReceiver] ([notiReceiverId], [notiID], [receiverType], [receiverID]) VALUES (4, 25, 1, 2)
INSERT [dbo].[NotificationReceiver] ([notiReceiverId], [notiID], [receiverType], [receiverID]) VALUES (5, 28, 1, 2)
INSERT [dbo].[NotificationReceiver] ([notiReceiverId], [notiID], [receiverType], [receiverID]) VALUES (6, 31, 1, 2)
INSERT [dbo].[NotificationReceiver] ([notiReceiverId], [notiID], [receiverType], [receiverID]) VALUES (7, 34, 1, 2)
SET IDENTITY_INSERT [dbo].[NotificationReceiver] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (3, 1, 2, 320.4000, CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'789 Oak St, Villagetown', 2, 1, N'1', N'Out for delivery')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (4, 1, 2, 400.5000, CAST(N'2024-06-15T00:00:00.000' AS DateTime), N'321 Pine St, Hamletville', 2, 2, N'1', N'Awaiting payment')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (7, 1, 3, 180.3000, CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'147 Birch St, Cityville', 3, 2, N'1', N'Out for delivery, no issues')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (8, 1, 4, 310.0000, CAST(N'2024-07-05T00:00:00.000' AS DateTime), N'258 Spruce St, Townsville', 3, 2, N'1', N'Order being prepared')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (9, 1, 5, 260.7500, CAST(N'2024-07-10T00:00:00.000' AS DateTime), N'369 Redwood St, Villagetown', 3, 2, N'1', N'Pending confirmation')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (10, 1, 5, 295.5000, CAST(N'2024-07-15T00:00:00.000' AS DateTime), N'741 Willow St, Hamletville', 3, 2, N'1', N'Payment issue')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (14, 2, NULL, 490010.0000, CAST(N'2024-07-14T00:00:00.000' AS DateTime), N'Ha Noi', 3, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (15, 2, NULL, 990010.0000, CAST(N'2024-07-14T00:00:00.000' AS DateTime), N'', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (16, 2, NULL, 560010.0000, CAST(N'2024-07-14T00:00:00.000' AS DateTime), N'', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (17, 2, NULL, 495010.0000, CAST(N'2024-07-15T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (18, 2, NULL, 495010.0000, CAST(N'2024-07-15T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (19, 2, NULL, 495010.0000, CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (20, 2, NULL, 2570010.0000, CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (21, 2, NULL, 70010.0000, CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (22, 2, NULL, 950010.0000, CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (23, 2, NULL, 20010.0000, CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (24, 2, NULL, 2570010.0000, CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (25, 2, NULL, 500010.0000, CAST(N'2024-07-17T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (26, 2, NULL, 495010.0000, CAST(N'2024-07-17T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (27, 2, NULL, 499010.0000, CAST(N'2024-07-18T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (28, 2, NULL, 340010.0000, CAST(N'2024-07-18T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (29, 2, NULL, 299010.0000, CAST(N'2024-07-18T00:00:00.000' AS DateTime), N'Ha Noi', 3, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (30, 2, NULL, 1470010.0000, CAST(N'2024-07-18T00:00:00.000' AS DateTime), N'Ha Noi', 4, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (31, 1, NULL, 490010.0000, CAST(N'2024-07-18T00:00:00.000' AS DateTime), N'', 0, NULL, NULL, N'duc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (32, 2, NULL, 490010.0000, CAST(N'2024-07-22T00:00:00.000' AS DateTime), N'Ha Noi', 0, NULL, NULL, N'minhduc')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (33, 3, NULL, 450810.0000, CAST(N'2024-07-24T00:00:00.000' AS DateTime), N'ha noi', 0, NULL, NULL, N'Customer')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (34, 3, NULL, 2287000.0000, CAST(N'2024-07-24T00:00:00.000' AS DateTime), N'ha noi', 3, NULL, NULL, N'Customer')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (35, 3, NULL, 460800.0000, CAST(N'2024-07-26T00:00:00.000' AS DateTime), N'ha noi', 0, NULL, NULL, N'Customer')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (36, 3, NULL, 2231800.0000, CAST(N'2024-07-27T00:00:00.000' AS DateTime), N'ha noi', 0, NULL, NULL, N'Customer')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (37, 3, NULL, 447000.0000, CAST(N'2024-07-27T00:00:00.000' AS DateTime), N'ha noi', 0, NULL, NULL, N'Customer')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (38, 3, NULL, 485000.0000, CAST(N'2024-07-27T00:00:00.000' AS DateTime), N'ha noi', 0, NULL, NULL, N'Customer')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (39, 3, NULL, 447000.0000, CAST(N'2024-07-27T00:00:00.000' AS DateTime), N'ha noi', 0, NULL, NULL, N'Customer')
INSERT [dbo].[Order] ([orderID], [customerID], [trackingNumber], [totalMoney], [orderDate], [shipAddress], [status], [shipVia], [payment], [notes]) VALUES (40, 3, NULL, 920800.0000, CAST(N'2024-07-27T00:00:00.000' AS DateTime), N'ha noi', 0, NULL, NULL, N'Customer')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (3, 4, 36, 80.1000, NULL)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (3, 5, 37, 80.2000, NULL)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (4, 6, 16, 400.5000, NULL)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (7, 9, 36, 180.3000, NULL)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (8, 8, 33, 77.5000, NULL)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (9, 8, 33, 130.3700, NULL)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (10, 8, 37, 295.5000, NULL)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (14, 2, 1, 490000.0000, NULL)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (18, 4, 1, 495000.0000, 31)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (19, 5, 1, 495000.0000, 41)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (20, 29, 1, 2570000.0000, 281)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (21, 17, 1, 70000.0000, 161)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (22, 30, 1, 950000.0000, 291)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (23, 12, 1, 20000.0000, 111)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (24, 29, 1, 2570000.0000, 282)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (25, 9, 1, 500000.0000, 81)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (26, 5, 1, 495000.0000, 42)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (27, 31, 1, 499000.0000, 301)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (28, 26, 1, 340000.0000, 251)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (29, 25, 1, 299000.0000, 241)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (30, 1, 3, 490000.0000, 1)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (31, 1, 1, 490000.0000, 2)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (32, 1, 1, 490000.0000, 3)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (33, 1, 1, 490000.0000, 4)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (34, 3, 5, 495000.0000, 21)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (35, 1, 1, 490000.0000, 5)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (36, 2, 3, 475000.0000, 11)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (36, 4, 1, 495000.0000, 32)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (36, 5, 1, 495000.0000, 43)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (37, 2, 1, 475000.0000, 12)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (38, 2, 1, 475000.0000, 13)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (39, 2, 1, 475000.0000, 14)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [unitPrice], [serialID]) VALUES (40, 5, 2, 495000.0000, 44)
GO
SET IDENTITY_INSERT [dbo].[OrderHistory] ON 

INSERT [dbo].[OrderHistory] ([orderHistoryID], [orderID], [customerID], [status], [updatedDate]) VALUES (1, 14, 2, N'0', N'2024-07-14')
INSERT [dbo].[OrderHistory] ([orderHistoryID], [orderID], [customerID], [status], [updatedDate]) VALUES (2, 15, 2, N'0', N'2024-07-14')
INSERT [dbo].[OrderHistory] ([orderHistoryID], [orderID], [customerID], [status], [updatedDate]) VALUES (3, 16, 2, N'0', N'2024-07-14')
INSERT [dbo].[OrderHistory] ([orderHistoryID], [orderID], [customerID], [status], [updatedDate]) VALUES (4, 14, 2, N'3', N'2024-07-15')
INSERT [dbo].[OrderHistory] ([orderHistoryID], [orderID], [customerID], [status], [updatedDate]) VALUES (5, 29, 2, N'3', N'2024-07-18')
INSERT [dbo].[OrderHistory] ([orderHistoryID], [orderID], [customerID], [status], [updatedDate]) VALUES (6, 30, 2, N'4', N'2024-07-22')
INSERT [dbo].[OrderHistory] ([orderHistoryID], [orderID], [customerID], [status], [updatedDate]) VALUES (7, 34, 3, N'3', N'2024-07-24')
SET IDENTITY_INSERT [dbo].[OrderHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (1, 1, N'test post 1', N'18/06/2024', N'18/06/2024', N'1_ cuoc hop Bo CT.png', N't', N'test post 1', 1, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (2, 1, N'test post 2', N'18/06/2024', N'18/06/2024', N'gia-gas-thang-4-nam-2024-thumb.jpg', N'<p><strong>Ng&agrave;y 1-4-2024, gi&aacute; gas trong trước quay đầu&nbsp;giảm nhẹ 5.000 đối với b&igrave;nh 12kg v&agrave; 18.000 đồng đối với b&igrave;nh 45kg, tương đương mức giảm&nbsp; khoảng 417 đồng/kg.</strong></p>
<p>&nbsp;</p>
<h2><strong>1. Gi&aacute; gas trong nước&nbsp;th&aacute;ng 4-2024 quay đầu giảm</strong></h2>
<p>Chiều 31-3, c&aacute;c doanh nghiệp kinh doanh gas đầu mối như&nbsp;Tổng C&ocirc;ng ty Kh&iacute; Việt Nam (PV GAS), C&ocirc;ng ty CP Dầu kh&iacute; TP.HCM, Tổng C&ocirc;ng ty Gas Petrolimex, C&ocirc;ng ty Dầu kh&iacute; Th&aacute;i B&igrave;nh Dương... đ&atilde; c&oacute; th&ocirc;ng b&aacute;o điều chỉnh gi&aacute; gas b&aacute;n lẻ&nbsp;th&aacute;ng 4-2024.</p>
<p>&nbsp;</p>
<p>Cụ thể, đại diện của c&aacute;c thương hiệu PetroVietnam, Petrolimex, City Gas, VT Gas, Pacific Petro... cho biết, kể từ ng&agrave;y 1-4-2024, gi&aacute; gas b&aacute;n lẻ c&aacute;c sản phẩm b&igrave;nh gas d&acirc;n dụng v&agrave; c&ocirc;ng nghiệp tr&ecirc;n thị trường sẽ được điều chỉnh giảm&nbsp;khoảng 417&nbsp;đồng/kg, tương đương mức giảm&nbsp;5.000 đồng/b&igrave;nh 12kg, 18.000 - 19.000&nbsp;đồng/b&igrave;nh 45kg v&agrave; 21.000 đồng/b&igrave;nh 50kg.</p>
<p>&nbsp;</p>
<p>Đại diện c&aacute;c doanh nghiệp kh&aacute;c như TotalEnergies Việt Nam, C&ocirc;ng ty Super Gas, C&ocirc;ng ty Kh&iacute; Đốt Gia Đ&igrave;nh,...cũng đưa ra th&ocirc;ng b&aacute;o tương tự. Theo đ&oacute;, gi&aacute; gas 12kg của c&aacute;c thương hiệu: Total gaz,&nbsp;<a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/gas-gia-dinh" target="_blank" rel="noopener">Gia Đ&igrave;nh Gas</a>, Siamgas, Hanoi Petro,... đều giảm&nbsp;5.000 đồng c&ograve;n gi&aacute; gas c&ocirc;ng nghiệp 45kg giảm&nbsp;18.000 đồng kể từ ng&agrave;y 1-4-2024.</p>
<p><img src="https://ecom.viettechsmart.com:5020/Media/Images/News/cua-hang-gas-gan-nhat-tphcm-thumb.jpg" alt="Gi&aacute; gas th&aacute;ng 4-2024 giảm nhẹ sau 8 chu kỳ tăng li&ecirc;n tiếp"></p>
<p>Theo đại diện của Chi hội gas Miền Nam, gi&aacute; hợp đồng nhập khẩu (CP) kh&iacute; đốt tự nhi&ecirc;n giao th&aacute;ng 4/2024 đ&atilde; giảm khoảng 17,5 USD/tấn so với th&aacute;ng trước, chốt ở mức 617,5 USD/tấn. Do đ&oacute;,&nbsp;c&aacute;c doanh nghiệp kinh doanh gas đầu mối phải điều chỉnh tăng gi&aacute; b&aacute;n lẻ ở mức tương ứng.</p>
<p>Như vậy, gi&aacute; gas b&aacute;n lẻ trong nước mới ghi nhận chu kỳ giảm đầu ti&ecirc;n&nbsp;sau 8 chu kỳ tăng v&agrave; giữ gi&aacute; li&ecirc;n tiếp kể từ th&aacute;ng 8-2023. T&iacute;nh từ đầu năm 2024, gi&aacute; gas trong nước cũng đ&atilde; ghi nhận 3 chu kỳ tăng li&ecirc;n tiếp với mức tăng 13.000 đồng/b&igrave;nh 12kg.&nbsp;&nbsp;&nbsp;</p>
<blockquote>
<p><em><strong>►Xem th&ecirc;m:&nbsp;</strong><a href="https://gas40.com/tin-tuc/gia-gas-hom-nay.40" target="_blank" rel="noopener">Gi&aacute; gas h&ocirc;m nay: Cập nhật gi&aacute; gas mới nhất hiện nay</a></em></p>
</blockquote>
<p>&nbsp;</p>
<h2><strong>2. Bảng gi&aacute; gas th&aacute;ng 4-2024&nbsp;tại Gas4.0 &amp;more</strong></h2>
<p>Trước t&igrave;nh h&igrave;nh biến động chung của thị&nbsp;trường,&nbsp;<a href="https://gas40.com/" target="_blank" rel="noopener">Gas4.0 &amp;more</a>&nbsp;ch&iacute;nh thức điều chỉnh gi&aacute; gas b&aacute;n lẻ c&aacute;c loại b&igrave;nh gas d&acirc;n dụng v&agrave; c&ocirc;ng nghiệp kể từ ng&agrave;y 1-4-2024. Cụ thể, gi&aacute; gas b&aacute;n lẻ&nbsp;được điều chỉnh tăng 5.000 đồng/b&igrave;nh 12kg v&agrave; 18.000 đồng/b&igrave;nh 45kg.</p>
<p>Tại TP.HCM v&agrave; c&aacute;c tỉnh miền Nam,&nbsp;<a href="https://gas40.com/loai-san-pham/gas/binh-gas-12kg" target="_blank" rel="noopener">gi&aacute; gas 12kg</a>&nbsp;của c&aacute;c thương hiệu Siamgas,&nbsp;PetroVietnam, Saigon Petro, Gia Đ&igrave;nh, Phoenix Gas,&nbsp;Pacific Petro,...dao động ở mức 444.000 - 464.000 đồng/b&igrave;nh. Ri&ecirc;ng&nbsp;gi&aacute; gas c&ocirc;ng nghiệp 45kg&nbsp;thương hiệu Siamgas, Gas4.0; Phoenix Gas, Gia Đ&igrave;nh,...được ấn định ở mức 1.682.000 đồng/b&igrave;nh.</p>
<p><img src="https://ecom.viettechsmart.com:5020/Media/Images/News/gia-gas-thang-4-nam-2024-thumb.jpg" alt="Gi&aacute; gas th&aacute;ng 4 năm 2024 giảm nhẹ 5.000 đồng/b&igrave;nh">​​​​​​</p>
<p><strong>BẢNG GI&Aacute; GAS TH&Aacute;NG 4-2024&nbsp;TẠI GAS4.0 &amp;MORE MIỀN NAM</strong></p>
<hr>
<table border="1" cellspacing="0" cellpadding="4" align="center">
<thead></thead>
<tbody>
<tr>
<td><strong>T&Ecirc;N SẢN PHẨM</strong></td>
<td><strong>TĂNG/GIẢM (VNĐ)</strong></td>
<td><strong>GI&Aacute; NI&Ecirc;M YẾT TẠI MIỀN NAM</strong></td>
</tr>
<tr>
<td>Siamgas 12kg van ngang/đứng</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Super Gas 12kg X&aacute;m</td>
<td><strong>🔻</strong>5.000</td>
<td>444.000</td>
</tr>
<tr>
<td>Phoenix Gas 12kg Xanh</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>Phoenix Gas 12kg&nbsp;Xanh VT</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Phoenix Gas 12kg V&agrave;ng</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh 12kg X&aacute;m</td>
<td><strong>🔻</strong>5.000</td>
<td>444.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh 12kg Đỏ</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh 12kg V&agrave;ng</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh 12kg Xanh</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Pacific Petro 12kg X&aacute;m</td>
<td><strong>🔻</strong>5.000</td>
<td>444.000</td>
</tr>
<tr>
<td>Pacific Petro&nbsp;12kg V&agrave;ng</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>Pacific Petro&nbsp;12kg Cam</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Pacific Petro&nbsp;12kg Đỏ</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>Pacific Petro&nbsp;12kg Xanh VT</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Elf gaz 12.5kg</td>
<td><strong>🔻</strong>5.000</td>
<td>487.000</td>
</tr>
<tr>
<td>Saigon Petro 12kg</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>PetroVietnam 12kg X&aacute;m</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;444.000</td>
</tr>
<tr>
<td>PetroVietnam 12kg Xanh</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>Siamgas 45kg</td>
<td><strong>🔻</strong>18.000</td>
<td>&nbsp;1.682.000</td>
</tr>
<tr>
<td>Gas4.0 45kg Đỏ</td>
<td><strong>🔻</strong>18.000</td>
<td>&nbsp;1.682.000</td>
</tr>
<tr>
<td>Gas4.0 45kg X&aacute;m</td>
<td><strong>🔻</strong>18.000</td>
<td>&nbsp;1.682.000</td>
</tr>
<tr>
<td>Gas4.0 45kg Xanh</td>
<td><strong>🔻</strong>18.000</td>
<td>1.682.000</td>
</tr>
<tr>
<td>Phoenix Gas 45kg</td>
<td><strong>🔻</strong>18.000</td>
<td>&nbsp;1.682.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh Gas 45kg&nbsp;</td>
<td><strong>🔻</strong>18.000</td>
<td>1.682.000</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>Tại Đ&agrave; Nẵng &amp; Quảng Nam, gi&aacute; gas b&aacute;n lẻ th&aacute;ng 4-2024 được giữ ổn định ở mức tương đương th&aacute;ng 3-2024. Gi&aacute; gas 12kg c&aacute;c thương hiệu PetroDana, Super Gas, Siamgas, Gia Đ&igrave;nh, Petrolimex... được giữ ở mức 507.000 đồng/b&igrave;nh c&ograve;n&nbsp;gi&aacute; gas c&ocirc;ng nghiệp 45kg&nbsp;chốt ở mức 2.012.000 đồng/b&igrave;nh.</p>
<p>&nbsp;</p>
<p><strong>BẢNG GI&Aacute; GAS TH&Aacute;NG 4-2024&nbsp;TẠI GAS4.0 &amp;MORE MIỀN TRUNG</strong></p>
<hr>
<table border="1" cellspacing="0" cellpadding="4" align="center">
<tbody>
<tr>
<td><strong>T&Ecirc;N SẢN PHẨM</strong></td>
<td><strong>TĂNG/GIẢM (VNĐ)</strong></td>
<td><strong>GI&Aacute; NIỀM YẾT TẠI M. TRUNG</strong></td>
</tr>
<tr>
<td>Siamgas 12kg van ngang/đứng</td>
<td><strong>---</strong></td>
<td>&nbsp;507.000</td>
</tr>
<tr>
<td>Siamgas 12kg T&iacute;m/Xanh</td>
<td><strong>---</strong></td>
<td>&nbsp;507.000</td>
</tr>
<tr>
<td>Super Gas 12kg Xanh</td>
<td><strong>---</strong></td>
<td>&nbsp;507.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh Gas 12kg Đỏ</td>
<td><strong>---</strong></td>
<td>&nbsp;&nbsp;507.000</td>
</tr>
<tr>
<td>Petrolimex 12kg Đỏ</td>
<td><strong>---</strong></td>
<td>&nbsp;507.000</td>
</tr>
<tr>
<td>PetroDana 12kg</td>
<td><strong>---</strong></td>
<td>&nbsp;507.000</td>
</tr>
<tr>
<td>Siamgas 45kg</td>
<td><strong>---</strong></td>
<td>2.012.000</td>
</tr>
<tr>
<td>Gas4.0 45kg đỏ</td>
<td><strong>---</strong></td>
<td>2.012.000</td>
</tr>
<tr>
<td>Gas Gia Đ&igrave;nh 45kg</td>
<td><strong>---</strong></td>
<td>2.012.000</td>
</tr>
<tr>
<td>Gas PetroDana 45kg</td>
<td><strong>---</strong></td>
<td>2.012.000</td>
</tr>
<tr>
<td>Gas One 45kg</td>
<td><strong>---</strong></td>
<td>2.012.000</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>Nhằm tri &acirc;n kh&aacute;ch h&agrave;ng,&nbsp;Gas4.0 &amp;more tiếp tục &aacute;p dụng chương tr&igrave;nh ưu đ&atilde;i d&agrave;nh cho kh&aacute;ch h&agrave;ng đặt gas trong th&aacute;ng 4-2024, &aacute;p dụng tr&ecirc;n to&agrave;n&nbsp;hệ thống cửa h&agrave;ng v&agrave; c&aacute;c k&ecirc;nh b&aacute;n h&agrave;ng online. Cụ thể:​​​​​​</p>
<blockquote>
<p><strong>-&nbsp;Giảm 30 - 70K khi đặt gas lần đầu;</strong></p>
<p><strong>️- Giảm đến 50K khi đặt gas từ lần thứ 2&nbsp;trở đi</strong>.</p>
</blockquote>
<p><em>*<strong><u>Lưu &yacute;:</u></strong></em>&nbsp;C&aacute;c mức giảm gi&aacute; được &aacute;p dụng theo chương tr&igrave;nh tại cửa h&agrave;ng gần địa chỉ kh&aacute;ch h&agrave;ng.</p>
<p>&nbsp;</p>
<p>Kh&aacute;ch h&agrave;ng c&oacute; nhu cầu mua&nbsp;<a href="https://gas40.com/loai-san-pham/gas" target="_blank" rel="noopener">gas ch&iacute;nh h&atilde;ng</a>&nbsp;c&oacute; thể đặt h&agrave;ng nhanh ch&oacute;ng, dễ d&agrave;ng tại website, ứng dụng hoặc&nbsp;<a href="https://gas40.com/danh-sach-cua-hang" target="_blank" rel="noopener">cửa h&agrave;ng Gas4.0 &amp;more</a>&nbsp;gần nhất. Vui l&ograve;ng li&ecirc;n hệ hotline&nbsp;<strong><a href="tel:19001740">1900 1740</a></strong>&nbsp;(M. Nam &amp; M. Trung) -&nbsp;<strong><a href="tel:18001772">1800 1772</a></strong>&nbsp;(M. Bắc) để biết th&ecirc;m th&ocirc;ng tin chi tiết về sản phẩm, gi&aacute; gas mới nhất&nbsp;k&egrave;m ưu đ&atilde;i &aacute;p dụng.</p>', N'test post 2', 1, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (3, 1, N'Giới thiệu', N'18-06-2024', N'18-06-2024', N'2/df.jpg', N'about us', N'about us', 2, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (4, 1, N'Hệ thống cửa hàng', N'18-06-2024', N'18-06-2024', N'2/df/jpg', N'store', N'store', 2, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (5, 1, N'Cơ hội nghề nghiệp', N'18-06-2024', N'18-06-2024', N'2/df.jpg', N'job', N'job', 2, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (6, 1, N'Điều khoản sử dụng', N'18-06-2024', N'18-06-2024', N'3/df.jpg', N'dieu khoan', N'd', 3, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (7, 1, N'Câu hỏi thường gặp', N'18-06-2024', N'18-06-2024', N't', N't', N't', 3, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (8, 1, N'Trung tâm hỗ trợ CSKH', N'18-06-2024', N'18-06-2024', N't', N't', N't', 3, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (9, 1, N'Giới thiệu bạn bè', N'18-06-2024', N'18-06-2024', N't', N't', N't', 3, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (10, 1, N'Phương thức thanh toán', N'18-06-2024', N'18-06-2024', N't', N't', N't', 3, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (15, 1, N'Banner 3', N'2024-07-05', N'2024-07-05', N'1_ cuoc hop Bo CT.png', N'<p>Banner 3 Banner 3 Banner 3 Banner 3&nbsp;</p>
<p>Banner 3 Banner 3 Banner 3 Banner 3&nbsp;</p>
<p>Banner 3 Banner 3 Banner 3 Banner 3&nbsp;</p>
<p>Banner 3 Banner 3 Banner 3 Banner 3&nbsp;</p>
<p>Banner 3 Banner 3 Banner 3 Banner 3&nbsp;</p>
<p>Banner 3 Banner 3 Banner 3 Banner 3&nbsp;</p>
<p><img src="data:image/jpeg;base64,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" alt="" width="500" height="350"></p>', N'', 3, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (16, 1, N'Chính sách bảo mật', N'18-06-2024', N'18-06-2024', N't', N't', N't', 4, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (17, 1, N'Chính sách đổi trả', N'18-06-2024', N'18-06-2024', N't', N't', N't', 4, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (18, 1, N'Chính sách vận chuyển và giao nhận', N'18-06-2024', N'18-06-2024', N't', N't', N't', 4, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (19, 1, N'Chính sách giải quyết khiếu nại', N'18-06-2024', N'18-06-2024', N't', N't', N't', 4, 1)
INSERT [dbo].[Post] ([PostID], [administratorID], [Title], [DateCreated], [DateUpdated], [Postbanner], [Context], [Description], [PostCategoryID], [updatedBy]) VALUES (20, 1, N'Giá gas tháng 4-2024 quay đầu giảm nhẹ 5.000 đồng/bình 12kg', N'2024-07-25', N'2024-07-25', N'gia-gas-thang-4-nam-2024-thumb.jpg', N'<p><strong>Ng&agrave;y 1-4-2024, gi&aacute; gas trong trước quay đầu&nbsp;giảm nhẹ 5.000 đối với b&igrave;nh 12kg v&agrave; 18.000 đồng đối với b&igrave;nh 45kg, tương đương mức giảm&nbsp; khoảng 417 đồng/kg.</strong></p>
<p>&nbsp;</p>
<h2><strong>1. Gi&aacute; gas trong nước&nbsp;th&aacute;ng 4-2024 quay đầu giảm</strong></h2>
<p>Chiều 31-3, c&aacute;c doanh nghiệp kinh doanh gas đầu mối như&nbsp;Tổng C&ocirc;ng ty Kh&iacute; Việt Nam (PV GAS), C&ocirc;ng ty CP Dầu kh&iacute; TP.HCM, Tổng C&ocirc;ng ty Gas Petrolimex, C&ocirc;ng ty Dầu kh&iacute; Th&aacute;i B&igrave;nh Dương... đ&atilde; c&oacute; th&ocirc;ng b&aacute;o điều chỉnh gi&aacute; gas b&aacute;n lẻ&nbsp;th&aacute;ng 4-2024.</p>
<p>&nbsp;</p>
<p>Cụ thể, đại diện của c&aacute;c thương hiệu PetroVietnam, Petrolimex, City Gas, VT Gas, Pacific Petro... cho biết, kể từ ng&agrave;y 1-4-2024, gi&aacute; gas b&aacute;n lẻ c&aacute;c sản phẩm b&igrave;nh gas d&acirc;n dụng v&agrave; c&ocirc;ng nghiệp tr&ecirc;n thị trường sẽ được điều chỉnh giảm&nbsp;khoảng 417&nbsp;đồng/kg, tương đương mức giảm&nbsp;5.000 đồng/b&igrave;nh 12kg, 18.000 - 19.000&nbsp;đồng/b&igrave;nh 45kg v&agrave; 21.000 đồng/b&igrave;nh 50kg.</p>
<p>&nbsp;</p>
<p>Đại diện c&aacute;c doanh nghiệp kh&aacute;c như TotalEnergies Việt Nam, C&ocirc;ng ty Super Gas, C&ocirc;ng ty Kh&iacute; Đốt Gia Đ&igrave;nh,...cũng đưa ra th&ocirc;ng b&aacute;o tương tự. Theo đ&oacute;, gi&aacute; gas 12kg của c&aacute;c thương hiệu: Total gaz,&nbsp;<a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/gas-gia-dinh" target="_blank" rel="noopener">Gia Đ&igrave;nh Gas</a>, Siamgas, Hanoi Petro,... đều giảm&nbsp;5.000 đồng c&ograve;n gi&aacute; gas c&ocirc;ng nghiệp 45kg giảm&nbsp;18.000 đồng kể từ ng&agrave;y 1-4-2024.</p>
<p><img src="https://ecom.viettechsmart.com:5020/Media/Images/News/cua-hang-gas-gan-nhat-tphcm-thumb.jpg" alt="Gi&aacute; gas th&aacute;ng 4-2024 giảm nhẹ sau 8 chu kỳ tăng li&ecirc;n tiếp"></p>
<p>Theo đại diện của Chi hội gas Miền Nam, gi&aacute; hợp đồng nhập khẩu (CP) kh&iacute; đốt tự nhi&ecirc;n giao th&aacute;ng 4/2024 đ&atilde; giảm khoảng 17,5 USD/tấn so với th&aacute;ng trước, chốt ở mức 617,5 USD/tấn. Do đ&oacute;,&nbsp;c&aacute;c doanh nghiệp kinh doanh gas đầu mối phải điều chỉnh tăng gi&aacute; b&aacute;n lẻ ở mức tương ứng.</p>
<p>Như vậy, gi&aacute; gas b&aacute;n lẻ trong nước mới ghi nhận chu kỳ giảm đầu ti&ecirc;n&nbsp;sau 8 chu kỳ tăng v&agrave; giữ gi&aacute; li&ecirc;n tiếp kể từ th&aacute;ng 8-2023. T&iacute;nh từ đầu năm 2024, gi&aacute; gas trong nước cũng đ&atilde; ghi nhận 3 chu kỳ tăng li&ecirc;n tiếp với mức tăng 13.000 đồng/b&igrave;nh 12kg.&nbsp;&nbsp;&nbsp;</p>
<blockquote>
<p><em><strong>►Xem th&ecirc;m:&nbsp;</strong><a href="https://gas40.com/tin-tuc/gia-gas-hom-nay.40" target="_blank" rel="noopener">Gi&aacute; gas h&ocirc;m nay: Cập nhật gi&aacute; gas mới nhất hiện nay</a></em></p>
</blockquote>
<p>&nbsp;</p>
<h2><strong>2. Bảng gi&aacute; gas th&aacute;ng 4-2024&nbsp;tại Gas4.0 &amp;more</strong></h2>
<p>Trước t&igrave;nh h&igrave;nh biến động chung của thị&nbsp;trường,&nbsp;<a href="https://gas40.com/" target="_blank" rel="noopener">Gas4.0 &amp;more</a>&nbsp;ch&iacute;nh thức điều chỉnh gi&aacute; gas b&aacute;n lẻ c&aacute;c loại b&igrave;nh gas d&acirc;n dụng v&agrave; c&ocirc;ng nghiệp kể từ ng&agrave;y 1-4-2024. Cụ thể, gi&aacute; gas b&aacute;n lẻ&nbsp;được điều chỉnh tăng 5.000 đồng/b&igrave;nh 12kg v&agrave; 18.000 đồng/b&igrave;nh 45kg.</p>
<p>Tại TP.HCM v&agrave; c&aacute;c tỉnh miền Nam,&nbsp;<a href="https://gas40.com/loai-san-pham/gas/binh-gas-12kg" target="_blank" rel="noopener">gi&aacute; gas 12kg</a>&nbsp;của c&aacute;c thương hiệu Siamgas,&nbsp;PetroVietnam, Saigon Petro, Gia Đ&igrave;nh, Phoenix Gas,&nbsp;Pacific Petro,...dao động ở mức 444.000 - 464.000 đồng/b&igrave;nh. Ri&ecirc;ng&nbsp;gi&aacute; gas c&ocirc;ng nghiệp 45kg&nbsp;thương hiệu Siamgas, Gas4.0; Phoenix Gas, Gia Đ&igrave;nh,...được ấn định ở mức 1.682.000 đồng/b&igrave;nh.</p>
<p><img src="https://ecom.viettechsmart.com:5020/Media/Images/News/gia-gas-thang-4-nam-2024-thumb.jpg" alt="Gi&aacute; gas th&aacute;ng 4 năm 2024 giảm nhẹ 5.000 đồng/b&igrave;nh">​​​​​​</p>
<p><strong>BẢNG GI&Aacute; GAS TH&Aacute;NG 4-2024&nbsp;TẠI GAS4.0 &amp;MORE MIỀN NAM</strong></p>
<hr>
<table border="1" cellspacing="0" cellpadding="4" align="center">
<thead></thead>
<tbody>
<tr>
<td><strong>T&Ecirc;N SẢN PHẨM</strong></td>
<td><strong>TĂNG/GIẢM (VNĐ)</strong></td>
<td><strong>GI&Aacute; NI&Ecirc;M YẾT TẠI MIỀN NAM</strong></td>
</tr>
<tr>
<td>Siamgas 12kg van ngang/đứng</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Super Gas 12kg X&aacute;m</td>
<td><strong>🔻</strong>5.000</td>
<td>444.000</td>
</tr>
<tr>
<td>Phoenix Gas 12kg Xanh</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>Phoenix Gas 12kg&nbsp;Xanh VT</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Phoenix Gas 12kg V&agrave;ng</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh 12kg X&aacute;m</td>
<td><strong>🔻</strong>5.000</td>
<td>444.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh 12kg Đỏ</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh 12kg V&agrave;ng</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh 12kg Xanh</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Pacific Petro 12kg X&aacute;m</td>
<td><strong>🔻</strong>5.000</td>
<td>444.000</td>
</tr>
<tr>
<td>Pacific Petro&nbsp;12kg V&agrave;ng</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>Pacific Petro&nbsp;12kg Cam</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Pacific Petro&nbsp;12kg Đỏ</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>Pacific Petro&nbsp;12kg Xanh VT</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;464.000</td>
</tr>
<tr>
<td>Elf gaz 12.5kg</td>
<td><strong>🔻</strong>5.000</td>
<td>487.000</td>
</tr>
<tr>
<td>Saigon Petro 12kg</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>PetroVietnam 12kg X&aacute;m</td>
<td><strong>🔻</strong>5.000</td>
<td>&nbsp;444.000</td>
</tr>
<tr>
<td>PetroVietnam 12kg Xanh</td>
<td><strong>🔻</strong>5.000</td>
<td>464.000</td>
</tr>
<tr>
<td>Siamgas 45kg</td>
<td><strong>🔻</strong>18.000</td>
<td>&nbsp;1.682.000</td>
</tr>
<tr>
<td>Gas4.0 45kg Đỏ</td>
<td><strong>🔻</strong>18.000</td>
<td>&nbsp;1.682.000</td>
</tr>
<tr>
<td>Gas4.0 45kg X&aacute;m</td>
<td><strong>🔻</strong>18.000</td>
<td>&nbsp;1.682.000</td>
</tr>
<tr>
<td>Gas4.0 45kg Xanh</td>
<td><strong>🔻</strong>18.000</td>
<td>1.682.000</td>
</tr>
<tr>
<td>Phoenix Gas 45kg</td>
<td><strong>🔻</strong>18.000</td>
<td>&nbsp;1.682.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh Gas 45kg&nbsp;</td>
<td><strong>🔻</strong>18.000</td>
<td>1.682.000</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>Tại Đ&agrave; Nẵng &amp; Quảng Nam, gi&aacute; gas b&aacute;n lẻ th&aacute;ng 4-2024 được giữ ổn định ở mức tương đương th&aacute;ng 3-2024. Gi&aacute; gas 12kg c&aacute;c thương hiệu PetroDana, Super Gas, Siamgas, Gia Đ&igrave;nh, Petrolimex... được giữ ở mức 507.000 đồng/b&igrave;nh c&ograve;n&nbsp;gi&aacute; gas c&ocirc;ng nghiệp 45kg&nbsp;chốt ở mức 2.012.000 đồng/b&igrave;nh.</p>
<p>&nbsp;</p>
<p><strong>BẢNG GI&Aacute; GAS TH&Aacute;NG 4-2024&nbsp;TẠI GAS4.0 &amp;MORE MIỀN TRUNG</strong></p>
<hr>
<table border="1" cellspacing="0" cellpadding="4" align="center">
<tbody>
<tr>
<td><strong>T&Ecirc;N SẢN PHẨM</strong></td>
<td><strong>TĂNG/GIẢM (VNĐ)</strong></td>
<td><strong>GI&Aacute; NIỀM YẾT TẠI M. TRUNG</strong></td>
</tr>
<tr>
<td>Siamgas 12kg van ngang/đứng</td>
<td><strong>---</strong></td>
<td>&nbsp;507.000</td>
</tr>
<tr>
<td>Siamgas 12kg T&iacute;m/Xanh</td>
<td><strong>---</strong></td>
<td>&nbsp;507.000</td>
</tr>
<tr>
<td>Super Gas 12kg Xanh</td>
<td><strong>---</strong></td>
<td>&nbsp;507.000</td>
</tr>
<tr>
<td>Gia Đ&igrave;nh Gas 12kg Đỏ</td>
<td><strong>---</strong></td>
<td>&nbsp;&nbsp;507.000</td>
</tr>
<tr>
<td>Petrolimex 12kg Đỏ</td>
<td><strong>---</strong></td>
<td>&nbsp;507.000</td>
</tr>
<tr>
<td>PetroDana 12kg</td>
<td><strong>---</strong></td>
<td>&nbsp;507.000</td>
</tr>
<tr>
<td>Siamgas 45kg</td>
<td><strong>---</strong></td>
<td>2.012.000</td>
</tr>
<tr>
<td>Gas4.0 45kg đỏ</td>
<td><strong>---</strong></td>
<td>2.012.000</td>
</tr>
<tr>
<td>Gas Gia Đ&igrave;nh 45kg</td>
<td><strong>---</strong></td>
<td>2.012.000</td>
</tr>
<tr>
<td>Gas PetroDana 45kg</td>
<td><strong>---</strong></td>
<td>2.012.000</td>
</tr>
<tr>
<td>Gas One 45kg</td>
<td><strong>---</strong></td>
<td>2.012.000</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>Nhằm tri &acirc;n kh&aacute;ch h&agrave;ng,&nbsp;Gas4.0 &amp;more tiếp tục &aacute;p dụng chương tr&igrave;nh ưu đ&atilde;i d&agrave;nh cho kh&aacute;ch h&agrave;ng đặt gas trong th&aacute;ng 4-2024, &aacute;p dụng tr&ecirc;n to&agrave;n&nbsp;hệ thống cửa h&agrave;ng v&agrave; c&aacute;c k&ecirc;nh b&aacute;n h&agrave;ng online. Cụ thể:​​​​​​</p>
<blockquote>
<p><strong>-&nbsp;Giảm 30 - 70K khi đặt gas lần đầu;</strong></p>
<p><strong>️- Giảm đến 50K khi đặt gas từ lần thứ 2&nbsp;trở đi</strong>.</p>
</blockquote>
<p><em>*<strong><u>Lưu &yacute;:</u></strong></em>&nbsp;C&aacute;c mức giảm gi&aacute; được &aacute;p dụng theo chương tr&igrave;nh tại cửa h&agrave;ng gần địa chỉ kh&aacute;ch h&agrave;ng.</p>
<p>&nbsp;</p>
<p>Kh&aacute;ch h&agrave;ng c&oacute; nhu cầu mua&nbsp;<a href="https://gas40.com/loai-san-pham/gas" target="_blank" rel="noopener">gas ch&iacute;nh h&atilde;ng</a>&nbsp;c&oacute; thể đặt h&agrave;ng nhanh ch&oacute;ng, dễ d&agrave;ng tại website, ứng dụng hoặc&nbsp;<a href="https://gas40.com/danh-sach-cua-hang" target="_blank" rel="noopener">cửa h&agrave;ng Gas4.0 &amp;more</a>&nbsp;gần nhất. Vui l&ograve;ng li&ecirc;n hệ hotline&nbsp;<strong><a href="tel:19001740">1900 1740</a></strong>&nbsp;(M. Nam &amp; M. Trung) -&nbsp;<strong><a href="tel:18001772">1800 1772</a></strong>&nbsp;(M. Bắc) để biết th&ecirc;m th&ocirc;ng tin chi tiết về sản phẩm, gi&aacute; gas mới nhất&nbsp;k&egrave;m ưu đ&atilde;i &aacute;p dụng.</p>', N'', 1, 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[PostCategory] ON 

INSERT [dbo].[PostCategory] ([PostCategoryID], [Name]) VALUES (1, N'Banner')
INSERT [dbo].[PostCategory] ([PostCategoryID], [Name]) VALUES (2, N'About Us')
INSERT [dbo].[PostCategory] ([PostCategoryID], [Name]) VALUES (3, N'Customer Service')
INSERT [dbo].[PostCategory] ([PostCategoryID], [Name]) VALUES (4, N'Policy')
SET IDENTITY_INSERT [dbo].[PostCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (1, N'gas-hp-6kg', N'GAS HP 6KG', N'Hanoi Petro', N'Bình gas 6kg.', N'<h2><strong>Thương hiệu gas Hanoi Petro</strong></h2>

<p><a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/hanoi-petro" target="_blank">Hanoi Petro</a>&nbsp;- HP l&agrave; thương hiệu gas thuộc C&ocirc;ng ty Đầu tư Dầu Kh&iacute; H&agrave; Nội, một trong những doanh nghiệp sản xuất, kinh doanh kh&iacute; đốt l&acirc;u đời tại khu vực miền Bắc với hơn 20 năm kinh nghiệm trong ng&agrave;nh.</p>

<p>Hiện nay, Hanoi Petro l&agrave; một trong những doanh nghiệp đứng đầu trong lĩnh vực cung cấp kh&iacute; đốt (LPG) với nh&agrave; m&aacute;y sản xuất vỏ b&igrave;nh, trạm chiết nạp c&oacute; c&ocirc;ng suất tồn trữ đến 650 tấn, mạng lưới b&aacute;n lẻ rộng khắp c&aacute;c tỉnh miền Bắc th&ocirc;ng qua c&aacute;c Đại l&yacute;, Tổng đại l&yacute;. Nhờ ch&uacute; trọng v&agrave;o chất lượng, hiệu quả v&agrave; độ an to&agrave;n, Hanoi Petro đ&atilde; tạo dựng được uy t&iacute;n, được c&aacute;c hộ gia đ&igrave;nh, qu&aacute;n ăn, nh&agrave; h&agrave;ng, cơ sở sản xuất - kinh doanh tin d&ugrave;ng.</p>

<p><img alt="Bình gas Hanoi Petro" src="https://ecom.viettechsmart.com:5020/Media/Images/0/gas-ha-noi-petro-hp.jpg" /></p>

<h2><strong>1. Tại sao b&igrave;nh gas HP 6kg được mọi người tin d&ugrave;ng?</strong></h2>

<p>Kh&ocirc;ng chỉ l&agrave; thương hiệu l&acirc;u đời, c&oacute; nh&agrave; m&aacute;y sản xuất v&agrave; chiết nạp quy m&ocirc; lớn đ&aacute;p ứng mọi nhu cầu sử dụng, b&igrave;nh gas 6kg của Hanoi Petro c&ograve;n được người ti&ecirc;u d&ugrave;ng đ&aacute;nh gi&aacute; cao bởi: &nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1.1. Chất lượng gas Hanoi Petro được đảm bảo</strong></h3>

<p>Hanoi Petro l&agrave; doanh nghiệp kinh doanh gas uy t&iacute;n, sở hữu nh&agrave; m&aacute;y chiết nạp đạt quy chuẩn Quốc gia trong ng&agrave;nh kh&iacute; dầu mỏ h&oacute;a lỏng. Nhi&ecirc;n liệu (LPG) được sử dụng để chiết nạp v&agrave;o b&igrave;nh gas đều được nhập từ c&aacute;c nh&agrave; cung cấp uy t&iacute;n trong nước hoặc nước ngo&agrave;i, c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Do đ&oacute;, chất lượng nước gas lu&ocirc;n được đảm bảo sạch, th&agrave;nh phần ch&iacute;nh chỉ bao gồm Butane, Propane v&agrave; chất tạo m&ugrave;i, kh&ocirc;ng pha trộn tạp chất, cho ngọn lửa xanh, mạnh.</p>

<p>B&ecirc;n cạnh đ&oacute;, nhờ ứng dụng d&acirc;y chuyển chiết nạp tự động h&oacute;a cao n&ecirc;n nước gas trong b&igrave;nh được đảm bảo c&acirc;n đủ kg với sai số nhỏ hơn &plusmn;0.2kg. Hai th&agrave;nh phần ch&iacute;nh Butan, Propan theo tỷ lệ từ 30 &harr; 70%, đ&acirc;y l&agrave; tỷ lệ chuẩn ph&ugrave; hợp với điều kiện kh&iacute; hậu &amp; cấu tạo bếp tại Việt Nam gi&uacute;p tối ưu hiệu suất đốt ch&aacute;y, tiết kiệm gas cho người ti&ecirc;u d&ugrave;ng. &nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1.2. B&igrave;nh gas HP 6kg c&oacute; độ an to&agrave;n cao</strong></h3>

<p>Để đảm bảo độ an to&agrave;n chống ch&aacute;y nổ, quy tr&igrave;nh sản xuất vỏ b&igrave;nh gas Hanoi Petro 6kg tu&acirc;n thủ đầy đủ c&aacute;c ti&ecirc;u chuẩn TCVN 6292:1997 (Việt Nam) v&agrave; DOT 4BA-240 (Hoa Kỳ). Sử dụng vật liệu th&eacute;p chuy&ecirc;n dụng c&oacute; độ d&agrave;y đến 2,6 ly được nhập khẩu từ Nhật Bản, quy tr&igrave;nh chế tạo được kiểm so&aacute;t nghi&ecirc;m ngặt để đảm bảo độ bền v&agrave; độ an to&agrave;n cao nhất.</p>

<p>Mỗi vỏ b&igrave;nh gas HP 6kg đều trải qua c&aacute;c bước kiểm tra, kiểm định khắt khe của c&aacute;c cơ quan c&oacute; thẩm quyền, đảm bảo đạt ti&ecirc;u chuẩn trước khi lưu h&agrave;nh tr&ecirc;n thị trường. Sau 5 năm, doanh nghiệp sẽ thu hồi vỏ b&igrave;nh để đ&aacute;nh gi&aacute; chất lượng, khắc phục điểm bất thường (nếu c&oacute;) v&agrave; đưa đi kiểm định lại trước khi tiếp tục lưu th&ocirc;ng để hạn chế sự c&oacute; c&oacute; thể xảy ra.</p>

<p>&nbsp;</p>

<h3><strong>1.3. C&oacute; tem chống h&agrave;ng giả v&agrave; bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng</strong></h3>

<p>Để hạn chế t&igrave;nh trạng chiếm dụng vỏ b&igrave;nh sang chiết tr&aacute;i ph&eacute;p gas HP giả, ngo&agrave;i c&aacute;c th&ocirc;ng tin được in nổi tr&ecirc;n vỏ b&igrave;nh khi sản xuất, Hanoi Petro c&ograve;n trang bị tem chống h&agrave;ng giả (Theo ti&ecirc;u chuẩn của Bộ C&ocirc;ng an), được d&aacute;n tr&ecirc;n van cổ b&igrave;nh gas. Người d&ugrave;ng n&ecirc;n từ chối nhận h&agrave;ng khi b&igrave;nh gas HP 6kg giao đến kh&ocirc;ng c&oacute; tem chống h&agrave;ng giả đ&uacute;ng chuẩn hoặc tem c&oacute; dấu hiệu bị r&aacute;ch/l&agrave;m giả.</p>

<p>Ngo&agrave;i ra, để đảm bảo quyền lợi, gi&uacute;p kh&aacute;ch h&agrave;ng y&ecirc;n t&acirc;m sử dụng gas, h&atilde;ng đ&atilde; mua bảo hiểm ch&aacute;y nổ cho người ti&ecirc;u d&ugrave;ng cho mỗi b&igrave;nh gas HP 6kg. Nếu c&oacute; sự cố ch&aacute;y nổ xảy ra do lỗi b&igrave;nh gas, kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ đại l&yacute;/nh&agrave; sản xuất để được hướng dẫn thủ tục đền b&ugrave; thiệt hại do sự cố thỏa đ&aacute;ng. &nbsp;&nbsp;</p>

<p>&nbsp;</p>

<h2><strong>2. B&igrave;nh gas 6kg Hanoi Petro ph&ugrave; hợp với người d&ugrave;ng n&agrave;o?</strong></h2>

<p>So với c&aacute;c loại b&igrave;nh gas c&oacute; k&iacute;ch thước lớn như&nbsp;<a href="https://gas40.com/loai-san-pham/gas/binh-gas-12kg" target="_blank">gas 12kg</a>, 30kg hay 45kg, b&igrave;nh gas HP 6kg sở hữu một số ưu điểm như k&iacute;ch thước gọn nhẹ, dễ di chuyển, chi ph&iacute; đổi gas thấp m&agrave; vẫn đảm bảo được độ an to&agrave;n tương đương. Tuy nhi&ecirc;n, khối lượng gas nạp trong b&igrave;nh chỉ 6kg n&ecirc;n chỉ n&ecirc;n được khuyến nghị sử dụng trong c&aacute;c trường hợp:</p>

<p><img alt="Bình gas HP 6kg kết hợp bếp gas đơn cho không gian bếp nhỏ" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-hp-6kg-va-bep-don.jpg" /></p>

<p>- Sinh vi&ecirc;n, người độc th&acirc;n, gia đ&igrave;nh &iacute;t người c&oacute; nhu cầu nấu nướng &iacute;t, kh&ocirc;ng thường xuy&ecirc;n hoặc sinh sống trong ph&ograve;ng trọ c&oacute; kh&ocirc;ng gian bếp nhỏ. Chọn b&igrave;nh gas 6kg của Hanoi Petro kết hợp với bếp gas đơn sẽ gi&uacute;p tối ưu kh&ocirc;ng gian đồng thời tr&aacute;nh t&igrave;nh trạng l&atilde;ng ph&iacute; do b&igrave;nh gas hết hạn sử dụng m&agrave; chưa d&ugrave;ng hết.</p>

<p>- C&aacute; nh&acirc;n/hộ kinh doanh ăn uống di động bằng xe đẩy, b&aacute;n c&aacute;c m&oacute;n ăn nhanh, thời gian chế biến ngắn. Sử dụng b&igrave;nh HP 6kg kết hợp bếp gas đơn l&agrave; giải ph&aacute;p thay thế cho bếp v&agrave; b&igrave;nh gas mini bởi c&oacute; thể d&ugrave;ng được cho kh&ocirc;ng gian nhỏ hẹp của xe đẩy, dễ di chuyển m&agrave; kh&ocirc;ng phải đổi gas nhiều lần.</p>

<p>- Trường hợp t&agrave;i ch&iacute;nh eo hẹp, chưa đủ để đổi b&igrave;nh 12kg, kh&aacute;ch h&agrave;ng c&oacute; thể lựa chọn b&igrave;nh gas HP 6kg như giải ph&aacute;p thay thế với chi ph&iacute; chỉ bằng &frac12; m&agrave; vẫn tương th&iacute;ch với van/d&acirc;y dẫn/bếp hiện c&oacute;.</p>
', 1, 7, 1, 490000.0000, N'GAS HP 6KG.png', 180, 22, CAST(N'2024-07-14T10:47:28.203' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (2, N'binh-gas-hp-12-kg-van-ngang', N'GAS HP 12KG VAN NGANG', N'Hanoi Petro', N'Gas 12kg van ngang', N'<h2><strong>1. Tại sao b&igrave;nh gas HP 12kg được mọi người tin d&ugrave;ng?</strong></h2>

<p>C&ugrave;ng với Petrolimex, PetroVietnam,&nbsp;<a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/hanoi-petro" target="_blank">Hanoi Petro (HP)</a>&nbsp;l&agrave; một trong những thương hiệu gas c&oacute; thị phần lớn, được người d&ugrave;ng tại H&agrave; Nội v&agrave; c&aacute;c tỉnh miền Bắc tin d&ugrave;ng. Sản phẩm b&igrave;nh gas 12kg của Hanoi Petro lu&ocirc;n được người nội trợ đ&aacute;nh gi&aacute; cao bởi: &nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1.1. Hanoi Petro l&agrave; thương hiệu gas uy t&iacute;n</strong></h3>

<p>Hanoi Petro (HP) l&agrave; thương hiệu gas thuộc C&ocirc;ng ty Đầu tư Dầu Kh&iacute; H&agrave; Nội, một trong những doanh nghiệp sản xuất, kinh doanh kh&iacute; đốt l&acirc;u đời tại khu vực miền Bắc với hơn 20 năm kinh nghiệm trong ng&agrave;nh.</p>

<p><img alt="Hanoi Petro là thương hiệu gas uy tín tại Việt Nam" src="https://ecom.viettechsmart.com:5020/Media/Images/0/gas-ha-noi-petro-hp.jpg" /></p>

<p>Hiện nay, Hanoi Petro l&agrave; một trong những doanh nghiệp đứng đầu trong lĩnh vực cung cấp kh&iacute; đốt (LPG) với nh&agrave; m&aacute;y sản xuất vỏ b&igrave;nh, trạm chiết nạp c&oacute; c&ocirc;ng suất tồn trữ đến 650 tấn, mạng lưới b&aacute;n lẻ rộng khắp c&aacute;c tỉnh miền Bắc th&ocirc;ng qua c&aacute;c Đại l&yacute;, Tổng đại l&yacute;. Nhờ ch&uacute; trọng v&agrave;o chất lượng, hiệu quả v&agrave; độ an to&agrave;n, Hanoi Petro đ&atilde; tạo dựng được uy t&iacute;n, được c&aacute;c hộ gia đ&igrave;nh, qu&aacute;n ăn, nh&agrave; h&agrave;ng, cơ sở sản xuất - kinh doanh tin d&ugrave;ng.</p>

<p>&nbsp;</p>

<h3><strong>1.2. Gas HP 12kg lu&ocirc;n đảm bảo chất lượng ổn định</strong></h3>

<p>Hanoi Petro hiện đang sở hữu nh&agrave; m&aacute;y chiết nạp đạt quy chuẩn Quốc gia trong ng&agrave;nh kh&iacute; dầu mỏ h&oacute;a lỏng. Nhi&ecirc;n liệu (LPG) được sử dụng để chiết nạp v&agrave;o b&igrave;nh gas HP 12kg van ngang đều được nhập từ c&aacute;c nh&agrave; cung cấp uy t&iacute;n trong nước hoặc nước ngo&agrave;i, c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Do đ&oacute;, chất lượng nước gas lu&ocirc;n được đảm bảo sạch, th&agrave;nh phần ch&iacute;nh chỉ bao gồm Butane, Propane v&agrave; chất tạo m&ugrave;i, kh&ocirc;ng pha trộn tạp chất, cho ngọn lửa xanh, mạnh.</p>

<p>B&ecirc;n cạnh đ&oacute;, nhờ ứng dụng d&acirc;y chuyển chiết nạp tự động h&oacute;a cao n&ecirc;n nước gas trong b&igrave;nh gas Hanoi Petro 12kg được đảm bảo c&acirc;n đủ kg với sai số nhỏ hơn &plusmn;0.2kg. Hai th&agrave;nh phần ch&iacute;nh Butan, Propan được chiết nạp theo tỷ lệ từ 30 &harr; 70% mol. Đ&acirc;y l&agrave; tỷ lệ chuẩn, ph&ugrave; hợp với điều kiện kh&iacute; hậu v&agrave; kết cấu bếp nấu tại Việt Nam, gi&uacute;p tối ưu hiệu suất ch&aacute;y, tiết kiệm gas.</p>

<p>Nhờ đ&oacute;, gas HP 12kg khi nấu cho ngọn lửa xanh, kh&ocirc;ng c&oacute; m&ugrave;i h&ocirc;i kh&oacute; chịu như c&aacute;c loại gas lậu c&oacute; pha trộn tạp chất, lửa ch&aacute;y mạnh &amp; đều, tiết kiệm nhi&ecirc;n liệu v&agrave; thời gian đun nấu v&agrave; kh&ocirc;ng l&agrave;m đen nồi.&nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1.3. B&igrave;nh gas Hanoi Petro 12kg c&oacute; độ an to&agrave;n cao</strong></h3>

<p>Để đảm bảo độ an to&agrave;n chống ch&aacute;y nổ, quy tr&igrave;nh sản xuất vỏ b&igrave;nh gas HP 12kg tu&acirc;n thủ đầy đủ c&aacute;c ti&ecirc;u chuẩn TCVN 6292:1997 (Việt Nam) v&agrave; DOT 4BA-240 (Hoa Kỳ). Sử dụng vật liệu th&eacute;p chuy&ecirc;n dụng c&oacute; độ d&agrave;y đến 2,6 ly được nhập khẩu từ Nhật Bản, quy tr&igrave;nh chế tạo được kiểm so&aacute;t nghi&ecirc;m ngặt để đảm bảo độ bền v&agrave; độ an to&agrave;n cao nhất. Nhờ sử dụng vật liệu chất lượng, độ d&agrave;y th&agrave;nh b&igrave;nh đạt chuẩn n&ecirc;n mỗi vỏ b&igrave;nh Hanoi Petro 12kg xanh thường c&oacute; khối lượng tr&ecirc;n 13kg.</p>

<p><img alt="Bình gas HP 12kg van ngang màu xanh an toàn, chất lượng" src="https://ecom.viettechsmart.com:5020/Media/Images/0/hanoi-petro-12kg-xanh-la.jpg" /></p>

<p>Mỗi vỏ b&igrave;nh gas HP 12kg van ngang đều trải qua c&aacute;c bước kiểm tra, kiểm định khắt khe của c&aacute;c cơ quan c&oacute; thẩm quyền, đảm bảo đạt ti&ecirc;u chuẩn trước khi lưu h&agrave;nh tr&ecirc;n thị trường. Sau 5 năm, doanh nghiệp sẽ thu hồi vỏ b&igrave;nh để đ&aacute;nh gi&aacute; chất lượng, khắc phục điểm bất thường (nếu c&oacute;) v&agrave; đưa đi kiểm định lại trước khi tiếp tục lưu th&ocirc;ng để hạn chế sự c&oacute; c&oacute; thể xảy ra.</p>

<p>&nbsp;</p>

<h3><strong>1.4. Tiết kiệm chi ph&iacute; mua/thay thế van</strong></h3>

<p>B&igrave;nh gas HP 12kg xanh sử dụng&nbsp;<a href="https://gas40.com/san-pham/van-namilux.4099" target="_blank">van ngang điều &aacute;p</a>. Đ&acirc;y l&agrave; loại van được sử dụng phổ biến nhất thị trường, dễ sử dụng, được b&aacute;n rộng r&atilde;i tại c&aacute;c cửa h&agrave;ng gas/phụ kiện bếp gas với gi&aacute; kh&aacute; rẻ (gi&aacute; ~200.000đ). Loại van n&agrave;y c&oacute; độ bền cao, &iacute;t hư hỏng nếu d&ugrave;ng đ&uacute;ng hướng dẫn n&ecirc;n c&oacute; thể tiết kiệm chi ph&iacute; sửa chữa, thay thế.</p>

<h3><strong>1.5. C&oacute; tem chống h&agrave;ng giả v&agrave; bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng</strong></h3>

<p>Để hạn chế t&igrave;nh trạng chiếm dụng vỏ b&igrave;nh sang chiết tr&aacute;i ph&eacute;p gas Hanoi Petro 12kg giả, ngo&agrave;i c&aacute;c th&ocirc;ng tin được in nổi tr&ecirc;n vỏ b&igrave;nh khi sản xuất, Hanoi Petro c&ograve;n trang bị tem chống h&agrave;ng giả (Theo ti&ecirc;u chuẩn của Bộ C&ocirc;ng an), được d&aacute;n tr&ecirc;n van cổ b&igrave;nh gas. Người d&ugrave;ng n&ecirc;n từ chối nhận h&agrave;ng khi b&igrave;nh gas HP 12kg giao đến kh&ocirc;ng c&oacute; tem chống h&agrave;ng giả đ&uacute;ng chuẩn hoặc tem c&oacute; dấu hiệu bị r&aacute;ch/l&agrave;m giả.</p>

<p>Ngo&agrave;i ra, để đảm bảo quyền lợi, gi&uacute;p kh&aacute;ch h&agrave;ng y&ecirc;n t&acirc;m sử dụng gas, h&atilde;ng đ&atilde; mua bảo hiểm ch&aacute;y nổ cho người ti&ecirc;u d&ugrave;ng cho mỗi b&igrave;nh gas HP 12kg van ngang. Nếu c&oacute; sự cố ch&aacute;y nổ xảy ra do lỗi b&igrave;nh gas, kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ đại l&yacute;/nh&agrave; sản xuất để được hướng dẫn thủ tục đền b&ugrave; thiệt hại do sự cố thỏa đ&aacute;ng.</p>

<p>&nbsp;</p>

<h2><strong>2. Tại sao n&ecirc;n đặt gas HP 12kg van ngang tại GasStore?</strong></h2>

<p><strong>GasStore</strong>&nbsp;l&agrave; đối t&aacute;c ph&acirc;n phối ch&iacute;nh thức c&aacute;c sản phẩm thương hiệu Hanoi Petro (HP Gas), trong đ&oacute; c&oacute; b&igrave;nh gas HP 12kg xanh tại H&agrave; Nội v&agrave; thị trường miền Bắc.</p>

<p><strong>Kh&aacute;ch h&agrave;ng mua b&igrave;nh HP 12kg van ngang tại GasStore sẽ được cam kết:</strong></p>

<p>- Sản phẩm ch&iacute;nh h&atilde;ng, c&oacute; tem chống h&agrave;ng giả;</p>

<p>- Đảm bảo an to&agrave;n, mỗi b&igrave;nh gas đều đ&atilde; được mua bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng;</p>

<p>- Gi&aacute; cả cạnh tranh, ch&iacute;nh s&aacute;ch chiết khấu tốt cho doanh nghiệp, nh&agrave; h&agrave;ng sử dụng nhiều;</p>

<p>- Giao h&agrave;ng v&agrave; lắp đặt tận nơi nhanh ch&oacute;ng MIỄN PH&Iacute;;</p>

<p>- Hỗ trợ kiểm tra van, d&acirc;y dẫn, bếp miễn ph&iacute;; kiểm tra r&ograve; rỉ gas bằng m&aacute;y d&ograve; chuy&ecirc;n dụng sau khi lắp đặt để đảm bảo an to&agrave;n cho người sử dụng.</p>

<p>- Hỗ trợ thiết kế, lắp đặt hệ thống gas c&ocirc;ng nghiệp &amp; tặng k&egrave;m tủ điện th&ocirc;ng minh để kiểm so&aacute;t qu&aacute; tr&igrave;nh sử dụng gas qua ứng dụng.</p>
', 1, 7, 1, 475000.0000, N'GAS HP 12KG VAN NGANG.png', 310, 45, CAST(N'2024-07-14T10:47:28.203' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (3, N'binh-gas-hp-van-chup-20', N'GAS HP 12KG VAN CHỤP 20', N'Hanoi Petro;van chup 20', N'GAS HP 12KG ', N'<h2><strong>1. Tại sao b&igrave;nh gas HP 12kg van chụp được mọi người tin d&ugrave;ng?</strong></h2>

<p>C&ugrave;ng với Petrolimex, PetroVietnam,&nbsp;<a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/hanoi-petro" target="_blank">Hanoi Petro</a>&nbsp;(HP) l&agrave; một trong những thương hiệu gas c&oacute; thị phần lớn, được người d&ugrave;ng tại H&agrave; Nội v&agrave; c&aacute;c tỉnh miền Bắc tin d&ugrave;ng. Sản phẩm b&igrave;nh gas 12kg van chụp của Hanoi Petro lu&ocirc;n được người nội trợ đ&aacute;nh gi&aacute; cao bởi: &nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1.1. Hanoi Petro l&agrave; thương hiệu gas uy t&iacute;n</strong></h3>

<p>Hanoi Petro (HP) l&agrave; thương hiệu gas thuộc C&ocirc;ng ty Đầu tư Dầu Kh&iacute; H&agrave; Nội, một trong những doanh nghiệp sản xuất, kinh doanh kh&iacute; đốt l&acirc;u đời tại khu vực miền Bắc với hơn 20 năm kinh nghiệm trong ng&agrave;nh.</p>

<p><img alt="Thương hiệu gas Hanoi Petro nổi tiếng miền Bắc" src="https://ecom.viettechsmart.com:5020/Media/Images/0/gas-ha-noi-petro-hp.jpg" /></p>

<p>Hiện nay, Hanoi Petro l&agrave; một trong những doanh nghiệp đứng đầu trong lĩnh vực cung cấp kh&iacute; đốt (LPG) với nh&agrave; m&aacute;y sản xuất vỏ b&igrave;nh, trạm chiết nạp c&oacute; c&ocirc;ng suất tồn trữ đến 650 tấn, mạng lưới b&aacute;n lẻ rộng khắp c&aacute;c tỉnh miền Bắc th&ocirc;ng qua c&aacute;c Đại l&yacute;, Tổng đại l&yacute;. Nhờ ch&uacute; trọng v&agrave;o chất lượng, hiệu quả v&agrave; độ an to&agrave;n, Hanoi Petro đ&atilde; tạo dựng được uy t&iacute;n, được c&aacute;c hộ gia đ&igrave;nh, qu&aacute;n ăn, nh&agrave; h&agrave;ng, cơ sở sản xuất - kinh doanh tin d&ugrave;ng.</p>

<p>&nbsp;</p>

<h3><strong>1.2. Chất lượng gas HP 12kg van chụp &phi;20 sạch</strong></h3>

<p>Hanoi Petro hiện đang sở hữu nh&agrave; m&aacute;y chiết nạp đạt quy chuẩn Quốc gia trong ng&agrave;nh kh&iacute; dầu mỏ h&oacute;a lỏng. Nhi&ecirc;n liệu (LPG) được sử dụng để chiết nạp v&agrave;o b&igrave;nh gas HP 12kg van chụp 20 đều được nhập từ c&aacute;c nh&agrave; cung cấp uy t&iacute;n trong nước hoặc nước ngo&agrave;i, c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Do đ&oacute;, chất lượng nước gas lu&ocirc;n được đảm bảo sạch, th&agrave;nh phần ch&iacute;nh chỉ bao gồm Butane, Propane v&agrave; chất tạo m&ugrave;i, kh&ocirc;ng pha trộn tạp chất.</p>

<p>B&ecirc;n cạnh đ&oacute;, nhờ ứng dụng d&acirc;y chuyển chiết nạp tự động h&oacute;a cao n&ecirc;n nước gas trong b&igrave;nh gas Hanoi Petro 12kg van chụp được đảm bảo c&acirc;n đủ kg với sai số nhỏ hơn &plusmn;0.2kg. Hai th&agrave;nh phần ch&iacute;nh trong nước gas l&agrave; Butan, Propan được chiết nạp theo tỷ lệ từ 30 &harr; 70%. Đ&acirc;y l&agrave; tỷ lệ chuẩn, ph&ugrave; hợp với điều kiện kh&iacute; hậu v&agrave; kết cấu bếp nấu tại Việt Nam, gi&uacute;p tối ưu hiệu suất ch&aacute;y, tiết kiệm gas.</p>

<p>Nhờ đ&oacute;, gas HP 12kg van chụp 20 khi nấu cho ngọn lửa xanh, kh&ocirc;ng c&oacute; m&ugrave;i h&ocirc;i kh&oacute; chịu như c&aacute;c loại gas lậu c&oacute; pha trộn tạp chất, lửa ch&aacute;y mạnh &amp; đều, tiết kiệm nhi&ecirc;n liệu v&agrave; thời gian đun nấu v&agrave; kh&ocirc;ng l&agrave;m đen nồi.&nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1.3. B&igrave;nh gas Hanoi Petro 12kg van chụp c&oacute; độ an to&agrave;n cao</strong></h3>

<p>Để đảm bảo độ an to&agrave;n chống ch&aacute;y nổ, quy tr&igrave;nh sản xuất vỏ b&igrave;nh gas van chụp HP 12kg tu&acirc;n thủ đầy đủ c&aacute;c ti&ecirc;u chuẩn TCVN 6292:1997 (Việt Nam) v&agrave; DOT 4BA-240 (Hoa Kỳ). Sử dụng vật liệu th&eacute;p chuy&ecirc;n dụng c&oacute; độ d&agrave;y đến 2,6 ly được nhập khẩu từ Nhật Bản, quy tr&igrave;nh chế tạo được kiểm so&aacute;t nghi&ecirc;m ngặt để đảm bảo độ bền v&agrave; độ an to&agrave;n cao nhất. Nhờ sử dụng vật liệu chất lượng, độ d&agrave;y th&agrave;nh b&igrave;nh đạt chuẩn n&ecirc;n mỗi vỏ b&igrave;nh Hanoi Petro 12kg cam thường c&oacute; khối lượng &gt;13kg.</p>

<p>&nbsp;</p>

<p>Mỗi vỏ b&igrave;nh gas HP 12kg van chụp 20 đều trải qua c&aacute;c bước kiểm tra, kiểm định khắt khe của c&aacute;c cơ quan c&oacute; thẩm quyền, đảm bảo đạt ti&ecirc;u chuẩn trước khi lưu h&agrave;nh tr&ecirc;n thị trường. Sau 5 năm, doanh nghiệp sẽ thu hồi vỏ b&igrave;nh để đ&aacute;nh gi&aacute; chất lượng, khắc phục điểm bất thường (nếu c&oacute;) v&agrave; đưa đi kiểm định lại trước khi tiếp tục lưu th&ocirc;ng để hạn chế sự c&oacute; c&oacute; thể xảy ra.</p>

<p>&nbsp;</p>

<h3><strong>1.4. An to&agrave;n hơn với van chụp &phi;20</strong></h3>

<p>B&igrave;nh gas HP 12kg m&agrave;u cam trang bị van kiểu đứng, tương th&iacute;ch với loại van chụp c&oacute; phi 20 (&phi;20). Mặc d&ugrave; gi&aacute; cao hơn loại van ngang nhưng van chụp sử dụng tiện lợi v&agrave; c&oacute; độ an to&agrave;n cao hơn nhờ t&iacute;ch hợp cảm ứng tự động ngắt gas, hạn chế c&aacute;c sự cố do r&ograve; rỉ gas.&nbsp;</p>

<blockquote>
<p>►<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/cac-loai-van-binh-gas-12kg-chon-van-ngang-hay-van-chup.88" target="_blank"><em>C&aacute;c loại van b&igrave;nh gas 12kg: Chọn van ngang hay van chụp?</em></a></p>
</blockquote>

<h3><strong>1.5. C&oacute; tem chống h&agrave;ng giả v&agrave; bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng</strong></h3>

<p>Để hạn chế t&igrave;nh trạng chiếm dụng vỏ b&igrave;nh sang chiết tr&aacute;i ph&eacute;p gas Hanoi Petro 12kg giả, ngo&agrave;i c&aacute;c th&ocirc;ng tin được in nổi tr&ecirc;n vỏ b&igrave;nh khi sản xuất, Hanoi Petro c&ograve;n trang bị tem chống h&agrave;ng giả (Theo ti&ecirc;u chuẩn của Bộ C&ocirc;ng an), được d&aacute;n tr&ecirc;n van cổ b&igrave;nh gas.</p>

<p>Ngo&agrave;i ra, để đảm bảo quyền lợi, gi&uacute;p kh&aacute;ch h&agrave;ng y&ecirc;n t&acirc;m sử dụng gas, h&atilde;ng đ&atilde; mua bảo hiểm ch&aacute;y nổ cho người ti&ecirc;u d&ugrave;ng cho mỗi b&igrave;nh gas HP 12kg van chụp 20 trước khi lưu h&agrave;nh ra thị trường. Nếu c&oacute; sự cố ch&aacute;y nổ xảy ra do lỗi b&igrave;nh gas, kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ đại l&yacute;/nh&agrave; sản xuất để được hướng dẫn thủ tục đền b&ugrave; thiệt hại do sự cố thỏa đ&aacute;ng.</p>

<p>&nbsp;</p>

<h2><strong>2. Tại sao n&ecirc;n đặt gas HP 12kg van chụp 20 tại GasStore?</strong></h2>

<p><strong>GasStore</strong>&nbsp;l&agrave; đối t&aacute;c ph&acirc;n phối ch&iacute;nh thức c&aacute;c sản phẩm thương hiệu Hanoi Petro (HP Gas), trong đ&oacute; c&oacute; b&igrave;nh gas HP 12kg m&agrave;u cam tại H&agrave; Nội v&agrave; thị trường miền Bắc.</p>

<p><strong>Kh&aacute;ch h&agrave;ng mua b&igrave;nh HP 12kg van chụp &phi;20 tại GasStore sẽ được cam kết:</strong></p>

<p>- Sản phẩm ch&iacute;nh h&atilde;ng, c&oacute; tem chống h&agrave;ng giả;</p>

<p>- Đảm bảo an to&agrave;n, mỗi b&igrave;nh gas đều đ&atilde; được mua bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng;</p>

<p>- Gi&aacute; cả cạnh tranh, ch&iacute;nh s&aacute;ch chiết khấu tốt cho doanh nghiệp, nh&agrave; h&agrave;ng sử dụng nhiều;</p>

<p>- Giao h&agrave;ng v&agrave; lắp đặt tận nơi nhanh ch&oacute;ng MIỄN PH&Iacute;;</p>

<p>- Hỗ trợ kiểm tra van, d&acirc;y dẫn, bếp miễn ph&iacute;; kiểm tra r&ograve; rỉ gas bằng m&aacute;y d&ograve; chuy&ecirc;n dụng sau khi lắp đặt để đảm bảo an to&agrave;n cho người sử dụng.</p>

<p>- Hỗ trợ thiết kế, lắp đặt hệ thống gas c&ocirc;ng nghiệp &amp; tặng k&egrave;m tủ điện th&ocirc;ng minh để kiểm so&aacute;t qu&aacute; tr&igrave;nh sử dụng gas qua ứng dụng.</p>

<p>&nbsp;</p>

<h2><strong>3. Lưu &yacute; khi mua b&igrave;nh gas HP 12kg van chụp &phi;20</strong></h2>

<p>Hiện nay, t&igrave;nh trạng chiếm dụng vỏ b&igrave;nh để sang chiết gas lậu với thủ đoạn tinh vi diễn ra tr&agrave;n lan khiến người d&ugrave;ng gặp nhiều kh&oacute; khăn khi ph&acirc;n biệt. Mua phải gas lậu kh&ocirc;ng chỉ l&agrave;m gia tăng nguy cơ mất an to&agrave;n ch&aacute;y nổ m&agrave; người d&ugrave;ng c&ograve;n mất đi nhiều quyền lợi như: gas yếu, nhanh hết gas, kh&ocirc;ng được hỗ trợ thiệt hại khi gặp sự cố. Do đ&oacute;, người d&ugrave;ng cần lưu &yacute; một số điều sau khi đặt mua b&igrave;nh gas HP 12kg van chụp &phi;20:</p>

<p>- Chỉ mua b&igrave;nh gas tại c&aacute;c cửa h&agrave;ng/đại l&yacute; ph&acirc;n phối ch&iacute;nh h&atilde;ng, c&oacute; đăng k&yacute; kinh doanh LPG; kh&ocirc;ng n&ecirc;n mua tại c&aacute;c cửa h&agrave;ng nhỏ lẻ, kh&ocirc;ng c&oacute; đăng k&yacute; r&otilde; r&agrave;ng.</p>

<p>- Khi nh&acirc;n vi&ecirc;n giao gas đến tận nh&agrave;, kh&aacute;ch h&agrave;ng n&ecirc;n c&acirc;n b&igrave;nh gas v&agrave; kiểm tra kỹ c&aacute;c dấu hiệu c&oacute; thể bị l&agrave;m giả. H&atilde;y từ chối nhận h&agrave;ng nếu c&oacute; c&aacute;c dấu hiệu như:&nbsp;</p>

<blockquote>
<p>+ B&igrave;nh gas bị thiếu c&acirc;n (sai số tối đa l&agrave; &plusmn;0.2kg, nếu nhẹ hay nặng hơn 0,2kg l&agrave; bất thường);</p>

<p>+ Vỏ b&igrave;nh gas bị m&oacute;p m&eacute;o/rỉ s&eacute;t nghi&ecirc;m trọng;</p>

<p>+ Van cổ b&igrave;nh gas kh&ocirc;ng c&oacute; m&agrave;ng co ni&ecirc;m phong;</p>

<p>+ Kh&ocirc;ng c&oacute; c&oacute; tem chống h&agrave;ng giả hoặc c&oacute; dấu hiệu bị x&eacute;/hư hại/l&agrave;m giả;</p>

<p>+ Th&ocirc;ng tin in nổi tr&ecirc;n quai x&aacute;ch thiếu hoặc bị l&agrave;m mờ;</p>

<p>+ B&igrave;nh gas đ&atilde; hết hạn kiểm định (tr&ecirc;n 5 năm).&nbsp;</p>
</blockquote>

<blockquote>
<p>►<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/4-dau-hieu-nhan-biet-binh-gas-gia-va-luu-y-khi-dat-gas.77" target="_blank"><em>4 dấu hiệu nhận biết b&igrave;nh gas giả v&agrave; lưu &yacute; khi đặt gas</em></a></p>
</blockquote>
', 1, 7, 1, 495000.0000, N'GAS HP 12KG VAN CHUP 20.png', 300, 24, CAST(N'2024-07-14T10:47:28.207' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (4, N'binh-gas-12kg-van-chup-16', N'GAS HP 12KG VAN CHỤP 16', N'Hanoi Petro;12kg;van 16', N'Gas HP 12kg.', N'<p>1. Tại sao n&ecirc;n chọn b&igrave;nh gas HP 12kg van chụp &phi;16?</p>

<p>C&ugrave;ng với Petrolimex, PetroVietnam, Hanoi Petro (HP) l&agrave; một trong những thương hiệu gas c&oacute; thị phần lớn, được người d&ugrave;ng tại H&agrave; Nội v&agrave; c&aacute;c tỉnh miền Bắc tin d&ugrave;ng. Sản phẩm b&igrave;nh gas 12kg van chụp &phi;16 của Hanoi Petro lu&ocirc;n được người nội trợ đ&aacute;nh gi&aacute; cao bởi: &nbsp;</p>

<p>&nbsp;</p>

<p>1.1. Hanoi Petro l&agrave; thương hiệu gas uy t&iacute;n</p>

<p>Hanoi Petro (HP) l&agrave; thương hiệu gas thuộc C&ocirc;ng ty Đầu tư Dầu Kh&iacute; H&agrave; Nội, một trong những doanh nghiệp sản xuất, kinh doanh kh&iacute; đốt l&acirc;u đời tại khu vực miền Bắc với hơn 16 năm kinh nghiệm trong ng&agrave;nh.</p>

<p>&nbsp;</p>

<p>Hiện nay, Hanoi Petro l&agrave; một trong những doanh nghiệp đứng đầu trong lĩnh vực cung cấp kh&iacute; đốt (LPG) với nh&agrave; m&aacute;y sản xuất vỏ b&igrave;nh, trạm chiết nạp c&oacute; c&ocirc;ng suất tồn trữ đến 650 tấn, mạng lưới b&aacute;n lẻ rộng khắp c&aacute;c tỉnh miền Bắc th&ocirc;ng qua c&aacute;c Đại l&yacute;, Tổng đại l&yacute;. Nhờ ch&uacute; trọng v&agrave;o chất lượng, hiệu quả v&agrave; độ an to&agrave;n, Hanoi Petro đ&atilde; tạo dựng được uy t&iacute;n, được c&aacute;c hộ gia đ&igrave;nh, qu&aacute;n ăn, nh&agrave; h&agrave;ng, cơ sở sản xuất - kinh doanh tin d&ugrave;ng.</p>

<p>&nbsp;</p>

<p>1.2. Chất lượng gas HP 12kg van chụp &phi;16 lu&ocirc;n được đảm bảo</p>

<p>Hanoi Petro hiện đang sở hữu nh&agrave; m&aacute;y chiết nạp đạt quy chuẩn Quốc gia trong ng&agrave;nh kh&iacute; dầu mỏ h&oacute;a lỏng. Nhi&ecirc;n liệu (LPG) được sử dụng để chiết nạp v&agrave;o b&igrave;nh gas HP 12kg van chụp 16 đều được nhập từ c&aacute;c nh&agrave; cung cấp uy t&iacute;n trong nước hoặc nước ngo&agrave;i, c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Do đ&oacute;, chất lượng nước gas lu&ocirc;n được đảm bảo sạch, th&agrave;nh phần ch&iacute;nh chỉ bao gồm Butane, Propane v&agrave; chất tạo m&ugrave;i, kh&ocirc;ng pha trộn tạp chất.</p>

<p>B&ecirc;n cạnh đ&oacute;, nhờ ứng dụng d&acirc;y chuyển chiết nạp tự động h&oacute;a cao n&ecirc;n nước gas trong b&igrave;nh gas Hanoi Petro 12kg van chụp được đảm bảo c&acirc;n đủ kg với sai số nhỏ hơn &plusmn;0.2kg. Hai th&agrave;nh phần ch&iacute;nh trong nước gas l&agrave; Butan, Propan được chiết nạp theo tỷ lệ từ 30 &harr; 70% mol. Đ&acirc;y l&agrave; tỷ lệ chuẩn, ph&ugrave; hợp với điều kiện kh&iacute; hậu v&agrave; kết cấu bếp nấu tại Việt Nam, gi&uacute;p tối ưu hiệu suất ch&aacute;y, tiết kiệm gas.</p>

<p>Nhờ đ&oacute;, gas HP 12kg van chụp &phi;16 khi nấu cho ngọn lửa xanh, kh&ocirc;ng c&oacute; m&ugrave;i h&ocirc;i kh&oacute; chịu như c&aacute;c loại gas lậu c&oacute; pha trộn tạp chất, lửa ch&aacute;y mạnh &amp; đều, tiết kiệm nhi&ecirc;n liệu v&agrave; thời gian đun nấu v&agrave; kh&ocirc;ng l&agrave;m đen nồi.&nbsp;</p>

<p>&nbsp;</p>

<p>1.3. B&igrave;nh gas Hanoi Petro 12kg van chụp c&oacute; độ an to&agrave;n cao</p>

<p>Để đảm bảo độ an to&agrave;n chống ch&aacute;y nổ, quy tr&igrave;nh sản xuất vỏ b&igrave;nh gas van chụp HP 12kg tu&acirc;n thủ đầy đủ c&aacute;c ti&ecirc;u chuẩn TCVN 6292:1997 (Việt Nam) v&agrave; DOT 4BA-240 (Hoa Kỳ). Sử dụng vật liệu th&eacute;p chuy&ecirc;n dụng c&oacute; độ d&agrave;y đến 2,6 ly được nhập khẩu từ Nhật Bản, quy tr&igrave;nh chế tạo được kiểm so&aacute;t nghi&ecirc;m ngặt để đảm bảo độ bền v&agrave; độ an to&agrave;n cao nhất. Nhờ sử dụng vật liệu chất lượng, độ d&agrave;y th&agrave;nh b&igrave;nh đạt chuẩn n&ecirc;n mỗi vỏ b&igrave;nh Hanoi Petro 12kg cam thường c&oacute; khối lượng &gt;13kg.</p>

<p>&nbsp;</p>

<p>Mỗi vỏ b&igrave;nh gas HP 12kg van chụp 16 đều trải qua c&aacute;c bước kiểm tra, kiểm định khắt khe của c&aacute;c cơ quan c&oacute; thẩm quyền, đảm bảo đạt ti&ecirc;u chuẩn trước khi lưu h&agrave;nh tr&ecirc;n thị trường. Sau 5 năm, doanh nghiệp sẽ thu hồi vỏ b&igrave;nh để đ&aacute;nh gi&aacute; chất lượng, khắc phục điểm bất thường (nếu c&oacute;) v&agrave; đưa đi kiểm định lại trước khi tiếp tục lưu th&ocirc;ng để hạn chế sự c&oacute; c&oacute; thể xảy ra.</p>

<p>&nbsp;</p>

<p>1.4. An to&agrave;n hơn với van chụp &phi;16</p>

<p>B&igrave;nh gas HP 12kg m&agrave;u cam trang bị van kiểu đứng, tương th&iacute;ch với loại van chụp c&oacute; phi 16 (&phi;16). Mặc d&ugrave; gi&aacute; cao hơn loại van ngang nhưng van chụp sử dụng tiện lợi v&agrave; c&oacute; độ an to&agrave;n cao hơn nhờ t&iacute;ch hợp cảm ứng tự động ngắt gas, hạn chế c&aacute;c sự cố do r&ograve; rỉ gas.&nbsp;</p>

<p>&gt;&gt;&gt;Xem th&ecirc;m: C&aacute;c loại van b&igrave;nh gas 12kg: Chọn van ngang hay van chụp</p>

<p>1.5. C&oacute; tem chống h&agrave;ng giả v&agrave; bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng</p>

<p>Để hạn chế t&igrave;nh trạng chiếm dụng vỏ b&igrave;nh sang chiết tr&aacute;i ph&eacute;p gas Hanoi Petro 12kg giả, ngo&agrave;i c&aacute;c th&ocirc;ng tin được in nổi tr&ecirc;n vỏ b&igrave;nh khi sản xuất, Hanoi Petro c&ograve;n trang bị tem chống h&agrave;ng giả (Theo ti&ecirc;u chuẩn của Bộ C&ocirc;ng an), được d&aacute;n tr&ecirc;n van cổ b&igrave;nh gas.</p>

<p>Ngo&agrave;i ra, để đảm bảo quyền lợi, gi&uacute;p kh&aacute;ch h&agrave;ng y&ecirc;n t&acirc;m sử dụng gas, h&atilde;ng đ&atilde; mua bảo hiểm ch&aacute;y nổ cho người ti&ecirc;u d&ugrave;ng cho mỗi b&igrave;nh gas HP 12kg van chụp &phi;16 trước khi lưu h&agrave;nh ra thị trường. Nếu c&oacute; sự cố ch&aacute;y nổ xảy ra do lỗi b&igrave;nh gas, kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ đại l&yacute;/nh&agrave; sản xuất để được hướng dẫn thủ tục đền b&ugrave; thiệt hại do sự cố thỏa đ&aacute;ng.</p>

<p>&nbsp;</p>

<p>2. Tại sao n&ecirc;n đặt gas HP 12kg van chụp &phi;16 tại GasStore?</p>

<p>GasStore l&agrave; đối t&aacute;c ph&acirc;n phối ch&iacute;nh thức c&aacute;c sản phẩm thương hiệu Hanoi Petro (HP), trong đ&oacute; c&oacute; b&igrave;nh gas HP 12kg m&agrave;u cam tại H&agrave; Nội v&agrave; thị trường miền Bắc.</p>

<p>Kh&aacute;ch h&agrave;ng mua b&igrave;nh HP 12kg van chụp &phi;16 tại GasStore sẽ được cam kết:</p>

<p>- Sản phẩm ch&iacute;nh h&atilde;ng, c&oacute; tem chống h&agrave;ng giả;</p>

<p>- Đảm bảo an to&agrave;n, mỗi b&igrave;nh gas đều đ&atilde; được mua bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng;</p>

<p>- Gi&aacute; cả cạnh tranh, ch&iacute;nh s&aacute;ch chiết khấu tốt cho doanh nghiệp, nh&agrave; h&agrave;ng sử dụng nhiều;</p>

<p>- Giao h&agrave;ng v&agrave; lắp đặt tận nơi nhanh ch&oacute;ng MIỄN PH&Iacute;;</p>

<p>- Hỗ trợ kiểm tra van, d&acirc;y dẫn, bếp miễn ph&iacute;; kiểm tra r&ograve; rỉ gas bằng m&aacute;y d&ograve; chuy&ecirc;n dụng sau khi lắp đặt để đảm bảo an to&agrave;n cho người sử dụng.</p>

<p>- Hỗ trợ thiết kế, lắp đặt hệ thống gas c&ocirc;ng nghiệp &amp; tặng k&egrave;m tủ điện th&ocirc;ng minh để kiểm so&aacute;t qu&aacute; tr&igrave;nh sử dụng gas qua ứng dụng.</p>

<p>&nbsp;</p>

<p>3. Lưu &yacute; khi mua b&igrave;nh gas HP 12kg van chụp &phi;16</p>

<p>Hiện nay, t&igrave;nh trạng chiếm dụng vỏ b&igrave;nh để sang chiết gas lậu với thủ đoạn tinh vi diễn ra tr&agrave;n lan khiến người d&ugrave;ng gặp nhiều kh&oacute; khăn khi ph&acirc;n biệt. Mua phải gas lậu kh&ocirc;ng chỉ l&agrave;m gia tăng nguy cơ mất an to&agrave;n ch&aacute;y nổ m&agrave; người d&ugrave;ng c&ograve;n mất đi nhiều quyền lợi như: gas yếu, nhanh hết gas, kh&ocirc;ng được hỗ trợ thiệt hại khi gặp sự cố. Do đ&oacute;, người d&ugrave;ng cần lưu &yacute; một số điều sau khi đặt mua b&igrave;nh gas HP 12kg van chụp &phi;16:</p>

<p>- Chỉ mua b&igrave;nh gas tại c&aacute;c cửa h&agrave;ng/đại l&yacute; ph&acirc;n phối ch&iacute;nh h&atilde;ng, c&oacute; đăng k&yacute; kinh doanh LPG; kh&ocirc;ng n&ecirc;n mua tại c&aacute;c cửa h&agrave;ng nhỏ lẻ, kh&ocirc;ng c&oacute; đăng k&yacute; r&otilde; r&agrave;ng.</p>

<p>- Khi nh&acirc;n vi&ecirc;n giao gas đến tận nh&agrave;, kh&aacute;ch h&agrave;ng n&ecirc;n c&acirc;n b&igrave;nh gas v&agrave; kiểm tra kỹ c&aacute;c dấu hiệu c&oacute; thể bị l&agrave;m giả. H&atilde;y từ chối nhận h&agrave;ng nếu c&oacute; c&aacute;c dấu hiệu như:&nbsp;</p>

<blockquote>
<p>◾ B&igrave;nh gas bị thiếu c&acirc;n (sai số tối đa l&agrave; &plusmn;0.2kg, nếu nhẹ/nặng hơn 0.2kg l&agrave; bất thường);</p>

<p>◾ Vỏ b&igrave;nh gas bị m&oacute;p m&eacute;o/rỉ s&eacute;t nghi&ecirc;m trọng;</p>

<p>◾ Van cổ b&igrave;nh gas kh&ocirc;ng c&oacute; m&agrave;ng co ni&ecirc;m phong;</p>

<p>◾ Kh&ocirc;ng c&oacute; c&oacute; tem chống h&agrave;ng giả hoặc c&oacute; dấu hiệu bị x&eacute;/hư hại/l&agrave;m giả;</p>

<p>◾ Th&ocirc;ng tin in nổi tr&ecirc;n quai x&aacute;ch thiếu hoặc bị l&agrave;m mờ;</p>

<p>◾ B&igrave;nh gas đ&atilde; hết hạn kiểm định (tr&ecirc;n 5 năm).&nbsp;</p>
</blockquote>
', 1, 7, 1, 495000.0000, N'GAS HP 12KG VAN CHUP 16.png', 304, 24, CAST(N'2024-07-14T10:47:28.207' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (5, N'gas-PetroVietnam-12kg-van-ngang', N' GAS PETROVIETNAM 12KG VAN NGANG', N'PetroVietnam', N'Bình gas 12kg.', N'<p>C&ugrave;ng với&nbsp;<a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/petrolimex" target="_blank">Petrolimex</a>, PetroVietnam l&agrave; một trong những thương hiệu gas uy t&iacute;n, l&acirc;u đời tại Việt Nam&nbsp;với d&ograve;ng sản phẩm đa dạng gồm gas d&acirc;n dụng v&agrave; gas c&ocirc;ng nghiệp. Trong đ&oacute;, sản phẩm b&igrave;nh gas 12kg PetroVietnam van ngang lu&ocirc;n được người nội trợ Việt tin d&ugrave;ng.&nbsp;&nbsp;</p>

<p>&nbsp;</p>

<h2><strong>1. Tại sao n&ecirc;n chọn gas PetroVietnam 12kg van ngang?</strong></h2>

<p>Tương tự c&aacute;c d&ograve;ng sản phẩm kh&aacute;c của PV GAS LPG, PetroVietnam van chụp 12kg lu&ocirc;n được người ti&ecirc;u d&ugrave;ng đ&aacute;nh gi&aacute; cao bởi:</p>

<p>&nbsp;</p>

<h3><strong>1.1. &ldquo;PetroVietNam&rdquo; l&agrave; thương hiệu gas uy t&iacute;n h&agrave;ng đầu</strong></h3>

<p>L&agrave; thương hiệu thuộc Tập đo&agrave;n Dầu kh&iacute; Việt Nam, gas PetroVietnam đ&atilde; tạo dựng được l&ograve;ng tin từ người ti&ecirc;u d&ugrave;ng trong suốt v&agrave;i chục năm h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển. Uy t&iacute;n của thương hiệu được x&acirc;y dựng dựa tr&ecirc;n chất lượng sản phẩm, gi&aacute; th&agrave;nh, hệ thống ph&acirc;n phối v&agrave; v&agrave; chất lượng dịch vụ.</p>

<p><img alt="PetroVietnam là thương hiệu gas uy tín hàng đầu" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thuong-hieu-gas-petrovietnam.jpg" /></p>

<p>Sản phẩm&nbsp;<a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/petrovietnam" target="_blank">b&igrave;nh gas PetroVietnam</a>&nbsp;kh&aacute; đa dạng, trải d&agrave;i ở c&aacute;c ph&acirc;n kh&uacute;c từ gas d&acirc;n dụng đến gas c&ocirc;ng nghiệp, khối lượng từ 6kg đến 45kg. Trong đ&oacute;, c&aacute;c loại b&igrave;nh gas PetroVietnam 12kg m&agrave;u Hồng - X&aacute;m - Xanh - Đỏ đều&nbsp;được người nội trợ rất ưa chuộng.</p>

<p>&nbsp;</p>

<h3><strong>1.2. Nước gas PetroVietnam 12kg van ngang chất lượng cao</strong></h3>

<p>X&aacute;c định uy t&iacute;n v&agrave; chất lượng l&agrave; yếu tố h&agrave;ng đầu tạo n&ecirc;n sự th&agrave;nh c&ocirc;ng của thương hiệu, PV GAS LPG lu&ocirc;n ch&uacute; trọng v&agrave;o việc ph&aacute;t triển, n&acirc;ng cấp c&aacute;c d&ograve;ng sản phẩm ph&ugrave; hợp với thị hiếu, nhu cầu của người d&ugrave;ng. B&igrave;nh gas PetroVietnam 12kg van chụp được&nbsp;người nội trợ ưa chuộng bởi hiệu quả đun nấu tối ưu, d&ugrave;ng tiết kiệm - l&acirc;u hết gas v&agrave; kh&ocirc;ng c&oacute; m&ugrave;i kh&oacute; chịu khi ch&aacute;y như c&aacute;c b&igrave;nh gas k&eacute;m t&ecirc;n tuổi.</p>

<p>Để tạo ra b&igrave;nh gas đ&aacute;p ứng những điều n&agrave;y, PV GAS LPG c&oacute; quy tr&igrave;nh quản l&yacute;, kiểm so&aacute;t chặt chẽ, đặc biệt l&agrave; nguy&ecirc;n liệu đầu v&agrave;o v&agrave; quy chuẩn chiết nạp, đ&oacute;ng b&igrave;nh. Chất lượng của gas PetroVietnam 12kg hồng được đảm bảo nhờ tu&acirc;n thủ c&aacute;c yếu tố:</p>

<blockquote>
<p><em>-&nbsp;<strong>Nước gas chất lượng, c&oacute; xuất xứ r&otilde; r&agrave;ng</strong></em></p>
</blockquote>

<p>L&agrave; doanh nghiệp sản xuất, nhập khẩu kh&iacute; đốt lớn nhất Việt Nam, cung cấp khoảng 65% nhu cầu trong nước, PV GAS LPG lu&ocirc;n đảm bảo nguồn cung ổn định để tạo ra sản phẩm c&oacute; chất lượng tốt nhất.&nbsp;</p>

<p>Hiện nay, khoảng 70%&nbsp;<a href="https://gas40.com/tin-tuc/gas-la-gi-thanh-phan-va-dac-tinh-co-ban-cua-gas.1" target="_blank">LPG</a>&nbsp;chiết nạp cho b&igrave;nh gas PetroVietnam 12kg van ngang được nhập khẩu từ c&aacute;c quốc gia kh&aacute;c, đạt ti&ecirc;u chuẩn quốc tế. Khoảng 30% c&ograve;n lại sử dụng LPG do ch&iacute;nh PV GAS sản xuất tại Nh&agrave; m&aacute;y xử l&yacute; kh&iacute; Dinh Cố (GPP Dinh Cố) v&agrave; Nh&agrave; m&aacute;y xử l&yacute; kh&iacute; C&agrave; Mau (GPP C&agrave; Mau). LPG được sản xuất tại 2 nh&agrave; m&aacute;y n&agrave;y đều đ&aacute;p ứng ti&ecirc;u chuẩn QCVN 8:2012/BKHCN (đang chuyển đổi sang QCVN8:2019/BKHCN).</p>

<p>&nbsp;</p>

<p>Đặc biệt, PV GAS cam kết kh&ocirc;ng sử dụng h&oacute;a chất, kh&ocirc;ng pha trộn tạp chất trong qu&aacute; tr&igrave;nh pha chế, chiết nạp, đảm bảo nước gas sạch, c&oacute; hiệu suất đốt ch&aacute;y cao. C&aacute;c th&agrave;nh phần chất tạo m&ugrave;i được giới hạn theo TCCS để kh&ocirc;ng g&acirc;y hại cho người sử dụng hay t&aacute;c động xấu đến m&ocirc;i trường. Chưa kể, gas sạch khi nấu sẽ cho ngọn lửa m&agrave;u xanh &ldquo;lam&rdquo;, kh&ocirc;ng c&oacute; tạp chất bị đốt ch&aacute;y b&aacute;m v&agrave;o đ&aacute;y nồi, duy tr&igrave; tuổi thọ đồng thời tiết kiệm thời gian vệ sinh, lau ch&ugrave;i nồi, chảo, đầu đốt,...&nbsp;</p>

<blockquote>
<p><em>-&nbsp;<strong>Tỷ lệ th&agrave;nh phần kh&iacute; gas PetroVietnam 12kg được chiết nạp chuẩn</strong></em></p>
</blockquote>

<p>Kh&ocirc;ng chỉ chất lượng LPG, tỷ lệ th&agrave;nh phần kh&iacute; Butane v&agrave; Propane khi chiết nạp cũng được PV GAS c&acirc;n chỉnh&nbsp;để mang lại hiệu quả đốt ch&aacute;y tối ưu khi sử dụng. Để ph&ugrave;&nbsp;hợp với điều kiện kh&iacute; hậu Việt Nam,&nbsp;Butane v&agrave; Propane được chiết nạp v&agrave;o b&igrave;nh gas PetroVietnam van ngang&nbsp;12kg theo tỷ lệ 50&plusmn;20% mol (30&harr;70% mol). Đ&acirc;y l&agrave; tỷ lệ &ldquo;chuẩn&rdquo; để gas đốt ch&aacute;y hiệu quả, cung cấp nhiệt lượng cao, tr&aacute;nh l&atilde;ng ph&iacute; kh&iacute; gas chưa đốt ch&aacute;y ho&agrave;n to&agrave;n thất tho&aacute;t ra m&ocirc;i trường. Đ&acirc;y cũng l&agrave; l&yacute; do tại sao d&ugrave;ng b&igrave;nh gas PetroVietnam sẽ tiết kiệm, l&acirc;u hết gas hơn c&aacute;c loại gas k&eacute;m t&ecirc;n tuổi, tr&ocirc;i nổi tr&ecirc;n thị trường. &nbsp; &nbsp;</p>

<blockquote>
<p><em>-&nbsp;<strong>Hệ thống ph&acirc;n phối gas được quản l&yacute; chặt chẽ</strong></em></p>
</blockquote>

<p><img alt="Điều kiện cửa hàng kinh doanh gas PetroVietnam 12kg" src="https://ecom.viettechsmart.com:5020/Media/Images/0/cua-hang-kinh-doanh-gas-petrovietnam-12kg.jpg" /></p>

<p>Ngo&agrave;i quy tr&igrave;nh kiểm so&aacute;t sản xuất, chiết nạp, đ&oacute;ng b&igrave;nh, PV GAS c&ograve;n ph&aacute;t triển, x&acirc;y dựng v&agrave; quản l&yacute; hệ thống ph&acirc;n phối chặt chẽ nhằm cung cấp cho kh&aacute;ch h&agrave;ng b&igrave;nh gas ch&iacute;nh h&atilde;ng với chất lượng đạt chuẩn. B&ecirc;n cạnh c&aacute;c cửa h&agrave;ng b&aacute;n lẻ thuộc PV GAS LPG, c&aacute;c tổng đại l&yacute;, đại l&yacute; ph&acirc;n phối gas PetroVietnam phải tu&acirc;n thủ c&aacute;c điều kiện nhất định theo quy định tại Điều 10 Nghị định 87/2018/NĐ-CP về hoạt động kinh doanh kh&iacute;. Trong đ&oacute;, cửa h&agrave;ng phải cam kết kh&ocirc;ng thực hiện r&uacute;t ruột, sang chiết lại b&igrave;nh gas để đảm bảo chất lượng, khối lượng ban đầu. &nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1.3. Vỏ b&igrave;nh gas PetroVietnam 12kg đạt ti&ecirc;u chuẩn xuất khẩu</strong></h3>

<p>C&ugrave;ng với chất lượng, độ an to&agrave;n l&agrave; yếu tố quan trọng được PV GAS LPG ch&uacute; trọng. Được sản xuất theo ti&ecirc;u chuẩn&nbsp;<a href="https://gas40.com/tin-tuc/tim-hieu-ve-tieu-chuan-vo-binh-gas-12kg-dot-4ba-240.127" target="_blank">DOT 4BA-240</a>&nbsp;(Hoa Kỳ), TCVN 6292-1997, EN 1442: 2017 v&agrave; ISO 4706: 2008, vỏ b&igrave;nh gas PetroVietnam đủ điều kiện để xuất khẩu sang thị trường EU v&agrave; nhiều nước tr&ecirc;n thế giới.</p>

<p>Tất cả vỏ b&igrave;nh gas PetroVietnam, trong đ&oacute; c&oacute; b&igrave;nh 12kg van ngang đều được sản xuất tr&ecirc;n d&acirc;y chuyền kh&eacute;p k&iacute;n hiện đại, m&aacute;y m&oacute;c nhập khẩu từ c&aacute;c nước G7 (Nhật Bản, Mỹ,...) với khả năng tự động h&oacute;a đến 80%. Những nguy&ecirc;n liệu đầu v&agrave;o như th&eacute;p, van, đệm van, d&acirc;y h&agrave;n, thuốc h&agrave;n,... đều được nhập khẩu từ c&aacute;c nh&agrave; cung cấp lớn, uy t&iacute;n tr&ecirc;n thế giới của Nhật Bản, Th&aacute;i lan, H&agrave;n Quốc,...</p>

<p><img alt="Tiêu chuẩn vỏ bình gas Petrovietnam 12kg van ngang" src="https://ecom.viettechsmart.com:5020/Media/Images/0/tieu-chuan-vo-binh-gas-petrovietnam-12kg.jpg" /></p>

<p>B&ecirc;n cạnh đ&oacute;, quy tr&igrave;nh sản xuất lu&ocirc;n tu&acirc;n thủ c&aacute;c y&ecirc;u cầu của hệ thống quản l&yacute; chất lượng ISO 9001: 2008. C&aacute;c c&ocirc;ng đoạn từ ph&ocirc;i đến th&agrave;nh phẩm đều được kiểm so&aacute;t chặt chẽ để mang đến những vỏ b&igrave;nh gas c&oacute; chất lượng, độ an to&agrave;n cao. Mỗi vỏ b&igrave;nh đều được kiểm định chất lượng, độ an to&agrave;n trước khi đưa v&agrave;o chiết nạp, lưu th&ocirc;ng tr&ecirc;n thị trường.</p>

<p>&nbsp;</p>

<h3><strong>1.4. C&oacute; bảo hiểm tr&aacute;ch nhiệm ch&aacute;y nổ cho người ti&ecirc;u d&ugrave;ng</strong></h3>

<p>Để bảo vệ quyền lợi cho người ti&ecirc;u d&ugrave;ng, tất cả b&igrave;nh gas PetroVietnam 12kg van ngang đều đ&atilde; được mua bảo hiểm tr&aacute;ch nhiệm ch&aacute;y nổ cho người ti&ecirc;u d&ugrave;ng trước khi b&aacute;n ra thị trường. Với bảo hiểm n&agrave;y, người d&ugrave;ng gas sẽ được bồi thường thiệt hại l&ecirc;n tới 2 tỷ đồng/vụ nếu b&igrave;nh gas ch&aacute;y nổ do lỗi sản xuất (kh&ocirc;ng phải lỗi người sử dụng). Do đ&oacute;, c&aacute;c gia đ&igrave;nh c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m khi d&ugrave;ng gas PetroVietNam 12kg.</p>

<p>&nbsp;</p>

<h3><strong>1.5. PetroVietnam c&oacute; tem chống h&agrave;ng giả để ph&acirc;n biệt gas ch&iacute;nh h&atilde;ng</strong>&nbsp;</h3>

<p>L&agrave; thương hiệu uy t&iacute;n, gas PetroVietnam bị l&agrave;m giả kh&aacute; nhiều. Tuy nhi&ecirc;n, b&igrave;nh gas PetroVietnam 12kg van ngang ch&iacute;nh h&atilde;ng c&oacute; d&aacute;n nh&atilde;n h&agrave;ng ho&aacute;, ni&ecirc;m m&agrave;ng co v&agrave; tem chống h&agrave;ng giả ngay tr&ecirc;n vỏ b&igrave;nh gas. Loại tem n&agrave;y được in dưới dạng QR Code, đ&atilde; đăng k&yacute; với Bộ C&ocirc;ng an. Người d&ugrave;ng dễ d&agrave;ng kiểm tra th&ocirc;ng tin chi tiết sản phẩm v&agrave; truy xuất nguồn gốc b&igrave;nh gas (NSX) bằng c&aacute;ch qu&eacute;t m&atilde; n&agrave;y.</p>

<p>&nbsp;</p>

<h2><strong>2. C&aacute;ch nhận biết gas PetroVietnam 12kg van ngang ch&iacute;nh h&atilde;ng</strong></h2>

<p>Để kiểm tra b&igrave;nh gas PetroVietnam 12kg m&igrave;nh mua c&oacute; phải l&agrave; sản phẩm ch&iacute;nh h&atilde;ng, kh&aacute;ch h&agrave;ng c&oacute; thể sử dụng 1 trong 3 c&aacute;ch sau:</p>

<p>&nbsp;</p>

<h3><strong>2.1. Qu&eacute;t m&atilde; QR Code tr&ecirc;n tem chống h&agrave;ng giả</strong></h3>

<p>Để nhận biết b&igrave;nh gas PetroVietnam 12kg&nbsp;thật hay giả bằng tem chống h&agrave;ng giả c&oacute; m&atilde; QR Code, người d&ugrave;ng thực hiện c&aacute;c bước sau:</p>

<p>&rarr;&nbsp;<strong>Bước 1:</strong>&nbsp;Kh&aacute;ch h&agrave;ng mở ứng dụng c&oacute; t&iacute;nh năng qu&eacute;t m&atilde; QR Code như Zalo/Viber/Wincheck,...&nbsp;</p>

<p><img alt="Cách kiểm tra bình gas PetroVietnam 12kg xanh PL chính hãng B1" src="https://ecom.viettechsmart.com:5020/Media/Images/0/check-tem-chong-hang-gia-gas-petrovietnam-b1.jpg" /></p>

<p>&rarr;&nbsp;<strong>Bước 2:</strong>&nbsp;Hướng m&agrave;n h&igrave;nh camera đến chỗ c&oacute; m&atilde; QR tr&ecirc;n tem d&aacute;n ở nắp van cổ b&igrave;nh gas v&agrave; qu&eacute;t m&atilde;.&nbsp;</p>

<p><img alt="Quét mã QR để kiểm tra gas Petrovietnam 12kg chính hãng" src="https://ecom.viettechsmart.com:5020/Media/Images/0/nhan-biet-gas-petrovietnam-12kg-that-gia-2.jpg" /></p>

<p>&rarr;&nbsp;<strong>Bước 3:</strong>&nbsp;C&aacute;c th&ocirc;ng tin chi tiết về sản phẩm v&agrave; xuất xứ (nh&agrave; sản xuất) sẽ hiển thị tr&ecirc;n m&agrave;n h&igrave;nh ứng dụng để kh&aacute;ch h&agrave;ng kiểm tra. Nếu kiểm tra m&atilde; nhưng kh&ocirc;ng hiển thị th&ocirc;ng tin th&igrave; rất c&oacute; thể đ&oacute; l&agrave; b&igrave;nh gas giả.</p>

<p><img alt="Bình gas PetroVietnam 12kg chính hãng có xuất xứ rõ ràng" src="https://ecom.viettechsmart.com:5020/Media/Images/0/nhan-biet-gas-petrovietnam-12kg-that-gia-3.jpg" /></p>

<h3><strong>2.2. C&acirc;n trọng lượng b&igrave;nh gas PetroVietnam van ngang 12kg</strong></h3>

<p>Vỏ b&igrave;nh gas PetroVietnam van ngang 12kg&nbsp;c&oacute; khối lượng khoảng 13,5 - 14,5kg. Khối lượng gas chiết nạp (nước gas) l&agrave; 12kg (&plusmn;0.1kg). Người mua c&oacute; thể kiểm tra tổng khối lượng của cả b&igrave;nh khi nh&acirc;n vi&ecirc;n giao h&agrave;ng đến v&agrave; khối lượng vỏ b&igrave;nh sau khi sử dụng hết để x&aacute;c định xem c&oacute; phải l&agrave; b&igrave;nh gas ch&iacute;nh h&atilde;ng kh&ocirc;ng. Người d&ugrave;ng n&ecirc;n từ chối nhận h&agrave;ng hoặc lựa chọn cửa h&agrave;ng gas kh&aacute;c để mua nếu gặp một trong c&aacute;c trường hợp sau:</p>

<p>- C&acirc;n nặng b&igrave;nh gas l&uacute;c giao h&agrave;ng ch&ecirc;nh lệch so với tổng khối lượng vỏ b&igrave;nh v&agrave; nước gas (khối lượng b&igrave;nh in tr&ecirc;n vỏ + 12kg).&nbsp;</p>

<p>Nếu khối lượng nhỏ hơn, rất c&oacute; thể gas đ&atilde; bị r&uacute;t ruột hoặc sử dụng vỏ b&igrave;nh l&agrave;m giả thương hiệu.</p>

<p>- Sau khi sử dụng hết gas, kh&aacute;ch h&agrave;ng c&acirc;n lại vỏ b&igrave;nh nhưng khối lượng thực tế nhỏ hoặc lớn hơn so với khối lượng in tr&ecirc;n vỏ.&nbsp;</p>

<p>Trường hợp n&agrave;y c&oacute; thể do b&igrave;nh gas gi&aacute; đ&atilde; bị cắt tai m&agrave;i vỏ, &ldquo;độ&rdquo; lại th&agrave;nh thương hiệu PetroVietnam hoặc cửa h&agrave;ng r&uacute;t bớt ruột, h&agrave;n th&ecirc;m kim loại dưới đ&aacute;y b&igrave;nh để tổng khối lượng b&igrave;nh khi giao kh&ocirc;ng nhỏ bất thường.</p>

<blockquote>
<p><em>►&nbsp;<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/lam-sao-de-biet-khoi-luong-1-binh-gas-co-du-12kg-hay-45kg.60" target="_blank">L&agrave;m sao để biết khối lượng 1 b&igrave;nh gas c&oacute; đủ 12kg hay 45kg?</a></em></p>
</blockquote>

<p>&nbsp; &nbsp;</p>

<h3><strong>2.3. Kiểm tra hạn kiểm định v&agrave; th&ocirc;ng tin in tr&ecirc;n vỏ b&igrave;nh gas</strong></h3>

<p>Kiểm tra hạn kiểm định in dập nổi tr&ecirc;n quai x&aacute;ch, nếu b&igrave;nh gas đ&atilde; hết hạn kiểm định hoặc kh&ocirc;ng c&oacute; th&ocirc;ng tin kiểm định, th&ocirc;ng tin c&oacute; dấu hiệu bị x&oacute;a, kh&ocirc;ng sắc n&eacute;t th&igrave; đ&oacute; l&agrave; b&igrave;nh gas kh&ocirc;ng ch&iacute;nh h&atilde;ng.</p>

<blockquote>
<p><em>►&nbsp;<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/4-dau-hieu-nhan-biet-binh-gas-that-va-binh-gas-gia-don-gian.113" target="_blank">C&aacute;c dấu hiệu nhận biết b&igrave;nh gas thật v&agrave; b&igrave;nh gas giả đơn giản</a></em></p>
</blockquote>

<h2><strong>3. Lưu &yacute; khi đặt mua b&igrave;nh gas PetroVietnam 12kg van ngang</strong></h2>

<p>Hiện nay, t&igrave;nh trạng chiếm dụng vỏ b&igrave;nh để sang chiết gas lậu với thủ đoạn tinh vi diễn ra tr&agrave;n lan khiến người d&ugrave;ng gặp nhiều kh&oacute; khăn khi ph&acirc;n biệt. Mua phải gas lậu kh&ocirc;ng chỉ l&agrave;m gia tăng nguy cơ mất an to&agrave;n ch&aacute;y nổ m&agrave; người d&ugrave;ng c&ograve;n mất đi nhiều quyền lợi như: gas yếu, nhanh hết gas, kh&ocirc;ng được hỗ trợ thiệt hại khi gặp sự cố.</p>

<p>Đặc biệt, t&igrave;nh trạng b&igrave;nh PetroVietnam giả được sang chiết lậu v&agrave; lưu h&agrave;nh tr&ecirc;n thị trường kh&aacute; nhiều n&ecirc;n để được đảm bảo quyền lợi, người d&ugrave;ng cần lưu &yacute; những điều sau khi đặt mua b&igrave;nh gas PetroVietnam 12kg van ngang:</p>

<p><img alt="Lưu ý để mua đúng bình Petrovietnam 12kg chính hãng" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-petrovietnam-chuan.jpg" /></p>

<p>- Chỉ mua b&igrave;nh gas tại c&aacute;c cửa h&agrave;ng/đại l&yacute; ph&acirc;n phối ch&iacute;nh h&atilde;ng, c&oacute; đăng k&yacute; kinh doanh LPG; kh&ocirc;ng n&ecirc;n mua tại c&aacute;c cửa h&agrave;ng nhỏ lẻ, kh&ocirc;ng c&oacute; đăng k&yacute; r&otilde; r&agrave;ng.</p>

<p>- Khi nh&acirc;n vi&ecirc;n giao gas đến tận nh&agrave;, kh&aacute;ch h&agrave;ng n&ecirc;n c&acirc;n b&igrave;nh gas v&agrave; kiểm tra kỹ c&aacute;c dấu hiệu c&oacute; thể bị l&agrave;m giả. H&atilde;y từ chối nhận h&agrave;ng nếu c&oacute; c&aacute;c dấu hiệu như:&nbsp;</p>

<blockquote>
<p>◾ B&igrave;nh gas bị thiếu c&acirc;n (sai số tối đa l&agrave; &plusmn;0.2kg, nếu nhẹ hay nặng hơn 0,2kg l&agrave; bất thường);</p>

<p>◾ Vỏ b&igrave;nh gas bị m&oacute;p m&eacute;o/rỉ s&eacute;t nghi&ecirc;m trọng;</p>

<p>◾ Van cổ b&igrave;nh gas kh&ocirc;ng c&oacute; m&agrave;ng co ni&ecirc;m phong;</p>

<p>◾ Kh&ocirc;ng c&oacute; c&oacute; tem chống h&agrave;ng giả hoặc c&oacute; dấu hiệu bị x&eacute;/hư hại/l&agrave;m giả;</p>

<p>◾ Th&ocirc;ng tin in nổi tr&ecirc;n quai x&aacute;ch thiếu hoặc bị l&agrave;m mờ;</p>

<p>◾ B&igrave;nh gas đ&atilde; hết hạn kiểm định (tr&ecirc;n 5 năm).&nbsp;</p>
</blockquote>
', 1, 10, 1, 495000.0000, N'GAS PETROVIETNAM 12KG VAN NGANG.png', 297, 24, CAST(N'2024-07-14T10:47:28.207' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (6, N'gas-petrolimax-12kg-van-ngang', N' GAS PETROLIMEX 12KG VAN NGANG', N'Petrolimex', N'Bình gas 45Kg.', N'<p>Gas&nbsp;Petrolimex 12kg van ngang l&agrave; một sản phẩm của Tổng C&ocirc;ng ty Gas Việt Nam (PGC), được th&agrave;nh lập năm 1998 từ qu&aacute; tr&igrave;nh cổ phần h&oacute;a v&agrave; t&aacute;i cấu tr&uacute;c lại Tổng c&ocirc;ng ty Xăng dầu Việt Nam.</p>

<p><a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/petrolimex" target="_blank">Petrolimex</a>&nbsp;được xếp hạng l&agrave; một trong 3&nbsp;<a href="https://gas40.com/tin-tuc/top-10-thuong-hieu-gas-uy-tin-duoc-nguoi-tieu-dung-lua-chon.46" target="_blank">thương hiệu gas uy t&iacute;n</a>, dẫn đầu về sản lượng cũng như thị phần gas tại Việt Nam. Sản phẩm b&igrave;nh gas Petrolimex c&oacute; mặt tại khắp 63 tỉnh th&agrave;nh tr&ecirc;n khắp cả nước, được người ti&ecirc;u d&ugrave;ng đ&aacute;nh gi&aacute; cao cả về chất lượng, độ an to&agrave;n lẫn sự ổn định về gi&aacute; cả.</p>

<p>Để đ&aacute;p ứng nhu cầu của thị trường, Petrolimex đ&atilde; x&acirc;y dựng mạng lưới kho LPG với sức chứa khoảng 7.800 tấn v&agrave; c&aacute;c nh&agrave; m&aacute;y chiết nạp với c&ocirc;ng nghệ ti&ecirc;n tiến tại H&agrave; Nội, Hải Ph&ograve;ng (3.000 tấn), Đ&agrave; Nẵng (1.000 tấn), TP.HCM (2.000 tấn), Cần Thơ (800 tấn).</p>

<p>Ngo&agrave;i ra, h&atilde;ng c&ograve;n x&acirc;y dựng mạng lưới kho chứa đầu tư tại c&aacute;c trạm chiết nạp cấp 2 tại c&aacute;c khu vực trọng điểm với tổng sức chứa h&agrave;ng ng&agrave;n tấn LPG để đ&aacute;p ứng nhu cầu sinh hoạt v&agrave; sản xuất c&ocirc;ng - n&ocirc;ng nghiệp, thương mại, dịch vụ. C&ugrave;ng với đ&oacute; l&agrave; hệ thống ph&acirc;n phối l&ecirc;n đến h&agrave;ng ng&agrave;n cửa h&agrave;ng chuy&ecirc;n doanh, tổng đại l&yacute; &amp; đại l&yacute; ch&iacute;nh thức.</p>

<p><img alt="Petrolimex là 1 trong 3 thương hiệu gas nổi tiếng Việt Nam" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thuong-hieu-gas-petrolimex.jpg" /></p>

<p>Tổng c&ocirc;ng ty Gas Petrolimex cũng l&agrave; một trong số &iacute;t doanh nghiệp Việt Nam tham gia v&agrave;o tổ chức LPG thế giới (World LP Gas Association), l&agrave; th&agrave;nh vi&ecirc;n của Hiệp hội Gas thế giới cũng l&agrave; th&agrave;nh vi&ecirc;n s&aacute;ng lập của Hiệp hội Gas Việt Nam.</p>

<p>&nbsp;</p>

<h2><strong>1. Tại sao gas Petrolimex 12kg van ngang được tin d&ugrave;ng</strong></h2>

<p>Tr&ecirc;n thị trường hiện nay c&oacute; khoảng 60 thương hiệu gas với h&agrave;ng trăm sản phẩm b&igrave;nh 12kg. Tuy nhi&ecirc;n, Petrolimex vẫn lu&ocirc;n l&agrave; loại gas được người nội trợ ưa chuộng, l&agrave; lựa chọn được ưu ti&ecirc;n h&agrave;ng đầu khi c&oacute; nhu cầu đặt gas. Để đạt được điều đ&oacute;, ngay từ khi ra đời, h&atilde;ng đ&atilde; tu&acirc;n thủ c&aacute;c ti&ecirc;u ch&iacute; chất lượng - an to&agrave;n - tiết kiệm. Mỗi b&igrave;nh gas Petrolimex 12kg van ngang đưa ra thị trường lu&ocirc;n đảm bảo c&aacute;c yếu tố:</p>

<p>&nbsp;</p>

<h3><strong>1.1. Chất lượng gas Petrolimex 12kg được đảm bảo</strong></h3>

<p>Chất lượng lu&ocirc;n l&agrave; yếu tố đầu ti&ecirc;n khiến người ti&ecirc;u d&ugrave;ng y&ecirc;n t&acirc;m khi đặt gas Petrolimex bởi h&atilde;ng lu&ocirc;n cam kết sử dụng nguồn nước gas chất lượng cao. Petrolimex cũng l&agrave; một trong những doanh nghiệp kinh doanh kh&iacute; gas tại Việt Nam ti&ecirc;n phong trong việc chủ động nhập khẩu kh&iacute; đốt tự nhi&ecirc;n để đảm bảo đ&aacute;p ứng nhu cầu cả về sản lượng lẫn chất lượng.</p>

<p>Ngo&agrave;i nước gas nhập khẩu, quy tr&igrave;nh chiết nạp, đ&oacute;ng b&igrave;nh cũng tu&acirc;n thủ ti&ecirc;u chuẩn v&agrave; kiểm so&aacute;t tỷ lệ th&agrave;nh phần nghi&ecirc;m ngặt nhờ d&acirc;y chuyền c&ocirc;ng nghệ tự động để đảm bảo độ tinh khiết v&agrave; an to&agrave;n cao.</p>

<p><em><img alt="Gas Petrolimex 12kg van ngang có chất lượng vượt trội" src="https://ecom.viettechsmart.com:5020/Media/Images/0/chat-luong-gas-petrolimex-12kg.jpg" /></em></p>

<p><em>D&acirc;y chuyền c&ocirc;ng nghệ hiện đại, tự động h&oacute;a được trang bị tại c&aacute;c trạm chiết nạp gas Petrolimex</em></p>

<p>&nbsp;</p>

<p>Mỗi b&igrave;nh gas Petrolimex van ngang 12kg khi đến tay người ti&ecirc;u d&ugrave;ng lu&ocirc;n đảm bảo kh&ocirc;ng bị pha trộn tạp chất, tỷ lệ c&aacute;c th&agrave;nh phần được t&iacute;nh to&aacute;n tỉ mỉ để ph&ugrave; hợp với điều kiện kh&iacute; hậu v&agrave; nhu cầu nhiệt lượng đun nấu. Nhờ đ&oacute; c&oacute; thể tối ưu được lượng gas đốt ch&aacute;y, tiết kiệm thời gian chế biến đồng thời tr&aacute;nh g&acirc;y b&aacute;m cặn l&agrave;m ảnh hưởng đến tuổi thọ của bếp gas v&agrave; c&aacute;c dụng cụ nấu nướng.</p>

<p>&nbsp;</p>

<h3><strong>1.2. Vỏ b&igrave;nh gas Petrolimex 12kg đạt ti&ecirc;u chuẩn Hoa Kỳ</strong></h3>

<p>Vỏ b&igrave;nh gas Petrolimex 12kg van ngang được chế tạo dựa theo&nbsp;<a href="https://gas40.com/tin-tuc/tim-hieu-ve-tieu-chuan-vo-binh-gas-12kg-dot-4ba-240.127" target="_blank">ti&ecirc;u chuẩn DOT 4BA-240</a>&nbsp;của Hoa Kỳ tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ ti&ecirc;n tiến, tự động h&oacute;a nhập khẩu từ Mỹ, Ch&acirc;u &Acirc;u. Vật liệu chế tạo l&agrave; loại th&eacute;p cao cấp c&oacute; độ d&agrave;y 2.6mm với khả năng chịu &aacute;p lực, chịu nhiệt tốt. Tất cả c&aacute;c kh&acirc;u sản xuất đều được kiểm so&aacute;t v&ocirc; c&ugrave;ng chặt chẽ c&ugrave;ng quy tr&igrave;nh kiểm định nhiều bước nghi&ecirc;m ngặt để đảm bảo độ bền v&agrave; tuyệt đối an to&agrave;n trước khi đưa ra thị trường.</p>

<p>Đặc biệt, Petrolimex l&agrave; h&atilde;ng gas duy nhất tại Việt Nam c&oacute; hệ thống bảo dưỡng vỏ b&igrave;nh tự động, được Bộ Lao động - Thương binh &amp; X&atilde; hội, Thanh tra Nh&agrave; nước ỦY QUYỀN kiểm định về an to&agrave;n lao động.</p>

<p><em><img alt="Vỏ bình gas Petrolimex 12kg chế tạo theo tiêu chuẩn Mỹ" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-petrolimex-12kg-3.jpg" /></em></p>

<p><em>Vỏ b&igrave;nh gas Petrolimex được sản xuất tr&ecirc;n d&acirc;y chuyền tự động h&oacute;a</em></p>

<p>&nbsp;</p>

<h3><strong>1.3. Phụ kiện&nbsp;b&igrave;nh gas Petrolimex 12kg c&oacute; chất lượng cao</strong></h3>

<p>Kh&ocirc;ng chỉ quan t&acirc;m đến chất lượng vỏ b&igrave;nh, c&aacute;c phụ kiện đi k&egrave;m b&igrave;nh gas cũng được doanh nghiệp đầu tư để đ&aacute;p ứng ti&ecirc;u chuẩn về độ bền, độ an to&agrave;n cao nhất. Theo c&ocirc;ng bố của h&atilde;ng, tất cả van điều &aacute;p v&agrave; đệm van đi k&egrave;m b&igrave;nh gas Petrolimex đều được nhập khẩu từ Đức, Ph&aacute;p, Nhật, Italia, Đan Mạch,... Ống dẫn v&agrave; d&acirc;y dẫn gas đều c&oacute; chất lượng cao để hạn chế hư hại, tuổi thọ l&acirc;u d&agrave;i.&nbsp;&nbsp;</p>

<p><strong>►Xem th&ecirc;m:&nbsp;</strong><a href="https://gas40.com/tin-tuc/vai-tro-cua-van-an-toan-va-cac-loai-van-gas-pho-bien-hien-nay.27" target="_blank">Vai tr&ograve; của van an to&agrave;n trong hệ thống gas v&agrave; c&aacute;c loại van gas phổ biến</a></p>

<p>&nbsp;</p>

<h3><strong>1.4. Petrolimex 12kg van ngang c&oacute; độ an to&agrave;n cao</strong></h3>

<p>B&ecirc;n cạnh chất lượng, độ an to&agrave;n ch&iacute;nh l&agrave; yếu tố gi&uacute;p gas Petrolimex được người ti&ecirc;u d&ugrave;ng tin tưởng v&agrave; đ&aacute;nh gi&aacute; cao. B&ecirc;n cạnh vỏ b&igrave;nh gas đạt chuẩn quốc tế, quy tr&igrave;nh sản xuất, chiết nạp b&igrave;nh gas cũng được kiểm so&aacute;t khắt khe từng c&ocirc;ng đoạn. Mỗi b&igrave;nh gas Petrolimex van ngang 12kg&nbsp;trước khi xuất kho đều được kiểm tra nghi&ecirc;m ngặt về chất lượng, trọng lượng, độ an to&agrave;n bằng c&ocirc;ng nghệ hiện đại c&oacute; độ ch&iacute;nh x&aacute;c cao. C&aacute;c b&igrave;nh gas đạt chuẩn được ni&ecirc;m phong để đảm bảo an to&agrave;n đồng thời được mua bảo hiểm ch&aacute;y nổ trước khi b&aacute;n cho người sử dụng.</p>

<p>&nbsp;</p>

<h3><strong>1.5. Gas Petrolimex van ngang 12kg c&oacute; tem chống h&agrave;ng giả</strong></h3>

<p>L&agrave; thương hiệu gas uy t&iacute;n được mọi người tin d&ugrave;ng n&ecirc;n gas Petrolimex 12kg rất dễ bị l&agrave;m giả, l&agrave;m nh&aacute;i. Để bảo vệ quyền lợi của người ti&ecirc;u d&ugrave;ng cũng như uy t&iacute;n của thương hiệu trước những thủ đoạn chiết nạp gas lậu, Petrolimex đ&atilde; trang bị bộ nhận diện ri&ecirc;ng bằng tem chống h&agrave;ng giả được Bộ C&ocirc;ng an cấp ph&eacute;p. Tem n&agrave;y được d&aacute;n ph&iacute;a ngo&agrave;i m&agrave;ng co bao bọc quanh bộ van ở đầu b&igrave;nh gas, c&oacute; hướng dẫn để người ti&ecirc;u d&ugrave;ng dễ ph&acirc;n biệt với b&igrave;nh gas Petrolimex 12kg van ngang giả.</p>

<p><em><img alt="Tem chống hàng giả của binh gas Petrolimex 12kg van ngang" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-petrolimex-12kg-4.jpg" /></em></p>

<p><em>Mẫu tem chống h&agrave;ng giả t&iacute;ch hợp 3 c&ocirc;ng nghệ của Petrolimex mới được sử dụng gần đ&acirc;y</em></p>

<p>&nbsp;</p>

<h3><strong>1.6. Gi&aacute; gas Petrolimex 12kg van ngang minh bạch</strong></h3>

<p>L&agrave; một trong những đầu mối nhập khẩu đồng thời cũng l&agrave; nh&agrave; cung ứng LPG cho thị trường gas Việt Nam n&ecirc;n Petrolimex đ&oacute;ng vai tr&ograve; quan trọng trong việc ổn định gi&aacute; gas b&aacute;n lẻ trong nước. Nhờ chủ động nguồn cung n&ecirc;n gi&aacute; gas Petrolimex 12kg van ngang được đ&aacute;nh gi&aacute; l&agrave; ổn định so với c&aacute;c nh&agrave; cung cấp nhỏ lẻ kh&aacute;c.</p>

<p>Cũng nhờ uy t&iacute;n v&agrave; sự ổn định, gi&aacute; gas Petrolimex được xem l&agrave; gi&aacute; tham chiếu chung của thị trường. Gi&aacute; gas b&aacute;n lẻ b&igrave;nh 12kg v&agrave; 48kg lu&ocirc;n được h&atilde;ng c&ocirc;ng khai minh bạch cho người ti&ecirc;u d&ugrave;ng qua c&aacute;c phương tiện truyền th&ocirc;ng uy t&iacute;n v&agrave; tại cửa h&agrave;ng, đại l&yacute; ph&acirc;n phối. Vậy n&ecirc;n người d&ugrave;ng rất y&ecirc;n t&acirc;m về vấn đề gi&aacute; cả khi đặt gas Petrolimex 12kg van ngang bởi t&igrave;nh trạng đại l&yacute; tự n&acirc;ng gi&aacute; để b&aacute;n cho kh&aacute;ch h&agrave;ng thường &iacute;t khi xảy ra.&nbsp;</p>

<p><strong>►Xem th&ecirc;m:&nbsp;</strong><a href="https://gas40.com/tin-tuc/gia-gas-hom-nay.40" target="_blank">Gi&aacute; gas h&ocirc;m nay: Cập nhật gi&aacute; gas mới nhất tr&ecirc;n thị trường</a></p>

<p>&nbsp;</p>

<h2><strong>2. C&aacute;ch nhận biết b&igrave;nh gas Petrolimex 12kg van ngang ch&iacute;nh h&atilde;ng</strong></h2>

<p>Trước thực trạng gas bị l&agrave;m nh&aacute;i tr&agrave;n lan tr&ecirc;n thị trường, ngo&agrave;i những biện ph&aacute;p của đơn vị kinh doanh đầu mối, người ti&ecirc;u d&ugrave;ng cũng cần trang bị đầy đủ th&ocirc;ng tin, đặc biệt l&agrave; học c&aacute;ch nhận biết gas Petrolimex ch&iacute;nh h&atilde;ng để tr&aacute;nh bị thiệt th&ograve;i.&nbsp;</p>

<p>Dưới đ&acirc;y l&agrave; 3 c&aacute;ch để nhận diện b&igrave;nh gas Petrolimex 12kg van ngang ch&iacute;nh h&atilde;ng:</p>

<p>&nbsp;</p>

<h3><strong>C&aacute;ch 1: Quan s&aacute;t vỏ b&igrave;nh gas</strong></h3>

<p>C&aacute;ch n&agrave;y thường chỉ sử dụng được với những người c&oacute; kinh nghiệm v&agrave; kiến thức nhất định. Bởi v&igrave; mỗi thương hiệu gas đều c&oacute; dấu hiệu nhận diện ri&ecirc;ng từ logo, nh&atilde;n m&aacute;c, m&agrave;u sắc v&agrave; thiết kế vỏ b&igrave;nh, th&ocirc;ng tin in tr&ecirc;n vỏ b&igrave;nh, loại van, m&agrave;ng co ni&ecirc;m phong&hellip; Người ti&ecirc;u d&ugrave;ng c&oacute; thể dựa v&agrave;o những th&ocirc;ng tin n&agrave;y, quan s&aacute;t từng dấu hiệu để ph&acirc;n biệt được b&igrave;nh gas thật hay gas giả.</p>

<p>&nbsp;</p>

<h3><strong>C&aacute;ch 2: C&acirc;n khối&nbsp;lượng tổng của cả b&igrave;nh gas</strong></h3>

<p><img alt="Cách tính khối lượng gas Petrolimex 12kg" src="https://ecom.viettechsmart.com:5020/Media/Images/0/can-khoi-luong-binh-gas-petrolimex-12kg.jpg" /></p>

<p>B&igrave;nh gas Petrolimex van ngang 12kg được chiết nạp tr&ecirc;n d&acirc;y chuyền tự động n&ecirc;n tỷ lệ th&agrave;nh phần v&agrave; khối lượng thường rất ch&iacute;nh x&aacute;c, độ ch&ecirc;nh lệch lu&ocirc;n dưới 0.1kg. Tr&ecirc;n mỗi vỏ b&igrave;nh gas cũng được in trọng lượng vỏ b&igrave;nh n&ecirc;n khi kiểm tra tổng trọng lượng thường rất ch&iacute;nh x&aacute;c.</p>

<p>Trong khi đ&oacute;, gas lậu thường chiết nạp thủ c&ocirc;ng, muốn tối đa h&oacute;a lợi nhuận n&ecirc;n thường chiết nạp thiếu trọng lượng gas hoặc mua vỏ b&igrave;nh gas cũ của h&atilde;ng kh&aacute;c về cắt tai, m&agrave;i vỏ rồi sơn lại. Do đ&oacute;, tổng trọng lượng của cả vỏ b&igrave;nh v&agrave; nước gas c&acirc;n thực tế sẽ c&oacute; sự ch&ecirc;nh lệch đ&aacute;ng kể so với khối lượng cộng lại theo l&yacute; thuyết. Người d&ugrave;ng gas c&oacute; thể y&ecirc;u cầu người b&aacute;n c&acirc;n gas rồi dựa v&agrave;o dấu hiệu n&agrave;y để c&oacute; sự đ&aacute;nh gi&aacute;.</p>

<p>&nbsp; &nbsp;</p>

<h3><strong>C&aacute;ch 3: Kiểm tra tem chống h&agrave;ng giả của gas Petrolimex</strong>&nbsp;</h3>

<p>Tem chống h&agrave;ng giả của gas Petrolimex hiện đang sử dụng được Bộ C&ocirc;ng an cấp ph&eacute;p v&agrave; quản l&yacute; c&oacute; độ bảo mật cao, rất kh&oacute; l&agrave;m giả n&ecirc;n đ&acirc;y cũng l&agrave; c&aacute;ch nhận biết đ&aacute;ng tin cậy nhất. Tuy nhi&ecirc;n, c&aacute;ch tra cứu loại tem n&agrave;y đ&ograve;i hỏi người d&ugrave;ng phải biết c&aacute;ch thao t&aacute;c v&agrave; c&oacute; sự hỗ trợ của c&aacute;c d&ograve;ng điện thoại smartphone n&ecirc;n c&oacute; thể l&agrave; r&agrave;o cản với những người kh&ocirc;ng biết sử dụng internet v&agrave; thiết bị c&ocirc;ng nghệ.</p>

<p>Để kiểm tra xem b&igrave;nh gas 12kg Petrolimex van ngang bạn mua c&oacute; phải l&agrave; ch&iacute;nh h&atilde;ng, bạn cần thao t&aacute;c như sau:</p>

<p>-&nbsp;<strong>Bước 1:</strong>&nbsp;C&agrave;o nhẹ lớp bạc tr&ecirc;n tem chống h&agrave;ng giả d&aacute;n tr&ecirc;n cổ b&igrave;nh để xem&nbsp;M&Atilde; SỐ in tr&ecirc;n tem;</p>

<p>-&nbsp;<strong>Bước 2:</strong>&nbsp;D&ugrave;ng điện thoại nhắn tin theo c&uacute; ph&aacute;p: M&Atilde; SỐ gửi 8077 (ph&iacute; 1.000đ). Nếu l&agrave; gas ch&iacute;nh h&atilde;ng, th&ocirc;ng b&aacute;o sẽ được gửi tới số điện thoại của kh&aacute;ch h&agrave;ng.&nbsp;</p>

<p><img alt="Kiểm tra bình gas Petrolimex thật giả bằng tem chống hàng giả" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-petrolimex-12kg-5.jpg" /></p>

<p><strong>►Xem th&ecirc;m:&nbsp;</strong><a href="https://gas40.com/tin-tuc/huong-dan-cach-phan-biet-binh-gas-petrolimex-that-gia.34" target="_blank">Hướng dẫn c&aacute;ch ph&acirc;n biệt b&igrave;nh gas Petrolimex thật giả</a></p>

<p>&nbsp;</p>

<h2><strong>3. Tại sao n&ecirc;n đặt gas Petrolimex 12kg tại GasStore</strong></h2>

<p><strong>GasStore</strong>&nbsp;l&agrave; đơn vị ph&acirc;n phối&nbsp;<a href="https://gas40.com/loai-san-pham/gas" target="_blank">gas&nbsp;ch&iacute;nh h&atilde;ng</a>&nbsp;với hệ thống cửa h&agrave;ng tại c&aacute;c tỉnh như H&agrave; Nội, Đ&agrave; Nẵng, TP.HCM, Đồng Nai, Vũng T&agrave;u, Long An, Tiền Giang, Bến Tre, Cần Thơ, Vĩnh Long&hellip; Với uy t&iacute;n v&agrave; kinh nghiệm trong ng&agrave;nh, Gas4.0 &amp;more trở th&agrave;nh một trong những đại l&yacute; được ph&acirc;n phối gas Petrolimex tại Đ&agrave; Nẵng, H&agrave; Nội v&agrave; một số tỉnh miền Bắc.</p>

<p><strong>Khi đặt gas Petrolimex van ngang 12kg tại hệ thống, kh&aacute;ch h&agrave;ng sẽ được cam kết:</strong></p>

<p>- Sản phẩm ch&iacute;nh h&atilde;ng, c&oacute; tem chống h&agrave;ng giả;</p>

<p>- Đảm bảo an to&agrave;n, mỗi b&igrave;nh gas đều đ&atilde; được mua bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng;</p>

<p>- Gi&aacute; cả cạnh tranh, ch&iacute;nh s&aacute;ch chiết khấu tốt cho doanh nghiệp, nh&agrave; h&agrave;ng sử dụng nhiều;</p>

<p>- Giao h&agrave;ng v&agrave; lắp đặt tận nơi nhanh ch&oacute;ng MIỄN PH&Iacute;;</p>

<p>- Hỗ trợ kiểm tra van, d&acirc;y dẫn, bếp miễn ph&iacute;; kiểm tra r&ograve; rỉ gas bằng m&aacute;y d&ograve; chuy&ecirc;n dụng sau khi lắp đặt để đảm bảo an to&agrave;n cho người sử dụng.</p>

<p>- Hỗ trợ thiết kế, lắp đặt hệ thống gas c&ocirc;ng nghiệp &amp; tặng k&egrave;m tủ điện th&ocirc;ng minh để kiểm so&aacute;t qu&aacute; tr&igrave;nh sử dụng gas qua ứng dụng.</p>
', 1, 8, 1, 560000.0000, N'GAS PETROLIMEX 12KG VAN NGANG.png', 523, 13, CAST(N'2024-07-14T10:47:28.210' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (7, N'gas-petrolimex-12kg-van-chup', N'GAS PETROLIMEX 12KG VAN CHỤP', N'Petrolimex', N'Bình gas 12kg van chụp', N'<p>Gas&nbsp;Petrolimex 12kg van ngang l&agrave; một sản phẩm của Tổng C&ocirc;ng ty Gas Việt Nam (PGC), được th&agrave;nh lập năm 1998 từ qu&aacute; tr&igrave;nh cổ phần h&oacute;a v&agrave; t&aacute;i cấu tr&uacute;c lại Tổng c&ocirc;ng ty Xăng dầu Việt Nam.</p>

<p><a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/petrolimex" target="_blank">Petrolimex</a>&nbsp;được xếp hạng l&agrave; một trong 3&nbsp;<a href="https://gas40.com/tin-tuc/top-10-thuong-hieu-gas-uy-tin-duoc-nguoi-tieu-dung-lua-chon.46" target="_blank">thương hiệu gas uy t&iacute;n</a>, dẫn đầu về sản lượng cũng như thị phần gas tại Việt Nam. Sản phẩm b&igrave;nh gas Petrolimex c&oacute; mặt tại khắp 63 tỉnh th&agrave;nh tr&ecirc;n khắp cả nước, được người ti&ecirc;u d&ugrave;ng đ&aacute;nh gi&aacute; cao cả về chất lượng, độ an to&agrave;n lẫn sự ổn định về gi&aacute; cả.</p>

<p>Để đ&aacute;p ứng nhu cầu của thị trường, Petrolimex đ&atilde; x&acirc;y dựng mạng lưới kho LPG với sức chứa khoảng 7.800 tấn v&agrave; c&aacute;c nh&agrave; m&aacute;y chiết nạp với c&ocirc;ng nghệ ti&ecirc;n tiến tại H&agrave; Nội, Hải Ph&ograve;ng (3.000 tấn), Đ&agrave; Nẵng (1.000 tấn), TP.HCM (2.000 tấn), Cần Thơ (800 tấn).</p>

<p>Ngo&agrave;i ra, h&atilde;ng c&ograve;n x&acirc;y dựng mạng lưới kho chứa đầu tư tại c&aacute;c trạm chiết nạp cấp 2 tại c&aacute;c khu vực trọng điểm với tổng sức chứa h&agrave;ng ng&agrave;n tấn LPG để đ&aacute;p ứng nhu cầu sinh hoạt v&agrave; sản xuất c&ocirc;ng - n&ocirc;ng nghiệp, thương mại, dịch vụ. C&ugrave;ng với đ&oacute; l&agrave; hệ thống ph&acirc;n phối l&ecirc;n đến h&agrave;ng ng&agrave;n cửa h&agrave;ng chuy&ecirc;n doanh, tổng đại l&yacute; &amp; đại l&yacute; ch&iacute;nh thức.</p>

<p><img alt="Petrolimex là 1 trong 3 thương hiệu gas nổi tiếng Việt Nam" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thuong-hieu-gas-petrolimex.jpg" /></p>

<p>Tổng c&ocirc;ng ty Gas Petrolimex cũng l&agrave; một trong số &iacute;t doanh nghiệp Việt Nam tham gia v&agrave;o tổ chức LPG thế giới (World LP Gas Association), l&agrave; th&agrave;nh vi&ecirc;n của Hiệp hội Gas thế giới cũng l&agrave; th&agrave;nh vi&ecirc;n s&aacute;ng lập của Hiệp hội Gas Việt Nam.</p>

<p>&nbsp;</p>

<h2><strong>1. Tại sao n&ecirc;n chọn b&igrave;nh gas Petrolimex 12kg van chụp?</strong></h2>

<p>Tr&ecirc;n thị trường hiện nay c&oacute; khoảng 60 thương hiệu gas với h&agrave;ng trăm sản phẩm b&igrave;nh 12kg. Tuy nhi&ecirc;n, Petrolimex vẫn lu&ocirc;n l&agrave; loại gas được người nội trợ ưa chuộng, l&agrave; lựa chọn được ưu ti&ecirc;n h&agrave;ng đầu khi c&oacute; nhu cầu đặt gas. Để đạt được điều đ&oacute;, ngay từ khi ra đời, h&atilde;ng đ&atilde; tu&acirc;n thủ c&aacute;c ti&ecirc;u ch&iacute; chất lượng - an to&agrave;n - tiết kiệm. Mỗi b&igrave;nh gas Petrolimex 12kg van chụp đưa ra thị trường lu&ocirc;n đảm bảo c&aacute;c yếu tố:</p>

<p>&nbsp;</p>

<h3><strong>1.1. Chất lượng gas Petrolimex 12kg được đảm bảo</strong></h3>

<p>Chất lượng lu&ocirc;n l&agrave; yếu tố đầu ti&ecirc;n khiến người ti&ecirc;u d&ugrave;ng y&ecirc;n t&acirc;m khi đặt gas Petrolimex bởi h&atilde;ng lu&ocirc;n cam kết sử dụng nguồn nước gas chất lượng cao. Petrolimex cũng l&agrave; một trong những doanh nghiệp kinh doanh kh&iacute; gas tại Việt Nam ti&ecirc;n phong trong việc chủ động nhập khẩu kh&iacute; đốt tự nhi&ecirc;n để đảm bảo đ&aacute;p ứng nhu cầu cả về sản lượng lẫn chất lượng.</p>

<p>Ngo&agrave;i nước gas nhập khẩu, quy tr&igrave;nh chiết nạp, đ&oacute;ng b&igrave;nh cũng tu&acirc;n thủ ti&ecirc;u chuẩn v&agrave; kiểm so&aacute;t tỷ lệ th&agrave;nh phần nghi&ecirc;m ngặt nhờ d&acirc;y chuyền c&ocirc;ng nghệ tự động để đảm bảo độ tinh khiết v&agrave; an to&agrave;n cao.</p>

<p><em><img alt="Gas Petrolimex 12kg van ngang có chất lượng vượt trội" src="https://ecom.viettechsmart.com:5020/Media/Images/0/chat-luong-gas-petrolimex-12kg.jpg" /></em></p>

<p><em>D&acirc;y chuyền c&ocirc;ng nghệ hiện đại, tự động h&oacute;a được trang bị tại c&aacute;c trạm chiết nạp gas Petrolimex</em></p>

<p>&nbsp;</p>

<p>Mỗi b&igrave;nh gas Petrolimex van chụp 12kg khi đến tay người ti&ecirc;u d&ugrave;ng lu&ocirc;n đảm bảo kh&ocirc;ng bị pha trộn tạp chất, tỷ lệ c&aacute;c th&agrave;nh phần được t&iacute;nh to&aacute;n tỉ mỉ để ph&ugrave; hợp với điều kiện kh&iacute; hậu v&agrave; nhu cầu nhiệt lượng đun nấu. Nhờ đ&oacute; c&oacute; thể tối ưu được lượng gas đốt ch&aacute;y, tiết kiệm thời gian chế biến đồng thời tr&aacute;nh g&acirc;y b&aacute;m cặn l&agrave;m ảnh hưởng đến tuổi thọ của bếp gas v&agrave; c&aacute;c dụng cụ nấu nướng.</p>

<p>&nbsp;</p>

<h3><strong>1.2. Vỏ b&igrave;nh gas Petrolimex 12kg đạt ti&ecirc;u chuẩn Hoa Kỳ</strong></h3>

<p>Vỏ b&igrave;nh gas Petrolimex 12kg van chụp được chế tạo dựa theo&nbsp;<a href="https://gas40.com/tin-tuc/tim-hieu-ve-tieu-chuan-vo-binh-gas-12kg-dot-4ba-240.127" target="_blank">ti&ecirc;u chuẩn DOT 4BA-240</a>&nbsp;của Hoa Kỳ tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ ti&ecirc;n tiến, tự động h&oacute;a nhập khẩu từ Mỹ, Ch&acirc;u &Acirc;u. Vật liệu chế tạo l&agrave; loại th&eacute;p cao cấp c&oacute; độ d&agrave;y 2.6mm với khả năng chịu &aacute;p lực, chịu nhiệt tốt. Tất cả c&aacute;c kh&acirc;u sản xuất đều được kiểm so&aacute;t v&ocirc; c&ugrave;ng chặt chẽ c&ugrave;ng quy tr&igrave;nh kiểm định nhiều bước nghi&ecirc;m ngặt để đảm bảo độ bền v&agrave; tuyệt đối an to&agrave;n trước khi đưa ra thị trường.</p>

<p>Đặc biệt, Petrolimex l&agrave; h&atilde;ng gas duy nhất tại Việt Nam c&oacute; hệ thống bảo dưỡng vỏ b&igrave;nh tự động, được Bộ Lao động - Thương binh &amp; X&atilde; hội, Thanh tra Nh&agrave; nước ỦY QUYỀN kiểm định về an to&agrave;n lao động.</p>

<p><em><img alt="Vỏ bình gas Petrolimex 12kg chế tạo theo tiêu chuẩn Mỹ" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-petrolimex-12kg-3.jpg" /></em></p>

<p><em>Vỏ b&igrave;nh gas Petrolimex được sản xuất tr&ecirc;n d&acirc;y chuyền tự động h&oacute;a</em></p>

<p>&nbsp;</p>

<h3><strong>1.3. Phụ kiện&nbsp;b&igrave;nh gas Petrolimex 12kg van chụp c&oacute; chất lượng cao</strong></h3>

<p>Kh&ocirc;ng chỉ quan t&acirc;m đến chất lượng vỏ b&igrave;nh, c&aacute;c phụ kiện đi k&egrave;m b&igrave;nh gas cũng được doanh nghiệp đầu tư để đ&aacute;p ứng ti&ecirc;u chuẩn về độ bền, độ an to&agrave;n cao nhất. Theo c&ocirc;ng bố của h&atilde;ng, tất cả van điều &aacute;p v&agrave; đệm van đi k&egrave;m b&igrave;nh gas Petrolimex đều được nhập khẩu từ Đức, Ph&aacute;p, Nhật, Italia, Đan Mạch,... Ống dẫn v&agrave; d&acirc;y dẫn gas đều c&oacute; chất lượng cao để hạn chế hư hại, tuổi thọ l&acirc;u d&agrave;i.</p>

<p>Đặc biệt, van chụp được sử dụng cho b&igrave;nh gas Petrolimex l&agrave; h&agrave;ng nhập khẩu c&oacute; độ bền cao, dễ sử dụng. Mặc d&ugrave; gi&aacute; cao nhưng lại được trang bị th&ecirc;m cảm ứng ngắt gas n&ecirc;n độ an to&agrave;n cao hơn loại van ngang.&nbsp;&nbsp;</p>

<p><strong>►Xem th&ecirc;m:&nbsp;</strong><a href="https://gas40.com/tin-tuc/vai-tro-cua-van-an-toan-va-cac-loai-van-gas-pho-bien-hien-nay.27" target="_blank">Vai tr&ograve; của van an to&agrave;n trong hệ thống gas v&agrave; c&aacute;c loại van gas phổ biến</a></p>

<p>&nbsp;</p>

<h3><strong>1.4. Petrolimex 12kg van chụp&nbsp;c&oacute; độ an to&agrave;n cao</strong></h3>

<p>B&ecirc;n cạnh chất lượng, độ an to&agrave;n ch&iacute;nh l&agrave; yếu tố gi&uacute;p gas Petrolimex được người ti&ecirc;u d&ugrave;ng tin tưởng v&agrave; đ&aacute;nh gi&aacute; cao. B&ecirc;n cạnh vỏ b&igrave;nh gas đạt chuẩn quốc tế, quy tr&igrave;nh sản xuất, chiết nạp b&igrave;nh gas cũng được kiểm so&aacute;t khắt khe từng c&ocirc;ng đoạn. Mỗi b&igrave;nh gas Petrolimex 12kg van chụp trước khi xuất kho đều được kiểm tra nghi&ecirc;m ngặt về chất lượng, trọng lượng, độ an to&agrave;n bằng c&ocirc;ng nghệ hiện đại c&oacute; độ ch&iacute;nh x&aacute;c cao. C&aacute;c b&igrave;nh gas đạt chuẩn được ni&ecirc;m phong để đảm bảo an to&agrave;n đồng thời được mua bảo hiểm ch&aacute;y nổ trước khi b&aacute;n cho người sử dụng.</p>

<p>&nbsp;</p>

<h3><strong>1.5. Gas Petrolimex van chụp&nbsp;12kg c&oacute; tem chống h&agrave;ng giả</strong></h3>

<p>L&agrave; thương hiệu gas uy t&iacute;n được mọi người tin d&ugrave;ng n&ecirc;n gas Petrolimex 12kg rất dễ bị l&agrave;m giả, l&agrave;m nh&aacute;i. Để bảo vệ quyền lợi của người ti&ecirc;u d&ugrave;ng cũng như uy t&iacute;n của thương hiệu trước những thủ đoạn chiết nạp gas lậu, Petrolimex đ&atilde; trang bị bộ nhận diện ri&ecirc;ng bằng tem chống h&agrave;ng giả được Bộ C&ocirc;ng an cấp ph&eacute;p. Tem n&agrave;y được d&aacute;n ph&iacute;a ngo&agrave;i m&agrave;ng co bao bọc quanh bộ van ở đầu b&igrave;nh gas, c&oacute; hướng dẫn để người ti&ecirc;u d&ugrave;ng dễ ph&acirc;n biệt với b&igrave;nh gas Petrolimex 12kg van chụp&nbsp;giả.</p>

<p><em><img alt="Tem chống hàng giả của binh gas Petrolimex 12kg van ngang" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-petrolimex-12kg-4.jpg" /></em></p>

<p><em>Mẫu tem chống h&agrave;ng giả t&iacute;ch hợp 3 c&ocirc;ng nghệ của Petrolimex mới được sử dụng gần đ&acirc;y</em></p>

<p>&nbsp;</p>

<h3><strong>1.6. Gi&aacute; gas Petrolimex 12kg van chụp&nbsp;minh bạch</strong></h3>

<p>L&agrave; một trong những đầu mối nhập khẩu đồng thời cũng l&agrave; nh&agrave; cung ứng LPG cho thị trường gas Việt Nam n&ecirc;n Petrolimex đ&oacute;ng vai tr&ograve; quan trọng trong việc ổn định gi&aacute; gas b&aacute;n lẻ trong nước. Nhờ chủ động nguồn cung n&ecirc;n gi&aacute; gas Petrolimex 12kg được đ&aacute;nh gi&aacute; l&agrave; ổn định so với c&aacute;c nh&agrave; cung cấp nhỏ lẻ kh&aacute;c.</p>

<p>Cũng nhờ uy t&iacute;n v&agrave; sự ổn định, gi&aacute; gas Petrolimex được xem l&agrave; gi&aacute; tham chiếu chung của thị trường. Gi&aacute; gas b&aacute;n lẻ b&igrave;nh 12kg v&agrave; 48kg lu&ocirc;n được h&atilde;ng c&ocirc;ng khai minh bạch cho người ti&ecirc;u d&ugrave;ng qua c&aacute;c phương tiện truyền th&ocirc;ng uy t&iacute;n v&agrave; tại cửa h&agrave;ng, đại l&yacute; ph&acirc;n phối. Vậy n&ecirc;n người d&ugrave;ng rất y&ecirc;n t&acirc;m về vấn đề gi&aacute; cả khi đặt gas Petrolimex 12kg van chụp&nbsp;bởi t&igrave;nh trạng đại l&yacute; tự n&acirc;ng gi&aacute; để b&aacute;n cho kh&aacute;ch h&agrave;ng thường &iacute;t khi xảy ra.&nbsp;</p>

<p><strong>►Xem th&ecirc;m:&nbsp;</strong><a href="https://gas40.com/tin-tuc/gia-gas-hom-nay.40" target="_blank">Gi&aacute; gas h&ocirc;m nay: Cập nhật gi&aacute; gas mới nhất tr&ecirc;n thị trường</a></p>

<p>&nbsp;</p>

<h2><strong>2. C&aacute;ch nhận biết b&igrave;nh gas Petrolimex 12kg van chụp ch&iacute;nh h&atilde;ng</strong></h2>

<p>Trước thực trạng gas bị l&agrave;m nh&aacute;i tr&agrave;n lan tr&ecirc;n thị trường, ngo&agrave;i những biện ph&aacute;p của đơn vị kinh doanh đầu mối, người ti&ecirc;u d&ugrave;ng cũng cần trang bị đầy đủ th&ocirc;ng tin, đặc biệt l&agrave; học c&aacute;ch nhận biết gas Petrolimex ch&iacute;nh h&atilde;ng để tr&aacute;nh bị thiệt th&ograve;i.&nbsp;</p>

<p>Dưới đ&acirc;y l&agrave; 3 c&aacute;ch để nhận diện b&igrave;nh gas Petrolimex 12kg van chụp&nbsp;ch&iacute;nh h&atilde;ng:</p>

<p>&nbsp;</p>

<h3><strong>C&aacute;ch 1: Quan s&aacute;t vỏ b&igrave;nh gas</strong></h3>

<p>C&aacute;ch n&agrave;y thường chỉ sử dụng được với những người c&oacute; kinh nghiệm v&agrave; kiến thức nhất định. Bởi v&igrave; mỗi thương hiệu gas đều c&oacute; dấu hiệu nhận diện ri&ecirc;ng từ logo, nh&atilde;n m&aacute;c, m&agrave;u sắc v&agrave; thiết kế vỏ b&igrave;nh, th&ocirc;ng tin in tr&ecirc;n vỏ b&igrave;nh, loại van, m&agrave;ng co ni&ecirc;m phong&hellip; Người ti&ecirc;u d&ugrave;ng c&oacute; thể dựa v&agrave;o những th&ocirc;ng tin n&agrave;y, quan s&aacute;t từng dấu hiệu để ph&acirc;n biệt được b&igrave;nh gas thật hay gas giả.</p>

<p>&nbsp;</p>

<h3><strong>C&aacute;ch 2: C&acirc;n khối&nbsp;lượng tổng của cả b&igrave;nh gas</strong></h3>

<p><img alt="Cách tính khối lượng gas Petrolimex 12kg" src="https://ecom.viettechsmart.com:5020/Media/Images/0/can-khoi-luong-binh-gas-petrolimex-12kg.jpg" /></p>

<p>B&igrave;nh gas Petrolimex van chụp&nbsp;12kg được chiết nạp tr&ecirc;n d&acirc;y chuyền tự động n&ecirc;n tỷ lệ th&agrave;nh phần v&agrave; khối lượng thường rất ch&iacute;nh x&aacute;c, độ ch&ecirc;nh lệch lu&ocirc;n dưới 0.1kg. Tr&ecirc;n mỗi vỏ b&igrave;nh gas cũng được in trọng lượng vỏ b&igrave;nh n&ecirc;n khi kiểm tra tổng trọng lượng thường rất ch&iacute;nh x&aacute;c.</p>

<p>Trong khi đ&oacute;, gas lậu thường chiết nạp thủ c&ocirc;ng, muốn tối đa h&oacute;a lợi nhuận n&ecirc;n thường chiết nạp thiếu trọng lượng gas hoặc mua vỏ b&igrave;nh gas cũ của h&atilde;ng kh&aacute;c về cắt tai, m&agrave;i vỏ rồi sơn lại. Do đ&oacute;, tổng trọng lượng của cả vỏ b&igrave;nh v&agrave; nước gas c&acirc;n thực tế sẽ c&oacute; sự ch&ecirc;nh lệch đ&aacute;ng kể so với khối lượng cộng lại theo l&yacute; thuyết. Người d&ugrave;ng gas c&oacute; thể y&ecirc;u cầu người b&aacute;n c&acirc;n gas rồi dựa v&agrave;o dấu hiệu n&agrave;y để c&oacute; sự đ&aacute;nh gi&aacute;.</p>

<p>&nbsp; &nbsp;</p>

<h3><strong>C&aacute;ch 3: Kiểm tra tem chống h&agrave;ng giả của gas Petrolimex</strong>&nbsp;</h3>

<p>Tem chống h&agrave;ng giả của gas Petrolimex hiện đang sử dụng được Bộ C&ocirc;ng an cấp ph&eacute;p v&agrave; quản l&yacute; c&oacute; độ bảo mật cao, rất kh&oacute; l&agrave;m giả n&ecirc;n đ&acirc;y cũng l&agrave; c&aacute;ch nhận biết đ&aacute;ng tin cậy nhất. Tuy nhi&ecirc;n, c&aacute;ch tra cứu loại tem n&agrave;y đ&ograve;i hỏi người d&ugrave;ng phải biết c&aacute;ch thao t&aacute;c v&agrave; c&oacute; sự hỗ trợ của c&aacute;c d&ograve;ng điện thoại smartphone n&ecirc;n c&oacute; thể l&agrave; r&agrave;o cản với những người kh&ocirc;ng biết sử dụng internet v&agrave; thiết bị c&ocirc;ng nghệ.</p>

<p>Để kiểm tra xem b&igrave;nh gas 12kg Petrolimex van chụp&nbsp;bạn mua c&oacute; phải l&agrave; ch&iacute;nh h&atilde;ng, bạn cần thao t&aacute;c như sau:</p>

<p>-&nbsp;<strong>Bước 1:</strong>&nbsp;C&agrave;o nhẹ lớp bạc tr&ecirc;n tem chống h&agrave;ng giả d&aacute;n tr&ecirc;n cổ b&igrave;nh để xem&nbsp;M&Atilde; SỐ được in tr&ecirc;n tem;</p>

<p>-&nbsp;<strong>Bước 2:</strong>&nbsp;D&ugrave;ng điện thoại nhắn tin theo c&uacute; ph&aacute;p: M&Atilde; SỐ gửi 8077 (ph&iacute; 1.000đ). Nếu l&agrave; gas ch&iacute;nh h&atilde;ng, th&ocirc;ng b&aacute;o sẽ được gửi tới số điện thoại của kh&aacute;ch h&agrave;ng.&nbsp;</p>

<p><img alt="Binh gas Petrolimex 12kg chinh hang 5" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-petrolimex-12kg-5.jpg" /></p>

<p><strong>►Xem th&ecirc;m:&nbsp;</strong><a href="https://gas40.com/tin-tuc/huong-dan-cach-phan-biet-binh-gas-petrolimex-that-gia.34" target="_blank">Hướng dẫn c&aacute;ch ph&acirc;n biệt b&igrave;nh gas Petrolimex thật giả</a></p>

<p>&nbsp;</p>

<h2><strong>3. Tại sao n&ecirc;n đặt gas Petrolimex 12kg tại GasStore</strong></h2>

<p><strong>GasStore</strong>&nbsp;l&agrave; đơn vị ph&acirc;n phối&nbsp;<a href="https://gas40.com/loai-san-pham/gas" target="_blank">gas&nbsp;ch&iacute;nh h&atilde;ng</a>&nbsp;với hệ thống cửa h&agrave;ng tại c&aacute;c tỉnh như H&agrave; Nội, Đ&agrave; Nẵng, TP.HCM, Đồng Nai, Vũng T&agrave;u, Long An, Tiền Giang, Bến Tre, Cần Thơ, Vĩnh Long&hellip; Với uy t&iacute;n v&agrave; kinh nghiệm trong ng&agrave;nh, Gas4.0 &amp;more trở th&agrave;nh một trong những đại l&yacute; được ph&acirc;n phối gas Petrolimex tại Đ&agrave; Nẵng, H&agrave; Nội v&agrave; một số tỉnh miền Bắc.</p>

<p><strong>Khi đặt mua b&igrave;nh gas Petrolimex 12kg van chụp tại hệ thống, kh&aacute;ch h&agrave;ng sẽ được cam kết:</strong></p>

<p>- Sản phẩm ch&iacute;nh h&atilde;ng, c&oacute; tem chống h&agrave;ng giả;</p>

<p>- Đảm bảo an to&agrave;n, mỗi b&igrave;nh gas đều đ&atilde; được mua bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng;</p>

<p>- Gi&aacute; cả cạnh tranh, ch&iacute;nh s&aacute;ch chiết khấu tốt cho doanh nghiệp, nh&agrave; h&agrave;ng sử dụng nhiều;</p>

<p>- Giao h&agrave;ng v&agrave; lắp đặt tận nơi nhanh ch&oacute;ng MIỄN PH&Iacute;;</p>

<p>- Hỗ trợ kiểm tra van, d&acirc;y dẫn, bếp miễn ph&iacute;; kiểm tra r&ograve; rỉ gas bằng m&aacute;y d&ograve; chuy&ecirc;n dụng sau khi lắp đặt để đảm bảo an to&agrave;n cho người sử dụng.</p>

<p>- Hỗ trợ thiết kế, lắp đặt hệ thống gas c&ocirc;ng nghiệp &amp; tặng k&egrave;m tủ điện th&ocirc;ng minh để kiểm so&aacute;t qu&aacute; tr&igrave;nh sử dụng gas qua ứng dụng.</p>
', 1, 8, 1, 500000.0000, N'GAS PETROLIMEX 12KG VAN CHUP.png', 432, 75, CAST(N'2024-07-14T10:47:28.210' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (8, N'gas-12-kg-van-chup-siam', N'GAS SIAM 12KG VAN CHỤP', N'Gas Siam', N'Bình gas 12kg van chụp', N'<h2><strong>Thương hiệu Siamgas</strong></h2>

<p>B&igrave;nh Siamgas van ngang 12kg l&agrave; sản phẩm của C&ocirc;ng ty TNHH Super Gas, doanh nghiệp 100% vốn đầu tư nước ngo&agrave;i thuộc sở hữu của Tập đo&agrave;n Siamgas Th&aacute;i Lan. Super Gas l&agrave; một trong những doanh nghiệp uy t&iacute;n chuy&ecirc;n cung cấp kh&iacute; dầu mỏ h&oacute;a lỏng LPG c&ocirc;ng nghiệp v&agrave; d&acirc;n dụng tại thị trường Việt Nam.</p>

<p>&nbsp;</p>

<h2><strong>Siamgas 12kg sử dụng nước gas nhập khẩu 100%</strong></h2>

<p>Gas Siam 12kg l&agrave; hỗn hợp kh&iacute; h&oacute;a lỏng gồm th&agrave;nh phần ch&iacute;nh gồm Propan, Butan v&agrave; chất tạo m&ugrave;i. Nước gas được nhập khẩu 100% từ Trung Đ&ocirc;ng, được sản xuất theo ti&ecirc;u chuẩn quốc tế n&ecirc;n rất tinh khiết. Khi đốt ch&aacute;y, gas kh&ocirc;ng tạo ra m&ugrave;i h&ocirc;i kh&oacute; chịu hay muội than l&agrave;m bẩn hay g&acirc;y hại cho c&aacute;c dụng cụ nấu ăn như nồi, chảo, ấm đun nước,...</p>

<p>Khi chiết nạp, th&agrave;nh phần Propan v&agrave; Butan được nh&agrave; sản xuất c&acirc;n chỉnh tỷ lệ mỗi chất từ 20 &ndash; 80% (mol) nhằm mang lại hiệu suất đốt ch&aacute;y tối ưu, tiết kiệm nhi&ecirc;n liệu cho người sử dụng. Gas được đốt ch&aacute;y c&oacute; m&agrave;u xanh lam với nhiệt lượng cao gi&uacute;p thời gian chế biến m&oacute;n ăn được r&uacute;t ngắn, tiết kiệm thời gian nấu nướng cho người nội trợ.</p>

<p>&nbsp;</p>

<h2><strong>Siamgas 12kg đảm bảo an to&agrave;n khi sử dụng</strong></h2>

<p>Vỏ b&igrave;nh của Siamgas được l&agrave;m từ chất liệu th&eacute;p chất lượng cao đạt chuẩn Hoa Kỳ DOT 4BA-240 với khả năng chịu được &aacute;p lực gấp 5 lần &aacute;p suất của gas (LPG). Van điều &aacute;p l&agrave; loại van ngang cũng được sản xuất với ti&ecirc;u chuẩn chất lượng cao, tr&aacute;nh nguy cơ r&ograve; rỉ hay nổ b&igrave;nh gas trong qu&aacute; tr&igrave;nh sử dụng.</p>

<p>B&ecirc;n cạnh đ&oacute;, b&igrave;nh gas Siam van ngang 12kg được chiết nạp theo quy tr&igrave;nh chặt chẽ, đ&aacute;p ứng ti&ecirc;u chuẩn kh&iacute; dầu mỏ h&oacute;a lỏng QCVN8:2012/BKHCN n&ecirc;n lu&ocirc;n đảm bảo an to&agrave;n cho người d&ugrave;ng.</p>

<p>&nbsp;</p>

<h2><strong>K&iacute;ch thước b&igrave;nh gas Siam 12kg van chụp&nbsp;nhỏ gọn</strong></h2>

<p>B&igrave;nh gas Siam 12kg van ngang c&oacute; d&aacute;ng trụ tr&ograve;n, đường k&iacute;nh ngo&agrave;i vỏ b&igrave;nh khoảng 30cm, chiều cao ~58cm, kh&ocirc;ng chiếm qu&aacute; nhiều diện t&iacute;ch khi đặt ở bếp ăn của gia đ&igrave;nh hay nh&agrave; h&agrave;ng nhỏ. Với những kh&ocirc;ng gian bếp c&oacute; thiết kế mở hiện đại, b&igrave;nh gas c&oacute; thể được đặt trong ngăn tủ/kệ m&agrave; kh&ocirc;ng ảnh hưởng đến t&iacute;nh thẩm mỹ của cả căn nh&agrave;.</p>

<p>Th&ocirc;ng thường, một b&igrave;nh gas Siam 12kg c&oacute; thể sử dụng được trong khoảng 2 &ndash; 3 th&aacute;ng với nhu cầu nấu ăn h&agrave;ng ng&agrave;y của gia đ&igrave;nh. Với nh&agrave; h&agrave;ng, qu&aacute;n ăn c&oacute; số lượng thức ăn phải chế biến &iacute;t, thời gian sử dụng c&oacute; thể l&agrave; 1 &ndash; 2 th&aacute;ng. Nhờ đ&oacute;, người d&ugrave;ng sẽ kh&ocirc;ng phải đổi&nbsp;gas thường xuy&ecirc;n đồng thời chủ động ph&acirc;n bổ ng&acirc;n s&aacute;ch chi ti&ecirc;u h&agrave;ng th&aacute;ng hợp l&yacute; hơn.</p>

<p><img alt="Bình Siamgas 12kg van ngang chính hãng" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-siamgas-12kg-van-ngang.jpg" /></p>
', 1, 9, 1, 520000.0000, N'GAS SIAM 12KG VAN CHUP.png', 313, 55, CAST(N'2020-01-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (9, N'gas-siam-12kg-van-ngang', N' GAS SIAM 12KG VAN NGANG', N'Gas Siam', N'Bình gas 12kg van ngang', N'<h2><strong>Thương hiệu Siamgas</strong></h2>

<p>B&igrave;nh Siamgas van ngang 12kg l&agrave; sản phẩm của C&ocirc;ng ty TNHH Super Gas, doanh nghiệp 100% vốn đầu tư nước ngo&agrave;i thuộc sở hữu của Tập đo&agrave;n Siamgas Th&aacute;i Lan. Super Gas l&agrave; một trong những doanh nghiệp uy t&iacute;n chuy&ecirc;n cung cấp kh&iacute; dầu mỏ h&oacute;a lỏng LPG c&ocirc;ng nghiệp v&agrave; d&acirc;n dụng tại thị trường Việt Nam.</p>

<p>&nbsp;</p>

<h2><strong>Siamgas 12kg sử dụng nước gas nhập khẩu 100%</strong></h2>

<p>Gas Siam 12kg l&agrave; hỗn hợp kh&iacute; h&oacute;a lỏng gồm th&agrave;nh phần ch&iacute;nh gồm Propan, Butan v&agrave; chất tạo m&ugrave;i. Nước gas được nhập khẩu 100% từ Trung Đ&ocirc;ng, được sản xuất theo ti&ecirc;u chuẩn quốc tế n&ecirc;n rất tinh khiết. Khi đốt ch&aacute;y, gas kh&ocirc;ng tạo ra m&ugrave;i h&ocirc;i kh&oacute; chịu hay muội than l&agrave;m bẩn hay g&acirc;y hại cho c&aacute;c dụng cụ nấu ăn như nồi, chảo, ấm đun nước,...</p>

<p>Khi chiết nạp, th&agrave;nh phần Propan v&agrave; Butan được nh&agrave; sản xuất c&acirc;n chỉnh tỷ lệ mỗi chất từ 20 &ndash; 80% (mol) nhằm mang lại hiệu suất đốt ch&aacute;y tối ưu, tiết kiệm nhi&ecirc;n liệu cho người sử dụng. Gas được đốt ch&aacute;y c&oacute; m&agrave;u xanh lam với nhiệt lượng cao gi&uacute;p thời gian chế biến m&oacute;n ăn được r&uacute;t ngắn, tiết kiệm thời gian nấu nướng cho người nội trợ.</p>

<p>&nbsp;</p>

<h2><strong>Siamgas 12kg đảm bảo an to&agrave;n khi sử dụng</strong></h2>

<p>Vỏ b&igrave;nh của Siamgas được l&agrave;m từ chất liệu th&eacute;p chất lượng cao đạt chuẩn Hoa Kỳ DOT 4BA-240 với khả năng chịu được &aacute;p lực gấp 5 lần &aacute;p suất của gas (LPG). Van điều &aacute;p l&agrave; loại van ngang cũng được sản xuất với ti&ecirc;u chuẩn chất lượng cao, tr&aacute;nh nguy cơ r&ograve; rỉ hay nổ b&igrave;nh gas trong qu&aacute; tr&igrave;nh sử dụng.</p>

<p>B&ecirc;n cạnh đ&oacute;, b&igrave;nh gas Siam van ngang 12kg được chiết nạp theo quy tr&igrave;nh chặt chẽ, đ&aacute;p ứng ti&ecirc;u chuẩn kh&iacute; dầu mỏ h&oacute;a lỏng QCVN8:2012/BKHCN n&ecirc;n lu&ocirc;n đảm bảo an to&agrave;n cho người d&ugrave;ng.</p>

<p>&nbsp;</p>

<h2><strong>K&iacute;ch thước b&igrave;nh gas Siam 12kg van ngang nhỏ gọn</strong></h2>

<p>B&igrave;nh gas Siam 12kg van ngang c&oacute; d&aacute;ng trụ tr&ograve;n, đường k&iacute;nh ngo&agrave;i vỏ b&igrave;nh khoảng 30cm, chiều cao ~58cm, kh&ocirc;ng chiếm qu&aacute; nhiều diện t&iacute;ch khi đặt ở bếp ăn của gia đ&igrave;nh hay nh&agrave; h&agrave;ng nhỏ. Với những kh&ocirc;ng gian bếp c&oacute; thiết kế mở hiện đại, b&igrave;nh gas c&oacute; thể được đặt trong ngăn tủ/kệ m&agrave; kh&ocirc;ng ảnh hưởng đến t&iacute;nh thẩm mỹ của cả căn nh&agrave;.</p>

<p>Th&ocirc;ng thường, một b&igrave;nh gas Siam 12kg c&oacute; thể sử dụng được trong khoảng 2 &ndash; 3 th&aacute;ng với nhu cầu nấu ăn h&agrave;ng ng&agrave;y của gia đ&igrave;nh. Với nh&agrave; h&agrave;ng, qu&aacute;n ăn c&oacute; số lượng thức ăn phải chế biến &iacute;t, thời gian sử dụng c&oacute; thể l&agrave; 1 &ndash; 2 th&aacute;ng. Nhờ đ&oacute;, người d&ugrave;ng sẽ kh&ocirc;ng phải đổi&nbsp;gas thường xuy&ecirc;n đồng thời chủ động ph&acirc;n bổ ng&acirc;n s&aacute;ch chi ti&ecirc;u h&agrave;ng th&aacute;ng hợp l&yacute; hơn.</p>

<p><img alt="Bình Siamgas 12kg van ngang chính hãng" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-siamgas-12kg-van-ngang.jpg" /></p>
', 1, 9, 1, 500000.0000, N'GAS SIAM 12KG VAN NGANG.png', 343, 31, CAST(N'2020-01-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (10, N'gas-hp-30kg', N'GAS HP 30KG', N'Hanoi Petro', N'Bình gas 30kg', N'<h2><strong>1. Tại sao n&ecirc;n chọn b&igrave;nh gas HP 30kg?</strong></h2>

<p>C&ugrave;ng với Petrolimex,&nbsp;<a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/petrovietnam" target="_blank">PetroVietnam</a>, Hanoi Petro (HP) l&agrave; một trong những thương hiệu gas c&oacute; thị phần lớn, được người d&ugrave;ng tại H&agrave; Nội v&agrave; c&aacute;c tỉnh miền Bắc tin d&ugrave;ng. Ngo&agrave;i c&aacute;c sản phẩm&nbsp;<a href="https://gas40.com/loai-san-pham/gas/binh-gas-12kg" target="_blank">gas 12kg</a>&nbsp;v&agrave; 6kg được người nội trợ tin d&ugrave;ng, sản phẩm b&igrave;nh gas 30kg của Hanoi Petro cũng được người d&ugrave;ng đ&aacute;nh gi&aacute; cao bởi:</p>

<p>&nbsp;</p>

<h3><strong>1.1. Hanoi Petro l&agrave; thương hiệu gas uy t&iacute;n</strong></h3>

<p>Hanoi Petro (HP) l&agrave; thương hiệu gas thuộc C&ocirc;ng ty Đầu tư Dầu Kh&iacute; H&agrave; Nội, một trong những doanh nghiệp sản xuất, kinh doanh kh&iacute; đốt l&acirc;u đời tại khu vực miền Bắc với hơn 16 năm kinh nghiệm trong ng&agrave;nh.</p>

<p><img alt="Hanoi Petro là thương hiệu gas uy tín tại miền Bắc" src="https://ecom.viettechsmart.com:5020/Media/Images/0/gas-ha-noi-petro-hp.jpg" />​​​​​​​Hiện nay, Hanoi Petro l&agrave; một trong những doanh nghiệp đứng đầu trong lĩnh vực cung cấp kh&iacute; đốt (LPG) với nh&agrave; m&aacute;y sản xuất vỏ b&igrave;nh, 2 trạm chiết nạp c&oacute; c&ocirc;ng suất tồn trữ đến 650 tấn, mạng lưới b&aacute;n lẻ rộng khắp c&aacute;c tỉnh miền Bắc th&ocirc;ng qua c&aacute;c Đại l&yacute;, Tổng đại l&yacute;. Nhờ ch&uacute; trọng v&agrave;o chất lượng, hiệu quả v&agrave; độ an to&agrave;n, Hanoi Petro đ&atilde; tạo dựng được uy t&iacute;n, được c&aacute;c hộ gia đ&igrave;nh, qu&aacute;n ăn, nh&agrave; h&agrave;ng, cơ sở sản xuất - kinh doanh tin d&ugrave;ng.</p>

<p>&nbsp;</p>

<h3><strong>1.2. Chất lượng gas HP 30kg lu&ocirc;n được đảm bảo</strong></h3>

<p>Hanoi Petro hiện đang sở hữu nh&agrave; m&aacute;y chiết nạp đạt quy chuẩn Quốc gia trong ng&agrave;nh kh&iacute; dầu mỏ h&oacute;a lỏng. Nhi&ecirc;n liệu (LPG) được sử dụng để chiết nạp v&agrave;o b&igrave;nh gas c&ocirc;ng nghiệp HP 30kg đều được nhập từ c&aacute;c nh&agrave; cung cấp uy t&iacute;n trong nước v&agrave; thế giới, c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Do đ&oacute;, nước gas lu&ocirc;n được đảm bảo chất lượng với th&agrave;nh phần ch&iacute;nh chỉ bao gồm Butane, Propane v&agrave; chất tạo m&ugrave;i, kh&ocirc;ng pha trộn tạp chất như c&aacute;c cơ sở chiết nạp lậu.</p>

<p>B&ecirc;n cạnh đ&oacute;, nhờ ứng dụng d&acirc;y chuyển chiết nạp tự động h&oacute;a cao n&ecirc;n nước gas trong b&igrave;nh gas Hanoi Petro 30kg được đảm bảo c&acirc;n đủ kg với sai số nhỏ hơn &plusmn;0.2kg. Hai th&agrave;nh phần ch&iacute;nh trong nước gas l&agrave; Butan, Propan được chiết nạp theo tỷ lệ từ 30 &harr; 70%. Đ&acirc;y l&agrave; tỷ lệ chuẩn, ph&ugrave; hợp với điều kiện kh&iacute; hậu v&agrave; kết cấu bếp nấu tại Việt Nam, gi&uacute;p tối ưu hiệu suất ch&aacute;y, tiết kiệm gas.</p>

<p>Nhờ đ&oacute;, gas HP 30kg khi nấu cho ngọn lửa xanh, mạnh, kh&ocirc;ng c&oacute; m&ugrave;i h&ocirc;i kh&oacute; chịu, tiết kiệm nhi&ecirc;n liệu v&agrave; thời gian đun nấu, kh&ocirc;ng l&agrave;m đen nồi.&nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1.3. B&igrave;nh gas Hanoi Petro 30kg c&oacute; độ an to&agrave;n cao</strong></h3>

<p>Để đảm bảo độ an to&agrave;n chống ch&aacute;y nổ, quy tr&igrave;nh sản xuất vỏ b&igrave;nh gas HP 30kg lu&ocirc;n tu&acirc;n thủ đầy đủ c&aacute;c ti&ecirc;u chuẩn TCVN 6292:1997 (Việt Nam) v&agrave; DOT 4BW-240 (Hoa Kỳ). Vật liệu th&eacute;p được sử dụng để chế tạo vỏ b&igrave;nh được nhập khẩu trực tiếp từ Nhật Bản, c&oacute; độ d&agrave;y đến 2,6 ly. Nhờ đ&oacute;, b&igrave;nh gas HP 30kg c&oacute; độ bền cao, chịu được &aacute;p lực lớn, đảm bảo an to&agrave;n chống ch&aacute;y nổ.</p>

<p><img alt="Bình gas Hanoi Petro 30kg công nghiệp" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-cong%20-nghiep-hp-30kg.jpg" /></p>

<p>Mỗi vỏ b&igrave;nh gas HP 30kg đều trải qua c&aacute;c bước kiểm tra, kiểm định khắt khe của c&aacute;c cơ quan c&oacute; thẩm quyền, đảm bảo đạt ti&ecirc;u chuẩn trước khi lưu h&agrave;nh tr&ecirc;n thị trường. Sau 5 năm, doanh nghiệp sẽ thu hồi vỏ b&igrave;nh để đ&aacute;nh gi&aacute; chất lượng, khắc phục điểm bất thường (nếu c&oacute;) v&agrave; đưa đi kiểm định lại trước khi tiếp tục lưu th&ocirc;ng để hạn chế sự c&oacute; c&oacute; thể xảy ra.</p>

<p>&nbsp;</p>

<h3><strong>1.4. Tem chống h&agrave;ng giả v&agrave; bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng</strong></h3>

<p>Để hạn chế t&igrave;nh trạng chiếm dụng vỏ b&igrave;nh sang chiết tr&aacute;i ph&eacute;p gas HP 30kg giả, ngo&agrave;i c&aacute;c th&ocirc;ng tin được in nổi tr&ecirc;n vỏ b&igrave;nh khi sản xuất, Hanoi Petro c&ograve;n trang bị tem chống h&agrave;ng giả (Theo ti&ecirc;u chuẩn của Bộ C&ocirc;ng an), được d&aacute;n tr&ecirc;n van cổ b&igrave;nh gas.</p>

<p>Ngo&agrave;i ra, để đảm bảo quyền lợi, gi&uacute;p kh&aacute;ch h&agrave;ng y&ecirc;n t&acirc;m sử dụng gas, h&atilde;ng đ&atilde; mua bảo hiểm ch&aacute;y nổ cho người ti&ecirc;u d&ugrave;ng cho mỗi b&igrave;nh gas Hanoi Petro 30kg trước khi lưu h&agrave;nh ra thị trường. Nếu c&oacute; sự cố ch&aacute;y nổ xảy ra do lỗi b&igrave;nh gas, kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ đại l&yacute;/nh&agrave; sản xuất để được hướng dẫn thủ tục đền b&ugrave; thiệt hại do sự cố thỏa đ&aacute;ng.</p>

<p>&nbsp;</p>

<h2><strong>2. B&igrave;nh gas HP&nbsp;30kg ph&ugrave; hợp với đối tượng sử dụng n&agrave;o?</strong></h2>

<p>Hanoi Petro 30kg l&agrave; b&igrave;nh gas c&ocirc;ng nghiệp nhưng k&iacute;ch thước, khối lượng, gi&aacute; b&aacute;n thấp hơn c&aacute;c loại b&igrave;nh từ 45 - 50kg thường thấy tr&ecirc;n thị trường. Do k&iacute;ch thước lớn hơn b&igrave;nh 12kg n&ecirc;n sản phẩm &iacute;t được sử dụng trong gia đ&igrave;nh. Sản phẩm được sản xuất để đ&aacute;p ứng c&aacute;c nhu cầu sử dụng:</p>

<p>- Qu&aacute;n ăn, nh&agrave; h&agrave;ng, cơ sở sản xuất - kinh doanh c&oacute; nhu cầu về lưu lượng sử dụng kh&ocirc;ng lớn, kh&ocirc;ng gian bếp hay khu chứa gas hẹp.</p>

<p>- Bếp ăn trong căn tin của trường học, nh&agrave; m&aacute;y, x&iacute; nghiệp.</p>

<p>- B&igrave;nh gas HP 30kg cũng c&oacute; thể được sử dụng thay thế cho b&igrave;nh 39kg, 45kg trong c&aacute;c hệ thống gas c&ocirc;ng nghiệp khi cần thiết.</p>
', 1, 7, 1, 1065900.0000, N'GAS HP 30KG.png', 1128, 86, CAST(N'2020-01-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (11, N'gas-HP-45-kg', N'GAS HP 45KG', N'Hanoi Petro', N'Bình gas 45kg', N'<h2><strong>1. Tại sao n&ecirc;n chọn b&igrave;nh gas HP 45kg?</strong></h2>

<p>C&ugrave;ng với Petrolimex,&nbsp;<a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/petrovietnam" target="_blank">PetroVietnam</a>, Hanoi Petro (HP) l&agrave; một trong những thương hiệu gas c&oacute; thị phần lớn, được người d&ugrave;ng tại H&agrave; Nội v&agrave; c&aacute;c tỉnh miền Bắc tin d&ugrave;ng. Ngo&agrave;i c&aacute;c sản phẩm&nbsp;<a href="https://gas40.com/loai-san-pham/gas/binh-gas-12kg" target="_blank">gas 12kg</a>&nbsp;v&agrave; 6kg được người nội trợ tin d&ugrave;ng, sản phẩm b&igrave;nh gas 45kg của Hanoi Petro cũng được người d&ugrave;ng đ&aacute;nh gi&aacute; cao bởi:</p>

<p>&nbsp;</p>

<h3><strong>1.1. Hanoi Petro l&agrave; thương hiệu gas uy t&iacute;n</strong></h3>

<p>Hanoi Petro (HP) l&agrave; thương hiệu gas thuộc C&ocirc;ng ty Đầu tư Dầu Kh&iacute; H&agrave; Nội, một trong những doanh nghiệp sản xuất, kinh doanh kh&iacute; đốt l&acirc;u đời tại khu vực miền Bắc với hơn 16 năm kinh nghiệm trong ng&agrave;nh.</p>

<p><img alt="Hanoi Petro là thương hiệu gas uy tín" src="https://ecom.viettechsmart.com:5020/Media/Images/0/gas-ha-noi-petro-hp.jpg" />Hiện nay, Hanoi Petro l&agrave; một trong những doanh nghiệp đứng đầu trong lĩnh vực cung cấp kh&iacute; đốt (LPG) với nh&agrave; m&aacute;y sản xuất vỏ b&igrave;nh, 2 trạm chiết nạp c&oacute; c&ocirc;ng suất tồn trữ đến 650 tấn, mạng lưới b&aacute;n lẻ rộng khắp c&aacute;c tỉnh miền Bắc th&ocirc;ng qua c&aacute;c Đại l&yacute;, Tổng đại l&yacute;. Nhờ ch&uacute; trọng v&agrave;o chất lượng, hiệu quả v&agrave; độ an to&agrave;n, Hanoi Petro đ&atilde; tạo dựng được uy t&iacute;n, được c&aacute;c hộ gia đ&igrave;nh, qu&aacute;n ăn, nh&agrave; h&agrave;ng, cơ sở sản xuất - kinh doanh tin d&ugrave;ng.</p>

<p>&nbsp;</p>

<h3><strong>1.2. Chất lượng gas Hanoi Petro 45kg lu&ocirc;n được đảm bảo</strong></h3>

<p>Hanoi Petro hiện đang sở hữu nh&agrave; m&aacute;y chiết nạp đạt quy chuẩn Quốc gia trong ng&agrave;nh kh&iacute; dầu mỏ h&oacute;a lỏng. Nhi&ecirc;n liệu (LPG) được sử dụng để chiết nạp v&agrave;o b&igrave;nh gas c&ocirc;ng nghiệp HP 45kg đều được nhập từ c&aacute;c nh&agrave; cung cấp uy t&iacute;n trong nước v&agrave; thế giới, c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Do đ&oacute;, nước gas lu&ocirc;n được đảm bảo chất lượng với th&agrave;nh phần ch&iacute;nh chỉ bao gồm Butane, Propane v&agrave; chất tạo m&ugrave;i, kh&ocirc;ng pha trộn tạp chất như c&aacute;c cơ sở chiết nạp lậu.</p>

<p>B&ecirc;n cạnh đ&oacute;, nhờ ứng dụng d&acirc;y chuyển chiết nạp tự động h&oacute;a cao n&ecirc;n nước gas trong b&igrave;nh gas Hanoi Petro 45kg được đảm bảo c&acirc;n đủ kg với sai số nhỏ hơn &plusmn;0.2kg. Hai th&agrave;nh phần ch&iacute;nh trong nước gas l&agrave; Butan, Propan được chiết nạp theo tỷ lệ từ 30 &harr; 70%. Đ&acirc;y l&agrave; tỷ lệ chuẩn, ph&ugrave; hợp với điều kiện kh&iacute; hậu v&agrave; kết cấu bếp nấu tại Việt Nam, gi&uacute;p tối ưu hiệu suất ch&aacute;y, tiết kiệm gas.</p>

<p>Nhờ đ&oacute;, gas HP 45kg khi nấu cho ngọn lửa xanh, mạnh, kh&ocirc;ng c&oacute; m&ugrave;i h&ocirc;i kh&oacute; chịu, tiết kiệm nhi&ecirc;n liệu v&agrave; thời gian đun nấu, kh&ocirc;ng l&agrave;m đen nồi.&nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1.3. B&igrave;nh gas Hanoi Petro 45kg c&oacute; độ an to&agrave;n cao</strong></h3>

<p>Để đảm bảo độ an to&agrave;n chống ch&aacute;y nổ, quy tr&igrave;nh sản xuất vỏ b&igrave;nh gas HP 45kg lu&ocirc;n tu&acirc;n thủ đầy đủ c&aacute;c ti&ecirc;u chuẩn TCVN 6292:1997 (Việt Nam) v&agrave; DOT 4BW-240 (Hoa Kỳ). Vật liệu th&eacute;p được sử dụng để chế tạo vỏ b&igrave;nh được nhập khẩu trực tiếp từ Nhật Bản, c&oacute; độ d&agrave;y đến 2,6 ly. Nhờ đ&oacute;, b&igrave;nh gas Hanoi Petro 45kg c&oacute; độ bền cao, chịu được &aacute;p lực lớn, đảm bảo an to&agrave;n chống ch&aacute;y nổ.</p>

<p><img alt="Bình gas Hanoi Petro 45kg công nghiệp" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-cong%20-nghiep-hp-30kg.jpg" /></p>

<p>Mỗi vỏ b&igrave;nh gas HP 30kg đều trải qua c&aacute;c bước kiểm tra, kiểm định khắt khe của c&aacute;c cơ quan c&oacute; thẩm quyền, đảm bảo đạt ti&ecirc;u chuẩn trước khi lưu h&agrave;nh tr&ecirc;n thị trường. Sau 5 năm, doanh nghiệp sẽ thu hồi vỏ b&igrave;nh để đ&aacute;nh gi&aacute; chất lượng, khắc phục điểm bất thường (nếu c&oacute;) v&agrave; đưa đi kiểm định lại trước khi tiếp tục lưu th&ocirc;ng để hạn chế sự c&oacute; c&oacute; thể xảy ra.</p>

<p>&nbsp;</p>

<h3><strong>1.4. Tem chống h&agrave;ng giả &amp;&nbsp;bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng</strong></h3>

<p>Để hạn chế t&igrave;nh trạng chiếm dụng vỏ b&igrave;nh sang chiết tr&aacute;i ph&eacute;p gas HP 45kg giả, ngo&agrave;i c&aacute;c th&ocirc;ng tin được in nổi tr&ecirc;n vỏ b&igrave;nh khi sản xuất, Hanoi Petro c&ograve;n trang bị tem chống h&agrave;ng giả (Theo ti&ecirc;u chuẩn của Bộ C&ocirc;ng an), được d&aacute;n tr&ecirc;n van cổ b&igrave;nh gas.</p>

<p>Ngo&agrave;i ra, để đảm bảo quyền lợi, gi&uacute;p kh&aacute;ch h&agrave;ng y&ecirc;n t&acirc;m sử dụng gas, h&atilde;ng đ&atilde; mua bảo hiểm ch&aacute;y nổ cho người ti&ecirc;u d&ugrave;ng cho mỗi b&igrave;nh gas Hanoi Petro 45kg trước khi lưu h&agrave;nh ra thị trường. Nếu c&oacute; sự cố ch&aacute;y nổ xảy ra do lỗi b&igrave;nh gas, kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ đại l&yacute;/nh&agrave; sản xuất để được hướng dẫn thủ tục đền b&ugrave; thiệt hại do sự cố thỏa đ&aacute;ng.</p>

<p>&nbsp;</p>

<h2><strong>2. B&igrave;nh gas HP 45kg ph&ugrave; hợp với đối tượng sử dụng n&agrave;o?</strong></h2>

<p>Hanoi Petro 45kg l&agrave; b&igrave;nh gas c&ocirc;ng nghiệp c&oacute; k&iacute;ch thước, khối lượng lớn, gi&aacute; b&aacute;n cao hơn nhiều so với loại b&igrave;nh d&acirc;n dụng 12kg. Do đ&oacute;, sản phẩm &iacute;t được sử dụng trong gia đ&igrave;nh m&agrave; chủ yếu được sản phẩm được sản xuất để đ&aacute;p ứng c&aacute;c nhu cầu sử dụng tại:</p>

<p>- Bếp ăn của qu&aacute;n ăn, nh&agrave; h&agrave;ng.</p>

<p>- Bếp ăn trong căn tin của trường học, nh&agrave; m&aacute;y, cơ quan, x&iacute; nghiệp.</p>

<p>- Cơ sở sản xuất - kinh doanh quy m&ocirc; nhỏ hoặc nhu cầu sử dụng gas lớn nhưng kh&ocirc;ng đủ điều kiện để lắp bồn chứa.</p>
', 1, 7, 1, 1578300.0000, N'GAS HP 45KG.png', 386, 61, CAST(N'2020-01-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (12, N'gas-petrovietnam-45kg', N'GAS PETROVIETNAM 45KG', N'PetroVietnam', N'Bình gas 45kg', N'<p>Dịch vụ kinh doanh ăn uống ng&agrave;y c&agrave;ng ph&aacute;t triển để phục vụ nhu cầu đa dạng của nhiều người. Điều n&agrave;y k&eacute;o theo nhu cầu sử dụng gas để chế biến nấu nướng l&ecirc;n cao. Tuy nhi&ecirc;n loại b&igrave;nh gas 12kg l&agrave; kh&ocirc;ng ph&ugrave; hợp bởi n&oacute; kh&ocirc;ng đ&aacute;p ứng được nhu cầu nấu nướng của nh&agrave; h&agrave;ng, kh&aacute;ch sạn, bếp ăn c&ocirc;ng nghiệp c&oacute;&nbsp;tần suất cao.</p>

<p>L&agrave; d&ograve;ng sản phẩm gas c&ocirc;ng nghiệp thuộc thương hiệu gas h&agrave;ng đầu Việt Nam, b&igrave;nh gas&nbsp;PetroVietnam 45kg l&agrave; lựa chọn l&yacute; tưởng cho c&aacute;c qu&aacute;n ăn, nh&agrave; h&agrave;ng, kh&aacute;ch sạn, trường học, hộ kinh doanh v&agrave; doanh nghiệp c&oacute; nhu cầu sử dụng gas lớn.&nbsp;</p>
', 1, 10, 1, 1478300.0000, N'GAS PETROVIETNAM 45KG.png', 43118, 2857, CAST(N'2020-01-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (13, N'bao-ro-ri-gas-13', N'BÁO RÒ RỈ GAS', N'báo;rò rỉ', N'Phát hiện khí gas bị rò rỉ và báo động khi có các sự cố về rò rỉ gas', N'Model	VTD 2005 (AC type):Nhận biết loại khí	LPG, LNG, Khí Mêtan, Khí dễ cháy:Điểm cảnh báo	Nồng độ cảnh báo 25% LEL:(Điểm cài đặt 18% LEL)::Công nghệ phát hiện	Khuyếch tán và phân tích chất dế cháy:Thời gian kích hoạt	Trong vòng 20 giây:Nhiệt độ và độ ẩm vận hành	0℃~40℃. < 90% (RH):Nguồn điện	AC 220V. 50/60Hz:Tiêu thụ điện năng	1.5W:Trọng lượng và Kích thước	224g và 70x120x38mm:Cảnh báo	 Đèn LED màu vàng:Phát âm báo (70dB DC 12V 20mA):ABS Nhựa chống cháy', 3, 1, 0, 200000.0000, N'images/products/13/df.jpg', 3150, 245, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (14, N'bao-ro-ri-gas-jic-678n-14', N'BÁO RÒ RỈ GAS JIC-678N', N'báo;rò rỉ;JIC-678N', N'Phát hiện khí gas bị rò rỉ và báo động khi có các sự cố về rò rỉ gas', N'Thiết bị báo rò rỉ gas đã trở nên khá quen thuộc với nhiều nhà bếp nhà hàng, bếp công nghiệp và cả bếp của các gia đình hiện nay. Công dụng chính của thiết bị gas này là phát hiện khí gas bị rò rỉ và báo động khi có các sự cố về rò rỉ gas, đảm bảo an toàn trong nhà bếp.:Đặc biệt là trong các nhà hàng thì các thiết bị bếp hoặc van dây được sử dụng với cường độ cao & thường xuyên thì việc xì gas hay rò rỉ gas rất dễ xảy ra. Trong nhiều trường hợp khác nguyên nhân xảy ra các sự cố về gas cũng có thể là do vết dầu mỡ bắn vào lâu ngày làm mục dây gas hoặc chuột bọ cắn dây gas, vì vậy việc trang bị cho nhà bếp một thiết bị báo rò rỉ gas này là khá quan trọng và đảm bảo an toàn cho cả người và tài sản của nhà hàng.:Thiết bị báo rò rỉ gas sẽ phát huy tác dụng tốt nhất khi kết hợp với thiết bị ngắt gas tự động và còi hú báo động, khi có sự cố thì thiết bị này sẽ truyền tín hiệu đến còi hú để báo động sự cố và thiết bị ngắt gas cũng tự động ngắt gas ngăn không cho gas tiếp tục rò rỉ ra ngoài.:Hiện nay trên thị trường thì các thiết bị báo rò rỉ gas khá đa dạng về nguồn gốc xuất xứ như Hàn Quốc, Trung Quốc, Đài Loan, Nhật Bản…Tùy theo ngân sách và nhu cầu của từng nhà hàng thì có thể sắm thiết bị cho phù hợp.:Toàn phát là đơn vị chuyên nhập khẩu và phân phối các thiết bị báo rò rỉ gas an toàn của Hàn Quốc, Nhật Bản, Hàn Quốc. chúng tôi sẵn sàng tư vấn cho quý vị lựa chọn thiết bị phù hợp, lắp đặt tận nơi, hướng dẫn sử dụng và bảo hành bảo trì chu đáo cho các sản phẩm bán ra.:Ngoài ra Petro VN cũng là nhà thầu::Lắp đặt mới, thay thế các thiết bị đã cũ, bảo trì bảo dưỡng hệ thống gas, ống gas, van dây gas của các nhà hàng đã sử dụng lâu ngày & có nguy cơ bị xì gas hoặc không đảm bảo an toàn khi có các sự cố về Gas.:Nhận tư vấn thiết kế thi công hệ thống gas an toàn tuyệt đối khi sử dụng cho nhà bếp nhà hàng, bếp công nghiệp căng tin trường học, bệnh viện nhà máy khu chế xuất…', 3, 1, 0, 195000.0000, N'images/products/14/df.jpg', 2041, 25, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (15, N'bo-ngat-gas-tu-dong-15', N'BỘ NGẮT GAS TỰ ĐỘNG', N'ngắt gas;tư động', N'Bộ ngắt gas tự động với hệ thống phát hiện rò rỉ gas', N'– Nguồn điện : AC-110/220V 50/60HZ:– Điện năng tiêu thụ chờ : 0.5W:– Điện năng tiêu thụ báo động : 2W:– Báo động tập trung : LEL 1/4:– Hoạt động nhiệt độ : -40oC ~ 70oC:– Loại: Bộ ngắt gas tự động với hệ thống phát hiện rò rỉ gas:– Trọng lượng: 0,15 kg:– Loại điều khiển: Thời gian (30 giây):-Tính năng chuyển mạch từ xa và tự động ngắt khi phát hiện rò rỉ khí gas', 3, 1, 0, 220000.0000, N'images/products/15/df.jpg', 4114, 422, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (16, N'day-dan-gas-cao-ap-cong-nghiep-windo-16', N'Dây dẫn gas cao áp công nghiệp WINDO', N'dây dẫn;cáo áp', N'Sản phẩm chất lượng cao, được thiết kế đặc biệt để đảm bảo an toàn và hiệu suất cho hệ thống dẫn gas.', N'Dây dẫn gas công nghiệp là sản phẩm đầu ra áp suất cao dùng cho van bếp gas công nghiệp khè nấu nhanh có độ bền rất cao,được người việt tin dùng toàn quốc. -Dây gas sử dụng cho van gas công nghiệp dùng bình gas 12kg hoặc bình gas bò 45kg - 50kg. -Sử dụng cao su chuyên dụng NBR ( nhật bản ) -->có độ bóng,không mùi,không bị lão hoá.', 3, 6, 0, 150000.0000, N'images/products/16/df.jpg', 1000, 311, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (17, N'van-dieu-ap-ngat-gas-tu-dong-cao-ap-windo-wd-349-17', N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-349', N'van;van điều áp;ngắt gas;tự động;windo;wd-349', N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-349', N'Van điều áp ngắt gas tự động cao áp WINDO WD-349 là một thiết bị an toàn và hiệu quả được thiết kế để kiểm soát áp suất trong hệ thống gas cao áp. Với chức năng tự động ngắt gas khi áp suất vượt quá mức cho phép, van này giúp bảo vệ hệ thống khỏi các nguy cơ gây cháy nổ do áp suất quá cao.

Sử dụng công nghệ tiên tiến và vật liệu chất lượng cao, van điều áp WINDO WD-349 đảm bảo độ chính xác và đáng tin cậy trong việc kiểm soát áp suất. Thiết kế thông minh và dễ dàng lắp đặt giúp tối ưu hóa hiệu suất hoạt động của hệ thống gas và giảm thiểu sự cố.

Với khả năng hoạt động tự động và đáng tin cậy, van điều áp ngắt gas tự động cao áp WINDO WD-349 là một phần không thể thiếu trong hệ thống gas công nghiệp và thương mại, giúp bảo vệ an toàn và tăng cường hiệu suất hoạt động.', 3, 6, 0, 70000.0000, N'images/products/17/df.jpg', 420, 43, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (18, N'van-dieu-ap-ngat-gas-tu-dong-cao-ap-windo-wd-348-18', N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-348', N'van;van điều áp;ngắt gas;tự động;windo;wd-348', N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-348', N'Van điều áp ngắt gas tự động cao áp WINDO WD-348 là một thiết bị chất lượng cao được thiết kế để kiểm soát áp suất trong hệ thống gas cao áp. Với chức năng tự động ngắt gas khi áp suất vượt quá mức cho phép, van này đảm bảo an toàn và độ tin cậy cao cho hệ thống.

Sử dụng công nghệ tiên tiến và vật liệu chất lượng, van WINDO WD-348 giúp duy trì áp suất ổn định trong hệ thống gas, ngăn ngừa các tình huống nguy hiểm có thể xảy ra do áp suất quá cao. Thiết kế thông minh và dễ dàng lắp đặt, van này phù hợp với nhiều ứng dụng trong ngành công nghiệp và thương mại.', 3, 6, 0, 70000.0000, N'images/products/18/df.jpg', 111, 64, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (19, N'van-dieu-ap-srg-19', N'Van điều áp SRG', N'Van điều áp;SRG', N'Van điều áp đảm bảo đường truyền gas ổn định, an toàn', N'VAN ĐIỀU ÁP SRG là một thiết bị chất lượng cao được sử dụng để kiểm soát áp suất trong hệ thống gas. Thiết bị này được thiết kế để tự động điều chỉnh áp suất và duy trì mức áp suất ổn định trong hệ thống.

Với tính năng tự động điều chỉnh, VAN ĐIỀU ÁP SRG giúp ngăn chặn các vấn đề có thể xảy ra do áp suất gas biến đổi không đều, bảo vệ hệ thống khỏi những cú sốc áp suất đột ngột và đảm bảo hoạt động ổn định của các thiết bị và đường ống gas.

VAN ĐIỀU ÁP SRG được sản xuất với công nghệ tiên tiến và vật liệu chất lượng, đảm bảo độ tin cậy cao và tuổi thọ dài lâu. Thiết bị này dễ dàng lắp đặt và vận hành, phù hợp cho nhiều ứng dụng trong các ngành công nghiệp và thương mại.', 3, 3, 0, 70000.0000, N'images/products/19/df.jpg', 4380, 43, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (20, N'van-dieu-ap-comap-20', N'Van điều áp Comap', N'Van điều áp;Comap', N'Van điều áp đảm bảo đường truyền gas ổn định, an toàn', N'VAN ĐIỀU ÁP COMAP là một thiết bị điều chỉnh áp suất chất lượng cao được sử dụng trong hệ thống gas. Thiết bị này được thiết kế để tự động điều chỉnh áp suất và duy trì mức áp suất ổn định trong hệ thống gas.

Với tính năng tự động điều chỉnh, VAN ĐIỀU ÁP COMAP giúp ngăn chặn các vấn đề có thể xảy ra do áp suất gas biến đổi không đều, bảo vệ hệ thống khỏi những cú sốc áp suất đột ngột và đảm bảo hoạt động ổn định của các thiết bị và đường ống gas.

Thiết bị này được sản xuất với công nghệ tiên tiến và vật liệu chất lượng, đảm bảo độ tin cậy cao và tuổi thọ dài lâu. VAN ĐIỀU ÁP COMAP cung cấp hiệu suất ổn định và đáng tin cậy trong môi trường làm việc khắc nghiệt và yêu cầu cao về kiểm soát áp suất.', 3, 3, 0, 80000.0000, N'images/products/20/df.jpg', 6423, 222, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (21, N'van-dieu-ap-reca-21', N'Van điều áp Reca', N'Van điều áp;Reca', N'Van điều áp đảm bảo đường truyền gas ổn định, an toàn', N'VAN ĐIỀU ÁP RECA là một thành phần quan trọng trong hệ thống gas, được thiết kế để điều chỉnh áp suất gas và bảo vệ hệ thống khỏi những biến động áp suất không mong muốn.

Thiết bị này tự động điều chỉnh áp suất vào mức ổn định và an toàn, đảm bảo rằng các thiết bị và đường ống gas hoạt động hiệu quả và ổn định. VAN ĐIỀU ÁP RECA giúp ngăn chặn các vấn đề có thể xảy ra do áp suất gas biến đổi không đều, như sự cố về áp suất quá cao hoặc quá thấp.

Thiết bị này được chế tạo từ các vật liệu chất lượng cao và được sản xuất với công nghệ tiên tiến, đảm bảo độ bền và độ tin cậy cao trong môi trường làm việc khắc nghiệt. VAN ĐIỀU ÁP RECA cung cấp hiệu suất ổn định và đáng tin cậy trong mọi điều kiện hoạt động.', 3, 3, 0, 65000.0000, N'images/products/21/df.jpg', 3423, 43, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (22, N'vong-chan-gio-the-he-moi-22', N'VÒNG CHẮN GIÓ THẾ HỆ MỚI', N'chắn gió', N'Giảm thiểu tối đa tác động của gió, giữ cho không gian bên trong vệt gió luôn yên tĩnh và thoải mái.', N'Vòng kiềng chắn gió thế hệ mới, sử dụng cho bếp gas mini của NaMilux.:Khả nặng chịu tải lên đến 25kg:Giúp che chắn ngọn lửa không bị gió khi ở ngoài trời.:Giúp tăng hiệu suất đốt (giảm thoát nhiệt) tiết kiệm thời gian nấu lên đến 36%. Và đồng thời tiết kiệm gas 36%:Lưu ý: chỉ sử dụng môi trường ngoài trời nơi có gió lùa. Nếu sử dụng trong phòng thì nhiệt độ tụ quá cao có thể ảnh hưởng đến độ bền của đầu đốt.', 3, 4, 0, 100000.0000, N'images/products/22/df.jpg', 56365, 3256, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (23, N'den-kho-na-197-23', N'Đèn khò NA-197', N'đèn khò;máy khò;NA-197', N'Đèn khò đa năng dùng để hàn gắn, nung nóng, nấu ăn', N'Loại sản phẩm	Đèn khò gas:Model	NA -197:Gas sử dụng	Lon gas butane:Công suất	1.8 kW (1500 kcal/h)"Lượng gas tiêu thụ	132 g/h"Nhiệt độ đầu khò	Lên đến 1200℃:Trọng lượng	153g:Kích thước	184 x 64 x 40 mm', 3, 4, 0, 200000.0000, N'images/products/23/df.jpg', 1239, 53, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (24, N'den-kho-ts1719rn-24', N'Đèn khò TS1719RN', N'đèn khò;máy khò;TS1719RN', N'Đèn khò đa năng dùng để hàn gắn, nung nóng, nấu ăn', N'Nấu ăn và phục vụ ăn uống:Đốt côn trùng, cỏ, rác.:Nấu cháy nhựa, uốn ống nhựa:Các công việc tạo hình trên kim loại:Loại sản phẩm	Đèn khò gas:Model	TS1719RN:Gas sử dụng	Lon gas butane:Công suất	1.4 kW (1200 Kcal/giờ):Lượng gas tiêu thụ	100g/giờ:Nhiệt độ đầu khò	>1200℃', 3, 4, 0, 200000.0000, N'images/products/24/df.jpg', 3322, 433, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (25, N'bep-gas-paloma', N'BẾP GAS DƯƠNG PALOMA PA-71EB', N'Bếp Paloma', N'Bếp gas dương', N'<p>PA-71EB l&agrave; mẫu bếp gas đ&ocirc;i tầm trung của thương hiệu Nhật Bản&nbsp;<a href="https://gas40.com/loai-san-pham/bep&amp;phukien/thuong-hieu/bep-paloma" target="_blank">PALOMA</a>, sở hữu thiết kế c&ugrave;ng c&aacute;c t&iacute;nh năng đơn giản gi&uacute;p việc nấu nướng trở n&ecirc;n dễ d&agrave;ng hơn. Bếp sở hữu c&aacute;c đặc điểm v&agrave; t&iacute;nh năng nổi bật như:</p>

<p><img alt="Thông số kỹ thuật bếp gas đôi Paloma PA-71EB" src="https://ecom.viettechsmart.com:5020/Media/Images/0/tinh-nang-bep-gas-doi-paloma-pa-71eb.jpg" /></p>

<h2><strong>Kiểu d&aacute;ng đơn giản, dễ sử dụng</strong></h2>

<p>Bếp gas đ&ocirc;i Paloma PA-71EB c&oacute; thiết kế đơn giản với c&aacute;c đường n&eacute;t được trau chuốt chỉn chu, kết hợp với gam m&agrave;u đen sẽ tạo sự sang trọng cho kh&ocirc;ng gian bếp. Thiết kế đặt nổi với n&uacute;t bật/tắt vật l&yacute;, c&aacute;c chức năng được tối giản khiến người d&ugrave;ng ở mọi độ tuổi c&oacute; thể dễ d&agrave;ng sử dụng bếp.</p>

<p>&nbsp;</p>

<h2><strong>Bộ đ&aacute;nh lửa Magneto nhạy, độ bền cao</strong></h2>

<p>PA-71EB được Paloma trang bị bộ đ&aacute;nh lửa cơ Magneto ti&ecirc;n tiến c&ocirc;ng nghệ Nhật Bản n&ecirc;n độ bền v&agrave; độ nhạy cao. Việc đ&aacute;nh lửa nhanh chỉ với 1 thao t&aacute;c ấn xoay nhẹ nh&agrave;ng kh&ocirc;ng chỉ mang lại sự tiện lợi cho người d&ugrave;ng m&agrave; c&ograve;n g&oacute;p phần tiết kiệm gas.</p>

<p>&nbsp;</p>

<h2><strong>Đầu đốt trong bằng đồng thau</strong></h2>

<p>Paloma PA-71EB được trang bị đầu đốt trong (Inner Burner) gi&uacute;p tạo ra ngọn lửa mạnh, tập trung v&agrave;o phần giữa đ&aacute;y nồi để giảm thất tho&aacute;t nhiệt lượng, tiết kiệm gas đ&aacute;ng kể so với đầu đốt thường đồng thời hạn chế t&igrave;nh trạng lửa bị tắt đột ngột khi c&oacute; gi&oacute; l&ugrave;a.&nbsp;</p>

<p>Kh&ocirc;ng những thế, đầu đốt n&agrave;y c&ograve;n được l&agrave;m bằng chất liệu đồng thau, hạn chế m&agrave;i m&ograve;n, khả năng dẫn nhiệt nhanh, tạo lửa xanh gi&uacute;p tiết kiệm gas, hạn chế t&igrave;nh trạng đen nồi sau khi nấu.</p>

<blockquote>
<p>►<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/6-loai-dau-dot-bep-gas-chon-chat-lieu-dau-dot-nao-tot-nhat.72" target="_blank"><em>6 loại đầu đốt bếp gas: Chọn chất liệu đầu đốt n&agrave;o tốt nhất?</em></a></p>
</blockquote>

<h2><strong>An to&agrave;n khi sử dụng</strong></h2>

<p>Bếp gas đ&ocirc;i Paloma PA-V71EB được trang bị cảm ứng ngắt gas tự động v&ocirc; c&ugrave;ng th&ocirc;ng minh. Chức năng gi&uacute;p bếp tự động ngắt nguồn cấp gas trong c&aacute;c trường hợp nước nấu bị tr&agrave;o ra ngo&agrave;i hoặc lửa bị tắt đột ngột do t&aacute;c động kh&aacute;ch quan kh&aacute;c. T&iacute;nh năng n&agrave;y được nhiều kh&aacute;ch h&agrave;ng đ&aacute;nh gi&aacute; cao nhờ hạn chế tối đa t&igrave;nh trạng r&ograve; rỉ kh&iacute; gas g&acirc;y nguy hiểm cho người d&ugrave;ng.</p>

<p><img alt="Tính năng của bếp gas đương Paloma PA-71EB" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-bep-paloma-pa-71eb.jpg" /></p>

<h2><strong>Kết cấu chắc chắn, dễ vệ sinh</strong></h2>

<p>Bếp Paloma PA-71EB c&oacute; kết cấu th&acirc;n bếp chắc chắn, bề mặt bếp l&agrave;m bằng kim loại phủ men n&ecirc;n hạn chế b&aacute;m bẩn v&agrave; oxy h&oacute;a, dễ lau ch&ugrave;i. B&ecirc;n cạnh đ&oacute;, kiềng bếp được thiết kế độc lập, c&oacute; thể th&aacute;o rời n&ecirc;n việc vệ sinh kh&aacute; dễ d&agrave;ng.</p>

<blockquote>
<h2><strong>VỀ PALOMA</strong></h2>
</blockquote>

<p>Paloma được th&agrave;nh lập từ năm 1911, được xem l&agrave; Tập đo&agrave;n ti&ecirc;n phong cung cấp c&aacute;c thiết bị gia dụng sử dụng kh&iacute; đốt trong ng&agrave;nh c&ocirc;ng nghiệp Nhật Bản. Hơn 100 năm lịch sử, Tập đo&agrave;n Paloma li&ecirc;n tục ph&aacute;t triển v&agrave; giới thiệu hơn 300 loại sản phẩm sử dụng kh&iacute; đốt trong gia đ&igrave;nh, c&ocirc;ng nghiệp v&agrave; lĩnh vực nh&agrave; h&agrave;ng chuy&ecirc;n nghiệp. Với phương ch&acirc;m &ldquo;Ch&iacute;nh trực v&agrave; lu&ocirc;n nỗ lực&rdquo;, lu&ocirc;n lắng nghe &yacute; kiến từ kh&aacute;ch h&agrave;ng, Paloma kh&ocirc;ng ngừng ph&aacute;t triển để đ&aacute;p ứng nhu cầu đa dạng của kh&aacute;ch h&agrave;ng kh&ocirc;ng chỉ tại Nhật Bản m&agrave; c&ograve;n c&aacute;c nước tr&ecirc;n thế giới.</p>

<p>Cty TNHH Paloma Việt Nam l&agrave; doanh nghiệp 100% vốn nước ngo&agrave;i thuộc Tập Đo&agrave;n Paloma Nhật Bản, tọa lạc tại 114-116 đường số 6 KĐT, CN &amp; DV VSIP HP, X&atilde; T&acirc;n Dương, Huyện Thuỷ Nguy&ecirc;n, Hải Ph&ograve;ng. Thương hiệu Paloma đ&atilde; c&oacute; mặt tại Việt Nam hơn 20 năm v&agrave; trở th&agrave;nh thương hiệu bếp gas uy t&iacute;n, chất lượng, được người Việt Nam tin d&ugrave;ng.</p>

<p>Xuy&ecirc;n suốt h&agrave;nh tr&igrave;nh ph&aacute;t triển, Paloma lu&ocirc;n đeo đuổi mục ti&ecirc;u an to&agrave;n &amp; tiện nghi theo sự kỳ vọng của kh&aacute;ch h&agrave;ng. Ưu ti&ecirc;n h&agrave;ng đầu của ch&uacute;ng t&ocirc;i cũng l&agrave; những sản phẩm AN TO&Agrave;N. V&igrave; vậy, t&iacute;nh năng vượt trội trong c&aacute;c sản phẩm bếp Paloma l&agrave; được trang bị thiết bị tự động ngắt kh&iacute; đốt an to&agrave;n (Safety Device).<br />
Với đội ngũ nh&acirc;n vi&ecirc;n chuy&ecirc;n nghiệp được huấn luyện tại Nhật v&agrave; tu&acirc;n thủ quy tr&igrave;nh quản l&yacute; chất lượng chặt chẽ theo ti&ecirc;u chuẩn quản l&yacute; c&ocirc;ng nghiệp Nhật Bản (JIS). Paloma Việt Nam mong muốn mang đến cho người ti&ecirc;u d&ugrave;ng Việt những sản phẩm CHẤT LƯỢNG - AN TO&Agrave;N v&agrave; TIẾT KIỆM NHI&Ecirc;N LIỆU, mang lại lợi &iacute;ch thiết thực cho người sử dụng.</p>
', 2, 11, 1, 1880000.0000, N'BEP GAS DUONG PALOMA PA-71EB.png', 48, 2, CAST(N'2023-05-13T07:00:00.000' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (26, N'bap-gas-duong-paloma-pa-6PEJ', N'BẾP GAS DƯƠNG PALOMA PA-6PEJ', N'Bếp Paloma', N'Bếp gas dương paloma ', N'<p>PA-6PEJ l&agrave; mẫu bếp gas đ&ocirc;i nhập khẩu đến từ thương hiệu&nbsp;<a href="https://gas40.com/loai-san-pham/bep&amp;phukien/thuong-hieu/bep-paloma" target="_blank">bếp gas Paloma</a>&nbsp;nổi tiếng Nhật Bản. Sở hữu thiết kế tối giản c&ugrave;ng nhiều t&iacute;nh năng tiện &iacute;ch, Paloma PA-6PEJ l&agrave; lựa chọn l&yacute; tưởng cho kh&ocirc;ng gian bếp hiện đại của gia đ&igrave;nh.</p>

<p>&nbsp;</p>

<h2><strong>Kiểu d&aacute;ng sang trọng, kết cấu chắc chắn</strong>&nbsp;</h2>

<p><img alt="Thiết kế của bếp gas đôi Paloma Pa-6PEJ " src="https://ecom.viettechsmart.com:5020/Media/Images/0/kieu-dang-bep-paloma-pa-6pej.jpg" /></p>

<p>Được thiết kế theo phong c&aacute;ch Nhật Bản, Paloma Pa-6PEJ đề cao sự tối giản với kết cấu chắc chắn, ổn định, dễ lắp đặt v&agrave; sử dụng. B&ecirc;n cạnh đ&oacute;, to&agrave;n bộ th&acirc;n bếp l&agrave; m&agrave;u đen x&aacute;m gi&uacute;p mang lại vẻ sang trọng, h&ograve;a hợp với mọi kh&ocirc;ng gian bếp.</p>

<p>&nbsp;</p>

<h2><strong>Chất liệu cao cấp, bền bỉ, dễ vệ sinh</strong></h2>

<p>L&agrave; mẫu bếp gas dương cao cấp, PA-6PEJ sử dụng chất liệu bền bỉ với mặt bếp bằng kim loại chịu nhiệt phủ men chống d&iacute;nh. Nhờ đ&oacute;, bếp lu&ocirc;n s&aacute;ng b&oacute;ng, bền m&agrave;u v&agrave; chống rỉ s&eacute;t tốt. Kiềng bếp l&agrave;m bằng chất liệu kim loại phủ men, được thiết kế gồm 5 ch&acirc;n vững chắc, dễ d&agrave;ng th&aacute;o rời, c&oacute; gi&aacute; đỡ hứng thức ăn rơi xuống khi nấu gi&uacute;p việc vệ sinh bếp trở n&ecirc;n dễ d&agrave;ng, đơn giản hơn.</p>

<p>&nbsp;</p>

<h2><strong>Bộ đ&aacute;nh lửa IC - bật bếp nhanh ch&oacute;ng</strong></h2>

<p>Bếp gas dương Paloma PA-6PEJ được trang bị hệ thống đ&aacute;nh lửa điện tử IC, hoạt động nhờ pin 1.5V gi&uacute;p đ&aacute;nh lửa nhanh, thay pin dễ d&agrave;ng. Bếp sử dụng c&ocirc;ng tắc bật/tắt bếp v&agrave; cần gạt để điều chỉnh độ lửa thay v&igrave; n&uacute;m xoay truyền thống, mang lại sự thuận tiện khi thao t&aacute;c sử dụng.</p>

<p><img alt="Bộ đánh lửa IC của bếp gas Paloma Pa-6PEJ " src="https://ecom.viettechsmart.com:5020/Media/Images/0/cau-tao-bep-gas-doi-paloma-pa-6pej.jpg" /></p>

<h2><strong>Đầu đốt trong tiết kiệm gas, độ bền cao</strong></h2>

<p>Paloma PA-6PEJ được trang bị đầu đốt trong tiết kiệm gas ECO 600 gi&uacute;p ngọn lửa tập trung ở giữa đ&aacute;y nồi, c&aacute;c khe lửa ph&acirc;n bố đều gi&uacute;p tối ưu hiệu suất đốt ch&aacute;y, tiết kiệm gas v&agrave; thời gian nấu nướng. B&ecirc;n cạnh đ&oacute;, chất liệu đầu đốt bằng đồng thau c&oacute; độ bền cao, hạn chế m&agrave;i m&ograve;n v&agrave; biến dạng khi tiếp x&uacute;c l&acirc;u với nhiệt độ n&ecirc;n c&oacute; tuổi thọ cao, giảm bớt chi ph&iacute; bảo tr&igrave;, thay mới.</p>

<blockquote>
<p>►<strong>Xem th&ecirc;m:</strong>&nbsp;<em><a href="https://gas40.com/tin-tuc/6-loai-dau-dot-bep-gas-chon-chat-lieu-dau-dot-nao-tot-nhat.72" target="_blank">6 loại đầu đốt bếp gas: Chọn chất liệu đầu đốt n&agrave;o tốt nhất</a></em></p>
</blockquote>

<h2><strong>An to&agrave;n hơn với t&iacute;nh năng ngắt gas tự động</strong></h2>

<p>Paloma PA-6PEJ được t&iacute;ch hợp th&ecirc;m cảm ứng tự động kh&oacute;a gas trong trường hợp lửa bị tắt đột ngột do gi&oacute; l&ugrave;a hay nước s&ocirc;i tr&agrave;n ra ngo&agrave;i l&agrave;m ướt bếp. T&iacute;nh năng n&agrave;y gi&uacute;p hạn chế nguy cơ r&ograve; rỉ kh&iacute; gas, tr&aacute;nh ch&aacute;y nổ đồng thời tăng tuổi thọ cho bếp.</p>

<blockquote>
<h2><strong>VỀ PALOMA</strong></h2>
</blockquote>

<p>Paloma được th&agrave;nh lập từ năm 1911, được xem l&agrave; Tập đo&agrave;n ti&ecirc;n phong cung cấp c&aacute;c thiết bị gia dụng sử dụng kh&iacute; đốt trong ng&agrave;nh c&ocirc;ng nghiệp Nhật Bản. Hơn 100 năm lịch sử, Tập đo&agrave;n Paloma li&ecirc;n tục ph&aacute;t triển v&agrave; giới thiệu hơn 300 loại sản phẩm sử dụng kh&iacute; đốt trong gia đ&igrave;nh, c&ocirc;ng nghiệp v&agrave; lĩnh vực nh&agrave; h&agrave;ng chuy&ecirc;n nghiệp. Với phương ch&acirc;m &ldquo;Ch&iacute;nh trực v&agrave; lu&ocirc;n nỗ lực&rdquo;, lu&ocirc;n lắng nghe &yacute; kiến từ kh&aacute;ch h&agrave;ng, Paloma kh&ocirc;ng ngừng ph&aacute;t triển để đ&aacute;p ứng nhu cầu đa dạng của kh&aacute;ch h&agrave;ng kh&ocirc;ng chỉ tại Nhật Bản m&agrave; c&ograve;n c&aacute;c nước tr&ecirc;n thế giới.</p>

<p>Cty TNHH Paloma Việt Nam l&agrave; doanh nghiệp 100% vốn nước ngo&agrave;i thuộc Tập Đo&agrave;n Paloma Nhật Bản, tọa lạc tại 114-116 đường số 6 KĐT, CN &amp; DV VSIP HP, X&atilde; T&acirc;n Dương, Huyện Thuỷ Nguy&ecirc;n, Hải Ph&ograve;ng. Thương hiệu Paloma đ&atilde; c&oacute; mặt tại Việt Nam hơn 20 năm v&agrave; trở th&agrave;nh thương hiệu bếp gas uy t&iacute;n, chất lượng, được người Việt Nam tin d&ugrave;ng.</p>

<p>Xuy&ecirc;n suốt h&agrave;nh tr&igrave;nh ph&aacute;t triển, Paloma lu&ocirc;n đeo đuổi mục ti&ecirc;u an to&agrave;n &amp; tiện nghi theo sự kỳ vọng của kh&aacute;ch h&agrave;ng. Ưu ti&ecirc;n h&agrave;ng đầu của ch&uacute;ng t&ocirc;i cũng l&agrave; những sản phẩm AN TO&Agrave;N. V&igrave; vậy, t&iacute;nh năng vượt trội trong c&aacute;c sản phẩm bếp Paloma l&agrave; được trang bị thiết bị tự động ngắt kh&iacute; đốt an to&agrave;n (Safety Device).<br />
Với đội ngũ nh&acirc;n vi&ecirc;n chuy&ecirc;n nghiệp được huấn luyện tại Nhật v&agrave; tu&acirc;n thủ quy tr&igrave;nh quản l&yacute; chất lượng chặt chẽ theo ti&ecirc;u chuẩn quản l&yacute; c&ocirc;ng nghiệp Nhật Bản (JIS). Paloma Việt Nam mong muốn mang đến cho người ti&ecirc;u d&ugrave;ng Việt những sản phẩm CHẤT LƯỢNG - AN TO&Agrave;N v&agrave; TIẾT KIỆM NHI&Ecirc;N LIỆU, mang lại lợi &iacute;ch thiết thực cho người sử dụng.</p>
', 2, 11, 1, 3290000.0000, N'BEP GAS DUONG PALOMA PA-6PEJ.png', 98, 500, CAST(N'2022-07-20T09:30:10.460' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (27, N'bep-gas-am-rinnai-rvb-6sdq', N'BẾP GAS ÂM RINNAI RVB-6SDQ', N'Rinnai', N'Thiết kế sang trọng, hiện đại kết hợp nhiều tính năng tiện ích', N'<p>Thiết kế sang trọng, hiện đại kết hợp nhiều t&iacute;nh năng tiện &iacute;ch, Rinnai RVB-6SDQ(B) l&agrave; mẫu bếp gas &acirc;m đ&aacute;ng để sở hữu ở ph&acirc;n kh&uacute;c tr&ecirc;n dưới 3 triệu đồng. Mẫu bếp gas đ&ocirc;i của Rinnai được nhiều người nội trợ khuy&ecirc;n d&ugrave;ng nhờ sở hữu nhiều ưu điểm vượt trội như:&nbsp;</p>

<p>&nbsp;</p>

<h2><strong>Thiết kế độc đ&aacute;o, sang trọng</strong></h2>

<p><img alt="Kiểu dáng sang trọng của bếp gas âm Rinnai RVB-6SDQ" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-bep-gas-am-rinnai-rvb-6sdqb.jpg" /></p>

<p>Kh&aacute;c với c&aacute;c mẫu bếp đ&ocirc;i th&ocirc;ng thường c&oacute; 2 l&ograve; ngang h&agrave;ng tương đương nhau, Rinnai RVB-6SDQ sở hữu kiểu d&aacute;ng độc đ&aacute;o với 1 l&ograve; lớn d&ugrave;ng để nấu c&aacute;c m&oacute;n canh, chi&ecirc;n, x&agrave;o, đun nước,&hellip;v&agrave; l&ograve; nhỏ chuy&ecirc;n d&ugrave;ng cho c&aacute;c m&oacute;n kho, ninh, hầm,...C&aacute;c l&ograve; nấu được bố tr&iacute; ở 2 g&oacute;c x&eacute;o c&ograve;n n&uacute;t điều khiển nằm gần g&oacute;c vu&ocirc;ng b&ecirc;n phải tạo sự mới lạ, thuận tiện cho người sử dụng.</p>

<p>Rinnai RVB-6SDQ c&oacute; thiết kế lắp &acirc;m hiện đại, k&iacute;ch thước gọn g&agrave;ng gi&uacute;p tối ưu kh&ocirc;ng gian bếp. Mặt bếp sử dụng k&iacute;nh cường lực m&agrave;u đen s&aacute;ng b&oacute;ng, khiến căn bếp gia đ&igrave;nh trở n&ecirc;n hiện đại m&agrave; kh&ocirc;ng k&eacute;m phần sang trọng.&nbsp;</p>

<p>&nbsp;</p>

<h2><strong>Kết cấu chắc chắn, bền bỉ, dễ vệ sinh</strong>&nbsp;</h2>

<p>Nhờ thiết kế v&agrave; sản xuất theo ti&ecirc;u chuẩn Nhật Bản, lại c&oacute; thiết kế lắp &acirc;m, hạn chế sự dịch chuyển n&ecirc;n bếp Rinnai RVB-6SDQ c&oacute; kết cấu vững chắc. Mặt bếp sử dụng k&iacute;nh cường lực c&oacute; khả năng chống trầy xước, chịu lực l&ecirc;n đến 15kg v&agrave; chịu nhiệt đến 1000&ordm;C n&ecirc;n rất bền bỉ, tuổi thọ cao.</p>

<p>Kh&ocirc;ng những thế, thiết kế lắp &acirc;m v&agrave; chất liệu k&iacute;nh cường lực c&ograve;n c&oacute; khả năng chống b&aacute;m bụi, dễ lau ch&ugrave;i. Kiềng bếp bằng kim loại phủ men gi&uacute;p hạn chế b&aacute;m bẩn, c&oacute; thể th&aacute;o rời, tiện lợi khi cần vệ sinh.</p>

<blockquote>
<p>►<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/5-cach-ve-sinh-bep-ga-don-gian-cho-bep-luon-sach-bong.8" target="_blank">5 c&aacute;ch vệ sinh bếp ga đơn giản cho bếp lu&ocirc;n sạch bong</a></p>
</blockquote>

<h2><strong>Đầu đốt k&iacute;n tiết kiệm gas</strong></h2>

<p>RVB-6SDQ(B) được&nbsp;<a href="https://gas40.com/loai-san-pham/bep&amp;phukien/thuong-hieu/rinnai" target="_blank">Rinnai</a>&nbsp;trang bị đầu đốt k&iacute;n (Sealed Burner) hợp kim nh&ocirc;m. Loại đầu đốt n&agrave;y được gắn liền khối, kh&ocirc;ng c&oacute; khe hở như c&aacute;c loại đầu đốt kh&aacute;c n&ecirc;n c&oacute; thể hạn chế t&igrave;nh trạng thức ăn rơi v&agrave;o b&ecirc;n trong g&acirc;y tắc nghẽn. Điều n&agrave;y gi&uacute;p duy tr&igrave; sự ổn định của việc đốt ch&aacute;y nhi&ecirc;n liệu, tiết kiệm thời gian v&agrave; chi ph&iacute; vệ sinh, bảo tr&igrave;, bảo dưỡng.</p>

<p><img alt="Tính năng của bếp gas âm Rinnai RVB-6SDQ" src="https://ecom.viettechsmart.com:5020/Media/Images/0/dau-dot-kin-bep-rinnai-rvb-6sdqb.jpg" /></p>

<p>B&ecirc;n cạnh đ&oacute;, việc thiết kế 1 l&ograve; nhỏ hơn chuy&ecirc;n d&ugrave;ng cho c&aacute;c m&oacute;n kho, ninh, hầm,... cần đun lửa nhỏ trong thời gian d&agrave;i. Đầu đốt n&agrave;y cho ngọn lửa nhỏ, tập trung ở đ&aacute;y nồi n&ecirc;n kh&ocirc;ng chỉ đảm bảo hương vị m&oacute;n ăn m&agrave; c&ograve;n tiết kiệm gas đ&aacute;ng kể cho người d&ugrave;ng. Với tổng định mức ti&ecirc;u thụ nhi&ecirc;n liệu tối đa chỉ 0.366kg/h cho cả 2 l&ograve;, Rinnai RVB-6SDQ được đ&aacute;nh gi&aacute; l&agrave; mẫu bếp gas tiết kiệm năng lượng tr&ecirc;n thị trường.</p>

<blockquote>
<p>►<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/6-loai-dau-dot-bep-gas-chon-chat-lieu-dau-dot-nao-tot-nhat.72" target="_blank">6 loại đầu đốt bếp gas: Chọn chất liệu đầu đốt n&agrave;o tốt nhất</a></p>
</blockquote>

<h2><strong>Bộ đ&aacute;nh lửa IC si&ecirc;u nhạy</strong></h2>

<p>Bếp gas &acirc;m Rinnai RVB-6SDQ được trang bị hệ thống đ&aacute;nh lửa điện tử IC nhạy b&eacute;n gi&uacute;p đ&aacute;nh lửa nhanh, an to&agrave;n v&agrave; tiết kiệm nhi&ecirc;n liệu. Bộ đ&aacute;nh lửa n&agrave;y sử dụng loại pin 1.5V th&ocirc;ng dụng tr&ecirc;n thị trường n&ecirc;n c&oacute; thể dễ d&agrave;ng t&igrave;m mua &amp; thay thế khi hết pin.</p>

<p>&nbsp;</p>

<h2><strong>An to&agrave;n hơn với chức năng ngắt gas tự động</strong></h2>

<p>L&agrave; mẫu bếp gas &acirc;m tầm trung nhưng RV-6SDQ(B) được Rinnai t&iacute;ch hợp cảm biến ngắt gas tự động để n&acirc;ng cao độ an to&agrave;n. Chức năng tự động k&iacute;ch hoạt trong trường hợp lửa bị tắt đột ngột do gi&oacute; l&ugrave;a hoặc chất lỏng trong nồi tr&agrave;n chảy xuống bếp khi s&ocirc;i, nhờ đ&oacute; giảm thiểu nguy cơ ch&aacute;y nổ do r&ograve; rỉ kh&iacute; gas.</p>
', 2, 5, 1, 2980000.0000, N'BEP GAS AM RINNAI RVB-6SDQ.png', 10, 20, CAST(N'2021-05-13T09:50:42.460' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (28, N'bep-ga-duong-rinnai-rv-715SLIM', N'BẾP GAS DƯƠNG RINNAI RV-715SLIM', N'Rinnai', N'Dòng bếp gas đôi để bàn ứng dụng công nghệ Nhật Bản mới', N'<p>Tương tự mẫu bếp RV-715Slim, RV-715Slim l&agrave; d&ograve;ng bếp gas đ&ocirc;i để b&agrave;n ứng dụng c&ocirc;ng nghệ Nhật Bản mới kh&aacute;c của thương hiệu&nbsp;<a href="https://gas40.com/loai-san-pham/bep&amp;phukien/thuong-hieu/rinnai" target="_blank">RINNAI</a>, được sản xuất tại Việt Nam. Ngo&agrave;i k&iacute;ch thước v&agrave; định mức ti&ecirc;u thụ gas tối đa lớn hơn Rinnai RV-715Slim, mẫu bếp gas n&agrave;y cũng sở hữu những đặc điểm, t&iacute;nh năng tương tự như:</p>

<p>&nbsp;</p>

<h2><strong>Thiết kế hiện đại, dễ vệ sinh</strong></h2>

<p><img alt="Kiểu dáng hiện đại của bếp Rinnai RV-715Slim" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-bep-gas-doi-rinnai-rv-715slim.jpg" /></p>

<p>Bếp gas dương Rinnai RV-715Slim sở hữu thiết kế hiện đại với kiểu d&aacute;ng gọn g&agrave;ng, c&oacute; thể lắp đặt linh hoạt m&agrave; kh&ocirc;ng chiếm dụng qu&aacute; nhiều kh&ocirc;ng gian. Ứng dụng c&ocirc;ng nghệ mới của Rinnai, kết cấu của bếp kh&aacute; chắc chắn, kiềng bếp c&oacute; thiết kế 5 ch&acirc;n giữ cho nồi, chảo được vững v&agrave;ng khi nấu.</p>

<p>Mặt bếp sử dụng k&iacute;nh cường lực c&oacute; khả năng chịu lực v&agrave; chịu nhiệt tốt, kh&ocirc;ng bị rỉ s&eacute;t, bền m&agrave;u theo thời gian. C&aacute;c hoa văn được thiết kế tỉ mỉ tr&ecirc;n mặt k&iacute;nh s&aacute;ng b&oacute;ng gi&uacute;p n&acirc;ng cao t&iacute;nh thẩm mỹ cho sản phẩm. Kh&ocirc;ng những thế, chất liệu k&iacute;nh c&ograve;n c&oacute; khả năng hạn chế tối đa t&igrave;nh trạng b&aacute;m bụi v&agrave; vết dầu mỡ, thức ăn thừa b&aacute;m v&agrave;o trong qu&aacute; tr&igrave;nh nấu nướng. Kiềng bếp cũng được phủ men chống d&iacute;nh, c&oacute; thể th&aacute;o rời n&ecirc;n việc vệ sinh, lau ch&ugrave;i bếp trở n&ecirc;n đơn giản, tiết kiệm thời gian hơn.</p>

<blockquote>
<p>►<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/5-cach-ve-sinh-bep-ga-don-gian-cho-bep-luon-sach-bong.8" target="_blank">5 c&aacute;ch vệ sinh bếp ga đơn giản cho bếp lu&ocirc;n sạch bong</a></p>
</blockquote>

<h2><strong>Hệ thống đ&aacute;nh lửa Magneto nhạy, bền bỉ</strong></h2>

<p>Rinnai RV-715Slim được trang bị hệ thống đ&aacute;nh lửa bằng cơ Magneto được sản xuất theo c&ocirc;ng nghệ ti&ecirc;n tiến. Bộ đ&aacute;nh lửa n&agrave;y c&oacute; độ nhạy cao, bền bỉ, kết hợp với n&uacute;m vặn gi&uacute;p người d&ugrave;ng dễ d&agrave;ng bật/tắt v&agrave; điều chỉnh độ lửa theo &yacute; muốn.</p>

<p>&nbsp;</p>

<h2><strong>Đầu đốt bằng đồng thau si&ecirc;u bền</strong></h2>

<p>L&agrave; mẫu bếp gas dương tầm trung nhưng RV-715Slim được Rinnai trang bị đầu đốt bằng đồng thau đ&uacute;c nguy&ecirc;n khối. Loại đầu đốt n&agrave;y vốn được đ&aacute;nh gi&aacute; cao nhờ khả năng chịu nhiệt cực tốt n&ecirc;n tuổi thọ cao, tiết kiệm chi ph&iacute; thay thế trong qu&aacute; tr&igrave;nh sử dụng.</p>

<p><img alt="Đầu đốt bếp gas Rinnai RV-715Slim" src="https://ecom.viettechsmart.com:5020/Media/Images/0/dau-dot-bep-rinnai-rv-615slim.jpg.jpg" /></p>

<p>B&ecirc;n cạnh đ&oacute;, khả năng dẫn nhiệt nhanh v&agrave; tốt của loại đầu đốt n&agrave;y gi&uacute;p ngọn lửa xanh, mạnh, vừa hạn chế đen nồi, đảm bảo được hương vị m&oacute;n ăn vừa tiết kiệm gas đ&aacute;ng kể.</p>

<blockquote>
<p>►<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/6-loai-dau-dot-bep-gas-chon-chat-lieu-dau-dot-nao-tot-nhat.72" target="_blank">6 loại đầu đốt bếp gas: Chọn chất liệu đầu đốt n&agrave;o tốt nhất&nbsp;</a></p>
</blockquote>

<h2><strong>Đầu h&acirc;m tiện lợi cho c&aacute;c m&oacute;n ninh, hầm, kho</strong></h2>

<p>Rinnai RV-715Slim được t&iacute;ch hợp th&ecirc;m p&eacute;p h&acirc;m với ngọn lửa nhỏ, th&iacute;ch hợp cho việc h&acirc;m n&oacute;ng thức ăn hoặc chế biến c&aacute;c m&oacute;n kho, ninh, hầm... cần lửa nhỏ liu riu.<br />
RV-715Slim được thiết kế đạt chuẩn an to&agrave;n quốc tế của Tập đo&agrave;n Rinnai, khả năng hoạt động bền bỉ v&agrave; tiết kiệm năng lượng, hứa hẹn sẽ l&agrave; trợ thủ đắc lực của người nội trợ, mang đến bữa ăn thơm ngon, n&oacute;ng ấm mỗi ng&agrave;y cho gia đ&igrave;nh.</p>
', 2, 5, 1, 1830000.0000, N'BEP GAS DUONG RINNAI RV-715SLIM.png', 50, 2, CAST(N'2023-08-30T11:20:00.460' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (29, N'bep-ga-duong-rinnai-rv-460S', N'BẾP GAS DƯƠNG RINNAI RV-460S', N'Rinnai', N'là mẫu bếp gas đôi giá rẻ của thương hiệu thiết bị nhà bếp nổi tiếng RINNAI', N'<p>RV-460S l&agrave; mẫu bếp gas đ&ocirc;i gi&aacute; rẻ của thương hiệu thiết bị nh&agrave; bếp nổi tiếng&nbsp;<a href="https://gas40.com/loai-san-pham/bep&amp;phukien/thuong-hieu/rinnai" target="_blank">RINNAI</a>&nbsp;được sản xuất nhằm đ&aacute;p ứng nhu cầu của người ti&ecirc;u d&ugrave;ng Việt Nam. Mặc d&ugrave; c&oacute; mức gi&aacute; b&igrave;nh d&acirc;n nhưng mẫu bếp gas dương n&agrave;y lại được sản xuất theo c&ocirc;ng nghệ mới của Rinnai n&ecirc;n sở hữu nhiều ưu điểm khiến người nội trợ Việt ưa chuộng.</p>

<p>&nbsp;</p>

<h2><strong>Thiết kế tối giản, độ bền cao</strong></h2>

<p><img alt="Bếp gas đôi Rinnai RV-460S sở hữu thiết kế đơn giản" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-bep-gas-doi-rinnai-rv-460s.jpg" /></p>

<p>Rinnai RV-460S l&agrave; mẫu bếp gas đ&ocirc;i c&oacute; thiết kế đơn giản với mặt bếp l&agrave;m bằng inox cao cấp s&aacute;ng b&oacute;ng, th&acirc;n &amp; kiềng bếp l&agrave; th&eacute;p tr&aacute;ng men chống d&iacute;nh v&agrave; chống rỉ s&eacute;t, dễ vệ sinh lau ch&ugrave;i. Được sản xuất theo c&ocirc;ng nghệ Nhật Bản, bếp c&oacute; kết cấu vững ch&atilde;i, kiềng bếp chắc chắn, giữ cho nồi, chảo&hellip;ổn định trong suốt qu&aacute; tr&igrave;nh nấu nướng. Thiết kế, vật liệu v&agrave; kết cấu n&agrave;y cũng gi&uacute;p tuổi thọ của RV-460S cao hơn so với nhiều mẫu bếp gas gi&aacute; rẻ kh&aacute;c tr&ecirc;n thị trường.&nbsp;</p>

<p>&nbsp;</p>

<h2><strong>Bộ đ&aacute;nh lửa Magneto cực nhạy</strong></h2>

<p>Ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến Nhật Bản, hệ thống đ&aacute;nh lửa bằng cơ Magneto được trang bị tr&ecirc;n d&ograve;ng bếp gas gi&aacute; rẻ Rinnai RV-460S c&oacute; độ nhạy cao, gi&uacute;p người d&ugrave;ng thao t&aacute;c nhẹ nh&agrave;ng, đ&aacute;nh lửa nhanh chỉ trong 1 gi&acirc;y m&agrave; kh&ocirc;ng tốn nhiều nhi&ecirc;n liệu. Hơn thế, bộ đ&aacute;nh lửa n&agrave;y c&oacute; độ bền cao, hạn chế hỏng h&oacute;c n&ecirc;n tiết kiệm chi ph&iacute; sửa chữa/thay thế.</p>

<p>&nbsp;</p>

<h2><strong>Đầu đốt đồng thau bền bỉ</strong></h2>

<p><img alt="Đầu đốt bếp gas đôi Rinnai RV-460S" src="https://ecom.viettechsmart.com:5020/Media/Images/0/dau-dot-bep-gas-rinnai-rv-460s.jpg.jpg" /></p>

<p>C&ugrave;ng với bộ đ&aacute;nh lửa c&ocirc;ng nghệ mới l&agrave; đầu đốt bằng chất liệu đồng thau đ&uacute;c nguy&ecirc;n khối c&oacute; khả năng chịu nhiệt tốt, hạn chế bị biến dạng hay m&agrave;i m&ograve;n khi nấu nướng trong thời gian d&agrave;i. Kh&ocirc;ng những thế, chất liệu đồng c&ograve;n c&oacute; khả năng dẫn nhiệt tốt, c&aacute;c tia lửa ph&acirc;n bố đều, tập trung ở giữa n&ecirc;n khi nấu, ngọn lửa ch&aacute;y c&oacute; m&agrave;u xanh, hạn chế t&igrave;nh trạng đen dưới đ&aacute;y nồi.</p>

<blockquote>
<p>►<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/6-loai-dau-dot-bep-gas-chon-chat-lieu-dau-dot-nao-tot-nhat.72" target="_blank">6 loại đầu đốt bếp gas: Chọn chất liệu đầu đốt n&agrave;o tốt nhất</a></p>
</blockquote>

<h2><strong>Tiết kiệm gas</strong></h2>

<p>Bộ đ&aacute;nh lửa Magneto cải tiến kết hợp với đầu đốt đồng thau mang lại hiệu suất cao cho mẫu bếp gas Rinnai RV-460S. Thời gian đ&aacute;nh lửa nhanh, ngọn lửa m&agrave;u xanh tập trung từ giữa sau đ&oacute; mới ph&acirc;n t&aacute;n ra to&agrave;n bộ đ&aacute;y nồi gi&uacute;p hạn chế thất tho&aacute;t nhiệt, tiết kiệm gas cho người sử dụng. Theo c&ocirc;ng bố của h&atilde;ng, d&ograve;ng bếp RV-460S c&oacute; c&ocirc;ng suất 6.44kW, mức ti&ecirc;u thụ gas tối đa cả 2 l&ograve; chỉ 0.38kg/h, thấp hơn so với hầu hết c&aacute;c mẫu bếp gas gi&aacute; rẻ tr&ecirc;n thị trường hiện nay.</p>
', 2, 5, 1, 1050000.0000, N'BEP GAS DUONG RINNAI RV-460S.png', 16, 20, CAST(N'2022-07-20T12:50:00.000' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (30, N'bep-gas-rinnai-r-2KEN', N'BẾP GAS RINNAI R-2KEN', N'Rinnai', N'Bộ đánh lửa cơ Magneto, đầu đốt bằng đồng thau, kiểu dáng đơn giản, gọn nhẹ', N'<p>C&oacute; mặt tr&ecirc;n thị trường Việt Nam nhiều năm nay, chất lượng của bếp gas đ&ocirc;i R-2KEN của thương hiệu nổi tiếng&nbsp;<a href="https://gas40.com/loai-san-pham/bep&amp;phukien/thuong-hieu/rinnai" target="_blank">RINNAI</a>&nbsp;được người ti&ecirc;u d&ugrave;ng khẳng định l&agrave; tốt v&agrave; si&ecirc;u bền. Thuộc d&ograve;ng nhập khẩu nguy&ecirc;n chiếc từ Nhật Bản nồi đồng cối đ&aacute;, hiếm c&oacute; sản phẩm bếp gas n&agrave;o bền bỉ, c&oacute; tuổi thọ l&ecirc;n đến 15 năm như mẫu bếp n&agrave;y. Kh&ocirc;ng những thế, bếp c&ograve;n sở hữu nhiều ưu điểm nổi bật như:</p>

<p>&nbsp;</p>

<h2><strong>Kiểu d&aacute;ng đơn giản, gọn nhẹ</strong></h2>

<p>Rinnai R-2KEN được sản xuất, nhập khẩu nguy&ecirc;n chiếc từ Nhật Bản. So với c&aacute;c mẫu bếp gas đ&ocirc;i hiện c&oacute; tr&ecirc;n thị trường, k&iacute;ch thước của mẫu bếp n&agrave;y được đ&aacute;nh gi&aacute; l&agrave; kh&aacute; nhỏ gọn. Với k&iacute;ch thước để b&agrave;n chỉ 56 x 33cm (d&agrave;i x rộng), Rinnai R-2KEN ph&ugrave; hợp với mọi kh&ocirc;ng gian bếp, kể cả những căn bếp nhỏ trong ph&ograve;ng trọ.</p>

<p><img alt="Bếp gas đôi Rinnai R-2KEN sở hữu thiết kế gọn gàng" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-bep-rinnai-r-2ken.jpg" /></p>

<p>Kiểu d&aacute;ng của bếp kh&aacute; đơn giản với mặt bếp bằng kim loại phủ men. Tuy nhi&ecirc;n, mặt bếp của R-2KEN được sơn phủ Teflon c&oacute; khả năng chống rỉ s&eacute;t, chịu nhiệt tốt v&agrave; kh&ocirc;ng kết d&iacute;nh n&ecirc;n độ bền cao, hạn chế b&aacute;m bẩn, dễ vệ sinh gi&uacute;p th&acirc;n bếp lu&ocirc;n s&aacute;ng đẹp như mới.</p>

<p>&nbsp;</p>

<h2><strong>Bộ đ&aacute;nh lửa cơ Magneto si&ecirc;u nhạy, dễ sử dụng</strong></h2>

<p>Bếp gas dương Rinnai R-2KEN sử dụng hệ thống đ&aacute;nh lửa Magneto thế hệ mới si&ecirc;u nhạy, đ&acirc;y l&agrave; hệ thống đ&aacute;nh lửa tốt nhất trong c&aacute;c d&ograve;ng bếp gas dương hiện tại tr&ecirc;n thị trường. Bếp được đ&aacute;nh lửa v&agrave; điều chỉnh c&ocirc;ng suất th&ocirc;ng qua một n&uacute;t vặn cho ph&eacute;p bạn bật bếp v&agrave; điều chỉnh dễ d&agrave;ng chỉ với một v&agrave;i thao t&aacute;c nhẹ nh&agrave;ng, đơn giản l&agrave; ngay lập tức c&oacute; thể sử dụng. Bạn sẽ lu&ocirc;n lu&ocirc;n cảm thấy thoải m&aacute;i thuận tiện v&agrave; an to&agrave;n khi nấu nướng trong ng&ocirc;i nh&agrave; của bạn.</p>

<p>&nbsp;</p>

<h2><strong>Đầu đốt bằng đồng thau bền bỉ</strong></h2>

<p><img alt="Đầu đốt bằng đồng thau của Rinnai R-2KEN" src="https://ecom.viettechsmart.com:5020/Media/Images/0/dau-dot-bep-rinnai-r-2ken.jpg.jpg" /></p>

<p>Bếp Rinnai R-2KEN được trang bị đầu đốt bằng đồng thau đ&uacute;c nguy&ecirc;n khối. Loại đầu đốt n&agrave;y vốn được đ&aacute;nh gi&aacute; cao nhờ khả năng chịu nhiệt cực tốt n&ecirc;n tuổi thọ cao, tiết kiệm chi ph&iacute; thay thế trong qu&aacute; tr&igrave;nh sử dụng.</p>

<blockquote>
<p>►<strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://gas40.com/tin-tuc/6-loai-dau-dot-bep-gas-chon-chat-lieu-dau-dot-nao-tot-nhat.72" target="_blank">6 loại đầu đốt bếp gas: Chọn chất liệu đầu đốt n&agrave;o tốt nhất</a>&nbsp;</p>
</blockquote>

<h2><strong>Tiết kiệm gas với Rinnai R-2KEN</strong></h2>

<p>M&acirc;m chia lửa m&agrave; bếp gas dương Rinnai R-2KEN l&agrave; m&acirc;m chia lửa bằng đồng d&agrave;y c&oacute; thiết kế độc quyền của Rinnai nhằm mang lại hiệu quả sử dụng tối ưu nhất. Mặc d&ugrave; kh&ocirc;ng c&oacute; pep h&acirc;m nhưng bếp gas đ&ocirc;i Rinnai R-2KEN lại c&oacute; thiết kế 2 v&ugrave;ng nấu với 1 v&ugrave;ng nấu trung v&agrave; một v&ugrave;ng nấu nhỏ 1 v&ograve;ng lửa gi&uacute;p mang lại hương vị chuẩn, tiết kiệm gas khi nấu c&aacute;c m&oacute;n ninh, hầm, kho,...&nbsp;<br />
So với c&aacute;c mẫu bếp gas dương c&oacute; mặt tr&ecirc;n thị trường m&acirc;m chia lửa loại n&agrave;y cho ngọn lửa lớn, d&ugrave;ng bền hơn v&agrave; c&oacute; ngọn lửa xanh hơn c&aacute;c loại m&acirc;m chia lửa kh&aacute;c. Do thiết kế ngọn lửa tỏa ra dạng &ldquo;Open flame&rsquo; n&ecirc;n sẽ c&oacute; một nhiệt lượng bị hao ph&iacute; bị thất tho&aacute;t khi kh&ocirc;ng t&aacute;c động trực tiếp v&agrave;o đ&aacute;y nồi v&igrave; thế nhược điểm của kiểu m&acirc;m n&agrave;y l&agrave; kh&ocirc;ng c&oacute; được sự tối ưu trong khi nấu.</p>
', 2, 5, 1, 2970000.0000, N'BEP GAS RINNAI R-2KEN.png', 8, 20, CAST(N'2023-05-13T09:50:42.460' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (31, N'bep-du-lich-namilux-na-1911PF', N'BẾP DU LỊCH NAMILUX NA-1911PF', N'Namilux', N'Kết cấu vững chắc, độ bền cao, tiết kiệm gas, Công nghệ van ngắt InlineCut với độ an toàn cao', N'<p>Namilux NA-1911PF l&agrave; một trong những mẫu bếp&nbsp;chạy của Namilux - thương hiệu uy t&iacute;n h&agrave;ng đầu chuy&ecirc;n sản xuất, kinh doanh&nbsp;c&aacute;c thiết bị d&ugrave;ng gas bao gồm: bếp gas mini, bếp nướng gas hồng ngoại, bếp gas để b&agrave;n, bếp &acirc;m, bếp sưởi gas, đ&egrave;n kh&ograve;,&nbsp;lon gas mini, van b&igrave;nh gas,...tại thị trường Việt Nam.&nbsp;</p>

<p><em><strong>C&aacute;c t&iacute;nh năng nổi bật của bếp gas mini Namilux NA-1911PF:</strong></em></p>

<p>&nbsp;</p>

<h2><strong>Kết cấu vững chắc, độ bền cao</strong></h2>

<p>Th&acirc;n bếp Namilux NA-1911PF sử dụng&nbsp;chất liệu hợp kim cao cấp sơn tĩnh điện để chống rỉ s&eacute;t, chế tạo theo c&ocirc;ng nghệ Transfer Robot tạo n&ecirc;n kết cấu vững chắc v&agrave; đồng bộ. Kiềng bếp l&agrave; loại 2 cấp, chống trượt&nbsp;được mạ điện n&ecirc;n vừa n&acirc;ng đỡ nồi một c&aacute;ch chắc chắn vừa&nbsp;c&oacute; khả năng chịu nhiệt cao. B&ecirc;n cạnh đ&oacute;, thiết kế gi&oacute; đối lưu 4 chiều l&agrave;m m&aacute;t th&acirc;n bếp trong qu&aacute; tr&igrave;nh sử dụng, khoảng c&aacute;ch giữa đầu đốt v&agrave; ngăn chứa b&igrave;nh&nbsp;gas&nbsp;mini gi&uacute;p hạn chế sự truyền nhiệt xuống lon gas, tr&aacute;nh g&acirc;y ch&aacute;y nổ.</p>

<p><img alt="Tính năng của bếp gas mini Namilux NA-1911" src="https://ecom.viettechsmart.com:5020/Media/Images/0/tinh-nang-bep-gas-mini-namilux-na-1911pf.jpg" /></p>

<h2><strong>C&ocirc;ng nghệ cải tiến Nhật Bản, tiết kiệm gas</strong></h2>

<p>Đầu đốt của bếp Namilux NA-1911PF được thiết kế theo ti&ecirc;u chuẩn Nhật Bản, được cải tiến để mang lại hiệu suất tối ưu, cho ngọn lửa xanh, mạnh, tiết kiệm nhi&ecirc;n liệu. B&ecirc;n cạnh đ&oacute;, bộ đ&aacute;nh lửa bằng điện si&ecirc;u nhạy gi&uacute;p n&acirc;ng cao độ nhạy, c&oacute; thể sử dụng trong bất cứ điều kiện thời tiết n&agrave;o.</p>

<p>&nbsp;</p>

<h2><strong>C&ocirc;ng nghệ&nbsp;van ngắt InlineCut&nbsp;với độ an to&agrave;n cao</strong></h2>

<p>Bếp gas du lịch Namilux NA-1911PF được thiết kế&nbsp;cải tiến theo c&ocirc;ng nghệ chống ch&aacute;y nổ, trang bị cụm van ngắt gas an to&agrave;n 2 cấp Inline-Cut, ngắt gas trực tiếp từ b&ecirc;n trong theo cơ chế:</p>

<p><strong>Cấp 1:</strong>&nbsp;Khi &aacute;p suất lon gas qu&aacute; cao, bộ phận ngắt gas Inline-Cut sẽ tự động ngắt gas &amp; tắt lửa;</p>

<p><strong>Cấp 2:</strong>&nbsp;Nếu &aacute;p lực trong lon tiếp tục tăng đến giới hạn nguy hiểm (g&acirc;y nổ) do t&aacute;c động của m&ocirc;i trường, nhiệt độ, &hellip;cầu ch&igrave; sẽ tự động xả gas trong lon ra ngo&agrave;i, ngăn chặn t&igrave;nh trạng nổ b&igrave;nh gas.</p>

<p>&nbsp;</p>

<p>Sở hữu nhiều ưu điểm vượt trội như thiết kế gọn nhẹ, độ bền cao, an to&agrave;n v&agrave; tiết kiệm gas, bếp gas mini Namilux NA-1911PF&nbsp;được người ti&ecirc;u d&ugrave;ng ca nh&acirc;n, qu&aacute;n ăn, nh&agrave; h&agrave;ng,...ưa chuộng. Sản phẩm ph&ugrave; hợp với nhu cầu của sinh vi&ecirc;n, người lao động độc th&acirc;n, &iacute;t nấu nướng, sống ở ph&ograve;ng trọ muốn t&igrave;m kiếm một chiếc bếp gi&aacute; rẻ, tiện dụng. Namilux NA-1911PF cũng l&agrave; lựa chọn th&iacute;ch hợp cho những người đam m&ecirc; du lịch phượt, d&atilde; ngoại, c&aacute;c qu&aacute;n ăn, nh&agrave; h&agrave;ng chuy&ecirc;n phục vụ m&oacute;n lẩu, nướng, hấp,...tại b&agrave;n.&nbsp;&nbsp;</p>
', 2, 4, 1, 285000.0000, N'BEP DU LICH NAMILUX NA-1911PF.png', 48, 2, CAST(N'2020-04-13T06:30:00.000' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (32, N'bep-gas-duong-sakura-sa-610G', N'BẾP GAS DƯƠNG SAKURA SA-610G', N'Bếp Sakura', N'Thương hiệu uy tín Đài Loan', N'<h2><strong>Bếp gas Sakura - Thương hiệu uy t&iacute;n Đ&agrave;i Loan</strong></h2>

<p>Sakura l&agrave; thương hiệu sản xuất c&aacute;c thiết bị sử dụng gas uy t&iacute;n, chất lượng đến từ Đ&agrave;i Loan v&agrave; được du nhập v&agrave;o thị trường Việt Nam từ năm 2012.</p>

<p>C&aacute;c sản phẩm của thương hiệu trước khi đưa đến tay người ti&ecirc;u d&ugrave;ng đều trải qua qu&aacute; tr&igrave;nh kiểm định nghi&ecirc;m ngặt về chất lượng v&agrave; độ an to&agrave;n khi sử dụng n&ecirc;n bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m khi lựa chọn đồ d&ugrave;ng của Sakura.</p>

<p>Trong đ&oacute;, bếp gas Sakura l&agrave; một trong những sản phẩm được ưa chuộng nhất của h&atilde;ng sở hữu kiểu d&aacute;ng đơn giản, m&agrave;u sắc thời trang, chất liệu mặt bếp cao cấp, hệ thống đ&aacute;nh lửa th&ocirc;ng minh cho tia lửa nhạy v&agrave; đầu đốt kh&ocirc;ng l&agrave;m đen đ&aacute;y nồi.</p>

<p>&nbsp;</p>

<h2><strong>Ưu điểm nổi bật của bếp gas Sakura SA-610G&nbsp;</strong></h2>

<p>Sakura SA-610G l&agrave; mẫu bếp gas đ&ocirc;i tầm trung, ph&ugrave; hợp với nhu cầu sử dụng của c&aacute;c gia đ&igrave;nh Việt nhờ sở hữu nhiều ưu điểm, t&iacute;nh năng nổi bật như:</p>

<p>&nbsp;</p>

<h3><strong>Thiết kế hiện đại, tiện dụng</strong></h3>

<p><img alt="Bếp Sakura SA-610G sở hữu thiết kế hiện đại" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-bep-sakura-sa-610g.jpg" /></p>

<p>Bếp gas dương Sakura SA-610G được thiết kế mang đến sự tiện dụng tối đa cho người nội trợ. Mẫu bếp đ&ocirc;i n&agrave;y sở hữu kiểu d&aacute;ng si&ecirc;u mỏng, nhỏ gọn, hiện đại, ph&ugrave; hợp kh&ocirc;ng gian bếp của mọi gia đ&igrave;nh.</p>

<p>Mặt bếp Sakura SA-610G được l&agrave;m bằng k&iacute;nh cường lực s&aacute;ng b&oacute;ng, chịu nhiệt v&agrave; chịu lực tốt. Đặc biệt đ&acirc;y l&agrave; chất liệu &iacute;t b&aacute;m bẩn v&agrave; c&oacute; khả năng chống trầy xước, gi&uacute;p cho người d&ugrave;ng dễ d&agrave;ng vệ sinh sau khi nấu nướng.</p>

<p>&nbsp;</p>

<h3><strong>Hệ thống đ&aacute;nh lửa Magneto</strong></h3>

<p>Đặc biệt, bếp gas dương Sakura sử dụng hệ thống đ&aacute;nh lửa Magneto nhập khẩu Đ&agrave;i Loan c&oacute; tuổi thọ đạt 20.000 lần khởi động. Kh&ocirc;ng chỉ dễ sử dụng, bộ đ&aacute;nh lửa cơ n&agrave;y kh&ocirc;ng cần thay pin, kh&ocirc;ng lo d&acirc;y điện bị chuột cắn n&ecirc;n tuổi thọ cao, tiết kiệm chi ph&iacute; sửa chữa/thay thế.</p>

<p>&nbsp;</p>

<h3><strong>Si&ecirc;u bền, an to&agrave;n khi sử dụng</strong></h3>

<p>B&ecirc;n cạnh đ&oacute;, sản phẩm c&oacute; phần th&acirc;n bếp được k&iacute;nh cường lực kh&ocirc;ng lo han gỉ. Kết hợp với đầu đốt bằng đồng thau si&ecirc;u bền, ống điếu inox cao cấp v&agrave; cụm đ&aacute;nh lửa Đ&agrave;i Loan si&ecirc;u bền.</p>

<p>&nbsp;</p>

<h3><strong>C&ocirc;ng nghệ đầu đốt si&ecirc;u tiết kiệm gas</strong></h3>

<p><img alt="Đầu đốt bằng đồng thau của bếp gas Sakura SA-610G" src="https://ecom.viettechsmart.com:5020/Media/Images/0/dau-dot-bep-sakura-sa-610g.jpg.jpg" /></p>

<p>Bếp gas đ&ocirc;i Sakura SA-610G thiết kế đầu đốt bằng đồng thau gi&uacute;p bếp c&oacute; độ n&oacute;ng cao, đốt ch&aacute;y 100% lượng gas ti&ecirc;u thụ, cho bề mặt lửa phủ đều to&agrave;n bộ diện t&iacute;ch đ&aacute;y nồi giảm thời gian nấu ch&iacute;n thức ăn v&agrave; lượng gas ti&ecirc;u thụ.</p>
', 2, 12, 1, 1300000.0000, N'BEP GAS DUONG SAKURA SA-610G.png', 50, 2, CAST(N'2023-05-13T20:45:00.000' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (33, N'bep-hong-ngoai-nagakawa-nag-070733', N'BẾP HỒNG NGOẠI NAGAKAWA NAG-0707', N'Nagakawa', N'Thiết kế hiện đại, nhỏ gọn, mặt kính chịu nhiệt siêu bền, không kén nồi, nướng trực tiếp trên mặt bếp,....', N'<h2><strong>Thiết kế hiện đại, nhỏ gọn</strong></h2>

<p>Bếp hồng ngoại Nagakawa NAG0707 l&agrave; một trong những loại bếp hiệu quả nhất hiện nay.&nbsp;Bếp c&oacute; k&iacute;ch thước nhỏ gọn, mỏng nhẹ n&ecirc;n người d&ugrave;ng c&oacute; thể t&ugrave;y &yacute; đặt bếp ở nhiều vị tr&iacute; kh&aacute;c nhau v&agrave; cắm điện l&agrave; c&oacute; thể sử dụng ngay. NAG0707 sở hữu thiết kế hiện đại, đẹp mắt ph&ugrave; hợp với mọi kh&ocirc;ng gian.</p>

<p><img alt="Thiết kế hiện đại của bếp hồng ngoại đơn Nagakawa NAG0707" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-bep-hong-ngoai-nagakawa-nag0707.jpg" /></p>

<h2><strong>Mặt k&iacute;nh chịu nhiệt si&ecirc;u bền</strong></h2>

<p>Mặt bếp được l&agrave;m từ k&iacute;nh chịu nhiệt, chịu lực, chống va đập, hạn chế nứt vỡ, biến dạng, đảm bảo an to&agrave;n trong qu&aacute; tr&igrave;nh sử dụng. K&iacute;nh c&ograve;n c&oacute; &nbsp;khả năng chống trầy xước, chống b&aacute;m bẩn, dễ d&agrave;ng vệ sinh ngay cả những vết dầu mỡ cứng đầu, giữ bếp lu&ocirc;n s&aacute;ng b&oacute;ng, sạch sẽ.</p>

<p>&nbsp;</p>

<h2><strong>Kh&ocirc;ng k&eacute;n nồi, nướng trực tiếp tr&ecirc;n mặt bếp</strong></h2>

<p>Bếp hồng ngoại Nagakawa sinh nhiệt từ cuộn d&acirc;y b&ecirc;n trong, truyền qua mặt bếp l&agrave;m n&oacute;ng xoong nồi, thức ăn đặt tr&ecirc;n mặt bếp, nhờ đ&oacute;, bếp c&oacute; thể sử dụng mọi loại nồi để đun nấu, kh&ocirc;ng tốn chi ph&iacute; mua nồi từ đắt đỏ. B&ecirc;n cạnh đ&oacute;, bạn c&oacute; thể chế biến những m&oacute;n nướng thơm ngon, kh&ocirc;ng kh&oacute;i ngay tr&ecirc;n mặt bếp với vỉ nướng tặng k&egrave;m. Những m&oacute;n chi&ecirc;n r&aacute;n, ninh hầm tr&ecirc;n bếp hồng ngoại cũng sẽ ngon hơn, ch&iacute;n đều hơn nhờ khả năng gia nhiệt đều ở c&ocirc;ng suất nhỏ. C&ocirc;ng suất tối đa của bếp đạt 2000W, gi&uacute;p nấu ăn nhanh ch&oacute;ng, tiết kiệm thời gian đun nấu.</p>

<p>&nbsp;</p>

<h2><strong>Bảng điều khiển cảm ứng si&ecirc;u nhạy, dễ sử dụng</strong></h2>

<p>Bếp hồng ngoại Nagakawa NAG0707 trang bị bảng điều khiển cảm ứng nhạy b&eacute;n, thao t&aacute;c mượt m&agrave;, nhẹ nh&agrave;ng. C&aacute;c ph&iacute;m chức năng r&otilde; r&agrave;ng, dễ hiểu. M&agrave;n h&igrave;nh led hiển thị sắc n&eacute;t tiện lợi cho việc quan s&aacute;t v&agrave; điều chỉnh c&ocirc;ng suất, thời gian ch&iacute;nh x&aacute;c, tr&aacute;nh nhầm lẫn.</p>

<p><img alt="Bảng điều khiển chức năng của bếp Nagakawa NAG0707" src="https://ecom.viettechsmart.com:5020/Media/Images/0/chuc-nang-bep-hong-ngoai-nagakawa-nag0707.jpg" /></p>

<h2><strong>Chế độ nấu đa dạng</strong></h2>

<p>Nấu ăn tiện lợi c&ugrave;ng 5 chế độ nấu c&agrave;i đặt sẵn: lẩu, chi&ecirc;n x&agrave;o, nướng, s&uacute;p, đun nước. Thoải m&aacute;i chế biến c&aacute;c m&oacute;n ăn thơm ngon, đầy đủ dinh dưỡng với thao t&aacute;c đơn giản, nhanh ch&oacute;ng, kh&ocirc;ng mất thời gian căn chỉnh rắc rối.</p>

<p>&nbsp;</p>

<h2><strong>C&agrave;i đặt thời gian nấu chủ động, ch&iacute;nh x&aacute;c</strong></h2>

<p>Chế độ hẹn giờ tắt bếp gi&uacute;p bạn chủ động trong việc kiểm so&aacute;t thời gian nấu cho từng m&oacute;n, dễ d&agrave;ng c&agrave;i đặt thời gian nấu ch&iacute;nh x&aacute;c đến từng ph&uacute;t. Bạn c&oacute; thể thoải m&aacute;i l&agrave;m nhiều việc kh&aacute;c, kể cả đi ra ngo&agrave;i m&agrave; kh&ocirc;ng cần lo lắng thức ăn bị ch&aacute;y kh&eacute;t.</p>

<p>&nbsp;</p>

<h2><strong>Hệ thống tản nhiệt l&agrave;m m&aacute;t, tăng tuổi thọ cho bếp</strong></h2>

<p>Th&acirc;n bếp l&agrave;m bằng nhựa chịu nhiệt được bố tr&iacute; nhiều khe tho&aacute;t nhiệt kết hợp với quạt tản nhiệt gi&uacute;p l&agrave;m tăng hiệu quả tỏa nhiệt, hơi n&oacute;ng được đẩy ra ngo&agrave;i nhanh ch&oacute;ng, l&agrave;m m&aacute;t cho c&aacute;c linh kiện, đảm bảo cho bếp hoạt động ổn định, bền bỉ.</p>

<p>&nbsp;</p>

<p>Bếp hồng ngoại Nagakawa NAG0707 c&oacute; gi&aacute; b&aacute;n hợp l&yacute;, thiết kế nhỏ gọn, t&iacute;nh thẩm mỹ cao, khả năng nấu nướng linh hoạt, mang đến sự an to&agrave;n, tiện dụng ph&ugrave; hợp cho mọi gia đ&igrave;nh, đ&aacute;p ứng nhu cầu nấu ăn nhanh gọn hay c&aacute;c bữa lẩu nướng cho buổi tụ họp đ&ocirc;ng vui.</p>
', 4, 13, 1, 1350000.0000, N'BEP HONG NGOAI NAGAKAWA NAG-0707.png', 10, 20, CAST(N'2023-05-13T15:35:00.000' AS DateTime), 1, 6)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (34, N'1', N'BẾP DU LỊCH NAMILUX NA-1911PF', N'1', N'BẾP DU LỊCH', N'<p>BẾP DU LỊCH&nbsp;BẾP DU LỊCH&nbsp;BẾP DU LỊCH&nbsp;BẾP DU LỊCH&nbsp;BẾP DU LỊCH</p>
', 2, 5, 0, 285000.0000, N'Frame_Namilux-05.png', 100, 0, CAST(N'2024-07-24T15:40:35.000' AS DateTime), 1, NULL)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (35, N'GAS HP 45KG', N'GAS HP 45KG', N't', N'GAS 45KG', N'<h2><strong>Tại sao n&ecirc;n chọn b&igrave;nh gas HP 45kg?</strong></h2>

<p>C&ugrave;ng với Petrolimex,&nbsp;<a href="https://gas40.com/loai-san-pham/gas/thuong-hieu/petrovietnam" target="_blank">PetroVietnam</a>, Hanoi Petro (HP) l&agrave; một trong những thương hiệu gas c&oacute; thị phần lớn, được người d&ugrave;ng tại H&agrave; Nội v&agrave; c&aacute;c tỉnh miền Bắc tin d&ugrave;ng. Ngo&agrave;i c&aacute;c sản phẩm&nbsp;<a href="https://gas40.com/loai-san-pham/gas/binh-gas-12kg" target="_blank">gas 12kg</a>&nbsp;v&agrave; 6kg được người nội trợ tin d&ugrave;ng, sản phẩm b&igrave;nh gas 45kg của Hanoi Petro cũng được người d&ugrave;ng đ&aacute;nh gi&aacute; cao bởi:</p>

<p>&nbsp;</p>

<h3><strong>1. Hanoi Petro l&agrave; thương hiệu gas uy t&iacute;n</strong></h3>

<p>Hanoi Petro (HP) l&agrave; thương hiệu gas thuộc C&ocirc;ng ty Đầu tư Dầu Kh&iacute; H&agrave; Nội, một trong những doanh nghiệp sản xuất, kinh doanh kh&iacute; đốt l&acirc;u đời tại khu vực miền Bắc với hơn 16 năm kinh nghiệm trong ng&agrave;nh.</p>

<p><img alt="Hanoi Petro là thương hiệu gas uy tín" src="https://ecom.viettechsmart.com:5020/Media/Images/0/gas-ha-noi-petro-hp.jpg" />Hiện nay, Hanoi Petro l&agrave; một trong những doanh nghiệp đứng đầu trong lĩnh vực cung cấp kh&iacute; đốt (LPG) với nh&agrave; m&aacute;y sản xuất vỏ b&igrave;nh, 2 trạm chiết nạp c&oacute; c&ocirc;ng suất tồn trữ đến 650 tấn, mạng lưới b&aacute;n lẻ rộng khắp c&aacute;c tỉnh miền Bắc th&ocirc;ng qua c&aacute;c Đại l&yacute;, Tổng đại l&yacute;. Nhờ ch&uacute; trọng v&agrave;o chất lượng, hiệu quả v&agrave; độ an to&agrave;n, Hanoi Petro đ&atilde; tạo dựng được uy t&iacute;n, được c&aacute;c hộ gia đ&igrave;nh, qu&aacute;n ăn, nh&agrave; h&agrave;ng, cơ sở sản xuất - kinh doanh tin d&ugrave;ng.</p>

<p>&nbsp;</p>

<h3><strong>2. Chất lượng gas Hanoi Petro 45kg lu&ocirc;n được đảm bảo</strong></h3>

<p>Hanoi Petro hiện đang sở hữu nh&agrave; m&aacute;y chiết nạp đạt quy chuẩn Quốc gia trong ng&agrave;nh kh&iacute; dầu mỏ h&oacute;a lỏng. Nhi&ecirc;n liệu (LPG) được sử dụng để chiết nạp v&agrave;o b&igrave;nh gas c&ocirc;ng nghiệp HP 45kg đều được nhập từ c&aacute;c nh&agrave; cung cấp uy t&iacute;n trong nước v&agrave; thế giới, c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng. Do đ&oacute;, nước gas lu&ocirc;n được đảm bảo chất lượng với th&agrave;nh phần ch&iacute;nh chỉ bao gồm Butane, Propane v&agrave; chất tạo m&ugrave;i, kh&ocirc;ng pha trộn tạp chất như c&aacute;c cơ sở chiết nạp lậu.</p>

<p>B&ecirc;n cạnh đ&oacute;, nhờ ứng dụng d&acirc;y chuyển chiết nạp tự động h&oacute;a cao n&ecirc;n nước gas trong b&igrave;nh gas Hanoi Petro 45kg được đảm bảo c&acirc;n đủ kg với sai số nhỏ hơn &plusmn;0.2kg. Hai th&agrave;nh phần ch&iacute;nh trong nước gas l&agrave; Butan, Propan được chiết nạp theo tỷ lệ từ 30 &harr; 70%. Đ&acirc;y l&agrave; tỷ lệ chuẩn, ph&ugrave; hợp với điều kiện kh&iacute; hậu v&agrave; kết cấu bếp nấu tại Việt Nam, gi&uacute;p tối ưu hiệu suất ch&aacute;y, tiết kiệm gas.</p>

<p>Nhờ đ&oacute;, gas HP 45kg khi nấu cho ngọn lửa xanh, mạnh, kh&ocirc;ng c&oacute; m&ugrave;i h&ocirc;i kh&oacute; chịu, tiết kiệm nhi&ecirc;n liệu v&agrave; thời gian đun nấu, kh&ocirc;ng l&agrave;m đen nồi.&nbsp;</p>

<p>&nbsp;</p>

<h3><strong>1.3. B&igrave;nh gas Hanoi Petro 45kg c&oacute; độ an to&agrave;n cao</strong></h3>

<p>Để đảm bảo độ an to&agrave;n chống ch&aacute;y nổ, quy tr&igrave;nh sản xuất vỏ b&igrave;nh gas HP 45kg lu&ocirc;n tu&acirc;n thủ đầy đủ c&aacute;c ti&ecirc;u chuẩn TCVN 6292:1997 (Việt Nam) v&agrave; DOT 4BW-240 (Hoa Kỳ). Vật liệu th&eacute;p được sử dụng để chế tạo vỏ b&igrave;nh được nhập khẩu trực tiếp từ Nhật Bản, c&oacute; độ d&agrave;y đến 2,6 ly. Nhờ đ&oacute;, b&igrave;nh gas Hanoi Petro 45kg c&oacute; độ bền cao, chịu được &aacute;p lực lớn, đảm bảo an to&agrave;n chống ch&aacute;y nổ.</p>

<p><img alt="Bình gas Hanoi Petro 45kg công nghiệp" src="https://ecom.viettechsmart.com:5020/Media/Images/0/binh-gas-cong%20-nghiep-hp-30kg.jpg" /></p>

<p>Mỗi vỏ b&igrave;nh gas HP 30kg đều trải qua c&aacute;c bước kiểm tra, kiểm định khắt khe của c&aacute;c cơ quan c&oacute; thẩm quyền, đảm bảo đạt ti&ecirc;u chuẩn trước khi lưu h&agrave;nh tr&ecirc;n thị trường. Sau 5 năm, doanh nghiệp sẽ thu hồi vỏ b&igrave;nh để đ&aacute;nh gi&aacute; chất lượng, khắc phục điểm bất thường (nếu c&oacute;) v&agrave; đưa đi kiểm định lại trước khi tiếp tục lưu th&ocirc;ng để hạn chế sự c&oacute; c&oacute; thể xảy ra.</p>

<p>&nbsp;</p>

<h3><strong>1.4. Tem chống h&agrave;ng giả &amp;&nbsp;bảo hiểm ch&aacute;y nổ cho người d&ugrave;ng</strong></h3>

<p>Để hạn chế t&igrave;nh trạng chiếm dụng vỏ b&igrave;nh sang chiết tr&aacute;i ph&eacute;p gas HP 45kg giả, ngo&agrave;i c&aacute;c th&ocirc;ng tin được in nổi tr&ecirc;n vỏ b&igrave;nh khi sản xuất, Hanoi Petro c&ograve;n trang bị tem chống h&agrave;ng giả (Theo ti&ecirc;u chuẩn của Bộ C&ocirc;ng an), được d&aacute;n tr&ecirc;n van cổ b&igrave;nh gas.</p>

<p>Ngo&agrave;i ra, để đảm bảo quyền lợi, gi&uacute;p kh&aacute;ch h&agrave;ng y&ecirc;n t&acirc;m sử dụng gas, h&atilde;ng đ&atilde; mua bảo hiểm ch&aacute;y nổ cho người ti&ecirc;u d&ugrave;ng cho mỗi b&igrave;nh gas Hanoi Petro 45kg trước khi lưu h&agrave;nh ra thị trường. Nếu c&oacute; sự cố ch&aacute;y nổ xảy ra do lỗi b&igrave;nh gas, kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ đại l&yacute;/nh&agrave; sản xuất để được hướng dẫn thủ tục đền b&ugrave; thiệt hại do sự cố thỏa đ&aacute;ng.</p>
', 1, 4, 0, 285000.0000, N'GAS HP 45KG.png', 100, 0, CAST(N'2024-07-24T16:00:17.000' AS DateTime), 1, NULL)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (36, N'GAS HP 45KG', N'GAS HP 45KG 2', N'1', N'GAS 45KG', N'<p>adsasda ssa d&aacute; &acirc;sadsasdsad &aacute;d &aacute;d as d&aacute; d&aacute; đ&aacute; &aacute;d &aacute;</p>
', 1, 1, 0, 285000.0000, N'GAS HP 45KG.png', 100, 0, CAST(N'2024-07-26T19:37:30.000' AS DateTime), 1, NULL)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (37, N'bep-hong-ngoai-sunhouse-SHD6005', N'BẾP HỒNG NGOẠI SUNHOUSE SHD6005', N'Sunhouse', N'Bếp hồng ngoại đơn, cảm ứng - Màn hình LED', N'<p>Bếp hồng ngoại cảm ứng l&agrave; một bước tiến trong ng&agrave;nh thiết bị nh&agrave; bếp, bởi những c&ocirc;ng dụng tuyệt vời v&agrave; sự tiện lợi m&agrave; ch&uacute;ng mang lại cho người sử dụng. Bếp hồng ngoại hoạt động dựa v&agrave;o d&ograve;ng điện đốt n&oacute;ng c&aacute;c l&otilde;i điện b&ecirc;n trong (cuộn d&acirc;y điện trở) để tạo ra nhiệt rồi truyền đến mặt bếp, nhiệt l&agrave;m n&oacute;ng đ&aacute;y nồi v&agrave; nấu ch&iacute;n thức ăn. Nhờ thế, bếp hồng ngoại c&oacute; thể d&ugrave;ng được cho tất cả c&aacute;c loại nồi v&agrave; cũng c&oacute; thể d&ugrave;ng để nướng thức ăn được.</p>

<p>Bếp hồng ngoại đơn Sunhouse&nbsp;SHD6005 l&agrave; sự kết hợp từ chất liệu cao cấp v&agrave; c&ocirc;ng nghệ hiện đại, th&acirc;n thiện với người sử dụng sẽ l&agrave; lựa chọn ho&agrave;n hảo cho mọi căn bếp Việt.</p>

<blockquote>
<p><em><strong>Những ưu điểm nổi bật của bếp Sunhouse SHD6005:</strong></em></p>
</blockquote>

<h2><strong>Mặt k&iacute;nh si&ecirc;u bền, chịu nhiệt chịu lực tốt</strong></h2>

<p>Sunhouse SHD6005 sở hữu kiểu d&aacute;ng hiện đại với mặt bếp bằng k&iacute;nh cường lực si&ecirc;u bền,&nbsp;chịu lực, chịu nhiệt l&ecirc;n tới 600<sup>0</sup>C. Chất liệu k&iacute;nh cường s&aacute;ng b&oacute;ng, hạn chế trầy xước, dễ d&agrave;ng vệ sinh sau khi đun nấu.</p>

<p><img alt="Thiết kế bếp hồng ngoại đơn Sunhouse SHD6005" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-bep-hong-ngoai-sunhouse-shd6005.jpg" /></p>

<h2><strong>Dễ thao t&aacute;c với bảng điều khiển cảm ứng hiện đại</strong></h2>

<p>Bếp được trang bị bảng điều khiển cảm ứng hiện đại c&ugrave;ng m&agrave;n h&igrave;nh LED th&ocirc;ng minh hiển thị thời gian v&agrave; nhiệt độ gi&uacute;p người sử dụng thao t&aacute;c nhẹ nh&agrave;ng, ch&iacute;nh x&aacute;c.</p>

<p>Ph&iacute;m bấm bằng tiếng Việt gi&uacute;p người d&ugrave;ng dễ d&agrave;ng lựa chọn chức năng, th&ocirc;ng số kỹ thuật ph&ugrave; hợp với mục đ&iacute;ch chế biến, để m&oacute;n ăn được ch&iacute;n tới, vừa miệng m&agrave; kh&ocirc;ng đ&aacute;nh mất hương vị thơm ngon tự nhi&ecirc;n do nấu qu&aacute; nhiệt hay qu&aacute; l&acirc;u.</p>

<p>&nbsp;</p>

<h2><strong>Quạt gi&oacute; tăng tuổi thọ sản phẩm</strong></h2>

<p>Quạt gi&oacute; tốc độ cao được trang bị dưới mặt bếp gi&uacute;p tản nhiệt đều, hạ nhiệt nhanh nhưng kh&ocirc;ng tạt hơi n&oacute;ng v&agrave;o người sử dụng. Sản phẩm c&oacute; tuổi thọ cao, mặt k&iacute;nh bền, linh kiện bền&hellip; đều được quạt gi&oacute; g&oacute;p phần hỗ trợ.</p>

<p>&nbsp;</p>

<h2><strong>C&ocirc;ng suất lớn, 5 chế độ nấu linh hoạt</strong></h2>

<p>Bếp c&oacute; c&ocirc;ng suất 2000W cho khả năng nấu nhanh, gi&uacute;p tiết kiệm tối đa điện năng v&agrave; thời gian nấu nướng. Sản phẩm phục vụ 5 chức năng kh&aacute;c nhau: hầm xương, nấu s&uacute;p, nướng BBQ, r&aacute;n v&agrave; lẩu. Đặc biệt, chức năng nướng trực tiếp mang đến sự tiện lợi tối đa khi c&oacute; thể l&agrave;m ch&iacute;n mọi thực phẩm như thịt, c&aacute;, hải sản</p>

<p>&nbsp;</p>

<h2><strong>Chế độ hẹn giờ/c&agrave;i đặt trước tiện lợi</strong></h2>

<p>Bếp hồng ngoại SUNHOUSE SHD6005 c&oacute; chế độ hẹn giờ bật trước 24 giờ v&agrave; c&agrave;i đặt tắt trước 4 giờ gi&uacute;p người d&ugrave;ng tiết kiệm được thời gian tr&ocirc;ng coi.</p>

<p><img alt="Chức năng hẹn giờ của Sunhouse SHD6005" src="https://ecom.viettechsmart.com:5020/Media/Images/0/chuc-nang-bep-hong-ngoai-sunhouse-shd6005.jpg" /></p>

<h2><strong>An to&agrave;n trong qu&aacute; tr&igrave;nh sử dụng.</strong></h2>

<p>Bếp hồng ngoại SHD6005 trang bị kh&oacute;a trẻ em an to&agrave;n, hạn chế nguy cơ bị bỏng nhiệt. Đ&egrave;n b&aacute;o mặt bếp c&ograve;n n&oacute;ng tr&aacute;nh cho người d&ugrave;ng c&aacute;c nguy cơ bỏng do tiếp x&uacute;c với bề mặt bếp ngay sau khi nấu. Ngo&agrave;i ra, bếp sẽ tự động tắt nếu rơi v&agrave;o c&aacute;c trường hợp:</p>

<blockquote>
<p>- Nhiệt độ bề mặt bếp vượt qu&aacute; 650<sup>0</sup>C;</p>

<p>- Nhiệt độ b&ecirc;n trong bếp đạt 95<sup>0</sup>C;</p>

<p>- Khi điện &aacute;p vượt qu&aacute; 275V hoặc thấp hơn 95V.</p>
</blockquote>

<h2><strong>Kh&ocirc;ng bức xạ nhiệt</strong></h2>

<p>Sản phẩm l&agrave;m n&oacute;ng nhưng kh&ocirc;ng bức xạ nhiệt, bảo đảm an to&agrave;n về nhiệt v&agrave; điện cho người sử dụng.</p>

<p>&nbsp;</p>

<h2><strong>Sử dụng được cho tất cả c&aacute;c loại nồi</strong></h2>

<p>Bếp kh&ocirc;ng k&eacute;n chọn loại nồi chuy&ecirc;n dụng: nồi inox, nh&ocirc;m, sứ, thủy tinh&hellip; gi&uacute;p tận dụng tối đa c&aacute;c loại nồi sẵn c&oacute;, tiết kiệm tiền bạc v&agrave; kh&ocirc;ng gian lưu trữ cho nh&agrave; bếp.</p>
', 4, 14, 1, 1150000.0000, N'BEP HONG NGOAI SUNHOUSE SHD6005.png', 20, 0, CAST(N'2024-07-27T19:06:26.000' AS DateTime), 1, NULL)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (38, N'bep-tu-sunhouse-SHD6802', N'BẾP TỪ SUNHOUSE SHD6802', N'Sunhouse', N'Bếp từ đơn, kính ceramic cường lực, cảm ứng - Màn LED', N'<h2><strong>Thương hiệu Sunhouse</strong></h2>

<p>Sunhouse l&agrave; thương hiệu thuộc C&ocirc;ng ty CP Tập đo&agrave;n SUNHOUSE, doanh nghiệp li&ecirc;n doanh giữa C&ocirc;ng ty Sunhouse H&agrave;n Quốc với C&ocirc;ng ty TNHH Ph&uacute; Thắng (Việt Nam), được th&agrave;nh lập v&agrave;o năm 2005.</p>

<p>Sunhouse được xem như &ldquo;người ti&ecirc;n phong&rdquo; v&agrave; dẫn đầu ng&agrave;nh sản xuất đồ gia dụng tại Việt Nam. Trong những năm qua, Sunhouse từng bước khẳng định vị thế v&agrave; t&ecirc;n tuổi của m&igrave;nh kh&ocirc;ng chỉ tại thị trường trong nước m&agrave; c&ograve;n ở quốc tế nhờ v&agrave;o chất lượng sản phẩm, mẫu m&atilde; đẹp mắt v&agrave; kiểu d&aacute;ng tinh tế. Hiện nay, Sunhouse đ&atilde; c&oacute; mặt tr&ecirc;n to&agrave;n bộ hệ thống si&ecirc;u thị, trung t&acirc;m thương mại v&agrave; c&aacute;c cửa h&agrave;ng truyền thống với hơn 60,000 điểm b&aacute;n, sản xuất kinh doanh hơn 500 nh&oacute;m sản phẩm gia dụng, bao gồm: gia dụng điện, điện tử điện lạnh, thiết bị nh&agrave; bếp, đồ d&ugrave;ng nh&agrave; bếp,...</p>

<p>SHD6802 l&agrave; mẫu bếp từ đơn của Sunhouse, được người nội trợ Việt rất ưa chuộng nhờ sở hữu những ưu điểm nổi bật sau.</p>

<p>&nbsp;</p>

<h2><strong>Ưu điểm nổi bật của bếp từ đơn Sunhouse SHD6802&nbsp;&nbsp;</strong></h2>

<p>&nbsp;</p>

<blockquote>
<p><strong>Thiết kế nhỏ gọn, vững ch&atilde;i</strong></p>
</blockquote>

<p>Bếp từ đơn Sunhouse&nbsp;SHD6802 c&oacute; kiểu d&aacute;ng nhỏ gọn, m&agrave;u đen sang trọng k&egrave;m hoa văn tinh tế. Th&acirc;n bếp si&ecirc;u mỏng, dễ d&agrave;ng di chuyển, bếp c&oacute; thể sử dụng linh hoạt ở tr&ecirc;n b&agrave;n bếp, đặt tr&ecirc;n b&agrave;n ăn để ăn lẩu,&hellip;.v&agrave; nhiều vị tr&iacute; kh&aacute;c. Ch&acirc;n bếp c&oacute; bọc cao su chống trơn trượt, đảm bảo an to&agrave;n trong qu&aacute; tr&igrave;nh nấu nướng.</p>

<blockquote>
<p><strong>Mặt k&iacute;nh si&ecirc;u bền, chịu lực, chịu nhiệt</strong></p>
</blockquote>

<p>Mặt bếp Sunhouse SHD6802 phủ k&iacute;nh ceramic cường lực, dễ d&agrave;ng l&agrave;m sạch, chống trầy xước. Đặc biệt, mặt bếp c&oacute; khả năng chịu được nhiệt độ l&ecirc;n đến 760<sup>0</sup>C, chịu lực tốt, hạn chế nứt vỡ, gi&uacute;p bạn y&ecirc;n t&acirc;m nấu nướng.</p>

<blockquote>
<p><strong>Bảng điều khiển dễ sử dụng</strong></p>
</blockquote>

<p><img alt="Sunhouse SHD6802 trang bị bảng điều khiển cảm ứng siêu nhạy" src="https://ecom.viettechsmart.com:5020/Media/Images/0/bang-dieu-khien-bep-sunhouse-shd6802.jpg" /></p>

<p>Sunhouse SHD6802 c&oacute; bảng điều khiển cảm ứng, chỉ cần chạm nhẹ, bạn đ&atilde; c&oacute; thể dễ d&agrave;ng lựa chọn chế độ nấu v&agrave; lựa chọn nhiệt độ. M&agrave;n h&igrave;nh LED gi&uacute;p cho người sử dụng c&oacute; thể &nbsp;quan s&aacute;t một c&aacute;ch dễ d&agrave;ng mức nhiệt độ cũng như c&ocirc;ng suất của bếp, v&ocirc; c&ugrave;ng tiện lợi.</p>

<blockquote>
<p><strong>Tỏa nhiệt đều, nấu nướng nhanh</strong></p>
</blockquote>

<p>C&ocirc;ng nghệ nấu nướng bằng từ trường gi&uacute;p l&agrave;m n&oacute;ng trực tiếp đ&aacute;y nồi, nhiệt lượng tập trung v&agrave;o v&ugrave;ng cần nấu ch&iacute;n n&ecirc;n việc nấu nướng nhanh ch&oacute;ng, tiết kiệm điện hơn.</p>

<p>Đồng thời, nhờ nguy&ecirc;n l&iacute; nấu kh&ocirc;ng l&agrave;m n&oacute;ng mặt bếp n&ecirc;n sử dụng bếp từ đơn Sunhouse SHD6802 hạn chế l&agrave;m thất tho&aacute;t nhiệt ra m&ocirc;i trường xung quanh, gi&uacute;p căn bếp của gia đ&igrave;nh bạn bớt b&iacute; b&aacute;ch, n&oacute;ng nực.</p>

<blockquote>
<p><strong>8 chế độ nấu c&agrave;i đặt sẵn linh hoạt</strong></p>
</blockquote>

<p>Bếp c&oacute; đến 8 chế độ gồm: lẩu, x&agrave;o, s&uacute;p, ch&aacute;o, h&acirc;m sữa, hấp, giữ ấm v&agrave; nướng. T&ugrave;y v&agrave;o mục đ&iacute;ch sử dụng m&agrave; bạn sẽ nhanh ch&oacute;ng chọn được mức c&ocirc;ng suất ph&ugrave; hợp chỉ với một thao t&aacute;c v&agrave; kh&ocirc;ng phải mất qu&aacute; nhiều thời gian để điều chỉnh nhiệt độ khi nấu nướng. Ngo&agrave;i ra, bạn c&oacute; thể tự điều chỉnh nhiệt độ/c&ocirc;ng suất t&ugrave;y v&agrave;o nhu cầu sử dụng.</p>

<p><img alt="Nấu ăn dễ dàng với 8 chế độ nấu của bếp từ Sunhouse SHD6802" src="https://ecom.viettechsmart.com:5020/Media/Images/0/chuc-nang-bep-tu-don-sunhouse-shd6802.jpg" /></p>

<blockquote>
<p><strong>Chức năng hẹn giờ tiện lợi</strong></p>
</blockquote>

<p>Bếp từ đơn Sunhouse SHD6802 được t&iacute;ch hợp chức năng hẹn giờ gi&uacute;p bạn lựa chọn thời gian nấu nướng ph&ugrave; hợp với từng m&oacute;n ăn (từ 0 &ndash; 3 giờ). Bạn sẽ c&oacute; th&ecirc;m nhiều thời gian để tranh thủ chuẩn bị m&oacute;n ăn kh&aacute;c hoặc thực hiện c&ocirc;ng việc nội trợ, dọn dẹp nh&agrave; cửa.</p>

<p>Ngo&agrave;i ra, khi bạn tạm dừng kh&ocirc;ng sử dụng bếp trong thời gian ngắn m&agrave; kh&ocirc;ng muốn tắt/bật bếp để tr&aacute;nh hao ph&iacute; điện năng, bạn c&oacute; thể ấn n&uacute;t &ldquo;Tạm dừng&rdquo; tr&ecirc;n mặt bếp.</p>

<blockquote>
<p><strong>Kh&oacute;a trẻ em an to&agrave;n tuyệt đối</strong></p>
</blockquote>

<p>Sản phẩm c&oacute; kh&oacute;a trẻ em để hạn chế trẻ em thao t&aacute;c tr&ecirc;n bếp m&agrave; kh&ocirc;ng c&oacute; sự quản l&yacute; của người lớn, do đ&oacute; an to&agrave;n tuyệt đối với những gia đ&igrave;nh c&oacute; trẻ nhỏ.</p>

<blockquote>
<p><strong>Dễ d&agrave;ng theo d&otilde;i điện năng ti&ecirc;u thụ</strong></p>
</blockquote>

<p>Ấn ph&iacute;m &ldquo;Điện năng&rdquo; lần 1, bạn sẽ thấy mức ti&ecirc;u hao năng lượng tr&ecirc;n m&agrave;n h&igrave;nh LED. Ấn lần 2, hiệu điện thế sẽ hiển thị. Sau 5 gi&acirc;y, m&agrave;n h&igrave;nh sẽ tự động trở lại ban đầu.</p>

<blockquote>
<p><strong>Tự ngắt khi qu&aacute; tải nhiệt</strong></p>
</blockquote>

<p>Bếp trang bị thiết bị bảo vệ khi d&ograve;ng điện bị qu&aacute; tải. Khi nồi qu&aacute; n&oacute;ng, bếp sẽ tự động tắt, c&ograve;i b&aacute;o. Bạn chỉ cần chờ v&agrave;i ph&uacute;t để bếp nguội sau đ&oacute; bật bếp l&ecirc;n v&agrave; sử dụng b&igrave;nh thường.</p>
', 4, 14, 1, 1130000.0000, N'BEP TU SUNHOUSE SHD6802.png', 25, 0, CAST(N'2024-07-27T19:11:37.000' AS DateTime), 1, NULL)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (39, N'am-sieu-toc-nagakawa-NAG0304', N'ẤM SIÊU TỐC NAGAKAWA NAG0304', N'Nagakawa', N'Thiết kế hiện đại, tiện dụng, tự ngắt điện khi nước sôi', N'<h2><strong>Thiết kế hiện đại, tiện dụng</strong></h2>

<p>Nagakawa NAG0304 l&agrave; ấm đun nước si&ecirc;u tốc, gi&uacute;p bạn c&oacute; thể đun nước nhanh ch&oacute;ng để c&oacute; thể pha m&igrave; hay pha tr&agrave; tiện lợi. Ấm si&ecirc;u tốc c&ograve;n c&oacute; vỏ nhựa nguy&ecirc;n sinh cao cấp &nbsp;kh&ocirc;ng g&acirc;y độc hại cho người ti&ecirc;u d&ugrave;ng, kh&ocirc;ng l&agrave;m sản sinh chất độc hại v&agrave;o nước khi đun ở nhiệt độ cao, bền l&acirc;u khi sử dụng, nhờ đ&oacute; đảm bảo sức khỏe cho người d&ugrave;ng.</p>

<p><img alt="Thiết kế của ấm siêu tốc Nagakawa NAG0304" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-am-sieu-toc-nagakawa-nag0304.jpg" /></p>

<p>Đồng thời, việc vệ sinh b&igrave;nh đun cũng trở n&ecirc;n dễ d&agrave;ng v&agrave; nhanh ch&oacute;ng. Thiết kế ấm rất tiện lợi, n&uacute;t c&ocirc;ng tắc v&agrave; mở nắp ngay ph&iacute;a tr&ecirc;n rất tiện lợi để thao t&aacute;c sử dụng.</p>

<p>&nbsp;</p>

<h2><strong>Tự ngắt điện khi nước s&ocirc;i</strong></h2>

<p>Ấm si&ecirc;u tốc Nagakawa NAG0304 c&oacute; dung t&iacute;ch 1.7 l&iacute;t v&agrave; thiết kế với c&ocirc;ng suất l&ecirc;n đến 2200W đun s&ocirc;i nhanh v&agrave; hiệu quả, chỉ trong v&ograve;ng 3-5 ph&uacute;t, tiết kiệm thời gian v&agrave; điện năng ti&ecirc;u thụ tối đa cho người sử dụng. Sản phẩm l&agrave; lựa chọn ph&ugrave; hợp cho gia đ&igrave;nh từ 3 &ndash; 4 người.</p>

<p>Nagakawa NAG0304 l&agrave; b&igrave;nh đun nước si&ecirc;u tốc c&oacute; thể tự ngắt khi qu&aacute; nhiệt hay khi nước s&ocirc;i, để bạn kh&ocirc;ng cần phải kiểm so&aacute;t qu&aacute; tr&igrave;nh hoạt động đun s&ocirc;i đang diễn ra, vừa tiết kiệm thời gian, vừa tiện &iacute;ch cho người sử dụng v&agrave; đảm bảo an to&agrave;n, tăng tuổi thọ sản phẩm.</p>

<p><img alt="Nagakawa NAG0304 sở hữu nhiều tính năng tiện lợi" src="https://ecom.viettechsmart.com:5020/Media/Images/0/tinh-nang-tu-ngat-am-sieu-toc-nagakawa-nag0304.jpg" /></p>

<h2><strong>Đ&egrave;n b&aacute;o hiệu th&ocirc;ng minh</strong></h2>

<p>Ấm si&ecirc;u tốc Nagakawa NAG0304 c&oacute; đ&egrave;n b&aacute;o đỏ từ khi bắt đầu cho đến l&uacute;c kết th&uacute;c qu&aacute; tr&igrave;nh đun s&ocirc;i nước, gi&uacute;p bạn dễ d&agrave;ng nhận biết được nước đ&atilde; s&ocirc;i hay chưa m&agrave; kh&ocirc;ng cần mở nắp. Vạch đo mức nước trong suốt dễ d&agrave;ng quan s&aacute;t mức nước chuẩn b&ecirc;n trong ấm.</p>

<p>&nbsp;</p>

<h2><strong>Nhiều t&iacute;nh năng tiện &iacute;ch, dễ sử dụng</strong></h2>

<p>Ấm si&ecirc;u tốc Nagakawa NAG0304 c&oacute; thể dễ d&agrave;ng nhấc b&igrave;nh l&ecirc;n v&agrave; đặt ở mọi g&oacute;c nhờ ch&acirc;n đế thiết kế rời c&oacute; thể xoay 360 độ. Tay cầm bằng nhựa c&aacute;ch nhiệt an to&agrave;n v&agrave; chắc chắn, rất dễ d&agrave;ng cho việc di chuyển b&igrave;nh đun khi cần r&oacute;t nước.</p>
', 3, 13, 1, 290000.0000, N'AM SIEU TOC NAGAKAWA NAG0304.png', 50, 0, CAST(N'2024-07-27T19:15:32.000' AS DateTime), 1, NULL)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (40, N'am-sieu-toc-sunhouse-SHD1182', N'ẤM SIÊU TỐC SUNHOUSE SHD1182', N'Sunhouse', N'Thiết kế an toàn, tiện dụng, đun sôi nhanh và tiết kiệm điện năng, tự động tắt khi nước sôi hoặc cạn nước', N'<p>Ấm si&ecirc;u tốc l&agrave; thiết bị quen thuộc, đ&aacute;p ứng nhiều nhu cầu sử dụng. Với dung t&iacute;ch lớn l&ecirc;n đến 1.8L v&agrave; c&ocirc;ng suất 1500W, ấm si&ecirc;u tốc SUNHOUSE SHD1182 c&oacute; khả năng đun s&ocirc;i nhanh v&agrave; tiết kiệm điện tối đa, l&agrave; lựa chọn tối ưu cho gia đ&igrave;nh v&agrave; văn ph&ograve;ng nhỏ.</p>

<p>&nbsp;</p>

<h2><strong>Thiết kế an to&agrave;n, tiện dụng</strong></h2>

<p><img alt="Thiết kế của bình đun siêu tốc Sunhouse SHD1182" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-am-sieu-toc-sunhouse-shd1182.jpg" /></p>

<p>Th&acirc;n ấm si&ecirc;u tốc l&agrave;m bằng inox kh&ocirc;ng gỉ cao cấp, s&aacute;ng b&oacute;ng, kh&ocirc;ng xỉn m&agrave;u v&agrave; đặc biệt l&agrave; kh&ocirc;ng để lại cặn dưới đ&aacute;y ấm sau thời gian d&agrave;i sử dụng.</p>

<p>Ấm được thiết kế với d&aacute;ng đứng thon gọn, với tay cầm bằng nhựa cao cấp v&agrave; c&aacute;ch nhiệt tốt gi&uacute;p bạn y&ecirc;n t&acirc;m kh&ocirc;ng bị n&oacute;ng bỏng tay khi sử dụng ấm đang chứa nước s&ocirc;i.</p>

<p>Việc điều chỉnh chức năng của ấm cũng tiện lợi hơn với n&uacute;t ấn ở vị tr&iacute; thuận tiện ngay tr&ecirc;n tay cầm gi&uacute;p thao t&aacute;c đơn giản, nhanh gọn.</p>

<p>Đế tiếp điện được thiết kế độc lập, t&aacute;ch rời khỏi th&acirc;n ấm, gi&uacute;p việc đổ nước &ndash; tiếp nước dễ d&agrave;ng, linh hoạt. Ấm c&oacute; thể xoay 360 độ tr&ecirc;n đế tiếp điện, người d&ugrave;ng c&oacute; thể đặt ấm l&ecirc;n hay nhấc ấm ra khỏi đế ở bất cứ g&oacute;c n&agrave;o m&agrave; kh&ocirc;ng phải lo lắng đến vấn đề phải đặt sao cho khớp.</p>

<p>&nbsp;</p>

<h2><strong>Đun s&ocirc;i nhanh &amp; Tiết kiệm điện năng</strong></h2>

<p>C&ocirc;ng suất mạnh 1500W cho thời gian nấu nước nhanh ch&oacute;ng, chỉ trong 4 &ndash; 6 ph&uacute;t l&agrave; bạn đ&atilde; c&oacute; nước s&ocirc;i để pha ch&egrave;, caf&eacute;, nấu m&igrave;&hellip; hay để nguội. Việc đun s&ocirc;i nhanh cũng gi&uacute;p tiết kiệm thời gian v&agrave; điện năng tối đa.</p>

<p>&nbsp;</p>

<h2><strong>Chế độ tự động tắt khi nước s&ocirc;i hoặc cạn nước</strong></h2>

<p><img alt="Cảm biến tự ngắt của ấm siêu tốc Sunhouse SHD1182" src="https://ecom.viettechsmart.com:5020/Media/Images/0/chuc-nang-binh-sieu-toc-sunhouse-shd1182.jpg" /></p>

<p>Ấm c&oacute; chế độ ngắt tự động khi nước s&ocirc;i hoặc cạn nước, đảm bảo an to&agrave;n tối đa cho người sử dụng (qu&ecirc;n/bận rộn c&ocirc;ng việc kh&aacute;c). Chức năng n&agrave;y c&ograve;n gi&uacute;p l&agrave;m tăng tuổi thọ sản phẩm v&agrave; ph&ograve;ng chống ch&aacute;y nổ.</p>
', 3, 14, 1, 205000.0000, N'AM SIEU TOC SUNHOUSE SHD1182.png', 20, 0, CAST(N'2024-07-27T19:18:25.000' AS DateTime), 1, NULL)
INSERT [dbo].[Product] ([productID], [code], [name], [keywords], [shortDescription], [description], [categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy], [limit]) VALUES (41, N'bo-noi-anod-sunhouse-SH8833QT', N'BỘ NỒI ANOD SUNHOUSE SH8833QT', N'Sunhouse', N'Kiểu dáng hiện đại, kết cấu bền chắc', N'<p>C&ocirc;ng nghệ ANODIZED (điện ph&acirc;n c&aacute;c anod) &nbsp;l&agrave; qu&aacute; tr&igrave;nh l&agrave;m oxy h&oacute;a bề mặt của những tấm nh&ocirc;m tạo th&agrave;nh một lớp vỏ bọc cứng thay cho lớp nh&ocirc;m th&ocirc;ng thường - kết quả cho ra một li&ecirc;n kết nh&ocirc;m cực mạnh gọi l&agrave; nh&ocirc;m Anod. Nh&ocirc;m Anod c&oacute; thể cứng gần bằng kim cương v&agrave; được ứng dụng rất nhiều trong ng&agrave;nh c&ocirc;ng nghiệp sản xuất &ocirc; t&ocirc;, m&aacute;y bay, vi t&iacute;nh&hellip;</p>

<p>Ứng dụng c&ocirc;ng nghệ đ&oacute; &ndash; SUNHOUSE cho ra đời bộ nồi Anod với độ bền cứng l&acirc;u d&agrave;i c&ugrave;ng thiết kế tinh tế, sang trọng, l&agrave; sự lựa chọn tối ưu cho mọi căn bếp gia đ&igrave;nh.</p>

<p><em><strong>Sản phẩm sở hữu nhiều ưu điểm nổi bật như:</strong></em></p>

<p>&nbsp;</p>

<h2><strong>Kiểu d&aacute;ng hiện đại, kết cấu bền chắc</strong></h2>

<p>Bộ nồi Sunhouse SH8833QT&nbsp;được l&agrave;m từ hợp kim nh&ocirc;m Anod cứng bằng c&ocirc;ng nghệ ti&ecirc;n tiến gi&uacute;p sản phẩm c&oacute; độ cứng v&agrave; bền vững cao, chống ăn m&ograve;n, chịu được nhiệt độ cao cũng như khả năng chống d&iacute;nh tốt. Vỏ ngo&agrave;i trắng bạc sang trọng, chịu nhiệt tốt, kh&ocirc;ng biến m&agrave;u theo thời gian.</p>

<p><img alt="Sunhouse SH8833QT sở hữu thiết kế hiện đại, chắc chắn" src="https://ecom.viettechsmart.com:5020/Media/Images/0/thiet-ke-noi-anod-sunhouse-sh8833qt.jpg" /></p>

<p>Vung nồi được l&agrave;m từ k&iacute;nh cường lực chịu nhiệt hai lớp d&agrave;y 5mm, bề mặt k&iacute;nh trong suốt thuận tiện cho việc đun nấu, cũng như quan s&aacute;t thực phẩm m&agrave; kh&ocirc;ng cần mở v&ugrave;ng nhiều lần. Viền bo bằng inox gi&uacute;p vung nồi k&iacute;n kh&iacute;t, hạn chế nứt vỡ nếu bị va chạm.</p>

<p>Quai n&uacute;m bằng nhựa bắt v&iacute;t, chống n&oacute;ng tốt. Quai đinh t&aacute;n, bọc nhựa c&aacute;ch nhiệt gi&uacute;p cho người d&ugrave;ng dễ d&agrave;ng nhấc nồi l&ecirc;n ngay cả &nbsp;khi đang được đun n&oacute;ng, thuận tiện hơn trong việc đun nấu.</p>

<p>&nbsp;</p>

<h2><strong>C&ocirc;ng năng tuyệt vời&nbsp;gi&uacute;p việc nấu ăn trở n&ecirc;n đơn giản</strong></h2>

<p>Bộ nồi Sunhouse SH8833QT c&oacute; độ bền cứng rất cao v&agrave; khả năng chống m&agrave;i m&ograve;n tối ưu, hạn chế trầy xước. Sản phẩm c&oacute; thể d&ugrave;ng cho nhiều mục đ&iacute;ch chế biến v&agrave; kh&ocirc;ng bị biến dạng nếu gặp t&aacute;c động lực.</p>

<p>Đ&aacute;y nồi phẳng rộng, hấp thụ nhiệt tốt, truyền nhiệt đều, nấu ch&iacute;n thức ăn nhanh hơn c&aacute;c loại nồi th&ocirc;ng thường.</p>

<p>Nồi Anod đ&atilde; được xử l&yacute; oxy h&oacute;a n&ecirc;n tuyệt đối kh&ocirc;ng c&oacute; t&igrave;nh trạng th&ocirc;i nhiễm v&agrave;o thức ăn, an to&agrave;n cho sức khỏe. Nồi c&ograve;n gi&uacute;p giữ được hương vị tươi ngon của thức ăn trong thời gian tương đối.</p>

<p><img alt="Bộ nồi Sunhouse SH8833 phù hợp nhu cầu của gia đình nhỏ" src="https://ecom.viettechsmart.com:5020/Media/Images/0/bo-noi-sunhouse-sh8833qt-anod.jpg" /></p>

<p>Bộ gồm 3 nồi Anod với những k&iacute;ch cỡ phổ biến 16cm &ndash; 22cm &ndash; 26cm, đ&aacute;p ứng nhiều mục đ&iacute;ch sử dụng kh&aacute;c nhau trong gia đ&igrave;nh (nồi nhỏ 16cm th&iacute;ch hợp để luộc trứng, kho thịt, nồi cỡ trung 22cm để nấu canh cho 3-5 người v&agrave; nồi lớn 26cm c&oacute; thể luộc g&agrave;, nấu canh hoặc lẩu cho 3-5 người).</p>

<p>Sản phẩm l&agrave;m bằng chất liệu nh&ocirc;m n&ecirc;n chỉ d&ugrave;ng được tr&ecirc;n bếp gas, bếp hồng ngoại, kh&ocirc;ng d&ugrave;ng tr&ecirc;n bếp từ.</p>
', 3, 14, 1, 770000.0000, N'BO NOI ANOD SUNHOUSE SH8833QT.png', 20, 0, CAST(N'2024-07-27T19:20:37.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImg] ON 

INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (25, 13, N'images/product_detail/13_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (26, 13, N'images/product_detail/13_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (27, 14, N'images/product_detail/14_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (28, 14, N'images/product_detail/14_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (29, 15, N'images/product_detail/15_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (30, 15, N'images/product_detail/15_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (31, 16, N'images/product_detail/16_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (32, 16, N'images/product_detail/16_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (33, 17, N'images/product_detail/17_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (34, 17, N'images/product_detail/17_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (35, 18, N'images/product_detail/18_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (36, 18, N'images/product_detail/18_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (37, 19, N'images/product_detail/19_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (38, 19, N'images/product_detail/19_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (39, 20, N'images/product_detail/20_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (40, 20, N'images/product_detail/20_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (41, 21, N'images/product_detail/21_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (42, 21, N'images/product_detail/21_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (43, 22, N'images/product_detail/22_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (44, 22, N'images/product_detail/22_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (45, 23, N'images/product_detail/23_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (46, 23, N'images/product_detail/23_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (47, 24, N'images/product_detail/24_1.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (48, 24, N'images/product_detail/24_2.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (68, 34, N'Frame_Namilux-05.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (69, 35, N'GAS HP 45KG.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (70, 36, N'GAS HP 45KG.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (71, 1, N'GAS HP 6KG.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (72, 2, N'GAS HP 12KG VAN NGANG.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (73, 3, N'GAS HP 12KG VAN CHUP 20.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (74, 4, N'GAS HP 12KG VAN CHUP 16.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (75, 5, N'GAS PETROVIETNAM 12KG VAN NGANG.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (76, 6, N'GAS PETROLIMEX 12KG VAN NGANG.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (77, 8, N'GAS SIAM 12KG VAN CHUP.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (78, 7, N'GAS PETROLIMEX 12KG VAN CHUP.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (79, 9, N'GAS SIAM 12KG VAN NGANG.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (80, 10, N'GAS HP 30KG.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (81, 11, N'GAS HP 45KG.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (82, 12, N'GAS PETROVIETNAM 45KG.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (85, 26, N'cau-tao-bep-gas-doi-paloma-pa-6pej.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (86, 26, N'kieu-dang-bep-paloma-pa-6pej.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (87, 25, N'tinh-nang-bep-gas-doi-paloma-pa-71eb.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (88, 25, N'thiet-ke-bep-paloma-pa-71eb.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (89, 27, N'thiet-ke-bep-gas-am-rinnai-rvb-6sdqb.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (90, 27, N'dau-dot-kin-bep-rinnai-rvb-6sdqb.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (91, 28, N'thiet-ke-bep-gas-doi-rinnai-rv-715slim.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (92, 28, N'dau-dot-bep-rinnai-rv-615slim.jpg.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (93, 29, N'thiet-ke-bep-gas-doi-rinnai-rv-460s.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (94, 29, N'dau-dot-bep-gas-rinnai-rv-460s.jpg.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (95, 30, N'thiet-ke-bep-rinnai-r-2ken.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (96, 30, N'dau-dot-bep-rinnai-r-2ken.jpg.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (97, 33, N'thiet-ke-bep-hong-ngoai-nagakawa-nag0707.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (98, 33, N'chuc-nang-bep-hong-ngoai-nagakawa-nag0707.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (99, 31, N'tinh-nang-bep-gas-mini-namilux-na-1911pf.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (100, 32, N'thiet-ke-bep-sakura-sa-610g.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (101, 32, N'dau-dot-bep-sakura-sa-610g.jpg.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (103, 37, N'thiet-ke-bep-hong-ngoai-sunhouse-shd6005.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (104, 37, N'chuc-nang-bep-hong-ngoai-sunhouse-shd6005.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (106, 38, N'bang-dieu-khien-bep-sunhouse-shd6802.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (107, 38, N'chuc-nang-bep-tu-don-sunhouse-shd6802.jpg')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (108, 39, N'AM SIEU TOC NAGAKAWA NAG0304.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (109, 40, N'AM SIEU TOC SUNHOUSE SHD1182.png')
INSERT [dbo].[ProductImg] ([imgID], [productID], [Path]) VALUES (110, 41, N'BO NOI ANOD SUNHOUSE SH8833QT.png')
SET IDENTITY_INSERT [dbo].[ProductImg] OFF
GO
SET IDENTITY_INSERT [dbo].[ReceiverType] ON 

INSERT [dbo].[ReceiverType] ([ReceiverTypeId], [name]) VALUES (1, N'Shipper')
INSERT [dbo].[ReceiverType] ([ReceiverTypeId], [name]) VALUES (2, N'Supplier')
SET IDENTITY_INSERT [dbo].[ReceiverType] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleID], [code], [name], [description]) VALUES (1, N'Admin', N'Administrator', N'Manager webapp')
INSERT [dbo].[Role] ([roleID], [code], [name], [description]) VALUES (2, N'Staff', N'Staff', N'Website employee')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[SerialNumbers] ON 

INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (1, 1, N'SN0001')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (2, 1, N'SN0002')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (3, 1, N'SN0003')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (4, 1, N'SN0004')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (5, 1, N'SN0005')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (6, 1, N'SN0006')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (7, 1, N'SN0007')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (8, 1, N'SN0008')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (9, 1, N'SN0009')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (10, 1, N'SN0010')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (11, 2, N'SN0011')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (12, 2, N'SN0012')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (13, 2, N'SN0013')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (14, 2, N'SN0014')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (15, 2, N'SN0015')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (16, 2, N'SN0016')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (17, 2, N'SN0017')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (18, 2, N'SN0018')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (19, 2, N'SN0019')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (20, 2, N'SN0020')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (21, 3, N'SN0021')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (22, 3, N'SN0022')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (23, 3, N'SN0023')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (24, 3, N'SN0024')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (25, 3, N'SN0025')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (26, 3, N'SN0026')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (27, 3, N'SN0027')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (28, 3, N'SN0028')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (29, 3, N'SN0029')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (30, 3, N'SN0030')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (31, 4, N'SN0031')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (32, 4, N'SN0032')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (33, 4, N'SN0033')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (34, 4, N'SN0034')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (35, 4, N'SN0035')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (36, 4, N'SN0036')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (37, 4, N'SN0037')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (38, 4, N'SN0038')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (39, 4, N'SN0039')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (40, 4, N'SN0040')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (41, 5, N'SN0041')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (42, 5, N'SN0042')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (43, 5, N'SN0043')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (44, 5, N'SN0044')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (45, 5, N'SN0045')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (46, 5, N'SN0046')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (47, 5, N'SN0047')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (48, 5, N'SN0048')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (49, 5, N'SN0049')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (50, 5, N'SN0050')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (51, 6, N'SN0051')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (52, 6, N'SN0052')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (53, 6, N'SN0053')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (54, 6, N'SN0054')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (55, 6, N'SN0055')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (56, 6, N'SN0056')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (57, 6, N'SN0057')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (58, 6, N'SN0058')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (59, 6, N'SN0059')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (60, 6, N'SN0060')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (61, 7, N'SN0061')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (62, 7, N'SN0062')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (63, 7, N'SN0063')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (64, 7, N'SN0064')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (65, 7, N'SN0065')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (66, 7, N'SN0066')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (67, 7, N'SN0067')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (68, 7, N'SN0068')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (69, 7, N'SN0069')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (70, 7, N'SN0070')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (71, 8, N'SN0071')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (72, 8, N'SN0072')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (73, 8, N'SN0073')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (74, 8, N'SN0074')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (75, 8, N'SN0075')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (76, 8, N'SN0076')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (77, 8, N'SN0077')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (78, 8, N'SN0078')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (79, 8, N'SN0079')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (80, 8, N'SN0080')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (81, 9, N'SN0081')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (82, 9, N'SN0082')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (83, 9, N'SN0083')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (84, 9, N'SN0084')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (85, 9, N'SN0085')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (86, 9, N'SN0086')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (87, 9, N'SN0087')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (88, 9, N'SN0088')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (89, 9, N'SN0089')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (90, 9, N'SN0090')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (91, 10, N'SN0091')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (92, 10, N'SN0092')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (93, 10, N'SN0093')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (94, 10, N'SN0094')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (95, 10, N'SN0095')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (96, 10, N'SN0096')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (97, 10, N'SN0097')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (98, 10, N'SN0098')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (99, 10, N'SN0099')
GO
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (100, 10, N'SN0100')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (101, 11, N'SN0101')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (102, 11, N'SN0102')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (103, 11, N'SN0103')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (104, 11, N'SN0104')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (105, 11, N'SN0105')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (106, 11, N'SN0106')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (107, 11, N'SN0107')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (108, 11, N'SN0108')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (109, 11, N'SN0109')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (110, 11, N'SN0110')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (111, 12, N'SN0111')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (112, 12, N'SN0112')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (113, 12, N'SN0113')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (114, 12, N'SN0114')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (115, 12, N'SN0115')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (116, 12, N'SN0116')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (117, 12, N'SN0117')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (118, 12, N'SN0118')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (119, 12, N'SN0119')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (120, 12, N'SN0120')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (121, 13, N'SN0121')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (122, 13, N'SN0122')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (123, 13, N'SN0123')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (124, 13, N'SN0124')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (125, 13, N'SN0125')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (126, 13, N'SN0126')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (127, 13, N'SN0127')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (128, 13, N'SN0128')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (129, 13, N'SN0129')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (130, 13, N'SN0130')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (131, 14, N'SN0131')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (132, 14, N'SN0132')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (133, 14, N'SN0133')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (134, 14, N'SN0134')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (135, 14, N'SN0135')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (136, 14, N'SN0136')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (137, 14, N'SN0137')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (138, 14, N'SN0138')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (139, 14, N'SN0139')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (140, 14, N'SN0140')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (141, 15, N'SN0141')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (142, 15, N'SN0142')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (143, 15, N'SN0143')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (144, 15, N'SN0144')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (145, 15, N'SN0145')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (146, 15, N'SN0146')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (147, 15, N'SN0147')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (148, 15, N'SN0148')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (149, 15, N'SN0149')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (150, 15, N'SN0150')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (151, 16, N'SN0151')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (152, 16, N'SN0152')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (153, 16, N'SN0153')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (154, 16, N'SN0154')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (155, 16, N'SN0155')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (156, 16, N'SN0156')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (157, 16, N'SN0157')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (158, 16, N'SN0158')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (159, 16, N'SN0159')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (160, 16, N'SN0160')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (161, 17, N'SN0161')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (162, 17, N'SN0162')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (163, 17, N'SN0163')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (164, 17, N'SN0164')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (165, 17, N'SN0165')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (166, 17, N'SN0166')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (167, 17, N'SN0167')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (168, 17, N'SN0168')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (169, 17, N'SN0169')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (170, 17, N'SN0170')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (171, 18, N'SN0171')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (172, 18, N'SN0172')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (173, 18, N'SN0173')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (174, 18, N'SN0174')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (175, 18, N'SN0175')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (176, 18, N'SN0176')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (177, 18, N'SN0177')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (178, 18, N'SN0178')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (179, 18, N'SN0179')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (180, 18, N'SN0180')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (181, 19, N'SN0181')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (182, 19, N'SN0182')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (183, 19, N'SN0183')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (184, 19, N'SN0184')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (185, 19, N'SN0185')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (186, 19, N'SN0186')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (187, 19, N'SN0187')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (188, 19, N'SN0188')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (189, 19, N'SN0189')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (190, 19, N'SN0190')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (191, 20, N'SN0191')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (192, 20, N'SN0192')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (193, 20, N'SN0193')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (194, 20, N'SN0194')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (195, 20, N'SN0195')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (196, 20, N'SN0196')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (197, 20, N'SN0197')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (198, 20, N'SN0198')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (199, 20, N'SN0199')
GO
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (200, 20, N'SN0200')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (201, 21, N'SN0201')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (202, 21, N'SN0202')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (203, 21, N'SN0203')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (204, 21, N'SN0204')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (205, 21, N'SN0205')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (206, 21, N'SN0206')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (207, 21, N'SN0207')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (208, 21, N'SN0208')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (209, 21, N'SN0209')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (210, 21, N'SN0210')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (211, 22, N'SN0211')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (212, 22, N'SN0212')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (213, 22, N'SN0213')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (214, 22, N'SN0214')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (215, 22, N'SN0215')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (216, 22, N'SN0216')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (217, 22, N'SN0217')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (218, 22, N'SN0218')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (219, 22, N'SN0219')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (220, 22, N'SN0220')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (221, 23, N'SN0221')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (222, 23, N'SN0222')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (223, 23, N'SN0223')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (224, 23, N'SN0224')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (225, 23, N'SN0225')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (226, 23, N'SN0226')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (227, 23, N'SN0227')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (228, 23, N'SN0228')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (229, 23, N'SN0229')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (230, 23, N'SN0230')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (231, 24, N'SN0231')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (232, 24, N'SN0232')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (233, 24, N'SN0233')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (234, 24, N'SN0234')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (235, 24, N'SN0235')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (236, 24, N'SN0236')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (237, 24, N'SN0237')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (238, 24, N'SN0238')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (239, 24, N'SN0239')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (240, 24, N'SN0240')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (241, 25, N'SN0241')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (242, 25, N'SN0242')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (243, 25, N'SN0243')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (244, 25, N'SN0244')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (245, 25, N'SN0245')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (246, 25, N'SN0246')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (247, 25, N'SN0247')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (248, 25, N'SN0248')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (249, 25, N'SN0249')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (250, 25, N'SN0250')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (251, 26, N'SN0251')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (252, 26, N'SN0252')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (253, 26, N'SN0253')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (254, 26, N'SN0254')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (255, 26, N'SN0255')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (256, 26, N'SN0256')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (257, 26, N'SN0257')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (258, 26, N'SN0258')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (259, 26, N'SN0259')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (260, 26, N'SN0260')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (261, 27, N'SN0261')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (262, 27, N'SN0262')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (263, 27, N'SN0263')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (264, 27, N'SN0264')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (265, 27, N'SN0265')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (266, 27, N'SN0266')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (267, 27, N'SN0267')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (268, 27, N'SN0268')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (269, 27, N'SN0269')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (270, 27, N'SN0270')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (271, 28, N'SN0271')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (272, 28, N'SN0272')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (273, 28, N'SN0273')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (274, 28, N'SN0274')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (275, 28, N'SN0275')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (276, 28, N'SN0276')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (277, 28, N'SN0277')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (278, 28, N'SN0278')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (279, 28, N'SN0279')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (280, 28, N'SN0280')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (281, 29, N'SN0281')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (282, 29, N'SN0282')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (283, 29, N'SN0283')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (284, 29, N'SN0284')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (285, 29, N'SN0285')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (286, 29, N'SN0286')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (287, 29, N'SN0287')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (288, 29, N'SN0288')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (289, 29, N'SN0289')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (290, 29, N'SN0290')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (291, 30, N'SN0291')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (292, 30, N'SN0292')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (293, 30, N'SN0293')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (294, 30, N'SN0294')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (295, 30, N'SN0295')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (296, 30, N'SN0296')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (297, 30, N'SN0297')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (298, 30, N'SN0298')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (299, 30, N'SN0299')
GO
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (300, 30, N'SN0300')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (301, 31, N'SN0301')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (302, 31, N'SN0302')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (303, 31, N'SN0303')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (304, 31, N'SN0304')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (305, 31, N'SN0305')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (306, 31, N'SN0306')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (307, 31, N'SN0307')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (308, 31, N'SN0308')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (309, 31, N'SN0309')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (310, 31, N'SN0310')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (311, 32, N'SN0311')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (312, 32, N'SN0312')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (313, 32, N'SN0313')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (314, 32, N'SN0314')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (315, 32, N'SN0315')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (316, 32, N'SN0316')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (317, 32, N'SN0317')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (318, 32, N'SN0318')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (319, 32, N'SN0319')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (320, 32, N'SN0320')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (321, 33, N'SN0321')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (322, 33, N'SN0322')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (323, 33, N'SN0323')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (324, 33, N'SN0324')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (325, 33, N'SN0325')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (326, 33, N'SN0326')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (327, 33, N'SN0327')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (328, 33, N'SN0328')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (329, 33, N'SN0329')
INSERT [dbo].[SerialNumbers] ([SerialID], [ProductID], [SerialNumber]) VALUES (330, 33, N'SN0330')
SET IDENTITY_INSERT [dbo].[SerialNumbers] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipments] ON 

INSERT [dbo].[Shipments] ([shipmentID], [companyName], [email], [phone], [status], [createdDate]) VALUES (1, N'J&T Express', N'JTExpress@gmail.com', N'1900 1088', 1, CAST(N'2024-07-14T10:47:28.173' AS DateTime))
INSERT [dbo].[Shipments] ([shipmentID], [companyName], [email], [phone], [status], [createdDate]) VALUES (2, N'NINJA VAN', N'NINJAVAN@gmail.com', N'1900 886 877', 1, CAST(N'2024-07-14T10:47:28.173' AS DateTime))
INSERT [dbo].[Shipments] ([shipmentID], [companyName], [email], [phone], [status], [createdDate]) VALUES (3, N'Ahamove', N'Ahamove@gmail.com', N'1900 545411', 1, CAST(N'2024-07-14T10:47:28.177' AS DateTime))
INSERT [dbo].[Shipments] ([shipmentID], [companyName], [email], [phone], [status], [createdDate]) VALUES (4, N'Ship60', N'Ship60@gmail.com', N'1900 6362090', 1, CAST(N'2024-07-14T10:47:28.177' AS DateTime))
INSERT [dbo].[Shipments] ([shipmentID], [companyName], [email], [phone], [status], [createdDate]) VALUES (5, N'GHN Express', N'GHNExpress@gmail.com', N'1900 636677', 1, CAST(N'2024-07-14T10:47:28.177' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shipments] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (1, N'PV GAS', 1, CAST(N'2024-07-14T10:47:28.180' AS DateTime), N'pvgas@pvgas.com.vn', N'+84 28 3781 6777', N'https://www.pvgas.com.vn', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (2, N'Gas Gia Đình', 1, CAST(N'2024-07-14T10:47:28.180' AS DateTime), N'gasgiadinh.vn@gmail.com', N'(028) 37.155.166', N'http://gasgiadinh.vn', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (3, N'VT Gas', 1, CAST(N'2024-07-14T10:47:28.180' AS DateTime), N' info@vt-gas.com.vn', N'061. 383 1988', N'http://www.vtgas.com.vn/', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (4, N'NaMilux', 1, CAST(N'2024-07-14T10:47:28.187' AS DateTime), N'info@namilux.com', N'0389764184', N'https://namilux.com/vi/home', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (5, N'Rinnai', 1, CAST(N'2024-07-14T10:47:28.187' AS DateTime), N'info@rinnaivietnamofficial@gmail.com', N'(028) 6292 8184', N'https://rinnai.com.vn', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (6, N'Windo', 1, CAST(N'2024-07-14T10:47:28.187' AS DateTime), N'windothienthanh@gmail.com', N'0908492923', N'https://windo.vn', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (7, N'Hanoi Petro - HP', 1, CAST(N'2024-07-27T18:14:20.000' AS DateTime), N'admin@hanoipetro.com', N'1800 1772', N'https://www.hanoipetro.com', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (8, N'Petrolimex', 1, CAST(N'2024-07-27T18:14:20.000' AS DateTime), N'dvkh@petrolimex.com.vn', N'19002828', N'https://www.petrolimex.com.vn', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (9, N'Siamgas', 1, CAST(N'2024-07-27T18:14:20.000' AS DateTime), N'', N'0987702339', N'https://siamgas.com.vn', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (10, N'PetroVietnam', 1, CAST(N'2024-07-27T18:14:20.000' AS DateTime), N'', N'', N'https://www.pvn.vn/Pages/default.aspx', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (11, N'PALOMA', 1, CAST(N'2024-07-27T18:14:20.000' AS DateTime), N'tuan.voquoc@palomavietnam.com', N'1900 55 55 94', N'https://palomavietnam.com', N'+wHu5XwLRYxRgmDhl6i1kJiEgb4=')
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (12, N'SAKURA', NULL, NULL, N'sakurasupport@sakura-vn.vn', N'(84-28) 3848 7258', N'https://www.sakura-vn.vn', NULL)
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (13, N'NAGAKAWA', NULL, NULL, N'nagakawavietnam2014@gmail.com', N'0927 948 688', N'https://nagakawa.com.vn', NULL)
INSERT [dbo].[Supplier] ([supplierId], [companyName], [status], [createdDate], [email], [phone], [homePage], [password]) VALUES (14, N'SUNHOUSE', NULL, NULL, N'info@sunhouse.com.vn', N'1800 6680', N'www.sunhouse.com.vn', NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Warranties] ON 

INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (1, 31, CAST(N'2024-07-15T00:00:00.000' AS DateTime), NULL, NULL, 2, NULL, N'no-binh-gas-2.jpg,sky.jpg,sky2.jpg', N'Nổ rồi', N'unaccept', NULL)
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (2, 41, CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), 2, 1, N'no-binh-gas-2.jpg,sky.jpg,sky2.jpg', N'Bình nổ', N'done', CAST(N'2024-07-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (3, 41, CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), 2, 1, N'IoT-la-gi.jpg,mas.jpg,no-binh-gas-2.jpg,sky.jpg', N'ok', N'done', CAST(N'2024-07-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (4, 281, CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), 2, 1, N'no-binh-gas-2.jpg,sky.jpg', N'Van gas không ổn định', N'done', CAST(N'2024-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (5, 161, CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), 2, 1, N'no-binh-gas-2.jpg,sky.jpg,sky2.jpg', N'Bình Gas nổ', N'done', CAST(N'2024-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (6, 291, CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), 2, 1, N'no-binh-gas-2.jpg', N'Nổ đùng đoàng', N'done', CAST(N'2024-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (7, 111, CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), 2, 1, N'dream.jpg', N'Không lên gas', N'done', CAST(N'2024-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (8, 282, CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), 2, 1, N'IoT-la-gi.jpg', N'Lựu đạn nè né đi', N'done', CAST(N'2024-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (9, 81, CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-17T00:00:00.000' AS DateTime), 2, 1, N'no-binh-gas-2.jpg', N'Nổ rồi các cháu ơi nổ rồi', N'done', CAST(N'2024-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (10, 42, CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-17T00:00:00.000' AS DateTime), 2, 1, N'no-binh-gas-2.jpg', N'Nổ nổ nổ', N'done', CAST(N'2024-07-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (11, 301, CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), 2, 1, N'no-binh-gas-2.jpg', N'Nổ rồi', N'done', CAST(N'2024-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (12, 251, CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), 2, 1, N'no-binh-gas-2.jpg', N'Nổ bình gas', N'done', CAST(N'2024-07-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Warranties] ([WarrantyID], [SerialID], [CreateDate], [ReciverDate], [DoneDate], [CustomerID], [Process_By], [ProofImg], [Notes], [Status], [expectedDate]) VALUES (13, 241, CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), 2, 1, N'no-binh-gas-2.jpg,sky.jpg', N'Nổ gas', N'done', CAST(N'2024-07-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Warranties] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_CouponCode]    Script Date: 27/07/2024 19:53:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_CouponCode] ON [dbo].[Discount]
(
	[discountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_SerialNumber]    Script Date: 27/07/2024 19:53:07 ******/
ALTER TABLE [dbo].[SerialNumbers] ADD  CONSTRAINT [UQ_SerialNumber] UNIQUE NONCLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0)) FOR [totalPoint]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [memberShipTier]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [FK_Administrator_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [FK_Administrator_Role]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([memberShipTier])
REFERENCES [dbo].[MembershipTier] ([TierId])
GO
ALTER TABLE [dbo].[DiscountUsage]  WITH CHECK ADD FOREIGN KEY([discountID])
REFERENCES [dbo].[Discount] ([discountID])
GO
ALTER TABLE [dbo].[DiscountUsage]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[FeedbackReply]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Administrator] ([administratorID])
GO
ALTER TABLE [dbo].[FeedbackReply]  WITH CHECK ADD FOREIGN KEY([feedback_id])
REFERENCES [dbo].[Feedback] ([FeedbackID])
GO
ALTER TABLE [dbo].[NotificationReceiver]  WITH CHECK ADD FOREIGN KEY([notiID])
REFERENCES [dbo].[Notification] ([notiID])
GO
ALTER TABLE [dbo].[NotificationReceiver]  WITH CHECK ADD FOREIGN KEY([receiverType])
REFERENCES [dbo].[ReceiverType] ([ReceiverTypeId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipments] FOREIGN KEY([shipVia])
REFERENCES [dbo].[Shipments] ([shipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shipments]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_SerialNumbers] FOREIGN KEY([serialID])
REFERENCES [dbo].[SerialNumbers] ([SerialID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_SerialNumbers]
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderHistory_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderHistory] CHECK CONSTRAINT [FK_OrderHistory_Orders]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Admin] FOREIGN KEY([administratorID])
REFERENCES [dbo].[Administrator] ([administratorID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Admin]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_PostCategory] FOREIGN KEY([PostCategoryID])
REFERENCES [dbo].[PostCategory] ([PostCategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_PostCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Administrator] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Administrator] ([administratorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Administrator]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([supplierId])
REFERENCES [dbo].[Supplier] ([supplierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[ProductImg]  WITH CHECK ADD  CONSTRAINT [FK_ProductImg_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImg] CHECK CONSTRAINT [FK_ProductImg_Product]
GO
ALTER TABLE [dbo].[SerialNumbers]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Warranties]  WITH CHECK ADD  CONSTRAINT [FK_Warranties_Administrator] FOREIGN KEY([Process_By])
REFERENCES [dbo].[Administrator] ([administratorID])
GO
ALTER TABLE [dbo].[Warranties] CHECK CONSTRAINT [FK_Warranties_Administrator]
GO
ALTER TABLE [dbo].[Warranties]  WITH CHECK ADD  CONSTRAINT [FK_Warranties_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Warranties] CHECK CONSTRAINT [FK_Warranties_Customers]
GO
ALTER TABLE [dbo].[Warranties]  WITH CHECK ADD  CONSTRAINT [FK_Warranties_SerialNumbers] FOREIGN KEY([SerialID])
REFERENCES [dbo].[SerialNumbers] ([SerialID])
GO
ALTER TABLE [dbo].[Warranties] CHECK CONSTRAINT [FK_Warranties_SerialNumbers]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD CHECK  (([DiscountType]='FIXED' OR [DiscountType]='PERCENT'))
GO
USE [master]
GO
ALTER DATABASE [Gas_Management_Final] SET  READ_WRITE 
GO
