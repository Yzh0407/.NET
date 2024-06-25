-- 创建数据库
CREATE DATABASE movie_info_system;
GO

-- 使用数据库
USE movie_info_system;
GO

-- 创建电影信息表
CREATE TABLE movies (
    movie_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    actors VARCHAR(1000) NOT NULL,
    description VARCHAR(MAX) NOT NULL,
    cover_path VARCHAR(1000) NOT NULL,
    movie_path VARCHAR(1000) NOT NULL
);
GO

-- 插入示例数据
INSERT INTO movies (title, director, actors, description, cover_path, movie_path) VALUES
('盗梦空间', '克里斯托弗·诺兰', '莱昂纳多·迪卡普里奥', '一位盗梦者利用先进的技术进入他人梦境，进行商业间谍活动。', '/covers/inception.jpg', '/movies/inception.mp4'),
('蝙蝠侠：黑暗骑士', '克里斯托弗·诺兰', '克里斯蒂安·贝尔', '在这部续集中，蝙蝠侠面对着新的敌人小丑，试图拯救哥谭市。', '/covers/dark_knight.jpg', '/movies/dark_knight.mp4'),
('星际穿越', '克里斯托弗·诺兰', '马修·麦康纳', '一群探险者利用新发现的虫洞来超越以前人类太空旅行的极限，寻找人类的未来家园。', '/covers/interstellar.jpg', '/movies/interstellar.mp4');
GO

select * from movies
