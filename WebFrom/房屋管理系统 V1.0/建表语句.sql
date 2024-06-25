-- �������ݿ� Test
CREATE DATABASE Test;
GO

-- ʹ�����ݿ� Test
USE Test;
GO

-- ���� HouseType ��
CREATE TABLE HouseType (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Type VARCHAR(50) NOT NULL
);
GO

-- ���� HouseInfo ��
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

-- ����������ݵ� HouseType ��
INSERT INTO HouseType (Type) VALUES 
('��Ԣ'),
('������'),
('���ű���'),
('���ܹ�Ԣ'),
('���乫Ԣ');
GO

-- ����������ݵ� HouseInfo ��
INSERT INTO HouseInfo (LeaseMode, Rent, Contacts, DepositMethod, HouseTypeID, Address) VALUES
('����', 4500.00, '����', 'Ѻһ��һ', 1, '�Ϻ����ֶ��������ʹ��100�Ž�ï����23��'),
('����', 6500.00, '��÷÷', 'Ѻ����һ', 2, '������������齭�³ǻ��Ǵ��88��������12A'),
('����', 3200.00, '��ΰ', 'Ѻһ��һ', 3, '��������ɽ���Ƽ�԰��Է·18�������ҵ����4��'),
('����', 8000.00, '����', 'Ѻ����һ', 4, '�����г���������·77�Ż�ó����3��¥20��'),
('����', 3700.00, '�½�', 'Ѻһ��һ', 5, '����������������·66����Ϫ�����A��8¥'),
('����', 5200.00, '��ٻ', 'Ѻ����һ', 1, '�ɶ��и������츮����ж�199���츮���԰D��3��'),
('����', 2900.00, '��ǿ', 'Ѻһ��һ', 2, '�Ͼ��й�¥����ɽ��·300�ų���ó�״���5��'),
('����', 4800.00, '����', 'Ѻ����һ', 3, '��������������ű����н�100��ʱ���㳡18��'),
('����', 4100.00, '��ӱ', 'Ѻһ��һ', 4, '�人�����������·10���н��㳡B��7��'),
('����', 7000.00, '����', 'Ѻ����һ', 5, '������������������·120���̵�����A��16��');
GO


select * from HouseInfo
select * from HouseType