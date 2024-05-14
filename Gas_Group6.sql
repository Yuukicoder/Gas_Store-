CREATE DATABASE Gas_Group6
Use Gas_Group6

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
	 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
	(
		[customerID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE Discount (
    DiscountID INT IDENTITY(1,1) PRIMARY KEY,
    DiscountCode VARCHAR(255) NOT NULL,
    Description TEXT,
    DiscountAmount DECIMAL(10,2) NOT NULL,
    DiscountType VARCHAR(10) CHECK (DiscountType IN ('PERCENT', 'FIXED')), 
    MinimumPurchase DECIMAL(10,2) DEFAULT 0.00,
    StartDate DATE,
    EndDate DATE,
    IsActive BIT DEFAULT 1  
);
CREATE UNIQUE INDEX idx_CouponCode ON Discount(DiscountCode);

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
    UsageID INT IDENTITY(1,1) PRIMARY KEY,
    DiscountID INT,
    CustomerID INT,
    UseDate DATETIME,
    OrderID INT,  
    FOREIGN KEY (DiscountID) REFERENCES Discount(DiscountID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(customerID), 
    FOREIGN KEY (OrderID) REFERENCES [Order](orderID)  
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
    FOREIGN KEY (SerialID) REFERENCES SerialNumbers(SerialID)
);

GO

	ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [FK_Administrator_Role] FOREIGN KEY([roleID])
	REFERENCES [dbo].[Role] ([roleID])
	GO
	ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [FK_Administrator_Role]
	GO
	ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerID])
	REFERENCES [dbo].[Customer] ([customerID])
	GO
	ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
	GO
	ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipments] FOREIGN KEY([shipVia])
	REFERENCES [dbo].[Shipments] ([shipmentID])
	GO
	ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shipments]
	GO
	ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([orderID])
	REFERENCES [dbo].[Order] ([orderID])
	GO
	ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
	GO
	ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([productID])
	REFERENCES [dbo].[Product] ([productID])
	GO
	ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
	GO
	ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryID])
	REFERENCES [dbo].[Category] ([categoryID])
	GO
	ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
	GO
	ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([supplierId])
	REFERENCES [dbo].[Supplier] ([supplierId])
	GO
	ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
	
	GO
	ALTER TABLE [dbo].[Product]
	ADD [createdBy] int NULL;
	GO
	ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Administrator] FOREIGN KEY([createdBy])
	REFERENCES [dbo].[Administrator] ([administratorID])
	GO 
	ALTER TABLE [dbo].[Warranties]
	ADD [customerID] int NULL;
	GO
	ALTER TABLE [dbo].[Warranties]  WITH CHECK ADD  CONSTRAINT [FK_Warranties_Customer] FOREIGN KEY([customerID])
	REFERENCES [dbo].[Customer] ([customerID])

	GO
	ALTER TABLE [dbo].[Supplier]
	ADD [roleID] INT NULL;
	ALTER TABLE [dbo].[Supplier]
	ADD CONSTRAINT FK_Supplier_Roles
	FOREIGN KEY ([roleID]) REFERENCES [dbo].[Role]([roleID]);
	ALTER TABLE [dbo].[Supplier]
	DROP CONSTRAINT FK_Supplier_Roles;

	GO
	ALTER TABLE Warranties
	ADD SupplierID INT NULL;
	ALTER TABLE Warranties
	ADD CONSTRAINT FK_Warranties_Supplier
	FOREIGN KEY (SupplierID) REFERENCES [dbo].[Supplier](supplierId);
	GO
	ALTER TABLE Warranties
	ADD BarCode nvarchar(max) NULL, ProofImg  nvarchar(max) NULL, Notes nvarchar(max) NULL

	GO
	ALTER TABLE [dbo].[Customer]
	ADD [roleID] INT NULL;
	ALTER TABLE [dbo].[Customer]
	ADD CONSTRAINT FK_Customer_Role
	FOREIGN KEY ([roleID]) REFERENCES [dbo].[Role]([roleID]);

	

CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(50),
    PaymentDate DATETIME,
    FOREIGN KEY (OrderID) REFERENCES [Order](orderID)
);

