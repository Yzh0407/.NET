-- 创建数据库
CREATE DATABASE OrderMedicineDB;
GO

-- 使用数据库
USE OrderMedicineDB;
GO

-- 创建用户信息表
CREATE TABLE UserInfo (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(300) NOT NULL,
    Password NVARCHAR(20) NOT NULL
);

-- 创建订单信息表
CREATE TABLE OrderInfo (
    Id INT PRIMARY KEY IDENTITY(1,1),
    MedicineName NVARCHAR(300) NOT NULL,
    UserId INT NOT NULL,
    AddTime DATETIME NOT NULL,
    RealName NVARCHAR(20) NOT NULL,
    Mobile NVARCHAR(11) NOT NULL,
    Address NVARCHAR(300) NOT NULL,
    State INT NOT NULL,
    SendTime DATETIME NULL,
    SendType BIT NOT NULL,
    Remark NVARCHAR(500) NULL,
    FOREIGN KEY (UserId) REFERENCES UserInfo(UserId)
);

-- 插入用户信息数据
INSERT INTO UserInfo (UserName, Password) VALUES
('admin', 'admin'),
('王晓明', 'password1'),
('李丽丽', 'password2'),
('张海涛', 'password3');
GO

-- 插入订单信息数据
INSERT INTO OrderInfo (MedicineName, UserId, AddTime, RealName, Mobile, Address, State, SendType, Remark) VALUES
('阿司匹林', 1, '2024-06-20 10:00:00', '王晓明', '13800138000', '北京市朝阳区1号', 1, 0, '无'),
('布洛芬', 2, '2024-06-21 11:00:00', '李丽丽', '13800138001', '上海市浦东新区2号', 2, 1, '无'),
('对乙酰氨基酚', 3, '2024-06-22 12:00:00', '张海涛', '13800138002', '广州市天河区3号', 1, 0, '无');
GO

SELECT COUNT(1) FROM UserInfo WHERE UserName='admin' AND Password='admin'

SELECT * FROM OrderInfo
SELECT * FROM UserInfo

SELECT ID, MedicineName, UserInfo.UserName, AddTime, RealName, Mobile, Address, State, SendType, Remark FROM OrderInfo
INNER JOIN UserInfo ON UserInfo.UserId = OrderInfo.UserId

SELECT ID AS '编号', MedicineName AS '药名', UserInfo.UserName AS '下单人', AddTime AS '下单时间', RealName AS '收货人', Mobile AS '收货人电话', Address AS '收货地址', CASE WHEN State = 1 THEN '未配送' WHEN State = 2 THEN '已配送' END AS '订单状态',CASE WHEN SendType = 0 THEN '商家配送' WHEN SendType = 1 THEN '自提' END AS '配送方式',Remark AS '备注'FROM OrderInfo INNER JOIN UserInfo ON UserInfo.UserId = OrderInfo.UserId;


SELECT ID, MedicineName, UserInfo.UserName, AddTime, RealName, Mobile, Address, CASE WHEN State = 1 THEN '未配送' WHEN State = 2 THEN '已配送' END AS State,CASE WHEN SendType = 0 THEN '商家配送' WHEN SendType = 1 THEN '自提' END AS SendType,SendTime,Remark FROM OrderInfo INNER JOIN UserInfo ON UserInfo.UserId = OrderInfo.UserId;
