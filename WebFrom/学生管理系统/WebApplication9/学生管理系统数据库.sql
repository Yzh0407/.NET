-- �������ݿ� StuInfo
CREATE DATABASE StuInfo;
go

-- ʹ�����ݿ� StuInfo
USE StuInfo;
go

-- ���� Login ��
CREATE TABLE Login (
    userName VARCHAR(20) NOT NULL,
    userPwd NVARCHAR(20) NOT NULL
);

-- ���� Student ��
CREATE TABLE Student (
    e_ID NVARCHAR(20) PRIMARY KEY NOT NULL,
    e_Name NVARCHAR(20) NOT NULL,
    e_Sex BIT NOT NULL CHECK (e_Sex IN (0, 1)),
    e_Birth DATE NOT NULL,
    e_Hobby NVARCHAR(20) NOT NULL
);

-- �� Login ��������Ĳ�������
INSERT INTO Login (userName, userPwd) VALUES ('����Ա', 'admin123');
INSERT INTO Login (userName, userPwd) VALUES ('��ʦ', 'teacher123');
INSERT INTO Login (userName, userPwd) VALUES ('ѧ��', 'student123');

-- �� Student ��������Ĳ�������
INSERT INTO Student (e_ID, e_Name, e_Sex, e_Birth, e_Hobby) VALUES ('20200101', '����', 0, '2001-01-01', '����');
INSERT INTO Student (e_ID, e_Name, e_Sex, e_Birth, e_Hobby) VALUES ('20200102', '����', 1, '2002-02-02', '�滭');
INSERT INTO Student (e_ID, e_Name, e_Sex, e_Birth, e_Hobby) VALUES ('20200103', '����', 0, '2003-03-03', '����');

INSERT INTO Student (e_ID, e_Name, e_Sex, e_Birth, e_Hobby) VALUES 
('20200104', '����', 1, '2004-04-04', '��Ӿ'),
('20200105', 'Ǯ��', 0, '2005-05-05', '����'),
('20200106', '���', 1, '2006-06-06', '����'),
('20200107', '�ܾ�', 0, '2007-07-07', '�Ķ�'),
('20200108', '��ʮ', 1, '2008-08-08', '�赸'),
('20200109', '֣ʮһ', 0, '2009-09-09', 'Χ��'),
('20200110', '��ʮ��', 1, '2010-10-10', '��Ӱ'),
('20200111', '��ʮ��', 0, '2011-11-11', '����'),
('20200112', '��ʮ��', 1, '2012-12-12', '԰��');

select * from Login
select * from Student