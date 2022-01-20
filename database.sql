-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: bd-manga-shoten
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id_author` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Stacia'),(2,'Danya'),(3,'Darcee'),(4,'Prudi'),(5,'Jackson'),(6,'Eveline'),(7,'Jule'),(8,'Kerstin'),(9,'Malissa'),(10,'Son');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editor`
--

DROP TABLE IF EXISTS `editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editor` (
  `id_editor` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_editor`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editor`
--

LOCK TABLES `editor` WRITE;
/*!40000 ALTER TABLE `editor` DISABLE KEYS */;
INSERT INTO `editor` VALUES (1,'DuBuque, Walsh and Kub','http://irs.gov'),(2,'Hauck, Lueilwitz and Larson','http://wikia.com'),(3,'Beahan-Daugherty','http://independent.co.uk'),(4,'Labadie Group','http://mayoclinic.com'),(5,'Hammes-Schumm','http://reddit.com'),(6,'Wilderman-Franecki','http://npr.org'),(7,'Mueller LLC','http://51.la'),(8,'Muller Group','http://wordpress.org'),(9,'O\'Keefe LLC','https://mapy.cz'),(10,'Osinski, Morissette and Schmeler','https://phoca.cz');
/*!40000 ALTER TABLE `editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_type`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (4,'Children'),(3,'Comedy'),(2,'Crime'),(7,'Drama'),(6,'Fantasy'),(10,'Hentai'),(8,'Musical'),(5,'Romance'),(9,'Thriller'),(1,'Western');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_manga`
--

DROP TABLE IF EXISTS `genre_manga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_manga` (
  `id_manga` int NOT NULL,
  `id_type` int NOT NULL,
  PRIMARY KEY (`id_manga`,`id_type`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `genre_manga_ibfk_1` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`),
  CONSTRAINT `genre_manga_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `genre` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_manga`
--

LOCK TABLES `genre_manga` WRITE;
/*!40000 ALTER TABLE `genre_manga` DISABLE KEYS */;
INSERT INTO `genre_manga` VALUES (31,1),(32,2),(33,3),(34,4),(35,5),(36,6),(37,7),(38,8),(39,9),(40,10);
/*!40000 ALTER TABLE `genre_manga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manga`
--

DROP TABLE IF EXISTS `manga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manga` (
  `id_manga` int NOT NULL AUTO_INCREMENT,
  `mangadex_id` varchar(255) DEFAULT NULL,
  `title_en` varchar(50) NOT NULL,
  `title_jp` varchar(50) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `release_date` varchar(4) DEFAULT NULL,
  `id_author` int NOT NULL,
  PRIMARY KEY (`id_manga`),
  UNIQUE KEY `title_en` (`title_en`),
  UNIQUE KEY `title_jp` (`title_jp`),
  UNIQUE KEY `mangadex_id_UNIQUE` (`mangadex_id`),
  KEY `manga_ibfk_1` (`id_author`),
  CONSTRAINT `manga_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manga`
--

LOCK TABLES `manga` WRITE;
/*!40000 ALTER TABLE `manga` DISABLE KEYS */;
INSERT INTO `manga` VALUES (31,NULL,'Elfenlied','寒',NULL,'http://dummyimage.com/224x100.png/cc0000/ffffff','2020',1),(32,NULL,'3 Blind Mice','晧',NULL,'http://dummyimage.com/201x100.png/5fa2dd/ffffff','2018',2),(33,NULL,'Deadly Tower, The','宸瑜',NULL,'http://dummyimage.com/171x100.png/ff4444/ffffff','2013',3),(34,NULL,'Never Too Young to Die','浩成',NULL,'http://dummyimage.com/117x100.png/ff4444/ffffff','2020',4),(35,NULL,'Dragon Age','泽瀚',NULL,'http://dummyimage.com/157x100.png/5fa2dd/ffffff','2016',5),(36,NULL,'Matter of Dignity, A (To teleftaio psema)','韵',NULL,'http://dummyimage.com/120x100.png/ff4444/ffffff','2017',6),(37,NULL,'House II: The Second Story','雅芙',NULL,'http://dummyimage.com/107x100.png/dddddd/000000','2011',7),(38,NULL,'Great!','梓彤',NULL,'http://dummyimage.com/185x100.png/5fa2dd/ffffff','2000',8),(39,NULL,'Joy Luck Club, The','佐仪',NULL,'http://dummyimage.com/153x100.png/cc0000/ffffff','2013',9),(40,NULL,'Cavalcade','雅静',NULL,'http://dummyimage.com/199x100.png/cc0000/ffffff','2019',10);
/*!40000 ALTER TABLE `manga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id_role` int NOT NULL,
  `code_role` char(20) NOT NULL,
  PRIMARY KEY (`id_role`),
  UNIQUE KEY `code_role` (`code_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (3,'admin'),(2,'user'),(1,'visitor');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tome`
--

DROP TABLE IF EXISTS `tome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tome` (
  `id_tome` int NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `chapter_number` int DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `id_editor` int NOT NULL,
  `id_manga` int NOT NULL,
  PRIMARY KEY (`id_tome`),
  KEY `tome_ibfk_1` (`id_editor`),
  KEY `tome_ibfk_2` (`id_manga`),
  CONSTRAINT `tome_ibfk_1` FOREIGN KEY (`id_editor`) REFERENCES `editor` (`id_editor`),
  CONSTRAINT `tome_ibfk_2` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tome`
--

LOCK TABLES `tome` WRITE;
/*!40000 ALTER TABLE `tome` DISABLE KEYS */;
INSERT INTO `tome` VALUES (3,11,150,'http://dummyimage.com/154x100.png/5fa2dd/ffffff',1,31),(4,18,96,'http://dummyimage.com/152x100.png/5fa2dd/ffffff',2,32),(5,17,98,'http://dummyimage.com/139x100.png/5fa2dd/ffffff',3,33),(6,30,61,'http://dummyimage.com/110x100.png/dddddd/000000',4,34),(7,22,58,'http://dummyimage.com/145x100.png/ff4444/ffffff',5,35),(8,12,78,'http://dummyimage.com/201x100.png/ff4444/ffffff',6,36),(9,17,112,'http://dummyimage.com/186x100.png/5fa2dd/ffffff',7,37),(10,14,192,'http://dummyimage.com/135x100.png/5fa2dd/ffffff',8,38),(11,19,130,'http://dummyimage.com/166x100.png/5fa2dd/ffffff',9,39),(12,3,26,'http://dummyimage.com/117x100.png/dddddd/000000',10,40);
/*!40000 ALTER TABLE `tome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mail` (`mail`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'bslatter0','bslatter0@goo.ne.jp','http://dummyimage.com/188x100.png/5fa2dd/ffffff','Bjorn','Slatter','BllCNSPJ','2021-11-12',2),(2,'cbenson1','cbenson1@ted.com','http://dummyimage.com/225x100.png/cc0000/ffffff','Cedric','Benson','ZhlxibXi','2021-10-11',1),(3,'jroddick2','jroddick2@businessinsider.com','http://dummyimage.com/164x100.png/cc0000/ffffff','Judon','Roddick','5ZtTg9eSt6','2021-01-16',1),(4,'cknatt3','cknatt3@dailymail.co.uk','http://dummyimage.com/181x100.png/ff4444/ffffff','Claribel','Knatt','dP62S7KY5GV','2021-08-24',1),(5,'skeyser4','skeyser4@nytimes.com','http://dummyimage.com/102x100.png/ff4444/ffffff','Standford','Keyser','fEYMIVqRGA','2021-10-05',1),(6,'rmargrem5','rmargrem5@flavors.me','http://dummyimage.com/164x100.png/ff4444/ffffff','Reginald','Margrem','6NELNN0','2021-08-10',2),(7,'mmartinat6','mmartinat6@linkedin.com','http://dummyimage.com/129x100.png/ff4444/ffffff','Morgun','Martinat','vRxABl8EEj','2020-11-28',1),(8,'ngive7','ngive7@nature.com','http://dummyimage.com/239x100.png/5fa2dd/ffffff','Norina','Give','LnlGAJc6s','2021-11-17',2),(9,'dtebbut8','dtebbut8@reverbnation.com','http://dummyimage.com/191x100.png/dddddd/000000','Dannel','Tebbut','ipLzK82NwMX','2021-01-31',1),(10,'cmccreath9','cmccreath9@desdev.cn','http://dummyimage.com/167x100.png/cc0000/ffffff','Cesare','McCreath','gdCprRqkT7p','2021-03-14',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tome`
--

DROP TABLE IF EXISTS `user_tome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tome` (
  `id_user` int NOT NULL,
  `id_tome` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_tome`),
  KEY `id_tome` (`id_tome`),
  CONSTRAINT `user_tome_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `user_tome_ibfk_2` FOREIGN KEY (`id_tome`) REFERENCES `tome` (`id_tome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tome`
--

LOCK TABLES `user_tome` WRITE;
/*!40000 ALTER TABLE `user_tome` DISABLE KEYS */;
INSERT INTO `user_tome` VALUES (1,3),(2,4),(3,5),(4,6),(5,7),(6,8),(7,9),(8,10),(9,11),(10,12);
/*!40000 ALTER TABLE `user_tome` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-20 15:48:41