CREATE TABLE News(
	newsID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	img nvarchar(max) NULL,
	title nvarchar(max) NULL,
	[date] DATETIME NULL,
	[description] nvarchar(max) NULL
)

	GO 
	ALTER TABLE [dbo].[News]
	ADD [createdBy] INT NULL;
	ALTER TABLE [dbo].[News]
	ADD CONSTRAINT FK_News_Admin
	FOREIGN KEY ([createdBy]) REFERENCES [dbo].[Administrator]([administratorID]);




INSERT INTO dbo.Role(code, name, description) VALUES('Admin', N'Administrator', N'Manager webapp')
INSERT INTO dbo.Role(code, name, description) VALUES('Supplier', N'Supplier', N'Provide product')
INSERT INTO dbo.Role(code, name, description) VALUES('Customer', N'Customer', N'Using webapp')

INSERT INTO dbo.Shipments(CompanyName, Phone, Email, Status, createdDate) VALUES(N'J&T Express', N'1900 1088', N'JTExpress@gmail.com',1, GETDATE())
INSERT INTO dbo.Shipments(CompanyName, Phone, Email, Status, createdDate) VALUES(N'NINJA VAN', N'1900 886 877', N'NINJAVAN@gmail.com',1, GETDATE())
INSERT INTO dbo.Shipments(CompanyName, Phone, Email, Status, createdDate) VALUES(N'Ahamove', N'1900 545411', N'Ahamove@gmail.com', 1, GETDATE())
INSERT INTO dbo.Shipments(CompanyName, Phone, Email, Status, createdDate) VALUES(N'Ship60', N'1900 6362090', N'Ship60@gmail.com', 1, GETDATE())
INSERT INTO dbo.Shipments(CompanyName, Phone, Email, Status, createdDate) VALUES(N'GHN Express', N'1900 636677', N'GHNExpress@gmail.com', 1, GETDATE())

INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate],[email],[phone],[homePage], [roleID])VALUES(N'PV GAS',1,CURRENT_TIMESTAMP,'pvgas@pvgas.com.vn','+84 28 3781 6777','https://www.pvgas.com.vn',2)
INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate],[email],[phone],[homePage], [roleID])VALUES(N'Gas Gia Đình',1,CURRENT_TIMESTAMP,'gasgiadinh.vn@gmail.com','(028) 37.155.166','http://gasgiadinh.vn',2)
INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate],[email],[phone],[homePage], [roleID])VALUES(N'VT Gas',1,CURRENT_TIMESTAMP,' info@vt-gas.com.vn','061. 383 1988','http://www.vtgas.com.vn/',2)
INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate],[email],[phone],[homePage], [roleID])VALUES('NaMilux',1,CURRENT_TIMESTAMP,'info@namilux.com','0389764184','https://namilux.com/vi/home',2)
INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate], [email],[phone],[homePage], [roleID])VALUES('Rinnai',1,CURRENT_TIMESTAMP,'info@rinnaivietnamofficial@gmail.com','(028) 6292 8184','https://rinnai.com.vn',2)
INSERT INTO [dbo].[Supplier]([companyName],[Status],[createdDate],[email],[phone],[homePage], [roleID])VALUES('Windo',1,CURRENT_TIMESTAMP,'windothienthanh@gmail.com','0908492923','https://windo.vn',2)

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
N'Đơn vị chuyên nhập khẩu, phân phối sỉ và lẻ các thiết bị Gas, van Gas an toàn, hệ thống gas trung tâm, hệ thống gas công nghiệp, máy báo rò rỉ gas, dây gas… đảm bảo tuyệt đối an toàn khi sử dụng.:Thiết bị báo rò rỉ gas đã trở nên khá quen thuộc với nhiều nhà bếp nhà hàng, bếp công nghiệp và cả bếp của các gia đình hiện nay. Công dụng chính của thiết bị gas này là phát hiện khí gas bị rò rỉ và báo động khi có các sự cố về rò rỉ gas, đảm bảo an toàn trong nhà bếp.::Đặc biệt là trong các nhà hàng thì các thiết bị bếp hoặc van dây được sử dụng với cường độ cao & thường xuyên thì việc xì gas hay rò rỉ gas rất dễ xảy ra. Trong nhiều trường hợp khác nguyên nhân xảy ra các sự cố về gas cũng có thể là do vết dầu mỡ bắn vào lâu ngày làm mục dây gas hoặc chuột bọ cắn dây gas, vì vậy việc trang bị cho nhà bếp một thiết bị báo rò rỉ gas này là khá quan trọng và đảm bảo an toàn cho cả người và tài sản của nhà hàng.::Thiết bị báo rò rỉ gas sẽ phát huy tác dụng tốt nhất khi kết hợp với thiết bị ngắt gas tự động và còi hú báo động, khi có sự cố thì thiết bị này sẽ truyền tín hiệu đến còi hú để báo động sự cố và thiết bị ngắt gas cũng tự động ngắt gas ngăn không cho gas tiếp tục rò rỉ ra ngoài.::Hiện nay trên thị trường thì các thiết bị báo rò rỉ gas khá đa dạng về nguồn gốc xuất xứ như Hàn Quốc, Trung Quốc, Đài Loan, Nhật Bản…Tùy theo ngân sách và nhu cầu của từng nhà hàng thì có thể sắm thiết bị cho phù hợp.::Toàn phát là đơn vị chuyên nhập khẩu và phân phối các thiết bị báo rò rỉ gas an toàn của Hàn Quốc, Nhật Bản, Hàn Quốc. chúng tôi sẵn sàng tư vấn cho quý vị lựa chọn thiết bị phù hợp, lắp đặt tận nơi, hướng dẫn sử dụng và bảo hành bảo trì chu đáo cho các sản phẩm bán ra.', N'Model	VTD 2005 (AC type):Nhận biết loại khí	LPG, LNG, Khí Mêtan, Khí dễ cháy:Điểm cảnh báo	Nồng độ cảnh báo 25% LEL:(Điểm cài đặt 18% LEL)::Công nghệ phát hiện	Khuyếch tán và phân tích chất dế cháy:Thời gian kích hoạt	Trong vòng 20 giây:Nhiệt độ và độ ẩm vận hành	0℃~40℃. < 90% (RH):Nguồn điện	AC 220V. 50/60Hz:Tiêu thụ điện năng	1.5W:Trọng lượng và Kích thước	224g và 70x120x38mm:Cảnh báo	 Đèn LED màu vàng:Phát âm báo (70dB DC 12V 20mA):ABS Nhựa chống cháy',
3, 1, 1, 200000, 'images/products/13/df.jpg', 3151, 245, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'bao-ro-ri-gas-jic-678n-14', N'BÁO RÒ RỈ GAS JIC-678N', N'báo;rò rỉ;JIC-678N',
N'', N'Thiết bị báo rò rỉ gas đã trở nên khá quen thuộc với nhiều nhà bếp nhà hàng, bếp công nghiệp và cả bếp của các gia đình hiện nay. Công dụng chính của thiết bị gas này là phát hiện khí gas bị rò rỉ và báo động khi có các sự cố về rò rỉ gas, đảm bảo an toàn trong nhà bếp.:Đặc biệt là trong các nhà hàng thì các thiết bị bếp hoặc van dây được sử dụng với cường độ cao & thường xuyên thì việc xì gas hay rò rỉ gas rất dễ xảy ra. Trong nhiều trường hợp khác nguyên nhân xảy ra các sự cố về gas cũng có thể là do vết dầu mỡ bắn vào lâu ngày làm mục dây gas hoặc chuột bọ cắn dây gas, vì vậy việc trang bị cho nhà bếp một thiết bị báo rò rỉ gas này là khá quan trọng và đảm bảo an toàn cho cả người và tài sản của nhà hàng.:Thiết bị báo rò rỉ gas sẽ phát huy tác dụng tốt nhất khi kết hợp với thiết bị ngắt gas tự động và còi hú báo động, khi có sự cố thì thiết bị này sẽ truyền tín hiệu đến còi hú để báo động sự cố và thiết bị ngắt gas cũng tự động ngắt gas ngăn không cho gas tiếp tục rò rỉ ra ngoài.:Hiện nay trên thị trường thì các thiết bị báo rò rỉ gas khá đa dạng về nguồn gốc xuất xứ như Hàn Quốc, Trung Quốc, Đài Loan, Nhật Bản…Tùy theo ngân sách và nhu cầu của từng nhà hàng thì có thể sắm thiết bị cho phù hợp.:Toàn phát là đơn vị chuyên nhập khẩu và phân phối các thiết bị báo rò rỉ gas an toàn của Hàn Quốc, Nhật Bản, Hàn Quốc. chúng tôi sẵn sàng tư vấn cho quý vị lựa chọn thiết bị phù hợp, lắp đặt tận nơi, hướng dẫn sử dụng và bảo hành bảo trì chu đáo cho các sản phẩm bán ra.:Ngoài ra Petro VN cũng là nhà thầu::Lắp đặt mới, thay thế các thiết bị đã cũ, bảo trì bảo dưỡng hệ thống gas, ống gas, van dây gas của các nhà hàng đã sử dụng lâu ngày & có nguy cơ bị xì gas hoặc không đảm bảo an toàn khi có các sự cố về Gas.:Nhận tư vấn thiết kế thi công hệ thống gas an toàn tuyệt đối khi sử dụng cho nhà bếp nhà hàng, bếp công nghiệp căng tin trường học, bệnh viện nhà máy khu chế xuất…',
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
N'sdesc', N'Dây dẫn gas công nghiệp là sản phẩm đầu ra áp suất cao dùng cho van bếp gas công nghiệp khè nấu nhanh có độ bền rất cao,được người việt tin dùng toàn quốc. -Dây gas sử dụng cho van gas công nghiệp dùng bình gas 12kg hoặc bình gas bò 45kg - 50kg. -Sử dụng cao su chuyên dụng NBR ( nhật bản ) -->có độ bóng,không mùi,không bị lão hoá.',
3, 6, 1, 150000, 'images/products/16/df.jpg', 1000, 311, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'van-dieu-ap-ngat-gas-tu-dong-cao-ap-windo-wd-349-17', N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-349', N'van;van điều áp;ngắt gas;tự động;windo;wd-349',
N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-349', N'desc',
3, 6, 1, 70000, 'images/products/17/df.jpg', 422, 43, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'van-dieu-ap-ngat-gas-tu-dong-cao-ap-windo-wd-348-18', N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-348', N'van;van điều áp;ngắt gas;tự động;windo;wd-348',
N'VAN ĐIỀU ÁP NGẮT GAS TỰ ĐỘNG CAO ÁP WINDO WD-348', N'desc',
3, 6, 1, 70000, 'images/products/18/df.jpg', 111, 64, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)




INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'van-dieu-ap-srg-19', N'Van điều áp SRG', N'Van điều áp;SRG',
N'Van điều áp đảm bảo đường truyền gas ổn định, an toàn', N'',
3, 3, 1, 70000, 'images/products/19/df.jpg', 4380, 43, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'van-dieu-ap-comap-20', N'Van điều áp Comap', N'Van điều áp;Comap',
N'Van điều áp đảm bảo đường truyền gas ổn định, an toàn', N'',
3, 3, 1, 80000, 'images/products/20/df.jpg', 6423, 222, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)

INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'van-dieu-ap-reca-21', N'Van điều áp Reca', N'Van điều áp;Reca',
N'Van điều áp đảm bảo đường truyền gas ổn định, an toàn', N'',
3, 3, 1, 65000, 'images/products/21/df.jpg', 3423, 43, CAST(N'1969-04-22T08:37:27.990' AS DateTime), 1)


INSERT [dbo].[Product] ([code], [name], [keywords],
[shortDescription], [description],
[categoryID], [supplierId], [isActive], [unitPrice], [image], [stockQuantity], [unitOnOrders], [createdDate], [createdBy]) VALUES
(N'vong-chan-gio-the-he-moi-22', N'VÒNG CHẮN GIÓ THẾ HỆ MỚI', N'chắn gió',
N'', N'Vòng kiềng chắn gió thế hệ mới, sử dụng cho bếp gas mini của NaMilux.:Khả nặng chịu tải lên đến 25kg:Giúp che chắn ngọn lửa không bị gió khi ở ngoài trời.:Giúp tăng hiệu suất đốt (giảm thoát nhiệt) tiết kiệm thời gian nấu lên đến 36%. Và đồng thời tiết kiệm gas 36%:Lưu ý: chỉ sử dụng môi trường ngoài trời nơi có gió lùa. Nếu sử dụng trong phòng thì nhiệt độ tụ quá cao có thể ảnh hưởng đến độ bền của đầu đốt.',
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

INSERT INTO News (img,title,[date],[description]) VALUES ('images/news/1/df.jpg', N'Điểm bạn nên làm trong quá trình sử dụng bếp gas',  GETDATE(), N'Lựa chọn bếp gas từ các thương hiệu nổi tiếng được phân phối tại các cơ sở kinh doanh uy tín trên thị trường, được đông đảo người tiêu dùng tin tưởng và lựa chọn.

Chọn mua gas từ các thương hiệu uy tín như Petrolimex, Hanoi Petro, Siamgas,… và nhớ kiểm tra kỹ bình gas trước khi nhận và thanh toán.

Chọn lựa các loại bếp gas có tính năng hiện đại như tự động ngắt gas, đầu hâm, khóa an toàn cho trẻ em, hẹn giờ,…')

INSERT INTO News (img,title,[date],[description]) VALUES ('images/news/2/df.jpg', N'Điều bạn nên nhớ khi đổi bình gas Petrolimex',  GETDATE(), N'Mỗi bình gas Petrolimex sau quá trình chiết nạp được niêm phong chắc chắn bằng màng co và tem chống hàng giả. Sản phẩm cũng được kiểm tra kỹ lưỡng về trọng lượng và chất lượng trước khi đưa ra thị trường. Tem chống giả và màng co của Petrolimex đảm bảo tính bảo mật cao, giúp người tiêu dùng phân biệt dễ dàng giữa hàng chính hãng và hàng giả, hàng nhái.

Tem chống giả được thiết kế cẩn thận. Để phân biệt bình gas Petrolimex thật và giả, bạn có thể sử dụng đèn tia cực tím chiếu vào phần tem, đặc biệt là vạch màu xanh. Nếu dòng chữ Petrolimex hiện rõ, đó là hàng thật. Ngoài ra, bạn có thể thử xoa nước lên phần vạch vàng trên tem chống giả. Nếu chữ Petrolimex hiện ra, đó là hàng chính hãng. Công nghệ hiện đại cũng cho phép kiểm tra bằng cách gửi tin nhắn hoặc quét mã QR. Giá gas Petrolimex thường được điều chỉnh để phản ánh giá xăng dầu trên thị trường thế giới, do đó luôn biến động và không có một con số cố định. Do đó, người sử dụng cần thường xuyên cập nhật và theo dõi giá gas, đồng thời chú ý sử dụng gas một cách tiết kiệm và hiệu quả để giảm thiểu chi phí.

Để đổi gas Petrolimex chính hãng, bạn cần trang bị kiến thức cơ bản về kiểm tra gas và lựa chọn địa chỉ uy tín, được Petrolimex ủy quyền, có nhiều kinh nghiệm trong ngành và được đông đảo người tiêu dùng tin tưởng.

Trên đây là chia sẻ của chúng tôi để bạn đọc có thêm kinh nghiệm lựa chọn bình gas Petrolimex chính hãng, chất lượng.')

INSERT INTO News (img,title,[date],[description]) VALUES ('images/news/3/ht.jpg', N'Điều bạn nên nhớ khi bảo trì hệ thống gas',  GETDATE(), N'Thực hiện bảo trì định kỳ sẽ đảm bảo hệ thống gas hoạt động ổn định và giảm thiểu nguy cơ khi sử dụng.

Hệ thống gas cần được thường xuyên bảo dưỡng và kiểm tra bởi các kỹ thuật viên hoặc nhân viên bảo hành có kinh nghiệm và hiểu biết về lĩnh vực này.

Đề cập đến việc thay thế các ống và bộ điều chỉnh bị hỏng hoặc mòn, vì khoảng một nửa số tai nạn liên quan đến hệ thống gas khi nấu ăn là do sự rò rỉ gas qua ống cao su. Đảm bảo sử dụng phụ kiện van gas và xilanh phù hợp với loại bình gas để đảm bảo hiệu suất hoạt động của hệ thống.

Cần lắp đặt lỗ thông hơi, ống khói và đường dẫn khí trong nhà để ngăn ngừa các tình huống nguy hiểm như ngộp khí hoặc cháy nổ.

Trong trường hợp thiết bị hoặc đầu đốt LPG không bắt lửa ngay lập tức, cần ngừng cung cấp khí và thông gió trong vài phút. Sau đó, cần vệ sinh sạch sẽ bụi bẩn và thức ăn thừa khỏi bình gas và bếp gas, kiểm tra kết nối dây dẫn gas để xác định nguyên nhân không bắt lửa ở bếp.

Một số dấu hiệu cảnh báo cho thấy hệ thống gas không hoạt động tốt bao gồm: ngọn lửa không sắc nét và chuyển sang màu vàng, cam hoặc đỏ; xuất hiện muội than trên dụng cụ nấu, nồi đen và thức ăn không chín đều hoặc lâu chín hơn bình thường.

Mong rằng với chia sẻ hôm nay của chúng tôi sẽ giúp bạn đọc có thêm kinh nghiệm lắp đặt và bảo trì hệ thống gas hiệu quả.')

INSERT INTO News (img,title,[date],[description]) VALUES ('images/news/4/df.jpg', N'Hệ quả khôn lường khi sử dụng sản phẩm gas kém chất lượng',  GETDATE(), N'Tuy không chỉ ảnh hưởng đến người tiêu dùng, nhưng hàng hóa kém chất lượng còn gây ra những hậu quả tiêu cực đối với các nhà sản xuất uy tín. Điều này dẫn đến sự giảm sút về doanh số, uy tín và mất lòng tin từ phía khách hàng. Vì giá cả của những sản phẩm giả mạo thương hiệu lớn thường rất rẻ, và lời quảng cáo lôi kéo đã lừa dối không ít người tiêu dùng. Do việc sử dụng thường xuyên, những sản phẩm này ảnh hưởng trực tiếp đến sức khỏe của người tiêu dùng. Các loại bếp gas giả có thể được coi như “bom nổ chậm” trong nhà, có khả năng gây ra nguy cơ cháy nổ bất ngờ. Các vấn đề như rò gas và hoen gỉ thường xảy ra. Đặc biệt, bình gas giả xuất hiện ngày càng nhiều trên thị trường, do các kẻ lừa đảo không scrupulous bơm gas thiếu khối lượng để tăng lợi nhuận, hoặc phối trộn khí không đạt tiêu chuẩn, hoặc sử dụng chất cầm thấp do giá rẻ nhằm kiếm lời cao. Tất cả những điều này đều mang theo nguy cơ lớn đối với an toàn của người sử dụng.')

INSERT INTO News (img,title,[date],[description]) VALUES ('images/news/5/df.jpg', N'Những thiết bị gas chuyên dụng',  GETDATE(), N'Bộ tự động ngắt gas: Đây là thiết bị không thể thiếu trong mọi hệ thống gas hiện nay. Chức năng chính của nó là tự động đóng ngắt gas khi phát hiện sự cố rò rỉ. Đầu dò gas: Dùng để phát hiện khí gas nếu có sự rò rỉ, nhằm kích hoạt biện pháp xử lý kịp thời.
Bộ điều khiển trung tâm: Sử dụng để nhận tín hiệu từ đầu dò và kích hoạt báo động cùng với điều khiển van gas.
Van ngắt gas tự động và van điện từ: Thiết bị này tự động đóng ngắt gas khi xảy ra sự cố.
Hệ thống giám sát áp suất: Bao gồm tủ điều khiển trung tâm và đồng hồ đo áp suất.

Van điều áp: Thiết bị này giảm áp suất xuống mức phù hợp để hệ thống gas công nghiệp hoạt động bình thường và tránh tình trạng quá tải.

Ống gas: Dùng để dẫn gas từ bình đến bếp.')


