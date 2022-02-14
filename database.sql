


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd-manga-shoten
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd-manga-shoten
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd-manga-shoten` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

USE `bd-manga-shoten` ;

CREATE USER IF NOT EXISTS mangareader IDENTIFIED BY 'readerpass';
GRANT ALL ON `bd-manga-shoten`.* TO mangareader;


DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id_author` varchar(255) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('1','Stacia'),('2','Danya'),('3','Darcee'),('4','Prudi'),('5','Jackson'),('6','Eveline'),('7','Jule'),('8','Kerstin'),('9','Malissa'),('10','Son');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editor`
--

DROP TABLE IF EXISTS `editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editor` (
  `id_editor` varchar(255) NOT NULL,
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
INSERT INTO `editor` VALUES ('1','DuBuque, Walsh and Kub','http://irs.gov'),('2','Hauck, Lueilwitz and Larson','http://wikia.com'),('3','Beahan-Daugherty','http://independent.co.uk'),('4','Labadie Group','http://mayoclinic.com'),('5','Hammes-Schumm','http://reddit.com'),('6','Wilderman-Franecki','http://npr.org'),('7','Mueller LLC','http://51.la'),('8','Muller Group','http://wordpress.org'),('9','OKeefe LLC','https://mapy.cz'),('10','Osinski, Morissette and Schmeler','https://phoca.cz');
/*!40000 ALTER TABLE `editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id_genre` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genre`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES ('4','Children'),('3','Comedy'),('2','Crime'),('7','Drama'),('6','Fantasy'),('10','Hentai'),('8','Musical'),('5','Romance'),('9','Thriller'),('1','Western');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_manga`
--

DROP TABLE IF EXISTS `genre_manga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_manga` (
  `id_manga` varchar(255) NOT NULL,
  `id_genre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_manga`,`id_genre`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `genre_manga_ibfk_1` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`),
  CONSTRAINT `genre_manga_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_manga`
--

