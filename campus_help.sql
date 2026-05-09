/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.37 : Database - campus_help
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`campus_help` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `campus_help`;

/*Table structure for table `availabilities` */

DROP TABLE IF EXISTS `availabilities`;

CREATE TABLE `availabilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `seller_id` int(11) NOT NULL COMMENT '关联users表id',
  `available_date` date NOT NULL COMMENT '空闲日期',
  `time_slot` varchar(50) NOT NULL COMMENT '时间段，如: 08:00-10:00 或 第1-2节',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态: 0-空闲(可预订), 1-已预订',
  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `availabilities_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='卖家空闲时间表';

/*Data for the table `availabilities` */

insert  into `availabilities`(`id`,`seller_id`,`available_date`,`time_slot`,`status`) values (1,2,'2025-11-29','14:00-16:00 (第5-6节)',1),(2,2,'2025-11-29','16:00-18:00 (第7-8节)',1),(3,3,'2025-11-30','08:00-10:00 (第1-2节)',0),(4,2,'2025-11-29','10:00-12:00',1),(5,2,'2025-11-30','12-14',0),(6,2,'2025-11-29','第三节 (09:50~10:35)',1),(7,2,'2025-11-29','第一节 (08:00~08:45)',1),(8,2,'2025-11-29','第六节 (13:30~14:15)',0),(9,2,'2025-11-29','第二节 (08:50~09:35)',0),(10,4,'2025-11-29','第一节 (08:00~08:45)',0),(11,2,'2025-11-30','第一节 (08:00~08:45)',1),(12,7,'2025-11-30','第一节 (08:00~08:45)',1),(13,7,'2025-11-30','第二节 (08:50~09:35)',0),(14,7,'2025-11-30','第五节 (11:30~12:15)',0),(15,7,'2025-11-30','第四节 (10:40~11:25)',0),(16,7,'2025-11-30','第三节 (09:50~10:35)',0);

/*Table structure for table `chat_messages` */

DROP TABLE IF EXISTS `chat_messages`;

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sender_id` int(11) NOT NULL COMMENT '发送者ID',
  `receiver_id` int(11) NOT NULL COMMENT '接收者ID',
  `content` text NOT NULL COMMENT '聊天内容',
  `is_read` tinyint(4) DEFAULT '0' COMMENT '是否已读: 0-未读, 1-已读',
  `send_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='聊天记录表';

/*Data for the table `chat_messages` */

