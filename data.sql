-- DROP DATABASE ONLINESHOP_1
-- CREATE DATABASE ONLINESHOP_1
-- USE ONLINESHOP_1


CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Password] varchar(20) NOT NULL,
	[Name] nvarchar(30) NULL,
	[Phone] varchar(24) NULL,
	[Email] varchar(255) NULL UNIQUE,
	[isAdmin] bit NULL,
CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED (UserID)
)


CREATE TABLE Categories(
	[CategoryID] int IDENTITY(1,1) PRIMARY KEY,
	[CategoryName] nvarchar(15) NOT NULL,
	[Picture] nvarchar(100) NULL
 )

CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NULL,
	[CategoryID] [int] NULL,
	[Price] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[Brand] [nvarchar](30) NULL,
	[ProductDetail] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED (ProductID),
 CONSTRAINT FK_Products FOREIGN KEY (categoryID) REFERENCES Categories(CategoryID)
 )



CREATE TABLE [dbo].[ProductImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ImagePath] [nvarchar](100) NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED (ImageID),
 CONSTRAINT [FK_ProductImages_Products] FOREIGN KEY([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
)


CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipAddress] [nvarchar](60) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED (OrderID),
 CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID]) REFERENCES [dbo].[Users] ([UserID])
)


CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED (OrderID),
 CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID]) REFERENCES [dbo].[Orders] ([OrderID]),
 CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
 )


CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [int] IDENTITY(1,1) PRIMARY KEY,
	[ProductID] [int] NOT NULL,
	[Content] nvarchar(max) NOT NULL,
	[UserID] [int] NOT NULL,
	[Star] [int] NOT NULL,
	[CreatedAt] [date] NULL,
CONSTRAINT [FK_Feedbacks_Products] FOREIGN KEY([ProductID]) REFERENCES [dbo].[Products] ([ProductID]),
CONSTRAINT [FK_Feedbacks_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
)


CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [nvarchar](200)NOT NULL,
	[Message] [nvarchar](500)NOT NULL,
	[CreatedAt] [date] NOT NULL DEFAULT GETDATE(),
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED (NotificationID),
 CONSTRAINT [FK_Notifications_Users] FOREIGN KEY([UserID]) REFERENCES [dbo].[Users] ([UserID])
 )

 CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED (CartID),
 CONSTRAINT [FK_Cart_Users] FOREIGN KEY([UserID]) REFERENCES [dbo].[Users] ([UserID]),
 CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
)

 /*------------------------Them hinh phan loai san pham-----------------------*/
INSERT INTO Categories VALUES ('HG', 'assets/img/HGlogo.jpg');
INSERT INTO Categories VALUES ('RG', 'assets/img/RGlogo.jpg');
INSERT INTO Categories VALUES ('MG', 'assets/img/MGlogo.jpg');
INSERT INTO Categories VALUES ('PG', 'assets/img/PGlogo.jpg');
INSERT INTO Categories VALUES ('TOOL', 'assets/img/TOOLlogo.jpg');

/*------------------------Them san pham-----------------------*/

