-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: guacamole
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Current Database: `guacamole`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `guacamole` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `guacamole`;

--
-- Table structure for table `guacamole_connection`
--

DROP TABLE IF EXISTS `guacamole_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_connection` (
  `connection_id` int NOT NULL AUTO_INCREMENT,
  `connection_name` varchar(128) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `protocol` varchar(32) NOT NULL,
  `proxy_port` int DEFAULT NULL,
  `proxy_hostname` varchar(512) DEFAULT NULL,
  `proxy_encryption_method` enum('NONE','SSL') DEFAULT NULL,
  `max_connections` int DEFAULT NULL,
  `max_connections_per_user` int DEFAULT NULL,
  `connection_weight` int DEFAULT NULL,
  `failover_only` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`connection_id`),
  UNIQUE KEY `connection_name_parent` (`connection_name`,`parent_id`),
  KEY `guacamole_connection_ibfk_1` (`parent_id`),
  CONSTRAINT `guacamole_connection_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `guacamole_connection_group` (`connection_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_connection`
--

LOCK TABLES `guacamole_connection` WRITE;
/*!40000 ALTER TABLE `guacamole_connection` DISABLE KEYS */;
INSERT INTO `guacamole_connection` VALUES (2,'guacamole',NULL,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0),(5,'ubuntu',NULL,'vnc',NULL,NULL,NULL,NULL,NULL,NULL,0),(7,'dishant',NULL,'vnc',NULL,NULL,NULL,NULL,NULL,NULL,0),(9,'lakshmi',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(11,'debapriyo',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(13,'anirudh',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(14,'medha',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(18,'ajit',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(20,'prem-kori',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(23,'pallavi-solanki',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(28,'sheetal-mohite',NULL,'rdp',NULL,NULL,'NONE',NULL,NULL,NULL,0),(29,'pallavi-pawar',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(30,'suman-singh',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(34,'vivek-macha',NULL,'rdp',NULL,NULL,'NONE',NULL,NULL,NULL,0),(38,'elango',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(41,'kailash',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(43,'kesar-pandita-new',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(44,'prashant-thorat-new',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(45,'rohit-intern',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(50,'kristoff',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(51,'ashish-mishra-new',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(53,'sayali-simpdd',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(54,'axis-s2fs',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(55,'elango-rhel',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(56,'leslie',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(57,'ajit-rhel',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(61,'james-durai',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(62,'axis-sftp',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(63,'karthik-nair',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(64,'prem-test',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(66,'sanjose_mary',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(67,'ashish_singh',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(68,'chetan-kapadia',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(70,'vishwajit-ln',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(71,'jenkins',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(73,'simuam',NULL,'rdp',NULL,NULL,NULL,2,NULL,NULL,0),(74,'bhavna',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(75,'CouchDB-Deepak',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(76,'CouchDB-cieck',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(77,'RHEL8-New-App-deepak',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(79,'ajit-new',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(80,'scoland-Dbs',NULL,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0),(81,'RHEL8-New-App-cieck',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(82,'RHEL8-New-App-Salaton',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(83,'chaitanya',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(84,'vieer-dubey',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(86,'shuhaib',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `guacamole_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_connection_attribute`
--

DROP TABLE IF EXISTS `guacamole_connection_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_connection_attribute` (
  `connection_id` int NOT NULL,
  `attribute_name` varchar(128) NOT NULL,
  `attribute_value` varchar(4096) NOT NULL,
  PRIMARY KEY (`connection_id`,`attribute_name`),
  KEY `connection_id` (`connection_id`),
  CONSTRAINT `guacamole_connection_attribute_ibfk_1` FOREIGN KEY (`connection_id`) REFERENCES `guacamole_connection` (`connection_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_connection_attribute`
--

LOCK TABLES `guacamole_connection_attribute` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_connection_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_connection_group`
--

