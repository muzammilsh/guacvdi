-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: guacamole
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `guacamole_connection`
--

DROP TABLE IF EXISTS `guacamole_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_connection`
--

LOCK TABLES `guacamole_connection` WRITE;
/*!40000 ALTER TABLE `guacamole_connection` DISABLE KEYS */;
INSERT INTO `guacamole_connection` VALUES (2,'guacamole-vdi-1',NULL,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0),(5,'ubuntu',NULL,'vnc',NULL,NULL,NULL,NULL,NULL,NULL,0),(7,'dishant',NULL,'vnc',NULL,NULL,NULL,NULL,NULL,NULL,0),(9,'lakshmi',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(11,'debapriyo',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(20,'prem-kori',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(23,'pallavi-solanki',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(28,'sheetal-mohite',NULL,'rdp',NULL,NULL,'NONE',NULL,NULL,NULL,0),(29,'pallavi-pawar',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(30,'suman-singh',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(43,'kesar-pandita-new',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(51,'ashish-mishra-new',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(63,'karthik-nair',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(64,'prem-test',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(67,'ashish_singh',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(74,'bhavna',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(83,'chaitanya',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(86,'shuhaib',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(90,'pooja-more',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(93,'Stebin',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(94,'Cheikh-simuam',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(95,'chetan-kapadia',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(115,'ajit-new',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(117,'harbor-gluster-1',NULL,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0),(118,'haproxy-pt-1',NULL,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0),(119,'Simpay-Yesbank',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0),(122,'vivek-macha-new2',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `guacamole_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_connection_attribute`
--

DROP TABLE IF EXISTS `guacamole_connection_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_connection_history`
--

LOCK TABLES `guacamole_connection_history` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_connection_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_connection_parameter`
--

DROP TABLE IF EXISTS `guacamole_connection_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `guacamole_connection_parameter` VALUES (2,'hostname','10.101.199.21'),(2,'password','TYGYMWQ2yeNx'),(2,'port','1895'),(2,'private-key','-----BEGIN OPENSSH PRIVATE KEY-----\nb3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn\nNhAAAAAwEAAQAAAQEAqVgfYLwEIzwAvV+VtPqnYV0UJnym9jUGeLky5keUX2mh6kgDK6jG\nQNuXtIY/50m48d6qEKigmV2J1LdhYG+zI/EdxiKAI4fvDH3xaIAE4ClyaW8gOpxsLqrHC8\nWWtt7IlukSlWIcZMY388mVxa1ZSrF230vDD1szCQq4rHgosfy+Gz3KJrky/QwJGwLhQClb\nAraK01eQV0zBhJ0wEnvN9QBQzeRsgFqzPKTB9FaXmAn+xX0dSQAJ+u3R+F3FJxG7+HTWj3\nrkA7pua+RxrYvPsFfeiz4A3i4K6DT/cC2T0j+Y2+5xffk7YtH/IW1/Wjadw+SAn1WynQhG\n1Bt1DkoS/wAAA9DSQa520kGudgAAAAdzc2gtcnNhAAABAQCpWB9gvAQjPAC9X5W0+qdhXR\nQmfKb2NQZ4uTLmR5RfaaHqSAMrqMZA25e0hj/nSbjx3qoQqKCZXYnUt2Fgb7Mj8R3GIoAj\nh+8MffFogATgKXJpbyA6nGwuqscLxZa23siW6RKVYhxkxjfzyZXFrVlKsXbfS8MPWzMJCr\niseCix/L4bPcomuTL9DAkbAuFAKVsCtorTV5BXTMGEnTASe831AFDN5GyAWrM8pMH0VpeY\nCf7FfR1JAAn67dH4XcUnEbv4dNaPeuQDum5r5HGti8+wV96LPgDeLgroNP9wLZPSP5jb7n\nF9+Tti0f8hbX9aNp3D5ICfVbKdCEbUG3UOShL/AAAAAwEAAQAAAQAjSKgpCKO4D617x6my\nrrMnVzR2nGxRSlUR3EydrHZetuy0mtKGS0EbjGV8iKhR8YtmYeV/WRM1QUcRmi/g3wUtTP\nTOLqwSOyV0rd0Zz+q0Jg6fpzbI34Su6IhWjJHNgne68c8cbvfJi39m/S6GpIrBRF6nQerf\njToB/UjjLpoUE2U6+i7oCc4ltIhLKnx9iAwYXRG05N3yZl+QmdgJG03rXbKX18YXov1h/3\nsajQ9coXArSkcZ3UcI+bbOuWywbYY4sKI/ttt6NE8q5ZvgZrtLYxZtkJnmChZnNOGp/QuT\nbOmp83PmwO0MONpZUUCE8juH8mOqxe3MD+kcpkfHXGyZAAAAgB1m93gp65990dWRXuhu+Q\nPlGJ34/wQuwo5lhO4ryKTXnqiQe2oKzQq58QiR0AXPyjBoUglGglX9epcEp0vxjOULdQHe\nEYThtJpE7s0a3IHLvHo2i6aLMBUmCPXK8HHJyh/VvEp65KOGEpJRAs7AGerdiHhBlZtZHX\nLOYXIy6a6xAAAAgQDeCUNLxsz76zzsn8iXntMhmry0IzkiZ5ayLf78D1q0Z3t53LlqASUN\nDuWPo8BwObsJYiw57ynEm2cswqmUKfiKlKlhwdNTiOkcqoCGQzHECcN1TZpUUssDa43TaP\nCqbmbBqnpaw0P3KXYygkrSktW8IVPJH49Dvf/vcmYo0fkpFQAAAIEAwz99fHCFFJoJMRJu\nnnHNIRUqCaUaa6AaNfpVhm2XV1Uro4aUlE8VKLNTrS/LMVRIO1wIkiIXy87pKyw2ku3yPe\nP5vtmreqM0SBPnNsy/QFkpy9w5xzqtnjtUpaDctOM6g7ZQ+iKccsDLPmX2YIwCU+YiMAGh\nHUzTHQJxl37iqMMAAAAVbXV6YW1AREVTS1RPUC1LSjAyVjg5AQIDBAUG\n-----END OPENSSH PRIVATE KEY-----'),(2,'username','ipmcloud'),(5,'hostname','13.234.94.168'),(5,'password','TYGYMWQ2yeNx'),(5,'port','5901'),(5,'username','ubuntu'),(7,'hostname','13.232.24.36'),(7,'password','TYGYMWQ2yeNx'),(7,'port','5902'),(7,'username','dishant'),(9,'hostname','10.101.199.21'),(9,'ignore-cert','true'),(9,'password','TYGYMWQ2yeNx'),(9,'port','3389'),(9,'security','any'),(9,'username','lakshmi'),(11,'hostname','10.101.199.25'),(11,'ignore-cert','true'),(11,'password','TYGYMWQ2yeNx'),(11,'port','3389'),(11,'security','any'),(11,'username','debapriyo'),(20,'hostname','10.101.199.22'),(20,'ignore-cert','true'),(20,'password','TYGYMWQ2yeNx'),(20,'port','3389'),(20,'security','any'),(20,'username','prem-kori'),(23,'hostname','10.101.199.24'),(23,'ignore-cert','true'),(23,'password','TYGYMWQ2yeNx'),(23,'port','3389'),(23,'security','any'),(23,'username','pallavi-solanki'),(28,'hostname','10.101.199.24'),(28,'ignore-cert','true'),(28,'password','TYGYMWQ2yeNx'),(28,'port','3389'),(28,'security','any'),(28,'username','sheetal-mohite'),(29,'hostname','10.101.199.21'),(29,'ignore-cert','true'),(29,'password','TYGYMWQ2yeNx'),(29,'port','3389'),(29,'security','any'),(29,'username','pallavi-pawar'),(30,'hostname','10.101.199.25'),(30,'ignore-cert','true'),(30,'password','TYGYMWQ2yeNx'),(30,'port','3389'),(30,'security','any'),(30,'username','suman-singh'),(43,'hostname','10.101.199.22'),(43,'ignore-cert','true'),(43,'password','TYGYMWQ2yeNx'),(43,'port','3389'),(43,'security','any'),(43,'username','kesar-pandita'),(51,'hostname','10.101.199.22'),(51,'ignore-cert','true'),(51,'password','TYGYMWQ2yeNx'),(51,'port','3389'),(51,'security','any'),(51,'username','ashish-mishra'),(63,'hostname','10.101.199.21'),(63,'ignore-cert','true'),(63,'password','TYGYMWQ2yeNx'),(63,'port','3389'),(63,'security','any'),(63,'username','karthik-nair'),(64,'hostname','10.101.199.22'),(64,'ignore-cert','true'),(64,'password','TYGYMWQ2yeNx'),(64,'port','3389'),(64,'security','any'),(64,'username','prem-test'),(67,'hostname','10.101.199.24'),(67,'ignore-cert','true'),(67,'password','TYGYMWQ2yeNx'),(67,'port','3389'),(67,'security','any'),(67,'username','ashish_singh'),(74,'hostname','10.101.199.24'),(74,'ignore-cert','true'),(74,'password','TYGYMWQ2yeNx'),(74,'port','3389'),(74,'security','any'),(74,'username','bhavna'),(83,'hostname','10.101.199.21'),(83,'ignore-cert','true'),(83,'password','TYGYMWQ2yeNx'),(83,'port','3389'),(83,'security','any'),(83,'username','chaitanya'),(86,'hostname','10.101.199.25'),(86,'ignore-cert','true'),(86,'password','TYGYMWQ2yeNx'),(86,'port','3389'),(86,'security','any'),(86,'username','shuhaib'),(90,'hostname','10.101.199.23'),(90,'ignore-cert','true'),(90,'password','TYGYMWQ2yeNx'),(90,'port','3389'),(90,'security','any'),(90,'username','pooja-more'),(93,'hostname','10.101.199.25'),(93,'ignore-cert','true'),(93,'password','TYGYMWQ2yeNx'),(93,'port','3389'),(93,'security','any'),(93,'username','stebin'),(94,'hostname','10.101.199.21'),(94,'ignore-cert','true'),(94,'password','TYGYMWQ2yeNx'),(94,'port','3389'),(94,'security','any'),(94,'username','cheikh-simuam'),(95,'color-depth','16'),(95,'hostname','10.101.199.23'),(95,'ignore-cert','true'),(95,'password','TYGYMWQ2yeNx'),(95,'port','3389'),(95,'security','any'),(95,'username','chetan-kapadia'),(115,'hostname','10.101.199.23'),(115,'ignore-cert','true'),(115,'password','TYGYMWQ2yeNx'),(115,'port','3389'),(115,'security','any'),(115,'username','ajit'),(117,'hostname','10.101.180.72'),(117,'port','1895'),(117,'private-key','-----BEGIN OPENSSH PRIVATE KEY-----\nb3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn\nNhAAAAAwEAAQAAAQEAqVgfYLwEIzwAvV+VtPqnYV0UJnym9jUGeLky5keUX2mh6kgDK6jG\nQNuXtIY/50m48d6qEKigmV2J1LdhYG+zI/EdxiKAI4fvDH3xaIAE4ClyaW8gOpxsLqrHC8\nWWtt7IlukSlWIcZMY388mVxa1ZSrF230vDD1szCQq4rHgosfy+Gz3KJrky/QwJGwLhQClb\nAraK01eQV0zBhJ0wEnvN9QBQzeRsgFqzPKTB9FaXmAn+xX0dSQAJ+u3R+F3FJxG7+HTWj3\nrkA7pua+RxrYvPsFfeiz4A3i4K6DT/cC2T0j+Y2+5xffk7YtH/IW1/Wjadw+SAn1WynQhG\n1Bt1DkoS/wAAA9DSQa520kGudgAAAAdzc2gtcnNhAAABAQCpWB9gvAQjPAC9X5W0+qdhXR\nQmfKb2NQZ4uTLmR5RfaaHqSAMrqMZA25e0hj/nSbjx3qoQqKCZXYnUt2Fgb7Mj8R3GIoAj\nh+8MffFogATgKXJpbyA6nGwuqscLxZa23siW6RKVYhxkxjfzyZXFrVlKsXbfS8MPWzMJCr\niseCix/L4bPcomuTL9DAkbAuFAKVsCtorTV5BXTMGEnTASe831AFDN5GyAWrM8pMH0VpeY\nCf7FfR1JAAn67dH4XcUnEbv4dNaPeuQDum5r5HGti8+wV96LPgDeLgroNP9wLZPSP5jb7n\nF9+Tti0f8hbX9aNp3D5ICfVbKdCEbUG3UOShL/AAAAAwEAAQAAAQAjSKgpCKO4D617x6my\nrrMnVzR2nGxRSlUR3EydrHZetuy0mtKGS0EbjGV8iKhR8YtmYeV/WRM1QUcRmi/g3wUtTP\nTOLqwSOyV0rd0Zz+q0Jg6fpzbI34Su6IhWjJHNgne68c8cbvfJi39m/S6GpIrBRF6nQerf\njToB/UjjLpoUE2U6+i7oCc4ltIhLKnx9iAwYXRG05N3yZl+QmdgJG03rXbKX18YXov1h/3\nsajQ9coXArSkcZ3UcI+bbOuWywbYY4sKI/ttt6NE8q5ZvgZrtLYxZtkJnmChZnNOGp/QuT\nbOmp83PmwO0MONpZUUCE8juH8mOqxe3MD+kcpkfHXGyZAAAAgB1m93gp65990dWRXuhu+Q\nPlGJ34/wQuwo5lhO4ryKTXnqiQe2oKzQq58QiR0AXPyjBoUglGglX9epcEp0vxjOULdQHe\nEYThtJpE7s0a3IHLvHo2i6aLMBUmCPXK8HHJyh/VvEp65KOGEpJRAs7AGerdiHhBlZtZHX\nLOYXIy6a6xAAAAgQDeCUNLxsz76zzsn8iXntMhmry0IzkiZ5ayLf78D1q0Z3t53LlqASUN\nDuWPo8BwObsJYiw57ynEm2cswqmUKfiKlKlhwdNTiOkcqoCGQzHECcN1TZpUUssDa43TaP\nCqbmbBqnpaw0P3KXYygkrSktW8IVPJH49Dvf/vcmYo0fkpFQAAAIEAwz99fHCFFJoJMRJu\nnnHNIRUqCaUaa6AaNfpVhm2XV1Uro4aUlE8VKLNTrS/LMVRIO1wIkiIXy87pKyw2ku3yPe\nP5vtmreqM0SBPnNsy/QFkpy9w5xzqtnjtUpaDctOM6g7ZQ+iKccsDLPmX2YIwCU+YiMAGh\nHUzTHQJxl37iqMMAAAAVbXV6YW1AREVTS1RPUC1LSjAyVjg5AQIDBAUG\n-----END OPENSSH PRIVATE KEY-----'),(117,'username','ipmcloud'),(118,'hostname','10.101.180.68'),(118,'port','1895'),(118,'private-key','-----BEGIN OPENSSH PRIVATE KEY-----\nb3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn\nNhAAAAAwEAAQAAAQEAqVgfYLwEIzwAvV+VtPqnYV0UJnym9jUGeLky5keUX2mh6kgDK6jG\nQNuXtIY/50m48d6qEKigmV2J1LdhYG+zI/EdxiKAI4fvDH3xaIAE4ClyaW8gOpxsLqrHC8\nWWtt7IlukSlWIcZMY388mVxa1ZSrF230vDD1szCQq4rHgosfy+Gz3KJrky/QwJGwLhQClb\nAraK01eQV0zBhJ0wEnvN9QBQzeRsgFqzPKTB9FaXmAn+xX0dSQAJ+u3R+F3FJxG7+HTWj3\nrkA7pua+RxrYvPsFfeiz4A3i4K6DT/cC2T0j+Y2+5xffk7YtH/IW1/Wjadw+SAn1WynQhG\n1Bt1DkoS/wAAA9DSQa520kGudgAAAAdzc2gtcnNhAAABAQCpWB9gvAQjPAC9X5W0+qdhXR\nQmfKb2NQZ4uTLmR5RfaaHqSAMrqMZA25e0hj/nSbjx3qoQqKCZXYnUt2Fgb7Mj8R3GIoAj\nh+8MffFogATgKXJpbyA6nGwuqscLxZa23siW6RKVYhxkxjfzyZXFrVlKsXbfS8MPWzMJCr\niseCix/L4bPcomuTL9DAkbAuFAKVsCtorTV5BXTMGEnTASe831AFDN5GyAWrM8pMH0VpeY\nCf7FfR1JAAn67dH4XcUnEbv4dNaPeuQDum5r5HGti8+wV96LPgDeLgroNP9wLZPSP5jb7n\nF9+Tti0f8hbX9aNp3D5ICfVbKdCEbUG3UOShL/AAAAAwEAAQAAAQAjSKgpCKO4D617x6my\nrrMnVzR2nGxRSlUR3EydrHZetuy0mtKGS0EbjGV8iKhR8YtmYeV/WRM1QUcRmi/g3wUtTP\nTOLqwSOyV0rd0Zz+q0Jg6fpzbI34Su6IhWjJHNgne68c8cbvfJi39m/S6GpIrBRF6nQerf\njToB/UjjLpoUE2U6+i7oCc4ltIhLKnx9iAwYXRG05N3yZl+QmdgJG03rXbKX18YXov1h/3\nsajQ9coXArSkcZ3UcI+bbOuWywbYY4sKI/ttt6NE8q5ZvgZrtLYxZtkJnmChZnNOGp/QuT\nbOmp83PmwO0MONpZUUCE8juH8mOqxe3MD+kcpkfHXGyZAAAAgB1m93gp65990dWRXuhu+Q\nPlGJ34/wQuwo5lhO4ryKTXnqiQe2oKzQq58QiR0AXPyjBoUglGglX9epcEp0vxjOULdQHe\nEYThtJpE7s0a3IHLvHo2i6aLMBUmCPXK8HHJyh/VvEp65KOGEpJRAs7AGerdiHhBlZtZHX\nLOYXIy6a6xAAAAgQDeCUNLxsz76zzsn8iXntMhmry0IzkiZ5ayLf78D1q0Z3t53LlqASUN\nDuWPo8BwObsJYiw57ynEm2cswqmUKfiKlKlhwdNTiOkcqoCGQzHECcN1TZpUUssDa43TaP\nCqbmbBqnpaw0P3KXYygkrSktW8IVPJH49Dvf/vcmYo0fkpFQAAAIEAwz99fHCFFJoJMRJu\nnnHNIRUqCaUaa6AaNfpVhm2XV1Uro4aUlE8VKLNTrS/LMVRIO1wIkiIXy87pKyw2ku3yPe\nP5vtmreqM0SBPnNsy/QFkpy9w5xzqtnjtUpaDctOM6g7ZQ+iKccsDLPmX2YIwCU+YiMAGh\nHUzTHQJxl37iqMMAAAAVbXV6YW1AREVTS1RPUC1LSjAyVjg5AQIDBAUG\n-----END OPENSSH PRIVATE KEY-----'),(118,'username','ipmcloud'),(119,'hostname','13.201.61.26'),(119,'ignore-cert','true'),(119,'password','0@UC-zF!Fl0)kq%7mdh?mHoTLkjlBtCK'),(119,'port','3389'),(119,'security','any'),(119,'username','Administrator'),(122,'hostname','10.101.199.21'),(122,'ignore-cert','true'),(122,'password','TYGYMWQ2yeNx'),(122,'port','3389'),(122,'security','any'),(122,'username','vivek-macha');
/*!40000 ALTER TABLE `guacamole_connection_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_connection_permission`
--

DROP TABLE IF EXISTS `guacamole_connection_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `guacamole_connection_permission` VALUES (2,2,'READ'),(20,2,'READ'),(24,2,'READ'),(33,2,'READ'),(2,5,'READ'),(2,5,'UPDATE'),(2,5,'DELETE'),(2,5,'ADMINISTER'),(2,7,'READ'),(2,7,'UPDATE'),(2,7,'DELETE'),(2,7,'ADMINISTER'),(5,7,'READ'),(17,7,'READ'),(2,9,'READ'),(2,9,'UPDATE'),(2,9,'DELETE'),(2,9,'ADMINISTER'),(17,9,'READ'),(19,9,'READ'),(2,11,'READ'),(2,11,'UPDATE'),(2,11,'DELETE'),(2,11,'ADMINISTER'),(10,11,'READ'),(16,11,'READ'),(20,11,'READ'),(67,11,'READ'),(2,20,'READ'),(2,20,'UPDATE'),(2,20,'DELETE'),(2,20,'ADMINISTER'),(20,20,'READ'),(24,20,'READ'),(2,23,'READ'),(2,23,'UPDATE'),(2,23,'DELETE'),(2,23,'ADMINISTER'),(10,23,'READ'),(23,23,'READ'),(29,23,'READ'),(2,28,'READ'),(2,28,'UPDATE'),(2,28,'DELETE'),(2,28,'ADMINISTER'),(29,28,'READ'),(2,29,'READ'),(2,29,'UPDATE'),(2,29,'DELETE'),(2,29,'ADMINISTER'),(33,29,'READ'),(2,30,'READ'),(2,30,'UPDATE'),(2,30,'DELETE'),(2,30,'ADMINISTER'),(34,30,'READ'),(2,43,'READ'),(2,43,'UPDATE'),(2,43,'DELETE'),(2,43,'ADMINISTER'),(22,43,'READ'),(2,51,'READ'),(2,51,'UPDATE'),(2,51,'DELETE'),(2,51,'ADMINISTER'),(24,51,'READ'),(2,63,'READ'),(2,63,'UPDATE'),(2,63,'DELETE'),(2,63,'ADMINISTER'),(23,63,'READ'),(55,63,'READ'),(2,64,'READ'),(2,64,'UPDATE'),(2,64,'DELETE'),(2,64,'ADMINISTER'),(20,64,'READ'),(21,64,'READ'),(24,64,'READ'),(33,64,'READ'),(67,64,'READ'),(2,67,'READ'),(2,67,'UPDATE'),(2,67,'DELETE'),(2,67,'ADMINISTER'),(23,67,'READ'),(56,67,'READ'),(64,74,'READ'),(20,83,'READ'),(58,83,'READ'),(69,83,'READ'),(10,86,'READ'),(69,86,'READ'),(69,86,'UPDATE'),(69,86,'DELETE'),(69,86,'ADMINISTER'),(70,86,'READ'),(69,90,'READ'),(69,90,'UPDATE'),(69,90,'DELETE'),(69,90,'ADMINISTER'),(72,90,'READ'),(10,93,'READ'),(69,93,'READ'),(69,93,'UPDATE'),(69,93,'DELETE'),(69,93,'ADMINISTER'),(73,93,'READ'),(67,94,'READ'),(69,94,'READ'),(69,94,'UPDATE'),(69,94,'DELETE'),(69,94,'ADMINISTER'),(74,94,'READ'),(59,95,'READ'),(69,95,'READ'),(69,95,'UPDATE'),(69,95,'DELETE'),(69,95,'ADMINISTER'),(69,115,'READ'),(69,115,'UPDATE'),(69,115,'DELETE'),(69,115,'ADMINISTER'),(2,117,'READ'),(2,117,'UPDATE'),(2,117,'DELETE'),(2,117,'ADMINISTER'),(2,118,'READ'),(2,118,'UPDATE'),(2,118,'DELETE'),(2,118,'ADMINISTER'),(20,119,'READ'),(24,119,'READ'),(69,119,'READ'),(69,119,'UPDATE'),(69,119,'DELETE'),(69,119,'ADMINISTER'),(58,122,'READ'),(69,122,'READ'),(69,122,'UPDATE'),(69,122,'DELETE'),(69,122,'ADMINISTER');
/*!40000 ALTER TABLE `guacamole_connection_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_entity`
--

DROP TABLE IF EXISTS `guacamole_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guacamole_entity` (
  `entity_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `type` enum('USER','USER_GROUP') NOT NULL,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `guacamole_entity_name_scope` (`type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_entity`
--

LOCK TABLES `guacamole_entity` WRITE;
/*!40000 ALTER TABLE `guacamole_entity` DISABLE KEYS */;
INSERT INTO `guacamole_entity` VALUES (18,'ajit','USER'),(71,'amey','USER'),(8,'anirudh','USER'),(24,'ashish-mishra','USER'),(56,'ashish_singh','USER'),(64,'bhavna','USER'),(69,'chaitanya','USER'),(67,'Cheikh','USER'),(74,'cheikh-simuam','USER'),(59,'chetan-kapadia','USER'),(10,'debapriyo','USER'),(65,'deepak','USER'),(75,'devesh','USER'),(5,'dishant@simsol.in','USER'),(40,'elango','USER'),(54,'james-durai','USER'),(42,'junaid-khan','USER'),(43,'kailash','USER'),(55,'karthik-nair','USER'),(22,'kesar-pandita','USER'),(49,'kristoff','USER'),(19,'lakshmi@simsol.in','USER'),(50,'leslie','USER'),(11,'medha','USER'),(33,'pallavi-pawar','USER'),(23,'pallavi-solanki','USER'),(72,'pooja-more','USER'),(21,'prashant-thorat','USER'),(20,'prem-kori','USER'),(68,'Salaton','USER'),(57,'sanjose_mary','USER'),(29,'sheetal-mohite','USER'),(70,'shuhaib','USER'),(63,'simuam','USER'),(73,'Stebin-Sabu','USER'),(34,'suman-singh','USER'),(61,'vishwajit-ln','USER'),(58,'vivek-macha','USER'),(2,'zygot','USER'),(76,'Docker Swarm','USER_GROUP'),(16,'i1-LIVEDESK-interns','USER_GROUP'),(15,'i2-LIVEDESK-Kailash','USER_GROUP'),(17,'LIVEDESK','USER_GROUP');
/*!40000 ALTER TABLE `guacamole_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_sharing_profile`
--

DROP TABLE IF EXISTS `guacamole_sharing_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `guacamole_system_permission` VALUES (2,'CREATE_CONNECTION'),(2,'CREATE_CONNECTION_GROUP'),(2,'CREATE_SHARING_PROFILE'),(2,'CREATE_USER'),(2,'CREATE_USER_GROUP'),(2,'ADMINISTER'),(18,'ADMINISTER'),(49,'ADMINISTER'),(65,'ADMINISTER'),(69,'CREATE_CONNECTION'),(69,'CREATE_CONNECTION_GROUP'),(69,'CREATE_SHARING_PROFILE'),(69,'CREATE_USER'),(69,'CREATE_USER_GROUP'),(69,'ADMINISTER');
/*!40000 ALTER TABLE `guacamole_system_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user`
--

DROP TABLE IF EXISTS `guacamole_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user`
--

LOCK TABLES `guacamole_user` WRITE;
/*!40000 ALTER TABLE `guacamole_user` DISABLE KEYS */;
INSERT INTO `guacamole_user` VALUES (2,2,_binary 'þq_\nH“\å(Î€/¦«\Îh\à\ïV\Øl\Õ*š!\ó\"\Ù~',_binary '\Û€3\Z› \òu]SZ¨¤;s\æœu¸ÛªË Mùªroh','2021-10-09 21:37:10',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,5,_binary 'º^¢[‘ND.¤Ï†\á€\ZRšH{#F0s]%£Q[#M\0I',_binary '™Z\'˜2å®¹6³›‡\÷$\ó	\ä]m\èP|µZÙ±¦\ØPN','2021-10-09 00:00:00',0,1,NULL,NULL,NULL,NULL,NULL,'Dishant',NULL,'Simsol','Tester'),(8,8,_binary '\è\Øu´/Á\ß\Ý †\r¥Î±”hÛ¤-¹>°$U£Þ³',_binary 'œ]¥\ÔO\ÙÁ\Ú\òÛªVûa²Bk1¼\Ù\n¬{\õ¤\ñ','2021-10-11 09:32:10',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,10,_binary '\0)-þÑ¥k\ß\ôd_\ÊMº\î\ãF6©g¯²\ZW?>RXT',_binary 'ÀªE\î\Ï!-¯I\ËÏ\Çs@\â¦ü’¸@¬\Í#¸\é0½2gq','2021-10-11 09:30:51',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,11,_binary '\à\ó¿C´\Ý>x\ß7§þ\Æx£\ç\Ì\ò\É²“Š\0‰#§R¼\æ3z',_binary '5Ì²{l\ñ){`­:W±\Æn¹A\Ô\Ôe$\Í\ô\æ¹\Õ\ßi;¶','2022-02-10 06:14:24',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,18,_binary 'NM /\é\ö[g“\à_®\à¿úB/{\\¢\ö\\R&\Â37Ádm',_binary ',‹W‚\ñdÿ9}-Î½­jºt«\"Á\n¦p°Me7\0\ò','2025-03-31 10:05:35',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,19,_binary '´?\ö\çÏˆ›\ÙÊš“Œ”·xC\"\Ëø\Ær¶£c¡Àv^\ò˜Wý',_binary '\Ì\â­}ª\æ6­G­££.\ã\Ú\á¾©W\n#\ó°^%k\'','2021-10-20 07:19:15',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,20,_binary 'iÜ¦&”‘X‰µ»\Ë9[„Z¯#•S;ŸÒ–€\Ã<9¾¯',_binary '\ÒYQƒø„\ó4\ê\Ê´”Ô”¶DŒ\ò&KbŽ®\Û`/8\ölX','2023-09-06 07:59:08',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,21,_binary '\à\ôzÛ·J\0$¹½hB?\Ý\è’H\Ê\í®)Q©¦‘=ß›n\Ä',_binary 'c\Â \\\ÓF]\Ã‰¤Z|9\\¾l\Zûx½ù«` \à','2021-10-11 03:29:06',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,22,_binary 'Ð½µï„š9\å\Ì:R*û?\ìe9KY_\î#\0\ÏX\æ\ïŸ',_binary '‰\nO@‰+\åýÇˆ\Z\Æ\öœs\ë€^}S t£tJ¶','2021-10-11 04:40:05',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,23,_binary '\"h†.\Únƒ5R7i3R€\Ö!µ¨\É\æ\ÞGþÑ¯\Ök\Û',_binary 'GIÜ•9‘c\òh7z\Í^an¬\ó¥µL\ÉZ5—ƒ§–8*','2021-10-10 10:32:28',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,24,_binary '¨$;\ì_4\ãÀ\Äå»\ÒÞ–74\á\ë\óÅ¥›\"<',_binary '\è\Î\èË»Ý‚zw\\Wu+=—?ŸW¸\Ø\ó6\ã\ÒÓ½¶S\0u\ö#','2021-10-11 05:29:49',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,29,_binary '³\ê\ÆyR\Ë\ó€\õ‚	 `1…\Ää˜h\\\ô’|r<\Þªz',_binary 'D	ž¢Jž“yÛƒ\ØM¤€k\õ\õ\æ—\ZW\îU\ÐR`$','2021-10-11 04:53:16',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,33,_binary '\õ“KØº€“hU\ì¢]9 \ÒA&\õü\Ä8\ætýI@°a',_binary 'G|º\ç¬:ZGB`œ#%‰\óFøÉž\çr<\é \Ð\Ô','2021-10-11 05:25:47',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,34,_binary '\ÞA;¹™*»\ÕB‡£×ª%¤<\Z\óm.\ãe1ü8zY^Ef',_binary 'û\î24\Ñ\è/d\Öy;±Œ{ŽÏ4W\ná…”Q\\û…\ê','2021-10-20 08:54:38',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,40,_binary '\\dù\ñ\ã\È\Ôu2\0¼\õ2\óB5”\'€º•.z¾_\éÐ±',_binary 'm¸È©tS4„Cm$§©Žœ]!„Gr¬&œ\ö\èB\ìSIp','2021-10-10 04:55:55',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,42,_binary 'º^¢[‘ND.¤Ï†\á€\ZRšH{#F0s]%£Q[#M\0I',_binary '™Z\'˜2å®¹6³›‡\÷$\ó	\ä]m\èP|µZÙ±¦\ØPN','2021-10-09 00:00:00',0,1,NULL,NULL,NULL,NULL,NULL,'Junaid Khan',NULL,'Simsol','Dev'),(40,43,_binary '\ïe\ç¿\ÖclX±VTv/šç»–\î²g!1¬\÷ý)0M',_binary '·\n¶½»n0H‰S™ù-±ŠµªÁ\î‰/±½\Ý	©žƒ','2021-10-12 08:18:01',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,49,_binary 'HJùCæ›¦\ãI¢\ö\á\ã\à€\ôt(Yr\ç2\ð\ì',_binary '\Å[‹\Ø;¢¿\à[\"DGºP†¤\×\Ö\è\Æ\Ä³d\Z\ò!\ô','2022-06-13 09:47:54',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,50,_binary '\ìý%ØºÍ¥©\éÓ¶V&ÀW¥“|–\éÁ—Ò¸6ª\Ñ!!&\èe',_binary 'Ê²^(\å¬ú–\òÍ¿X”Ò¼\Ã.E©¦†CÀ\Ö&\0¬ý','2022-11-01 10:49:32',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,54,_binary 'Ó ý\òÁ=€\õ\åwK\æ«SqP´q’®\ê\nE—\Ù.',_binary 'n³‡ƒü\ÔÑˆ=—v&}£[•†‘\Z\ÈE	«ú`8K\Ñt\Õ','2022-02-17 05:41:43',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,55,_binary 'ƒ?¹+f†,3\ÈP_£SÁ6\í-\ðAšl°šPt\Õ',_binary '\æE\ì\È‘©8 C*Ê¡V\æø.€\0¦\ÖÚ³U\ö“J\Ó6','2022-04-01 10:39:27',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,56,_binary 'ùYS\r\óQ\ò’&\à»/\é\Ù0cGC|À\Ê^=\å)\ë\ö\Æc\ñ',_binary '›ýl\"\é,s2t1\Ëv\ð¢’ùþ>À´\ë\à\ïýJŽ\"&','2022-05-26 07:14:33',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,57,_binary '\ïœ\ð\ét§W¹3[¥f#4\ñ\äü½,r\"M\Æ\ínR7k',_binary 'H-E\íž—`ˆkýƒ\Ì\ÄL\ÂY‹\Äm\ã•{ë²¹\Ó\ß','2022-05-30 11:18:04',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,58,_binary 'IŒP\ì\"j7\ß^ÿC²\ò9ªÛV™È­û,zÖ­\ÐÜ·±',_binary '*£\å\Õ+VY*Ky›½\Þ\ê\Ø3ù\Ün(3¨\òù=©\Äo','2022-08-09 08:37:37',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,59,_binary 'u9“R_ ·t\\\àŒ\Â\ñP°5¶Ô¬kÚš}ª9ü',_binary '¬ kEiC\"WÿTohLÂ¥ø\nYMB\ò\Ê\çFL\Ô\×S','2023-05-13 05:59:19',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,61,_binary '’&œŸ]h9ûžubü…\ÍL¹Z=‰YT¦hA[3e,',_binary 'b‰„©9\ã\0Ÿ¾þ\Ä+\Ö\Ü\ÐV,)Uú(\ð|r¬rE”','2023-03-20 06:04:31',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,63,_binary '£™9‚ˆ#¤\n\0¿\n]\ÒC\ñ#¨•UÀ\Ø=xŽ\n±»Z',_binary 'V\Û0i0±\ì<\ÍÑ´\ê”p\÷\Î~g–ŠF%!x\óg','2022-09-22 07:04:24',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,64,_binary '‘\ö.†’Ÿ„‹»\ìüt\ßÂŒø\Ôg¾(¼¸s\ÑV‘©',_binary '\ã=#IØš\Ív*\"8}­¿(ú\ï\ÍÕ¹¨9©f\è&6J\×','2022-09-29 13:25:49',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,65,_binary '\Þ7qQ\\µ\â.N_)!:®Ñ\rk\ô‡¹`]^@,³Yú',_binary '\Z\æccÓ0\è)•^¿!!—lB\÷6ù	ûK°rt¬\\','2022-12-20 11:06:25',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,67,_binary '[p¥\ÆD@t©´Ô‰s\Üæ£¬©E2h¼]\×ú\Ó',_binary 'œ}Z(0sN\Ø\0¬¢±T,\õ~C0\0~\ö“\å\Þr¹\åÛ‰','2023-09-15 13:44:49',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,68,_binary '\Ñ?CZš¶Np~Ÿm\æ\ì‚\õxÁJø\ï\ç\ñ\Ó\ç\â\Ò\ñ\Ç',_binary '!\ç.æ³„\éL\ó7G\å—%„-B‘´0“\æ1rÅ’ªV','2023-02-21 12:33:23',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,69,_binary '„®¡\ô\Øÿ}0Ð›\rW\è:‰±	`\íüÿ\Ñ\ñn¸(',_binary '’1þbJ•\æ\Ô\Ø\rGl\È±*IlX=\Ñ\Æb6:wl.T¦','2023-04-20 10:05:07',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,70,_binary 't\Ç5\Z\Ñ\ó\\Ö¬\ô±E\ÐY\éÁtx@©P\ç\Ê\'±O8]',_binary '\àlGž‰\ñ\ã/4GA~c‘…iO¾…\áŠÿm×¼R¼\ï','2023-05-01 05:53:40',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,71,_binary '°(L\â·:·a¥\n²x\n\×Mr\Ò!¼NQ‰\0 v>ÁU',_binary '<¤(\á^‡,µU\ëE)±\ê%\ö˜\æt‚;‰Aý€ý‚“','2023-05-29 06:06:32',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,72,_binary 'F\Ç0Es¯Û°\ïÍ£y\î¡P…68\ÎT—\îÒ›2EEn\Ü\\þ',_binary '=¹7\÷\Þ[#/”ZˆB€GPZP\ÓÀ¯\áÙ±^\Ûb*$\Å','2023-05-31 07:44:53',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,73,_binary 'Ü‰a™‡\ög™Y\Í[Å’¿\rZiI\åyv‚\Üÿù\ã&',_binary 's*\ìC\0A²²D´$]¤³\ó¥Í»|ß°‡B\åÀ\Â{k','2023-09-05 06:17:08',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,74,_binary 'n®Y](mG\'»\çQ=X\åF_Ä™Ü³=¯¹¼\Â\å\Ýü',_binary 'ª,{J_’K \×\ß7\ÈÛ»¢\ßKi_	rtÄ­TG§\'µú','2023-09-15 12:50:31',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,75,_binary 'ˆt\ßY\ê¹{²{»\Ó\ð~\á\ç\'\Û×ªzƒyN~i™¡',_binary '\ô¿\ïn	`døf\â] SŒuB\Ö\ã-„\Ý\ö™ »“\â–Ž','2024-01-17 09:32:52',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `guacamole_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_attribute`
--

DROP TABLE IF EXISTS `guacamole_user_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `guacamole_user_attribute` VALUES (2,'guac-totp-key-confirmed','true'),(2,'guac-totp-key-secret','EJ23M7BOYWL7JRC3Z7ISZNYJGMFCEHLP'),(8,'guac-totp-key-confirmed','true'),(8,'guac-totp-key-secret','RGFLBYPGE34QMLOQMPRSUJTADRAC4EEN'),(10,'guac-totp-key-confirmed','true'),(10,'guac-totp-key-secret','KKANOUZFIDNVCLFP3DKBTONOL7D7WZHX'),(11,'guac-totp-key-confirmed','true'),(11,'guac-totp-key-secret','F45UYCKRMOJKQKHCWKROTD4CENVJELGK'),(15,'guac-totp-key-confirmed','true'),(15,'guac-totp-key-secret','FNLIBQJPFRXOYMYAQC4ZBDS2H3IUQLST'),(16,'guac-totp-key-confirmed','true'),(16,'guac-totp-key-secret','F4NAD3B4XQE7M5XIWQ7KPORCQRCURBRF'),(17,'guac-totp-key-confirmed','true'),(17,'guac-totp-key-secret','NVLRWUL6CV3TVBDQDN6ZKNIQFOB4ZQLU'),(18,'guac-totp-key-confirmed','true'),(18,'guac-totp-key-secret','25XKOL3ZSERA6J6G7CRAFZ4THQT4UXP6'),(19,'guac-totp-key-confirmed','true'),(19,'guac-totp-key-secret','HQCDNZRF6SW53K2H43V6ER2C2GKZ6KZC'),(20,'guac-totp-key-confirmed','true'),(20,'guac-totp-key-secret','326OPO5GSOT73553N6FJJC4T4RCDTPSB'),(21,'guac-totp-key-confirmed','true'),(21,'guac-totp-key-secret','MZJYKGQMXSUNRCFMY7G5PRG5YVCNBU5L'),(26,'guac-totp-key-confirmed','true'),(26,'guac-totp-key-secret','MTOIN5OV6MSUYOLKNLAWSMHEWBNHESH4'),(30,'guac-totp-key-confirmed','true'),(30,'guac-totp-key-secret','K3J4RDCW4246S6KA5NM4HUZCOS67XN3B'),(31,'guac-totp-key-confirmed','true'),(31,'guac-totp-key-secret','FWWF6ATHBJAPGCRN2BVFPMHGTRL337CA'),(37,'guac-totp-key-confirmed','true'),(37,'guac-totp-key-secret','HZHZQN4IUG3HQVVPAFOXDL6CMPBAIW5U'),(40,'guac-totp-key-confirmed','true'),(40,'guac-totp-key-secret','HUGXFYFAF6NUGHTZPJL54TMPLHDUPEBH'),(46,'guac-totp-key-confirmed','true'),(46,'guac-totp-key-secret','P3SSG5L3K25KXOCMGW4LK2ETRJAZ6OMR'),(47,'guac-totp-key-confirmed','true'),(47,'guac-totp-key-secret','JM5OY6B4AAB55JXSC6DT45C7RFLC57WQ'),(51,'guac-totp-key-confirmed','true'),(51,'guac-totp-key-secret','WO2SUQZ3ZCRQA7LT2VXKWL7P7XHZ447G'),(52,'guac-totp-key-confirmed','true'),(52,'guac-totp-key-secret','AX5RSONY2DJQUIKMW4YFR3FNH5IJCEJK'),(53,'guac-totp-key-confirmed','true'),(53,'guac-totp-key-secret','INB6C4JOL5QFZFC2E52PPJA32RMS76RC'),(54,'guac-totp-key-confirmed','true'),(54,'guac-totp-key-secret','7WVGTR5ZGD5QMDILPTBUIEOG6X56IAMN'),(55,'guac-totp-key-confirmed','true'),(55,'guac-totp-key-secret','V5OVLDHSBP63CELGD4SYUSPUHYT3YLND'),(56,'guac-totp-key-confirmed','true'),(56,'guac-totp-key-secret','GTP5A2EDNJU5UNTHAU5THAVW2OXR4SD4'),(58,'guac-totp-key-confirmed','true'),(58,'guac-totp-key-secret','GFCHA4LFKLIDIBDNBH5BASN6B7XA3E4Y'),(60,'guac-totp-key-confirmed','true'),(60,'guac-totp-key-secret','VVOVLHZKLXZ5BEFY677MZH4ANTUX2PFT'),(61,'guac-totp-key-confirmed','true'),(61,'guac-totp-key-secret','G5IV4RUDJPQOGPNXTL2NDR3DAEOIBL7R'),(62,'guac-totp-key-confirmed','true'),(62,'guac-totp-key-secret','AYPEC47KW67XBZGTJFUE64CBY5LT7CEZ'),(64,'guac-totp-key-confirmed','true'),(64,'guac-totp-key-secret','VDUXBZN2KAUXCCBWUBCCPNGA7NMRUBQW'),(65,'guac-totp-key-confirmed','false'),(65,'guac-totp-key-secret','H3O6TDFQIDMHPJ44VLZIWPGVWMXXS57E'),(66,'guac-totp-key-confirmed','true'),(66,'guac-totp-key-secret','M6LMEPF7FTZCQ4XDJ4GLJBMAVC5J47A6'),(67,'guac-totp-key-confirmed','true'),(67,'guac-totp-key-secret','4CGUEC3SFJLOOZKSGOHVYX2D45CKUIHD'),(68,'guac-totp-key-confirmed','true'),(68,'guac-totp-key-secret','TSIGUZCCC7FAZEBH2H73QNAV7DPXX6BO'),(68,'guac-totp-reset','true'),(69,'guac-totp-key-confirmed','true'),(69,'guac-totp-key-secret','WMAIN2N2FBBGY34ZIQPJUXSAYUM42CYQ'),(69,'guac-totp-reset','true'),(70,'guac-totp-key-confirmed','true'),(70,'guac-totp-key-secret','TYJ7DV3KMBXIJM76GQMPGIIFAXAT73IC'),(70,'guac-totp-reset','true'),(71,'guac-totp-reset','true'),(72,'guac-totp-key-confirmed','true'),(72,'guac-totp-key-secret','HGPPX7YJC65N5BLDHT774UPBN7GVP4OT'),(72,'guac-totp-reset','true');
/*!40000 ALTER TABLE `guacamole_user_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_group`
--

DROP TABLE IF EXISTS `guacamole_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guacamole_user_group` (
  `user_group_id` int NOT NULL AUTO_INCREMENT,
  `entity_id` int NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  UNIQUE KEY `guacamole_user_group_single_entity` (`entity_id`),
  CONSTRAINT `guacamole_user_group_entity` FOREIGN KEY (`entity_id`) REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user_group`
--

LOCK TABLES `guacamole_user_group` WRITE;
/*!40000 ALTER TABLE `guacamole_user_group` DISABLE KEYS */;
INSERT INTO `guacamole_user_group` VALUES (1,15,0),(2,16,0),(3,17,0),(4,76,0);
/*!40000 ALTER TABLE `guacamole_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_group_attribute`
--

DROP TABLE IF EXISTS `guacamole_user_group_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `guacamole_user_group_member` VALUES (1,2),(2,2),(3,2),(4,69);
/*!40000 ALTER TABLE `guacamole_user_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_group_permission`
--

DROP TABLE IF EXISTS `guacamole_user_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `guacamole_user_group_permission` VALUES (2,1,'READ'),(2,1,'UPDATE'),(2,1,'DELETE'),(2,1,'ADMINISTER'),(2,2,'READ'),(2,2,'UPDATE'),(2,2,'DELETE'),(2,2,'ADMINISTER'),(2,3,'READ'),(2,3,'UPDATE'),(2,3,'DELETE'),(2,3,'ADMINISTER'),(69,4,'READ'),(69,4,'UPDATE'),(69,4,'DELETE'),(69,4,'ADMINISTER');
/*!40000 ALTER TABLE `guacamole_user_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_history`
--

DROP TABLE IF EXISTS `guacamole_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guacamole_user_history`
--

LOCK TABLES `guacamole_user_history` WRITE;
/*!40000 ALTER TABLE `guacamole_user_history` DISABLE KEYS */;
INSERT INTO `guacamole_user_history` VALUES (1,53,'ashish_singh','103.177.82.10','2025-06-20 11:08:05',NULL),(2,53,'ashish_singh','103.177.82.10','2025-06-20 11:08:25','2025-06-20 12:09:15'),(3,21,'ashish-mishra','103.197.225.45','2025-06-20 13:15:45',NULL),(4,21,'ashish-mishra','103.197.225.45','2025-06-20 13:16:05','2025-06-20 14:16:15'),(5,61,'bhavna','115.98.233.80','2025-06-21 05:31:08',NULL),(6,61,'bhavna','115.98.233.80','2025-06-21 05:31:17','2025-06-21 08:47:15');
/*!40000 ALTER TABLE `guacamole_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guacamole_user_password_history`
--

DROP TABLE IF EXISTS `guacamole_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `guacamole_user_permission` VALUES (2,2,'READ'),(2,2,'UPDATE'),(2,5,'READ'),(2,5,'UPDATE'),(2,5,'DELETE'),(2,5,'ADMINISTER'),(5,5,'READ'),(5,5,'UPDATE'),(2,8,'READ'),(2,8,'UPDATE'),(2,8,'DELETE'),(2,8,'ADMINISTER'),(8,8,'READ'),(8,8,'UPDATE'),(2,10,'READ'),(2,10,'UPDATE'),(2,10,'DELETE'),(2,10,'ADMINISTER'),(10,10,'READ'),(10,10,'UPDATE'),(2,11,'READ'),(2,11,'UPDATE'),(2,11,'DELETE'),(2,11,'ADMINISTER'),(11,11,'READ'),(11,11,'UPDATE'),(2,15,'READ'),(2,15,'UPDATE'),(2,15,'DELETE'),(2,15,'ADMINISTER'),(18,15,'READ'),(18,15,'UPDATE'),(2,16,'READ'),(2,16,'UPDATE'),(2,16,'DELETE'),(2,16,'ADMINISTER'),(19,16,'READ'),(19,16,'UPDATE'),(2,17,'READ'),(2,17,'UPDATE'),(2,17,'DELETE'),(2,17,'ADMINISTER'),(20,17,'READ'),(20,17,'UPDATE'),(2,18,'READ'),(2,18,'UPDATE'),(2,18,'DELETE'),(2,18,'ADMINISTER'),(21,18,'READ'),(21,18,'UPDATE'),(2,19,'READ'),(2,19,'UPDATE'),(2,19,'DELETE'),(2,19,'ADMINISTER'),(22,19,'READ'),(22,19,'UPDATE'),(2,20,'READ'),(2,20,'UPDATE'),(2,20,'DELETE'),(2,20,'ADMINISTER'),(23,20,'READ'),(23,20,'UPDATE'),(2,21,'READ'),(2,21,'UPDATE'),(2,21,'DELETE'),(2,21,'ADMINISTER'),(24,21,'READ'),(24,21,'UPDATE'),(2,26,'READ'),(2,26,'UPDATE'),(2,26,'DELETE'),(2,26,'ADMINISTER'),(29,26,'READ'),(29,26,'UPDATE'),(2,30,'READ'),(2,30,'UPDATE'),(2,30,'DELETE'),(2,30,'ADMINISTER'),(33,30,'READ'),(2,31,'READ'),(2,31,'UPDATE'),(2,31,'DELETE'),(2,31,'ADMINISTER'),(34,31,'READ'),(34,31,'UPDATE'),(2,37,'READ'),(2,37,'UPDATE'),(2,37,'DELETE'),(2,37,'ADMINISTER'),(40,37,'READ'),(2,39,'READ'),(2,39,'UPDATE'),(2,39,'DELETE'),(2,39,'ADMINISTER'),(42,39,'READ'),(2,40,'READ'),(2,40,'UPDATE'),(2,40,'DELETE'),(2,40,'ADMINISTER'),(43,40,'READ'),(2,46,'READ'),(2,46,'UPDATE'),(2,46,'DELETE'),(2,46,'ADMINISTER'),(49,46,'READ'),(49,46,'UPDATE'),(2,47,'READ'),(2,47,'UPDATE'),(2,47,'DELETE'),(2,47,'ADMINISTER'),(50,47,'READ'),(2,51,'READ'),(2,51,'UPDATE'),(2,51,'DELETE'),(2,51,'ADMINISTER'),(54,51,'READ'),(2,52,'READ'),(2,52,'UPDATE'),(2,52,'DELETE'),(2,52,'ADMINISTER'),(55,52,'READ'),(2,53,'READ'),(2,53,'UPDATE'),(2,53,'DELETE'),(2,53,'ADMINISTER'),(56,53,'READ'),(2,54,'READ'),(2,54,'UPDATE'),(2,54,'DELETE'),(2,54,'ADMINISTER'),(57,54,'READ'),(2,55,'READ'),(2,55,'UPDATE'),(2,55,'DELETE'),(2,55,'ADMINISTER'),(58,55,'READ'),(2,56,'READ'),(2,56,'UPDATE'),(2,56,'DELETE'),(2,56,'ADMINISTER'),(59,56,'READ'),(59,56,'UPDATE'),(2,58,'READ'),(2,58,'UPDATE'),(2,58,'DELETE'),(2,58,'ADMINISTER'),(61,58,'READ'),(2,60,'READ'),(2,60,'UPDATE'),(2,60,'DELETE'),(2,60,'ADMINISTER'),(63,60,'READ'),(64,61,'READ'),(65,62,'READ'),(67,64,'READ'),(68,65,'READ'),(69,66,'READ'),(69,66,'UPDATE'),(69,67,'READ'),(69,67,'UPDATE'),(69,67,'DELETE'),(69,67,'ADMINISTER'),(70,67,'READ'),(69,68,'READ'),(69,68,'UPDATE'),(69,68,'DELETE'),(69,68,'ADMINISTER'),(71,68,'READ'),(69,69,'READ'),(69,69,'UPDATE'),(69,69,'DELETE'),(69,69,'ADMINISTER'),(72,69,'READ'),(69,70,'READ'),(69,70,'UPDATE'),(69,70,'DELETE'),(69,70,'ADMINISTER'),(73,70,'READ'),(69,71,'READ'),(69,71,'UPDATE'),(69,71,'DELETE'),(69,71,'ADMINISTER'),(74,71,'READ'),(69,72,'READ'),(69,72,'UPDATE'),(69,72,'DELETE'),(69,72,'ADMINISTER'),(75,72,'READ');
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

-- Dump completed on 2025-06-22 13:30:03
