-- ���� Market ���ݿ�
CREATE DATABASE Market;
GO

-- ʹ�� Market ���ݿ�
USE Market;
GO

-- ���� UserInfo ��
CREATE TABLE UserInfo (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Password VARCHAR(20) NOT NULL
);
GO

-- ���� ProductInfo ��
CREATE TABLE ProductInfo (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    ProductClass VARCHAR(50) NOT NULL,
    ProductNum INT NOT NULL,
    Remark NVARCHAR(256) NULL
);
GO

-- �� UserInfo ������������
INSERT INTO UserInfo (UserName, Password) VALUES ('����ǰ', '666666');
INSERT INTO UserInfo (UserName, Password) VALUES ('����', '123456');
INSERT INTO UserInfo (UserName, Password) VALUES ('��С��', '654321');

-- �� ProductInfo ������������
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('����', '��ʳ', 103, '���Ŀ�');
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('����', '����', 56, '����');
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('ë��', '����', 47, '�ͷ�');
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('�ֱ�', '�ľ�', 29, '������');
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('��ֽ', '����', 60, '��治��');
INSERT INTO ProductInfo (ProductName, ProductClass, ProductNum, Remark) VALUES ('��Բ', 'ʳƷ', 18, '�����ڶ�');
GO


select * from UserInfo
select * from ProductInfo