create database [Gas_Management]
Use Gas_Management

CREATE TABLE [dbo].[Administrator](
		[administratorID] [int] IDENTITY(1,1) NOT NULL,
		[userName] [varchar](100) NOT NULL,
		[password] [varchar](100) NOT NULL,
		[lastLogin] [datetime] NULL,
		[isActive] [bit] NOT NULL,
		[roleID] [int] NOT NULL,
		[email] [varchar](100) NULL,
		[img] [varbinary](max) NULL,
	 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
	(
		[administratorID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[Category](
		[categoryID] [int] IDENTITY(1,1) NOT NULL,
		[code] [nvarchar](MAX) NOT NULL,
		[name] [nvarchar](MAX) NULL,
		[description] [ntext] NULL,
	 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
	(
		[categoryID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[Customer](
		[customerID] [int] IDENTITY(1,1) NOT NULL,
		[userName] [varchar](100) NULL,
		[password] [varchar](100) NULL,
		[created] [datetime] NULL,
		[lastLogin] [datetime] NULL,
		[status] [bit] NULL,
		[gender] [bit] NULL,
		[image] [nvarchar](max) NULL,
		[firstName] [nvarchar](MAX) NULL,
		[lastName] [nvarchar](MAX) NULL,
		[address] [nvarchar](MAX) NULL,
		[phone] [varchar](100) NULL,
		[email] [varchar](100) NULL,
		[totalMoney] [money] NULL,
		[isCustomer] [bit] NULL,
	 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
	(
		[customerID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE Discount (
    discountID INT IDENTITY(1,1) PRIMARY KEY,
    discountCode VARCHAR(255) NOT NULL,
    [name] NVARCHAR(max),
    discountAmount DECIMAL(10,2) NOT NULL,
    discountType VARCHAR(10) CHECK (DiscountType IN ('PERCENT', 'FIXED')), 
    startDate DATE,
    endDate DATE,
	quantity int
);
CREATE UNIQUE INDEX idx_CouponCode ON Discount(discountCode);

CREATE TABLE [dbo].[Order](
		[orderID] [int] IDENTITY(1,1) NOT NULL,
		[customerID] [int] NULL,
		[trackingNumber] [int],
		[totalMoney] [money] NULL,
		[orderDate] [datetime] NOT NULL,
		[shippedDate] [datetime] NULL,
		[requiredDate] [datetime] NOT NULL,
		[shipAddress] [nvarchar](200) NOT NULL,
		[status] [int] NULL,
		process INT NULL,
		[shipVia] [int] NULL,
		payment nvarchar,
		[notes] [ntext] NULL,
	 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
	(
		[orderID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

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

CREATE TABLE [dbo].[OrderDetails](
		[orderID] [int] NOT NULL,
		[productID] [int] NOT NULL,
		[quantity] [int] NULL,
		[unitPrice] [money] NULL, 
	 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
	(
		[orderID] ASC,
		[productID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

CREATE TABLE DiscountUsage (
    usageID INT IDENTITY(1,1) PRIMARY KEY,
    discountID INT,
    useDate DATE,
    orderID INT,  
    FOREIGN KEY (discountID) REFERENCES Discount(DiscountID),
    FOREIGN KEY (orderID) REFERENCES [Order](orderID)  
);

CREATE TABLE [dbo].[Product](
		[productID] [int] IDENTITY(1,1) NOT NULL,
		[code] [varchar](MAX) NOT NULL,
		[name] [nvarchar](MAX) NULL,
		[keywords] [nvarchar](MAX) NULL,
		[shortDescription] [nvarchar](MAX) NULL,
		[description] [ntext] NULL,
		[categoryID] [int] NULL,
		[supplierId] [int] NULL,
		[isActive] [bit] NOT NULL,
		[unitPrice] [money] NULL,
		[image] varchar(max) NULL,
		[stockQuantity] [int] NULL,
		[unitOnOrders] [int] NULL,
		[createdDate] [datetime] NOT NULL,
		[createdBy] [int] NULL,
	 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
	(
		[productID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[Role](
		[roleID] [int] IDENTITY(1,1) NOT NULL,
		[code] [varchar](100) NULL,
		[name] [nvarchar](MAX) NULL,
		[description] [ntext] NULL,
	 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
	(
		[roleID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

CREATE TABLE [dbo].[Shipments](
		[shipmentID] [int] IDENTITY(1,1) NOT NULL,
		[companyName] [nvarchar](MAX) NULL,
		[email] [nvarchar](100) NULL,
		[phone] [nvarchar](20) NULL,
		[status] [bit] NULL,
		[createdDate] [datetime] NULL,
	 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
	(
		[shipmentID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

CREATE TABLE [dbo].[Supplier](
		[supplierId] [int] IDENTITY(1,1) NOT NULL,
		[companyName] [nvarchar](MAX) NULL,
		status [bit] NULL,
		[createdDate] [datetime] NULL,
		[email] [varchar](100) NULL,
		[phone] [varchar](20) NULL,
		[homePage] [varchar](200) NULL,
	 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
	(
		[supplierId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

CREATE TABLE SerialNumbers (
    SerialID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    SerialNumber VARCHAR(255) NOT NULL,
    CONSTRAINT UQ_SerialNumber UNIQUE (SerialNumber),  -- Enforce unique Serial Numbers
    FOREIGN KEY (ProductID) REFERENCES Product(productID)
);

CREATE TABLE Warranties (
    WarrantyID INT IDENTITY(1,1) PRIMARY KEY,
    SerialID INT,
    WarrantyStartDate DATETIME,
    WarrantyEndDate DATETIME,
    WarrantyTerms VARCHAR(MAX), 
	supplierID int REFERENCES Supplier(supplierID),
	customerID int REFERENCES Customer(customerID) on delete cascade,
	BarCode nvarchar(max) NULL, 
	ProofImg  nvarchar(max) NULL, 
	Notes nvarchar(max) NULL,
    FOREIGN KEY (SerialID) REFERENCES SerialNumbers(SerialID) on delete cascade
);

CREATE TABLE [dbo].[ProductImg](
	[imgID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[Path] [nvarchar](max) NULL,
 CONSTRAINT [PK__ProductImg] PRIMARY KEY CLUSTERED 
(
	[imgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(50),
    PaymentDate DATETIME,
    FOREIGN KEY (OrderID) REFERENCES [Order](orderID) 
);

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
	[updatedBy] INT NULL,
 CONSTRAINT [PK__Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[PostCategory](
	[PostCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](2550) NOT NULL,
 CONSTRAINT [PK__PostCategory] PRIMARY KEY CLUSTERED 
(
	[PostCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [FK_Administrator_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID]) on delete cascade

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID]) on delete cascade
--
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipments] FOREIGN KEY([shipVia])
REFERENCES [dbo].[Shipments] ([shipmentID]) on delete cascade

ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID]) on delete cascade

ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID]) on delete cascade

ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryID]) 
REFERENCES [dbo].[Category] ([categoryID]) on delete cascade

ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([supplierId])
REFERENCES [dbo].[Supplier] ([supplierId]) on delete cascade

ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Administrator] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Administrator] ([administratorID]) on delete cascade

ALTER TABLE [dbo].[ProductImg]
ADD CONSTRAINT FK_ProductImg_Product
FOREIGN KEY ([productID]) REFERENCES [dbo].[Product]([productID]) on delete cascade;

ALTER TABLE [dbo].[Post]
ADD CONSTRAINT [FK_Post_PostCategory] FOREIGN KEY ([PostCategoryID])
REFERENCES [dbo].[PostCategory] ([PostCategoryID])  on delete cascade;

ALTER TABLE [dbo].[Post]
ADD CONSTRAINT [FK_Post_Admin] FOREIGN KEY ([administratorID])
REFERENCES [dbo].[Administrator] ([administratorID]);  

ALTER TABLE [dbo].[Order]
DROP COLUMN process

ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderHistory_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])

INSERT INTO dbo.Role(code, name, description) VALUES('Admin', N'Administrator', N'Manager webapp')
INSERT INTO dbo.Role(code, name, description) VALUES('Staff', N'Staff', N'Website employee')

INSERT [dbo].[Customer] ([userName], [password], [created], [lastLogin], [status], [gender], [image], [firstName], [lastName], [address], [phone], [email], [totalMoney], [isCustomer]) VALUES (N'duc', N'Qua3CCUdJoXNHnIq6rQW/tVqu1M=', NULL, NULL, 1, NULL, NULL, N'huy', N'nguyen', NULL, N'0377043909', N'test@gmail.com', NULL, 1)

INSERT INTO dbo.Shipments(CompanyName, Phone, Email, Status, createdDate) VALUES(N'J&T Express', N'1900 1088', N'JTExpress@gmail.com',1, GETDATE())
INSERT INTO dbo.Shipments(CompanyName, Phone, Email, Status, createdDate) VALUES(N'NINJA VAN', N'1900 886 877', N'NINJAVAN@gmail.com',1, GETDATE())
INSERT INTO dbo.Shipments(CompanyName, Phone, Email, Status, createdDate) VALUES(N'Ahamove', N'1900 545411', N'Ahamove@gmail.com', 1, GETDATE())
INSERT INTO dbo.Shipments(CompanyName, Phone, Email, Status, createdDate) VALUES(N'Ship60', N'1900 6362090', N'Ship60@gmail.com', 1, GETDATE())
INSERT INTO dbo.Shipments(CompanyName, Phone, Email, Status, createdDate) VALUES(N'GHN Express', N'1900 636677', N'GHNExpress@gmail.com', 1, GETDATE())

INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate],[email],[phone],[homePage])VALUES(N'PV GAS',1,CURRENT_TIMESTAMP,'pvgas@pvgas.com.vn','+84 28 3781 6777','https://www.pvgas.com.vn')
INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate],[email],[phone],[homePage])VALUES(N'Gas Gia Đình',1,CURRENT_TIMESTAMP,'gasgiadinh.vn@gmail.com','(028) 37.155.166','http://gasgiadinh.vn')
INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate],[email],[phone],[homePage])VALUES(N'VT Gas',1,CURRENT_TIMESTAMP,' info@vt-gas.com.vn','061. 383 1988','http://www.vtgas.com.vn/')
INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate],[email],[phone],[homePage])VALUES('NaMilux',1,CURRENT_TIMESTAMP,'info@namilux.com','0389764184','https://namilux.com/vi/home')
INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate], [email],[phone],[homePage])VALUES('Rinnai',1,CURRENT_TIMESTAMP,'info@rinnaivietnamofficial@gmail.com','(028) 6292 8184','https://rinnai.com.vn')
INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate],[email],[phone],[homePage])VALUES('Windo',1,CURRENT_TIMESTAMP,'windothienthanh@gmail.com','0908492923','https://windo.vn')

INSERT INTO [dbo].[Category]([code],[name], [description])VALUES('binh-gas-1',N'Bình gas',N'Bình gas là một thiết bị chứa gas được chế tạo từ vật liệu thép chuyên dụng để bảo quản và giữ an toàn khi lưu trữ, vận chuyển và sử dụng gas.')
INSERT INTO [dbo].[Category]([code],[name],[description])VALUES('bep-gas-2',N'Bếp gas',N'Bếp gas là một loại bếp sử dụng nhiên liệu là khí gas (khí thiên nhiên) để nấu ăn')
INSERT INTO [dbo].[Category]([code],[name],[description])VALUES('phu-kien-3',N'Phụ kiện',N'Phụ kiện là những bộ phận phụ trợ cho bếp ga và bình ga')

INSERT INTO dbo.Administrator(userName, password, lastLogin, isActive, roleID, email)
VALUES('admin', '123456', GETDATE(), 1, 1, 'haquocminhduc@gmail.com')

INSERT [dbo].[Product] ( [code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], image,[stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'gas-gia-dinh-mau-xam-1', N'Gas gia đình màu xám', N'bình gas;gia đình;xám',
N'Bình gas 12kg.', N'Bình gas chính hãng của Công ty MTV Khi đốt Gia đình (Thuộc Tập đoàn Alphapetrol ):Sản phẩm bình gas có mua Bảo hiểm cháy nổ theo quy định Nhà nước.:Vỏ bình gas sản xuất theo tiêu chuẩn DOT-4BA-240, DOT-4BW-240 và TCVN 6292-1997.:Được bán lẻ và giao hàng bởi Gas Bình Minh , Nam gas , Gas Hướng dương , Gas 40:Để cập nhật giá bán theo thời điểm hiện tại, vui lòng liên hệ Hệ thống Chi nhánh gần nhất.:Quý khách hàng có nhu cầu sử dụng với số lượng nhiều (từ 4 - 5 bình gas /tháng trở lên), vui lòng liên hệ để có Chính sách giá bán tốt nhất!:Gas Gia Đình là hệ thống cửa hàng Gas chất lượng, chuyên nghiệp đã được người tiêu dùng tin tưởng trong suốt thời gian qua, chúng tôi cung cấp đủ các thương hiệu bình gas uy tín như Gas Vimexco, Gas Petro Việt Nam, Gas Gia Đình, Gas Petrolimex…đảm bảo chất lượng kiểm định cho khách hàng lựa chọn. Khi chọn mua bình gas tại hệ thống Gas Gia Đình, quý khách còn được nhận hỗ trợ các chính sách hậu mãi, ưu đãi, chăm sóc khách hàng tốt nhất bởi Gas Bình Minh , Nam gas , Gas Hướng dương , Gas 40, đảm bảo sự hài lòng cho quý khách.',
1, 2, 1, 490000, 'images/products/1/df.jpg',203, 22, GETDATE(), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
( N'binh-gas-12-kg-2', N'Bình gas 12 Kg', N'bình gas;gas;12;12kg',
N'Đại diện phân phối các loại sản phẩm bình gas petro Vietnam Gas giá thành tố nhất tại việt nam', N'Bình gas dân dụng:Nhãn hiệu : Petro Vietnam Gas::Dung tích : 12 Lít:Loại bình  : Sắt',
1, 1, 1, 475000, 'images/products/2/df.jpg', 322, 45, GETDATE(), 1)




INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'binh-gas-gia-dinh-mau-vang--3', N'Bình gas gia đình màu vàng', N'bình gas;gia đình;vàng;12kg;12',
N'Bình gas 12kg.', N'Bình gas chính hãng của Công ty MTV Khi đốt Gia đình (Thuộc Tập đoàn Alphapetrol ):Sản phẩm bình gas có mua Bảo hiểm cháy nổ theo quy định Nhà nước.:Vỏ bình gas sản xuất theo tiêu chuẩn DOT-4BA-240, DOT-4BW-240 và TCVN 6292-1997.:Được bán lẻ và giao hàng bởi Gas Bình Minh , Nam gas , Gas Hướng dương , Gas 40:Để cập nhật giá bán theo thời điểm hiện tại, vui lòng liên hệ Hệ thống Chi nhánh gần nhất.:Quý khách hàng có nhu cầu sử dụng với số lượng nhiều (từ 4 - 5 bình gas /tháng trở lên), vui lòng liên hệ để có Chính sách giá bán tốt nhất!:Gas Gia Đình là hệ thống cửa hàng Gas chất lượng, chuyên nghiệp đã được người tiêu dùng tin tưởng trong suốt thời gian qua, chúng tôi cung cấp đủ các thương hiệu bình gas uy tín như Gas Vimexco, Gas Petro Việt Nam, Gas Gia Đình, Gas Petrolimex…đảm bảo chất lượng kiểm định cho khách hàng lựa chọn. Khi chọn mua bình gas tại hệ thống Gas Gia Đình, quý khách còn được nhận hỗ trợ các chính sách hậu mãi, ưu đãi, chăm sóc khách hàng tốt nhất bởi Gas Bình Minh , Nam gas , Gas Hướng dương , Gas 40, đảm bảo sự hài lòng cho quý khách.',
1, 2, 1, 495000, 'images/products/3/df.jpg', 311, 24, GETDATE(), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'binh-gas-gia-dinh-mau-do-4', N'Bình gas gia đình màu đỏ', N'bình gas;gia đình;đỏ;12kg;12',
N'Bình gas 12kg.', N'Bình gas chính hãng của Công ty MTV Khi đốt Gia đình (Thuộc Tập đoàn Alphapetrol ):Sản phẩm bình gas có mua Bảo hiểm cháy nổ theo quy định Nhà nước.:Vỏ bình gas sản xuất theo tiêu chuẩn DOT-4BA-240, DOT-4BW-240 và TCVN 6292-1997.:Được bán lẻ và giao hàng bởi Gas Bình Minh , Nam gas , Gas Hướng dương , Gas 40:Để cập nhật giá bán theo thời điểm hiện tại, vui lòng liên hệ Hệ thống Chi nhánh gần nhất.:Quý khách hàng có nhu cầu sử dụng với số lượng nhiều (từ 4 - 5 bình gas /tháng trở lên), vui lòng liên hệ để có Chính sách giá bán tốt nhất!:Gas Gia Đình là hệ thống cửa hàng Gas chất lượng, chuyên nghiệp đã được người tiêu dùng tin tưởng trong suốt thời gian qua, chúng tôi cung cấp đủ các thương hiệu bình gas uy tín như Gas Vimexco, Gas Petro Việt Nam, Gas Gia Đình, Gas Petrolimex…đảm bảo chất lượng kiểm định cho khách hàng lựa chọn. Khi chọn mua bình gas tại hệ thống Gas Gia Đình, quý khách còn được nhận hỗ trợ các chính sách hậu mãi, ưu đãi, chăm sóc khách hàng tốt nhất bởi Gas Bình Minh , Nam gas , Gas Hướng dương , Gas 40, đảm bảo sự hài lòng cho quý khách.',
1, 2, 1, 495000, 'images/products/4/df.jpg', 311, 24, GETDATE(), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'binh-gas-gia-dinh-mau-xanh-vt-5', N'Bình gas gia đình màu xanh VT', N'bình gas;gia đình;xanh;12kg;12',
N'Bình gas 12kg.', N'Bình gas chính hãng của Công ty MTV Khi đốt Gia đình (Thuộc Tập đoàn Alphapetrol ):Sản phẩm bình gas có mua Bảo hiểm cháy nổ theo quy định Nhà nước.:Vỏ bình gas sản xuất theo tiêu chuẩn DOT-4BA-240, DOT-4BW-240 và TCVN 6292-1997.:Được bán lẻ và giao hàng bởi Gas Bình Minh , Nam gas , Gas Hướng dương , Gas 40:Để cập nhật giá bán theo thời điểm hiện tại, vui lòng liên hệ Hệ thống Chi nhánh gần nhất.:Quý khách hàng có nhu cầu sử dụng với số lượng nhiều (từ 4 - 5 bình gas /tháng trở lên), vui lòng liên hệ để có Chính sách giá bán tốt nhất!:Gas Gia Đình là hệ thống cửa hàng Gas chất lượng, chuyên nghiệp đã được người tiêu dùng tin tưởng trong suốt thời gian qua, chúng tôi cung cấp đủ các thương hiệu bình gas uy tín như Gas Vimexco, Gas Petro Việt Nam, Gas Gia Đình, Gas Petrolimex…đảm bảo chất lượng kiểm định cho khách hàng lựa chọn. Khi chọn mua bình gas tại hệ thống Gas Gia Đình, quý khách còn được nhận hỗ trợ các chính sách hậu mãi, ưu đãi, chăm sóc khách hàng tốt nhất bởi Gas Bình Minh , Nam gas , Gas Hướng dương , Gas 40, đảm bảo sự hài lòng cho quý khách.',
1, 2, 1, 495000, 'images/products/5/df.jpg', 311, 24, GETDATE(), 1)


INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'binh-gas-gia-dinh-45-kg-6', N'Bình gas gia đình 45Kg', N'bình gas;gia đình;45kg;45',
N'Bình gas 45Kg.', N'Bình gas chính hãng của Công ty MTV Khi đốt Gia đình (Thuộc Tập đoàn Alphapetrol ):Sản phẩm bình gas có mua Bảo hiểm cháy nổ theo quy định Nhà nước.:Vỏ bình gas sản xuất theo tiêu chuẩn DOT-4BA-240, DOT-4BW-240 và TCVN 6292-1997.:Được bán lẻ và giao hàng bởi Gas Bình Minh , Nam gas , Gas Hướng dương , Gas 40:Để cập nhật giá bán theo thời điểm hiện tại, vui lòng liên hệ Hệ thống Chi nhánh gần nhất.:Quý khách hàng có nhu cầu sử dụng với số lượng nhiều (từ 4 - 5 bình gas /tháng trở lên), vui lòng liên hệ để có Chính sách giá bán tốt nhất!:Gas Gia Đình là hệ thống cửa hàng Gas chất lượng, chuyên nghiệp đã được người tiêu dùng tin tưởng trong suốt thời gian qua, chúng tôi cung cấp đủ các thương hiệu bình gas uy tín như Gas Vimexco, Gas Petro Việt Nam, Gas Gia Đình, Gas Petrolimex…đảm bảo chất lượng kiểm định cho khách hàng lựa chọn. Khi chọn mua bình gas tại hệ thống Gas Gia Đình, quý khách còn được nhận hỗ trợ các chính sách hậu mãi, ưu đãi, chăm sóc khách hàng tốt nhất bởi Gas Bình Minh , Nam gas , Gas Hướng dương , Gas 40, đảm bảo sự hài lòng cho quý khách.',
1, 2, 1, 560000, 'images/products/6/df.jpg', 524, 13, GETDATE(), 1)



INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'binh-do-van-pol-7', N'Bình đỏ - Van POL', N'bình;bình gas;đỏ;POL',
N'Bình gas màu đỏ van POL', N'1.	Tiêu chuẩn	DOT 4BA-240:2.	Dung tích nước	26.2 ~ 26.5 lít (±0.2):3.	Dung lượng chứa LPG	12 kg:4.	Tiêu chuẩn thép	JIS G 3116 SG 255:5.	Đường kính ngoài của bình	300mm (±2):6.	Chiều cao tổng thể của bình	560mm (±5):7.	Áp suất thử thủy tĩnh	34 Kg/cm2:8.	Van	POL V4E hiệu SCG',
1, 3, 1, 500000, 'images/products/7/df.jpg', 432, 75, GETDATE(), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'binh-12-kg-van-compact-8', N'Bình 12kg van Compact', N'bình;bình gas;compact',
N'Bình gas van thuộc loại nhỏ gọn', N' 1.	 Tiêu chuẩn	 DOT 4BA-240:2.	 Dung tích nước	 26.4 lít (±0.2):3.	 Dung lượng chứa LPG	 12 kg:4.	 Tiêu chuẩn thép	 JIS G 3116 SG 255:5.	 Đường kính ngoài của bình	 300mm (±1):6.	 Chiều cao tổng thể của bình 	 585mm (±3):7.	 Áp suất thử thủy tĩnh	 34 Kg/cm2:8.	 Van	COMPACT',
1, 3, 1, 520000, 'images/products/8/df.jpg', 313, 55, CAST(N'2020-01-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'binh-xam-ban-pol-9', N'Bình xám - Van POL', N'bình;bình gas;xám;POL',
N'Bình gas àu xám van POL', N' 1.	 Tiêu chuẩn	 DOT 4BA-240:2.	 Dung tích nước	 26.4 lít (±0.2):3.	 Dung lượng chứa LPG	 12 kg:4.	 Tiêu chuẩn thép	 JIS G 3116 SG 255:5.	 Đường kính ngoài của bình	 300mm (±1):6.	 Chiều cao tổng thể của bình 	 585mm (±3):7.	 Áp suất thử thủy tĩnh	 34 Kg/cm2:8.	 Van	 POL V87 hiệu SCG',
1, 3, 1, 500000, 'images/products/9/df.jpg', 345, 31, CAST(N'2020-01-22T08:37:27.990' AS DateTime), 1)


INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'binh-45-kg-loai-1-van-10', N'Bình 45kg loại 1 van', N'bình;bình gas;45;45kg;1 van',
N'Bình gas 45Kg 1 van', N'1.	 Tiêu chuẩn thiết kế	 DOT-4BW-240:2.	 Áp suất thiết kế	 240 Psi; 17 Kg/cm2:3.	 Áp suất kiểm tra thủy lực	 480 Psi; 34 Kg/cm2:4.	 Thể tích bình	 99 lít ± 0.5%:5.	 Trọng lượng khí	 45kg Bu + Pro:6.	 Đường kính ngoài thân bình         	 374mm ± 1mm:7.	 Chiều cao toàn bộ bình	 1175mm ± 5mm:8.	 Van	 POL-V87Q3 hiệu SCG',
1, 3, 1, 440000, 'images/products/10/df.jpg', 1128, 86, CAST(N'2020-01-22T08:37:27.990' AS DateTime), 1)

-----

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'binh-gas-45-kg-loai-2-van-11', N'Bình Gas 45kg loại 2 van', N'bình;bình gas;45kg;2 van',
N'Bình gas 45kg loại 2 van', N' 1.	 Tiêu chuẩn	 DOT 4BA-240: 2.	 Dung tích nước	 26.4 lít (±0.2): 3.	 Dung lượng chứa LPG	 12 kg: 4.	 Tiêu chuẩn thép	 JIS G 3116 SG 255: 5.	 Đường kính ngoài của bình	 300mm (±1): 6.	 Chiều cao tổng thể của bình 	 585mm (±3): 7.	 Áp suất thử thủy tĩnh	 34 Kg/cm2: 8.	 2 Van	 POL V87 hiệu SCG',
1, 4, 1, 500000, 'images/products/11/df.jpg', 386, 61, CAST(N'2020-01-22T08:37:27.990' AS DateTime), 1)


INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'lon-gas-nhap-khau-12', N'Lon gas nhập khẩu', N'lon;lon gas;nhập khẩu',
N'Lon gas dùng cho bếp mini', N'Model	Lon gas mini NaMilux:Khối lượng tịnh	250g:Tổng khối lượng của khí nén và bình	350g:Thế tích thực	520ml',
1, 4, 1, 20000, 'images/products/12/df.jpg', 43120, 2857, CAST(N'2020-01-22T08:37:27.990' AS DateTime), 1)





INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'bao-ro-ri-gas-13', N'BÁO RÒ RỈ GAS', N'báo;rò rỉ',
N'Phát hiện khí gas bị rò rỉ và báo động khi có các sự cố về rò rỉ gas', N'Model	VTD 2005 (AC type):Nhận biết loại khí	LPG, LNG, Khí Mêtan, Khí dễ cháy:Điểm cảnh báo	Nồng độ cảnh báo 25% LEL:(Điểm cài đặt 18% LEL)::Công nghệ phát hiện	Khuyếch tán và phân tích chất dế cháy:Thời gian kích hoạt	Trong vòng 20 giây:Nhiệt độ và độ ẩm vận hành	0℃~40℃. < 90% (RH):Nguồn điện	AC 220V. 50/60Hz:Tiêu thụ điện năng	1.5W:Trọng lượng và Kích thước	224g và 70x120x38mm:Cảnh báo	 Đèn LED màu vàng:Phát âm báo (70dB DC 12V 20mA):ABS Nhựa chống cháy',
3, 1, 1, 200000, 'images/products/13/df.jpg', 3151, 245, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'bao-ro-ri-gas-jic-678n-14', N'BÁO RÒ RỈ GAS JIC-678N', N'báo;rò rỉ;JIC-678N',
N'Phát hiện khí gas bị rò rỉ và báo động khi có các sự cố về rò rỉ gas', N'Thiết bị báo rò rỉ gas đã trở nên khá quen thuộc với nhiều nhà bếp nhà hàng, bếp công nghiệp và cả bếp của các gia đình hiện nay. Công dụng chính của thiết bị gas này là phát hiện khí gas bị rò rỉ và báo động khi có các sự cố về rò rỉ gas, đảm bảo an toàn trong nhà bếp.:Đặc biệt là trong các nhà hàng thì các thiết bị bếp hoặc van dây được sử dụng với cường độ cao & thường xuyên thì việc xì gas hay rò rỉ gas rất dễ xảy ra. Trong nhiều trường hợp khác nguyên nhân xảy ra các sự cố về gas cũng có thể là do vết dầu mỡ bắn vào lâu ngày làm mục dây gas hoặc chuột bọ cắn dây gas, vì vậy việc trang bị cho nhà bếp một thiết bị báo rò rỉ gas này là khá quan trọng và đảm bảo an toàn cho cả người và tài sản của nhà hàng.:Thiết bị báo rò rỉ gas sẽ phát huy tác dụng tốt nhất khi kết hợp với thiết bị ngắt gas tự động và còi hú báo động, khi có sự cố thì thiết bị này sẽ truyền tín hiệu đến còi hú để báo động sự cố và thiết bị ngắt gas cũng tự động ngắt gas ngăn không cho gas tiếp tục rò rỉ ra ngoài.:Hiện nay trên thị trường thì các thiết bị báo rò rỉ gas khá đa dạng về nguồn gốc xuất xứ như Hàn Quốc, Trung Quốc, Đài Loan, Nhật Bản…Tùy theo ngân sách và nhu cầu của từng nhà hàng thì có thể sắm thiết bị cho phù hợp.:Toàn phát là đơn vị chuyên nhập khẩu và phân phối các thiết bị báo rò rỉ gas an toàn của Hàn Quốc, Nhật Bản, Hàn Quốc. chúng tôi sẵn sàng tư vấn cho quý vị lựa chọn thiết bị phù hợp, lắp đặt tận nơi, hướng dẫn sử dụng và bảo hành bảo trì chu đáo cho các sản phẩm bán ra.:Ngoài ra Petro VN cũng là nhà thầu::Lắp đặt mới, thay thế các thiết bị đã cũ, bảo trì bảo dưỡng hệ thống gas, ống gas, van dây gas của các nhà hàng đã sử dụng lâu ngày & có nguy cơ bị xì gas hoặc không đảm bảo an toàn khi có các sự cố về Gas.:Nhận tư vấn thiết kế thi công hệ thống gas an toàn tuyệt đối khi sử dụng cho nhà bếp nhà hàng, bếp công nghiệp căng tin trường học, bệnh viện nhà máy khu chế xuất…',
3, 1, 1, 195000, 'images/products/14/df.jpg', 2041, 25, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'bo-ngat-gas-tu-dong-15', N'BỘ NGẮT GAS TỰ ĐỘNG', N'ngắt gas;tư động',
N'Bộ ngắt gas tự động với hệ thống phát hiện rò rỉ gas', N'– Nguồn điện : AC-110/220V 50/60HZ:– Điện năng tiêu thụ chờ : 0.5W:– Điện năng tiêu thụ báo động : 2W:– Báo động tập trung : LEL 1/4:– Hoạt động nhiệt độ : -40oC ~ 70oC:– Loại: Bộ ngắt gas tự động với hệ thống phát hiện rò rỉ gas:– Trọng lượng: 0,15 kg:– Loại điều khiển: Thời gian (30 giây):-Tính năng chuyển mạch từ xa và tự động ngắt khi phát hiện rò rỉ khí gas',
3, 1, 1, 220000, 'images/products/15/df.jpg', 4114, 422, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)



INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'day-dan-gas-cao-ap-cong-nghiep-windo-16', N'Dây dẫn gas cao áp công nghiệp WINDO', N'dây dẫn;cáo áp',
N'Sản phẩm chất lượng cao, được thiết kế đặc biệt để đảm bảo an toàn và hiệu suất cho hệ thống dẫn gas.', N'Dây dẫn gas công nghiệp là sản phẩm đầu ra áp suất cao dùng cho van bếp gas công nghiệp khè nấu nhanh có độ bền rất cao,được người việt tin dùng toàn quốc. -Dây gas sử dụng cho van gas công nghiệp dùng bình gas 12kg hoặc bình gas bò 45kg - 50kg. -Sử dụng cao su chuyên dụng NBR ( nhật bản ) -->có độ bóng,không mùi,không bị lão hoá.',
3, 6, 1, 150000, 'images/products/16/df.jpg', 1000, 311, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'van-dieu-ap-ngat-gas-tu-dong-cao-ap-windo-wd-349-17', N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-349', N'van;van điều áp;ngắt gas;tự động;windo;wd-349',
N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-349', N'Van điều áp ngắt gas tự động cao áp WINDO WD-349 là một thiết bị an toàn và hiệu quả được thiết kế để kiểm soát áp suất trong hệ thống gas cao áp. Với chức năng tự động ngắt gas khi áp suất vượt quá mức cho phép, van này giúp bảo vệ hệ thống khỏi các nguy cơ gây cháy nổ do áp suất quá cao.

Sử dụng công nghệ tiên tiến và vật liệu chất lượng cao, van điều áp WINDO WD-349 đảm bảo độ chính xác và đáng tin cậy trong việc kiểm soát áp suất. Thiết kế thông minh và dễ dàng lắp đặt giúp tối ưu hóa hiệu suất hoạt động của hệ thống gas và giảm thiểu sự cố.

Với khả năng hoạt động tự động và đáng tin cậy, van điều áp ngắt gas tự động cao áp WINDO WD-349 là một phần không thể thiếu trong hệ thống gas công nghiệp và thương mại, giúp bảo vệ an toàn và tăng cường hiệu suất hoạt động.',
3, 6, 1, 70000, 'images/products/17/df.jpg', 422, 43, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'van-dieu-ap-ngat-gas-tu-dong-cao-ap-windo-wd-348-18', N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-348', N'van;van điều áp;ngắt gas;tự động;windo;wd-348',
N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-348', N'Van điều áp ngắt gas tự động cao áp WINDO WD-348 là một thiết bị chất lượng cao được thiết kế để kiểm soát áp suất trong hệ thống gas cao áp. Với chức năng tự động ngắt gas khi áp suất vượt quá mức cho phép, van này đảm bảo an toàn và độ tin cậy cao cho hệ thống.

Sử dụng công nghệ tiên tiến và vật liệu chất lượng, van WINDO WD-348 giúp duy trì áp suất ổn định trong hệ thống gas, ngăn ngừa các tình huống nguy hiểm có thể xảy ra do áp suất quá cao. Thiết kế thông minh và dễ dàng lắp đặt, van này phù hợp với nhiều ứng dụng trong ngành công nghiệp và thương mại.',
3, 6, 1, 70000, 'images/products/18/df.jpg', 111, 64, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)




INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'van-dieu-ap-srg-19', N'Van điều áp SRG', N'Van điều áp;SRG',
N'Van điều áp đảm bảo đường truyền gas ổn định, an toàn', N'VAN ĐIỀU ÁP SRG là một thiết bị chất lượng cao được sử dụng để kiểm soát áp suất trong hệ thống gas. Thiết bị này được thiết kế để tự động điều chỉnh áp suất và duy trì mức áp suất ổn định trong hệ thống.

Với tính năng tự động điều chỉnh, VAN ĐIỀU ÁP SRG giúp ngăn chặn các vấn đề có thể xảy ra do áp suất gas biến đổi không đều, bảo vệ hệ thống khỏi những cú sốc áp suất đột ngột và đảm bảo hoạt động ổn định của các thiết bị và đường ống gas.

VAN ĐIỀU ÁP SRG được sản xuất với công nghệ tiên tiến và vật liệu chất lượng, đảm bảo độ tin cậy cao và tuổi thọ dài lâu. Thiết bị này dễ dàng lắp đặt và vận hành, phù hợp cho nhiều ứng dụng trong các ngành công nghiệp và thương mại.',
3, 3, 1, 70000, 'images/products/19/df.jpg', 4380, 43, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'van-dieu-ap-comap-20', N'Van điều áp Comap', N'Van điều áp;Comap',
N'Van điều áp đảm bảo đường truyền gas ổn định, an toàn', N'VAN ĐIỀU ÁP COMAP là một thiết bị điều chỉnh áp suất chất lượng cao được sử dụng trong hệ thống gas. Thiết bị này được thiết kế để tự động điều chỉnh áp suất và duy trì mức áp suất ổn định trong hệ thống gas.

Với tính năng tự động điều chỉnh, VAN ĐIỀU ÁP COMAP giúp ngăn chặn các vấn đề có thể xảy ra do áp suất gas biến đổi không đều, bảo vệ hệ thống khỏi những cú sốc áp suất đột ngột và đảm bảo hoạt động ổn định của các thiết bị và đường ống gas.

Thiết bị này được sản xuất với công nghệ tiên tiến và vật liệu chất lượng, đảm bảo độ tin cậy cao và tuổi thọ dài lâu. VAN ĐIỀU ÁP COMAP cung cấp hiệu suất ổn định và đáng tin cậy trong môi trường làm việc khắc nghiệt và yêu cầu cao về kiểm soát áp suất.',
3, 3, 1, 80000, 'images/products/20/df.jpg', 6423, 222, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'van-dieu-ap-reca-21', N'Van điều áp Reca', N'Van điều áp;Reca',
N'Van điều áp đảm bảo đường truyền gas ổn định, an toàn', N'VAN ĐIỀU ÁP RECA là một thành phần quan trọng trong hệ thống gas, được thiết kế để điều chỉnh áp suất gas và bảo vệ hệ thống khỏi những biến động áp suất không mong muốn.

Thiết bị này tự động điều chỉnh áp suất vào mức ổn định và an toàn, đảm bảo rằng các thiết bị và đường ống gas hoạt động hiệu quả và ổn định. VAN ĐIỀU ÁP RECA giúp ngăn chặn các vấn đề có thể xảy ra do áp suất gas biến đổi không đều, như sự cố về áp suất quá cao hoặc quá thấp.

Thiết bị này được chế tạo từ các vật liệu chất lượng cao và được sản xuất với công nghệ tiên tiến, đảm bảo độ bền và độ tin cậy cao trong môi trường làm việc khắc nghiệt. VAN ĐIỀU ÁP RECA cung cấp hiệu suất ổn định và đáng tin cậy trong mọi điều kiện hoạt động.',
3, 3, 1, 65000, 'images/products/21/df.jpg', 3423, 43, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)


INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'vong-chan-gio-the-he-moi-22', N'VÒNG CHẮN GIÓ THẾ HỆ MỚI', N'chắn gió',
N'Giảm thiểu tối đa tác động của gió, giữ cho không gian bên trong vệt gió luôn yên tĩnh và thoải mái.', N'Vòng kiềng chắn gió thế hệ mới, sử dụng cho bếp gas mini của NaMilux.:Khả nặng chịu tải lên đến 25kg:Giúp che chắn ngọn lửa không bị gió khi ở ngoài trời.:Giúp tăng hiệu suất đốt (giảm thoát nhiệt) tiết kiệm thời gian nấu lên đến 36%. Và đồng thời tiết kiệm gas 36%:Lưu ý: chỉ sử dụng môi trường ngoài trời nơi có gió lùa. Nếu sử dụng trong phòng thì nhiệt độ tụ quá cao có thể ảnh hưởng đến độ bền của đầu đốt.',
3, 4, 1, 100000, 'images/products/22/df.jpg', 56365, 3256, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)


INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'den-kho-na-197-23', N'Đèn khò NA-197', N'đèn khò;máy khò;NA-197',
N'Đèn khò đa năng dùng để hàn gắn, nung nóng, nấu ăn', N'Loại sản phẩm	Đèn khò gas:Model	NA -197:Gas sử dụng	Lon gas butane:Công suất	1.8 kW (1500 kcal/h)"Lượng gas tiêu thụ	132 g/h"Nhiệt độ đầu khò	Lên đến 1200℃:Trọng lượng	153g:Kích thước	184 x 64 x 40 mm',
3, 4, 1, 200000, 'images/products/23/df.jpg', 1239, 53, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)


INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'den-kho-ts1719rn-24', N'Đèn khò TS1719RN', N'đèn khò;máy khò;TS1719RN',
N'Đèn khò đa năng dùng để hàn gắn, nung nóng, nấu ăn', N'Nấu ăn và phục vụ ăn uống:Đốt côn trùng, cỏ, rác.:Nấu cháy nhựa, uốn ống nhựa:Các công việc tạo hình trên kim loại:Loại sản phẩm	Đèn khò gas:Model	TS1719RN:Gas sử dụng	Lon gas butane:Công suất	1.4 kW (1200 Kcal/giờ):Lượng gas tiêu thụ	100g/giờ:Nhiệt độ đầu khò	>1200℃',
3, 4, 1, 200000, 'images/products/24/df.jpg', 3322, 433, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

insert into Product ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy])
VALUES (N'bep-gas-namilux-nh-041pf-25', N'Bếp gas Namilux NH-041PF', N'Namilux NH-041PF', N'Bếp gas đơn, nhỏ gọn, tiết kiệm không gian', N'Trang bị van Inlinecut, ngắt gas tự động, an toàn khi dùng. Hệ thống đánh lửa Magneto cho lửa nhanh, tiết kiệm gas. Đầu đốt bằng hợp kim Nhôm có độ bền cao. Kiềng và vòng chắn gió bằng Inox, bền bỉ',
2, 4, 1, 299000, 'images/products/25/df.jpg', 50, 2,  CAST(N'2023-05-13T07:00:00.000' AS DateTime), 1)

