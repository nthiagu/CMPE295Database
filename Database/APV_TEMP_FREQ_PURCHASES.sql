-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: awsg5cmpe295b.calw7bi2ea5b.us-west-1.rds.amazonaws.com    Database: G5CMPE295
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Temporary view structure for view `APV_TEMP_FREQ_PURCHASES`
--

DROP TABLE IF EXISTS `APV_TEMP_FREQ_PURCHASES`;
/*!50001 DROP VIEW IF EXISTS `APV_TEMP_FREQ_PURCHASES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `APV_TEMP_FREQ_PURCHASES` AS SELECT 
 1 AS `customer_id`,
 1 AS `product_name`,
 1 AS `phase1count`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'G5CMPE295'
--

--
-- Dumping routines for database 'G5CMPE295'
--

--
-- Final view structure for view `APV_TEMP_FREQ_PURCHASES`
--

/*!50001 DROP VIEW IF EXISTS `APV_TEMP_FREQ_PURCHASES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`G5CMPE295B`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `APV_TEMP_FREQ_PURCHASES` AS (select `N_POS_TXN`.`customer_id` AS `customer_id`,`N_POS_TXN`.`product_name` AS `product_name`,count(0) AS `phase1count` from `N_POS_TXN` group by `N_POS_TXN`.`customer_id`,`N_POS_TXN`.`product_name` having (count(0) > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-11 16:33:52
