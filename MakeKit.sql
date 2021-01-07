CREATE DATABASE  IF NOT EXISTS `makekit` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `makekit`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: makekit
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `cartdetail`
--

DROP TABLE IF EXISTS `cartdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartdetail` (
  `DcartNo` int(11) NOT NULL AUTO_INCREMENT,
  `product_productNo` int(11) NOT NULL,
  `userinfo_userEmail` varchar(15) NOT NULL,
  `cartinfo_cartNo` int(11) NOT NULL,
  `cartQuantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`DcartNo`),
  KEY `goods_prdNo` (`product_productNo`),
  KEY `user_userId` (`userinfo_userEmail`),
  KEY `fk_orderdetail_copy1_cartinfo1_idx` (`cartinfo_cartNo`),
  CONSTRAINT `fk_orderdetail_copy1_cartinfo1` FOREIGN KEY (`cartinfo_cartNo`) REFERENCES `cartinfo` (`cartNo`),
  CONSTRAINT `orderdetail_ibfk_20` FOREIGN KEY (`product_productNo`) REFERENCES `product` (`productNo`),
  CONSTRAINT `orderdetail_ibfk_30` FOREIGN KEY (`userinfo_userEmail`) REFERENCES `userinfo` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartdetail`
--

LOCK TABLES `cartdetail` WRITE;
/*!40000 ALTER TABLE `cartdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartinfo`
--

DROP TABLE IF EXISTS `cartinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartinfo` (
  `cartNo` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_userEmail` varchar(15) NOT NULL,
  `cartDate` datetime DEFAULT NULL,
  `cartTotalPrice` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cartNo`,`userinfo_userEmail`),
  KEY `fk_orderinfo_user2_idx` (`userinfo_userEmail`),
  CONSTRAINT `fk_orderinfo_user20` FOREIGN KEY (`userinfo_userEmail`) REFERENCES `userinfo` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartinfo`
--

LOCK TABLES `cartinfo` WRITE;
/*!40000 ALTER TABLE `cartinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatting`
--

DROP TABLE IF EXISTS `chatting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatting` (
  `userinfo_userEmail_sender` varchar(15) NOT NULL,
  `userinfo_userEmail_receiver` varchar(15) NOT NULL,
  `product_prdNo` int(11) NOT NULL,
  `chattingContents` text,
  `chattingInsertDate` datetime DEFAULT NULL,
  KEY `fk_chatting_userinfo1_idx` (`userinfo_userEmail_sender`),
  KEY `fk_chatting_userinfo2_idx` (`userinfo_userEmail_receiver`),
  KEY `fk_chatting_product1_idx` (`product_prdNo`),
  CONSTRAINT `fk_chatting_product1` FOREIGN KEY (`product_prdNo`) REFERENCES `product` (`productNo`),
  CONSTRAINT `fk_chatting_userinfo1` FOREIGN KEY (`userinfo_userEmail_sender`) REFERENCES `userinfo` (`userEmail`),
  CONSTRAINT `fk_chatting_userinfo2` FOREIGN KEY (`userinfo_userEmail_receiver`) REFERENCES `userinfo` (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatting`
--

LOCK TABLES `chatting` WRITE;
/*!40000 ALTER TABLE `chatting` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `nSeqno` int(11) NOT NULL AUTO_INCREMENT,
  `nTitle` varchar(45) NOT NULL,
  `nContent` text NOT NULL,
  `nDate` date DEFAULT NULL,
  PRIMARY KEY (`nSeqno`),
  UNIQUE KEY `seqno_UNIQUE` (`nSeqno`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `orderDetailNo` int(11) NOT NULL,
  `orderinfo_orderNo` int(11) NOT NULL,
  `userinfo_userEmail` varchar(15) NOT NULL,
  `goods_productNo` int(11) NOT NULL,
  `orderQuantity` int(11) DEFAULT NULL,
  `orderConfirm` int(2) DEFAULT NULL,
  `orderRefund` datetime DEFAULT NULL,
  `orderStar` varchar(3) DEFAULT NULL,
  `orderReview` text,
  `orderReviewImg` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderDetailNo`),
  KEY `fk_orderdetail_orderinfo1_idx` (`orderinfo_orderNo`),
  KEY `goods_prdNo` (`goods_productNo`),
  KEY `user_userId` (`userinfo_userEmail`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orderinfo_orderNo`) REFERENCES `orderinfo` (`orderNo`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`goods_productNo`) REFERENCES `product` (`productNo`),
  CONSTRAINT `orderdetail_ibfk_3` FOREIGN KEY (`userinfo_userEmail`) REFERENCES `userinfo` (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderinfo` (
  `orderNo` int(11) NOT NULL,
  `userinfo_userEmail` varchar(15) NOT NULL,
  `orderDate` datetime DEFAULT NULL,
  `orderReceiver` varchar(15) DEFAULT NULL,
  `orderRcvAddress` varchar(45) DEFAULT NULL,
  `orderRcvAddressDetail` varchar(45) DEFAULT NULL,
  `orderRcvPhone` varchar(15) DEFAULT NULL,
  `orderTotalPrice` int(11) DEFAULT NULL,
  `orderBank` varchar(6) DEFAULT NULL,
  `orderCardNo` varchar(20) DEFAULT NULL,
  `orderCardPw` varchar(10) DEFAULT NULL,
  `orderDelivery` varchar(15) DEFAULT '상품 준비중',
  `orderDeliveryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderNo`,`userinfo_userEmail`),
  KEY `fk_orderinfo_user2_idx` (`userinfo_userEmail`),
  CONSTRAINT `fk_orderinfo_user2` FOREIGN KEY (`userinfo_userEmail`) REFERENCES `userinfo` (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderinfo`
--

LOCK TABLES `orderinfo` WRITE;
/*!40000 ALTER TABLE `orderinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productNo` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(45) DEFAULT NULL,
  `productType` varchar(25) DEFAULT NULL,
  `productPrice` varchar(10) DEFAULT NULL,
  `productStock` varchar(5) DEFAULT NULL,
  `productContent` text,
  `productFilename` varchar(45) DEFAULT NULL,
  `productDFilename` varchar(45) DEFAULT NULL,
  `productAFilename` varchar(45) DEFAULT NULL,
  `productInsertDate` datetime DEFAULT NULL,
  `productDeleteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`productNo`),
  UNIQUE KEY `prdNo_UNIQUE` (`productNo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (41,'김치',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'김치찌개',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `userinfo_userEmail` varchar(15) NOT NULL,
  `product_productNo` int(11) NOT NULL,
  `selleraddress` varchar(45) DEFAULT NULL,
  `selleraddressdetail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_productNo`),
  KEY `fk_register_userinfo1_idx` (`userinfo_userEmail`),
  CONSTRAINT `fk_register_product1` FOREIGN KEY (`product_productNo`) REFERENCES `product` (`productNo`),
  CONSTRAINT `fk_register_userinfo1` FOREIGN KEY (`userinfo_userEmail`) REFERENCES `userinfo` (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES ('qkr@naver.com',41,'서울 강남구 강남대로 402',NULL),('son@naver.com',42,'서울 강남구 강남대로 398',NULL);
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `userEmail` varchar(15) NOT NULL,
  `userPw` varchar(25) NOT NULL,
  `userName` varchar(10) DEFAULT NULL,
  `userAddress` varchar(45) DEFAULT NULL,
  `userAddressDetail` varchar(45) DEFAULT NULL,
  `userTel` varchar(15) DEFAULT NULL,
  `userBirth` varchar(13) DEFAULT NULL,
  `userInsertDate` date DEFAULT NULL,
  `userDeleteDate` date DEFAULT NULL,
  PRIMARY KEY (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('qkr@naver.com','1234','홍길동','서울 강남구 강남대로 402',NULL,NULL,NULL,NULL,NULL),('son@naver.com','1234','유비','서울 강남구 강남대로 399',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-07 16:10:19