INSERT into Product  ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy])
VALUES (N'bap-gas-mini-namilux-nh-p3212ps-26', N'Bếp gas mini Namilux NH-P3212PS', N'Namilux NH-P3212PS', N'Thân bếp được thiết kế thông gió 4 mặt ngăn ngừa nguy cơ gây nổ lon gas', N'Nắp đậy lon gas và kiềng có hệ thống dẫn nước chống nước không tràn vào lon gas. Kích thước bếp bằng 1/2 bếp mini thông thường, phù hợp khi sử dụng trên bàn ăn nhỏ. Hệ thống đầu đốt có lưới điều tiết gas nâng cao hiệu suất, tiết kiệm thời gian đun nấu',
2, 4, 1, 340000, 'images/products/26/df.jpg', 100, 500,  CAST(N'2022-07-20T09:30:10.460' AS DateTime), 1)

insert into Product ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy])
VALUES (N'bep-khe-na-196-27', N'BẾP KHÈ NA-196', N'NA-196', N'Là sản phẩm bếp khè đầu tiên của NaMilux. Đầu đốt đúc gang nên độ bền cực kỳ cao.', N'Ngoài ra, bếp khè NA-196 có tính năng đánh lửa tự động, và điều chỉnh lửa bằng 1 tay. Bếp khè đang trở thành 1 sản phẩm thông dụng với các hộ gia đình vì Công suất cao, Nấu nhanh, Giá thành rẻ, Dễ vệ sinh',
2, 4, 1, 599000, 'images/products/27/df.jpg', 10, 20,  CAST(N'2021-05-13T09:50:42.460' AS DateTime), 1)

