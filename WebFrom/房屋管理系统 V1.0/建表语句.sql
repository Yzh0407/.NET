-- 创建数据库 Test
CREATE DATABASE Test;
GO

-- 使用数据库 Test
USE Test;
GO

-- 创建 HouseType 表
CREATE TABLE HouseType (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Type VARCHAR(50) NOT NULL
);
GO

-- 创建 HouseInfo 表
CREATE TABLE HouseInfo (
    ID INT PRIMARY KEY IDENTITY(1,1),
    LeaseMode VARCHAR(50),
    Rent MONEY NOT NULL,
    Contacts VARCHAR(20),
    DepositMethod VARCHAR(20),
    HouseTypeID INT,
    Address VARCHAR(200) NOT NULL,
    FOREIGN KEY (HouseTypeID) REFERENCES HouseType(ID)
);
GO

-- 插入测试数据到 HouseType 表
INSERT INTO HouseType (Type) VALUES 
('公寓'),
('独立屋'),
('联排别墅'),
('共管公寓'),
('单间公寓');
GO

-- 插入测试数据到 HouseInfo 表
INSERT INTO HouseInfo (LeaseMode, Rent, Contacts, DepositMethod, HouseTypeID, Address) VALUES
('短租', 4500.00, '李雷', '押一付一', 1, '上海市浦东新区世纪大道100号金茂大厦23层'),
('长租', 6500.00, '韩梅梅', '押二付一', 2, '广州市天河区珠江新城花城大道88号天汇大厦12A'),
('短租', 3200.00, '王伟', '押一付一', 3, '深圳市南山区科技园科苑路18号软件产业基地4栋'),
('长租', 8000.00, '李娜', '押三付一', 4, '北京市朝阳区建国路77号华贸中心3号楼20层'),
('短租', 3700.00, '陈杰', '押一付一', 5, '杭州市西湖区文三路66号西溪数码港A座8楼'),
('长租', 5200.00, '赵倩', '押二付一', 1, '成都市高新区天府大道中段199号天府软件园D区3栋'),
('短租', 2900.00, '张强', '押一付一', 2, '南京市鼓楼区中山北路300号长江贸易大厦5层'),
('长租', 4800.00, '刘洋', '押二付一', 3, '重庆市渝中区解放碑步行街100号时代广场18层'),
('短租', 4100.00, '杨颖', '押一付一', 4, '武汉市武昌区中南路10号中建广场B座7层'),
('长租', 7000.00, '高磊', '押三付一', 5, '西安市雁塔区长安南路120号绿地中心A座16层');
GO


select * from HouseInfo
select * from HouseType