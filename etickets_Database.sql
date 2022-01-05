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
INSERT INTO `__efmigrationshistory` VALUES ('20211129123807_Initial','5.0.12'),('20211130181427_Initial','5.0.12'),('20211213231254_Initial','5.0.12'),('20211213235101_ShoppingCartItems_Added','5.0.12'),('20211215230241_Initial','5.0.12'),('20211216140629_Identity_Added','5.0.12'),('20211217102939_Order_And_OrderItem_Added','5.0.12'),('20211217104650_ShoppingCartItem_Add','5.0.12'),('20211229165201_.','5.0.12'),('20211229165306_Identity_Added','5.0.12'),('20211229172713_Identity_Added','5.0.12'),('20211229173234_Identity_Added','5.0.12'),('20220105145623_.','5.0.12');
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
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(150) NOT NULL,
  `ClaimType` text,
  `ClaimValue` text,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(150) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` text,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('218f125c-7b50-488c-ae96-4a35ce8951fa','SuperUser','SUPERUSER','2f3a64d8-cf2f-47ef-81cd-e5d96f8fd520'),('38fa7685-72e1-4e49-8e31-36180831996e','User','USER','bbaa92fa-fd87-4e32-97d8-661eed26a8f7'),('65ea204b-7ddc-4ec1-a36a-d6bd991ad51f','Admin','ADMIN','66ad0091-65e2-48b6-9cd5-98bd37ee6949');
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(150) NOT NULL,
  `ClaimType` text,
  `ClaimValue` text,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(200) NOT NULL,
  `ProviderKey` varchar(200) NOT NULL,
  `ProviderDisplayName` text,
  `UserId` varchar(200) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(150) NOT NULL,
  `RoleId` varchar(150) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES ('1188c975-111d-4cd5-a20f-28a9bbf4a7c0','38fa7685-72e1-4e49-8e31-36180831996e'),('b719ce15-acab-49dd-b96f-bd4dac0f797d','38fa7685-72e1-4e49-8e31-36180831996e'),('842a7e77-626b-4e61-9fa0-a93255857cd3','65ea204b-7ddc-4ec1-a36a-d6bd991ad51f');
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(150) NOT NULL,
  `FullName` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_staff` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` text,
  `SecurityStamp` text,
  `ConcurrencyStamp` text,
  `PhoneNumber` text,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` timestamp NULL DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('1188c975-111d-4cd5-a20f-28a9bbf4a7c0','Application User',1,0,0,'app-user','APP-USER','user@eTickets.com','USER@ETICKETS.COM',1,'AQAAAAEAACcQAAAAENJGytqomIKmtWxASZL3iMjpuBWOqYUkcECXMro5lXaQK60cUTTh7lKj19cyDkNaoA==','ZWV4FW2RI6NMLB5ONU7464LN2ZIYS7A5','51d065f0-0804-4080-85b2-bab02633768d',NULL,0,0,NULL,1,0),('842a7e77-626b-4e61-9fa0-a93255857cd3','Admin User',1,0,0,'admin-user','ADMIN-USER','admin@eTickets.com','ADMIN@ETICKETS.COM',1,'AQAAAAEAACcQAAAAEFGmlyJumUbwKdjPCIww1ehTcYGcZbtV75xCLCPfG0jMcmGOGcdfBokKMm4E2/QihQ==','3SHNH2G5GNKBTAPBIN2OMHFQIEABUEJJ','c1f2d0c3-0722-4dd2-b298-5e82fc096dcb',NULL,0,0,NULL,1,0),('b719ce15-acab-49dd-b96f-bd4dac0f797d','Mohamed Hamdy ',1,0,0,'mohamed547754@gmail.com','MOHAMED547754@GMAIL.COM','mohamed547754@gmail.com','MOHAMED547754@GMAIL.COM',0,'AQAAAAEAACcQAAAAEJddd2xowWnuFdKeyBpTAwRY4+BEyqTavQonjRb1pFT2QpKCkrT/cQRQaXLMvvAMUg==','FGGARM76I7ROVADUIJMTIJFZU2OU2C2H','bac68d43-c884-4d47-a0de-6da3ddf343da',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(150) NOT NULL,
  `LoginProvider` varchar(150) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Value` text,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
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
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Amount` int NOT NULL,
  `Price` double NOT NULL,
  `MovieId` int NOT NULL,
  `OrderId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_OrderItem_MovieId` (`MovieId`),
  KEY `IX_OrderItem_OrderId` (`OrderId`),
  CONSTRAINT `FK_OrderItem_Movies_MovieId` FOREIGN KEY (`MovieId`) REFERENCES `movies` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_OrderItem_Orders_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (14,1,39.5,2,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (9,'user@eTickets.com','1188c975-111d-4cd5-a20f-28a9bbf4a7c0');
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
  `ShoppingCartId` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ShoppingCartItems_MovieId` (`MovieId`),
  CONSTRAINT `FK_ShoppingCartItems_Movies_MovieId` FOREIGN KEY (`MovieId`) REFERENCES `movies` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcartitems`
--

LOCK TABLES `shoppingcartitems` WRITE;
/*!40000 ALTER TABLE `shoppingcartitems` DISABLE KEYS */;
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

-- Dump completed on 2022-01-05 17:23:14