insert into Product ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy])
VALUES (N'bep-ga-doi-rinnai-rv-mc27be-28', N'Bếp ga đôi Rinnai RV-MC27BE', N'RV-MC27BE', N'Bếp ga đôi vận hành với lượng ga tiêu thụ 0.42 kg/h/lò.', N'Bếp ga Rinnai RV-MC27BE là loại bếp cơ bản với 2 vùng nấu dễ sử dụng, trang bị hệ thống đánh lửa Magneto bền và dễ dùng đáp ứng nhu cầu nấu nướng cơ bản của người dùng.',
2, 2, 1, 1030000, 'images/products/28/df.jpg', 50, 2,  CAST(N'2023-08-30T11:20:00.460' AS DATETIME), 1)

INSERT into Product  ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy])
VALUES (N'bep-ga-doi-rinnai-rv-715slim-29', N'Bếp ga đôi Rinnai RV-715Slim', N'RV-715Slim', N'Thiết kế hiện đại, màu đen sang trọng làm nổi bật không gian bếp.', N'Bếp ga Rinnai RV-715Slim(GL-SC) thiết kế hiện đại, màu đen sang trọng, hệ thống đánh lửa Magneto có độ bền cao, sản phẩm của thương hiệu Nhật Bản, uy tín, an toàn khi sử dụng.',
2, 5, 1, 2570000, 'images/products/29/df.jpg', 20, 20,  CAST(N'2022-07-20T12:50:00.000' AS DateTime), 1)

