-- MySQL dump 10.13  Distrib 5.7.15, for Win64 (x86_64)
--
-- Host: localhost    Database: orkut
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fcount1`
--

DROP TABLE IF EXISTS `fcount1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fcount1` (
  `Profile_ID` varchar(10) DEFAULT NULL,
  `fcount` int(10) DEFAULT NULL,
  KEY `Profile_ID` (`Profile_ID`),
  CONSTRAINT `fcount1_ibfk_1` FOREIGN KEY (`Profile_ID`) REFERENCES `profile` (`Profile_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fcount1`
--

LOCK TABLES `fcount1` WRITE;
/*!40000 ALTER TABLE `fcount1` DISABLE KEYS */;
INSERT INTO `fcount1` VALUES ('12345',1),('14633',0),('14828',3),('15413',1),('56789',1),('15415',0);
/*!40000 ALTER TABLE `fcount1` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER friends_count BEFORE UPDATE ON fcount1 
     FOR EACH ROW BEGIN             
     IF NEW.Profile_ID=NEW.Profile_ID THEN
     SET NEW.fcount = NEW.fcount+1;
     END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `User_ID` varchar(10) NOT NULL,
  `Profile_ID` varchar(10) DEFAULT NULL,
  KEY `Profile_ID` (`Profile_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`Profile_ID`) REFERENCES `profile` (`Profile_ID`) ON DELETE CASCADE,
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `profile` (`Profile_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES ('14828','12345'),('12345','14828'),('14828','56789'),('56789','14828'),('14828','15413'),('15413','14828');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `Profile_ID` varchar(10) DEFAULT NULL,
  `Profile_ID1` varchar(10) DEFAULT NULL,
  `Profile_ID2` varchar(10) DEFAULT NULL,
  KEY `Profile_ID` (`Profile_ID`),
  KEY `Profile_ID1` (`Profile_ID1`),
  KEY `Profile_ID2` (`Profile_ID2`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`Profile_ID`) REFERENCES `profile` (`Profile_ID`),
  CONSTRAINT `log_ibfk_2` FOREIGN KEY (`Profile_ID1`) REFERENCES `profile` (`Profile_ID`),
  CONSTRAINT `log_ibfk_3` FOREIGN KEY (`Profile_ID2`) REFERENCES `profile` (`Profile_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `Post_ID` varchar(10) NOT NULL,
  `Post_Content` text,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Profile_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Post_ID`),
  KEY `Profile_ID` (`Profile_ID`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`Profile_ID`) REFERENCES `profile` (`Profile_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('112233','YASH IS gREAT','2017-11-23','02:58:39','14828'),('1232456','HELLO EVEERYONE','2017-11-23','08:10:02','12345'),('123456','yash','2017-11-25','02:54:34','12345'),('14828','HELLO','2017-11-23','01:38:14','14828'),('2313131','	sdhfsdjkhfkjsdh','2017-11-25','12:25:10','12345'),('3112542','hi shdkjahsdkja','2017-11-25','02:59:19','56789'),('32311551','hi sree here','2017-12-02','18:20:17','56789');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER PAYMENT_DATE BEFORE INSERT ON posts 
     FOR EACH ROW BEGIN             
     IF NEW.Post_ID IS NOT NULL THEN
     SET NEW.Date = SYSDATE();
     SET NEW.Time = SYSDATE();
     END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `Profile_ID` varchar(10) NOT NULL,
  `Profile_Photo` varchar(250) DEFAULT NULL,
  `Fname` varchar(20) DEFAULT NULL,
  `LName` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `P_Info` varchar(500) DEFAULT NULL,
  `Email_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Profile_ID`),
  UNIQUE KEY `Email_ID` (`Email_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES ('12345',NULL,'ADITI','BHATT','1998-06-13',20,'ABC','abc@abc.com'),('14633',NULL,'shruti','panale','1997-04-04',20,'hjasdj','shyu15cs'),('14828',NULL,'YASH','PUROHIT','1998-01-06',19,'subway anytime','samvityash@gmail.com'),('15413',NULL,'suman','kumar','2017-07-22',20,'abc','suku15cs@cmrit.ac.in'),('15415',NULL,'manish','shreshtha','1997-06-19',20,'abcabc','mach15cs'),('56789',NULL,'Sreelakshmi','Mr','1997-10-05',20,'sdfdf','srmr15cs');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign_in`
--

DROP TABLE IF EXISTS `sign_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_in` (
  `Email_ID` varchar(40) NOT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Profile_ID` varchar(10) DEFAULT NULL,
  KEY `Profile_ID` (`Profile_ID`),
  KEY `Email_ID` (`Email_ID`),
  CONSTRAINT `sign_in_ibfk_1` FOREIGN KEY (`Profile_ID`) REFERENCES `profile` (`Profile_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_in`
--

LOCK TABLES `sign_in` WRITE;
/*!40000 ALTER TABLE `sign_in` DISABLE KEYS */;
INSERT INTO `sign_in` VALUES ('abc@abc.com','12345','12345'),('shyu15cs','14633','14633'),('samvityash@gmail.com','14828','14828'),('suku15cs@cmrit.ac.in','1482815413','15413'),('srmr15cs','56789','56789'),('mach15cs','15415','15415');
/*!40000 ALTER TABLE `sign_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign_up`
--

DROP TABLE IF EXISTS `sign_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sign_up` (
  `Email_ID` varchar(40) NOT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Fname` varchar(20) DEFAULT NULL,
  `LName` varchar(20) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Profile_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Email_ID`),
  KEY `Profile_ID` (`Profile_ID`),
  CONSTRAINT `sign_up_ibfk_1` FOREIGN KEY (`Profile_ID`) REFERENCES `profile` (`Profile_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign_up`
--

LOCK TABLES `sign_up` WRITE;
/*!40000 ALTER TABLE `sign_up` DISABLE KEYS */;
INSERT INTO `sign_up` VALUES ('abc@abc.com','12345','ADITI',' BHATT','female','bangalore','12345'),('mach15cs','15415','manish','shreshtha','male','banaglore','15415'),('samvityash@gmail.com','14828','YASH','PUROHIT','male','bangalore','14828'),('shyu15cs','14633','shruti','panale','female','bangalore','14633'),('srmr15cs','56789','Sreelakshmi','Mr','female','bangalore','56789'),('suku15cs@cmrit.ac.in','1482815413','suman','kumar','male','bangalore','15413');
/*!40000 ALTER TABLE `sign_up` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-04 17:45:03
