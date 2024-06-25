-- �������ݿ� Test
CREATE DATABASE Test;
GO

-- �л������ݿ� Test
USE Test;
GO

-- ������Ʒ���� Category
CREATE TABLE Category(
	CategoryID int identity(1,1) primary key,
	CategoryName varchar(20) Not Null
);
go

-- ������Ʒ�� Product
CREATE TABLE Product(
	ProductID int identity(1,1) primary key,
	Content varchar(200) Not Null,
	IsUp char(2) Not Null,
	UnitPrice int Not Null,
	Remark varchar(500),
	CategoryID int references CateGory(CategoryID)
);

-- ����ʾ�����ݵ� Category ��
INSERT INTO Category (CategoryName) VALUES
(''),
('���Ӳ�Ʒ'),
('�鼮'),
('��װ');
GO

-- ����ʾ�����ݵ� Product ��
INSERT INTO Product (Content, IsUp, UnitPrice, Remark, CategoryID) VALUES
('�����ֻ�', '��', 6999, '���¿�', 2),
('�ʼǱ�����', '��', 9999, '������', 2),
('С˵', '��', 150, '������', 3),
('T��', '��', 200, '���޲���', 4);
GO

-- �����������
SELECT * FROM Category;
SELECT * FROM Product;

SELECT Content, IsUp, UnitPrice, Remark, Category.CategoryName
FROM Product
inner join Category on Category.CategoryID=Product.CategoryID;