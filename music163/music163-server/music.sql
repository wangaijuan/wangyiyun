#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS music;
#创建数据库，设置编码
CREATE DATABASE music CHARSET=UTF8;
#进入创建的数据库
USE music;

#创建保存用户的表格
CREATE TABLE user(
  uid SMALLINT PRIMARY KEY,
  uname VARCHAR(50) ,
  upwd VARCHAR(32) ,
  phone VARCHAR(20)
);
#插入数据
INSERT INTO user VALUES(1,'yiyi','123456','13052321201');
INSERT INTO user VALUES(2,'haha','111111','16523201456');
INSERT INTO user VALUES(3,'jj','jj','18032015210');
INSERT INTO user VALUES(4,'jack','jack000','17632018956');


#创建保存歌曲的表格
CREATE TABLE song(
  s_id SMALLINT PRIMARY KEY,
  s_name VARCHAR(20),
  s_man VARCHAR(20),
  s_style VARCHAR(20),
  s_pic VARCHAR(255)
);
#插入数据
#id , 歌曲名, 歌手，主题，图片
INSERT INTO song VALUES(1,'少女','林宥嘉','流行','01.png');
INSERT INTO song VALUES(2,'从前从前','邹年慈','民谣','02.png');
INSERT INTO song VALUES(3,'将故事写成我们','林俊杰','华语','03.png');
INSERT INTO song VALUES(4,'不顾一切','TimeCrosser乐队','摇滚','04.png');
INSERT INTO song VALUES(5,'天上月','郝宇星','民谣','05.png');
INSERT INTO song VALUES(6,'最美的期待','周笔畅','流行','06.png');
INSERT INTO song VALUES(7,'OK','Robin Schulz','电子','07.png');
INSERT INTO song VALUES(8,'一如少年模样','陈鸿宇','民谣','08.png');
INSERT INTO song VALUES(9,'还想听你的故事','谢春花','民谣','09.png');

#创建保存歌手的表格
CREATE TABLE singer(
  r_id SMALLINT PRIMARY KEY,
  r_name VARCHAR(20),
  r_sex VARCHAR(8) ,
  r_area VARCHAR(8)
);
#插入数据
#id, 歌手名，性别，地区
INSERT INTO singer VALUES(1,'林俊杰','1','华语');
INSERT INTO singer VALUES(2,'周杰伦','1','华语');
INSERT INTO singer VALUES(3,'王菲','0','华语');
INSERT INTO singer VALUES(4,'张韶涵','0','华语');
INSERT INTO singer VALUES(5,'Alan Walker','1','欧美');
INSERT INTO singer VALUES(6,'Justin Bieber','1','欧美');
INSERT INTO singer VALUES(7,'Sia','0','欧美');
INSERT INTO singer VALUES(8,'Taylor Swift','0','欧美');
INSERT INTO singer VALUES(9,'Adele','0','欧美');
INSERT INTO singer VALUES(10,'Aimer','0','日本');
INSERT INTO singer VALUES(11,'DAOKO','0','日本');
INSERT INTO singer VALUES(12,'G-Dragon','1','韩国');
INSERT INTO singer VALUES(13,'IU','0','韩国');
INSERT INTO singer VALUES(14,'BTS','2','韩国');
INSERT INTO singer VALUES(15,'TWICE','2','韩国');
INSERT INTO singer VALUES(16,'AniFace','1','其他');
INSERT INTO singer VALUES(17,'Lata Mangeshkar','0','其他');