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

-- ����ʾ�����ݵ� BookType ��
insert into BookType (TypeName) values
('����'),
('����ѧ'),
('�����'),
('ҽѧ'),
('С˵');
GO

-- ����ʾ�����ݵ� BookInfo ��
INSERT INTO BookInfo (ISBN, BookName, Price, Author, Stock, TypeID) VALUES
('9787302574439', '�Ƽ�������ְҵ�����о�', '104.40', '�ܴ���', 90, 1),
('9787521405866', '���پ�֢״ѧ', '62.00', '��Ҹ�', 20, 4),
('9787807407331', '��Ĺ�ʼ�7', '22.40', '��������', 100, 5)
GO

select * from BookInfo
select * from BookType

select ISBN,BookType.TypeName,BookName,Price,Author,Stock from BookInfo
inner join BookType on BookInfo.TypeID=BookType.TypeID