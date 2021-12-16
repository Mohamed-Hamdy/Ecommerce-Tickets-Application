-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce-app-database
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20211129123807_Initial','5.0.12'),('20211130181427_Initial','5.0.12'),('20211213231254_Initial','5.0.12'),('20211213235101_ShoppingCartItems_Added','5.0.12');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProfilepictureURL` varchar(500) DEFAULT NULL,
  `FullName` varchar(150) DEFAULT NULL,
  `Bio` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'http://dotnethow.net/images/actors/actor-1.jpeg','Actor 1','This is the Bio of the First actor'),(2,'http://dotnethow.net/images/actors/actor-2.jpeg','Actor 2','This is the Bio of the second actor'),(3,'http://dotnethow.net/images/actors/actor-3.jpeg','Actor 3','This is the Bio of the Third actor'),(4,'http://dotnethow.net/images/actors/actor-4.jpeg','Actor 4','This is the Bio of the Fourth actor'),(5,'http://dotnethow.net/images/actors/actor-5.jpeg','Actor 5','This is the Bio of the Fifth actor');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actors_movies`
--

DROP TABLE IF EXISTS `actors_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors_movies` (
  `MovieId` int NOT NULL,
  `ActorId` int NOT NULL,
  PRIMARY KEY (`ActorId`,`MovieId`),
  KEY `IX_Actors_Movies_MovieId` (`MovieId`),
  CONSTRAINT `FK_Actors_Movies_Actors_ActorId` FOREIGN KEY (`ActorId`) REFERENCES `actors` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Actors_Movies_Movies_MovieId` FOREIGN KEY (`MovieId`) REFERENCES `movies` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors_movies`
--

LOCK TABLES `actors_movies` WRITE;
/*!40000 ALTER TABLE `actors_movies` DISABLE KEYS */;
INSERT INTO `actors_movies` VALUES (1,1),(1,3),(2,1),(2,4),(3,1),(3,2),(3,5),(4,2),(4,3),(4,4),(5,2),(5,3),(5,4),(5,5),(6,3),(6,4),(6,5);
/*!40000 ALTER TABLE `actors_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Logo` varchar(500) DEFAULT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Discription` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'http://dotnethow.net/images/cinemas/cinema-1.jpeg','Cinema 1','This is the description of the first cinema'),(2,'http://dotnethow.net/images/cinemas/cinema-2.jpeg','Cinema 2','This is the description of the first cinema'),(3,'http://dotnethow.net/images/cinemas/cinema-3.jpeg','Cinema 3','This is the description of the first cinema'),(4,'http://dotnethow.net/images/cinemas/cinema-4.jpeg','Cinema 4','This is the description of the first cinema'),(5,'http://dotnethow.net/images/cinemas/cinema-5.jpeg','Cinema 5','This is the description of the first cinema');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) DEFAULT NULL,
  `Discription` text,
  `Price` double NOT NULL,
  `ImageURL` varchar(250) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `MovieCategory` int NOT NULL,
  `CinemaId` int NOT NULL,
  `ProducerId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Movies_CinemaId` (`CinemaId`),
  KEY `IX_Movies_ProducerId` (`ProducerId`),
  CONSTRAINT `FK_Movies_Cinemas_CinemaId` FOREIGN KEY (`CinemaId`) REFERENCES `cinemas` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Movies_Producers_ProducerId` FOREIGN KEY (`ProducerId`) REFERENCES `producers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Scoob','This is the Scoob movie description',39.5,'http://dotnethow.net/images/movies/movie-7.jpeg','2021-12-04 01:28:42','2021-12-12 01:28:42',5,1,3),(2,'Race','This is the Race movie description',39.5,'http://dotnethow.net/images/movies/movie-6.jpeg','2021-12-04 01:28:42','2021-12-09 01:28:42',4,1,2),(3,'Ghost','This is the Ghost movie description',39.5,'http://dotnethow.net/images/movies/movie-4.jpeg','2021-12-14 01:28:42','2021-12-21 01:28:42',6,4,4),(4,'The Shawshank Redemption','This is the Shawshank Redemption description',29.5,'http://dotnethow.net/images/movies/movie-1.jpeg','2021-12-14 01:28:42','2021-12-17 01:28:42',1,1,1),(5,'Life','This is the Life movie description',39.5,'http://dotnethow.net/images/movies/movie-3.jpeg','2021-12-04 01:28:42','2021-12-24 01:28:42',4,3,3),(6,'Cold Soles','This is the Cold Soles movie description',39.5,'http://dotnethow.net/images/movies/movie-8.jpeg','2021-12-17 01:28:42','2022-01-03 01:28:42',3,1,5);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Amount` int NOT NULL,
  `Price` double NOT NULL,
  `MovieId` int NOT NULL,
  `OrderId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_OrderItems_MovieId` (`MovieId`),
  KEY `IX_OrderItems_OrderId` (`OrderId`),
  CONSTRAINT `FK_OrderItems_Movies_MovieId` FOREIGN KEY (`MovieId`) REFERENCES `movies` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_OrderItems_Orders_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,1,39.5,2,1),(2,1,39.5,3,2),(3,1,39.5,3,4),(4,2,39.5,5,4),(5,1,39.5,6,4),(6,1,29.5,4,5),(7,2,39.5,5,5),(8,1,39.5,3,5),(9,1,39.5,2,6),(10,1,39.5,3,6),(11,1,39.5,1,7),(12,1,39.5,3,7);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Email` text,
  `UserId` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'',''),(2,'',''),(3,'',''),(4,'',''),(5,'',''),(6,NULL,NULL),(7,'','');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producers`