INSERT into Product  ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy])
VALUES (N'bep-cong-nghiep-sao-rinnai-tl-289ri-30', N'Bếp Công Nghiệp Sào Rinnai TL 289RI', N'Rinnai TL 289RI', N'đánh lửa cở học ( Magneto )', N'khung sườn bằng gang đúc nguyên khối, kiềng đầu đốt họng đốt bằng gang, điều khiển nút xoay',
2, 5, 1, 950000, 'images/products/30/df.jpg', 10, 20,  CAST(N'2023-05-13T09:50:42.460' AS DateTime), 1)

insert into Product ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy])
VALUES (N'bep-gas-doi-de-ban-mat-kinh-windo-719gl-a-31', N'BẾP GAS ĐÔI ĐỂ BÀN MẶT KÍNH WINDO 719GL-A', N'WINDO 719GL-A', N'Thiết kế mặt kính chịu lực, chịu nhiệt tốt', N'Chất liệu kính hạn chế tối đa tình trạng nứt, vỡ bề mặt khi có tác động từ bên ngoài. Đồng thời, mặt kính hạn chế chống xước và bám dính thực phẩm, sau khi đun nấu chỉ cần lấy khăn ẩm nhẹ nhàng lau là mặt bếp lại sáng bóng như mới.',
2, 6, 1, 499000, 'images/products/31/df.jpg', 50, 2,  CAST(N'2020-04-13T06:30:00.000' AS DateTime), 1)

