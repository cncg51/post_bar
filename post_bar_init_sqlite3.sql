# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.28)
# Database: post_bar_init
# Generation Time: 2012-12-02 13:16:35 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` varchar(45) NOT NULL ,
  `display_name` varchar(45) NOT NULL ,
  `description` text NOT NULL 
) ;



# Dump of table comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `post_id` int(10) DEFAULT NULL ,
  `content` text ,
  `time` int(10) DEFAULT NULL ,
  `thanks` int(10) NOT NULL DEFAULT '0'
) ;



# Dump of table comment_thanks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comment_thanks`;

CREATE TABLE `comment_thanks` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` int(10) NOT NULL,
  `comment_id` int(10) NOT NULL,
  `time` int(10) NOT NULL
);



# Dump of table money
# ------------------------------------------------------------

DROP TABLE IF EXISTS `money`;

CREATE TABLE `money` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` int(10) NOT NULL,
  `money_type_id` int(10) NOT NULL ,
  `length` int(10) NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `balance` float NOT NULL DEFAULT '0' ,
  `foreign_id` int(11) DEFAULT '0' 
) ;



# Dump of table money_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `money_option`;

CREATE TABLE `money_option` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL
) ;

LOCK TABLES `money_option` WRITE;
/*!40000 ALTER TABLE `money_option` DISABLE KEYS */;

INSERT INTO `money_option` (`id`, `key`, `value`, `comment`)
VALUES
	(1,'post_cost','20','发帖基础花费财富'),
	(2,'post_cost_add','1','帖子每增加100字符花费'),
	(3,'post_length','200','帖子基础字符'),
	(4,'comment_length','100','评论基础字符'),
	(5,'comment_cost','5','评论基础花费'),
	(6,'comment_cost_add','1','评论每增加100字花费'),
	(7,'thanks_cost','10','感谢花费');

/*!40000 ALTER TABLE `money_option` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table money_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `money_type`;

CREATE TABLE `money_type` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL
) ;

LOCK TABLES `money_type` WRITE;
/*!40000 ALTER TABLE `money_type` DISABLE KEYS */;

INSERT INTO `money_type` (`id`, `name`, `comment`)
VALUES
	(1,'invite','邀请'),
	(2,'post','主题'),
	(3,'comment','评论'),
	(4,'post_thanks','感谢主题'),
	(5,'comment_thanks','感谢评论');

/*!40000 ALTER TABLE `money_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table node
# ------------------------------------------------------------

DROP TABLE IF EXISTS `node`;

CREATE TABLE `node` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `category_id` int(10) DEFAULT NULL,
  `name` varchar(45) NOT NULL ,
  `display_name` varchar(45) NOT NULL ,
  `description` text ,
  `icon` varchar(50) DEFAULT NULL
) ;



# Dump of table notify
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notify`;

CREATE TABLE `notify` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `type_id` int(11)  NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1'
);



# Dump of table notify_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notify_type`;

CREATE TABLE `notify_type` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `comment` varchar(50) DEFAULT NULL
);

LOCK TABLES `notify_type` WRITE;
/*!40000 ALTER TABLE `notify_type` DISABLE KEYS */;

INSERT INTO `notify_type` (`id`, `name`, `comment`)
VALUES
	(1,'comment','收到评论'),
	(2,'post_at','在帖子中提及'),
	(3,'comment_at','在回复中提及');

/*!40000 ALTER TABLE `notify_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `node_id` int(10) DEFAULT NULL ,
  `title` text NOT NULL ,
  `content` text NOT NULL,
  `time` int(10) NOT NULL ,
  `views` int(10) DEFAULT '0' ,
  `comments` int(10) DEFAULT '0' ,
  `thanks` int(10) NOT NULL DEFAULT '0',
  `last_update` int(10) DEFAULT NULL
) ;



# Dump of table post_thanks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_thanks`;

CREATE TABLE `post_thanks` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL,
  `time` int(10) NOT NULL
) ;



# Dump of table site
# ------------------------------------------------------------

DROP TABLE IF EXISTS `site`;

CREATE TABLE `site` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `key` varchar(50) DEFAULT NULL,
  `value` text);

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;

INSERT INTO `site` (`id`, `key`, `value`)
VALUES
	(1,'title','Post Bar你妹'),
	(2,'description','Web.py 的一个贴吧'),
	(3,'cookie_expires','604800'),
	(4,'site_url','127.0.0.1:8888');

/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL ,
  `password` varchar(45) DEFAULT NULL ,
  `gender` int(1) DEFAULT '1' ,
  `regist_time` int(10) DEFAULT NULL ,
  `signature` char(100) DEFAULT NULL ,
  `avatar` varchar(45) DEFAULT NULL ,
  `outsite_link` text ,
  `posts` int(10) DEFAULT '0',
  `money` float DEFAULT '2000',
  `node_favs` int(10) DEFAULT '0',
  `post_favs` int(10) DEFAULT '0',
  `user_favs` int(10) DEFAULT '0',
  `auth` varchar(5) NOT NULL DEFAULT ''
) ;



# Dump of table user_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_meta`;

CREATE TABLE `user_meta` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `user_id` int(10) NOT NULL,
  `meta_key` varchar(50) NOT NULL,
  `meta_value` varchar(50) NOT NULL
) ;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
