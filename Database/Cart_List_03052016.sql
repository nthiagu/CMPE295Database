-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: G5CMPE295
-- ------------------------------------------------------
-- Server version	5.7.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `N_CART_INFO`
--

DROP TABLE IF EXISTS `N_CART_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `N_CART_INFO` (
  `cart_id` int(11) NOT NULL,
  `cart_desc` varchar(200) DEFAULT NULL,
  `cart_status` varchar(45) DEFAULT NULL,
  `cart_item_count` int(11) DEFAULT NULL,
  `cart_name` varchar(100) DEFAULT NULL,
  `cart_customer_id` int(11) NOT NULL,
  `cart_attr1` varchar(1000) DEFAULT NULL,
  `cart_attr2` varchar(1000) DEFAULT NULL,
  `cart_attr3` int(11) DEFAULT NULL,
  `cart_attr4` double DEFAULT NULL,
  `cart_attr5` datetime DEFAULT NULL,
  `cart_attr6` datetime DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `N_CART_INFO`
--

LOCK TABLES `N_CART_INFO` WRITE;
/*!40000 ALTER TABLE `N_CART_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `N_CART_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `N_CART_PRD`
--

DROP TABLE IF EXISTS `N_CART_PRD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `N_CART_PRD` (
  `cart_product_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `cart_desc` varchar(200) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_qty` int(11) DEFAULT NULL,
  `cart_prd_attr1` varchar(1000) DEFAULT NULL,
  `cart_prd_attr2` varchar(1000) DEFAULT NULL,
  `cart_prd_attr3` int(11) DEFAULT NULL,
  `cart_prd_attr4` double DEFAULT NULL,
  `cart_prd_attr5` datetime DEFAULT NULL,
  `cart_prd_attr6` datetime DEFAULT NULL,
  PRIMARY KEY (`cart_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `N_CART_PRD`
--

LOCK TABLES `N_CART_PRD` WRITE;
/*!40000 ALTER TABLE `N_CART_PRD` DISABLE KEYS */;
/*!40000 ALTER TABLE `N_CART_PRD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `N_LIST_INFO`
--

DROP TABLE IF EXISTS `N_LIST_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `N_LIST_INFO` (
  `list_id` int(11) NOT NULL,
  `list_desc` varchar(200) DEFAULT NULL,
  `list_status` varchar(45) DEFAULT NULL,
  `list_item_count` int(11) DEFAULT NULL,
  `list_name` varchar(100) DEFAULT NULL,
  `list_customer_id` int(11) NOT NULL,
  `list_attr1` varchar(1000) DEFAULT NULL,
  `list_attr2` varchar(1000) DEFAULT NULL,
  `list_attr3` int(11) DEFAULT NULL,
  `list_attr4` double DEFAULT NULL,
  `list_attr5` datetime DEFAULT NULL,
  `list_attr6` datetime DEFAULT NULL,
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `N_LIST_INFO`
--

LOCK TABLES `N_LIST_INFO` WRITE;
/*!40000 ALTER TABLE `N_LIST_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `N_LIST_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `N_LIST_PRD`
--

DROP TABLE IF EXISTS `N_LIST_PRD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `N_LIST_PRD` (
  `list_product_id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `list_desc` varchar(200) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_qty` int(11) DEFAULT NULL,
  `list_prd_attr1` varchar(1000) DEFAULT NULL,
  `list_prd_attr2` varchar(1000) DEFAULT NULL,
  `list_prd_attr3` int(11) DEFAULT NULL,
  `list_prd_attr4` double DEFAULT NULL,
  `list_prd_attr5` datetime DEFAULT NULL,
  `list_prd_attr6` datetime DEFAULT NULL,
  PRIMARY KEY (`list_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `N_LIST_PRD`
--

LOCK TABLES `N_LIST_PRD` WRITE;
/*!40000 ALTER TABLE `N_LIST_PRD` DISABLE KEYS */;
/*!40000 ALTER TABLE `N_LIST_PRD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'G5CMPE295'
--

--
-- Dumping routines for database 'G5CMPE295'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-05 12:58:04