DROP TABLE IF EXISTS `guacamole_connection_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_connection_group` (
  `connection_group_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `connection_group_name` varchar(128) NOT NULL,
  `type` enum('ORGANIZATIONAL','BALANCING') NOT NULL DEFAULT 'ORGANIZATIONAL',
  `max_connections` int DEFAULT NULL,
  `max_connections_per_user` int DEFAULT NULL,
  `enable_session_affinity` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`connection_group_id`),
  UNIQUE KEY `connection_group_name_parent` (`connection_group_name`,`parent_id`),
  KEY `guacamole_connection_group_ibfk_1` (`parent_id`),
  CONSTRAINT `guacamole_connection_group_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `guacamole_connection_group` (`connection_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_connection_group`
--

LOCK TABLES `guacamole_connection_group` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_connection_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_connection_group_attribute`
--

DROP TABLE IF EXISTS `guacamole_connection_group_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_connection_group_attribute` (
  `connection_group_id` int NOT NULL,
  `attribute_name` varchar(128) NOT NULL,
  `attribute_value` varchar(4096) NOT NULL,
  PRIMARY KEY (`connection_group_id`,`attribute_name`),
  KEY `connection_group_id` (`connection_group_id`),
  CONSTRAINT `guacamole_connection_group_attribute_ibfk_1` FOREIGN KEY (`connection_group_id`) REFERENCES `guacamole_connection_group` (`connection_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_connection_group_attribute`
--

LOCK TABLES `guacamole_connection_group_attribute` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_group_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_connection_group_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_connection_group_permission`
--

DROP TABLE IF EXISTS `guacamole_connection_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_connection_group_permission` (
  `entity_id` int NOT NULL,
  `connection_group_id` int NOT NULL,
  `permission` enum('READ','UPDATE','DELETE','ADMINISTER') NOT NULL,
  PRIMARY KEY (`entity_id`,`connection_group_id`,`permission`),
  KEY `guacamole_connection_group_permission_ibfk_1` (`connection_group_id`),
  CONSTRAINT `guacamole_connection_group_permission_entity` FOREIGN KEY (`entity_id`) REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `guacamole_connection_group_permission_ibfk_1` FOREIGN KEY (`connection_group_id`) REFERENCES `guacamole_connection_group` (`connection_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_connection_group_permission`
--

LOCK TABLES `guacamole_connection_group_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_group_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_connection_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_connection_history`
--

DROP TABLE IF EXISTS `guacamole_connection_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_connection_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `username` varchar(128) NOT NULL,
  `remote_host` varchar(256) DEFAULT NULL,
  `connection_id` int DEFAULT NULL,
  `connection_name` varchar(128) NOT NULL,
  `sharing_profile_id` int DEFAULT NULL,
  `sharing_profile_name` varchar(128) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `connection_id` (`connection_id`),
  KEY `sharing_profile_id` (`sharing_profile_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `connection_start_date` (`connection_id`,`start_date`),
  CONSTRAINT `guacamole_connection_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `guacamole_user` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `guacamole_connection_history_ibfk_2` FOREIGN KEY (`connection_id`) REFERENCES `guacamole_connection` (`connection_id`) ON DELETE SET NULL,
  CONSTRAINT `guacamole_connection_history_ibfk_3` FOREIGN KEY (`sharing_profile_id`) REFERENCES `guacamole_sharing_profile` (`sharing_profile_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_connection_history`
--

LOCK TABLES `guacamole_connection_history` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_history` DISABLE KEYS */;
INSERT INTO `guacamole_connection_history` VALUES (1,55,'vivek-macha','103.172.226.46',34,'vivek-macha',NULL,NULL,'2023-05-06 09:44:03','2023-05-06 11:20:30'),(2,21,'ashish-mishra','103.205.173.151',51,'ashish-mishra-new',NULL,NULL,'2023-05-06 15:28:24','2023-05-06 15:59:22'),(3,67,'shuhaib','117.208.255.196',86,'shuhaib',NULL,NULL,'2023-05-06 16:44:14','2023-05-06 16:44:30'),(4,67,'shuhaib','117.208.255.196',86,'shuhaib',NULL,NULL,'2023-05-06 16:44:40','2023-05-06 16:44:55'),(5,67,'shuhaib','117.208.255.196',86,'shuhaib',NULL,NULL,'2023-05-06 16:45:10','2023-05-06 16:45:26'),(6,67,'shuhaib','117.208.255.196',86,'shuhaib',NULL,NULL,'2023-05-06 16:45:41','2023-05-06 16:45:57'),(7,67,'shuhaib','117.208.255.196',86,'shuhaib',NULL,NULL,'2023-05-06 16:46:12','2023-05-06 16:46:28'),(8,67,'shuhaib','117.208.255.196',86,'shuhaib',NULL,NULL,'2023-05-07 06:23:08','2023-05-07 06:23:24'),(9,67,'shuhaib','117.208.255.196',86,'shuhaib',NULL,NULL,'2023-05-07 06:23:27','2023-05-07 06:23:29'),(10,67,'shuhaib','117.208.255.196',86,'shuhaib',NULL,NULL,'2023-05-07 06:23:30','2023-05-07 06:23:38'),(11,17,'prem-kori','43.241.129.18',64,'prem-test',NULL,NULL,'2023-05-07 07:22:23','2023-05-07 07:22:38'),(12,17,'prem-kori','43.241.129.18',64,'prem-test',NULL,NULL,'2023-05-07 07:22:54','2023-05-07 07:23:00'),(13,17,'prem-kori','43.241.129.18',64,'prem-test',NULL,NULL,'2023-05-07 07:23:16','2023-05-07 07:23:23'),(14,17,'prem-kori','43.241.129.18',64,'prem-test',NULL,NULL,'2023-05-07 07:23:37','2023-05-07 07:23:53'),(15,17,'prem-kori','43.241.129.18',64,'prem-test',NULL,NULL,'2023-05-07 07:23:58','2023-05-07 07:29:36'),(16,17,'prem-kori','43.241.129.18',64,'prem-test',NULL,NULL,'2023-05-07 07:34:09','2023-05-07 07:34:44'),(17,67,'shuhaib','117.255.108.215',86,'shuhaib',NULL,NULL,'2023-05-07 08:45:07','2023-05-07 08:45:22'),(18,61,'bhavna','115.96.218.178',74,'bhavna',NULL,NULL,'2023-05-08 03:12:52','2023-05-08 03:27:23'),(19,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:19:38','2023-05-08 04:19:54'),(20,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:20:09','2023-05-08 04:20:24'),(21,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:20:40','2023-05-08 04:20:56'),(22,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:21:07','2023-05-08 04:21:23'),(23,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:21:38','2023-05-08 04:21:54'),(24,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:22:19','2023-05-08 04:22:34'),(25,54,'sanjose_mary','45.249.171.80',66,'sanjose_mary',NULL,NULL,'2023-05-08 04:16:10','2023-05-08 04:22:39'),(26,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:22:49','2023-05-08 04:23:05'),(27,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:23:20','2023-05-08 04:23:36'),(28,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:23:51','2023-05-08 04:24:06'),(29,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:24:21','2023-05-08 04:24:35'),(30,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:24:35','2023-05-08 04:24:51'),(31,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:25:05','2023-05-08 04:25:20'),(32,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:25:36','2023-05-08 04:25:37'),(33,56,'chetan-kapadia','103.87.28.30',68,'chetan-kapadia',NULL,NULL,'2023-05-08 04:16:53','2023-05-08 04:29:34'),(34,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:25:59','2023-05-08 04:36:51'),(35,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:37:07','2023-05-08 04:44:15'),(36,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:44:20','2023-05-08 04:44:37'),(37,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:45:03','2023-05-08 04:45:20'),(38,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:45:36','2023-05-08 04:45:53'),(39,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:46:09','2023-05-08 04:46:26'),(40,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:46:42','2023-05-08 04:52:01'),(41,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:52:18','2023-05-08 04:52:35'),(42,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 04:53:01','2023-05-08 05:01:00'),(43,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 05:01:16','2023-05-08 05:11:43'),(44,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 05:11:58','2023-05-08 05:16:00'),(45,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 05:16:11','2023-05-08 05:25:48'),(46,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 05:26:04','2023-05-08 05:26:21'),(47,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 05:26:36','2023-05-08 05:26:53'),(48,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 05:27:18','2023-05-08 05:27:35'),(49,26,'sheetal-mohite','42.107.132.87',73,'simuam',NULL,NULL,'2023-05-08 05:28:00','2023-05-08 05:30:29'),(50,26,'sheetal-mohite','49.33.242.250',28,'sheetal-mohite',NULL,NULL,'2023-05-08 05:37:30','2023-05-08 05:42:35'),(51,26,'sheetal-mohite','49.33.242.250',28,'sheetal-mohite',NULL,NULL,'2023-05-08 05:42:46','2023-05-08 05:47:46'),(52,61,'bhavna','115.96.218.178',74,'bhavna',NULL,NULL,'2023-05-08 03:29:00','2023-05-08 05:49:01'),(53,26,'sheetal-mohite','49.33.242.250',28,'sheetal-mohite',NULL,NULL,'2023-05-08 05:48:02','2023-05-08 05:53:05');
/*!40000 ALTER TABLE `guacamole_connection_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_connection_parameter`
--

DROP TABLE IF EXISTS `guacamole_connection_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_connection_parameter` (
  `connection_id` int NOT NULL,
  `parameter_name` varchar(128) NOT NULL,
  `parameter_value` varchar(4096) NOT NULL,
  PRIMARY KEY (`connection_id`,`parameter_name`),
  CONSTRAINT `guacamole_connection_parameter_ibfk_1` FOREIGN KEY (`connection_id`) REFERENCES `guacamole_connection` (`connection_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_connection_parameter`
--

LOCK TABLES `guacamole_connection_parameter` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_parameter` DISABLE KEYS */;
INSERT INTO `guacamole_connection_parameter` VALUES (2,'hostname','65.2.66.144'),(2,'port','22'),(2,'private-key','-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAhuRl/zt6r3DIOQF9J7OyzRXqvbPdLAgXkzMZwR4Q2vZxegz1\nGq6Lb+Js+Rs1D+ufdgeW8BmkzFXAIK2bzW1RD7W+Ab1YgIJtnOajY4avhXwDcTgi\nS0yX7kjCzL0LE/YMOQmg6j22KLOj2vu7gTRwPEH1HxEE/C4int3ewg7CE1wYnXaT\nLLB7HMgDGZt2sgP+7EN6mAKs5w2IUc5jeAW43jN7bHwu2lnDZkb+I8O3efqZJfHx\n1pIj5t+3MbBHCXyoTSyenOi/H/nv3fHRoeg8SvpzIMGHipCWTL3WPWLVwMMFVqmR\nEQahGQJPY/EMd7d2QhO7I4Dq1uC0oZesTw9//wIDAQABAoIBAF74XStmeAkfEYi5\nGKGkLeWgYaXwBW6jv91eI+rIPTu8OMaiasq/SuKZ+vkjg6dSz/EshMNEerd2RA99\ny2zFY0X5Qe49nhrUOVI3O5+tytPjLRVAXTzAj1MvnR7ClhMWryJVOhrRGffsChf6\nFdhwz/hMw8R8mhLmdG9/a/8ant87dsWlWyaHH6bREUvL8t3eNotSQelnQDWLJEXJ\nfmd+8+WrX4KDyeVB1ly+04KXKDQciO783lsrEZymmIYiE++l0++NB0RH9YArNX+E\neDQ9XMYD5KbHMhI8jIKWtL6j2tX4uTIky9RxZWlw3MsX9J6B0W57O4YInzMpScCL\noy5dmrkCgYEA1dIuop6mmus518G00yI87s8tpjHiXvJlXuYFUTy8gbuIBSNabAx9\nbnCBtnnInUTBdSWSksFLvMuhac4ae3NpirGRwkYDHfdRAMGnpIax2Rpj9VhWf5Ws\n1g0MTMn2Oo3+khFNNo3z8DjTJqDpmbSLfdotTjC/DO+EsbGafofjmEsCgYEAoYBc\n4Tb1OAFklEy0CoVTBn7fo5ZwaWdhfslEvs2eOnpAmNLrh8x1XV+aCSfQ7nsgZqHw\nAukUxnWjo6/4NYOiO+vQy7426uY+brLc4i9TvjNXdFSfSl8wn3JvrYSTc8HNfjDI\nUPwBkHx1iuNCklWuUgH/ezSoe4Hm8dgm1hgVDp0CgYEAhp/qSutW/K1j4uuMXW7u\nLHH3TO+VlrBJkQGEkYyLJ6eaUZnbwbHve4yMrwZogFSc9ZQtgAcCF6GiRIrG87lL\n105L9qS8K67eqnpDgfxol8fc7cmr1HK5up/GgcabKGzkvrT0B4hC8ZnloCmqSuN4\n/ElVQyi/8XYQ9wxauJX4f5cCgYAXH/IsrVnfcxObyH/fIcgJnhEXs2rVLOBg7yDQ\n0VBevzKQr2LaRwRnIlFEDld0Tl0NVRKw1/8Ji76qqX+46ehI/DMheVMTv3QhFatb\nF7u9+EwFdDh6xbaInjIvflQ+tvldoE6OigcPUULjaDcYDPyw8WhLk/ar+KXA61pk\nPX6GYQKBgEnFneU+ve0Sjzw4qk5rVkdAoMstIJOz7yDchmCub8bKeZC+XSSl8fos\n102RN88cWhXNovLDWZqJoio7c7m7ec8Rzdr/rvYRmFdegH4/96OF9R8iQzbyWNuI\ntu1zLE/nOWdJhfcBb9f72p+jNwt4LpCOryX1YLOk4tuH7V677743\n-----END RSA PRIVATE KEY-----'),(2,'username','ubuntu'),(5,'hostname','13.234.94.168'),(5,'password','sim#2020'),(5,'port','5901'),(5,'username','ubuntu'),(7,'hostname','13.232.24.36'),(7,'password','sim#2020'),(7,'port','5902'),(7,'username','dishant'),(9,'hostname','172.31.25.56'),(9,'ignore-cert','true'),(9,'password','sim#2020'),(9,'port','3389'),(9,'security','any'),(9,'username','lakshmi'),(11,'hostname','172.31.18.138'),(11,'ignore-cert','true'),(11,'password','deb#sim'),(11,'port','3389'),(11,'security','any'),(11,'username','debapriyo'),(13,'hostname','172.31.25.204'),(13,'ignore-cert','true'),(13,'password','sim#2020'),(13,'port','3389'),(13,'security','any'),(13,'username','anirudh'),(14,'hostname','172.31.28.161'),(14,'ignore-cert','true'),(14,'password','sim#2022'),(14,'port','3389'),(14,'security','any'),(14,'username','medha'),(18,'hostname','172.31.36.115'),(18,'ignore-cert','true'),(18,'password','ajit#2022'),(18,'port','3389'),(18,'security','any'),(18,'username','ajit'),(20,'hostname','172.31.29.116'),(20,'ignore-cert','true'),(20,'password','sim#2021*123'),(20,'port','3389'),(20,'security','any'),(20,'username','prem-kori'),(23,'hostname','172.31.36.115'),(23,'ignore-cert','true'),(23,'password','sim#2020'),(23,'port','3389'),(23,'security','any'),(23,'username','pallavi-solanki'),(28,'hostname','172.31.26.61'),(28,'ignore-cert','true'),(28,'password','sim#2020'),(28,'port','3389'),(28,'security','any'),(28,'username','sheetal-mohite'),(29,'hostname','172.31.20.11'),(29,'ignore-cert','true'),(29,'password','sim#2020'),(29,'port','3389'),(29,'security','any'),(29,'username','pallavi-pawar'),(30,'hostname','172.31.20.11'),(30,'ignore-cert','true'),(30,'password','sim#2020'),(30,'port','3389'),(30,'security','any'),(30,'username','suman-singh'),(34,'hostname','172.31.21.218'),(34,'ignore-cert','true'),(34,'password','sim#2020'),(34,'port','3389'),(34,'security','any'),(34,'username','vivek-macha'),(38,'hostname','172.31.21.218'),(38,'ignore-cert','true'),(38,'password','sim#2020'),(38,'port','3389'),(38,'security','any'),(38,'username','elango'),(41,'hostname','172.31.29.4'),(41,'ignore-cert','true'),(41,'password','sim#2020'),(41,'port','3389'),(41,'security','any'),(41,'username','kailash'),(43,'hostname','172.31.47.107'),(43,'ignore-cert','true'),(43,'password','sim#2020'),(43,'port','3389'),(43,'security','any'),(43,'username','kesar-pandita'),(44,'hostname','172.31.30.36'),(44,'ignore-cert','true'),(44,'password','sim#2020'),(44,'port','3389'),(44,'security','any'),(44,'username','prashant-thorat'),(45,'hostname','172.31.27.159'),(45,'ignore-cert','true'),(45,'password','intern#2020'),(45,'port','3389'),(45,'security','any'),(45,'username','rohit-intern'),(50,'hostname','172.31.28.161'),(50,'ignore-cert','true'),(50,'password','sim#2020'),(50,'port','3389'),(50,'security','any'),(50,'username','kristoff'),(51,'hostname','172.31.29.116'),(51,'ignore-cert','true'),(51,'password','sim#2021*123'),(51,'port','3389'),(51,'security','any'),(51,'username','ashish-mishra'),(53,'hostname','172.31.21.94'),(53,'ignore-cert','true'),(53,'password','sim#2021'),(53,'port','3389'),(53,'security','any'),(53,'username','sayali'),(54,'create-drive-path','true'),(54,'drive-name','axis-s2fs'),(54,'drive-path','/home/axis-s2fs/upl'),(54,'enable-drive','true'),(54,'hostname','172.31.25.187'),(54,'ignore-cert','true'),(54,'password','sim#2021*123'),(54,'port','3389'),(54,'security','any'),(54,'sftp-directory','/home/axis-s2fs/upl'),(54,'sftp-hostname','172.31.25.187'),(54,'sftp-password','sim#2021*123'),(54,'sftp-port','22'),(54,'sftp-private-key','-----BEGIN RSA PRIVATE KEY-----\nMIIEogIBAAKCAQEAgsYdVUoBQ0zVHnGOpG8S0iO+mKRp/tmx/O5yDR2yJj3YPRZ6\nowpsM+21sE5yvwNMLe3ioYkpd+RGX4KSRTZdajVjHbFhfTDriWwQzorPqkjLV6Gx\nL7DW1ZIEk/Kf15u6fFpnd7m3JPIsNcgNT7frMZmQTB5hE+YA0m0c1lpeQ3iQwEXS\nNJRoMkq2se1MyudoOUiuPdOroInbdOfm8+sEoTn8sQ0NSRd0JHbVyAymIdBQHbSt\nIVLKiercgKy+ZPg1YNZfPBwrxF1Ddk1yfddF4/lj3WxQ2/is+8Gj35G3KIVjTNs/\nyz8G+3YonPsWNf5+0UtGVd76m/nKSuWsDa7DhQIDAQABAoIBABh84KFH6lSf3oiE\n2yEPa4bOCrKqlu6R9TJXtCOgm+ttSUCnJO/C0+AlcxBAoFwEUg+HrBhzhsBcjpDz\n8k/jjjqFJLo6rPa0YmapRbxnYduRJgKS1IsJojD71r+dfzDwiEsg4p8Yt6LDdmPb\nwiJbXj87cjnOtn7zYtQEepHo+h3IAQIlRuJlaBBUsqr2zStAQtJqwo1hRzuPgaK+\n23YWHIa074rn9W362ywSoh+wKDdwqduklIHiZJG34smTDGugojr/5UUi4eZs1PBl\n8rSVFUuO15NybMHW7fylQx2jVR6/bZBl5D182gA8DkAQ2IOG2/auKjG2JalKhNox\nV5Uy0AECgYEAyKNcIpkTMA0uVlp0hn31JPHAXpckrQ8wZ8qpotU6c71XaV/44PF0\npo/XJX/9yBuzEtE2Da8q41qmXn6LuO7qJJpImrEvdUSOAFreFA9YUk7su/pJwDCY\nFtPIsFY17JTRLt66z4deWB0uQENcm5GXOqEctRwUtkYAbSNCNfKIg8UCgYEAptuy\nbQcOL1jplMATzpoZsAgqwKDt+vZXLIaFD/Lu7ROVWD47N5EJvxWBBQKWNlBb9fMT\n0F/9C9A3tw1a+M47Kzv+6NGDbeCg9xDccjzvjxrN15F8rZ5IjxKLJYqPIlCFjeI0\ns52jcoRe+B46K3KvXvDjc4Xhz4deM1XnLeAwfMECgYA1+r1vEX/4DZPJ58wx4vFx\nXxlCWaekZ9G+GuhIxtVTDj3WO9vZqRyZM1nO3QCKNemXxnGkfNwtDtZz1dgBiUW1\nU0z1UXZTNn592fSlsPsyKcnHSS9OZcSFX7U+u/MGE4Oz+HiKHQFk83TeFUF1GVZ2\nj6IJl+R6pZq3wiSuHvJbgQKBgBPVXXoUMp1yJiGmSzRtoMwJzHslJeSEz4vdWYex\nyrCneUMJ8qQCO3RZLALacdx25NdxU1ObdUqoL1c04TFd4i6bbQtjjAnNf5SejnWN\nxLPv7bPH+VfxzpIjFCMcOzNK+vUIhFctT7ZXAargfO2ZLjtMytx6d4LhhlL3zQjo\n8xqBAoGAKy28eLlKWsUJWdVSOO6ZkLun/BOx1XB3jo9Jv3siXAYaFxYyXKk6szG5\noYMKx4EWsAx0RUVKQ7IunFMvMHT0qh56Oy29+zuABwxmYlgI3J/ftTGJRlSnyDV6\nzxi0sSXXoe0iLt1QerRaJr9O+u/n4EhpmiqNqJYQKTotzWRMQzs=\n-----END RSA PRIVATE KEY-----'),(54,'sftp-root-directory','/home/axis-s2fs/upl'),(54,'sftp-username','axis-s2fs'),(54,'username','axis-s2fs'),(55,'hostname','172.31.25.181'),(55,'ignore-cert','true'),(55,'password','sim#2020'),(55,'port','3389'),(55,'security','rdp'),(55,'username','elango'),(56,'hostname','172.31.47.107'),(56,'ignore-cert','true'),(56,'password','sim#2020'),(56,'port','3389'),(56,'security','any'),(56,'username','leslie'),(57,'hostname','172.31.25.181'),(57,'ignore-cert','true'),(57,'password','sim#2021'),(57,'port','3389'),(57,'security','any'),(57,'username','ajit'),(61,'hostname','172.31.28.135'),(61,'ignore-cert','true'),(61,'password','sim#2022'),(61,'port','3389'),(61,'security','any'),(61,'username','james-durai'),(62,'hostname','172.31.21.74'),(62,'ignore-cert','true'),(62,'password','sim#2020'),(62,'port','3389'),(62,'security','any'),(62,'username','axis-sftp'),(63,'hostname','172.31.30.209'),(63,'ignore-cert','true'),(63,'password','sim#2022'),(63,'port','3389'),(63,'security','any'),(63,'username','karthik-nair'),(64,'hostname','172.31.30.209'),(64,'ignore-cert','true'),(64,'password','sim#2022'),(64,'port','3389'),(64,'security','any'),(64,'username','prem-test'),(66,'hostname','172.31.29.4'),(66,'ignore-cert','true'),(66,'password','sim#2020'),(66,'port','3389'),(66,'security','any'),(66,'username','sanjose_mary'),(67,'hostname','172.31.29.4'),(67,'ignore-cert','true'),(67,'password','sim#2022'),(67,'port','3389'),(67,'security','any'),(67,'username','ashish_singh'),(68,'hostname','172.31.30.36'),(68,'ignore-cert','true'),(68,'password','sim#2022'),(68,'port','3389'),(68,'security','any'),(68,'username','chetan-kapadia'),(70,'hostname','172.31.28.135'),(70,'ignore-cert','true'),(70,'password','sim#2022'),(70,'port','3389'),(70,'security','any'),(70,'username','vishwajit-ln'),(71,'hostname','172.31.39.220'),(71,'ignore-cert','true'),(71,'password','sim#123'),(71,'port','3389'),(71,'security','any'),(71,'username','jenkins_server'),(73,'hostname','172.31.36.254'),(73,'ignore-cert','true'),(73,'password','uam#2020'),(73,'port','3389'),(73,'security','any'),(73,'username','simuam'),(74,'hostname','172.31.44.166'),(74,'ignore-cert','true'),(74,'password','bh#2020'),(74,'port','3389'),(74,'security','any'),(74,'username','bhavna'),(75,'hostname','172.31.40.47'),(75,'ignore-cert','true'),(75,'password','trd@2022'),(75,'port','3389'),(75,'security','any'),(75,'username','deepak'),(76,'hostname','172.31.40.47'),(76,'ignore-cert','true'),(76,'password','sim#2020'),(76,'port','3389'),(76,'security','any'),(76,'username','cieck'),(77,'console','true'),(77,'hostname','172.31.39.166'),(77,'ignore-cert','true'),(77,'password','sim#2020'),(77,'port','3389'),(77,'security','any'),(77,'username','deepak'),(79,'hostname','172.31.35.193'),(79,'ignore-cert','true'),(79,'password','sim#123'),(79,'port','3389'),(79,'security','any'),(79,'username','ajit'),(80,'hostname','172.31.9.144'),(80,'port','22'),(80,'private-key','-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAhuRl/zt6r3DIOQF9J7OyzRXqvbPdLAgXkzMZwR4Q2vZxegz1\nGq6Lb+Js+Rs1D+ufdgeW8BmkzFXAIK2bzW1RD7W+Ab1YgIJtnOajY4avhXwDcTgi\nS0yX7kjCzL0LE/YMOQmg6j22KLOj2vu7gTRwPEH1HxEE/C4int3ewg7CE1wYnXaT\nLLB7HMgDGZt2sgP+7EN6mAKs5w2IUc5jeAW43jN7bHwu2lnDZkb+I8O3efqZJfHx\n1pIj5t+3MbBHCXyoTSyenOi/H/nv3fHRoeg8SvpzIMGHipCWTL3WPWLVwMMFVqmR\nEQahGQJPY/EMd7d2QhO7I4Dq1uC0oZesTw9//wIDAQABAoIBAF74XStmeAkfEYi5\nGKGkLeWgYaXwBW6jv91eI+rIPTu8OMaiasq/SuKZ+vkjg6dSz/EshMNEerd2RA99\ny2zFY0X5Qe49nhrUOVI3O5+tytPjLRVAXTzAj1MvnR7ClhMWryJVOhrRGffsChf6\nFdhwz/hMw8R8mhLmdG9/a/8ant87dsWlWyaHH6bREUvL8t3eNotSQelnQDWLJEXJ\nfmd+8+WrX4KDyeVB1ly+04KXKDQciO783lsrEZymmIYiE++l0++NB0RH9YArNX+E\neDQ9XMYD5KbHMhI8jIKWtL6j2tX4uTIky9RxZWlw3MsX9J6B0W57O4YInzMpScCL\noy5dmrkCgYEA1dIuop6mmus518G00yI87s8tpjHiXvJlXuYFUTy8gbuIBSNabAx9\nbnCBtnnInUTBdSWSksFLvMuhac4ae3NpirGRwkYDHfdRAMGnpIax2Rpj9VhWf5Ws\n1g0MTMn2Oo3+khFNNo3z8DjTJqDpmbSLfdotTjC/DO+EsbGafofjmEsCgYEAoYBc\n4Tb1OAFklEy0CoVTBn7fo5ZwaWdhfslEvs2eOnpAmNLrh8x1XV+aCSfQ7nsgZqHw\nAukUxnWjo6/4NYOiO+vQy7426uY+brLc4i9TvjNXdFSfSl8wn3JvrYSTc8HNfjDI\nUPwBkHx1iuNCklWuUgH/ezSoe4Hm8dgm1hgVDp0CgYEAhp/qSutW/K1j4uuMXW7u\nLHH3TO+VlrBJkQGEkYyLJ6eaUZnbwbHve4yMrwZogFSc9ZQtgAcCF6GiRIrG87lL\n105L9qS8K67eqnpDgfxol8fc7cmr1HK5up/GgcabKGzkvrT0B4hC8ZnloCmqSuN4\n/ElVQyi/8XYQ9wxauJX4f5cCgYAXH/IsrVnfcxObyH/fIcgJnhEXs2rVLOBg7yDQ\n0VBevzKQr2LaRwRnIlFEDld0Tl0NVRKw1/8Ji76qqX+46ehI/DMheVMTv3QhFatb\nF7u9+EwFdDh6xbaInjIvflQ+tvldoE6OigcPUULjaDcYDPyw8WhLk/ar+KXA61pk\nPX6GYQKBgEnFneU+ve0Sjzw4qk5rVkdAoMstIJOz7yDchmCub8bKeZC+XSSl8fos\n102RN88cWhXNovLDWZqJoio7c7m7ec8Rzdr/rvYRmFdegH4/96OF9R8iQzbyWNuI\ntu1zLE/nOWdJhfcBb9f72p+jNwt4LpCOryX1YLOk4tuH7V677743\n-----END RSA PRIVATE KEY-----'),(80,'username','ubuntu'),(81,'console','true'),(81,'hostname','172.31.39.166'),(81,'ignore-cert','true'),(81,'password','sim#12345'),(81,'port','3389'),(81,'security','any'),(81,'username','cieck'),(82,'console','true'),(82,'hostname','172.31.39.166'),(82,'ignore-cert','true'),(82,'password','sim#2020'),(82,'port','3389'),(82,'security','any'),(82,'username','salaton'),(83,'hostname','172.31.28.161'),(83,'ignore-cert','true'),(83,'password','sim#123'),(83,'port','3389'),(83,'security','any'),(83,'username','chaitanya'),(84,'hostname','172.31.28.161'),(84,'ignore-cert','true'),(84,'password','sim#123'),(84,'port','3389'),(84,'security','any'),(84,'username','vieer-dubey'),(86,'hostname','172.31.11.231'),(86,'ignore-cert','true'),(86,'password','sim#8080'),(86,'port','3389'),(86,'security','any'),(86,'username','shuhaib');
/*!40000 ALTER TABLE `guacamole_connection_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_connection_permission`
--

DROP TABLE IF EXISTS `guacamole_connection_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_connection_permission` (
  `entity_id` int NOT NULL,
  `connection_id` int NOT NULL,
  `permission` enum('READ','UPDATE','DELETE','ADMINISTER') NOT NULL,
  PRIMARY KEY (`entity_id`,`connection_id`,`permission`),
  KEY `guacamole_connection_permission_ibfk_1` (`connection_id`),
  CONSTRAINT `guacamole_connection_permission_entity` FOREIGN KEY (`entity_id`) REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `guacamole_connection_permission_ibfk_1` FOREIGN KEY (`connection_id`) REFERENCES `guacamole_connection` (`connection_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_connection_permission`
--

LOCK TABLES `guacamole_connection_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_permission` DISABLE KEYS */;
INSERT INTO `guacamole_connection_permission` VALUES (2,2,'READ'),(20,2,'READ'),(24,2,'READ'),(2,5,'READ'),(2,5,'UPDATE'),(2,5,'DELETE'),(2,5,'ADMINISTER'),(2,7,'READ'),(2,7,'UPDATE'),(2,7,'DELETE'),(2,7,'ADMINISTER'),(5,7,'READ'),(17,7,'READ'),(2,9,'READ'),(2,9,'UPDATE'),(2,9,'DELETE'),(2,9,'ADMINISTER'),(17,9,'READ'),(19,9,'READ'),(2,11,'READ'),(2,11,'UPDATE'),(2,11,'DELETE'),(2,11,'ADMINISTER'),(10,11,'READ'),(16,11,'READ'),(20,11,'READ'),(2,13,'READ'),(2,13,'UPDATE'),(2,13,'DELETE'),(2,13,'ADMINISTER'),(8,13,'READ'),(10,13,'READ'),(16,13,'READ'),(2,14,'READ'),(2,14,'UPDATE'),(2,14,'DELETE'),(2,14,'ADMINISTER'),(10,14,'READ'),(11,14,'READ'),(16,14,'READ'),(2,18,'READ'),(2,18,'UPDATE'),(2,18,'DELETE'),(2,18,'ADMINISTER'),(18,18,'READ'),(2,20,'READ'),(2,20,'UPDATE'),(2,20,'DELETE'),(2,20,'ADMINISTER'),(20,20,'READ'),(24,20,'READ'),(2,23,'READ'),(2,23,'UPDATE'),(2,23,'DELETE'),(2,23,'ADMINISTER'),(10,23,'READ'),(23,23,'READ'),(2,28,'READ'),(2,28,'UPDATE'),(2,28,'DELETE'),(2,28,'ADMINISTER'),(10,28,'READ'),(29,28,'READ'),(2,29,'READ'),(2,29,'UPDATE'),(2,29,'DELETE'),(2,29,'ADMINISTER'),(33,29,'READ'),(2,30,'READ'),(2,30,'UPDATE'),(2,30,'DELETE'),(2,30,'ADMINISTER'),(34,30,'READ'),(2,34,'READ'),(2,34,'UPDATE'),(2,34,'DELETE'),(2,34,'ADMINISTER'),(58,34,'READ'),(2,38,'READ'),(2,38,'UPDATE'),(2,38,'DELETE'),(2,38,'ADMINISTER'),(10,38,'READ'),(40,38,'READ'),(2,41,'READ'),(2,41,'UPDATE'),(2,41,'DELETE'),(2,41,'ADMINISTER'),(43,41,'READ'),(2,43,'READ'),(2,43,'UPDATE'),(2,43,'DELETE'),(2,43,'ADMINISTER'),(22,43,'READ'),(2,44,'READ'),(2,44,'UPDATE'),(2,44,'DELETE'),(2,44,'ADMINISTER'),(21,44,'READ'),(2,45,'READ'),(2,45,'UPDATE'),(2,45,'DELETE'),(2,45,'ADMINISTER'),(45,45,'READ'),(2,50,'READ'),(2,50,'UPDATE'),(2,50,'DELETE'),(2,50,'ADMINISTER'),(49,50,'READ'),(2,51,'READ'),(2,51,'UPDATE'),(2,51,'DELETE'),(2,51,'ADMINISTER'),(24,51,'READ'),(2,53,'READ'),(2,53,'UPDATE'),(2,53,'DELETE'),(2,53,'ADMINISTER'),(29,53,'READ'),(31,53,'READ'),(2,54,'READ'),(2,54,'UPDATE'),(2,54,'DELETE'),(2,54,'ADMINISTER'),(2,55,'READ'),(2,55,'UPDATE'),(2,55,'DELETE'),(2,55,'ADMINISTER'),(10,55,'READ'),(20,55,'READ'),(40,55,'READ'),(2,56,'READ'),(2,56,'UPDATE'),(2,56,'DELETE'),(2,56,'ADMINISTER'),(10,56,'READ'),(50,56,'READ'),(2,57,'READ'),(2,57,'UPDATE'),(2,57,'DELETE'),(2,57,'ADMINISTER'),(18,57,'READ'),(2,61,'READ'),(2,61,'UPDATE'),(2,61,'DELETE'),(2,61,'ADMINISTER'),(54,61,'READ'),(2,62,'READ'),(2,62,'UPDATE'),(2,62,'DELETE'),(2,62,'ADMINISTER'),(10,62,'READ'),(18,62,'READ'),(23,62,'READ'),(29,62,'READ'),(33,62,'READ'),(40,62,'READ'),(2,63,'READ'),(2,63,'UPDATE'),(2,63,'DELETE'),(2,63,'ADMINISTER'),(55,63,'READ'),(2,64,'READ'),(2,64,'UPDATE'),(2,64,'DELETE'),(2,64,'ADMINISTER'),(20,64,'READ'),(21,64,'READ'),(24,64,'READ'),(2,66,'READ'),(2,66,'UPDATE'),(2,66,'DELETE'),(2,66,'ADMINISTER'),(57,66,'READ'),(2,67,'READ'),(2,67,'UPDATE'),(2,67,'DELETE'),(2,67,'ADMINISTER'),(56,67,'READ'),(2,68,'READ'),(2,68,'UPDATE'),(2,68,'DELETE'),(2,68,'ADMINISTER'),(59,68,'READ'),(2,70,'READ'),(2,70,'UPDATE'),(2,70,'DELETE'),(2,70,'ADMINISTER'),(61,70,'READ'),(2,71,'READ'),(2,71,'UPDATE'),(2,71,'DELETE'),(2,71,'ADMINISTER'),(29,71,'READ'),(60,71,'READ'),(69,71,'READ'),(2,73,'READ'),(2,73,'UPDATE'),(2,73,'DELETE'),(2,73,'ADMINISTER'),(29,73,'READ'),(63,73,'READ'),(60,74,'UPDATE'),(60,74,'DELETE'),(60,74,'ADMINISTER'),(64,74,'READ'),(60,75,'READ'),(60,75,'UPDATE'),(60,75,'DELETE'),(60,75,'ADMINISTER'),(65,75,'READ'),(60,76,'READ'),(60,76,'UPDATE'),(60,76,'DELETE'),(60,76,'ADMINISTER'),(67,76,'READ'),(60,77,'READ'),(60,77,'UPDATE'),(60,77,'DELETE'),(60,77,'ADMINISTER'),(65,77,'READ'),(67,77,'READ'),(68,77,'READ'),(18,79,'READ'),(60,79,'READ'),(60,79,'UPDATE'),(60,79,'DELETE'),(60,79,'ADMINISTER'),(60,80,'READ'),(60,80,'UPDATE'),(60,80,'DELETE'),(60,80,'ADMINISTER'),(60,81,'READ'),(60,81,'UPDATE'),(60,81,'DELETE'),(60,81,'ADMINISTER'),(67,81,'READ'),(60,82,'READ'),(60,82,'UPDATE'),(60,82,'DELETE'),(60,82,'ADMINISTER'),(68,82,'READ'),(60,83,'READ'),(60,83,'UPDATE'),(60,83,'DELETE'),(60,83,'ADMINISTER'),(69,83,'READ'),(60,84,'READ'),(60,84,'UPDATE'),(60,84,'DELETE'),(60,84,'ADMINISTER'),(69,86,'READ'),(69,86,'UPDATE'),(69,86,'DELETE'),(69,86,'ADMINISTER'),(70,86,'READ');
/*!40000 ALTER TABLE `guacamole_connection_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_entity`
--

DROP TABLE IF EXISTS `guacamole_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_entity` (
  `entity_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `type` enum('USER','USER_GROUP') NOT NULL,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `guacamole_entity_name_scope` (`type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_entity`
--

LOCK TABLES `guacamole_entity` WRITE;
/*!40000 ALTER TABLE `guacamole_entity` DISABLE KEYS */;
INSERT INTO `guacamole_entity` VALUES (18,'ajit','USER'),(8,'anirudh','USER'),(24,'ashish-mishra','USER'),(56,'ashish_singh','USER'),(64,'bhavna','USER'),(69,'chaitanya','USER'),(67,'Cheikh','USER'),(59,'chetan-kapadia','USER'),(10,'debapriyo','USER'),(65,'deepak','USER'),(5,'dishant@simsol.in','USER'),(40,'elango','USER'),(54,'james-durai','USER'),(42,'junaid-khan','USER'),(43,'kailash','USER'),(55,'karthik-nair','USER'),(22,'kesar-pandita','USER'),(49,'kristoff','USER'),(19,'lakshmi@simsol.in','USER'),(50,'leslie','USER'),(11,'medha','USER'),(33,'pallavi-pawar','USER'),(23,'pallavi-solanki','USER'),(21,'prashant-thorat','USER'),(20,'prem-kori','USER'),(45,'rohit-intern','USER'),(68,'Salaton','USER'),(57,'sanjose_mary','USER'),(31,'sayali-pol','USER'),(29,'sheetal-mohite','USER'),(70,'shuhaib','USER'),(63,'simuam','USER'),(34,'suman-singh','USER'),(60,'vieer-dubey','USER'),(61,'vishwajit-ln','USER'),(58,'vivek-macha','USER'),(2,'zygot','USER'),(16,'i1-LIVEDESK-interns','USER_GROUP'),(15,'i2-LIVEDESK-Kailash','USER_GROUP'),(17,'LIVEDESK','USER_GROUP');
/*!40000 ALTER TABLE `guacamole_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_sharing_profile`
--

DROP TABLE IF EXISTS `guacamole_sharing_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_sharing_profile` (
  `sharing_profile_id` int NOT NULL AUTO_INCREMENT,
  `sharing_profile_name` varchar(128) NOT NULL,
  `primary_connection_id` int NOT NULL,
  PRIMARY KEY (`sharing_profile_id`),
  UNIQUE KEY `sharing_profile_name_primary` (`sharing_profile_name`,`primary_connection_id`),
  KEY `guacamole_sharing_profile_ibfk_1` (`primary_connection_id`),
  CONSTRAINT `guacamole_sharing_profile_ibfk_1` FOREIGN KEY (`primary_connection_id`) REFERENCES `guacamole_connection` (`connection_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_sharing_profile`
--

LOCK TABLES `guacamole_sharing_profile` WRITE;
/*!40000 ALTER TABLE `guacamole_sharing_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_sharing_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_sharing_profile_attribute`
--

DROP TABLE IF EXISTS `guacamole_sharing_profile_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_sharing_profile_attribute` (
  `sharing_profile_id` int NOT NULL,
  `attribute_name` varchar(128) NOT NULL,
  `attribute_value` varchar(4096) NOT NULL,
  PRIMARY KEY (`sharing_profile_id`,`attribute_name`),
  KEY `sharing_profile_id` (`sharing_profile_id`),
  CONSTRAINT `guacamole_sharing_profile_attribute_ibfk_1` FOREIGN KEY (`sharing_profile_id`) REFERENCES `guacamole_sharing_profile` (`sharing_profile_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_sharing_profile_attribute`
--

LOCK TABLES `guacamole_sharing_profile_attribute` WRITE;
/*!40000 ALTER TABLE `guacamole_sharing_profile_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_sharing_profile_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_sharing_profile_parameter`
--

DROP TABLE IF EXISTS `guacamole_sharing_profile_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_sharing_profile_parameter` (
  `sharing_profile_id` int NOT NULL,
  `parameter_name` varchar(128) NOT NULL,
  `parameter_value` varchar(4096) NOT NULL,
  PRIMARY KEY (`sharing_profile_id`,`parameter_name`),
  CONSTRAINT `guacamole_sharing_profile_parameter_ibfk_1` FOREIGN KEY (`sharing_profile_id`) REFERENCES `guacamole_sharing_profile` (`sharing_profile_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_sharing_profile_parameter`
--

LOCK TABLES `guacamole_sharing_profile_parameter` WRITE;
/*!40000 ALTER TABLE `guacamole_sharing_profile_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_sharing_profile_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_sharing_profile_permission`
--

DROP TABLE IF EXISTS `guacamole_sharing_profile_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_sharing_profile_permission` (
  `entity_id` int NOT NULL,
  `sharing_profile_id` int NOT NULL,
  `permission` enum('READ','UPDATE','DELETE','ADMINISTER') NOT NULL,
  PRIMARY KEY (`entity_id`,`sharing_profile_id`,`permission`),
  KEY `guacamole_sharing_profile_permission_ibfk_1` (`sharing_profile_id`),
  CONSTRAINT `guacamole_sharing_profile_permission_entity` FOREIGN KEY (`entity_id`) REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `guacamole_sharing_profile_permission_ibfk_1` FOREIGN KEY (`sharing_profile_id`) REFERENCES `guacamole_sharing_profile` (`sharing_profile_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_sharing_profile_permission`
--

LOCK TABLES `guacamole_sharing_profile_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_sharing_profile_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_sharing_profile_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_system_permission`
--

DROP TABLE IF EXISTS `guacamole_system_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_system_permission` (
  `entity_id` int NOT NULL,
  `permission` enum('CREATE_CONNECTION','CREATE_CONNECTION_GROUP','CREATE_SHARING_PROFILE','CREATE_USER','CREATE_USER_GROUP','ADMINISTER') NOT NULL,
  PRIMARY KEY (`entity_id`,`permission`),
  CONSTRAINT `guacamole_system_permission_entity` FOREIGN KEY (`entity_id`) REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_system_permission`
--

LOCK TABLES `guacamole_system_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_system_permission` DISABLE KEYS */;
INSERT INTO `guacamole_system_permission` VALUES (2,'CREATE_CONNECTION'),(2,'CREATE_CONNECTION_GROUP'),(2,'CREATE_SHARING_PROFILE'),(2,'CREATE_USER'),(2,'CREATE_USER_GROUP'),(2,'ADMINISTER'),(18,'ADMINISTER'),(49,'ADMINISTER'),(60,'CREATE_CONNECTION'),(60,'CREATE_USER'),(60,'ADMINISTER'),(65,'ADMINISTER'),(69,'CREATE_CONNECTION'),(69,'CREATE_CONNECTION_GROUP'),(69,'CREATE_SHARING_PROFILE'),(69,'CREATE_USER'),(69,'CREATE_USER_GROUP'),(69,'ADMINISTER');
/*!40000 ALTER TABLE `guacamole_system_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user`
--

DROP TABLE IF EXISTS `guacamole_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `entity_id` int NOT NULL,
  `password_hash` binary(32) NOT NULL,
  `password_salt` binary(32) DEFAULT NULL,
  `password_date` datetime NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `access_window_start` time DEFAULT NULL,
  `access_window_end` time DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `full_name` varchar(256) DEFAULT NULL,
  `email_address` varchar(256) DEFAULT NULL,
  `organization` varchar(256) DEFAULT NULL,
  `organizational_role` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `guacamole_user_single_entity` (`entity_id`),
  CONSTRAINT `guacamole_user_entity` FOREIGN KEY (`entity_id`) REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user`
--

LOCK TABLES `guacamole_user` WRITE;
/*!40000 ALTER TABLE `guacamole_user` DISABLE KEYS */;
INSERT INTO `guacamole_user` VALUES (2,2,_binary '˛q_\nHìç\Â(ŒÄ/¶´\Œh\‡\ÔV\ÿl\’*ö!Û\"\Ÿ~',_binary '\€Ä3\Zõ Úu]SZ®§;s\Êúu∏€™À†M˘™roh','2021-10-09 21:37:10',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,5,_binary '∫^¢[ëND.§œÜ\·Ä\ZRöH{#F0s]%£Q[#M\0I',_binary 'ôZ\'ò2ÂÆπ6≥õá˜$Û	\‰]m\ËP|µZŸ±¶\ÿPN','2021-10-09 00:00:00',0,1,NULL,NULL,NULL,NULL,NULL,'Dishant',NULL,'Simsol','Tester'),(8,8,_binary '\Ë\ÿu¥/¡\ﬂ\› Ü\r•ŒÅ±îh€§-π>∞$U£ﬁ≥',_binary 'ú]•\‘O\Ÿ¡\⁄Ú€™V˚a≤Bk1º\Ÿ\n¨{ı§Ò','2021-10-11 09:32:10',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,10,_binary '\0)-˛—•k\ﬂÙd_\ M∫\Ó\„F6©gØ≤\ZW?>RXT',_binary '¿™E\Ó\œ!-ØI\Àœè\«s@\‚¶¸í∏@¨\Õ#∏\È0Ω2gq','2021-10-11 09:30:51',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,11,_binary '\‡ÛøC¥\›>x\ﬂ7ß˛\∆x£\Á\ÃÚ\…≤ìä\0â#ßRº\Ê3z',_binary '5Ã≤{lêÒ){`≠:W±\∆nπA\‘\‘e$è\ÕÙ\Êπ\’\ﬂi;∂','2022-02-10 06:14:24',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,18,_binary 'J´_ÇÆˆø\ﬂ\07l\\”åÚ\ﬁ6\·eÇ\’J–âxíõ.c',_binary '{^X¡\nMÒqõ@Àì“àn\Ã\Ï\Œ\…0ôá\ÀE†ô\ﬁ\n','2022-09-14 11:19:21',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,19,_binary '¥?ˆ\Áœàõ\Ÿ öìåî∑xC\"\À¯\∆r∂£c°¿v^ÚòW˝',_binary '\Ã\‚≠}™\Ê6≠G≠££.\„\⁄\·æ©W\nê#Û∞^%k\'','2021-10-20 07:19:15',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,20,_binary 'ˇFÇ˜ãv\≈\≈Ä¯n^ﬁö64Ωımì\À⁄è#F\…Dn',_binary 'WX	aÆLC©òız£Ñ§H\œx\Óvy†\Ï/dæ\ÏaÚ','2021-10-11 06:31:36',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,21,_binary '\‡Ùz€∑J\0$πΩhB?\›\ËíH\ \ÌÆ)Q©¶ë=ﬂõn\ƒ',_binary 'c\¬ \\\”F]\√â§Z|9\\æl\Z˚xΩù˘´`ç†\‡','2021-10-11 03:29:06',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,22,_binary '–ΩµÔÑö9\Â\Ã:R*˚?\Ïe9KY_\Ó#\0\œX\Ê\Ôü',_binary 'â\nO@â+\Â˝«à\Z\∆ˆús\ÎÄ^}S t£tJ∂','2021-10-11 04:40:05',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,23,_binary '\"hÜ.\⁄nÉ5R7i3RÄ\÷!µ®\…\Ê\ﬁG˛—Ø\÷k\€',_binary 'GI‹ï9ëcÚh7z\Õ^açnù¨Û•µL\…Z5óÉßñ8*','2021-10-10 10:32:28',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,24,_binary '®$;\Ï_4\„¿\ƒÂÅª\“ﬁñ74\·\ÎçÛ≈•õ\"<',_binary '\Ë\Œ\ËÀª›Çzw\\Wu+=ó?üW∏\ÿÛ6\„\“”Ω∂S\0uˆ#','2021-10-11 05:29:49',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,29,_binary '≥\Í\∆yR\ÀÛÄıÇ	 `1Ö\ƒ‰òêh\\Ùí|r<\ﬁ™z',_binary 'D	û¢Jûìy€É\ÿM§Äkıı\Êó\ZW\ÓU\–R`$','2021-10-11 04:53:16',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,31,_binary 'éßˇB&Y—©,™˜$è\‚\÷}©1)Ò^t≠íÅ$\–',_binary 'r\·5ìE|n?~]\…ı1ã¡âò)µ™Ew\≈#—î\'\·','2021-10-10 12:39:17',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,33,_binary 'ıìKÿ∫ÄìhU\Ïù¢]9†\“A&ı¸\ƒ8\Êt˝I@∞a',_binary 'G|∫\Á¨:ZGB`ú#%âÛF¯…û\Ár<\È \–\‘','2021-10-11 05:25:47',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,34,_binary '\ﬁA;πô*ª\’Bá£◊™%§<\ZÛm.\„e1¸è8zY^Ef',_binary '˚è\Ó24\—\Ë/d\÷y;±å{éœèÅ4W\n·ÖîQ\\˚Ö\Í','2021-10-20 08:54:38',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,40,_binary '\\d˘Ò\„\»\‘u2\0ºı2ÛB5î\'Ä∫ï.zæ_\È–±',_binary 'm∏»©tS4ÑCm$ß©éú]!ÑGr¨&úˆ\ËBè\ÏSIp','2021-10-10 04:55:55',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,42,_binary '∫^¢[ëND.§œÜ\·Ä\ZRöH{#F0s]%£Q[#M\0I',_binary 'ôZ\'ò2ÂÆπ6≥õá˜$Û	\‰]m\ËP|µZŸ±¶\ÿPN','2021-10-09 00:00:00',0,1,NULL,NULL,NULL,NULL,NULL,'Junaid Khan',NULL,'Simsol','Dev'),(40,43,_binary '\Ôe\Áø\÷clX±VTv/öÁªñ\Ó≤g!1¨˜˝)ê0M',_binary '∑\n∂Ωªn0HâSô˘-±äµ™¡\Óâ/±Ω\›	©ûÉ','2021-10-12 08:18:01',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,45,_binary 'J\È\–S(B\€\ƒJ((o\¬NCä*ÖŒû\∆p\Í#K\ÃPóª',_binary '\…˘òF\—\Ô`´\€\ﬁkgY∑π\Zˇö¡\«\›‹îiö)yh','2021-10-12 06:34:22',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,49,_binary 'HJ˘CÊõ¶\„I¢ˆ\·\„\‡ÄÙt(Yèr\Á2ç\Ï',_binary '\≈[ã\ÿ;ç¢ø\‡[\"DG∫PÜ§\◊\÷\Ë\∆\ƒ≥d\ZÚ!Ù','2022-06-13 09:47:54',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,50,_binary '\Ï˝%ÿ∫Õ•©\È”∂V&¿W•ì|ñ\È¡ó“∏6™\—!!&\Ëe',_binary ' ≤^(\Â¨˙ñÚÕøXêî“º\√.E©¶ÜC¿\÷&\0¨˝','2022-11-01 10:49:32',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,54,_binary '”†˝Ú¡=Äı\ÂwK\Ê´SqP¥qíÆ\Í\nEóç\Ÿ.',_binary 'n≥áÉ¸\‘—à=óv&Å}£[ïÜë\Z\»E	´˙`8K\—t\’','2022-02-17 05:41:43',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,55,_binary 'É?π+fÜ,3\»P_£S¡6\Ì-êAöl∞öPt\’',_binary '\ÊE\Ï\»ë©8†C* °V\Ê¯.Ä\0¶\÷⁄≥UˆìJ\”6','2022-04-01 10:39:27',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,56,_binary '˘YS\rÛQÚí&\‡ª/\È\Ÿ0cGC|¿\ ^=\Â)\Îˆ\∆cÒ',_binary 'õ˝l\"\È,s2t1\Àv¢í˘˛>¿¥\Î\‡\Ô˝Jé\"&','2022-05-26 07:14:33',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,57,_binary '\Ôú\ÈtßWπ3[•f#4Ò\‰¸Ω,r\"M\∆\ÌnR7k',_binary 'H-E\Ìûó`àk˝É\Ã\ƒL\¬Yã\ƒm\„ï{Î≤π\”\ﬂ','2022-05-30 11:18:04',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,58,_binary 'IåP\Ï\"j7\ﬂ^ˇC≤Ú9™€èVô»≠˚,z÷≠\–‹∑±',_binary '*£\Âè\’+VY*KyõΩ\ﬁ\Í\ÿ3˘\‹n(3®Ú˘=©\ƒo','2022-08-09 08:37:37',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,59,_binary '\÷\"oJ>∫aå)m8\“eôà\·3ìk]\"wÙ\∆wJ\r',_binary 'Nî\Â\÷k≠çuãıj{À™Ékà2\ŒÒá∂çl\ÔŒ§','2022-08-23 12:59:59',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,60,_binary ':Ùó∂íê˜)gÚ\\£@}1®\–\Í^à;õô‹ö)Ø(',_binary '5Åy{~S+G∑\nçı(\Z<Äe¨Æ\n\Ãy8˜≤AÒ','2022-09-06 09:27:03',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,61,_binary 'í&úü]h9˚ûub¸Ö\ÕLπZ=âYT¶hA[3e,',_binary 'bâÑ©9\„\0üæ˛\ƒ+\÷\‹\–V,)U˙(|r¨rEî','2023-03-20 06:04:31',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,63,_binary '£ô9Çà#§\n\0ø\n]\“CÒ#®ïU¿\ÿ=xé\n±ªZ',_binary 'V\€0i0±\Ï<\Õ—¥\Íîp˜\Œ~gñäçF%!xÛg','2022-09-22 07:04:24',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,64,_binary 'Åëˆ.ÜíüÑãª\Ï¸t\ﬂ¬å¯\‘gæ(º∏s\—Vë©',_binary '\„=#Iÿö\Õv*\"8}≠ø(˙\Ô\Õ’πê®9©f\Ë&6J\◊','2022-09-29 13:25:49',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,65,_binary '\ﬁ7qQ\\µ\‚.N_)!:Æ—ù\rêkÙáπ`]^@,≥Y˙',_binary '\Z\Êcc”ê0\Ë)ï^ø!!ólB˜6˘	˚K∞rt¨\\','2022-12-20 11:06:25',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,67,_binary 'ìÒ\Ìı5à+´∏Z•“©jTüØgık`¯˘K',_binary 'UÉà¥∫3ZP\—\ÔØvÆs.Ñ∞Yîw¶>W~¯A\“z','2023-02-21 10:29:09',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,68,_binary '\—?CZö∂Np~üm\Ê\ÏÇıx¡J¯\Ô\ÁÒ\”\Á\‚\“Ò\«',_binary '!\Á.Ê≥Ñ\ÈLÛ7G\Âó%Ñ-Bë¥0ì\Ê1r≈í™V','2023-02-21 12:33:23',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,69,_binary 'ÑÆ°Ù\ÿˇ}0–õ\rW\Ë:â±	`\Ì¸ˇ\—Òn∏(',_binary 'í1˛bJï\Ê\‘\ÿ\rGl\»±*IlX=\—\∆b6:wl.T¶','2023-04-20 10:05:07',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,70,_binary 't\«5\Z\—Û\\÷¨Ù±ùE\–Y\È¡tx@©P\Á\ \'ê±O8]',_binary '\‡lGçûâÒ\„/4GA~ècëÖiOæÖ\·äˇm◊ºRº\Ô','2023-05-01 05:53:40',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `guacamole_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_attribute`
--

DROP TABLE IF EXISTS `guacamole_user_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_user_attribute` (
  `user_id` int NOT NULL,
  `attribute_name` varchar(128) NOT NULL,
  `attribute_value` varchar(4096) NOT NULL,
  PRIMARY KEY (`user_id`,`attribute_name`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `guacamole_user_attribute_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `guacamole_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user_attribute`
--

LOCK TABLES `guacamole_user_attribute` WRITE;
/*!40000 ALTER TABLE `guacamole_user_attribute` DISABLE KEYS */;
INSERT INTO `guacamole_user_attribute` VALUES (2,'guac-totp-key-confirmed','true'),(2,'guac-totp-key-secret','EJ23M7BOYWL7JRC3Z7ISZNYJGMFCEHLP'),(8,'guac-totp-key-confirmed','true'),(8,'guac-totp-key-secret','RGFLBYPGE34QMLOQMPRSUJTADRAC4EEN'),(10,'guac-totp-key-confirmed','true'),(10,'guac-totp-key-secret','KKANOUZFIDNVCLFP3DKBTONOL7D7WZHX'),(11,'guac-totp-key-confirmed','true'),(11,'guac-totp-key-secret','F45UYCKRMOJKQKHCWKROTD4CENVJELGK'),(15,'guac-totp-key-confirmed','true'),(15,'guac-totp-key-secret','HNKTCBC7YXPTFIYZHNZPGPG2ZX4SBV3U'),(16,'guac-totp-key-confirmed','true'),(16,'guac-totp-key-secret','F4NAD3B4XQE7M5XIWQ7KPORCQRCURBRF'),(17,'guac-totp-key-confirmed','true'),(17,'guac-totp-key-secret','NVLRWUL6CV3TVBDQDN6ZKNIQFOB4ZQLU'),(18,'guac-totp-key-confirmed','true'),(18,'guac-totp-key-secret','25XKOL3ZSERA6J6G7CRAFZ4THQT4UXP6'),(19,'guac-totp-key-confirmed','true'),(19,'guac-totp-key-secret','HQCDNZRF6SW53K2H43V6ER2C2GKZ6KZC'),(20,'guac-totp-key-confirmed','true'),(20,'guac-totp-key-secret','326OPO5GSOT73553N6FJJC4T4RCDTPSB'),(21,'guac-totp-key-confirmed','true'),(21,'guac-totp-key-secret','MZJYKGQMXSUNRCFMY7G5PRG5YVCNBU5L'),(26,'guac-totp-key-confirmed','true'),(26,'guac-totp-key-secret','MTOIN5OV6MSUYOLKNLAWSMHEWBNHESH4'),(28,'guac-totp-key-confirmed','true'),(28,'guac-totp-key-secret','BEUHIHPZYC2GPHAAYI6GN47MF2Z7ASKZ'),(30,'guac-totp-key-confirmed','true'),(30,'guac-totp-key-secret','K3J4RDCW4246S6KA5NM4HUZCOS67XN3B'),(31,'guac-totp-key-confirmed','true'),(31,'guac-totp-key-secret','FWWF6ATHBJAPGCRN2BVFPMHGTRL337CA'),(37,'guac-totp-key-confirmed','true'),(37,'guac-totp-key-secret','HZHZQN4IUG3HQVVPAFOXDL6CMPBAIW5U'),(40,'guac-totp-key-confirmed','true'),(40,'guac-totp-key-secret','HUGXFYFAF6NUGHTZPJL54TMPLHDUPEBH'),(42,'guac-totp-key-confirmed','true'),(42,'guac-totp-key-secret','OB5X27LP5QWSKWWODCGKUGXVLLU3FUKJ'),(46,'guac-totp-key-confirmed','true'),(46,'guac-totp-key-secret','P3SSG5L3K25KXOCMGW4LK2ETRJAZ6OMR'),(47,'guac-totp-key-confirmed','true'),(47,'guac-totp-key-secret','JM5OY6B4AAB55JXSC6DT45C7RFLC57WQ'),(51,'guac-totp-key-confirmed','true'),(51,'guac-totp-key-secret','WO2SUQZ3ZCRQA7LT2VXKWL7P7XHZ447G'),(52,'guac-totp-key-confirmed','true'),(52,'guac-totp-key-secret','5IRG5AYLEPOWD5ORWE353MTXA3DQTH6B'),(53,'guac-totp-key-confirmed','true'),(53,'guac-totp-key-secret','INB6C4JOL5QFZFC2E52PPJA32RMS76RC'),(54,'guac-totp-key-confirmed','true'),(54,'guac-totp-key-secret','7WVGTR5ZGD5QMDILPTBUIEOG6X56IAMN'),(55,'guac-totp-key-confirmed','true'),(55,'guac-totp-key-secret','V5OVLDHSBP63CELGD4SYUSPUHYT3YLND'),(56,'guac-totp-key-confirmed','true'),(56,'guac-totp-key-secret','BYZGUUKAHN6TUYP7SAB4WSKAHSI6M3TB'),(57,'guac-totp-key-confirmed','true'),(57,'guac-totp-key-secret','JRAROGB4NUJGS6LPRBWINZJNTN6N64AG'),(58,'guac-totp-key-confirmed','true'),(58,'guac-totp-key-secret','GFCHA4LFKLIDIBDNBH5BASN6B7XA3E4Y'),(60,'guac-totp-key-confirmed','true'),(60,'guac-totp-key-secret','VVOVLHZKLXZ5BEFY677MZH4ANTUX2PFT'),(61,'guac-totp-key-confirmed','true'),(61,'guac-totp-key-secret','53GYCHQ42NDXL3G47IKJLSFOE2SU2SBK'),(62,'guac-totp-key-confirmed','true'),(62,'guac-totp-key-secret','AYPEC47KW67XBZGTJFUE64CBY5LT7CEZ'),(64,'guac-totp-key-confirmed','true'),(64,'guac-totp-key-secret','RCNFGIY2LQSD5MVLKGWMZHQ3YZJACKPX'),(65,'guac-totp-key-confirmed','false'),(65,'guac-totp-key-secret','H3O6TDFQIDMHPJ44VLZIWPGVWMXXS57E'),(66,'guac-totp-key-confirmed','true'),(66,'guac-totp-key-secret','MMOYAWAXZGMOXIY2PL2PFOZV3RVQ73IV'),(67,'guac-totp-key-confirmed','true'),(67,'guac-totp-key-secret','4CGUEC3SFJLOOZKSGOHVYX2D45CKUIHD');
/*!40000 ALTER TABLE `guacamole_user_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_group`
--

DROP TABLE IF EXISTS `guacamole_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_user_group` (
  `user_group_id` int NOT NULL AUTO_INCREMENT,
  `entity_id` int NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  UNIQUE KEY `guacamole_user_group_single_entity` (`entity_id`),
  CONSTRAINT `guacamole_user_group_entity` FOREIGN KEY (`entity_id`) REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user_group`
--

LOCK TABLES `guacamole_user_group` WRITE;
/*!40000 ALTER TABLE `guacamole_user_group` DISABLE KEYS */;
INSERT INTO `guacamole_user_group` VALUES (1,15,0),(2,16,0),(3,17,0);
/*!40000 ALTER TABLE `guacamole_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_group_attribute`
--

DROP TABLE IF EXISTS `guacamole_user_group_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_user_group_attribute` (
  `user_group_id` int NOT NULL,
  `attribute_name` varchar(128) NOT NULL,
  `attribute_value` varchar(4096) NOT NULL,
  PRIMARY KEY (`user_group_id`,`attribute_name`),
  KEY `user_group_id` (`user_group_id`),
  CONSTRAINT `guacamole_user_group_attribute_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `guacamole_user_group` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user_group_attribute`
--

LOCK TABLES `guacamole_user_group_attribute` WRITE;
/*!40000 ALTER TABLE `guacamole_user_group_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_user_group_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_group_member`
--

DROP TABLE IF EXISTS `guacamole_user_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_user_group_member` (
  `user_group_id` int NOT NULL,
  `member_entity_id` int NOT NULL,
  PRIMARY KEY (`user_group_id`,`member_entity_id`),
  KEY `guacamole_user_group_member_entity_id` (`member_entity_id`),
  CONSTRAINT `guacamole_user_group_member_entity_id` FOREIGN KEY (`member_entity_id`) REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `guacamole_user_group_member_parent_id` FOREIGN KEY (`user_group_id`) REFERENCES `guacamole_user_group` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user_group_member`
--

LOCK TABLES `guacamole_user_group_member` WRITE;
/*!40000 ALTER TABLE `guacamole_user_group_member` DISABLE KEYS */;
INSERT INTO `guacamole_user_group_member` VALUES (1,2),(2,2),(3,2);
/*!40000 ALTER TABLE `guacamole_user_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_group_permission`
--

DROP TABLE IF EXISTS `guacamole_user_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_user_group_permission` (
  `entity_id` int NOT NULL,
  `affected_user_group_id` int NOT NULL,
  `permission` enum('READ','UPDATE','DELETE','ADMINISTER') NOT NULL,
  PRIMARY KEY (`entity_id`,`affected_user_group_id`,`permission`),
  KEY `guacamole_user_group_permission_affected_user_group` (`affected_user_group_id`),
  CONSTRAINT `guacamole_user_group_permission_affected_user_group` FOREIGN KEY (`affected_user_group_id`) REFERENCES `guacamole_user_group` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `guacamole_user_group_permission_entity` FOREIGN KEY (`entity_id`) REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user_group_permission`
--

LOCK TABLES `guacamole_user_group_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_user_group_permission` DISABLE KEYS */;
INSERT INTO `guacamole_user_group_permission` VALUES (2,1,'READ'),(2,1,'UPDATE'),(2,1,'DELETE'),(2,1,'ADMINISTER'),(2,2,'READ'),(2,2,'UPDATE'),(2,2,'DELETE'),(2,2,'ADMINISTER'),(2,3,'READ'),(2,3,'UPDATE'),(2,3,'DELETE'),(2,3,'ADMINISTER');
/*!40000 ALTER TABLE `guacamole_user_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_history`
--

DROP TABLE IF EXISTS `guacamole_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_user_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `username` varchar(128) NOT NULL,
  `remote_host` varchar(256) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `user_start_date` (`user_id`,`start_date`),
  CONSTRAINT `guacamole_user_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `guacamole_user` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user_history`
--

LOCK TABLES `guacamole_user_history` WRITE;
/*!40000 ALTER TABLE `guacamole_user_history` DISABLE KEYS */;
INSERT INTO `guacamole_user_history` VALUES (1,21,'ashish-mishra','103.205.173.151','2023-05-06 15:25:44',NULL),(2,21,'ashish-mishra','103.205.173.151','2023-05-06 15:28:21','2023-05-06 16:59:23'),(3,67,'shuhaib','117.208.255.196','2023-05-06 16:43:50',NULL),(4,67,'shuhaib','117.208.255.196','2023-05-06 16:44:14','2023-05-06 17:47:23'),(5,67,'shuhaib','117.208.255.196','2023-05-07 06:22:44',NULL),(6,67,'shuhaib','117.208.255.196','2023-05-07 06:23:08','2023-05-07 07:24:23'),(7,17,'prem-kori','43.241.129.18','2023-05-07 07:22:02',NULL),(8,17,'prem-kori','43.241.129.18','2023-05-07 07:22:20','2023-05-07 08:35:23'),(9,67,'shuhaib','117.255.108.215','2023-05-07 08:44:43',NULL),(10,67,'shuhaib','117.255.108.215','2023-05-07 08:45:06','2023-05-07 08:45:26'),(11,61,'bhavna','115.96.218.178','2023-05-08 03:12:42',NULL),(12,61,'bhavna','115.96.218.178','2023-05-08 03:12:51','2023-05-08 05:49:23'),(13,67,'shuhaib','117.208.254.162','2023-05-08 04:14:02',NULL),(14,67,'shuhaib','117.208.254.162','2023-05-08 04:14:36',NULL),(15,54,'sanjose_mary','45.249.171.80','2023-05-08 04:16:01',NULL),(16,54,'sanjose_mary','45.249.171.80','2023-05-08 04:16:09',NULL),(17,56,'chetan-kapadia','103.87.28.30','2023-05-08 04:16:40',NULL),(18,56,'chetan-kapadia','103.87.28.30','2023-05-08 04:16:51',NULL),(19,26,'sheetal-mohite','42.107.132.87','2023-05-08 04:19:20',NULL),(20,26,'sheetal-mohite','42.107.132.87','2023-05-08 04:19:38','2023-05-08 05:30:29'),(21,55,'vivek-macha','103.172.226.46','2023-05-08 04:38:16',NULL),(22,55,'vivek-macha','103.172.226.46','2023-05-08 04:38:24',NULL),(23,10,'debapriyo','49.36.96.73','2023-05-08 05:04:47',NULL),(24,21,'ashish-mishra','103.205.173.151','2023-05-08 05:09:43',NULL),(25,21,'ashish-mishra','103.205.173.151','2023-05-08 05:09:47',NULL),(26,21,'ashish-mishra','103.205.173.151','2023-05-08 05:09:52',NULL),(27,10,'debapriyo','49.36.96.73','2023-05-08 05:12:37',NULL),(28,26,'sheetal-mohite','42.107.132.87','2023-05-08 05:37:00',NULL),(29,26,'sheetal-mohite','49.33.242.250','2023-05-08 05:37:28',NULL),(30,53,'ashish_singh','103.173.240.52','2023-05-08 05:43:29',NULL),(31,53,'ashish_singh','103.173.240.52','2023-05-08 05:43:44',NULL);
/*!40000 ALTER TABLE `guacamole_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_password_history`
--

DROP TABLE IF EXISTS `guacamole_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_user_password_history` (
  `password_history_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `password_hash` binary(32) NOT NULL,
  `password_salt` binary(32) DEFAULT NULL,
  `password_date` datetime NOT NULL,
  PRIMARY KEY (`password_history_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `guacamole_user_password_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `guacamole_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user_password_history`
--

LOCK TABLES `guacamole_user_password_history` WRITE;
/*!40000 ALTER TABLE `guacamole_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_permission`
--

DROP TABLE IF EXISTS `guacamole_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guacamole_user_permission` (
  `entity_id` int NOT NULL,
  `affected_user_id` int NOT NULL,
  `permission` enum('READ','UPDATE','DELETE','ADMINISTER') NOT NULL,
  PRIMARY KEY (`entity_id`,`affected_user_id`,`permission`),
  KEY `guacamole_user_permission_ibfk_1` (`affected_user_id`),
  CONSTRAINT `guacamole_user_permission_entity` FOREIGN KEY (`entity_id`) REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `guacamole_user_permission_ibfk_1` FOREIGN KEY (`affected_user_id`) REFERENCES `guacamole_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user_permission`
--

LOCK TABLES `guacamole_user_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_user_permission` DISABLE KEYS */;
INSERT INTO `guacamole_user_permission` VALUES (2,2,'READ'),(2,2,'UPDATE'),(2,5,'READ'),(2,5,'UPDATE'),(2,5,'DELETE'),(2,5,'ADMINISTER'),(5,5,'READ'),(5,5,'UPDATE'),(2,8,'READ'),(2,8,'UPDATE'),(2,8,'DELETE'),(2,8,'ADMINISTER'),(8,8,'READ'),(8,8,'UPDATE'),(2,10,'READ'),(2,10,'UPDATE'),(2,10,'DELETE'),(2,10,'ADMINISTER'),(10,10,'READ'),(10,10,'UPDATE'),(2,11,'READ'),(2,11,'UPDATE'),(2,11,'DELETE'),(2,11,'ADMINISTER'),(11,11,'READ'),(11,11,'UPDATE'),(2,15,'READ'),(2,15,'UPDATE'),(2,15,'DELETE'),(2,15,'ADMINISTER'),(18,15,'READ'),(18,15,'UPDATE'),(2,16,'READ'),(2,16,'UPDATE'),(2,16,'DELETE'),(2,16,'ADMINISTER'),(19,16,'READ'),(19,16,'UPDATE'),(2,17,'READ'),(2,17,'UPDATE'),(2,17,'DELETE'),(2,17,'ADMINISTER'),(20,17,'READ'),(20,17,'UPDATE'),(2,18,'READ'),(2,18,'UPDATE'),(2,18,'DELETE'),(2,18,'ADMINISTER'),(21,18,'READ'),(21,18,'UPDATE'),(2,19,'READ'),(2,19,'UPDATE'),(2,19,'DELETE'),(2,19,'ADMINISTER'),(22,19,'READ'),(22,19,'UPDATE'),(2,20,'READ'),(2,20,'UPDATE'),(2,20,'DELETE'),(2,20,'ADMINISTER'),(23,20,'READ'),(23,20,'UPDATE'),(2,21,'READ'),(2,21,'UPDATE'),(2,21,'DELETE'),(2,21,'ADMINISTER'),(24,21,'READ'),(24,21,'UPDATE'),(2,26,'READ'),(2,26,'UPDATE'),(2,26,'DELETE'),(2,26,'ADMINISTER'),(29,26,'READ'),(29,26,'UPDATE'),(2,28,'READ'),(2,28,'UPDATE'),(2,28,'DELETE'),(2,28,'ADMINISTER'),(31,28,'READ'),(31,28,'UPDATE'),(2,30,'READ'),(2,30,'UPDATE'),(2,30,'DELETE'),(2,30,'ADMINISTER'),(33,30,'READ'),(2,31,'READ'),(2,31,'UPDATE'),(2,31,'DELETE'),(2,31,'ADMINISTER'),(34,31,'READ'),(34,31,'UPDATE'),(2,37,'READ'),(2,37,'UPDATE'),(2,37,'DELETE'),(2,37,'ADMINISTER'),(40,37,'READ'),(2,39,'READ'),(2,39,'UPDATE'),(2,39,'DELETE'),(2,39,'ADMINISTER'),(42,39,'READ'),(2,40,'READ'),(2,40,'UPDATE'),(2,40,'DELETE'),(2,40,'ADMINISTER'),(43,40,'READ'),(2,42,'READ'),(2,42,'UPDATE'),(2,42,'DELETE'),(2,42,'ADMINISTER'),(45,42,'READ'),(2,46,'READ'),(2,46,'UPDATE'),(2,46,'DELETE'),(2,46,'ADMINISTER'),(49,46,'READ'),(49,46,'UPDATE'),(2,47,'READ'),(2,47,'UPDATE'),(2,47,'DELETE'),(2,47,'ADMINISTER'),(50,47,'READ'),(2,51,'READ'),(2,51,'UPDATE'),(2,51,'DELETE'),(2,51,'ADMINISTER'),(54,51,'READ'),(2,52,'READ'),(2,52,'UPDATE'),(2,52,'DELETE'),(2,52,'ADMINISTER'),(55,52,'READ'),(2,53,'READ'),(2,53,'UPDATE'),(2,53,'DELETE'),(2,53,'ADMINISTER'),(56,53,'READ'),(2,54,'READ'),(2,54,'UPDATE'),(2,54,'DELETE'),(2,54,'ADMINISTER'),(57,54,'READ'),(2,55,'READ'),(2,55,'UPDATE'),(2,55,'DELETE'),(2,55,'ADMINISTER'),(58,55,'READ'),(2,56,'READ'),(2,56,'UPDATE'),(2,56,'DELETE'),(2,56,'ADMINISTER'),(59,56,'READ'),(2,57,'READ'),(2,57,'UPDATE'),(2,57,'DELETE'),(2,57,'ADMINISTER'),(60,57,'READ'),(2,58,'READ'),(2,58,'UPDATE'),(2,58,'DELETE'),(2,58,'ADMINISTER'),(61,58,'READ'),(2,60,'READ'),(2,60,'UPDATE'),(2,60,'DELETE'),(2,60,'ADMINISTER'),(63,60,'READ'),(60,61,'READ'),(60,61,'UPDATE'),(60,61,'DELETE'),(60,61,'ADMINISTER'),(64,61,'READ'),(60,62,'READ'),(60,62,'UPDATE'),(60,62,'DELETE'),(60,62,'ADMINISTER'),(65,62,'READ'),(60,64,'READ'),(60,64,'UPDATE'),(60,64,'DELETE'),(60,64,'ADMINISTER'),(67,64,'READ'),(60,65,'READ'),(60,65,'UPDATE'),(60,65,'DELETE'),(60,65,'ADMINISTER'),(68,65,'READ'),(60,66,'READ'),(60,66,'UPDATE'),(60,66,'DELETE'),(60,66,'ADMINISTER'),(69,66,'READ'),(69,66,'UPDATE'),(69,67,'READ'),(69,67,'UPDATE'),(69,67,'DELETE'),(69,67,'ADMINISTER'),(70,67,'READ');
/*!40000 ALTER TABLE `guacamole_user_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 11:30:01
