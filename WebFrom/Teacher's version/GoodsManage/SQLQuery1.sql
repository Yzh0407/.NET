-- �������ݿ�
CREATE DATABASE GoodsManage;
GO

-- ѡ�����ݿ�
USE GoodsManage;
GO

-- �����û���Ϣ��
CREATE TABLE UserInfo (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    UserName VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL
);
GO

-- ������Ʒ��Ϣ��
CREATE TABLE GoodsInfo (
    GoodsId INT PRIMARY KEY IDENTITY(1,1),
    GoodsName VARCHAR(100) NOT NULL
);
GO

-- ����������Ϣ��
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

-- �����û���Ϣ��ʾ������
INSERT INTO UserInfo (UserName, Password) VALUES 
('����', '����1'),
('����', '����2'),
('����', '����3');
GO

-- ������Ʒ��Ϣ��ʾ������
INSERT INTO GoodsInfo (GoodsName) VALUES 
('�ʼǱ�����'),
('�����ֻ�'),
('ƽ�����');
GO

-- ���붩����Ϣ��ʾ������
INSERT INTO OrderInfo (GoodsId, UserId, OrderTime, State, SendType, Address, Phone) VALUES 
(1, 1, GETDATE(), 0, 0, '�����г�����', '12345678901'),
(2, 2, GETDATE(), 1, 1, '�Ϻ����ֶ�����', '23456789012'),
(3, 3, GETDATE(), 2, 0, '�����������', '34567890123');
GO

SELECT 
    OrderInfo.OrderId,
    GoodsInfo.GoodsName,
    UserInfo.UserName,
    OrderInfo.OrderTime,
    OrderInfo.Address,
    OrderInfo.Phone,
    CASE OrderInfo.State
        WHEN 0 THEN 'δ����'
        WHEN 1 THEN '�ѷ���'
        WHEN 2 THEN '���ʹ�'
        WHEN 3 THEN '��ǩ��'
        ELSE 'δ֪״̬'
    END AS State,
    CASE OrderInfo.SendType
        WHEN 0 THEN '�̼�����'
        WHEN 1 THEN '����'
        ELSE 'δ֪��ʽ'
    END AS SendType
FROM 
    OrderInfo
JOIN 
    GoodsInfo ON OrderInfo.GoodsId = GoodsInfo.GoodsId
JOIN 
    UserInfo ON OrderInfo.UserId = UserInfo.UserId;