INSERT into Product ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy])
VALUES (N'bep-doi-mat-kinh-de-ban-windo-717-2-32', N'Bếp đôi mặt kính để bàn Windo 717-2', N'Windo 717-2', N'Mặt bếp chống trầy tốt, chịu lực, chịu nhiệt tốt', N'Sử dụng ống điếu (thiết kế theo nguyên lý khí động học) đạt tiêu chuẩn JIA (Japan), hiệu suất đốt tối ưu, tiết kiệm 10% gas tiêu thụ', 
2, 6, 1, 449000, 'images/products/32/df.jpg', 50, 2,  CAST(N'2023-05-13T20:45:00.000' AS DateTime), 1)

insert into Product ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy])
VALUES (N'bep-gas-khe-cao-cap-windo-6b-33', N'BẾP GAS KHÈ CAO CẤP WINDO 6B', N'WINDO 6B', N'Toàn thân bằng gang đúc nguyên khối, Bộ hòa khí ngoại nhập', N'cho hiệu năng cao cùng lửa  to và mạnh, giúp việc chế biến các món Á, món xào với lửa lớn, món chiên, nước sốt… trở nên đơn giản hơn bao giờ hết. Mặc dù cho hiệu suất cao với lửa  nhưng bếp tiêu tốn gas không đáng kể chỉ 720g/h. Sử dụng hệ thống đánh lửa Magneto tiên tiến, lên lửa cực nhanh và không phải lo thay pin bất tiện như đánh lửa IC. Số vòng lửa có nhiều mức để người dùng có thể tùy ý chỉnh theo nhu cầu nấu nướng. Sử dụng bếp gas công nghiệp là giải pháp tiết kiệm chi phí, tiện lợi, an toàn (nếu sử dụng đúng cách) cho các nhà hàng, quán ăn.',
2, 6, 1, 899000, 'images/products/33/df.jpg', 10, 20,  CAST(N'2023-05-13T15:35:00.000' AS DateTime), 1)



