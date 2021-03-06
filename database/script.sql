USE [Clothing_Web]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 12/10/2021 16:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[totalMoney] [float] NULL,
	[customer_id] [int] NULL,
	[productsize_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/10/2021 16:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/10/2021 16:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NULL,
	[isActive] [bit] NULL,
	[isAdmin] [bit] NULL,
	[name] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/10/2021 16:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[totalMoney] [float] NULL,
	[order_id] [int] NULL,
	[productsize_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/10/2021 16:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [varchar](255) NULL,
	[totalMoney] [float] NULL,
	[customer_id] [int] NULL,
	[adddress] [varchar](255) NULL,
 CONSTRAINT [PK__Orders__3213E83FDB995F18] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/10/2021 16:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[discount] [float] NULL,
	[image] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[salePrice] [float] NULL,
	[unitPrice] [float] NULL,
	[viewCount] [int] NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsSizes]    Script Date: 12/10/2021 16:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsSizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[size_id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 12/10/2021 16:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmallPhotos]    Script Date: 12/10/2021 16:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmallPhotos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [varchar](255) NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([id], [quantity], [totalMoney], [customer_id], [productsize_id]) VALUES (2022, 1, 135000, 4, 1007)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Shirt')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Pant')
INSERT [dbo].[Categories] ([id], [name]) VALUES (1002, N'Shoes')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([id], [email], [isActive], [isAdmin], [name], [password], [phone]) VALUES (1, N'huynhngoccanh3010@gmail.com', 1, 0, N'canh', N'123', N'0564355691')
INSERT [dbo].[Customers] ([id], [email], [isActive], [isAdmin], [name], [password], [phone]) VALUES (3, N'nguyentrungpbc2000@gmail.com', 1, 1, N'nguyen', N'123', N'0383747578')
INSERT [dbo].[Customers] ([id], [email], [isActive], [isAdmin], [name], [password], [phone]) VALUES (4, N'n18dccn017@student.ptithcm.edu.vn', 1, 1, N'Huynh Canh', N'123', N'0564355691')
INSERT [dbo].[Customers] ([id], [email], [isActive], [isAdmin], [name], [password], [phone]) VALUES (5, N'bingbang004@gmail.com', 1, 0, N'Anh Tu', N'123', N'0333054989')
INSERT [dbo].[Customers] ([id], [email], [isActive], [isAdmin], [name], [password], [phone]) VALUES (7, N'', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (11, 1, 135000, 3, 1007)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (12, 1, 180000, 4, 1011)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (13, 1, 135000, 5, 1007)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (14, 1, 180000, 5, 1011)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (15, 1, 135000, 6, 1010)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (16, 3, 540000, 6, 1012)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (17, 4, 540000, 7, 1009)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (18, 2, 270000, 8, 1009)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (19, 10, 1350000, 9, 1007)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (20, 10, 1350000, 10, 1007)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (21, 1, 135000, 11, 1007)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (22, 6, 810000, 12, 1007)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (23, 10, 1350000, 13, 1)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (24, 10, 1350000, 14, 1)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (25, 10, 1800000, 14, 1014)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (26, 10, 1800000, 13, 1014)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (27, 10, 1350000, 15, 1)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (28, 10, 1800000, 15, 1013)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (29, 10, 1350000, 16, 1010)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (30, 10, 1350000, 17, 1)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (31, 10, 1800000, 17, 1013)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (1018, 1, 135000, 1008, 1007)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (1019, 2, 360000, 1008, 1014)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (1020, 10, 1350000, 1009, 1010)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (1021, 20, 3600000, 1009, 1011)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (1022, 10, 1120000, 1009, 2049)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (1023, 30, 3600000, 1009, 2008)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (1024, 5, 100000, 1010, 2042)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (1025, 20, 3600000, 1010, 2)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (2018, 5, 100000, 2008, 2042)
INSERT [dbo].[OrderDetails] ([id], [quantity], [totalMoney], [order_id], [productsize_id]) VALUES (2019, 5, 600000, 2008, 2011)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (3, N'Fri Oct 29 01:48:29 ICT 2021', 135000, 1, N'97 Man Thien Street - Hiep Phu Ward - Ho Chi Minh City')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (4, N'Fri Oct 29 01:49:53 ICT 2021', 180000, 1, N'11 Nguy?n Ðình Chi?u, Ða Kao, Qu?n 1, Thành ph? H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (5, N'Fri Oct 29 03:56:00 ICT 2021', 315000, 1, N'97 Man Thien Street - Hiep Phu Ward - Ho Chi Minh City')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (6, N'Sun Oct 31 18:17:19 ICT 2021', 675000, 1, N'97 Man Thien Street - Hiep Phu Ward - Ho Chi Minh City')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (7, N'Sun Nov 07 08:42:28 ICT 2021', 540000, 5, N'320/57/5 Nguy?n H?i, T? 13, Khu ph? 3')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (8, N'Wed Dec 01 20:07:55 ICT 2021', 270000, 1, N'63 Vu Tông Phan, An Phú, Qu?n 2, H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (9, N'Wed Dec 01 20:39:24 ICT 2021', 1350000, 1, N'63 Vu Tông Phan, An Phú, Qu?n 2, H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (10, N'Wed Dec 01 20:40:58 ICT 2021', 1350000, 1, N'63 Vu Tông Phan, An Phú, Qu?n 2, H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (11, N'Wed Dec 01 20:42:34 ICT 2021', 135000, 1, N'63 Vu Tông Phan, An Phú, Qu?n 2, H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (12, N'Wed Dec 01 20:52:35 ICT 2021', 810000, 1, N'63 Vu Tông Phan, An Phú, Qu?n 2, H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (13, N'Wed Dec 01 21:13:44 ICT 2021', 3150000, 1, N'63 Vu Tông Phan, An Phú, Qu?n 2, H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (14, N'Wed Dec 01 21:13:44 ICT 2021', 3150000, 1, N'63 Vu Tông Phan, An Phú, Qu?n 2, H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (15, N'Wed Dec 01 21:14:59 ICT 2021', 3150000, 1, N'63 Vu Tông Phan, An Phú, Qu?n 2, H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (16, N'Wed Dec 01 21:15:55 ICT 2021', 1350000, 1, N'63 Vu Tông Phan, An Phú, Qu?n 2, H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (17, N'Wed Dec 01 21:27:53 ICT 2021', 3150000, 1, N'63 Vu Tông Phan, An Phú, Qu?n 2, H? Chí Minh')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (1008, N'Wed Dec 08 18:30:45 ICT 2021', 495000, 1, N'97 man thien')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (1009, N'Wed Dec 08 21:09:16 ICT 2021', 9670000, 1, N'97 man thien')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (1010, N'Wed Dec 08 21:12:20 ICT 2021', 3700000, 1, N'97 man thien')
INSERT [dbo].[Orders] ([id], [orderDate], [totalMoney], [customer_id], [adddress]) VALUES (2008, N'Fri Dec 10 16:33:05 ICT 2021', 700000, 1, N'97 man thien')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [description], [discount], [image], [name], [salePrice], [unitPrice], [viewCount], [category_id]) VALUES (1, N'
cotton fabric and waterproof', 10, N'product-1.jpg', N'Red Shirt', 150000, 100000, 1, 1)
INSERT [dbo].[Products] ([id], [description], [discount], [image], [name], [salePrice], [unitPrice], [viewCount], [category_id]) VALUES (2, N'
cotton fabric and waterproof', 10, N'product-3.jpg', N'Long Pant', 200000, 120000, 1, 2)
INSERT [dbo].[Products] ([id], [description], [discount], [image], [name], [salePrice], [unitPrice], [viewCount], [category_id]) VALUES (3, N'
cotton fabric and waterproof', 20, N'product-6.jpg', N'Green Shirt', 140000, 100000, 1, 1)
INSERT [dbo].[Products] ([id], [description], [discount], [image], [name], [salePrice], [unitPrice], [viewCount], [category_id]) VALUES (1002, N'
cotton fabric and waterproof', 0, N'product-2.jpg', N'Black Shoes', 120000, 70000, 1, 1002)
INSERT [dbo].[Products] ([id], [description], [discount], [image], [name], [salePrice], [unitPrice], [viewCount], [category_id]) VALUES (1003, N'
cotton fabric and waterproof', 20, N'product-4.jpg', N'Purple Shirt', 170000, 100000, 1, 1)
INSERT [dbo].[Products] ([id], [description], [discount], [image], [name], [salePrice], [unitPrice], [viewCount], [category_id]) VALUES (1004, N'
cotton fabric and waterproof', 25, N'product-5.jpg', N'White Shoes', 200000, 100000, 1, 1002)
INSERT [dbo].[Products] ([id], [description], [discount], [image], [name], [salePrice], [unitPrice], [viewCount], [category_id]) VALUES (1006, N'
cotton fabric and waterproof', 5, N'product-10.jpg', N'Black Shoes', 350000, 170000, 1, 1002)
INSERT [dbo].[Products] ([id], [description], [discount], [image], [name], [salePrice], [unitPrice], [viewCount], [category_id]) VALUES (1007, N'
cotton fabric and waterproof', 10, N'product-12.jpg', N'Black Long Pant', 120000, 70000, 1, 2)
INSERT [dbo].[Products] ([id], [description], [discount], [image], [name], [salePrice], [unitPrice], [viewCount], [category_id]) VALUES (1008, N'kute', 0, N'product-7.jpg', N'Sock', 20000, 10000, 1, 1002)
INSERT [dbo].[Products] ([id], [description], [discount], [image], [name], [salePrice], [unitPrice], [viewCount], [category_id]) VALUES (1009, N'
cotton fabric and waterproof', 15, N'product-11.jpg', N'Gray Shoes', 250000, 200000, 1, 1002)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductsSizes] ON 

INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (1, 1, 2, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2, 2, 3, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (1007, 1, 1, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (1008, 1, 3, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (1009, 1, 4, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (1010, 1, 5, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (1011, 2, 1, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (1012, 2, 2, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (1013, 2, 4, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (1014, 2, 5, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2003, 1002, 1, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2008, 1002, 2, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2009, 1002, 3, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2010, 1002, 4, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2011, 1002, 5, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2016, 1003, 1, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2017, 1003, 2, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2018, 1003, 3, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2019, 1003, 4, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2020, 1003, 5, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2021, 1004, 1, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2022, 1004, 2, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2023, 1004, 3, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2024, 1004, 4, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2025, 1004, 5, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2029, 1006, 1, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2030, 1006, 2, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2031, 1006, 3, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2032, 1006, 4, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2033, 1006, 5, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2034, 1007, 1, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2035, 1007, 2, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2036, 1007, 3, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2037, 1007, 4, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2038, 1007, 5, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2039, 1008, 1, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2040, 1008, 2, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2041, 1008, 3, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2042, 1008, 4, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2043, 1008, 5, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2044, 1009, 1, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2045, 1009, 2, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2046, 1009, 3, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2047, 1009, 4, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2048, 1009, 5, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2049, 3, 1, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2050, 3, 2, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2051, 3, 3, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2052, 3, 4, 100)
INSERT [dbo].[ProductsSizes] ([id], [product_id], [size_id], [quantity]) VALUES (2053, 3, 5, 100)
SET IDENTITY_INSERT [dbo].[ProductsSizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([id], [name]) VALUES (1, N'S')
INSERT [dbo].[Sizes] ([id], [name]) VALUES (2, N'M')
INSERT [dbo].[Sizes] ([id], [name]) VALUES (3, N'L')
INSERT [dbo].[Sizes] ([id], [name]) VALUES (4, N'XL')
INSERT [dbo].[Sizes] ([id], [name]) VALUES (5, N'XXL')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[SmallPhotos] ON 

INSERT [dbo].[SmallPhotos] ([id], [photo], [product_id]) VALUES (1, N'product-1-1.jpg', 1)
INSERT [dbo].[SmallPhotos] ([id], [photo], [product_id]) VALUES (2, N'product-1-2.jpg', 1)
INSERT [dbo].[SmallPhotos] ([id], [photo], [product_id]) VALUES (3, N'product-1-3.jpg', 1)
INSERT [dbo].[SmallPhotos] ([id], [photo], [product_id]) VALUES (4, N'product-1-4.jpg', 1)
SET IDENTITY_INSERT [dbo].[SmallPhotos] OFF
GO
/****** Object:  Index [UK_gx7lon3lpvtu0w0ves0ikwp63]    Script Date: 12/10/2021 16:35:56 ******/
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [UK_gx7lon3lpvtu0w0ves0ikwp63] UNIQUE NONCLUSTERED 
(
	[customer_id] ASC,
	[productsize_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_81beos46prgefk70wc9mgyp3f]    Script Date: 12/10/2021 16:35:56 ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [UK_81beos46prgefk70wc9mgyp3f] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_aovjwrtly1n8heqqxdpvgrxfv]    Script Date: 12/10/2021 16:35:56 ******/
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [UK_aovjwrtly1n8heqqxdpvgrxfv] UNIQUE NONCLUSTERED 
(
	[order_id] ASC,
	[productsize_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_mws2lwuqv9yuaq4qfs2bwwwl1]    Script Date: 12/10/2021 16:35:56 ******/
ALTER TABLE [dbo].[ProductsSizes] ADD  CONSTRAINT [UK_mws2lwuqv9yuaq4qfs2bwwwl1] UNIQUE NONCLUSTERED 
(
	[size_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_2wf8itbafq1aj60yaes9nvbj1] FOREIGN KEY([productsize_id])
REFERENCES [dbo].[ProductsSizes] ([id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_2wf8itbafq1aj60yaes9nvbj1]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_mhsc9rwrj7df4wd7wis2f6w9e] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_mhsc9rwrj7df4wd7wis2f6w9e]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_di5swskkf5c3hdnmln8noadc2] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_di5swskkf5c3hdnmln8noadc2]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_sx8ai3og6nyas6x0ej9ktdd74] FOREIGN KEY([productsize_id])
REFERENCES [dbo].[ProductsSizes] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_sx8ai3og6nyas6x0ej9ktdd74]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_hi1sbt52iwcwwk2g3bck4hekx] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_hi1sbt52iwcwwk2g3bck4hekx]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_mwube1yf7h9h1jsulbgdo8u0x] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_mwube1yf7h9h1jsulbgdo8u0x]
GO
ALTER TABLE [dbo].[ProductsSizes]  WITH CHECK ADD  CONSTRAINT [FK_3ikk3hpwp26aa8fcvx36cgjxe] FOREIGN KEY([size_id])
REFERENCES [dbo].[Sizes] ([id])
GO
ALTER TABLE [dbo].[ProductsSizes] CHECK CONSTRAINT [FK_3ikk3hpwp26aa8fcvx36cgjxe]
GO
ALTER TABLE [dbo].[ProductsSizes]  WITH CHECK ADD  CONSTRAINT [FK_75gxpg4jw5afm0pyvauc9g3qr] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductsSizes] CHECK CONSTRAINT [FK_75gxpg4jw5afm0pyvauc9g3qr]
GO
ALTER TABLE [dbo].[SmallPhotos]  WITH CHECK ADD  CONSTRAINT [FK_q6xkgwy5ko9e0rl45jvbijh3g] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[SmallPhotos] CHECK CONSTRAINT [FK_q6xkgwy5ko9e0rl45jvbijh3g]
GO
