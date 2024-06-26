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
  `isDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY`
--

LOCK TABLES `CATEGORY` WRITE;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
INSERT INTO `CATEGORY` VALUES (0,'test',1),(1,'Chicken',0),(2,'Discount',0),(3,'Combo',0),(4,'Burger',0),(5,'Desserts',0),(6,'Pants',1),(7,'Pants',1),(8,'Voooo anh hao',1),(9,'Shß╗ët',1),(10,'Vo',1),(11,'Vo',1),(12,'Pants',1),(13,'Clothes',1),(14,'CC',1);
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
  `image` varchar(1000) DEFAULT NULL,
  `cateID` int DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
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
INSERT INTO `FOOD` VALUES ('026bd130-8d16-4ac3-94bd-70329a3d8e52','MUA 1 Tß║╢NG 1 THß╗¿ 2 Tß║áI Cß╗¼A H├ÇNG Combo So Cute',179000.00,'+ 02 G├á Charsiu + 01 Burger G├á Fillet','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',3,0),('07314457-b071-40bc-984b-4129f4e9a028','DEAL GI├ÆN TAN CUß╗ÉI TUß║ªN',149000.00,'GIß║óM 66K COMBO CUß╗ÉI TUß║ªN','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/discount/PPWEEKENDCOMBOPOPUP.png?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=CFYGzRE6qOFZhDfsUyIEHs1%2BchFyiUH29TRL8GcxiEQoHuuhEZVZoW19z2UGHUQdvP5%2FZgA%2Bt0%2Fr%2FM%2BA4jyuwGoAhq46UA2TSNG3%2BKUKab7TCQYFSpIGsXN0uyIzRq1K2TTfIwpd97bpDEWORsIxe2Lkbyh7AQ7H5DC1%2BAz1ypcppJGoBsPmaZBrOyhmlEqOhEysQNijeGYmg5brE3HUonESqXlaJS%2F32PA5Yrzjkj%2B%2FrtSqCOa%2FyQBLljqbI0DInvGvYtwT1aPYrvTZd8xhtq%2FflQadCq9xiRNeU4QDoTWZWAcpTTOIEt1cmWL1bQiDNiPO9Xnh0rcnKj6vYZcwww%3D%3D',2,0),('0790b2bf-8d44-4deb-9c9b-8e4bf3973100','Khoai t├óy Chi├¬n (Vß╗½a)',28000.00,'Khoai t├óy Chi├¬n (Vß╗½a)','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/desserts/Fries.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=jatadnD0Ls2nK4EMOHK2SQocQpH42I5qsHiWl6DOEE4pO2rojaVoPzYea8r7to2lC8%2FrWQociZzYitWTtGzNeTCvmdVJWEUZWVPO3IXwEcP1kRHF%2Fr5UtOO8s9t2VK03PquGrneng9PHGHYA0sCRt2rnE8kwoVu4AL3u%2BxFBcScxRtcpq19pfbfx8jgijeq0N34lYJYWLAm8gNdRzTMKpsBu2QxHmb3lcRfjBf8DZufnxBBTBiLPWw540CXaqT1WHCkcORe15H9FJYJnFo5x8VS2u0rT3wlGOa7USPJZqMavouwouCMtVRJ4CtoAbyezXl07W2EOTVs58imk5Q4Z%2Fw%3D%3D',5,0),('09KhodRBa3hH2aUDng96','Cheese Buger',80000.00,'','https://firebasestorage.googleapis.com/v0/b/foodapp-7618f.appspot.com/o/categories%2Fxolk9033L6TF2hEHvuoo%2Fcheese_burger.png?alt=media&token=9eab7f34-b9ba-4f2f-9a0e-a2a6f060e6b2',4,0),('2c347462-daf8-40b3-a8bb-8260152d0fdb','Burger C├í',53000.00,'Burger C├í','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/burger/CajunFishBurger.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=FCFE0Lsl%2F7l%2BCjkOsPrEg10Zrcw5sni%2Fsjhaer6Psq%2FZVu%2BzPdcaJVWmttjudF3FWyGCpaZXEzt76IlEM4B99gmN16kzzwHklVN633vrSaT9CCyW%2FrWtThfEJRzgSPJJXE53yX2GkTqeUuQj1m6nih4SSjwLHTXj0sIZzbHJf7TTJfCS7AbjAaM4AIJaCE338h0ig4i5ZkaJ3CETc2bhwJ7D3gK1vH9koDadfDce6SkY%2B%2B4bNWZaczryrFT3UNtMaeVINCG5oux%2BOXFoIQty%2FoeE3N9NbTFc78ymjtXs3riDY1l%2FLn4E%2Fxra46oLHPiotqftr2XpX4PkTHuW5A1UDQ%3D%3D',4,0),('3b40c4ea-7629-4b33-bc1f-789252d9d66f','Burger T├┤m',45000.00,'Burger T├┤m','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/burger/ShrimpBurger.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=m5GCDL6a7Oj6JhOvvC7QAf6%2FTeD2oFv4xYzMF%2FwfVcCTDcQ%2BZqXSoKYQHJM3cY4L84IgkU01NZvQ%2FS6uwTN7EGWcYkED0JafZAQuUIZhvJlI9PUNVUcOVDI3%2BlYZvGgt5uCPzuhCU62H2zl5HtFvSrGu91DFOUe0X%2FE2UuAXQtVCAj5geWGmpV8FSkBC9TTJ4mJ1LFuAXiupylBpsLI3jJldlj9iykVh34zLazqVA0MDKPA400t9me7EZX5ncN2OzASlaGKNEb7WYoCW7ns0D4pRkUzrypxbIe6ZR%2FENK2fSebTLBj8gh0pKz61kWTg2T9WC74cWJdr18cOeG5XH1A%3D%3D',4,0),('3fa05a84-ed5e-4b02-9d1f-93f8cf1c0af6','1  Miß║┐ng G├á Tß║»m N╞░ß╗¢c Mß║»m',44000.00,'1  Miß║┐ng G├á Tß║»m N╞░ß╗¢c Mß║»m','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/chicken/08072022_040934_1pcGTNM.jpg?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=gxW4AsWC0d26CTgnoB3uwepwmT79U07S%2B7jy%2FSQgE5Nm5%2F9sQbVqQzBW01tc5GzCyQGGxJ80AF82%2BuE2FOaOQSGVpcL2K41JM4vXvawXbzbA3OQVaFk34mlyceEridLpnOURPWs6XOfNhnbni8nQZ3fPNxktNuyWB1%2FBDdgKqI08Op1XyZB%2BfSGd9YxPhthEHxD52Hfn%2BVUKQ2%2BLgEBNwN7aYtys%2F%2BAnh1LtQLHNjtKq70trCsoBPrnDeEj06yOAnVcXH99lyLvYQGKgjdlVfB9F4bgbktbazUoLke4C8MAiNaQtYh3BrYg3gwZiS0Cmdq1tLEhTRYYNEvks%2FP8KEA%3D%3D',1,0),('3feb1b71-962d-4db2-9407-69b32e742977','1 Miß║┐ng g├á gi├▓n',37000.00,'≡ƒöÑ THß╗¿ 2 ╞»U ─É├âI ─Éß║¼M S├éU ≡ƒöÑ\r\n1 Miß║┐ng g├á gi├▓n','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',1,0),('4484b18f-54c6-4747-a883-a3b8abe2ddae','4 B├ính Khoai Lang',28000.00,'4 Miß║┐ng B├ính Khoai Lang','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/desserts/Banhkhoailangdua.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=h6wpP31Wu19yS0Y5HA5JnF3HlLhzJJE%2Fmw3rPz%2Fsbh%2BoGHeYGVsun8mAYeAPFxE0H5w4qg%2FcLebpRte1QPy25PGLM34QfewfQrwqa5TH2R1Iz1yJSzQplPMo0NqfJI9C26QnRKYeAtjzr2zArOklUKtCcS397Z1tKhvISDvT0c61lNDr2fY%2BIzYW74vhmiVyOU8DR%2FWF7PaFTMnik6I%2FkTOz2H7b4dgEer5B6LHcjFyZSnsKVbJcTJn6RPks7l7IkucIxb%2FTv7vZ5a9XohVBdfSz24DBQKcCwFJpwLPDeYvAdkSEPZl2bVGcQt0EVwKhoSmII0xYfNdoVOuqEAMknQ%3D%3D',5,1),('525b3a03-09d4-4732-9b00-d8e20dab90ce','MUA 1 Tß║╢NG 1 THß╗¿ 2 - DUY NHß║ñT Tß║áI Cß╗¼A H├ÇNG',63000.00,'≡ƒöÑ THß╗¿ 2 ╞»U ─É├âI ─Éß║¼M S├éU ≡ƒöÑ','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',3,0),('6495736b-adbf-415b-ae8a-53a460faca8e','Burger G├á Phi L├¬',48000.00,'Burger G├á Phi L├¬','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/burger/ChickenBurger.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=ka%2BjGHt%2BW7sAzHtMjMNRk8V14Uk5mfQ%2FM%2FB5WnfKiSbsP7DkYiZ7ZSnmyXxM1Q%2B3lf4z21FAIHkVlenWkYpyx7K6D%2FGOeb9Mxevae7imRZxu58OH2sWb%2FueFMbiAqjOaf4dTWXV74qlYb4dm%2FU05SFdiihpoeT%2FROPTaZFyNYcIbvsscmoFQMHQKIZ9UFoN4N9%2BALDjzbujS85AuLpzfHLbij%2FWj3MgldsDbPViEAsAgrSQu7cPp17dWZT%2B8GDyuPeFVdkm8rlXv%2BoGsFk%2BCBpPp6AfQXFFN9xhVRSbAWhPa9Url9G%2BfzM06HlT1pfd5kW%2Fhuw6XSfxY9g1ZyI%2Bq%2Fg%3D%3D',4,0),('67cb3bce-f32e-4c23-866e-5a4d59969147','Combo Tiß╗çc G├á Hong Kong Char Siu 131K',206000.00,'Combo Tiß╗çc G├á Char Siu 131K: 4 Miß║┐ng g├á Hong Kong Char Siu 2 N╞░ß╗¢c ngß╗ìt','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/combo/CbCharSiu131krt1_1.png?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=gT2e%2BwUbTePyxe%2BKI7ko9qmQrPJGk%2F%2Fwt2sp3py5IKRFLmlzUIq4HDc2xGqJ4jqq3imETL1UZQGVgdzRkyl6oeuuFT305Nd8GLtWzyGRHrG%2Bimq0xP2UFg4Yle6pNwbPefAU73im23bOhfDKDCr5mOanNzk3zXL9PNcz%2FcIXxsippsEzl03Ghy00W%2BYzXfZkx%2B8LjtVSmyPfv2DXSjA25OzoH66jOmU7rZq5Zb7DBTPLSFO%2FOqxtjSoXPvkgYNqSVG3rGbRPbzZH3KtDbRsV6PwpBxsAF%2FtwDyFznPJzJAWr3Ad8Wz0q6acHrrFlMOtI6fsjm9Ixl4wHyKoOlIyRGw%3D%3D',3,0),('76d524e4-cbe9-43ec-9a4f-033f32cee4d3','Hß║╕N H├Æ TIß╗åC G├Ç CHß╗ê Vß╗ÜI 99K',99000.00,'COMBO Hß║╕N H├Æ TIß╗åC G├Ç CHß╗ê 99.000─É','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',2,0),('7cmHz6VyvgDMYd35l4lc','MUA 1 Tß║╢NG 1 THß╗¿ 2 - DUY NHß║ñT Tß║áI Cß╗¼A H├ÇNG Combo Vip Pro',200000.00,'Happy Meal 1 79.000─É: 01 Khoai + 02 G├á Gi├▓n + 01 N╞░ß╗¢c','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',3,0),('82d68496-492a-46f3-9a4c-9b8493714d26','G├á Hong Kong Char Siu kh├┤ng x╞░╞íng',64000.00,'3 Miß║┐ng g├á gi├▓n kh├┤ng x╞░╞íng & Xß╗æt Hong Kong Char','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/chicken/3TendersCharSiu.png?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=lztFaRyuvWtx6UUprS%2FProit66FoVioqP7MTFR%2FtNtudagRPXT5aYtl7B%2BI0zF4G63SYyB0eC8aVyel6IllZWg8AHKX%2FSx6ib5T6gQdiLQNALOIb%2FXRckFdhBDCidbAlVy4RJOTJfB0l%2FiW05gv7987yNaUDutZoc%2F8mnmh7UGMhF5L8w4tEJQeAZy5kMLcU94jJEq52ZfKHlb0T7n2N3R%2Fp09dVTGOt3MNBfXeLmj1J3jQwAIQb44bNb57y%2F%2BgW2MpItAR%2FDhswoleVaPvsXDXUXyQ8IKeOjKCWsYCd2D%2FKbxQ1lqHQnReTI6UG1NI3GFdANAHuoYyeSbcfwcfzJg%3D%3D',1,0),('8352e1c2-a298-43a6-bdda-1f613de01405','4 Miß║┐ng B├ính Khoai Lang',28000.00,'4 Miß║┐ng B├ính Khoai Lang','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/desserts/Banhkhoailangdua.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=h6wpP31Wu19yS0Y5HA5JnF3HlLhzJJE%2Fmw3rPz%2Fsbh%2BoGHeYGVsun8mAYeAPFxE0H5w4qg%2FcLebpRte1QPy25PGLM34QfewfQrwqa5TH2R1Iz1yJSzQplPMo0NqfJI9C26QnRKYeAtjzr2zArOklUKtCcS397Z1tKhvISDvT0c61lNDr2fY%2BIzYW74vhmiVyOU8DR%2FWF7PaFTMnik6I%2FkTOz2H7b4dgEer5B6LHcjFyZSnsKVbJcTJn6RPks7l7IkucIxb%2FTv7vZ5a9XohVBdfSz24DBQKcCwFJpwLPDeYvAdkSEPZl2bVGcQt0EVwKhoSmII0xYfNdoVOuqEAMknQ%3D%3D',5,0),('89751a6e-7b32-4d90-b885-181ebbb12e77','Chß║ú c├í rong biß╗ân (Vß╗½a)',38000.00,'Chß║ú c├í rong biß╗ân (Vß╗½a)','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/desserts/Chacacuonrongbien.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=avKlU4Got4E%2FV%2FrzwCbgv0JRs2yt6%2BnRCEE0FswhWwp8IT1sKbd4UREWWrE6kmIwW4qf3pd6%2BsE1hZg7Hlw%2FtwJDh8Ps5aYgjRB7xtGo1d8HZ3vg%2FrtA8LC648jGGwWysPH8lJtpRwnBZrcDti3vZaoxoE0D6J28gWRfgQv02wLsC0mT0G8dF7wBG35eqNALtYTUX%2FY7GV8ZTrveoH9Rb188WGDP8L8j75ThmU8KmuQvuXXV80ru%2FUV1ncjTBlZVBtj4ZoiLwEX4gx9fRSJQlbjYthJjYotO6%2BSdKZRNFQ0SasCCmVDt%2FkEF50eS2BcKBWDEofLVwuzZ2bvEqT%2BYSg%3D%3D',5,0),('9c291754-42a2-4aef-a671-561b43ec56d4','Combo So Chill',284000.00,'+ 03 G├á Charsiu + 03 Tenders Charsiu + 01 M├¼ ├¥ + 02 Cheese Tart + 03 N╞░ß╗¢c ngß╗ìt','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/combo/Combosochill.png?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=GCnVvpLA1m6BP40unnbo3ZEXpEuBKtdvUIrxPDr2r3LzNX49skMGxlYa4PF7DZoidTRMHLV%2FKz%2BsMVESuTvYwaei7aVk7xAk%2BHltIPOlqIEcz2ZMjSnwuNHxKLmkOkj7XJM6Wlbdl5ut3Nhufm3wiFcI2BsA9ZEVZsl5Jvhls7xMcHch7UcwHdir8HYvMsj4IsLf5D6AagRJe5LgxQhuMlUEnLaIi1faMY5SX78DV1N3EjvDSYXzf7F6dR79m8kunP85yYCFX3IZupxOYheZ0CHqAVosIeHqSR0Geq9JhYtnQnWP%2F%2BUzGmkX%2FVElo98LLKHr11LBUN8wLzjh6vWi0g%3D%3D',3,0),('9ee07e0f-36a8-47ba-ae41-7dd4902a0563','Snack Mß╗▒c (Vß╗¬A)',44000.00,'Snack Mß╗▒c 4 miß║┐ng (Vß╗½a)','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/desserts/4pcsCalamari.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=fs%2BrGcW1hQVPBph5FrA1cxJtA1ObakraDl1MYKT%2FXCcURd27dMJYlnBHOccXwNWEdGrP721DXQFWMW9WZL8R%2BmyTQQ6%2Bb3tPqxCEpeU2woMPg0imN%2FtNI5BG3uNa1FHiXz%2BWysE0Hm2rOaHFaQX7C7IX1TaSPjJlhziQzPbtSzRFAgY8eBz9o70nhpT1zjAKmlRswDABgy0mHADVXVjkgyWw556OqKKM2RyGYBVFo8BoDrRbGzQt5gOOmtxR%2BzW8EZAHJ9DaJzLaPF0j4DXVJkPqU4yBaLcCilqMtb4J4HcDnYMfn8owO5WtvScv1EJGNbB%2FMR1JBzIXDXfo1KuZ7A%3D%3D',5,0),('a0acced8-2ca7-49cd-aa14-2bd7a329a2e8','G├á Hong Kong Char Siu',44000.00,'01 Miß║┐ng g├á Hong Kong Char Siu','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/chicken/1BICCharSiu.png?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=JWRJWZXNbEdIQiKRcU9BfPuI9maFknsKKBWNSHBrx4RqHpk7Aa1U%2B0ulc6DEmjigk5W6MZszF8SzBzAp9gvpBW4kUIrkagcMGBNg71xO%2BoqLOD1g13E7aj5osBPUIVDhlIY6HT8kayFOZrbknGWLZQlMAQmHBE7jK54T7CaBBUWxT4Xdp4g1LJlpZtt6uBWm9UJBgPBZMtmVlcFGM6KkonMW1bp5l48U%2FLMMbY9e63eTFwWfaL2UcBpPZzJotksrqJIl4euzqOv%2BbvXihqMjwr01%2FCQ4nGpmarl0ctt9Zh%2BRQG1FGK7dMmqeFfLxq0wtVgCYGyUqQDFZcOq2xCekzg%3D%3D',1,0),('a83be614-aefa-4d7e-b2c9-101d3e80612f','01 B├üNH CHEESE TART',25000.00,'01 B├ính Cheese Tart','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/desserts/1Cheesetart.png?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=IjBagnR3DEE5IpvsRGy1%2FvACrra2Ixvcmel1NmI5eVF6CLsydkQ2fAyw%2BzScV1NRZYzZkU8kFk9iX1aLUZSIH%2Fe4eb5Pobb6q94N%2B1aTdvXfMHWKU6vbx%2BlGtRMPwVxmgFa%2Fg8B4g4K84fBTv5hh%2BVpmKbFl4FZsCWtLvip0l4UkrdCCMdwsxREdC%2BhrPOJLgk7AHzl7NiuYU4Fq%2BJof8I9Dsh0d%2Ff0AHloqTSQMSzL%2BMJST%2Ff0bdV9rHH6fG2s12Dcq2jzEGRLTGP5c4Ni0XEP6pwuiWLKplJFkUZBBOeAw9QQAo7ju2u2Ywl3tbothDyW7UTtqyrM70f1fKOiwZw%3D%3D',5,0),('aa4aa35f-fcc0-48a1-84c2-aa58b497987a','4 Miß║┐ng Snack C├í (Vß╗¬A)',35000.00,'4 Miß║┐ng Snack C├í','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/desserts/4pcsFishnugget.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=PmYHgkvwQ1zivP%2F4Lyb7LQ%2BM8BFamz1Vw014TiCqk8X66r6z%2FLL30WVy%2BmoDcuX%2Fy0GwxNx1AXgUCQr3hRDqJTuN4eywL63sB2lJv%2FqUeq8YcGpOPhcLQRoh1jmdcut9n0o8AT9NybhXMHRsbek2wHU3nI5u87H5XPAoMxnCaaHB09NIr0QiVf8Bl3mzFY5tTuOtOl5hC4h94kHQma7oyGGjoydo%2FaeIu9kLpZZfMhFuAYOt1NU4GNjFVelVVvcHAwpT2k564kj7BKLwAHci%2F7LTQSfc5la8ps0nmo5ZfshVfTNsfL1dVzGLo7nRqKSdAXGeVUz2TXNXwWCI87c0gA%3D%3D',5,0),('b5d5c504-9000-4e64-8316-ba5bc6f86ad0','G├á Hong Kong Char Siu Popcorn',30000.00,'01 G├á Popcorn & Xß╗æt Hong Kong Char Siu ngon gi├▓n ─æß║┐n miß║┐ng cuß╗æi','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',1,0),('c5a6a6f2-21b4-44d9-ae8b-cc0d2ca0e7c6','HAPPY MEAL',179000.00,'Happy Meal 1 79.000─É: 01 C╞ím BBQ + 02 G├á Gi├▓n + 01 N╞░ß╗¢c','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/discount/PPMealdeal79_99rt1_1.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=gOJiHhwluafGAp9OByAvWuIfHgjxqyz8IPWYmSUhF4X37gGtL3cW5mOpNiX5I4kDQe7fHrIJf0juVFNGWmyex3Ry%2BvsmOQm5AxwdpRvW%2BWh1iyMdcpAZtWvioRjHHO9JVzl71GG%2Ftor7IJw9n0TOUgLGapPt3FwK7rvn6o56Rkr%2BY5VrUdhOYUhb9Pcd2u6dvNHre1ouStfd35UXV%2BOPgMscKJVeHpAmkGgQ05Hfi88N6Jrk9lZW7q%2BwZg1U5hc38Jvy3cRkRz1KQ41D6LxaR935tmZ%2BOR%2FSQqEe7MKVkenyM6nl0nViC1VnhTdA5NZbjujlxn6OGlEiNqgUEYw4mg%3D%3D',2,0),('f3d88776-e267-47f0-965f-210bc6db5cfe','B├ính Khoai lang',28000.00,'B├ính khoai lang nh├ón Dß╗⌐a/ Ph├┤ mai (3 vi├¬n)','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/desserts/Banhkhoailangdua.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=h6wpP31Wu19yS0Y5HA5JnF3HlLhzJJE%2Fmw3rPz%2Fsbh%2BoGHeYGVsun8mAYeAPFxE0H5w4qg%2FcLebpRte1QPy25PGLM34QfewfQrwqa5TH2R1Iz1yJSzQplPMo0NqfJI9C26QnRKYeAtjzr2zArOklUKtCcS397Z1tKhvISDvT0c61lNDr2fY%2BIzYW74vhmiVyOU8DR%2FWF7PaFTMnik6I%2FkTOz2H7b4dgEer5B6LHcjFyZSnsKVbJcTJn6RPks7l7IkucIxb%2FTv7vZ5a9XohVBdfSz24DBQKcCwFJpwLPDeYvAdkSEPZl2bVGcQt0EVwKhoSmII0xYfNdoVOuqEAMknQ%3D%3D',5,0),('ffdeaf35-47fc-40c2-9d47-770d0585119a','G├á Popcorn',24000.00,'G├á Popcorn','https://storage.googleapis.com/food-order-ccdab.appspot.com/food/desserts/Popcorn.webp?GoogleAccessId=firebase-adminsdk-knvsq%40food-order-ccdab.iam.gserviceaccount.com&Expires=1924905600&Signature=WjnH0gyLUxALXVSAQghYQLLo2o6Mtb1SB%2B2QI4gZPxQC1HYzCqdGOaaWwc1LkX53QqST5fSAbMiCulEP%2Be6VHnBrFnkBah1q52lMrdGDfoPcjXxeLZQ%2F8fixqTPkFyHCu8C1Szq1NDiA7JweU%2F0gmVAtYFouzsgn%2BYTtqn8tQB2IDcNjoQ1Eeul0pjAVr0BdmZMXEdY%2Bx2hwILtjmnivJeXs59mcOoElUIrgZV7OteOG4ThrxnYAGl5r5Qwet3RbUTJxu2wiWtvBDWOwjLotsjpMEioe46IoNom8rBHJ32UkALvH2a%2Bbfrp%2F0fzyuI3M8gaSwsRhbZ8%2B3d3Q2nHPQg%3D%3D',5,0),('lKKv6ZzkU21Lh8hA1Wo8','BBQ Chicken',90000.00,'Happy Meal 1 79.000─É: 01 Khoai + 02 G├á Gi├▓n + 01 N╞░ß╗¢c','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',3,0),('P7gSx2lHwA1RnKqmO8Vv','Combo Burger',100000.00,'Happy Meal 1 79.000─É: 01 C╞ím BBQ + 02 G├á Gi├▓n + 01 N╞░ß╗¢c','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',2,0),('qYDBULAiNM8sKiCkCRPR','Spicy Chicken Hong Kong',39000.00,'01 G├á Popcorn & Xß╗æt Hong Kong Char Siu ngon gi├▓n ─æß║┐n miß║┐ng cuß╗æi','https://firebasestorage.googleapis.com/v0/b/food-order-ccdab.appspot.com/o/food%2Fcombo%2Fcombo1.jpg?alt=media&token=318cd2a7-adff-4d49-82c8-d694a846b791',1,0);
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
-- Table structure for table `NOTIFICATION`
--

