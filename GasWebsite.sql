CREATE DATABASE GasWebsite
Use GasWebsite
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
		[description] [ntext] NULL,
		[categoryID] [int] NULL,
		[supplierId] [int] NULL,
		[isActive] [bit] NULL,
		[unitPrice] [money] NULL,
		[image] varchar(max) NULL,
		[stockQuantity] [int] NULL,
		[unitOnOrders] [int] NULL,
		[createdDate] [datetime] NULL,
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
