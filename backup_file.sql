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
INSERT INTO `CART` VALUES ('190f672b-8d44-4e62-a547-33a865cbb2be','7cmHz6VyvgDMYd35l4lc',5,1000000.00,'eb84fc50-0ca5-1e60-a0cb-9fc15667ff7f');
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
INSERT INTO `CATEGORY` VALUES (0,'Bigg'),(1,'Chicken'),(2,'Discount'),(3,'Combo'),(4,'Burger'),(5,'Vo anh hao'),(6,'Pants'),(7,'Pants'),(8,'Voooo anh hao'),(9,'Shß╗ët'),(10,'Vo'),(11,'Vo'),(12,'Pants'),(13,'Clothes');
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `empID` varchar(255) NOT NULL,
  `role` int DEFAULT NULL,
  PRIMARY KEY (`empID`),
  CONSTRAINT `fk_employee_user` FOREIGN KEY (`empID`) REFERENCES `USER` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
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
INSERT INTO `FOOD` VALUES ('09KhodRBa3hH2aUDng96','Cheese Buger',80000.00,'','https://firebasestorage.googleapis.com/v0/b/foodapp-7618f.appspot.com/o/categories%2Fxolk9033L6TF2hEHvuoo%2Fcheese_burger.png?alt=media&token=9eab7f34-b9ba-4f2f-9a0e-a2a6f060e6b2',4),('7cmHz6VyvgDMYd35l4lc','Combo Vip Pro',200000.00,'','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',3),('dsadssdsdadsa','Combo Vip Pro Si├¬u Cß║Ñp Nh╞░ Lß╗ôn',10.00,'sczcxzcxzcxzc','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',10),('lKKv6ZzkU21Lh8hA1Wo8','BBQ Chicken',90000.00,'','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fchicken%2Fbbq_chicken.jpg?alt=media&token=11ff92d9-4fb4-404e-bb07-54c73dc7f75d',1),('P7gSx2lHwA1RnKqmO8Vv','Combo Burger',100000.00,'','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fdiscount%2F5_discount.jpg?alt=media&token=1d0f5de8-9c4e-4c49-b4a5-07fc601e26ea',2),('qYDBULAiNM8sKiCkCRPR','Spicy Chicken',39000.00,'','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fchicken%2Fspicy_chicken.jpg?alt=media&token=9d764b5d-72ec-4205-82a5-6e6f29aefdcc',1);
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
  `date` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `empID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `userID` (`userID`),
  KEY `fk_order_user` (`empID`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`empID`) REFERENCES `USER` (`userID`),
  CONSTRAINT `ORDER_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `USER` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER`
--

LOCK TABLES `ORDER` WRITE;
/*!40000 ALTER TABLE `ORDER` DISABLE KEYS */;
INSERT INTO `ORDER` VALUES ('2b689f92-965d-4d37-9310-c5dab4589577',NULL,'Delivery',0.00,NULL,NULL,NULL),('759affbc-b41b-434b-a5e0-79f5a5f1a405','07/04/2024','Delivered',1000000.00,'eb84fc50-0ca5-1e60-a0cb-9fc15667ff7f','TPHCM','vbqfniwcncqincqi'),('c2517989-49fc-423b-b3d8-0891f990c7ed','07/04/2024','Delivered',418000.00,'eb84fc50-0ca5-1e60-a0cb-9fc15667ff7f','TPHCM','vbqfniwcncqincqi'),('cc893ad3-2f9e-4e74-a67a-510d074539cc','07/04/2024','Delivered',289000.00,'eb84fc50-0ca5-1e60-a0cb-9fc15667ff7f','TPHCM','vbqfniwcncqincqi'),('de38ab8a-2d05-40ef-9819-2873d433a9a2','07/04/2024','Preparing',504000.00,'eb84fc50-0ca5-1e60-a0cb-9fc15667ff7f','TPHCM','vbqfniwcncqincqi'),('ed39c6c5-61c2-437e-9548-45ae7a6b721c','07/04/2024','Preparing',529000.00,'eb84fc50-0ca5-1e60-a0cb-9fc15667ff7f','TPHCM','vbqfniwcncqincqi'),('fefbd43c-2b3e-4d20-8f09-c2c33fdd6615',NULL,'Delivery',0.00,NULL,NULL,NULL);
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
  `foodID` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`orderDetailID`),
  KEY `orderID` (`orderID`),
  KEY `fk_food` (`foodID`),
  CONSTRAINT `fk_food` FOREIGN KEY (`foodID`) REFERENCES `FOOD` (`foodID`),
  CONSTRAINT `ORDERDETAIL_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `ORDER` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERDETAIL`
--

LOCK TABLES `ORDERDETAIL` WRITE;
/*!40000 ALTER TABLE `ORDERDETAIL` DISABLE KEYS */;
INSERT INTO `ORDERDETAIL` VALUES ('37ec954e-3897-4426-9b94-814df2c76cad','c2517989-49fc-423b-b3d8-0891f990c7ed','09KhodRBa3hH2aUDng96',2),('3dea4e06-4405-4f52-b216-0e8d4040da66','2b689f92-965d-4d37-9310-c5dab4589577','09KhodRBa3hH2aUDng96',5),('3e1b6126-1843-4cad-a080-baed63fcb793','cc893ad3-2f9e-4e74-a67a-510d074539cc','09KhodRBa3hH2aUDng96',2),('3e4ea577-a2b4-4461-92ca-c847fab46d8f','fefbd43c-2b3e-4d20-8f09-c2c33fdd6615','qYDBULAiNM8sKiCkCRPR',2),('4258b6b8-1ef7-45b3-b149-e4e076612cec','ed39c6c5-61c2-437e-9548-45ae7a6b721c','09KhodRBa3hH2aUDng96',5),('45e291d3-ecac-4ef5-87a1-a8e311194470','c2517989-49fc-423b-b3d8-0891f990c7ed','qYDBULAiNM8sKiCkCRPR',2),('4c5185a8-e6a1-464d-a901-49cc3ee0816f','cc893ad3-2f9e-4e74-a67a-510d074539cc','lKKv6ZzkU21Lh8hA1Wo8',1),('61ce47c2-a6a1-4ef7-9830-ba58b12cef0a','cc893ad3-2f9e-4e74-a67a-510d074539cc','qYDBULAiNM8sKiCkCRPR',1),('69bf4dc9-9ad2-4964-9d70-affd8de71959','ed39c6c5-61c2-437e-9548-45ae7a6b721c','lKKv6ZzkU21Lh8hA1Wo8',1),('69cf604b-1977-4f3f-8f45-554e0698a541','de38ab8a-2d05-40ef-9819-2873d433a9a2','lKKv6ZzkU21Lh8hA1Wo8',3),('6a30f156-3b34-4a40-8709-928625b972f9','ed39c6c5-61c2-437e-9548-45ae7a6b721c','qYDBULAiNM8sKiCkCRPR',1),('709c83eb-646e-475b-93e2-0b1c62935e77','fefbd43c-2b3e-4d20-8f09-c2c33fdd6615','lKKv6ZzkU21Lh8hA1Wo8',2),('9131feea-ce6c-46cb-8f32-c49344e21d30','de38ab8a-2d05-40ef-9819-2873d433a9a2','qYDBULAiNM8sKiCkCRPR',6),('a326d2ce-905e-4fee-ae0f-9b59579ab298','c2517989-49fc-423b-b3d8-0891f990c7ed','09KhodRBa3hH2aUDng96',2),('af6a5f76-7dc9-45d3-a742-57d05ae88d78','c2517989-49fc-423b-b3d8-0891f990c7ed','lKKv6ZzkU21Lh8hA1Wo8',2);
/*!40000 ALTER TABLE `ORDERDETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE` (
  `roleID` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (0,'admin'),(1,'employee'),(2,'customer');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
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
  `roleID` int DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `fk_user_role` (`roleID`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`roleID`) REFERENCES `ROLE` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('','Kiet','0385218011','TPHCM','kietttt@gmail.com','pass123456',2),('660cff42b7771-660cff42b7772-660cff42b7773-660cff42b7774-660cff42b7775','User1','0338081724','BM, Cß╗ª CHI','user1@gmail.com','20072002',2),('660d01bee373f-660d01bee3741-660d01bee3742-660d01bee3743-660d01bee3744','TR╞»╞áNG Tß║ñN ─Éß║áT','0338081724','BM, Cß╗ª CHI','dat@gmail.com','S!n6EUf_S_Me5Jg',2),('660d01d4218cd-660d01d4218ce-660d01d4218cf-660d01d4218d0-660d01d4218d1','TR╞»╞áNG Tß║ñN ─Éß║áT','0338081724','BM, Cß╗ª CHI','dfsfsfsdat@gmail.com','dattan111',2),('660d0ed41bc3b-660d0ed41bc3c-660d0ed41bc3d-660d0ed41bc3e-660d0ed41bc3f','Admin','0338081724','BM, Cß╗ª CHI','ho20072002@gmail.com','S!n6EUf_S_Me5Jg',2),('660d0f0fed8c0-660d0f0fed8c1-660d0f0fed8c2-660d0f0fed8c3-660d0f0fed8c4','Admin','0338081724','BM, Cß╗ª CHI','tandat@gmail.com','20072002',2),('660d176164a5f-660d176164a60-660d176164a61-660d176164a62-660d176164a63','Phß║ím Quß╗æc ─Éß║ít','0338081724','Tß╗ënh L├áo Cai, Huyß╗çn Bß║»c H├á, X├ú Tß║ú Cß╗º Tß╗╖','datdaucac@gmail.com','20072002',2),('660d21786d4c9-660d21786d4ca-660d21786d4cb-660d21786d4cc-660d21786d4cd','L├¬ Gia H├áo','0338081724','Tß╗ënh L├áo Cai, Huyß╗çn Bß║»c H├á, X├ú Tß║ú Cß╗º Tß╗╖','haole@gmail.com','20072002',2),('6610d62493c16-6610d62493c17-6610d62493c18-6610d62493c19-6610d62493c1a','LocShaDow','0338081724','BM, Cß╗ª CHI','locshadow@gmal.com','123456',2),('6610e131955fb-6610e131955fc-6610e131955fd-6610e131955fe-6610e131955ff','Datdaucuc','0338081724','BM, Cß╗ª CHI','locsdsadhadow@gmal.com','123456',2),('6611021d3ae58-6611021d3ae59-6611021d3ae5a-6611021d3ae5b-6611021d3ae5c','ConCho','0338081724','BM, Cß╗ª CHI','conchosadhadow@gmal.com','123456',2),('eb84fc50-0ca5-1e60-a0cb-9fc15667ff7f','Loc','0932447520','TPHCM','locc@gmail.com','pass123',2),('eb84fmn4-0ca5-1e60-a0cb-9fc15667ff7f','Kiet','0385218011','TPHCM','kiet@gmail.com','pass123456',2),('eb84fmn4-0ca5-1e60-a0cb-9fc156vebeb','Kiet','0932447520','TPHCM','hao@gmail.com','pass123456',2),('example_user','user@example.com','0338081724','HN','hao01638081724@gmail.com','pass123',2),('vbqfniwcncqincqi','admin','0909090909','TPHCM','admin@gmail.com','admin',0);
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

-- Dump completed on 2024-04-11  5:16:04
