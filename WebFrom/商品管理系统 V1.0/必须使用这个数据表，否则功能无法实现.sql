-- 创建数据库 Test
CREATE DATABASE Test;
GO

-- 切换到数据库 Test
USE Test;
GO

-- 创建商品类别表 Category
CREATE TABLE Category(
	CategoryID int identity(1,1) primary key,
	CategoryName varchar(20) Not Null
);
go

-- 创建商品表 Product
CREATE TABLE Product(
	ProductID int identity(1,1) primary key,
	Content varchar(200) Not Null,
	IsUp char(2) Not Null,
	UnitPrice int Not Null,
	Remark varchar(500),
	CategoryID int references CateGory(CategoryID)
);

-- 插入示例数据到 Category 表
INSERT INTO Category (CategoryName) VALUES
(''),
('电子产品'),
('书籍'),
('服装');
GO

-- 插入示例数据到 Product 表
INSERT INTO Product (Content, IsUp, UnitPrice, Remark, CategoryID) VALUES
('智能手机', '是', 6999, '最新款', 2),
('笔记本电脑', '是', 9999, '高性能', 2),
('小说', '否', 150, '畅销书', 3),
('T恤', '是', 200, '纯棉材质', 4);
GO

-- 检查插入的数据
SELECT * FROM Category;
SELECT * FROM Product;

SELECT Content, IsUp, UnitPrice, Remark, Category.CategoryName
FROM Product
inner join Category on Category.CategoryID=Product.CategoryID;