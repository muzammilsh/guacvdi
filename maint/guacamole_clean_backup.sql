
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

LOCK TABLES `guacamole_connection` WRITE;
/*!40000 ALTER TABLE `guacamole_connection` DISABLE KEYS */;
INSERT INTO `guacamole_connection` VALUES (2,'guacamole-vdi-1',NULL,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (5,'ubuntu',NULL,'vnc',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (7,'dishant',NULL,'vnc',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (9,'lakshmi',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (11,'debapriyo',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (20,'prem-kori',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (23,'pallavi-solanki',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (28,'sheetal-mohite',NULL,'rdp',NULL,NULL,'NONE',NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (29,'pallavi-pawar',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (30,'suman-singh',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (43,'kesar-pandita-new',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (51,'ashish-mishra-new',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (63,'karthik-nair',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (64,'prem-test',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (67,'ashish_singh',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (74,'bhavna',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (83,'chaitanya',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (86,'shuhaib',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (90,'pooja-more',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (93,'Stebin',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (94,'Cheikh-simuam',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (95,'chetan-kapadia',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (115,'ajit-new',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (117,'harbor-gluster-1',NULL,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (118,'haproxy-pt-1',NULL,'ssh',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (119,'Simpay-Yesbank',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
INSERT INTO `guacamole_connection` VALUES (122,'vivek-macha-new2',NULL,'rdp',NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `guacamole_connection` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_connection_attribute` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_connection_attribute` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_connection_group` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_connection_group` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_connection_group_attribute` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_group_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_connection_group_attribute` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_connection_group_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_group_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_connection_group_permission` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `guacamole_connection_history` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_connection_history` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_connection_parameter` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_parameter` DISABLE KEYS */;
INSERT INTO `guacamole_connection_parameter` VALUES (2,'hostname','10.101.199.21');
INSERT INTO `guacamole_connection_parameter` VALUES (2,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (2,'port','1895');
INSERT INTO `guacamole_connection_parameter` VALUES (2,'private-key','-----BEGIN OPENSSH PRIVATE KEY-----\nb3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn\nNhAAAAAwEAAQAAAQEAqVgfYLwEIzwAvV+VtPqnYV0UJnym9jUGeLky5keUX2mh6kgDK6jG\nQNuXtIY/50m48d6qEKigmV2J1LdhYG+zI/EdxiKAI4fvDH3xaIAE4ClyaW8gOpxsLqrHC8\nWWtt7IlukSlWIcZMY388mVxa1ZSrF230vDD1szCQq4rHgosfy+Gz3KJrky/QwJGwLhQClb\nAraK01eQV0zBhJ0wEnvN9QBQzeRsgFqzPKTB9FaXmAn+xX0dSQAJ+u3R+F3FJxG7+HTWj3\nrkA7pua+RxrYvPsFfeiz4A3i4K6DT/cC2T0j+Y2+5xffk7YtH/IW1/Wjadw+SAn1WynQhG\n1Bt1DkoS/wAAA9DSQa520kGudgAAAAdzc2gtcnNhAAABAQCpWB9gvAQjPAC9X5W0+qdhXR\nQmfKb2NQZ4uTLmR5RfaaHqSAMrqMZA25e0hj/nSbjx3qoQqKCZXYnUt2Fgb7Mj8R3GIoAj\nh+8MffFogATgKXJpbyA6nGwuqscLxZa23siW6RKVYhxkxjfzyZXFrVlKsXbfS8MPWzMJCr\niseCix/L4bPcomuTL9DAkbAuFAKVsCtorTV5BXTMGEnTASe831AFDN5GyAWrM8pMH0VpeY\nCf7FfR1JAAn67dH4XcUnEbv4dNaPeuQDum5r5HGti8+wV96LPgDeLgroNP9wLZPSP5jb7n\nF9+Tti0f8hbX9aNp3D5ICfVbKdCEbUG3UOShL/AAAAAwEAAQAAAQAjSKgpCKO4D617x6my\nrrMnVzR2nGxRSlUR3EydrHZetuy0mtKGS0EbjGV8iKhR8YtmYeV/WRM1QUcRmi/g3wUtTP\nTOLqwSOyV0rd0Zz+q0Jg6fpzbI34Su6IhWjJHNgne68c8cbvfJi39m/S6GpIrBRF6nQerf\njToB/UjjLpoUE2U6+i7oCc4ltIhLKnx9iAwYXRG05N3yZl+QmdgJG03rXbKX18YXov1h/3\nsajQ9coXArSkcZ3UcI+bbOuWywbYY4sKI/ttt6NE8q5ZvgZrtLYxZtkJnmChZnNOGp/QuT\nbOmp83PmwO0MONpZUUCE8juH8mOqxe3MD+kcpkfHXGyZAAAAgB1m93gp65990dWRXuhu+Q\nPlGJ34/wQuwo5lhO4ryKTXnqiQe2oKzQq58QiR0AXPyjBoUglGglX9epcEp0vxjOULdQHe\nEYThtJpE7s0a3IHLvHo2i6aLMBUmCPXK8HHJyh/VvEp65KOGEpJRAs7AGerdiHhBlZtZHX\nLOYXIy6a6xAAAAgQDeCUNLxsz76zzsn8iXntMhmry0IzkiZ5ayLf78D1q0Z3t53LlqASUN\nDuWPo8BwObsJYiw57ynEm2cswqmUKfiKlKlhwdNTiOkcqoCGQzHECcN1TZpUUssDa43TaP\nCqbmbBqnpaw0P3KXYygkrSktW8IVPJH49Dvf/vcmYo0fkpFQAAAIEAwz99fHCFFJoJMRJu\nnnHNIRUqCaUaa6AaNfpVhm2XV1Uro4aUlE8VKLNTrS/LMVRIO1wIkiIXy87pKyw2ku3yPe\nP5vtmreqM0SBPnNsy/QFkpy9w5xzqtnjtUpaDctOM6g7ZQ+iKccsDLPmX2YIwCU+YiMAGh\nHUzTHQJxl37iqMMAAAAVbXV6YW1AREVTS1RPUC1LSjAyVjg5AQIDBAUG\n-----END OPENSSH PRIVATE KEY-----');
INSERT INTO `guacamole_connection_parameter` VALUES (2,'username','ipmcloud');
INSERT INTO `guacamole_connection_parameter` VALUES (5,'hostname','13.234.94.168');
INSERT INTO `guacamole_connection_parameter` VALUES (5,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (5,'port','5901');
INSERT INTO `guacamole_connection_parameter` VALUES (5,'username','ubuntu');
INSERT INTO `guacamole_connection_parameter` VALUES (7,'hostname','13.232.24.36');
INSERT INTO `guacamole_connection_parameter` VALUES (7,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (7,'port','5902');
INSERT INTO `guacamole_connection_parameter` VALUES (7,'username','dishant');
INSERT INTO `guacamole_connection_parameter` VALUES (9,'hostname','10.101.199.21');
INSERT INTO `guacamole_connection_parameter` VALUES (9,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (9,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (9,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (9,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (9,'username','lakshmi');
INSERT INTO `guacamole_connection_parameter` VALUES (11,'hostname','10.101.199.25');
INSERT INTO `guacamole_connection_parameter` VALUES (11,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (11,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (11,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (11,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (11,'username','debapriyo');
INSERT INTO `guacamole_connection_parameter` VALUES (20,'hostname','10.101.199.22');
INSERT INTO `guacamole_connection_parameter` VALUES (20,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (20,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (20,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (20,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (20,'username','prem-kori');
INSERT INTO `guacamole_connection_parameter` VALUES (23,'hostname','10.101.199.24');
INSERT INTO `guacamole_connection_parameter` VALUES (23,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (23,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (23,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (23,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (23,'username','pallavi-solanki');
INSERT INTO `guacamole_connection_parameter` VALUES (28,'hostname','10.101.199.24');
INSERT INTO `guacamole_connection_parameter` VALUES (28,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (28,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (28,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (28,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (28,'username','sheetal-mohite');
INSERT INTO `guacamole_connection_parameter` VALUES (29,'hostname','10.101.199.22');
INSERT INTO `guacamole_connection_parameter` VALUES (29,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (29,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (29,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (29,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (29,'username','pallavi-pawar');
INSERT INTO `guacamole_connection_parameter` VALUES (30,'hostname','10.101.199.25');
INSERT INTO `guacamole_connection_parameter` VALUES (30,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (30,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (30,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (30,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (30,'username','suman-singh');
INSERT INTO `guacamole_connection_parameter` VALUES (43,'hostname','10.101.199.22');
INSERT INTO `guacamole_connection_parameter` VALUES (43,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (43,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (43,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (43,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (43,'username','kesar-pandita');
INSERT INTO `guacamole_connection_parameter` VALUES (51,'hostname','10.101.199.22');
INSERT INTO `guacamole_connection_parameter` VALUES (51,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (51,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (51,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (51,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (51,'username','ashish-mishra');
INSERT INTO `guacamole_connection_parameter` VALUES (63,'hostname','10.101.199.21');
INSERT INTO `guacamole_connection_parameter` VALUES (63,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (63,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (63,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (63,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (63,'username','karthik-nair');
INSERT INTO `guacamole_connection_parameter` VALUES (64,'hostname','10.101.199.22');
INSERT INTO `guacamole_connection_parameter` VALUES (64,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (64,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (64,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (64,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (64,'username','prem-test');
INSERT INTO `guacamole_connection_parameter` VALUES (67,'hostname','10.101.199.24');
INSERT INTO `guacamole_connection_parameter` VALUES (67,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (67,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (67,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (67,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (67,'username','ashish_singh');
INSERT INTO `guacamole_connection_parameter` VALUES (74,'hostname','10.101.199.24');
INSERT INTO `guacamole_connection_parameter` VALUES (74,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (74,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (74,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (74,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (74,'username','bhavna');
INSERT INTO `guacamole_connection_parameter` VALUES (83,'hostname','10.101.199.21');
INSERT INTO `guacamole_connection_parameter` VALUES (83,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (83,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (83,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (83,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (83,'username','chaitanya');
INSERT INTO `guacamole_connection_parameter` VALUES (86,'hostname','10.101.199.25');
INSERT INTO `guacamole_connection_parameter` VALUES (86,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (86,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (86,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (86,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (86,'username','shuhaib');
INSERT INTO `guacamole_connection_parameter` VALUES (90,'hostname','10.101.199.23');
INSERT INTO `guacamole_connection_parameter` VALUES (90,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (90,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (90,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (90,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (90,'username','pooja-more');
INSERT INTO `guacamole_connection_parameter` VALUES (93,'hostname','10.101.199.25');
INSERT INTO `guacamole_connection_parameter` VALUES (93,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (93,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (93,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (93,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (93,'username','stebin');
INSERT INTO `guacamole_connection_parameter` VALUES (94,'hostname','10.101.199.21');
INSERT INTO `guacamole_connection_parameter` VALUES (94,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (94,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (94,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (94,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (94,'username','cheikh-simuam');
INSERT INTO `guacamole_connection_parameter` VALUES (95,'color-depth','16');
INSERT INTO `guacamole_connection_parameter` VALUES (95,'hostname','10.101.199.23');
INSERT INTO `guacamole_connection_parameter` VALUES (95,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (95,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (95,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (95,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (95,'username','chetan-kapadia');
INSERT INTO `guacamole_connection_parameter` VALUES (115,'hostname','10.101.199.23');
INSERT INTO `guacamole_connection_parameter` VALUES (115,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (115,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (115,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (115,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (115,'username','ajit');
INSERT INTO `guacamole_connection_parameter` VALUES (117,'hostname','10.101.180.72');
INSERT INTO `guacamole_connection_parameter` VALUES (117,'port','1895');
INSERT INTO `guacamole_connection_parameter` VALUES (117,'private-key','-----BEGIN OPENSSH PRIVATE KEY-----\nb3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn\nNhAAAAAwEAAQAAAQEAqVgfYLwEIzwAvV+VtPqnYV0UJnym9jUGeLky5keUX2mh6kgDK6jG\nQNuXtIY/50m48d6qEKigmV2J1LdhYG+zI/EdxiKAI4fvDH3xaIAE4ClyaW8gOpxsLqrHC8\nWWtt7IlukSlWIcZMY388mVxa1ZSrF230vDD1szCQq4rHgosfy+Gz3KJrky/QwJGwLhQClb\nAraK01eQV0zBhJ0wEnvN9QBQzeRsgFqzPKTB9FaXmAn+xX0dSQAJ+u3R+F3FJxG7+HTWj3\nrkA7pua+RxrYvPsFfeiz4A3i4K6DT/cC2T0j+Y2+5xffk7YtH/IW1/Wjadw+SAn1WynQhG\n1Bt1DkoS/wAAA9DSQa520kGudgAAAAdzc2gtcnNhAAABAQCpWB9gvAQjPAC9X5W0+qdhXR\nQmfKb2NQZ4uTLmR5RfaaHqSAMrqMZA25e0hj/nSbjx3qoQqKCZXYnUt2Fgb7Mj8R3GIoAj\nh+8MffFogATgKXJpbyA6nGwuqscLxZa23siW6RKVYhxkxjfzyZXFrVlKsXbfS8MPWzMJCr\niseCix/L4bPcomuTL9DAkbAuFAKVsCtorTV5BXTMGEnTASe831AFDN5GyAWrM8pMH0VpeY\nCf7FfR1JAAn67dH4XcUnEbv4dNaPeuQDum5r5HGti8+wV96LPgDeLgroNP9wLZPSP5jb7n\nF9+Tti0f8hbX9aNp3D5ICfVbKdCEbUG3UOShL/AAAAAwEAAQAAAQAjSKgpCKO4D617x6my\nrrMnVzR2nGxRSlUR3EydrHZetuy0mtKGS0EbjGV8iKhR8YtmYeV/WRM1QUcRmi/g3wUtTP\nTOLqwSOyV0rd0Zz+q0Jg6fpzbI34Su6IhWjJHNgne68c8cbvfJi39m/S6GpIrBRF6nQerf\njToB/UjjLpoUE2U6+i7oCc4ltIhLKnx9iAwYXRG05N3yZl+QmdgJG03rXbKX18YXov1h/3\nsajQ9coXArSkcZ3UcI+bbOuWywbYY4sKI/ttt6NE8q5ZvgZrtLYxZtkJnmChZnNOGp/QuT\nbOmp83PmwO0MONpZUUCE8juH8mOqxe3MD+kcpkfHXGyZAAAAgB1m93gp65990dWRXuhu+Q\nPlGJ34/wQuwo5lhO4ryKTXnqiQe2oKzQq58QiR0AXPyjBoUglGglX9epcEp0vxjOULdQHe\nEYThtJpE7s0a3IHLvHo2i6aLMBUmCPXK8HHJyh/VvEp65KOGEpJRAs7AGerdiHhBlZtZHX\nLOYXIy6a6xAAAAgQDeCUNLxsz76zzsn8iXntMhmry0IzkiZ5ayLf78D1q0Z3t53LlqASUN\nDuWPo8BwObsJYiw57ynEm2cswqmUKfiKlKlhwdNTiOkcqoCGQzHECcN1TZpUUssDa43TaP\nCqbmbBqnpaw0P3KXYygkrSktW8IVPJH49Dvf/vcmYo0fkpFQAAAIEAwz99fHCFFJoJMRJu\nnnHNIRUqCaUaa6AaNfpVhm2XV1Uro4aUlE8VKLNTrS/LMVRIO1wIkiIXy87pKyw2ku3yPe\nP5vtmreqM0SBPnNsy/QFkpy9w5xzqtnjtUpaDctOM6g7ZQ+iKccsDLPmX2YIwCU+YiMAGh\nHUzTHQJxl37iqMMAAAAVbXV6YW1AREVTS1RPUC1LSjAyVjg5AQIDBAUG\n-----END OPENSSH PRIVATE KEY-----');
INSERT INTO `guacamole_connection_parameter` VALUES (117,'username','ipmcloud');
INSERT INTO `guacamole_connection_parameter` VALUES (118,'hostname','10.101.180.68');
INSERT INTO `guacamole_connection_parameter` VALUES (118,'port','1895');
INSERT INTO `guacamole_connection_parameter` VALUES (118,'private-key','-----BEGIN OPENSSH PRIVATE KEY-----\nb3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn\nNhAAAAAwEAAQAAAQEAqVgfYLwEIzwAvV+VtPqnYV0UJnym9jUGeLky5keUX2mh6kgDK6jG\nQNuXtIY/50m48d6qEKigmV2J1LdhYG+zI/EdxiKAI4fvDH3xaIAE4ClyaW8gOpxsLqrHC8\nWWtt7IlukSlWIcZMY388mVxa1ZSrF230vDD1szCQq4rHgosfy+Gz3KJrky/QwJGwLhQClb\nAraK01eQV0zBhJ0wEnvN9QBQzeRsgFqzPKTB9FaXmAn+xX0dSQAJ+u3R+F3FJxG7+HTWj3\nrkA7pua+RxrYvPsFfeiz4A3i4K6DT/cC2T0j+Y2+5xffk7YtH/IW1/Wjadw+SAn1WynQhG\n1Bt1DkoS/wAAA9DSQa520kGudgAAAAdzc2gtcnNhAAABAQCpWB9gvAQjPAC9X5W0+qdhXR\nQmfKb2NQZ4uTLmR5RfaaHqSAMrqMZA25e0hj/nSbjx3qoQqKCZXYnUt2Fgb7Mj8R3GIoAj\nh+8MffFogATgKXJpbyA6nGwuqscLxZa23siW6RKVYhxkxjfzyZXFrVlKsXbfS8MPWzMJCr\niseCix/L4bPcomuTL9DAkbAuFAKVsCtorTV5BXTMGEnTASe831AFDN5GyAWrM8pMH0VpeY\nCf7FfR1JAAn67dH4XcUnEbv4dNaPeuQDum5r5HGti8+wV96LPgDeLgroNP9wLZPSP5jb7n\nF9+Tti0f8hbX9aNp3D5ICfVbKdCEbUG3UOShL/AAAAAwEAAQAAAQAjSKgpCKO4D617x6my\nrrMnVzR2nGxRSlUR3EydrHZetuy0mtKGS0EbjGV8iKhR8YtmYeV/WRM1QUcRmi/g3wUtTP\nTOLqwSOyV0rd0Zz+q0Jg6fpzbI34Su6IhWjJHNgne68c8cbvfJi39m/S6GpIrBRF6nQerf\njToB/UjjLpoUE2U6+i7oCc4ltIhLKnx9iAwYXRG05N3yZl+QmdgJG03rXbKX18YXov1h/3\nsajQ9coXArSkcZ3UcI+bbOuWywbYY4sKI/ttt6NE8q5ZvgZrtLYxZtkJnmChZnNOGp/QuT\nbOmp83PmwO0MONpZUUCE8juH8mOqxe3MD+kcpkfHXGyZAAAAgB1m93gp65990dWRXuhu+Q\nPlGJ34/wQuwo5lhO4ryKTXnqiQe2oKzQq58QiR0AXPyjBoUglGglX9epcEp0vxjOULdQHe\nEYThtJpE7s0a3IHLvHo2i6aLMBUmCPXK8HHJyh/VvEp65KOGEpJRAs7AGerdiHhBlZtZHX\nLOYXIy6a6xAAAAgQDeCUNLxsz76zzsn8iXntMhmry0IzkiZ5ayLf78D1q0Z3t53LlqASUN\nDuWPo8BwObsJYiw57ynEm2cswqmUKfiKlKlhwdNTiOkcqoCGQzHECcN1TZpUUssDa43TaP\nCqbmbBqnpaw0P3KXYygkrSktW8IVPJH49Dvf/vcmYo0fkpFQAAAIEAwz99fHCFFJoJMRJu\nnnHNIRUqCaUaa6AaNfpVhm2XV1Uro4aUlE8VKLNTrS/LMVRIO1wIkiIXy87pKyw2ku3yPe\nP5vtmreqM0SBPnNsy/QFkpy9w5xzqtnjtUpaDctOM6g7ZQ+iKccsDLPmX2YIwCU+YiMAGh\nHUzTHQJxl37iqMMAAAAVbXV6YW1AREVTS1RPUC1LSjAyVjg5AQIDBAUG\n-----END OPENSSH PRIVATE KEY-----');
INSERT INTO `guacamole_connection_parameter` VALUES (118,'username','ipmcloud');
INSERT INTO `guacamole_connection_parameter` VALUES (119,'hostname','13.201.84.75');
INSERT INTO `guacamole_connection_parameter` VALUES (119,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (119,'password','0@UC-zF!Fl0)kq%7mdh?mHoTLkjlBtCK');
INSERT INTO `guacamole_connection_parameter` VALUES (119,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (119,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (119,'username','Administrator');
INSERT INTO `guacamole_connection_parameter` VALUES (122,'hostname','10.101.199.21');
INSERT INTO `guacamole_connection_parameter` VALUES (122,'ignore-cert','true');
INSERT INTO `guacamole_connection_parameter` VALUES (122,'password','TYGYMWQ2yeNx');
INSERT INTO `guacamole_connection_parameter` VALUES (122,'port','3389');
INSERT INTO `guacamole_connection_parameter` VALUES (122,'security','any');
INSERT INTO `guacamole_connection_parameter` VALUES (122,'username','vivek-macha');
/*!40000 ALTER TABLE `guacamole_connection_parameter` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_connection_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_connection_permission` DISABLE KEYS */;
INSERT INTO `guacamole_connection_permission` VALUES (2,2,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (20,2,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (24,2,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,5,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,5,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,5,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,5,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (2,7,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,7,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,7,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,7,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (5,7,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (17,7,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,9,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,9,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,9,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,9,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (17,9,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (19,9,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,11,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,11,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,11,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,11,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (10,11,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (16,11,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (20,11,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (67,11,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,20,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,20,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,20,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,20,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (20,20,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (24,20,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,23,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,23,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,23,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,23,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (10,23,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (23,23,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (29,23,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,28,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,28,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,28,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,28,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (29,28,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,29,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,29,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,29,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,29,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (33,29,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,30,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,30,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,30,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,30,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (34,30,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,43,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,43,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,43,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,43,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (22,43,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,51,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,51,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,51,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,51,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (24,51,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,63,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,63,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,63,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,63,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (23,63,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (55,63,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,64,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,64,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,64,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,64,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (20,64,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (21,64,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (24,64,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (33,64,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (67,64,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,67,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,67,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,67,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,67,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (23,67,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (56,67,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (64,74,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (20,83,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (58,83,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,83,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (10,86,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,86,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,86,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (69,86,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (69,86,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (70,86,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,90,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,90,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (69,90,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (69,90,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (72,90,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (10,93,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,93,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,93,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (69,93,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (69,93,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (73,93,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (67,94,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,94,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,94,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (69,94,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (69,94,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (74,94,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (59,95,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,95,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,95,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (69,95,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (69,95,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (69,115,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,115,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (69,115,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (69,115,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (2,117,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,117,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,117,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,117,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (2,118,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (2,118,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (2,118,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (2,118,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (20,119,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (24,119,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,119,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,119,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (69,119,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (69,119,'ADMINISTER');
INSERT INTO `guacamole_connection_permission` VALUES (58,122,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,122,'READ');
INSERT INTO `guacamole_connection_permission` VALUES (69,122,'UPDATE');
INSERT INTO `guacamole_connection_permission` VALUES (69,122,'DELETE');
INSERT INTO `guacamole_connection_permission` VALUES (69,122,'ADMINISTER');
/*!40000 ALTER TABLE `guacamole_connection_permission` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_entity` WRITE;
/*!40000 ALTER TABLE `guacamole_entity` DISABLE KEYS */;
INSERT INTO `guacamole_entity` VALUES (18,'ajit','USER');
INSERT INTO `guacamole_entity` VALUES (71,'amey','USER');
INSERT INTO `guacamole_entity` VALUES (8,'anirudh','USER');
INSERT INTO `guacamole_entity` VALUES (24,'ashish-mishra','USER');
INSERT INTO `guacamole_entity` VALUES (56,'ashish_singh','USER');
INSERT INTO `guacamole_entity` VALUES (64,'bhavna','USER');
INSERT INTO `guacamole_entity` VALUES (69,'chaitanya','USER');
INSERT INTO `guacamole_entity` VALUES (67,'Cheikh','USER');
INSERT INTO `guacamole_entity` VALUES (74,'cheikh-simuam','USER');
INSERT INTO `guacamole_entity` VALUES (59,'chetan-kapadia','USER');
INSERT INTO `guacamole_entity` VALUES (10,'debapriyo','USER');
INSERT INTO `guacamole_entity` VALUES (65,'deepak','USER');
INSERT INTO `guacamole_entity` VALUES (75,'devesh','USER');
INSERT INTO `guacamole_entity` VALUES (5,'dishant@simsol.in','USER');
INSERT INTO `guacamole_entity` VALUES (40,'elango','USER');
INSERT INTO `guacamole_entity` VALUES (54,'james-durai','USER');
INSERT INTO `guacamole_entity` VALUES (42,'junaid-khan','USER');
INSERT INTO `guacamole_entity` VALUES (43,'kailash','USER');
INSERT INTO `guacamole_entity` VALUES (55,'karthik-nair','USER');
INSERT INTO `guacamole_entity` VALUES (22,'kesar-pandita','USER');
INSERT INTO `guacamole_entity` VALUES (49,'kristoff','USER');
INSERT INTO `guacamole_entity` VALUES (19,'lakshmi@simsol.in','USER');
INSERT INTO `guacamole_entity` VALUES (50,'leslie','USER');
INSERT INTO `guacamole_entity` VALUES (11,'medha','USER');
INSERT INTO `guacamole_entity` VALUES (33,'pallavi-pawar','USER');
INSERT INTO `guacamole_entity` VALUES (23,'pallavi-solanki','USER');
INSERT INTO `guacamole_entity` VALUES (72,'pooja-more','USER');
INSERT INTO `guacamole_entity` VALUES (21,'prashant-thorat','USER');
INSERT INTO `guacamole_entity` VALUES (20,'prem-kori','USER');
INSERT INTO `guacamole_entity` VALUES (68,'Salaton','USER');
INSERT INTO `guacamole_entity` VALUES (57,'sanjose_mary','USER');
INSERT INTO `guacamole_entity` VALUES (29,'sheetal-mohite','USER');
INSERT INTO `guacamole_entity` VALUES (70,'shuhaib','USER');
INSERT INTO `guacamole_entity` VALUES (63,'simuam','USER');
INSERT INTO `guacamole_entity` VALUES (73,'Stebin-Sabu','USER');
INSERT INTO `guacamole_entity` VALUES (34,'suman-singh','USER');
INSERT INTO `guacamole_entity` VALUES (61,'vishwajit-ln','USER');
INSERT INTO `guacamole_entity` VALUES (58,'vivek-macha','USER');
INSERT INTO `guacamole_entity` VALUES (2,'zygot','USER');
INSERT INTO `guacamole_entity` VALUES (76,'Docker Swarm','USER_GROUP');
INSERT INTO `guacamole_entity` VALUES (16,'i1-LIVEDESK-interns','USER_GROUP');
INSERT INTO `guacamole_entity` VALUES (15,'i2-LIVEDESK-Kailash','USER_GROUP');
INSERT INTO `guacamole_entity` VALUES (17,'LIVEDESK','USER_GROUP');
/*!40000 ALTER TABLE `guacamole_entity` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_sharing_profile` WRITE;
/*!40000 ALTER TABLE `guacamole_sharing_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_sharing_profile` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_sharing_profile_attribute` WRITE;
/*!40000 ALTER TABLE `guacamole_sharing_profile_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_sharing_profile_attribute` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_sharing_profile_parameter` WRITE;
/*!40000 ALTER TABLE `guacamole_sharing_profile_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_sharing_profile_parameter` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_sharing_profile_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_sharing_profile_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_sharing_profile_permission` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_system_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_system_permission` DISABLE KEYS */;
INSERT INTO `guacamole_system_permission` VALUES (2,'CREATE_CONNECTION');
INSERT INTO `guacamole_system_permission` VALUES (2,'CREATE_CONNECTION_GROUP');
INSERT INTO `guacamole_system_permission` VALUES (2,'CREATE_SHARING_PROFILE');
INSERT INTO `guacamole_system_permission` VALUES (2,'CREATE_USER');
INSERT INTO `guacamole_system_permission` VALUES (2,'CREATE_USER_GROUP');
INSERT INTO `guacamole_system_permission` VALUES (2,'ADMINISTER');
INSERT INTO `guacamole_system_permission` VALUES (18,'ADMINISTER');
INSERT INTO `guacamole_system_permission` VALUES (49,'ADMINISTER');
INSERT INTO `guacamole_system_permission` VALUES (65,'ADMINISTER');
INSERT INTO `guacamole_system_permission` VALUES (69,'CREATE_CONNECTION');
INSERT INTO `guacamole_system_permission` VALUES (69,'CREATE_CONNECTION_GROUP');
INSERT INTO `guacamole_system_permission` VALUES (69,'CREATE_SHARING_PROFILE');
INSERT INTO `guacamole_system_permission` VALUES (69,'CREATE_USER');
INSERT INTO `guacamole_system_permission` VALUES (69,'CREATE_USER_GROUP');
INSERT INTO `guacamole_system_permission` VALUES (69,'ADMINISTER');
/*!40000 ALTER TABLE `guacamole_system_permission` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_user` WRITE;
/*!40000 ALTER TABLE `guacamole_user` DISABLE KEYS */;
INSERT INTO `guacamole_user` VALUES (2,2,_binary 'þq_\nH“\å(Î€/¦«\Îh\à\ïV\Øl\Õ*š!\ó\"\Ù~',_binary '\Û€3\Z› \òu]SZ¨¤;s\æœu¸ÛªË Mùªroh','2021-10-09 21:37:10',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (5,5,_binary 'º^¢[‘ND.¤Ï†\á€\ZRšH{#F0s]%£Q[#M\0I',_binary '™Z\'˜2å®¹6³›‡\÷$\ó	\ä]m\èP|µZÙ±¦\ØPN','2021-10-09 00:00:00',0,1,NULL,NULL,NULL,NULL,NULL,'Dishant',NULL,'Simsol','Tester');
INSERT INTO `guacamole_user` VALUES (8,8,_binary '\è\Øu´/Á\ß\Ý †\r¥Î±”hÛ¤-¹>°$U£Þ³',_binary 'œ]¥\ÔO\ÙÁ\Ú\òÛªVûa²Bk1¼\Ù\n¬{\õ¤\ñ','2021-10-11 09:32:10',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (10,10,_binary '\0)-þÑ¥k\ß\ôd_\ÊMº\î\ãF6©g¯²\ZW?>RXT',_binary 'ÀªE\î\Ï!-¯I\ËÏ\Çs@\â¦ü’¸@¬\Í#¸\é0½2gq','2021-10-11 09:30:51',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (11,11,_binary '\à\ó¿C´\Ý>x\ß7§þ\Æx£\ç\Ì\ò\É²“Š\0‰#§R¼\æ3z',_binary '5Ì²{l\ñ){`­:W±\Æn¹A\Ô\Ôe$\Í\ô\æ¹\Õ\ßi;¶','2022-02-10 06:14:24',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (15,18,_binary 'NM /\é\ö[g“\à_®\à¿úB/{\\¢\ö\\R&\Â37Ádm',_binary ',‹W‚\ñdÿ9}-Î½­jºt«\"Á\n¦p°Me7\0\ò','2025-03-31 10:05:35',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (16,19,_binary '´?\ö\çÏˆ›\ÙÊš“Œ”·xC\"\Ëø\Ær¶£c¡Àv^\ò˜Wý',_binary '\Ì\â­}ª\æ6­G­££.\ã\Ú\á¾©W\n#\ó°^%k\'','2021-10-20 07:19:15',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (17,20,_binary 'iÜ¦&”‘X‰µ»\Ë9[„Z¯#•S;ŸÒ–€\Ã<9¾¯',_binary '\ÒYQƒø„\ó4\ê\Ê´”Ô”¶DŒ\ò&KbŽ®\Û`/8\ölX','2023-09-06 07:59:08',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (18,21,_binary '\à\ôzÛ·J\0$¹½hB?\Ý\è’H\Ê\í®)Q©¦‘=ß›n\Ä',_binary 'c\Â \\\ÓF]\Ã‰¤Z|9\\¾l\Zûx½ù«` \à','2021-10-11 03:29:06',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (19,22,_binary 'Ð½µï„š9\å\Ì:R*û?\ìe9KY_\î#\0\ÏX\æ\ïŸ',_binary '‰\nO@‰+\åýÇˆ\Z\Æ\öœs\ë€^}S t£tJ¶','2021-10-11 04:40:05',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (20,23,_binary '\"h†.\Únƒ5R7i3R€\Ö!µ¨\É\æ\ÞGþÑ¯\Ök\Û',_binary 'GIÜ•9‘c\òh7z\Í^an¬\ó¥µL\ÉZ5—ƒ§–8*','2021-10-10 10:32:28',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (21,24,_binary '¨$;\ì_4\ãÀ\Äå»\ÒÞ–74\á\ë\óÅ¥›\"<',_binary '\è\Î\èË»Ý‚zw\\Wu+=—?ŸW¸\Ø\ó6\ã\ÒÓ½¶S\0u\ö#','2021-10-11 05:29:49',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (26,29,_binary '³\ê\ÆyR\Ë\ó€\õ‚	 `1…\Ää˜h\\\ô’|r<\Þªz',_binary 'D	ž¢Jž“yÛƒ\ØM¤€k\õ\õ\æ—\ZW\îU\ÐR`$','2021-10-11 04:53:16',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (30,33,_binary '\ì\ÇWF<*WE”Ö¨-\ÉPm¤u\ÛO\Ù;ŠŠYE¯­u•\ß',_binary '<\ì.¿\Þ\0\Êt\Û\Ü©\ÚTž\è\ß¾—•‹Œ\Í>\r','2025-06-27 06:40:32',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (31,34,_binary '\ÞA;¹™*»\ÕB‡£×ª%¤<\Z\óm.\ãe1ü8zY^Ef',_binary 'û\î24\Ñ\è/d\Öy;±Œ{ŽÏ4W\ná…”Q\\û…\ê','2021-10-20 08:54:38',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (37,40,_binary '\\dù\ñ\ã\È\Ôu2\0¼\õ2\óB5”\'€º•.z¾_\éÐ±',_binary 'm¸È©tS4„Cm$§©Žœ]!„Gr¬&œ\ö\èB\ìSIp','2021-10-10 04:55:55',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (39,42,_binary 'º^¢[‘ND.¤Ï†\á€\ZRšH{#F0s]%£Q[#M\0I',_binary '™Z\'˜2å®¹6³›‡\÷$\ó	\ä]m\èP|µZÙ±¦\ØPN','2021-10-09 00:00:00',0,1,NULL,NULL,NULL,NULL,NULL,'Junaid Khan',NULL,'Simsol','Dev');
INSERT INTO `guacamole_user` VALUES (40,43,_binary '\ïe\ç¿\ÖclX±VTv/šç»–\î²g!1¬\÷ý)0M',_binary '·\n¶½»n0H‰S™ù-±ŠµªÁ\î‰/±½\Ý	©žƒ','2021-10-12 08:18:01',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (46,49,_binary 'HJùCæ›¦\ãI¢\ö\á\ã\à€\ôt(Yr\ç2\ð\ì',_binary '\Å[‹\Ø;¢¿\à[\"DGºP†¤\×\Ö\è\Æ\Ä³d\Z\ò!\ô','2022-06-13 09:47:54',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (47,50,_binary '\ìý%ØºÍ¥©\éÓ¶V&ÀW¥“|–\éÁ—Ò¸6ª\Ñ!!&\èe',_binary 'Ê²^(\å¬ú–\òÍ¿X”Ò¼\Ã.E©¦†CÀ\Ö&\0¬ý','2022-11-01 10:49:32',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (51,54,_binary 'Ó ý\òÁ=€\õ\åwK\æ«SqP´q’®\ê\nE—\Ù.',_binary 'n³‡ƒü\ÔÑˆ=—v&}£[•†‘\Z\ÈE	«ú`8K\Ñt\Õ','2022-02-17 05:41:43',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (52,55,_binary 'ƒ?¹+f†,3\ÈP_£SÁ6\í-\ðAšl°šPt\Õ',_binary '\æE\ì\È‘©8 C*Ê¡V\æø.€\0¦\ÖÚ³U\ö“J\Ó6','2022-04-01 10:39:27',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (53,56,_binary 'ùYS\r\óQ\ò’&\à»/\é\Ù0cGC|À\Ê^=\å)\ë\ö\Æc\ñ',_binary '›ýl\"\é,s2t1\Ëv\ð¢’ùþ>À´\ë\à\ïýJŽ\"&','2022-05-26 07:14:33',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (54,57,_binary '\ïœ\ð\ét§W¹3[¥f#4\ñ\äü½,r\"M\Æ\ínR7k',_binary 'H-E\íž—`ˆkýƒ\Ì\ÄL\ÂY‹\Äm\ã•{ë²¹\Ó\ß','2022-05-30 11:18:04',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (55,58,_binary 'IŒP\ì\"j7\ß^ÿC²\ò9ªÛV™È­û,zÖ­\ÐÜ·±',_binary '*£\å\Õ+VY*Ky›½\Þ\ê\Ø3ù\Ün(3¨\òù=©\Äo','2022-08-09 08:37:37',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (56,59,_binary 'u9“R_ ·t\\\àŒ\Â\ñP°5¶Ô¬kÚš}ª9ü',_binary '¬ kEiC\"WÿTohLÂ¥ø\nYMB\ò\Ê\çFL\Ô\×S','2023-05-13 05:59:19',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (58,61,_binary '’&œŸ]h9ûžubü…\ÍL¹Z=‰YT¦hA[3e,',_binary 'b‰„©9\ã\0Ÿ¾þ\Ä+\Ö\Ü\ÐV,)Uú(\ð|r¬rE”','2023-03-20 06:04:31',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (60,63,_binary '£™9‚ˆ#¤\n\0¿\n]\ÒC\ñ#¨•UÀ\Ø=xŽ\n±»Z',_binary 'V\Û0i0±\ì<\ÍÑ´\ê”p\÷\Î~g–ŠF%!x\óg','2022-09-22 07:04:24',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (61,64,_binary '‘\ö.†’Ÿ„‹»\ìüt\ßÂŒø\Ôg¾(¼¸s\ÑV‘©',_binary '\ã=#IØš\Ív*\"8}­¿(ú\ï\ÍÕ¹¨9©f\è&6J\×','2022-09-29 13:25:49',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (62,65,_binary '\Þ7qQ\\µ\â.N_)!:®Ñ\rk\ô‡¹`]^@,³Yú',_binary '\Z\æccÓ0\è)•^¿!!—lB\÷6ù	ûK°rt¬\\','2022-12-20 11:06:25',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (64,67,_binary '[p¥\ÆD@t©´Ô‰s\Üæ£¬©E2h¼]\×ú\Ó',_binary 'œ}Z(0sN\Ø\0¬¢±T,\õ~C0\0~\ö“\å\Þr¹\åÛ‰','2023-09-15 13:44:49',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (65,68,_binary '\Ñ?CZš¶Np~Ÿm\æ\ì‚\õxÁJø\ï\ç\ñ\Ó\ç\â\Ò\ñ\Ç',_binary '!\ç.æ³„\éL\ó7G\å—%„-B‘´0“\æ1rÅ’ªV','2023-02-21 12:33:23',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (66,69,_binary '„®¡\ô\Øÿ}0Ð›\rW\è:‰±	`\íüÿ\Ñ\ñn¸(',_binary '’1þbJ•\æ\Ô\Ø\rGl\È±*IlX=\Ñ\Æb6:wl.T¦','2023-04-20 10:05:07',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (67,70,_binary 't\Ç5\Z\Ñ\ó\\Ö¬\ô±E\ÐY\éÁtx@©P\ç\Ê\'±O8]',_binary '\àlGž‰\ñ\ã/4GA~c‘…iO¾…\áŠÿm×¼R¼\ï','2023-05-01 05:53:40',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (68,71,_binary '°(L\â·:·a¥\n²x\n\×Mr\Ò!¼NQ‰\0 v>ÁU',_binary '<¤(\á^‡,µU\ëE)±\ê%\ö˜\æt‚;‰Aý€ý‚“','2023-05-29 06:06:32',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (69,72,_binary 'F\Ç0Es¯Û°\ïÍ£y\î¡P…68\ÎT—\îÒ›2EEn\Ü\\þ',_binary '=¹7\÷\Þ[#/”ZˆB€GPZP\ÓÀ¯\áÙ±^\Ûb*$\Å','2023-05-31 07:44:53',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (70,73,_binary 'Ü‰a™‡\ög™Y\Í[Å’¿\rZiI\åyv‚\Üÿù\ã&',_binary 's*\ìC\0A²²D´$]¤³\ó¥Í»|ß°‡B\åÀ\Â{k','2023-09-05 06:17:08',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (71,74,_binary 'n®Y](mG\'»\çQ=X\åF_Ä™Ü³=¯¹¼\Â\å\Ýü',_binary 'ª,{J_’K \×\ß7\ÈÛ»¢\ßKi_	rtÄ­TG§\'µú','2023-09-15 12:50:31',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `guacamole_user` VALUES (72,75,_binary 'ˆt\ßY\ê¹{²{»\Ó\ð~\á\ç\'\Û×ªzƒyN~i™¡',_binary '\ô¿\ïn	`døf\â] SŒuB\Ö\ã-„\Ý\ö™ »“\â–Ž','2024-01-17 09:32:52',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `guacamole_user` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_user_attribute` WRITE;
/*!40000 ALTER TABLE `guacamole_user_attribute` DISABLE KEYS */;
INSERT INTO `guacamole_user_attribute` VALUES (2,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (2,'guac-totp-key-secret','EJ23M7BOYWL7JRC3Z7ISZNYJGMFCEHLP');
INSERT INTO `guacamole_user_attribute` VALUES (8,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (8,'guac-totp-key-secret','RGFLBYPGE34QMLOQMPRSUJTADRAC4EEN');
INSERT INTO `guacamole_user_attribute` VALUES (10,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (10,'guac-totp-key-secret','KKANOUZFIDNVCLFP3DKBTONOL7D7WZHX');
INSERT INTO `guacamole_user_attribute` VALUES (11,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (11,'guac-totp-key-secret','F45UYCKRMOJKQKHCWKROTD4CENVJELGK');
INSERT INTO `guacamole_user_attribute` VALUES (15,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (15,'guac-totp-key-secret','FNLIBQJPFRXOYMYAQC4ZBDS2H3IUQLST');
INSERT INTO `guacamole_user_attribute` VALUES (16,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (16,'guac-totp-key-secret','F4NAD3B4XQE7M5XIWQ7KPORCQRCURBRF');
INSERT INTO `guacamole_user_attribute` VALUES (17,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (17,'guac-totp-key-secret','NVLRWUL6CV3TVBDQDN6ZKNIQFOB4ZQLU');
INSERT INTO `guacamole_user_attribute` VALUES (18,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (18,'guac-totp-key-secret','25XKOL3ZSERA6J6G7CRAFZ4THQT4UXP6');
INSERT INTO `guacamole_user_attribute` VALUES (19,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (19,'guac-totp-key-secret','HQCDNZRF6SW53K2H43V6ER2C2GKZ6KZC');
INSERT INTO `guacamole_user_attribute` VALUES (20,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (20,'guac-totp-key-secret','326OPO5GSOT73553N6FJJC4T4RCDTPSB');
INSERT INTO `guacamole_user_attribute` VALUES (21,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (21,'guac-totp-key-secret','MZJYKGQMXSUNRCFMY7G5PRG5YVCNBU5L');
INSERT INTO `guacamole_user_attribute` VALUES (26,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (26,'guac-totp-key-secret','MTOIN5OV6MSUYOLKNLAWSMHEWBNHESH4');
INSERT INTO `guacamole_user_attribute` VALUES (30,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (30,'guac-totp-key-secret','SDQOKFI35ZORA22JXLU2QBZG3IU4TD3I');
INSERT INTO `guacamole_user_attribute` VALUES (31,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (31,'guac-totp-key-secret','FWWF6ATHBJAPGCRN2BVFPMHGTRL337CA');
INSERT INTO `guacamole_user_attribute` VALUES (37,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (37,'guac-totp-key-secret','HZHZQN4IUG3HQVVPAFOXDL6CMPBAIW5U');
INSERT INTO `guacamole_user_attribute` VALUES (40,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (40,'guac-totp-key-secret','HUGXFYFAF6NUGHTZPJL54TMPLHDUPEBH');
INSERT INTO `guacamole_user_attribute` VALUES (46,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (46,'guac-totp-key-secret','P3SSG5L3K25KXOCMGW4LK2ETRJAZ6OMR');
INSERT INTO `guacamole_user_attribute` VALUES (47,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (47,'guac-totp-key-secret','JM5OY6B4AAB55JXSC6DT45C7RFLC57WQ');
INSERT INTO `guacamole_user_attribute` VALUES (51,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (51,'guac-totp-key-secret','WO2SUQZ3ZCRQA7LT2VXKWL7P7XHZ447G');
INSERT INTO `guacamole_user_attribute` VALUES (52,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (52,'guac-totp-key-secret','AX5RSONY2DJQUIKMW4YFR3FNH5IJCEJK');
INSERT INTO `guacamole_user_attribute` VALUES (53,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (53,'guac-totp-key-secret','INB6C4JOL5QFZFC2E52PPJA32RMS76RC');
INSERT INTO `guacamole_user_attribute` VALUES (54,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (54,'guac-totp-key-secret','7WVGTR5ZGD5QMDILPTBUIEOG6X56IAMN');
INSERT INTO `guacamole_user_attribute` VALUES (55,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (55,'guac-totp-key-secret','V5OVLDHSBP63CELGD4SYUSPUHYT3YLND');
INSERT INTO `guacamole_user_attribute` VALUES (56,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (56,'guac-totp-key-secret','GTP5A2EDNJU5UNTHAU5THAVW2OXR4SD4');
INSERT INTO `guacamole_user_attribute` VALUES (58,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (58,'guac-totp-key-secret','GFCHA4LFKLIDIBDNBH5BASN6B7XA3E4Y');
INSERT INTO `guacamole_user_attribute` VALUES (60,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (60,'guac-totp-key-secret','VVOVLHZKLXZ5BEFY677MZH4ANTUX2PFT');
INSERT INTO `guacamole_user_attribute` VALUES (61,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (61,'guac-totp-key-secret','G5IV4RUDJPQOGPNXTL2NDR3DAEOIBL7R');
INSERT INTO `guacamole_user_attribute` VALUES (62,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (62,'guac-totp-key-secret','AYPEC47KW67XBZGTJFUE64CBY5LT7CEZ');
INSERT INTO `guacamole_user_attribute` VALUES (64,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (64,'guac-totp-key-secret','VDUXBZN2KAUXCCBWUBCCPNGA7NMRUBQW');
INSERT INTO `guacamole_user_attribute` VALUES (65,'guac-totp-key-confirmed','false');
INSERT INTO `guacamole_user_attribute` VALUES (65,'guac-totp-key-secret','H3O6TDFQIDMHPJ44VLZIWPGVWMXXS57E');
INSERT INTO `guacamole_user_attribute` VALUES (66,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (66,'guac-totp-key-secret','M6LMEPF7FTZCQ4XDJ4GLJBMAVC5J47A6');
INSERT INTO `guacamole_user_attribute` VALUES (67,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (67,'guac-totp-key-secret','4CGUEC3SFJLOOZKSGOHVYX2D45CKUIHD');
INSERT INTO `guacamole_user_attribute` VALUES (68,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (68,'guac-totp-key-secret','TSIGUZCCC7FAZEBH2H73QNAV7DPXX6BO');
INSERT INTO `guacamole_user_attribute` VALUES (68,'guac-totp-reset','true');
INSERT INTO `guacamole_user_attribute` VALUES (69,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (69,'guac-totp-key-secret','WMAIN2N2FBBGY34ZIQPJUXSAYUM42CYQ');
INSERT INTO `guacamole_user_attribute` VALUES (69,'guac-totp-reset','true');
INSERT INTO `guacamole_user_attribute` VALUES (70,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (70,'guac-totp-key-secret','TYJ7DV3KMBXIJM76GQMPGIIFAXAT73IC');
INSERT INTO `guacamole_user_attribute` VALUES (70,'guac-totp-reset','true');
INSERT INTO `guacamole_user_attribute` VALUES (71,'guac-totp-reset','true');
INSERT INTO `guacamole_user_attribute` VALUES (72,'guac-totp-key-confirmed','true');
INSERT INTO `guacamole_user_attribute` VALUES (72,'guac-totp-key-secret','HGPPX7YJC65N5BLDHT774UPBN7GVP4OT');
INSERT INTO `guacamole_user_attribute` VALUES (72,'guac-totp-reset','true');
/*!40000 ALTER TABLE `guacamole_user_attribute` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_user_group` WRITE;
/*!40000 ALTER TABLE `guacamole_user_group` DISABLE KEYS */;
INSERT INTO `guacamole_user_group` VALUES (1,15,0);
INSERT INTO `guacamole_user_group` VALUES (2,16,0);
INSERT INTO `guacamole_user_group` VALUES (3,17,0);
INSERT INTO `guacamole_user_group` VALUES (4,76,0);
/*!40000 ALTER TABLE `guacamole_user_group` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_user_group_attribute` WRITE;
/*!40000 ALTER TABLE `guacamole_user_group_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_user_group_attribute` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_user_group_member` WRITE;
/*!40000 ALTER TABLE `guacamole_user_group_member` DISABLE KEYS */;
INSERT INTO `guacamole_user_group_member` VALUES (1,2);
INSERT INTO `guacamole_user_group_member` VALUES (2,2);
INSERT INTO `guacamole_user_group_member` VALUES (3,2);
INSERT INTO `guacamole_user_group_member` VALUES (4,69);
/*!40000 ALTER TABLE `guacamole_user_group_member` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_user_group_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_user_group_permission` DISABLE KEYS */;
INSERT INTO `guacamole_user_group_permission` VALUES (2,1,'READ');
INSERT INTO `guacamole_user_group_permission` VALUES (2,1,'UPDATE');
INSERT INTO `guacamole_user_group_permission` VALUES (2,1,'DELETE');
INSERT INTO `guacamole_user_group_permission` VALUES (2,1,'ADMINISTER');
INSERT INTO `guacamole_user_group_permission` VALUES (2,2,'READ');
INSERT INTO `guacamole_user_group_permission` VALUES (2,2,'UPDATE');
INSERT INTO `guacamole_user_group_permission` VALUES (2,2,'DELETE');
INSERT INTO `guacamole_user_group_permission` VALUES (2,2,'ADMINISTER');
INSERT INTO `guacamole_user_group_permission` VALUES (2,3,'READ');
INSERT INTO `guacamole_user_group_permission` VALUES (2,3,'UPDATE');
INSERT INTO `guacamole_user_group_permission` VALUES (2,3,'DELETE');
INSERT INTO `guacamole_user_group_permission` VALUES (2,3,'ADMINISTER');
INSERT INTO `guacamole_user_group_permission` VALUES (69,4,'READ');
INSERT INTO `guacamole_user_group_permission` VALUES (69,4,'UPDATE');
INSERT INTO `guacamole_user_group_permission` VALUES (69,4,'DELETE');
INSERT INTO `guacamole_user_group_permission` VALUES (69,4,'ADMINISTER');
/*!40000 ALTER TABLE `guacamole_user_group_permission` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `guacamole_user_history` WRITE;
/*!40000 ALTER TABLE `guacamole_user_history` DISABLE KEYS */;
INSERT INTO `guacamole_user_history` VALUES (1,55,'vivek-macha','103.211.40.189','2025-07-04 11:22:17',NULL);
INSERT INTO `guacamole_user_history` VALUES (2,55,'vivek-macha','103.211.40.189','2025-07-04 11:22:26','2025-07-04 12:50:42');
INSERT INTO `guacamole_user_history` VALUES (3,61,'bhavna','115.98.235.231','2025-07-04 11:33:32',NULL);
INSERT INTO `guacamole_user_history` VALUES (4,61,'bhavna','115.98.235.231','2025-07-04 11:33:45','2025-07-04 15:16:59');
INSERT INTO `guacamole_user_history` VALUES (5,69,'pooja-more','49.36.109.170','2025-07-04 12:03:14',NULL);
INSERT INTO `guacamole_user_history` VALUES (6,53,'ashish_singh','103.175.135.201','2025-07-04 12:03:46',NULL);
INSERT INTO `guacamole_user_history` VALUES (7,69,'pooja-more','49.36.109.170','2025-07-04 12:03:52','2025-07-04 13:03:59');
INSERT INTO `guacamole_user_history` VALUES (8,53,'ashish_singh','103.175.135.201','2025-07-04 12:03:55','2025-07-04 13:50:59');
INSERT INTO `guacamole_user_history` VALUES (9,21,'ashish-mishra','202.168.145.255','2025-07-04 14:59:26',NULL);
INSERT INTO `guacamole_user_history` VALUES (10,21,'ashish-mishra','202.168.145.255','2025-07-04 14:59:39','2025-07-04 15:59:59');
INSERT INTO `guacamole_user_history` VALUES (11,69,'pooja-more','49.43.25.80','2025-07-04 17:14:54',NULL);
INSERT INTO `guacamole_user_history` VALUES (12,69,'pooja-more','49.43.25.80','2025-07-04 17:15:12','2025-07-04 18:55:59');
INSERT INTO `guacamole_user_history` VALUES (13,69,'pooja-more','49.36.109.170','2025-07-04 20:39:43',NULL);
INSERT INTO `guacamole_user_history` VALUES (14,69,'pooja-more','49.36.109.170','2025-07-04 20:40:07','2025-07-04 21:40:59');
INSERT INTO `guacamole_user_history` VALUES (15,55,'vivek-macha','103.211.40.189','2025-07-05 04:58:52',NULL);
INSERT INTO `guacamole_user_history` VALUES (16,55,'vivek-macha','103.211.40.189','2025-07-05 04:59:04',NULL);
INSERT INTO `guacamole_user_history` VALUES (17,55,'vivek-macha','103.211.40.189','2025-07-05 04:59:09','2025-07-05 08:58:22');
INSERT INTO `guacamole_user_history` VALUES (18,56,'chetan-kapadia','103.87.28.54','2025-07-05 05:08:02',NULL);
INSERT INTO `guacamole_user_history` VALUES (19,56,'chetan-kapadia','103.87.28.54','2025-07-05 05:08:16','2025-07-05 07:33:59');
INSERT INTO `guacamole_user_history` VALUES (20,66,'chaitanya','110.226.179.117','2025-07-05 07:15:15',NULL);
INSERT INTO `guacamole_user_history` VALUES (21,66,'chaitanya','110.226.179.117','2025-07-05 07:15:29','2025-07-05 08:15:59');
/*!40000 ALTER TABLE `guacamole_user_history` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_user_password_history` WRITE;
/*!40000 ALTER TABLE `guacamole_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `guacamole_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `guacamole_user_permission` WRITE;
/*!40000 ALTER TABLE `guacamole_user_permission` DISABLE KEYS */;
INSERT INTO `guacamole_user_permission` VALUES (2,2,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,2,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,5,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,5,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,5,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,5,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (5,5,'READ');
INSERT INTO `guacamole_user_permission` VALUES (5,5,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,8,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,8,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,8,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,8,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (8,8,'READ');
INSERT INTO `guacamole_user_permission` VALUES (8,8,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,10,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,10,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,10,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,10,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (10,10,'READ');
INSERT INTO `guacamole_user_permission` VALUES (10,10,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,11,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,11,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,11,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,11,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (11,11,'READ');
INSERT INTO `guacamole_user_permission` VALUES (11,11,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,15,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,15,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,15,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,15,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (18,15,'READ');
INSERT INTO `guacamole_user_permission` VALUES (18,15,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,16,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,16,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,16,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,16,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (19,16,'READ');
INSERT INTO `guacamole_user_permission` VALUES (19,16,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,17,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,17,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,17,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,17,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (20,17,'READ');
INSERT INTO `guacamole_user_permission` VALUES (20,17,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,18,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,18,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,18,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,18,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (21,18,'READ');
INSERT INTO `guacamole_user_permission` VALUES (21,18,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,19,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,19,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,19,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,19,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (22,19,'READ');
INSERT INTO `guacamole_user_permission` VALUES (22,19,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,20,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,20,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,20,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,20,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (23,20,'READ');
INSERT INTO `guacamole_user_permission` VALUES (23,20,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,21,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,21,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,21,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,21,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (24,21,'READ');
INSERT INTO `guacamole_user_permission` VALUES (24,21,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,26,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,26,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,26,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,26,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (29,26,'READ');
INSERT INTO `guacamole_user_permission` VALUES (29,26,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,30,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,30,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,30,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,30,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (33,30,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,31,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,31,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,31,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,31,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (34,31,'READ');
INSERT INTO `guacamole_user_permission` VALUES (34,31,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,37,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,37,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,37,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,37,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (40,37,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,39,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,39,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,39,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,39,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (42,39,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,40,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,40,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,40,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,40,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (43,40,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,46,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,46,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,46,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,46,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (49,46,'READ');
INSERT INTO `guacamole_user_permission` VALUES (49,46,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,47,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,47,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,47,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,47,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (50,47,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,51,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,51,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,51,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,51,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (54,51,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,52,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,52,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,52,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,52,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (55,52,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,53,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,53,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,53,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,53,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (56,53,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,54,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,54,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,54,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,54,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (57,54,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,55,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,55,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,55,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,55,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (58,55,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,56,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,56,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,56,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,56,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (59,56,'READ');
INSERT INTO `guacamole_user_permission` VALUES (59,56,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,58,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,58,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,58,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,58,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (61,58,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,60,'READ');
INSERT INTO `guacamole_user_permission` VALUES (2,60,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (2,60,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (2,60,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (63,60,'READ');
INSERT INTO `guacamole_user_permission` VALUES (64,61,'READ');
INSERT INTO `guacamole_user_permission` VALUES (65,62,'READ');
INSERT INTO `guacamole_user_permission` VALUES (67,64,'READ');
INSERT INTO `guacamole_user_permission` VALUES (68,65,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,66,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,66,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (69,67,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,67,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (69,67,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (69,67,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (70,67,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,68,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,68,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (69,68,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (69,68,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (71,68,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,69,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,69,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (69,69,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (69,69,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (72,69,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,70,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,70,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (69,70,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (69,70,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (73,70,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,71,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,71,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (69,71,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (69,71,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (74,71,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,72,'READ');
INSERT INTO `guacamole_user_permission` VALUES (69,72,'UPDATE');
INSERT INTO `guacamole_user_permission` VALUES (69,72,'DELETE');
INSERT INTO `guacamole_user_permission` VALUES (69,72,'ADMINISTER');
INSERT INTO `guacamole_user_permission` VALUES (75,72,'READ');
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

