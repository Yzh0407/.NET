-- 创建数据库 StuInfo
CREATE DATABASE StuInfo;
go

-- 使用数据库 StuInfo
USE StuInfo;
go

-- 创建 Login 表
CREATE TABLE Login (
    userName VARCHAR(20) NOT NULL,
    userPwd NVARCHAR(20) NOT NULL
);

-- 创建 Student 表
CREATE TABLE Student (
    e_ID NVARCHAR(20) PRIMARY KEY NOT NULL,
    e_Name NVARCHAR(20) NOT NULL,
    e_Sex BIT NOT NULL CHECK (e_Sex IN (0, 1)),
    e_Birth DATE NOT NULL,
    e_Hobby NVARCHAR(20) NOT NULL
);

-- 向 Login 表添加中文测试数据
INSERT INTO Login (userName, userPwd) VALUES ('管理员', 'admin123');
INSERT INTO Login (userName, userPwd) VALUES ('教师', 'teacher123');
INSERT INTO Login (userName, userPwd) VALUES ('学生', 'student123');

-- 向 Student 表添加中文测试数据
INSERT INTO Student (e_ID, e_Name, e_Sex, e_Birth, e_Hobby) VALUES ('20200101', '张三', 0, '2001-01-01', '篮球');
INSERT INTO Student (e_ID, e_Name, e_Sex, e_Birth, e_Hobby) VALUES ('20200102', '李四', 1, '2002-02-02', '绘画');
INSERT INTO Student (e_ID, e_Name, e_Sex, e_Birth, e_Hobby) VALUES ('20200103', '王五', 0, '2003-03-03', '吉他');

INSERT INTO Student (e_ID, e_Name, e_Sex, e_Birth, e_Hobby) VALUES 
('20200104', '赵六', 1, '2004-04-04', '游泳'),
('20200105', '钱七', 0, '2005-05-05', '足球'),
('20200106', '孙八', 1, '2006-06-06', '钢琴'),
('20200107', '周九', 0, '2007-07-07', '阅读'),
('20200108', '吴十', 1, '2008-08-08', '舞蹈'),
('20200109', '郑十一', 0, '2009-09-09', '围棋'),
('20200110', '王十二', 1, '2010-10-10', '摄影'),
('20200111', '冯十三', 0, '2011-11-11', '旅行'),
('20200112', '陈十四', 1, '2012-12-12', '园艺');

select * from Login
select * from Student