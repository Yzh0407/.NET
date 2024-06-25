-- �������ݿ�
CREATE DATABASE movie_info_system;
GO

-- ʹ�����ݿ�
USE movie_info_system;
GO

-- ������Ӱ��Ϣ��
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

-- ����ʾ������
INSERT INTO movies (title, director, actors, description, cover_path, movie_path) VALUES
('���οռ�', '����˹�и���ŵ��', '�����ɶࡤ�Ͽ������', 'һλ�����������Ƚ��ļ������������ξ���������ҵ������', '/covers/inception.jpg', '/movies/inception.mp4'),
('���������ڰ���ʿ', '����˹�и���ŵ��', '����˹�ٰ�������', '���ⲿ�����У�������������µĵ���С����ͼ���ȸ�̷�С�', '/covers/dark_knight.jpg', '/movies/dark_knight.mp4'),
('�Ǽʴ�Խ', '����˹�и���ŵ��', '���ޡ�����', 'һȺ̽���������·��ֵĳ涴����Խ��ǰ����̫�����еļ��ޣ�Ѱ�������δ����԰��', '/covers/interstellar.jpg', '/movies/interstellar.mp4');
GO

select * from movies