insert  into `chat_messages`(`id`,`sender_id`,`receiver_id`,`content`,`is_read`,`send_time`) values (1,4,2,'123',0,'2025-11-28 19:45:06'),(2,2,4,'123',0,'2025-11-28 19:45:15'),(3,4,2,'你好',0,'2025-11-28 19:45:27'),(4,2,4,'你好',0,'2025-11-28 19:45:32'),(5,4,4,'你好',0,'2025-11-28 20:13:28'),(6,4,4,'你好',0,'2025-11-28 20:13:32'),(7,4,2,'你',0,'2025-11-28 20:14:13'),(8,4,2,'好',0,'2025-11-28 20:14:19'),(9,2,4,'课时已完成',0,'2025-11-28 20:14:38'),(10,4,2,'你好',0,'2025-11-29 13:54:13'),(11,4,4,'你好',0,'2025-11-29 13:54:27'),(12,4,4,'你好',0,'2025-11-29 13:54:37'),(13,4,10,'你好',0,'2025-11-29 14:01:55'),(14,2,4,'nihao ',0,'2025-11-29 14:02:49'),(15,2,5,'nihao',0,'2025-11-29 14:04:23'),(16,2,5,'你好',0,'2025-11-29 14:04:45'),(17,4,10,'你好',0,'2025-11-29 14:23:27'),(18,5,2,'你好',0,'2025-11-29 14:25:02'),(19,5,2,'你好',0,'2025-11-29 14:26:02'),(20,2,6,'你好',0,'2025-11-29 14:41:36'),(21,6,2,'您好',0,'2025-11-29 14:41:46'),(22,2,6,'同学你男生女生',0,'2025-11-29 14:41:51'),(23,6,2,'我是女生',0,'2025-11-29 14:41:54'),(24,2,6,'666',0,'2025-11-29 14:41:58'),(25,2,6,'加个微信吧',0,'2025-11-29 14:42:01'),(26,6,2,'好的',0,'2025-11-29 14:42:07'),(27,1,6,'qusiba啊你',0,'2025-11-29 14:46:01'),(28,4,2,'你好',0,'2025-11-29 16:16:34'),(29,2,4,'你好',0,'2025-11-29 16:17:13'),(30,2,4,'你好',0,'2025-11-29 17:33:14'),(31,7,7,'你好',0,'2025-11-29 17:39:59'),(32,7,4,'同学，明天需要点名吗',0,'2025-11-29 17:40:21'),(33,7,7,'你好',0,'2025-11-29 17:40:37'),(34,7,4,'你好',0,'2025-11-29 17:40:42'),(35,7,4,'你好',0,'2025-11-29 17:54:24'),(36,4,7,'nihao ',0,'2025-11-29 17:54:35'),(37,7,4,'你好',0,'2025-11-29 17:54:39');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_no` varchar(64) NOT NULL COMMENT '订单编号(程序生成)',
  `buyer_id` int(11) NOT NULL COMMENT '买家ID',
  `seller_id` int(11) NOT NULL COMMENT '卖家ID',
  `availability_id` int(11) NOT NULL COMMENT '关联的空闲时间ID',
  `course_name` varchar(100) NOT NULL COMMENT '代课课程名称',
  `classroom` varchar(100) NOT NULL COMMENT '教室地点',
  `price` decimal(10,2) NOT NULL COMMENT '订单价格',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态: 0-待接单, 1-进行中, 2-已完成, 3-已取消',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `is_rated` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `buyer_id` (`buyer_id`),
  KEY `seller_id` (`seller_id`),
  KEY `availability_id` (`availability_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`availability_id`) REFERENCES `availabilities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

/*Data for the table `orders` */

insert  into `orders`(`id`,`order_no`,`buyer_id`,`seller_id`,`availability_id`,`course_name`,`classroom`,`price`,`status`,`create_time`,`is_rated`) values (1,'60527e1ef46a4df1a050c81da85c6b16',4,2,1,'高等数学','201','30.00',2,'2025-11-28 16:56:45',1),(2,'e1ccd89d3cf74c569fead3ec1db65f4f',4,2,7,'高等数学','212','20.00',2,'2025-11-28 20:14:04',1),(3,'f52713f718954a3fb59f11196034946a',5,2,2,'高等数学','201','30.00',2,'2025-11-29 14:03:50',0),(4,'1cc73c161ed74045b2ffa65304448bad',6,2,11,'高等数学','xxb205','50.00',2,'2025-11-29 14:41:16',0),(5,'0d49f3df23154915b867c106adc3f060',2,2,4,'高等数学','201','10.00',2,'2025-11-29 15:27:32',1),(6,'c891b257330e456b88c07c98160a341f',4,2,6,'高等数学','210','30.00',2,'2025-11-29 16:16:28',1),(7,'6aa14d3f16f644c2a18a3995141ec834',4,7,12,'英语一','201','20.00',2,'2025-11-29 17:39:06',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) NOT NULL COMMENT '登录账号',
  `password` varchar(100) NOT NULL COMMENT '登录密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `role` varchar(20) NOT NULL COMMENT '角色: ADMIN, BUYER, SELLER',
  `contact_info` varchar(100) DEFAULT NULL COMMENT '联系方式(手机/微信)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '钱包余额',
  `credit_score` int(11) DEFAULT '100' COMMENT '信誉分',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`nickname`,`role`,`contact_info`,`created_at`,`balance`,`credit_score`) values (1,'admin','123456','系统管理员','ADMIN','admin@school.com','2025-11-28 15:48:33','0.00',100),(2,'seller01','123456','学霸小明','SELLER','VX: ming123','2025-11-28 15:48:33','54.00',115),(3,'seller02','123456','勤工俭学小红','SELLER','VX: hong666','2025-11-28 15:48:33','0.00',100),(4,'buyer01','123456','偷懒的张三','BUYER','VX: zhang333','2025-11-28 15:48:33','50.00',100),(5,'test_1','123456','菲菲雨','BUYER','','2025-11-28 20:02:06','0.00',100),(6,'hh7788112','hh7788112','梁晨','BUYER','123456789','2025-11-29 14:39:36','0.00',100),(7,'吕小布','Lmz123456','lvxiaobu','SELLER','2264491976@qq,com','2025-11-29 17:36:00','18.00',105);

/*Table structure for table `withdraws` */

DROP TABLE IF EXISTS `withdraws`;

CREATE TABLE `withdraws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT '提现金额',
  `status` tinyint(4) DEFAULT '0' COMMENT '0-待审核, 1-已打款, 2-已驳回',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `withdraws_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `withdraws` */

insert  into `withdraws`(`id`,`user_id`,`amount`,`status`,`create_time`) values (1,2,'36.00',1,'2025-11-29 15:28:27'),(2,7,'18.00',1,'2025-11-29 17:55:18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
