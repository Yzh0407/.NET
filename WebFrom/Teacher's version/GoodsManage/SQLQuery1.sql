-- 创建数据库
CREATE DATABASE GoodsManage;
GO

-- 选择数据库
USE GoodsManage;
GO

-- 创建用户信息表
CREATE TABLE UserInfo (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    UserName VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL
);
GO

-- 创建商品信息表
CREATE TABLE GoodsInfo (
    GoodsId INT PRIMARY KEY IDENTITY(1,1),
    GoodsName VARCHAR(100) NOT NULL
);
GO

-- 创建订单信息表
CREATE TABLE OrderInfo (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    GoodsId INT NOT NULL,
    UserId INT NOT NULL,
    OrderTime DATETIME NOT NULL DEFAULT GETDATE(),
    State INT NOT NULL DEFAULT 0 CHECK (State BETWEEN 0 AND 3),
    SendType BIT NOT NULL DEFAULT 0,
    Address VARCHAR(100),
    Phone VARCHAR(11),
    FOREIGN KEY (GoodsId) REFERENCES GoodsInfo(GoodsId),
    FOREIGN KEY (UserId) REFERENCES UserInfo(UserId)
);
GO

-- 插入用户信息表示例数据
INSERT INTO UserInfo (UserName, Password) VALUES 
('张三', '密码1'),
('李四', '密码2'),
('王五', '密码3');
GO

-- 插入商品信息表示例数据
INSERT INTO GoodsInfo (GoodsName) VALUES 
('笔记本电脑'),
('智能手机'),
('平板电脑');
GO

-- 插入订单信息表示例数据
INSERT INTO OrderInfo (GoodsId, UserId, OrderTime, State, SendType, Address, Phone) VALUES 
(1, 1, GETDATE(), 0, 0, '北京市朝阳区', '12345678901'),
(2, 2, GETDATE(), 1, 1, '上海市浦东新区', '23456789012'),
(3, 3, GETDATE(), 2, 0, '广州市天河区', '34567890123');
GO

SELECT 
    OrderInfo.OrderId,
    GoodsInfo.GoodsName,
    UserInfo.UserName,
    OrderInfo.OrderTime,
    OrderInfo.Address,
    OrderInfo.Phone,
    CASE OrderInfo.State
        WHEN 0 THEN '未发货'
        WHEN 1 THEN '已发货'
        WHEN 2 THEN '已送达'
        WHEN 3 THEN '已签收'
        ELSE '未知状态'
    END AS State,
    CASE OrderInfo.SendType
        WHEN 0 THEN '商家配送'
        WHEN 1 THEN '自提'
        ELSE '未知方式'
    END AS SendType
FROM 
    OrderInfo
JOIN 
    GoodsInfo ON OrderInfo.GoodsId = GoodsInfo.GoodsId
JOIN 
    UserInfo ON OrderInfo.UserId = UserInfo.UserId;

