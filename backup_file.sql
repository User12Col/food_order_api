Enter password: 
-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: testDB
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `CART`
--

DROP TABLE IF EXISTS `CART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CART` (
  `cartID` varchar(255) NOT NULL,
  `foodID` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cartID`),
  KEY `foodID` (`foodID`),
  KEY `fk_user` (`userID`),
  CONSTRAINT `CART_ibfk_1` FOREIGN KEY (`foodID`) REFERENCES `FOOD` (`foodID`),
  CONSTRAINT `fk_user` FOREIGN KEY (`userID`) REFERENCES `USER` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CART`
--

LOCK TABLES `CART` WRITE;
/*!40000 ALTER TABLE `CART` DISABLE KEYS */;
INSERT INTO `CART` VALUES ('L2vPddONrScBi7uX2Byv','lKKv6ZzkU21Lh8hA1Wo8',4,180000.00,'eb84fc50-0ca5-1e60-a0cb-9fc15667ff7f'),('L2vPddONrScBiuudwen1','qYDBULAiNM8sKiCkCRPR',1,39000.00,'eb84fc50-0ca5-1e60-a0cb-9fc15667ff7f');
/*!40000 ALTER TABLE `CART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORY`
--

DROP TABLE IF EXISTS `CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORY` (
  `cateID` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY`
--

LOCK TABLES `CATEGORY` WRITE;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
INSERT INTO `CATEGORY` VALUES (1,'Chicken'),(2,'Discount'),(3,'Combo'),(4,'Burger');
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FOOD`
--

DROP TABLE IF EXISTS `FOOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FOOD` (
  `foodID` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unitPrice` decimal(10,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `cateID` int DEFAULT NULL,
  PRIMARY KEY (`foodID`),
  KEY `cateID` (`cateID`),
  CONSTRAINT `FOOD_ibfk_1` FOREIGN KEY (`cateID`) REFERENCES `CATEGORY` (`cateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOOD`
--

LOCK TABLES `FOOD` WRITE;
/*!40000 ALTER TABLE `FOOD` DISABLE KEYS */;
INSERT INTO `FOOD` VALUES ('09KhodRBa3hH2aUDng96','Cheese Buger',80000.00,'','https://firebasestorage.googleapis.com/v0/b/foodapp-7618f.appspot.com/o/categories%2Fxolk9033L6TF2hEHvuoo%2Fcheese_burger.png?alt=media&token=9eab7f34-b9ba-4f2f-9a0e-a2a6f060e6b2',4),('7cmHz6VyvgDMYd35l4lc','Combo Vip Pro',200000.00,'','https://firebasestorage.googleapis.com/v0/b/foodapp-7618f.appspot.com/o/categories%2Fg4PRJAQaDEOQJUAe3V9i%2Fcombo1.jpg?alt=media&token=c453290d-5165-4e95-baa0-f8053f92214d',3),('lKKv6ZzkU21Lh8hA1Wo8','BBQ Chicken',90000.00,'','https://firebasestorage.googleapis.com/v0/b/foodapp-7618f.appspot.com/o/categories%2FBSuUcC8ELv4JSnJPyXux%2Fbbq_chicken.jpg?alt=media&token=06d0b0b0-e807-4393-980d-24846a6b716d',1),('P7gSx2lHwA1RnKqmO8Vv','Combo Burger',100000.00,'','https://firebasestorage.googleapis.com/v0/b/foodapp-7618f.appspot.com/o/categories%2FIreZtPscLsz1CdcN55qT%2F15_discount.jpg?alt=media&token=9f8703d2-0543-4fe6-a836-c1dd003113bf',2),('qYDBULAiNM8sKiCkCRPR','Spicy Chicken',39000.00,'','https://firebasestorage.googleapis.com/v0/b/foodapp-7618f.appspot.com/o/categories%2FBSuUcC8ELv4JSnJPyXux%2Fspicy_chicken.jpg?alt=media&token=2e43b77a-aaf2-4021-b729-36f70b8974d7',1);
/*!40000 ALTER TABLE `FOOD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTE`
--

DROP TABLE IF EXISTS `NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NOTE` (
  `id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTE`
--

LOCK TABLES `NOTE` WRITE;
/*!40000 ALTER TABLE `NOTE` DISABLE KEYS */;
INSERT INTO `NOTE` VALUES ('qnciwcnqicwqcinqwc','Note 1','19/03/2024','Android advance by Vo tran tan loc'),('4518f637-53f3-4c5b-855e-d197be9b0f2b','test','19/03/2024','alo android');
/*!40000 ALTER TABLE `NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER`
--

DROP TABLE IF EXISTS `ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDER` (
  `orderID` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `userID` (`userID`),
  CONSTRAINT `ORDER_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `USER` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER`
--

LOCK TABLES `ORDER` WRITE;
/*!40000 ALTER TABLE `ORDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERDETAIL`
--

DROP TABLE IF EXISTS `ORDERDETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDERDETAIL` (
  `orderDetailID` varchar(255) NOT NULL,
  `orderID` varchar(255) DEFAULT NULL,
  `cartID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderDetailID`),
  KEY `orderID` (`orderID`),
  KEY `cartID` (`cartID`),
  CONSTRAINT `ORDERDETAIL_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `ORDER` (`orderID`),
  CONSTRAINT `ORDERDETAIL_ibfk_2` FOREIGN KEY (`cartID`) REFERENCES `CART` (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERDETAIL`
--

LOCK TABLES `ORDERDETAIL` WRITE;
/*!40000 ALTER TABLE `ORDERDETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDERDETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `userID` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('eb84fc50-0ca5-1e60-a0cb-9fc15667ff7f','Loc','0932447520','TPHCM','loc@gmail.com','pass123'),('eb84fmn4-0ca5-1e60-a0cb-9fc15667ff7f','Kiet','0385218011','TPHCM','kiet@gmail.com','pass123456'),('eb84fmn4-0ca5-1e60-a0cb-9fc156vebeb','Kiet','0932447520','TPHCM','hao@gmail.com','pass123456');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-22  1:31:14