LOCK TABLES `genre_manga` WRITE;
/*!40000 ALTER TABLE `genre_manga` DISABLE KEYS */;
INSERT INTO `genre_manga` VALUES ('31','1'),('32','2'),('33','3'),('34','4'),('35','5'),('36','6'),('37','7'),('38','8'),('39','9'),('40','10');
/*!40000 ALTER TABLE `genre_manga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_demographic`
--

DROP TABLE IF EXISTS `publication_demographic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_demographic` (
  `id` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `publication_demographic`
--

DROP TABLE IF EXISTS `publication_demographic_manga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_demographic_manga` (
  `id_manga` varchar(255) NOT NULL,
  `id_pub_demo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_manga`,`id_pub_demo`),
  KEY `id_pub_demo` (`id_pub_demo`),
  CONSTRAINT `pub_demo_manga_ibfk_1` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`),
  CONSTRAINT `pub_demo_manga_ibfk_2` FOREIGN KEY (`id_pub_demo`) REFERENCES `publication_demographic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
<<<<<<< HEAD
=======
-- Table structure for table `manga`
--

DROP TABLE IF EXISTS `manga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manga` (
  `id_manga` varchar(255) NOT NULL,
  `title_en` varchar(50) NOT NULL,
  `title_jp` varchar(50) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `publication_demographic` varchar(20) DEFAULT NULL,
  `last_volume` varchar(4) DEFAULT NULL,
  `last_chapter` varchar(4) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `release_date` varchar(4) DEFAULT NULL,
  `id_author` varchar(255) NOT NULL,
  PRIMARY KEY (`id_manga`),
  UNIQUE KEY `title_en` (`title_en`),
  UNIQUE KEY `title_jp` (`title_jp`),
  KEY `manga_ibfk_1` (`id_author`),
  CONSTRAINT `manga_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manga`
--

LOCK TABLES `manga` WRITE;
/*!40000 ALTER TABLE `manga` DISABLE KEYS */;
INSERT INTO `manga` VALUES ('31','Elfenlied','寒',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/224x100.png/cc0000/ffffff','2020','1'),('32','3 Blind Mice','晧',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/201x100.png/5fa2dd/ffffff','2018','2'),('33','Deadly Tower, The','宸瑜',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/171x100.png/ff4444/ffffff','2013','3'),('34','Never Too Young to Die','浩成',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/117x100.png/ff4444/ffffff','2020','4'),('35','Dragon Age','泽瀚',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/157x100.png/5fa2dd/ffffff','2016','5'),('36','Matter of Dignity, A (To teleftaio psema)','韵',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/120x100.png/ff4444/ffffff','2017','6'),('37','House II: The Second Story','雅芙',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/107x100.png/dddddd/000000','2011','7'),('38','Great!','梓彤',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/185x100.png/5fa2dd/ffffff','2000','8'),('39','Joy Luck Club, The','佐仪',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/153x100.png/cc0000/ffffff','2013','9'),('40','Cavalcade','雅静',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/199x100.png/cc0000/ffffff','2019','10');
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
INSERT INTO `role` VALUES (3,'ROLE_ADMIN'),(2,'ROLE_USER'),(1,'ROLE_VISITOR');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tome`
--

DROP TABLE IF EXISTS `tome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tome` (
  `id_tome` varchar(255) NOT NULL,
  `number` int NOT NULL,
  `chapter_number` int DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `id_editor` varchar(255) NOT NULL,
  `id_manga` varchar(255) NOT NULL,
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
INSERT INTO `tome` VALUES ('3',11,150,'http://dummyimage.com/154x100.png/5fa2dd/ffffff','1','31'),('4',18,96,'http://dummyimage.com/152x100.png/5fa2dd/ffffff','2','32'),('5',17,98,'http://dummyimage.com/139x100.png/5fa2dd/ffffff','3','33'),('6',30,61,'http://dummyimage.com/110x100.png/dddddd/000000','4','34'),('7',22,58,'http://dummyimage.com/145x100.png/ff4444/ffffff','5','35'),('8',12,78,'http://dummyimage.com/201x100.png/ff4444/ffffff','6','36'),('9',17,112,'http://dummyimage.com/186x100.png/5fa2dd/ffffff','7','37'),('10',14,192,'http://dummyimage.com/135x100.png/5fa2dd/ffffff','8','38'),('11',19,130,'http://dummyimage.com/166x100.png/5fa2dd/ffffff','9','39'),('12',3,26,'http://dummyimage.com/117x100.png/dddddd/000000','10','40');
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
  `password` varchar(255) NOT NULL,
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
  `id_tome` varchar(255) NOT NULL,
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
INSERT INTO `user_tome` VALUES (1,'3'),(2,'4'),(3,'5'),(4,'6'),(5,'7'),(6,'8'),(7,'9'),(8,'10'),(9,'11'),(10,'12');
/*!40000 ALTER TABLE `user_tome` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET character_set_client = @saved_cs_client */;


--
>>>>>>> e22ec4f5e2b31d137d05eb1e6296d27a2e13b5fc
-- Table structure for table `manga`
--

DROP TABLE IF EXISTS `manga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manga` (
  `id_manga` varchar(255) NOT NULL,
  `title_en` varchar(50) NOT NULL,
  `title_jp` varchar(50) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `publication_demographic` varchar(20) DEFAULT NULL,
  `last_volume` varchar(4) DEFAULT NULL,
  `last_chapter` varchar(4) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `release_date` varchar(4) DEFAULT NULL,
  `id_author` varchar(255) NOT NULL,
  PRIMARY KEY (`id_manga`),
  UNIQUE KEY `title_en` (`title_en`),
  UNIQUE KEY `title_jp` (`title_jp`),
  KEY `manga_ibfk_1` (`id_author`),
  CONSTRAINT `manga_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manga`
--

LOCK TABLES `manga` WRITE;
/*!40000 ALTER TABLE `manga` DISABLE KEYS */;
INSERT INTO `manga` VALUES ('31','Elfenlied','寒',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/224x100.png/cc0000/ffffff','2020','1'),('32','3 Blind Mice','晧',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/201x100.png/5fa2dd/ffffff','2018','2'),('33','Deadly Tower, The','宸瑜',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/171x100.png/ff4444/ffffff','2013','3'),('34','Never Too Young to Die','浩成',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/117x100.png/ff4444/ffffff','2020','4'),('35','Dragon Age','泽瀚',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/157x100.png/5fa2dd/ffffff','2016','5'),('36','Matter of Dignity, A (To teleftaio psema)','韵',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/120x100.png/ff4444/ffffff','2017','6'),('37','House II: The Second Story','雅芙',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/107x100.png/dddddd/000000','2011','7'),('38','Great!','梓彤',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/185x100.png/5fa2dd/ffffff','2000','8'),('39','Joy Luck Club, The','佐仪',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/153x100.png/cc0000/ffffff','2013','9'),('40','Cavalcade','雅静',NULL,NULL,NULL,NULL,NULL,'http://dummyimage.com/199x100.png/cc0000/ffffff','2019','10');
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
INSERT INTO `role` VALUES (3,'ROLE_ADMIN'),(2,'ROLE_USER'),(1,'ROLE_VISITOR');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tome`
--

DROP TABLE IF EXISTS `tome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tome` (
  `id_tome` varchar(255) NOT NULL,
  `number` int NOT NULL,
  `chapter_number` int DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `id_editor` varchar(255) NOT NULL,
  `id_manga` varchar(255) NOT NULL,
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
INSERT INTO `tome` VALUES ('3',11,150,'http://dummyimage.com/154x100.png/5fa2dd/ffffff','1','31'),('4',18,96,'http://dummyimage.com/152x100.png/5fa2dd/ffffff','2','32'),('5',17,98,'http://dummyimage.com/139x100.png/5fa2dd/ffffff','3','33'),('6',30,61,'http://dummyimage.com/110x100.png/dddddd/000000','4','34'),('7',22,58,'http://dummyimage.com/145x100.png/ff4444/ffffff','5','35'),('8',12,78,'http://dummyimage.com/201x100.png/ff4444/ffffff','6','36'),('9',17,112,'http://dummyimage.com/186x100.png/5fa2dd/ffffff','7','37'),('10',14,192,'http://dummyimage.com/135x100.png/5fa2dd/ffffff','8','38'),('11',19,130,'http://dummyimage.com/166x100.png/5fa2dd/ffffff','9','39'),('12',3,26,'http://dummyimage.com/117x100.png/dddddd/000000','10','40');
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
  `password` varchar(255) NOT NULL,
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
  `id_tome` varchar(255) NOT NULL,
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
INSERT INTO `user_tome` VALUES (1,'3'),(2,'4'),(3,'5'),(4,'6'),(5,'7'),(6,'8'),(7,'9'),(8,'10'),(9,'11'),(10,'12');
/*!40000 ALTER TABLE `user_tome` ENABLE KEYS */;
UNLOCK TABLES;