DROP TABLE IF EXISTS `NOTIFICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NOTIFICATION` (
  `notiID` varchar(255) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`notiID`),
  KEY `userID` (`userID`),
  CONSTRAINT `NOTIFICATION_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `USER` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTIFICATION`
--

LOCK TABLES `NOTIFICATION` WRITE;
/*!40000 ALTER TABLE `NOTIFICATION` DISABLE KEYS */;
INSERT INTO `NOTIFICATION` VALUES ('37df6d20-a849-46cb-9981-3b1d528840a4','08/05/2024 10:00:20','─É╞ín h├áng 64850a1e-e6cd-4e4e-85a8-9baa30e656f6 ─æ╞░ß╗úc ─æß║╖t th├ánh c├┤ng','49075d49-dcce-4770-8ab6-2ca0c99ba46a'),('573a3e97-d17c-4f2d-bc3d-0a106405379e','08/05/2024 10:00:38','─É╞ín h├áng 927bc844-fbf7-4076-9c4f-ba2186d33f4b ─æ╞░ß╗úc ─æß║╖t th├ánh c├┤ng','49075d49-dcce-4770-8ab6-2ca0c99ba46a'),('a2423ea5-7426-4da7-a1a6-5f9831d8dc12','08/05/2024 12:59:44','─É╞ín h├áng 716d0040-5e6d-421a-a139-4fad46015596 ─æ╞░ß╗úc ─æß║╖t th├ánh c├┤ng','49075d49-dcce-4770-8ab6-2ca0c99ba46a'),('e0605383-2835-47a8-95e0-067fd57a5cc6','08/05/2024 01:10:04','─É╞ín h├áng 3abfff4c-8e0c-45c2-a04f-a3803c3ee334 ─æ╞░ß╗úc ─æß║╖t th├ánh c├┤ng','49075d49-dcce-4770-8ab6-2ca0c99ba46a'),('fea39ffb-6d0e-4082-9cd1-5d2aeff65440','08/05/2024 10:00:05','─É╞ín h├áng 82c44b53-5694-466c-be43-6bf3b189124a ─æ╞░ß╗úc ─æß║╖t th├ánh c├┤ng','49075d49-dcce-4770-8ab6-2ca0c99ba46a');
/*!40000 ALTER TABLE `NOTIFICATION` ENABLE KEYS */;
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
INSERT INTO `ORDER` VALUES ('3abfff4c-8e0c-45c2-a04f-a3803c3ee334','08/05/2024 01:10:04','Preparing',80000.00,'49075d49-dcce-4770-8ab6-2ca0c99ba46a','TP.HCM','vbqfniwcncqincqi'),('64850a1e-e6cd-4e4e-85a8-9baa30e656f6','08/05/2024 10:00:20','Delivering',216000.00,'49075d49-dcce-4770-8ab6-2ca0c99ba46a','TP.HCM','vbqfniwcncqincqi'),('716d0040-5e6d-421a-a139-4fad46015596','08/05/2024 12:59:44','Preparing',99000.00,'49075d49-dcce-4770-8ab6-2ca0c99ba46a','TP.HCM','vbqfniwcncqincqi'),('82c44b53-5694-466c-be43-6bf3b189124a','08/05/2024 10:00:05','Delivered',424000.00,'49075d49-dcce-4770-8ab6-2ca0c99ba46a','TP.HCM','vbqfniwcncqincqi'),('927bc844-fbf7-4076-9c4f-ba2186d33f4b','08/05/2024 10:00:38','Preparing',194000.00,'49075d49-dcce-4770-8ab6-2ca0c99ba46a','TP.HCM','vbqfniwcncqincqi');
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
INSERT INTO `ORDERDETAIL` VALUES ('5de0ad70-95cf-45e6-9b5a-46fd709629b0','927bc844-fbf7-4076-9c4f-ba2186d33f4b','0790b2bf-8d44-4deb-9c9b-8e4bf3973100',2),('647ee636-6007-4284-9420-2c685164bb97','927bc844-fbf7-4076-9c4f-ba2186d33f4b','b5d5c504-9000-4e64-8316-ba5bc6f86ad0',2),('75436c3c-ea90-4ea3-8e71-35c990969413','927bc844-fbf7-4076-9c4f-ba2186d33f4b','qYDBULAiNM8sKiCkCRPR',2),('96223094-2e17-4208-8a34-dfbb64c34eb0','82c44b53-5694-466c-be43-6bf3b189124a','525b3a03-09d4-4732-9b00-d8e20dab90ce',2),('994ae1cd-40e1-470b-b427-9697c8352ca7','82c44b53-5694-466c-be43-6bf3b189124a','07314457-b071-40bc-984b-4129f4e9a028',2),('b08a88b0-b74a-459d-abb8-dd19e3283b5b','64850a1e-e6cd-4e4e-85a8-9baa30e656f6','82d68496-492a-46f3-9a4c-9b8493714d26',2),('cfdbe9af-c8e9-4ab2-8d89-fccdfd52eb2f','64850a1e-e6cd-4e4e-85a8-9baa30e656f6','3fa05a84-ed5e-4b02-9d1f-93f8cf1c0af6',2);
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
  `isDelete` tinyint(1) DEFAULT '0',
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
INSERT INTO `USER` VALUES ('','Kiet','0385218011','TPHCM','kietttt@gmail.com','pass123456',2,0),(' ','TR╞»╞áNG Tß║ñN ─Éß║áT','0338081724','BM, Cß╗ª CHI','dat@gmail.com','S!n6EUf_S_Me5Jg',2,0),('44df4665-7ad7-42a7-9341-8b0228f9fb50','Kiet','0385218011','TPHCM','kieeetttt@gmail.com','pass123456',1,0),('49075d49-dcce-4770-8ab6-2ca0c99ba46a','V├╡ Trß║ºn Tß║Ñn Lß╗Öc','0932447520','TP.HCM','votrantanloc140@gmail.com','123123loc',2,0),('5f18b69f-43fe-4606-994a-ffc6b0107a9b','Tr├á Tuß║Ñn','0385218011','TPHCM','tuant@gmail.com','20072002',2,1),('660d21786d4c9-660d21786d4ca-660d21786d4cb-660d21786d4cc-660d21786d4cd','L├¬ Gia H├áo','0338081724','Tß╗ënh L├áo Cai, Huyß╗çn Bß║»c H├á, X├ú Tß║ú Cß╗º Tß╗╖','haole@gmail.com','20072002',2,0),('6610d62493c16-6610d62493c17-6610d62493c18-6610d62493c19-6610d62493c1a','Tr╞░╞íng Tß║Ñn ─Éß║ít','0338081724','BM, Cß╗ª CHI','dfsdfdsfat@gmail.com','123456',2,0),('ce6344fb-90ac-415f-a9ac-af92e2beefa1','Tra Tuan','0338081724','BM, Cß╗ª CHI','tuann@gmail.com','20072002',2,0),('e67f0282-ec7e-4bc2-9c96-95141bd1b0f4','V├╡ Anh H├áo','0338081724','BM, Cß╗ª CHI','hao01638081724@gmail.com','20072002',1,0),('e7ad1ede-9456-41fd-ae57-a19cf81591a4','Tuan','0338081724','BM, Cß╗ª CHI','tuan@gmail.com','20072002',2,0),('f22c5c4b-3a80-42aa-8ba2-6851e9eee2f8','vo loc','0943223456','','votrantanloc0312@gmail.com','123123',2,0),('vbqfniwcncqincqi','admin','0909090909','TPHCM','admin@gmail.com','admin',0,0);
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

-- Dump completed on 2024-05-09 13:21:06
