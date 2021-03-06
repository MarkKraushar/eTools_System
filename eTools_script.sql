USE [master]
GO
/****** Object:  Database [eTools]    Script Date: 04/11/2013 22:20:15 ******/
CREATE DATABASE [eTools] ON  PRIMARY 
( NAME = N'eTools', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\eTools.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eTools_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\eTools_1.LDF' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eTools] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eTools].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eTools] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [eTools] SET ANSI_NULLS OFF
GO
ALTER DATABASE [eTools] SET ANSI_PADDING OFF
GO
ALTER DATABASE [eTools] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [eTools] SET ARITHABORT OFF
GO
ALTER DATABASE [eTools] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [eTools] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [eTools] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [eTools] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [eTools] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [eTools] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [eTools] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [eTools] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [eTools] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [eTools] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [eTools] SET  DISABLE_BROKER
GO
ALTER DATABASE [eTools] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [eTools] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [eTools] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [eTools] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [eTools] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [eTools] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [eTools] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [eTools] SET  READ_WRITE
GO
ALTER DATABASE [eTools] SET RECOVERY FULL
GO
ALTER DATABASE [eTools] SET  MULTI_USER
GO
ALTER DATABASE [eTools] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [eTools] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'eTools', N'ON'
GO
USE [eTools]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 04/11/2013 22:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Position_PositionID] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON
INSERT [dbo].[Position] ([PositionID], [Description]) VALUES (1, N'Owner')
INSERT [dbo].[Position] ([PositionID], [Description]) VALUES (2, N'Executive')
INSERT [dbo].[Position] ([PositionID], [Description]) VALUES (3, N'Store Manger')
INSERT [dbo].[Position] ([PositionID], [Description]) VALUES (4, N'Department Head')
INSERT [dbo].[Position] ([PositionID], [Description]) VALUES (5, N'Associate')
INSERT [dbo].[Position] ([PositionID], [Description]) VALUES (6, N'Technical Support')
SET IDENTITY_INSERT [dbo].[Position] OFF
/****** Object:  Table [dbo].[IDGenerator]    Script Date: 04/11/2013 22:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IDGenerator](
	[KeyField] [varchar](50) NOT NULL,
	[LastValue] [int] NOT NULL,
 CONSTRAINT [PK_IDGenerator_KeyField] PRIMARY KEY CLUSTERED 
(
	[KeyField] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[IDGenerator] ([KeyField], [LastValue]) VALUES (N'OrderNumber', 354)
INSERT [dbo].[IDGenerator] ([KeyField], [LastValue]) VALUES (N'SaleNumber', 471)
/****** Object:  Table [dbo].[Category]    Script Date: 04/11/2013 22:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category_CategoryID] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (1, N'Hand Saw')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (2, N'Power Saw')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (3, N'Hand Drill')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (4, N'Power Drill')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (5, N'Hardware Fasteners')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (6, N'Hardware Nails')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (7, N'Power Kits')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (8, N'Hand Tool')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (9, N'Yard Tool')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (10, N'Yard Equipment')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (11, N'Winter Equipment')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (12, N'Shovels')
INSERT [dbo].[Category] ([CategoryID], [Description]) VALUES (13, N'Sander')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Vendor]    Script Date: 04/11/2013 22:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](100) NOT NULL,
	[Phone] [varchar](12) NOT NULL,
	[Address] [varchar](30) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Province] [char](2) NOT NULL,
	[PostalCode] [char](6) NOT NULL,
 CONSTRAINT [PK_Vendors_VendorID] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Vendor] ON
INSERT [dbo].[Vendor] ([VendorID], [VendorName], [Phone], [Address], [City], [Province], [PostalCode]) VALUES (1, N'HandTools Wholesale', N'780.421.1265', N'11206-106 ST.', N'Edmonton', N'AB', N'T5R6H7')
INSERT [dbo].[Vendor] ([VendorID], [VendorName], [Phone], [Address], [City], [Province], [PostalCode]) VALUES (2, N'Hardware International', N'403.632.5698', N'172 DOWNERS GROVE', N'Calgary', N'AB', N'T3W2D4')
INSERT [dbo].[Vendor] ([VendorID], [VendorName], [Phone], [Address], [City], [Province], [PostalCode]) VALUES (3, N'THOMAS Brown & Sons', N'603.556.1478', N'11206 EMPIRE BUILDING', N'Vancover', N'BC', N'V7U9K7')
INSERT [dbo].[Vendor] ([VendorID], [VendorName], [Phone], [Address], [City], [Province], [PostalCode]) VALUES (4, N'Nuts, Bolts and Fastseners', N'780.693.2255', N'172 Pilot Cres.', N'Camrose', N'AB', N'T8G2D3')
SET IDENTITY_INSERT [dbo].[Vendor] OFF
/****** Object:  StoredProcedure [dbo].[UpdateVendor]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateVendor]
	(
		@vendorid int,
		@vendorname varchar(100),
		@phone varchar(12),
		@address varchar(30),
		@city varchar(50),
		@province char(2),
		@postalcode char(6)
	)
	as
		set @vendorname = LTRIM(rtrim(@vendorname))
		set @phone = LTRIM(rtrim(@phone))
		set @address = LTRIM(rtrim(@address))
		set @city = LTRIM(rtrim(@city))
		if @vendorname = ''
			set @vendorname = null
		if @phone = ''
			set @phone = null
		if @address = ''
			set @address = null
		if @city = ''
			set @city = null
		if not exists(Select vendorid 
						from Vendor
						where VendorID = @vendorid)
		begin
			RaisError('Vvendor does not exist on file.',16,1)
		end
		else
		begin
			Update Vendor
			set VendorName = @vendorname,
				Phone = @phone,
				Address = @address,
				City = @city,
				Province = @province,
				PostalCode = @postalcode
			where VendorID = @vendorid
		end
GO
/****** Object:  Table [dbo].[StockItem]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockItem](
	[StockNumber] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[SellingPrice] [smallmoney] NOT NULL,
	[PurchasePrice] [smallmoney] NOT NULL,
	[QuantityOnHand] [int] NOT NULL,
	[ReOrderLevel] [int] NOT NULL,
	[Discontinued] [char](1) NOT NULL,
	[VendorStockNumber] [varchar](25) NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_StockItem_StockNumber] PRIMARY KEY CLUSTERED 
(
	[StockNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StockItem] ON
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (23, N'Dewalt Multi Speed Drill', 45.6500, 32.4100, 62, 30, N'N', N'1-234-765-9', 4)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (34, N'Dewalt Multi Speed Sander', 49.6500, 38.5600, 15, 25, N'N', N'1-457-903-3', 13)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (35, N'Dewalt Combined Power Set', 152.3600, 115.6900, 50, 40, N'N', N'1-358-345-1', 7)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (82, N'57mm #10 Wood Screws - 100', 12.6900, 6.4500, 1230, 1000, N'N', N'4-12345-9', 5)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (83, N'72mm #10 Wood Screws - 100', 12.9900, 6.7500, 1550, 1000, N'N', N'4-78946-9', 5)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (84, N'87mm #10 Wood Screws - 100', 13.4900, 6.9500, 980, 1000, N'N', N'4-87698-9', 5)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (85, N'102mm #10 Wood Screws - 100', 13.9900, 7.2500, 1340, 1000, N'N', N'4-65748-9', 5)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (87, N'57mm #15 Wood Screws - 100', 12.9900, 6.4500, 790, 1000, N'N', N'4-13579-9', 5)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (88, N'72mm #15 Wood Screws - 100', 13.5900, 6.7500, 653, 1000, N'N', N'4-55566-9', 5)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (89, N'87mm #10 Wood Screws - 100', 13.9900, 6.9500, 1110, 1000, N'N', N'4-88667-9', 5)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (111, N'8.25cm Spiral Wood Spikes - 50', 9.9900, 4.2300, 2629, 2500, N'N', N'4-22456-7', 6)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (234, N'Robi Multi Speed Builders Kit', 139.9900, 95.2300, 46, 30, N'N', N'3-37-5786-988', 7)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (4567, N'65 oz Hammer', 15.9900, 11.7400, 0, 150, N'Y', N'2-876549-98', 8)
INSERT [dbo].[StockItem] ([StockNumber], [Description], [SellingPrice], [PurchasePrice], [QuantityOnHand], [ReOrderLevel], [Discontinued], [VendorStockNumber], [CategoryID]) VALUES (5555, N'Canadian Solid State Stud Finder', 7.9900, 3.6500, 68, 50, N'N', N'2-657483-98', 8)
SET IDENTITY_INSERT [dbo].[StockItem] OFF
/****** Object:  Table [dbo].[Employee]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[DateHired] [datetime] NOT NULL,
	[DateReleased] [datetime] NULL,
	[PositionID] [int] NOT NULL,
	[LoginID] [varchar](30) NULL,
 CONSTRAINT [PK_Employee_EmployeeID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (1, N'Donna', N'Bookem', CAST(0x00007DF800000000 AS DateTime), NULL, 5, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (2, N'Dwanye', N'Energy', CAST(0x0000810A00000000 AS DateTime), NULL, 2, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (3, N'Hess', N'Agonor', CAST(0x000083B500000000 AS DateTime), CAST(0x0000898500000000 AS DateTime), 4, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (4, N'Nole', N'Itall', CAST(0x0000858F00000000 AS DateTime), NULL, 5, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (5, N'Jerry', N'Kan', CAST(0x0000886C00000000 AS DateTime), NULL, 5, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (6, N'Sia', N'Latter', CAST(0x00008A2600000000 AS DateTime), NULL, 5, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (7, N'Hugh', N'Guy', CAST(0x00007D3A00000000 AS DateTime), NULL, 1, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (8, N'Cher', N'Power', CAST(0x00008F4200000000 AS DateTime), CAST(0x0000938100000000 AS DateTime), 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (9, N'Nic', N'Bigguy', CAST(0x0000994E00000000 AS DateTime), NULL, 2, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (10, N'Chip', N'Andale', CAST(0x0000996B00000000 AS DateTime), NULL, 6, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (11, N'Shirley', N'Ujest', CAST(0x000087FC00000000 AS DateTime), CAST(0x0000898500000000 AS DateTime), 5, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (12, N'Oliver', N'Twisted', CAST(0x000089D700000000 AS DateTime), NULL, 5, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (13, N'Iam', N'Smart', CAST(0x0000886C00000000 AS DateTime), NULL, 4, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (14, N'Lowan', N'Behold', CAST(0x00008B8A00000000 AS DateTime), NULL, 6, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [DateHired], [DateReleased], [PositionID], [LoginID]) VALUES (15, N'Neut', N'Pointe', CAST(0x000093A800000000 AS DateTime), NULL, 3, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
/****** Object:  StoredProcedure [dbo].[GetVendors]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetVendors]
	as
	Select VendorID, VendorName, Phone, Address, City, Province, PostalCode
	from vendor
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ReceiveDate] [datetime] NULL,
	[VendorID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[TaxAmount] [money] NOT NULL,
	[SubTotal] [money] NOT NULL,
 CONSTRAINT [PK_PurchaseOrder_OrderNumber] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PurchaseOrder] ([OrderNumber], [OrderDate], [ReceiveDate], [VendorID], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (345, CAST(0x00009EA900B9FC70 AS DateTime), CAST(0x00009EAE00B9FC70 AS DateTime), 1, 13, 230.2700, 4605.4200)
INSERT [dbo].[PurchaseOrder] ([OrderNumber], [OrderDate], [ReceiveDate], [VendorID], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (346, CAST(0x00009EB100B9FC71 AS DateTime), CAST(0x00009EB600B9FC71 AS DateTime), 1, 13, 510.9500, 10219.0500)
INSERT [dbo].[PurchaseOrder] ([OrderNumber], [OrderDate], [ReceiveDate], [VendorID], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (347, CAST(0x00009EB700B9FC71 AS DateTime), CAST(0x00009EBD00B9FC71 AS DateTime), 2, 15, 309.5000, 6189.9500)
INSERT [dbo].[PurchaseOrder] ([OrderNumber], [OrderDate], [ReceiveDate], [VendorID], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (348, CAST(0x00009EBD00B9FC71 AS DateTime), CAST(0x00009EC500B9FC71 AS DateTime), 4, 13, 2186.2500, 43725.0000)
INSERT [dbo].[PurchaseOrder] ([OrderNumber], [OrderDate], [ReceiveDate], [VendorID], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (349, CAST(0x00009EC400B9FC72 AS DateTime), CAST(0x00009EC900B9FC72 AS DateTime), 4, 13, 1069.6300, 21392.5000)
INSERT [dbo].[PurchaseOrder] ([OrderNumber], [OrderDate], [ReceiveDate], [VendorID], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (350, CAST(0x00009ECA00B9FC72 AS DateTime), CAST(0x00009ED000B9FC72 AS DateTime), 1, 15, 595.8900, 11917.7500)
INSERT [dbo].[PurchaseOrder] ([OrderNumber], [OrderDate], [ReceiveDate], [VendorID], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (351, CAST(0x00009ED000B9FC72 AS DateTime), CAST(0x00009ED500B9FC72 AS DateTime), 2, 15, 238.0800, 4761.5000)
INSERT [dbo].[PurchaseOrder] ([OrderNumber], [OrderDate], [ReceiveDate], [VendorID], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (352, CAST(0x00009ED700B9FC72 AS DateTime), CAST(0x00009EDB00B9FC72 AS DateTime), 1, 13, 192.8000, 3856.0000)
INSERT [dbo].[PurchaseOrder] ([OrderNumber], [OrderDate], [ReceiveDate], [VendorID], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (353, CAST(0x00009EDC00B9FC73 AS DateTime), NULL, 4, 13, 2251.2500, 45025.0000)
INSERT [dbo].[PurchaseOrder] ([OrderNumber], [OrderDate], [ReceiveDate], [VendorID], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (354, CAST(0x00009EE100B9FC73 AS DateTime), NULL, 1, 13, 2510.6800, 50213.5000)
/****** Object:  Table [dbo].[Sale]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleNumber] [int] NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[SaleRefund] [char](1) NOT NULL,
	[OriginalSaleNumber] [int] NULL,
	[EmployeeID] [int] NOT NULL,
	[TaxAmount] [smallmoney] NOT NULL,
	[SubTotal] [money] NOT NULL,
 CONSTRAINT [PK_Sale_SaleNumber] PRIMARY KEY CLUSTERED 
(
	[SaleNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sale] ([SaleNumber], [SaleDate], [SaleRefund], [OriginalSaleNumber], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (463, CAST(0x00009EE200B9FC7F AS DateTime), N'S', NULL, 4, 4.6400, 92.8900)
INSERT [dbo].[Sale] ([SaleNumber], [SaleDate], [SaleRefund], [OriginalSaleNumber], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (464, CAST(0x0000A103011CC092 AS DateTime), N'S', NULL, 4, 6.0000, 56.0000)
INSERT [dbo].[Sale] ([SaleNumber], [SaleDate], [SaleRefund], [OriginalSaleNumber], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (465, CAST(0x0000A103011CEB9C AS DateTime), N'S', NULL, 4, 7.0000, 895.0000)
INSERT [dbo].[Sale] ([SaleNumber], [SaleDate], [SaleRefund], [OriginalSaleNumber], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (466, CAST(0x0000A10900F5B120 AS DateTime), N's', NULL, 2, 5.0000, 43.0000)
INSERT [dbo].[Sale] ([SaleNumber], [SaleDate], [SaleRefund], [OriginalSaleNumber], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (467, CAST(0x0000A10901046439 AS DateTime), N'R', 463, 1, 5.0000, 10.0000)
INSERT [dbo].[Sale] ([SaleNumber], [SaleDate], [SaleRefund], [OriginalSaleNumber], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (468, CAST(0x0000A115012762BC AS DateTime), N'S', NULL, 1, 14.6900, 146.9400)
INSERT [dbo].[Sale] ([SaleNumber], [SaleDate], [SaleRefund], [OriginalSaleNumber], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (469, CAST(0x0000A1160121225A AS DateTime), N'S', NULL, 1, 30.4700, 304.7200)
INSERT [dbo].[Sale] ([SaleNumber], [SaleDate], [SaleRefund], [OriginalSaleNumber], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (470, CAST(0x0000A1220156E00D AS DateTime), N'r', 463, 1, 2.4800, 49.6500)
INSERT [dbo].[Sale] ([SaleNumber], [SaleDate], [SaleRefund], [OriginalSaleNumber], [EmployeeID], [TaxAmount], [SubTotal]) VALUES (471, CAST(0x0000A122015C7EE3 AS DateTime), N'R', 463, 1, 0.2500, 5.0000)
/****** Object:  StoredProcedure [dbo].[GetStockItemByStockNumber]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetStockItemByStockNumber] (@stocknumber int = null)
as
if @stocknumber is null
	begin
	raiserror('You must provide a stock number.',16,1)
	end
else
	begin
	select StockNumber, Description, QuantityOnHand, SellingPrice
	from StockItem
	where StockNumber = @stocknumber and Discontinued = 'N'
	end
return
GO
/****** Object:  StoredProcedure [dbo].[GetStockItemByDescription]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetStockItemByDescription] (@searchterm varchar(50) = null)
as
if @searchterm is null
	begin
	raiserror('You must provide a description to search for.',16,1)
	end
else
	begin
	select StockNumber, Description, QuantityOnHand, SellingPrice
	from StockItem
	where Description like '%'+@searchterm+'%' and Discontinued = 'N'
	end
return
GO
/****** Object:  Table [dbo].[SaleDetail]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDetail](
	[SaleNumber] [int] NOT NULL,
	[StockNumber] [int] NOT NULL,
	[SellingPrice] [smallmoney] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_SaleDetail_SaleNumberStockNumber] PRIMARY KEY CLUSTERED 
(
	[SaleNumber] ASC,
	[StockNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (463, 34, 32.4100, 1)
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (463, 83, 12.9900, 1)
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (463, 5555, 7.9900, 10)
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (464, 23, 5.0000, 4)
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (464, 83, 12.9900, 1)
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (467, 5555, 7.9900, 2)
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (468, 23, 45.6500, 3)
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (468, 111, 9.9900, 1)
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (469, 35, 152.3600, 2)
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (470, 34, 49.6500, 1)
INSERT [dbo].[SaleDetail] ([SaleNumber], [StockNumber], [SellingPrice], [Quantity]) VALUES (471, 83, 5.0000, 1)
/****** Object:  StoredProcedure [dbo].[CreateSale]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CreateSale] (@salerefund char(1) = null,
							@originalsalenumber int = null,
							@taxamount smallmoney = null,
							@subtotal money = null)
as
if @salerefund is null or @taxamount is null or @subtotal is null
	begin
	raiserror('You must provide a Sale/Refund indicator, EmployeeID, Tax Amount and Sub Total.',16,1)
	end
else
Begin
	Begin Transaction
	declare @lastsalenumber int
	declare @salenumber int
	declare @saledate datetime
	declare @transbool bit
	set @transbool = 1
	
	select @lastsalenumber = LastValue from IDGenerator where KeyField = 'SaleNumber'
	set @salenumber = @lastsalenumber + 1
	set @saledate = GETDATE()
	
	update IDGenerator
	set LastValue = @salenumber
	where KeyField = 'SaleNumber'
		if @@ERROR <> 0
		Begin
		Raiserror ('Sale Creation failed.',16,1)
		set @transbool = 0
		end
	
	insert into Sale (SaleNumber, SaleDate, SaleRefund, OriginalSaleNumber, EmployeeID, TaxAmount, SubTotal)
	values (@salenumber, @saledate, @salerefund, @originalsalenumber, 1, @taxamount, @subtotal)
		if @@ERROR <> 0
		Begin
		Raiserror ('Sale Creation failed.',16,1)
		set @transbool = 0
		end
	
	if @transbool = 0
		Begin
		Raiserror ('Sale Creation failed.',16,1)
		Rollback Transaction
		End
	else
		Begin
		Commit Transaction
		End
	End
Return

select * from Sale
select * from IDGenerator
select * from Employee
GO
/****** Object:  Table [dbo].[PurchaseOrderDetail]    Script Date: 04/11/2013 22:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetail](
	[OrderNumber] [int] NOT NULL,
	[StockNumber] [int] NOT NULL,
	[PurchasePrice] [smallmoney] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_PurchaseOrderDetail_OrderNumberStockNumber] PRIMARY KEY CLUSTERED 
(
	[OrderNumber] ASC,
	[StockNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (345, 23, 32.4100, 60)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (345, 34, 38.5600, 15)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (345, 35, 115.6900, 18)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (346, 34, 38.5600, 70)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (346, 35, 115.6900, 65)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (347, 234, 95.2300, 65)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (348, 82, 6.4500, 2000)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (348, 83, 6.7500, 2000)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (348, 85, 7.2500, 1500)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (348, 87, 6.4500, 1000)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (349, 85, 7.2500, 2000)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (349, 111, 4.2300, 1500)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (349, 5555, 3.6500, 150)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (350, 23, 32.4100, 100)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (350, 35, 115.6900, 75)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (351, 234, 95.2300, 50)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (352, 34, 38.5600, 100)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (353, 82, 6.4500, 1250)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (353, 83, 6.7500, 1800)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (353, 84, 6.9500, 1300)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (353, 85, 7.2500, 2000)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (353, 5555, 3.6500, 350)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (354, 23, 32.4100, 300)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (354, 34, 38.5600, 300)
INSERT [dbo].[PurchaseOrderDetail] ([OrderNumber], [StockNumber], [PurchasePrice], [Quantity]) VALUES (354, 35, 115.6900, 250)
/****** Object:  View [dbo].[InventoryUnitsOnOrder]    Script Date: 04/11/2013 22:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[InventoryUnitsOnOrder]
as
SELECT     PurchaseOrderDetail.StockNumber, SUM(PurchaseOrderDetail.Quantity) 
                      AS UnitsOnOrder
FROM         PurchaseOrderDetail INNER JOIN
                      PurchaseOrder ON PurchaseOrderDetail.OrderNumber = PurchaseOrder.OrderNumber 
WHERE     (PurchaseOrderDetail.OrderNumber IN
                          (SELECT DISTINCT OrderNumber
                            FROM          PurchaseOrder 
                            WHERE      (ReceiveDate IS NULL)))
GROUP BY PurchaseOrderDetail.StockNumber
GO
/****** Object:  StoredProcedure [dbo].[GetSaleDetailsBySaleNumber]    Script Date: 04/11/2013 22:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSaleDetailsBySaleNumber] (@salenumber int = null)
as
If @salenumber is null
	Begin
	raiserror('You must provide a sale number.',16,1)
	End
Else
If @salenumber not in (Select SaleNumber from Sale)
	Begin
	raiserror('Sale does not exist.',16,1)
	End
Else
	Begin
	Select SaleDetail.StockNumber, Description, SaleDetail.SellingPrice, Quantity from Sale inner join SaleDetail
	on sale.SaleNumber = SaleDetail.SaleNumber inner join StockItem
	on SaleDetail.StockNumber = StockItem.StockNumber
	where SaleDetail.SaleNumber = @salenumber and UPPER(SaleRefund) = 'S'
	End
Return
GO
/****** Object:  StoredProcedure [dbo].[GetReturnDetailsByOriginalSaleNumber]    Script Date: 04/11/2013 22:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetReturnDetailsByOriginalSaleNumber] (@originalsalenumber int = null)
as
If @originalsalenumber is null
	Begin
	raiserror('You must provide an original sale number.',16,1)
	End
Else
If @originalsalenumber not in (Select OriginalSaleNumber from Sale)
	Begin
	raiserror('Sale does not exist.',16,1)
	End
Else
	Begin
	Select SaleDetail.StockNumber, Sale.SaleDate, Quantity from Sale inner join SaleDetail
	on sale.SaleNumber = SaleDetail.SaleNumber inner join StockItem
	on SaleDetail.StockNumber = StockItem.StockNumber
	where OriginalSaleNumber = @originalsalenumber
	End
Return
GO
/****** Object:  StoredProcedure [dbo].[CreateSaleDetail]    Script Date: 04/11/2013 22:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CreateSaleDetail] (@stocknumber int = null,
								  @sellingprice smallmoney = null,
								  @quantity int = null)
as
If @stocknumber is null or @sellingprice is null or @quantity is null
	Begin
	raiserror('You must provide a stocknumber, salenumber, sellingprice and quantity',16,1)
	End
Else
	If @stocknumber not in (select Stocknumber from StockItem)
	Begin
	raiserror('That stock number does not exist.',16,1)
	End
Else
	Begin
	Begin Transaction
	declare @transbool bit
	set @transbool = 1
	declare @stockQuantity int
	select @stockQuantity = QuantityOnHand from StockItem where StockNumber = @stocknumber
	declare @currentsalenumber int
	select @currentsalenumber = LastValue from IDGenerator where KeyField = 'SaleNumber'

	insert into SaleDetail (SaleNumber, StockNumber, SellingPrice, Quantity)
	values (@currentsalenumber, @stocknumber, @sellingprice, @quantity)
	if @@ERROR<>0
		Begin
		Raiserror('SaleDetail creation failed',16,1)
		set @transbool = 0
		End
	
	if @stockQuantity >= @quantity
	Begin
	update StockItem
	set QuantityOnHand = @stockQuantity - @quantity
	where StockNumber = @stocknumber
	if @@ERROR<>0
		Begin
		Raiserror('Stock not updated.',16,1)
		set @transbool = 0
		End
	End
	Else
		Begin
		Raiserror('Not enough of that item in stock.',16,1)
		set @transbool = 0
		End
	
	Begin
	if @transbool = 0
		Begin
		Raiserror('Transaction failed.',16,1)
		Rollback Transaction
		End
	else
		Begin
		Commit Transaction
		End
	End
End
Return
GO
/****** Object:  StoredProcedure [dbo].[CreateReturnDetail]    Script Date: 04/11/2013 22:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CreateReturnDetail] (@stocknumber int = null,
								    @returnprice smallmoney = null,
								    @quantity int = null)
as
If @stocknumber is null or @returnprice is null or @quantity is null
	Begin
	raiserror('You must provide a stocknumber, salenumber, sellingprice and quantity',16,1)
	End
Else
	If @stocknumber not in (select Stocknumber from StockItem)
	Begin
	raiserror('That stock number does not exist.',16,1)
	End
Else
	Begin
	Begin Transaction
	declare @transbool bit
	set @transbool = 1
	declare @stockQuantity int
	select @stockQuantity = QuantityOnHand from StockItem where StockNumber = @stocknumber
	declare @currentsalenumber int
	select @currentsalenumber = LastValue from IDGenerator where KeyField = 'SaleNumber'
	declare @originalsalenumber int
	select @originalsalenumber = OriginalSaleNumber from Sale where SaleNumber = @currentsalenumber

	insert into SaleDetail (SaleNumber, StockNumber, SellingPrice, Quantity)
	values (@currentsalenumber, @stocknumber, @returnprice, @quantity)
	if @@ERROR<>0
		Begin
		Raiserror('SaleDetail creation failed',16,1)
		set @transbool = 0
		End
	Else
	
	if @stocknumber not in (Select Stocknumber from SaleDetail where SaleNumber = @OriginalSaleNumber)
		Begin
		Raiserror('Item not on original Sale.',16,1)
		set @transbool = 0
		End
	else
		Begin
		update StockItem
		set QuantityOnHand = @stockQuantity + @quantity
		where StockNumber = @stocknumber
		if @@ERROR<>0
			Begin
			Raiserror('Stock not updated.',16,1)
			set @transbool = 0
			End
		End
		
	Begin
	if @transbool = 0
		Begin
		Raiserror('Transaction failed.',16,1)
		Rollback Transaction
		End
	else
		Begin
		Commit Transaction
		End
	End
End
Return
GO
/****** Object:  Default [DF__StockItem__Disco__117F9D94]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[StockItem] ADD  DEFAULT ('N') FOR [Discontinued]
GO
/****** Object:  Default [DF__PurchaseO__Order__239E4DCF]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[PurchaseOrder] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
/****** Object:  Default [DF__Sale__SaleDate__164452B1]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[Sale] ADD  DEFAULT (getdate()) FOR [SaleDate]
GO
/****** Object:  Default [DF__Sale__SaleRefund__173876EA]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[Sale] ADD  DEFAULT ('S') FOR [SaleRefund]
GO
/****** Object:  Check [CK_IDGenerator_LastValue]    Script Date: 04/11/2013 22:20:16 ******/
ALTER TABLE [dbo].[IDGenerator]  WITH CHECK ADD  CONSTRAINT [CK_IDGenerator_LastValue] CHECK  (([LastValue]>=(0)))
GO
ALTER TABLE [dbo].[IDGenerator] CHECK CONSTRAINT [CK_IDGenerator_LastValue]
GO
/****** Object:  Check [CK_Vendor_Phone]    Script Date: 04/11/2013 22:20:16 ******/
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [CK_Vendor_Phone] CHECK  (([Phone] like '[1-9][0-9][0-9].[1-9][0-9][0-9].[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [CK_Vendor_Phone]
GO
/****** Object:  Check [CK_Vendor_PostalCode]    Script Date: 04/11/2013 22:20:16 ******/
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [CK_Vendor_PostalCode] CHECK  (([Postalcode] like '[A-Z][0-9][A-Z][0-9][A-Z][0-9]'))
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [CK_Vendor_PostalCode]
GO
/****** Object:  Check [CK_Vendor_Province]    Script Date: 04/11/2013 22:20:16 ******/
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [CK_Vendor_Province] CHECK  (([Province]='BC' OR [Province]='AB' OR [Province]='SK' OR [Province]='MB' OR [Province]='ON' OR [Province]='QU' OR [Province]='NB' OR [Province]='NS' OR [Province]='PE' OR [Province]='NL' OR [Province]='YK'))
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [CK_Vendor_Province]
GO
/****** Object:  Check [CK_StockItem_Discontinued]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[StockItem]  WITH CHECK ADD  CONSTRAINT [CK_StockItem_Discontinued] CHECK  (([Discontinued]='Y' OR [Discontinued]='N'))
GO
ALTER TABLE [dbo].[StockItem] CHECK CONSTRAINT [CK_StockItem_Discontinued]
GO
/****** Object:  Check [CK_StockItem_QuantityOnHand]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[StockItem]  WITH CHECK ADD  CONSTRAINT [CK_StockItem_QuantityOnHand] CHECK  (([QuantityOnHand]>=(0)))
GO
ALTER TABLE [dbo].[StockItem] CHECK CONSTRAINT [CK_StockItem_QuantityOnHand]
GO
/****** Object:  Check [CK_StockItem_ReOrderLevel]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[StockItem]  WITH CHECK ADD  CONSTRAINT [CK_StockItem_ReOrderLevel] CHECK  (([ReOrderLevel]>=(0)))
GO
ALTER TABLE [dbo].[StockItem] CHECK CONSTRAINT [CK_StockItem_ReOrderLevel]
GO
/****** Object:  Check [StockItem_PurchasePrice]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[StockItem]  WITH CHECK ADD  CONSTRAINT [StockItem_PurchasePrice] CHECK  (([PurchasePrice]>=(0.00)))
GO
ALTER TABLE [dbo].[StockItem] CHECK CONSTRAINT [StockItem_PurchasePrice]
GO
/****** Object:  Check [StockItem_SellingPrice]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[StockItem]  WITH CHECK ADD  CONSTRAINT [StockItem_SellingPrice] CHECK  (([SellingPrice]>=(0.00)))
GO
ALTER TABLE [dbo].[StockItem] CHECK CONSTRAINT [StockItem_SellingPrice]
GO
/****** Object:  Check [CK_Purchase_SubTotal]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [CK_Purchase_SubTotal] CHECK  (([SubTotal]>=(0.00)))
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [CK_Purchase_SubTotal]
GO
/****** Object:  Check [CK_Purchase_TaxAmount]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [CK_Purchase_TaxAmount] CHECK  (([TaxAmount]>=(0.00)))
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [CK_Purchase_TaxAmount]
GO
/****** Object:  Check [CK_Sale_SaleRefund]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [CK_Sale_SaleRefund] CHECK  (([SaleRefund]='S' OR [SaleRefund]='R'))
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [CK_Sale_SaleRefund]
GO
/****** Object:  Check [CK_Sale_SubTotal]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [CK_Sale_SubTotal] CHECK  (([SubTotal]>=(0.00)))
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [CK_Sale_SubTotal]
GO
/****** Object:  Check [CK_Sale_TaxAmount]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [CK_Sale_TaxAmount] CHECK  (([TaxAmount]>=(0.00)))
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [CK_Sale_TaxAmount]
GO
/****** Object:  Check [CK_SaleDetail_Quantity]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[SaleDetail]  WITH CHECK ADD  CONSTRAINT [CK_SaleDetail_Quantity] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[SaleDetail] CHECK CONSTRAINT [CK_SaleDetail_Quantity]
GO
/****** Object:  Check [CK_SaleDetail_SellingPrice]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[SaleDetail]  WITH CHECK ADD  CONSTRAINT [CK_SaleDetail_SellingPrice] CHECK  (([SellingPrice]>=(0.00)))
GO
ALTER TABLE [dbo].[SaleDetail] CHECK CONSTRAINT [CK_SaleDetail_SellingPrice]
GO
/****** Object:  Check [CK_PurchaseOrderDetail_PurchasePrice]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [CK_PurchaseOrderDetail_PurchasePrice] CHECK  (([PurchasePrice]>=(0.00)))
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [CK_PurchaseOrderDetail_PurchasePrice]
GO
/****** Object:  Check [CK_PurchaseOrderDetail_Quantity]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [CK_PurchaseOrderDetail_Quantity] CHECK  (([Quantity]>=(0.00)))
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [CK_PurchaseOrderDetail_Quantity]
GO
/****** Object:  ForeignKey [FK_StockItemCategory_CategoryID]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[StockItem]  WITH CHECK ADD  CONSTRAINT [FK_StockItemCategory_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[StockItem] CHECK CONSTRAINT [FK_StockItemCategory_CategoryID]
GO
/****** Object:  ForeignKey [FK_EmployeePosition_PositionID]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePosition_PositionID] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_EmployeePosition_PositionID]
GO
/****** Object:  ForeignKey [FK_PurchaseEmployee_EmployeeID]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseEmployee_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseEmployee_EmployeeID]
GO
/****** Object:  ForeignKey [FK_PurchaseVendor_VendorID]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseVendor_VendorID] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseVendor_VendorID]
GO
/****** Object:  ForeignKey [FK_SaleEmployee_EmployeeID]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_SaleEmployee_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_SaleEmployee_EmployeeID]
GO
/****** Object:  ForeignKey [FK_SaleDetailSale_SaleNumber]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[SaleDetail]  WITH CHECK ADD  CONSTRAINT [FK_SaleDetailSale_SaleNumber] FOREIGN KEY([SaleNumber])
REFERENCES [dbo].[Sale] ([SaleNumber])
GO
ALTER TABLE [dbo].[SaleDetail] CHECK CONSTRAINT [FK_SaleDetailSale_SaleNumber]
GO
/****** Object:  ForeignKey [FK_SaleDetailStockItem_StockNumber]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[SaleDetail]  WITH CHECK ADD  CONSTRAINT [FK_SaleDetailStockItem_StockNumber] FOREIGN KEY([StockNumber])
REFERENCES [dbo].[StockItem] ([StockNumber])
GO
ALTER TABLE [dbo].[SaleDetail] CHECK CONSTRAINT [FK_SaleDetailStockItem_StockNumber]
GO
/****** Object:  ForeignKey [FK_PurchaseOrderDetailPurchaseOrder_OrderNumber]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetailPurchaseOrder_OrderNumber] FOREIGN KEY([OrderNumber])
REFERENCES [dbo].[PurchaseOrder] ([OrderNumber])
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetailPurchaseOrder_OrderNumber]
GO
/****** Object:  ForeignKey [FK_PurchaseOrderDetailStockItem_StockNumber]    Script Date: 04/11/2013 22:20:18 ******/
ALTER TABLE [dbo].[PurchaseOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetailStockItem_StockNumber] FOREIGN KEY([StockNumber])
REFERENCES [dbo].[StockItem] ([StockNumber])
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetailStockItem_StockNumber]
GO