--

DROP TABLE IF EXISTS `producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProfilepictureURL` varchar(500) NOT NULL DEFAULT '',
  `FullName` varchar(150) NOT NULL DEFAULT '',
  `Bio` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producers`
--

LOCK TABLES `producers` WRITE;
/*!40000 ALTER TABLE `producers` DISABLE KEYS */;
INSERT INTO `producers` VALUES (1,'http://dotnethow.net/images/producers/producer-5.jpeg','Producer 5','This is the Bio of the second actor'),(2,'http://dotnethow.net/images/producers/producer-4.jpeg','Producer 4','This is the Bio of the second actor'),(3,'http://dotnethow.net/images/producers/producer-3.jpeg','Producer 3','This is the Bio of the second actor'),(4,'http://dotnethow.net/images/producers/producer-2.jpeg','Producer 2','This is the Bio of the second actor'),(5,'http://dotnethow.net/images/producers/producer-1.jpeg','Producer 1','This is the Bio of the first actor');
/*!40000 ALTER TABLE `producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcartitems`
--

DROP TABLE IF EXISTS `shoppingcartitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingcartitems` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MovieId` int DEFAULT NULL,
  `Amount` int NOT NULL,
  `ShoppingCartId` text,
  PRIMARY KEY (`Id`),
  KEY `IX_ShoppingCartItems_MovieId` (`MovieId`),
  CONSTRAINT `FK_ShoppingCartItems_Movies_MovieId` FOREIGN KEY (`MovieId`) REFERENCES `movies` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcartitems`
--

LOCK TABLES `shoppingcartitems` WRITE;
/*!40000 ALTER TABLE `shoppingcartitems` DISABLE KEYS */;
INSERT INTO `shoppingcartitems` VALUES (1,1,1,'2ee71d80-c648-4809-8d30-3dab3159547e'),(2,2,1,'f43b172f-c552-48a0-b349-adcdc5abbbb3'),(3,3,5,'13b414f1-c622-4b99-bf5b-06fca7f24e01'),(4,2,1,'13b414f1-c622-4b99-bf5b-06fca7f24e01'),(5,2,2,'9aa6c2a4-ff60-457f-ac36-93e9a67f7ebb'),(6,6,3,'88aeb680-5d80-404e-bc79-8327b643d851'),(7,5,3,'d58457cb-1dad-4ebf-ac16-987f37e04330'),(8,4,2,'e97d98e2-1969-412d-a667-9aa605f034cd'),(9,1,1,'bd4841ee-2d80-4c5a-b2e0-1821f376a8d9'),(10,5,1,'5bef2467-a6c7-4eae-9977-a77d5da60dcb'),(11,2,3,'38d2925e-6759-4c81-8127-3f2e7f3b4516'),(12,1,2,'703fd8cf-7098-4dc9-9086-142f4c52ee65'),(13,1,2,'a8ccdc9f-9812-4e57-b560-112ebc368e49'),(24,3,1,'096df04a-7ef1-4a47-8e1a-7ef783b799b9');
/*!40000 ALTER TABLE `shoppingcartitems` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-16  3:46:42
