create database BookManage;
go

use BookManage;
go

create table BookType(
TypeID int identity(1,1) primary key,
TypeName varchar(50) NOT NULL
)
go

create table BookInfo(
ISBN varchar(20) primary key,
BookName varchar(100) NOT NULL,
Price char(10) NOT NULL,
Author varchar(50),
Stock int NOT NULL Default(0),
TypeID int references BookType(TypeID)
)
go

-- 插入示例数据到 BookType 表
insert into BookType (TypeName) values
('教育'),
('心理学'),
('计算机'),
('医学'),
('小说');
GO

-- 插入示例数据到 BookInfo 表
INSERT INTO BookInfo (ISBN, BookName, Price, Author, Stock, TypeID) VALUES
('9787302574439', '科技工作者职业类型研究', '104.40', '周大亚', 90, 1),
('9787521405866', '张仲景症状学', '62.00', '李家庚', 20, 4),
('9787807407331', '盗墓笔记7', '22.40', '南派三叔', 100, 5)
GO

select * from BookInfo
select * from BookType

select ISBN,BookType.TypeName,BookName,Price,Author,Stock from BookInfo
inner join BookType on BookInfo.TypeID=BookType.TypeID