INSERT INTO ProductImg([productID], [Path]) VALUES (1, 'images/product_detail/1_1.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (1, 'images/product_detail/1_2.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (2, 'images/product_detail/2_1.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (2, 'images/product_detail/2_2.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (3, 'images/product_detail/3_1.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (3, 'images/product_detail/3_2.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (4, 'images/product_detail/4_1.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (4, 'images/product_detail/4_2.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (5, 'images/product_detail/5_1.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (5, 'images/product_detail/5_2.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (6, 'images/product_detail/6_1.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (6, 'images/product_detail/6_2.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (7, 'images/product_detail/7_1.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (7, 'images/product_detail/7_2.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (8, 'images/product_detail/8_1.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (8, 'images/product_detail/8_2.jpg')
INSERT INTO ProductImg([productID], [Path]) VALUES (9, 'images/product_detail/9_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (9, 'images/product_detail/9_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (10, 'images/product_detail/10_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (10, 'images/product_detail/10_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (11, 'images/product_detail/11_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (11, 'images/product_detail/11_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (12, 'images/product_detail/12_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (12, 'images/product_detail/12_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (13, 'images/product_detail/13_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (13, 'images/product_detail/13_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (14, 'images/product_detail/14_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (14, 'images/product_detail/14_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (15, 'images/product_detail/15_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (15, 'images/product_detail/15_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (16, 'images/product_detail/16_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (16, 'images/product_detail/16_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (17, 'images/product_detail/17_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (17, 'images/product_detail/17_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (18, 'images/product_detail/18_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (18, 'images/product_detail/18_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (19, 'images/product_detail/19_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (19, 'images/product_detail/19_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (20, 'images/product_detail/20_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (20, 'images/product_detail/20_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (21, 'images/product_detail/21_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (21, 'images/product_detail/21_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (22, 'images/product_detail/22_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (22, 'images/product_detail/22_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (23, 'images/product_detail/23_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (23, 'images/product_detail/23_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (24, 'images/product_detail/24_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (24, 'images/product_detail/24_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (25, 'images/product_detail/25_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (25, 'images/product_detail/25_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (26, 'images/product_detail/26_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (26, 'images/product_detail/26_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (27, 'images/product_detail/27_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (27, 'images/product_detail/27_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (28, 'images/product_detail/28_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (28, 'images/product_detail/28_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (29, 'images/product_detail/29_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (29, 'images/product_detail/29_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (30, 'images/product_detail/30_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (30, 'images/product_detail/30_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (31, 'images/product_detail/31_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (31, 'images/product_detail/31_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (32, 'images/product_detail/32_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (32, 'images/product_detail/32_2.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (33, 'images/product_detail/33_1.jpg');
INSERT INTO ProductImg([productID], [Path]) VALUES (33, 'images/product_detail/33_2.jpg');

