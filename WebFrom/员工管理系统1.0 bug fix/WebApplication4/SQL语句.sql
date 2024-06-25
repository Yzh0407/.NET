-- �������ݿ�
CREATE DATABASE DB;
GO

-- ʹ���´��������ݿ�
USE DB;
GO

-- ���� DeptInfo ��
CREATE TABLE DeptInfo (
    Did INT IDENTITY(1,1) PRIMARY KEY,
    DName VARCHAR(50) NOT NULL
);

-- ���� EmpInfo ��
CREATE TABLE EmpInfo (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    EmpSex CHAR(2) NOT NULL,
    Status VARCHAR(10) NOT NULL DEFAULT '��ְ',
    Tel VARCHAR(20),
    Did INT NOT NULL,
    Remark VARCHAR(MAX),
    FOREIGN KEY (Did) REFERENCES DeptInfo(Did)
);

-- ���벿����Ϣ������
INSERT INTO DeptInfo (DName)
VALUES 
('���²�'),
('������'),
('����');

-- ����Ա����Ϣ������
INSERT INTO EmpInfo (EmpName, EmpSex, Status, Tel, Did, Remark)
VALUES 
('��ΰǿ', '��', '��ְ', '13800000001', 1, '����̤ʵ'),
('������', 'Ů', '��ְ', '13800000002', 2, '����ϸ��'),
('��С��', '��', '��ְ', '13800000003', 3, '������Ӳ'),
('������', 'Ů', '��ְ', '13800000004', 1, '��������'),
('���ʥ', '��', '��ְ', '13800000005', 2, '�г���Ӣ'),
('�ܺ���', 'Ů', '��ְ', '13800000006', 3, 'ǰ������Դ����'),
('������', '��', '��ְ', '13800000007', 1, '�������'),
('֣����', '��', '��ְ', '13800000008', 2, '�з�����');
