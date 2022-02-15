


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


-- Table structure for table `manga`
--

DROP TABLE IF EXISTS `manga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manga` (
  `id_manga` varchar(255) NOT NULL,
  `title_en` varchar(50) NOT NULL,
  `title_jp` varchar(50) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `publication_demographic` varchar(20) DEFAULT NULL,
  `last_volume` varchar(4) DEFAULT NULL,
  `last_chapter` varchar(4) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `synopsis` TEXT DEFAULT NULL,
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
  `id_tome` INT NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `chapter_number` int DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `id_manga` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tome`),
  KEY `tome_ibfk_1` (`id_manga`),
  CONSTRAINT `tome_ibfk_1` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



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
-- Table structure for table `user_tome`
--

DROP TABLE IF EXISTS `user_tome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tome` (
  `id_user` int NOT NULL,
  `id_tome` INT NOT NULL,
  PRIMARY KEY (`id_user`,`id_tome`),
  KEY `id_tome` (`id_tome`),
  CONSTRAINT `user_tome_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `user_tome_ibfk_2` FOREIGN KEY (`id_tome`) REFERENCES `tome` (`id_tome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

