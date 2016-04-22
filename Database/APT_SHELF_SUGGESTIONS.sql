-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
-- ____________________________________________________
--  Author Name : Thiagarajan Natarajan
--  Date        : 22 March 2016
--  Script Name : APT_SHELF_SUGGESTIONS.sql
--  Purpose     : CMPE295B - Spring 2016 - Group 5
-- 
--      This script computes the group of items 
--	that are purchased by a set of customers.
--      Retailers can use this data to manage their 
--	SHELF arrangements to keep specific items 
--	closer to each other to enhance the customer
--	shopping experience.
--
--	This is the source of data for the 'SHELF SUGGESTIONS'  
--	screen in SmartAnalytics application. 
-- ____________________________________________________
--
-- Host: 127.0.0.1    Database: G5CMPE295
-- ------------------------------------------------------
-- Server version       5.7.9
-- Table # 1 

CREATE TABLE `G5CMPE295`.`APT_CUST_PRD_GROUPING` (
  `trans_id` INT(11) NOT NULL,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `time_id` INT(11) NULL DEFAULT NULL,
  `grouped_product_name` VARCHAR(2000) NULL DEFAULT NULL,
  `product_count` INT(11) NULL DEFAULT NULL,
  `purge_flag` VARCHAR(1) NULL,
  PRIMARY KEY (`trans_id`));

-- Table # 2 
CREATE TABLE `G5CMPE295`.`APT_SHELF_SUGGESTIONS` (
  `cust_count` INT(11) NULL,
  `freq_grouped_items` VARCHAR(2000) NULL);

