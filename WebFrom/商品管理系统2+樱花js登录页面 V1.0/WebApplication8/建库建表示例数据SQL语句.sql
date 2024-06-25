-- 创建 Market 数据库
CREATE DATABASE Market;
GO

-- 使用 Market 数据库
USE Market;
GO

-- 创建 UserInfo 表
CREATE TABLE UserInfo (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Password VARCHAR(20) NOT NULL
);
GO

-- 创建 ProductInfo 表
CREATE TABLE ProductInfo (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    ProductClass VARCHAR(50) NOT NULL,
    ProductNum INT NOT NULL,
    Remark NVARCHAR(256) NULL
);
GO

-- 向 UserInfo 表插入测试数据
INSERT INTO UserInfo (UserName, Password) VALUES ('李向前', '666666');
INSERT INTO UserInfo (UserName, Password) VALUES ('张孟', '123456');
INSERT INTO UserInfo (UserName, Password) VALUES ('林小阮', '654321');

-- 向 ProductInfo 表插入测试数据
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('薯条', '零食', 103, '卖的快');
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('可乐', '饮料', 56, '库存多');
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('毛巾', '日用', 47, '耐放');
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('钢笔', '文具', 29, '需求少');
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('抽纸', '日用', 60, '库存不够');
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('汤圆', '食品', 18, '保质期短');
GO


select * from UserInfo
select * from ProductInfo