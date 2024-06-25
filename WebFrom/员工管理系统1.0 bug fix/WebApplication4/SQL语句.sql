-- 创建数据库
CREATE DATABASE DB;
GO

-- 使用新创建的数据库
USE DB;
GO

-- 创建 DeptInfo 表
CREATE TABLE DeptInfo (
    Did INT IDENTITY(1,1) PRIMARY KEY,
    DName VARCHAR(50) NOT NULL
);

-- 创建 EmpInfo 表
CREATE TABLE EmpInfo (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    EmpSex CHAR(2) NOT NULL,
    Status VARCHAR(10) NOT NULL DEFAULT '在职',
    Tel VARCHAR(20),
    Did INT NOT NULL,
    Remark VARCHAR(MAX),
    FOREIGN KEY (Did) REFERENCES DeptInfo(Did)
);

-- 插入部门信息表数据
INSERT INTO DeptInfo (DName)
VALUES 
('人事部'),
('技术部'),
('财务部');

-- 插入员工信息表数据
INSERT INTO EmpInfo (EmpName, EmpSex, Status, Tel, Did, Remark)
VALUES 
('张伟强', '男', '在职', '13800000001', 1, '勤劳踏实'),
('李美丽', '女', '在职', '13800000002', 2, '工作细心'),
('王小明', '男', '离职', '13800000003', 3, '技术过硬'),
('赵晓红', '女', '在职', '13800000004', 1, '销售能手'),
('孙大圣', '男', '在职', '13800000005', 2, '市场精英'),
('周海燕', '女', '离职', '13800000006', 3, '前人力资源主管'),
('吴彦祖', '男', '在职', '13800000007', 1, '财务高手'),
('郑伊健', '男', '在职', '13800000008', 2, '研发新人');