INSERT INTO Products VALUES ('HG Vidar Gundam', 1, 285000, 3, 'Bandai',N'Mô hình lắp ráp tỉ lệ HG 1/144.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('HG Barbatos Lupus Gundam', 1, 185000, 20, N'Bandai','Mô hình lắp ráp tỉ lệ HG 1/144.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('HG Aerial Gundam', 1, 500000, 10, 'Bandai',N'Mô hình lắp ráp tỉ lệ HG 1/144.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('HG Age II Gundam', 1, 540000, 20, 'Bandai',N'Mô hình lắp ráp tỉ lệ HG 1/144.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('HG 00 Sky Gundam', 1, 350000, 20, 'Bandai',N'Mô hình lắp ráp tỉ lệ HG 1/144.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');


INSERT INTO Products VALUES ('RG Nu Gundam', 2, 850000, 2, 'Bandai',N'Mô hình lắp ráp tỉ lệ RG 1/144.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('RG Astray Gundam', 2, 520000, 7, 'Bandai',N'Mô hình lắp ráp tỉ lệ RG 1/144.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('RG Unicorn Gundam', 2, 820000, 13, 'Bandai',N'Mô hình lắp ráp tỉ lệ RG 1/144.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('RG Exia Gundam', 2, 500000, 20, 'Bandai',N'Mô hình lắp ráp tỉ lệ RG 1/144.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('RG Qant Gundam', 2, 520000, 5, 'Bandai',N'Mô hình lắp ráp tỉ lệ RG 1/144.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');


INSERT INTO Products VALUES ('MG Strike Gundam', 3, 850000, 20, 'Bandai',N'Mô hình lắp ráp tỉ lệ MG 1/100.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('MG Kyrios Gundam', 3, 1000000, 20, 'Bandai',N'Mô hình lắp ráp tỉ lệ MG 1/100.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('MG Dynames Gundam', 3, 850000, 8, 'Bandai',N'Mô hình lắp ráp tỉ lệ MG 1/100.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('MG Freedom Gundam', 3, 900000, 20, 'Bandai',N'Mô hình lắp ráp tỉ lệ MG 1/100.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('MG Barbatos Gundam', 3, 870000, 7, 'Bandai',N'Mô hình lắp ráp tỉ lệ MG 1/100.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ sơ cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');


INSERT INTO Products VALUES ('PG 00 Gundam', 4, 2850000, 20, 'Bandai',N'Mô hình lắp ráp tỉ lệ PG 1/60.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ trung cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('PG Strike Gundam', 4, 1850000, 4, 'Bandai',N'Mô hình lắp ráp tỉ lệ PG 1/60.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ trung cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('PG RX-78-2 Gundam', 4, 5000000, 20, 'Bandai',N'Mô hình lắp ráp tỉ lệ PG 1/60.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ trung cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('PG Exia Gundam', 4, 6700000, 13, 'Bandai',N'Mô hình lắp ráp tỉ lệ PG 1/60.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ trung cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');
INSERT INTO Products VALUES ('PG Astray Gundam', 4, 3500000, 20, 'Bandai',N'Mô hình lắp ráp tỉ lệ PG 1/60.Hãng sản xuất : Bandai (Nhật Bản).Thích hợp với người chơi trình độ trung cấp trở lên.Chất liệu nhựa, thân thiện và an toàn với môi trường');


INSERT INTO Products VALUES (N'Kềm Godhand', 5, 1020000, 20, 'Godhand',N'Kềm cao cấp nhất chuyên dùng cắt part mô hình ra khỏi runner.Thân kềm bọc cao su giúp tay cầm không bị trượt và êm ái hơn.Lực cắt nhẹ và mặt cắt đẹp');
INSERT INTO Products VALUES (N'Kềm Nanye', 5, 180000, 11, 'Ipliers',N'Kềm chuyên dụng dùng để cắt Mô hình.Sản phẩm có tay cầm bằng cao su giúp tay không bị trượt và êm ái trong quá trình sử dụng.Lực cắt nhẹ và bề mặt cắt đẹp');
INSERT INTO Products VALUES ('Dao Nine-sea', 5, 50000, 20, '9sea',N'Dụng cụ mô hình kĩ thuật dao dọc 9sea.Sử dụng cho giấy, nhựa, vải, kim loại mỏng.Bộ gồm cán dao + 12 lưỡi dão kèm theo.');
INSERT INTO Products VALUES ('Mr Hobby Top Coat', 5, 170000, 8, 'Mr Hobby',N'sơn phủ tạo hiệu ứng nhám.Bảo vệ cho bề mặt.Bình xịt dễ dùng');
INSERT INTO Products VALUES ('Gundam Maker', 5, 35000, 20, 'Mr Hobby',N'Giúp các chi tiết lằn chìm được nổi bật và khiến mô hình sống động hơn.Màu mực sắc nét, nhanh khô, dễ sử dụng.An toàn, không gây hại cho người sử dụng');


/*------------------------Them hinh anh cho tung san pham-----------------------*/

INSERT INTO ProductImages VALUES(1,'assets/img/hgvidar1.jpg')
INSERT INTO ProductImages VALUES(1,'assets/img/hgvidar2.jpg')
INSERT INTO ProductImages VALUES(1,'assets/img/hgvidar3.jpg')
INSERT INTO ProductImages VALUES(1,'assets/img/hgvidar4.jpg')

INSERT INTO ProductImages VALUES(2,'assets/img/hgbarbatoslupus1.jpg')
INSERT INTO ProductImages VALUES(2,'assets/img/hgbarbatoslupus2.jpg')
INSERT INTO ProductImages VALUES(2,'assets/img/hgbarbatoslupus3.jpg')
INSERT INTO ProductImages VALUES(2,'assets/img/hgbarbatoslupus4.jpg')


INSERT INTO ProductImages VALUES(3,'assets/img/hgaerial1.jpg')
INSERT INTO ProductImages VALUES(3,'assets/img/hgaerial2.jpg')
INSERT INTO ProductImages VALUES(3,'assets/img/hgaerial3.jpg')
INSERT INTO ProductImages VALUES(3,'assets/img/hgaerial4.jpg')


INSERT INTO ProductImages VALUES(4,'assets/img/hgageii1.jpg')
INSERT INTO ProductImages VALUES(4,'assets/img/hgageii2.jpg')
INSERT INTO ProductImages VALUES(4,'assets/img/hgageii3.jpg')
INSERT INTO ProductImages VALUES(4,'assets/img/hgageii4.jpg')


INSERT INTO ProductImages VALUES(5,'assets/img/hg00sky1.jpg')
INSERT INTO ProductImages VALUES(5,'assets/img/hg00sky2.jpg')
INSERT INTO ProductImages VALUES(5,'assets/img/hg00sky3.jpg')
INSERT INTO ProductImages VALUES(5,'assets/img/hg00sky4.jpg')


/*------*/

INSERT INTO ProductImages VALUES(6,'assets/img/rgnu1.jpg')
INSERT INTO ProductImages VALUES(6,'assets/img/rgnu2.jpg')
INSERT INTO ProductImages VALUES(6,'assets/img/rgnu3.jpg')
INSERT INTO ProductImages VALUES(6,'assets/img/rgnu4.jpg')

INSERT INTO ProductImages VALUES(7,'assets/img/rgastray1.jpg')
INSERT INTO ProductImages VALUES(7,'assets/img/rgastray2.jpg')
INSERT INTO ProductImages VALUES(7,'assets/img/rgastray3.jpg')
INSERT INTO ProductImages VALUES(7,'assets/img/rgastray4.jpg')

INSERT INTO ProductImages VALUES(8,'assets/img/rgunicorn1.jpg')
INSERT INTO ProductImages VALUES(8,'assets/img/rgunicorn2.jpg')
INSERT INTO ProductImages VALUES(8,'assets/img/rgunicorn3.jpg')
INSERT INTO ProductImages VALUES(8,'assets/img/rgunicorn4.jpg')


INSERT INTO ProductImages VALUES(9,'assets/img/rgexia1.jpg')
INSERT INTO ProductImages VALUES(9,'assets/img/rgexia2.jpg')
INSERT INTO ProductImages VALUES(9,'assets/img/rgexia3.jpg')
INSERT INTO ProductImages VALUES(9,'assets/img/rgexia4.jpg')

INSERT INTO ProductImages VALUES(10,'assets/img/rgqant1.jpg')
INSERT INTO ProductImages VALUES(10,'assets/img/rgqant2.jpg')
INSERT INTO ProductImages VALUES(10,'assets/img/rgqant3.jpg')
INSERT INTO ProductImages VALUES(10,'assets/img/rgqant4.jpg')

/*--------*/

INSERT INTO ProductImages VALUES(11,'assets/img/mgstrike1.jpg')
INSERT INTO ProductImages VALUES(11,'assets/img/mgstrike2.jpg')
INSERT INTO ProductImages VALUES(11,'assets/img/mgstrike3.jpg')
INSERT INTO ProductImages VALUES(11,'assets/img/mgstrike4.jpg')

INSERT INTO ProductImages VALUES(12,'assets/img/mgkyrios1.jpg')
INSERT INTO ProductImages VALUES(12,'assets/img/mgkyrios2.jpg')
INSERT INTO ProductImages VALUES(12,'assets/img/mgkyrios3.jpg')
INSERT INTO ProductImages VALUES(12,'assets/img/mgkyrios4.jpg')

INSERT INTO ProductImages VALUES(13,'assets/img/mgdynames1.jpg')
INSERT INTO ProductImages VALUES(13,'assets/img/mgdynames2.jpg')
INSERT INTO ProductImages VALUES(13,'assets/img/mgdynames3.jpg')
INSERT INTO ProductImages VALUES(13,'assets/img/mgdynames4.jpg')

INSERT INTO ProductImages VALUES(14,'assets/img/mgfreedom1.jpg')
INSERT INTO ProductImages VALUES(14,'assets/img/mgfreedom2.jpg')
INSERT INTO ProductImages VALUES(14,'assets/img/mgfreedom3.jpg')
INSERT INTO ProductImages VALUES(14,'assets/img/mgfreedom4.jpg')

INSERT INTO ProductImages VALUES(15,'assets/img/mgbarbatos1.jpg')
INSERT INTO ProductImages VALUES(15,'assets/img/mgbarbatos2.jpg')
INSERT INTO ProductImages VALUES(15,'assets/img/mgbarbatos3.jpg')
INSERT INTO ProductImages VALUES(15,'assets/img/mgbarbatos4.jpg')

/*---------*/

INSERT INTO ProductImages VALUES(16,'assets/img/pg001.jpg')
INSERT INTO ProductImages VALUES(16,'assets/img/pg002.jpg')
INSERT INTO ProductImages VALUES(16,'assets/img/pg003.jpg')
INSERT INTO ProductImages VALUES(16,'assets/img/pg004.jpg')

INSERT INTO ProductImages VALUES(17,'assets/img/pgstrike1.jpg')
INSERT INTO ProductImages VALUES(17,'assets/img/pgstrike2.jpg')
INSERT INTO ProductImages VALUES(17,'assets/img/pgstrike3.jpg')
INSERT INTO ProductImages VALUES(17,'assets/img/pgstrike4.jpg')

INSERT INTO ProductImages VALUES(18,'assets/img/pgrx-78-21.jpg')
INSERT INTO ProductImages VALUES(18,'assets/img/pgrx-78-22.jpg')
INSERT INTO ProductImages VALUES(18,'assets/img/pgrx-78-23.jpg')
INSERT INTO ProductImages VALUES(18,'assets/img/pgrx-78-24.jpg')

INSERT INTO ProductImages VALUES(19,'assets/img/pgexia1.jpg')
INSERT INTO ProductImages VALUES(19,'assets/img/pgexia2.jpg')
INSERT INTO ProductImages VALUES(19,'assets/img/pgexia3.jpg')
INSERT INTO ProductImages VALUES(19,'assets/img/pgexia4.jpg')

INSERT INTO ProductImages VALUES(20,'assets/img/pgastray1.jpg')
INSERT INTO ProductImages VALUES(20,'assets/img/pgastray2.jpg')
INSERT INTO ProductImages VALUES(20,'assets/img/pgastray3.jpg')
INSERT INTO ProductImages VALUES(20,'assets/img/pgastray4.jpg')

/*----------*/

INSERT INTO ProductImages VALUES(21,'assets/img/kemgodhand1.jpg')
INSERT INTO ProductImages VALUES(22,'assets/img/kemnanye1.jpg')
INSERT INTO ProductImages VALUES(23,'assets/img/daonine-sea1.jpg')
INSERT INTO ProductImages VALUES(24,'assets/img/mrhobbytopcoat1.jpg')
INSERT INTO ProductImages VALUES(25,'assets/img/gundammaker1.jpg')





SELECT * FROM Categories

SELECT * FROM Products

SELECT * FROM ProductImages

SELECT SUM(Quantity) AS TotalQuantitySold
FROM OrderDetails
WHERE ProductID = 1;



SELECT * FROM Products ORDER BY ProductID DESC;

SELECT * FROM Products WHERE Productname like '%e%'
/*------------------------Clone user--------------------*/
/*[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Password] varchar(20) NOT NULL,
	[Name] nvarchar(30) NULL,
	[Phone] varchar(24) NULL,
	[Email] varchar(255) NULL UNIQUE,
	[isAdmin] bit NULL,
*/
INSERT INTO Users VALUES(123321,'Thanh', '0372343515', 'thanh@gmail.com', 1)




-- order today
CREATE TABLE OrderToday (
    OrderID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(200),
    PurchaseDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status NVARCHAR(50)
);

INSERT INTO OrderToday (OrderID, CustomerName, PhoneNumber, Address, PurchaseDate, TotalAmount, Status)
VALUES
    (1, N'Mai Lê', N'0134245345', N'Da Nang', '2023-02-02', 520000.00, N'Đã hoàn thành'),
    (2, N'Thanh Lê', N'0134245345', N'Quang Nam', '2023-02-02', 780000.00, N'Đã hoàn thành'),
    (3, N'Thảo Trần', N'0123456789', N'Hanoi', '2023-02-03', 320000.00, N'Đã hoàn thành'),
    (4, N'Linh Nguyễn', N'0987654321', N'HCM City', '2023-02-03', 640000.00, N'Đã hoàn thành'),
    (5, N'Hoa Phạm', N'0123456789', N'Hanoi', '2023-02-04', 420000.00, N'Đã hoàn thành'),
    (6, N'Anh Trần', N'0987654321', N'HCM City', '2023-02-04', 860000.00, N'Đã hoàn thành'),
    (7, N'Thư Võ', N'0123456789', N'Hanoi', '2023-02-05', 230000.00, N'Đã hoàn thành'),
    (8, N'Hùng Lê', N'0987654321', N'HCM City', '2023-02-05', 970000.00, N'Đã hoàn thành'),
    (9, N'Tâm Trần', N'0123456789', N'Hanoi', '2023-02-06', 630000.00, N'Đã hoàn thành'),
    (10, N'Phương Nguyễn', N'0987654321', N'HCM City', '2023-02-06', 750000.00, N'Đã hoàn thành');

SELECT * FROM OrderToday;
SELECT * FROM OrderToday WHERE Status = N'Đã hoàn thành';
SELECT SUM(TotalAmount) AS TotalAmountSum FROM OrderToday;


Select [OrderID], [CustomerName], [PhoneNumber], [Address], [PurchaseDate], [TotalAmount], [Status] from OrderToday

select * from [dbo].[Orders] where ShippedDate  


-- create manageOrder
CREATE TABLE [dbo].[ManageOrder] (
	OrderID INT PRIMARY KEY,
	CustomerName NVARCHAR(100),
	PhoneNumber NVARCHAR(20),
	Address NVARCHAR(200),
	PurchaseDate DATE,
	TotalAmount DECIMAL(10, 2),
	Status NVARCHAR(50)
);

INSERT INTO ManageOrder (OrderID, CustomerName, PhoneNumber, Address, PurchaseDate, TotalAmount, Status)
VALUES
	(1, N'Mai Lê', N'0134245345', N'Da Nang', '2023-02-02', 520000.00, N'Đã hoàn thành'),
    (2, N'Thanh Lê', N'0134245345', N'Quang Nam', '2023-02-02', 780000.00, N'Đã hoàn thành'),
    (3, N'Thảo Trần', N'0123456789', N'Hanoi', '2023-02-03', 320000.00, N'Đã hoàn thành'),
    (4, N'Linh Nguyễn', N'0987654321', N'HCM City', '2023-02-03', 640000.00, N'Đã hoàn thành'),
    (5, N'Hoa Phạm', N'0123456789', N'Hanoi', '2023-02-04', 420000.00, N'Đã hoàn thành'),
    (6, N'Anh Trần', N'0987654321', N'HCM City', '2023-02-04', 860000.00, N'Đã hoàn thành'),
    (7, N'Thư Võ', N'0123456789', N'Hanoi', '2023-02-05', 230000.00, N'Đã hoàn thành'),
    (8, N'Hùng Lê', N'0987654321', N'HCM City', '2023-02-05', 970000.00, N'Đã hoàn thành'),
    (9, N'Tâm Trần', N'0123456789', N'Hanoi', '2023-02-06', 630000.00, N'Đã hoàn thành'),
    (10, N'Phương Nguyễn', N'0987654321', N'HCM City', '2023-02-06', 750000.00, N'Đã hoàn thành');

-- count order
SELECT COUNT(OrderID) AS TotalOrder FROM [dbo].[ManageOrder];


SELECT * FROM [dbo].[Orders];
SELECT * FROm [dbo].[OrderDetails]



-- DROP TABLE [dbo].[listorder];
CREATE TABLE [dbo].[listorder] (
    id INT PRIMARY KEY,
    userId INT,
    phone VARCHAR(255),
    address VARCHAR(255),
    orderDate DATE,
    total FLOAT,
    status VARCHAR(50)
);


SELECT
    P.ProductID,
    -- C.CategoryName,
	C.*,
    P.ProductName,
    P.Price,
    P.ProductDetail,
    P.UnitsInStock
    -- PI.ImagePath AS ProductImage
FROM
    [Products] P
    INNER JOIN Categories C ON P.CategoryID = C.CategoryID
    LEFT JOIN [dbo].[ProductImages] PI ON P.ProductID = PI.ProductID;

Select * from Categories

-- SELECT * FROM [dbo].[Products];