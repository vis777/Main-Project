/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.31 : Database - health_chatbot
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`health_chatbot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `health_chatbot`;

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `Chatid` int NOT NULL AUTO_INCREMENT,
  `Chat` varchar(100) DEFAULT NULL,
  `fromid` int DEFAULT NULL,
  `toid` int DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Chatid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chat` */

insert  into `chat`(`Chatid`,`Chat`,`fromid`,`toid`,`Date`) values 
(1,'hi',3,7,'2023-03-23'),
(2,'hlo',3,7,'2023-03-23'),
(3,'hh',3,7,'2023-03-23'),
(4,'hlo',3,7,'2023-03-23'),
(5,'sd',3,7,'2023-03-23'),
(6,'hi',2,13,'2023-03-23'),
(7,'hello',2,13,'2023-03-23'),
(8,'good morning\r\n',2,3,'2023-03-23'),
(9,'ok',3,2,'2023-03-23');

/*Table structure for table `chatbot` */

DROP TABLE IF EXISTS `chatbot`;

CREATE TABLE `chatbot` (
  `Chid` int NOT NULL AUTO_INCREMENT,
  `Dataid` int DEFAULT NULL,
  `Reply` varchar(100) DEFAULT NULL,
  `Send` int DEFAULT NULL,
  PRIMARY KEY (`Chid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot` */

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `Cid` int NOT NULL AUTO_INCREMENT,
  `lid` int DEFAULT NULL,
  `Complaint` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  `Reply` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `complaint` */

insert  into `complaint`(`Cid`,`lid`,`Complaint`,`Date`,`Reply`) values 
(1,3,'bad','01/01/2000','okkkkkk'),
(2,3,'gfxgf','2023-03-23','ok');

/*Table structure for table `dataset` */

DROP TABLE IF EXISTS `dataset`;

CREATE TABLE `dataset` (
  `Dataid` int NOT NULL AUTO_INCREMENT,
  `Question` varchar(100) DEFAULT NULL,
  `Answer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Dataid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dataset` */

insert  into `dataset`(`Dataid`,`Question`,`Answer`) values 
(1,'soibns?','sahdf'),
(2,'ok','qwe');

/*Table structure for table `disease` */

DROP TABLE IF EXISTS `disease`;

CREATE TABLE `disease` (
  `Did` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Did`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `disease` */

insert  into `disease`(`Did`,`Name`) values 
(1,'cold'),
(2,'ok'),
(3,'fever'),
(4,'Stomach ache');

/*Table structure for table `expert` */

DROP TABLE IF EXISTS `expert`;

CREATE TABLE `expert` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `lid` int DEFAULT NULL,
  `Fname` varchar(100) DEFAULT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  `Place` varchar(100) DEFAULT NULL,
  `Post` varchar(100) DEFAULT NULL,
  `Pin` bigint DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` bigint DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `expert` */

insert  into `expert`(`eid`,`lid`,`Fname`,`Lname`,`Place`,`Post`,`Pin`,`Email`,`Phone`,`area`) values 
(1,2,'RAM','KK','KOZHIKODE','MANANACHIRA',670045,'ram@gmail.com',944789898,'NEAR KSRTC'),
(2,5,'sdsd','wwewe','wwwere','ertrrt',56567677,'v2gmail.com',6666,NULL),
(3,6,'sdklanf','sdfsdf','wrtqegwr','wsdfq',1235,'a@gmail.com',675649,NULL);

/*Table structure for table `home remedies` */

DROP TABLE IF EXISTS `home remedies`;

CREATE TABLE `home remedies` (
  `Hid` int NOT NULL AUTO_INCREMENT,
  `Did` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Remedy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Hid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `home remedies` */

insert  into `home remedies`(`Hid`,`Did`,`Name`,`Remedy`) values 
(1,1,'vishnu','hot water'),
(2,3,'tablet','paracetamol');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `login` */

insert  into `login`(`lid`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'expert','expert','expert'),
(3,'user','user','user'),
(4,'werty','werty','expert'),
(5,'ttt','tttt','expert'),
(6,'vishnu','vishnu','expert'),
(8,'vish','nair','user'),
(9,'vish','nair','user'),
(10,'vish','nair','user'),
(11,'','','user'),
(12,'','','user'),
(13,'hhhh','uhhhh','user');

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `Rid` int NOT NULL AUTO_INCREMENT,
  `Eid` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  `lid` int DEFAULT NULL,
  PRIMARY KEY (`Rid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `rating` */

insert  into `rating`(`Rid`,`Eid`,`Rating`,`Date`,`lid`) values 
(1,2,5,'10/12/2000',3),
(2,2,1,'2023-03-23',3),
(3,2,1,'2023-03-23',3);

/*Table structure for table `suggestions` */

DROP TABLE IF EXISTS `suggestions`;

CREATE TABLE `suggestions` (
  `Sid` int NOT NULL AUTO_INCREMENT,
  `Eid` int DEFAULT NULL,
  `Suggestions` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `suggestions` */

insert  into `suggestions`(`Sid`,`Eid`,`Suggestions`,`Description`,`Date`) values 
(1,2,'wertwer','dsfg','02/12/2022'),
(2,5,'dafgadgdfg','dfg','02/22/2132'),
(3,2,'anything else','nope','2023-03-16');

/*Table structure for table `symptoms` */

DROP TABLE IF EXISTS `symptoms`;

CREATE TABLE `symptoms` (
  `Sid` int NOT NULL AUTO_INCREMENT,
  `Did` int DEFAULT NULL,
  `Symptoms` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `symptoms` */

insert  into `symptoms`(`Sid`,`Did`,`Symptoms`) values 
(1,1,'cough');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Uid` int NOT NULL AUTO_INCREMENT,
  `lid` int DEFAULT NULL,
  `Fname` varchar(100) DEFAULT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  `Place` varchar(100) DEFAULT NULL,
  `Post` varchar(100) DEFAULT NULL,
  `Pin` bigint DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` bigint DEFAULT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`Uid`,`lid`,`Fname`,`Lname`,`Place`,`Post`,`Pin`,`Email`,`Phone`) values 
(1,3,'vishnu','nair','aksdj','12423',123,'v@gmail.com',12423),
(2,13,'aswasw','hhhhhhhhh','ghhghg','vbn',78788,'as@gmaik,,,jhh',678);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
