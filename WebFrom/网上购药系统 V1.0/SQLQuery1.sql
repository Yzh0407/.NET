-- �������ݿ�
CREATE DATABASE OrderMedicineDB;
GO

-- ʹ�����ݿ�
USE OrderMedicineDB;
GO

-- �����û���Ϣ��
CREATE TABLE UserInfo (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(300) NOT NULL,
    Password NVARCHAR(20) NOT NULL
);

-- ����������Ϣ��
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

-- �����û���Ϣ����
INSERT INTO UserInfo (UserName, Password) VALUES
('admin', 'admin'),
('������', 'password1'),
('������', 'password2'),
('�ź���', 'password3');
GO

-- ���붩����Ϣ����
INSERT INTO OrderInfo (MedicineName, UserId, AddTime, RealName, Mobile, Address, State, SendType, Remark) VALUES
('��˾ƥ��', 1, '2024-06-20 10:00:00', '������', '13800138000', '�����г�����1��', 1, 0, '��'),
('�����', 2, '2024-06-21 11:00:00', '������', '13800138001', '�Ϻ����ֶ�����2��', 2, 1, '��'),
('������������', 3, '2024-06-22 12:00:00', '�ź���', '13800138002', '�����������3��', 1, 0, '��');
GO

SELECT COUNT(1) FROM UserInfo WHERE UserName='admin' AND Password='admin'

SELECT * FROM OrderInfo
SELECT * FROM UserInfo

SELECT ID, MedicineName, UserInfo.UserName, AddTime, RealName, Mobile, Address, State, SendType, Remark FROM OrderInfo
INNER JOIN UserInfo ON UserInfo.UserId = OrderInfo.UserId

SELECT ID AS '���', MedicineName AS 'ҩ��', UserInfo.UserName AS '�µ���', AddTime AS '�µ�ʱ��', RealName AS '�ջ���', Mobile AS '�ջ��˵绰', Address AS '�ջ���ַ', CASE WHEN State = 1 THEN 'δ����' WHEN State = 2 THEN '������' END AS '����״̬',CASE WHEN SendType = 0 THEN '�̼�����' WHEN SendType = 1 THEN '����' END AS '���ͷ�ʽ',Remark AS '��ע'FROM OrderInfo INNER JOIN UserInfo ON UserInfo.UserId = OrderInfo.UserId;


SELECT ID, MedicineName, UserInfo.UserName, AddTime, RealName, Mobile, Address, CASE WHEN State = 1 THEN 'δ����' WHEN State = 2 THEN '������' END AS State,CASE WHEN SendType = 0 THEN '�̼�����' WHEN SendType = 1 THEN '����' END AS SendType,SendTime,Remark FROM OrderInfo INNER JOIN UserInfo ON UserInfo.UserId = OrderInfo.UserId;
