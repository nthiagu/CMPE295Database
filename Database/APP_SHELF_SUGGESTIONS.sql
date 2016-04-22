DELIMITER $$
-- ____________________________________________________
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
-- ____________________________________________________
--  Author Name : Thiagarajan Natarajan
--  Date        : 22 March 2016
--  Script Name : APP_SHELF_SUGGESTIONS.sql
--  Purpose     : CMPE295B - Spring 2016 - Group 5
-- 
-- This procedure reads the data from N_POS_TXN table
-- and inserts records into the APT_CUST_PRD_GROUPING i
-- table by doing a group_concat .
-- Further,it updates product count column and also sets 
-- purge flag = Y for records that are having count < 2
-- Count(*) and grouped_product_name from this table are 
-- inserted into the final table APT_SHELF_SUGGESTIONS
-- Rows in this table indicates the count(unique customers)
-- who purchased the same set of products listed in the 
-- grouped_product_name field.
-- Retailer can use this table to find how many unique customers
-- have pruchased the same set of products listed in the 
-- grouped_product_name filed , which may be 5 or 10 products.
-- Based on the higher number of unique customers purchasing the
-- same set of products, Retailers can shelf those items 
-- closer to each other to enhance the customer shopping experience.
-- This is the source of data for the 'SHELF SUGGESTIONS'  
-- screen in SmartAnalytics application. 
-- ____________________________________________________
-- Host: 127.0.0.1    Database: G5CMPE295
-- Server version       5.7.9
-- ____________________________________________________

DROP PROCEDURE IF EXISTS `G5CMPE295`.`APP_SHELF_SUGGESTIONS`$$

CREATE PROCEDURE `G5CMPE295`.`APP_SHELF_SUGGESTIONS`() 

BEGIN
-- temporary variables for the SP
-- more details in the following
        BEGIN
                DECLARE tmp_cust_id INT DEFAULT 0;
                DECLARE tmp_counter INT DEFAULT 0;
                DECLARE done INT DEFAULT 0;

        DECLARE cursor_a CURSOR FOR SELECT DISTINCT customer_id FROM G5CMPE295.N_POS_TXN;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

        OPEN cursor_a;

            cursor_a_loop: LOOP

                 FETCH cursor_a INTO tmp_cust_id;

                         IF done THEN
                           LEAVE cursor_a_loop;
                         END IF;

-- select concat('tmp cust id :', tmp_cust_id);
-- ____________________________________________________________________________________
-- Insert data into Customer Product Grouping table based on records from N_POS_TXN
-- by concatenating the product names into a single string " grouped_product_name ". 
--  Important : Use of "group_concat" function 
-- ____________________________________________________________________________________

                 IF tmp_cust_id IS NOT NULL THEN
                    INSERT INTO G5CMPE295.APT_CUST_PRD_GROUPING (trans_id,customer_id,time_id,grouped_product_name)
	SELECT trans_id,customer_id,time_id,group_concat(product_name) FROM G5CMPE295.N_POS_TXN WHERE customer_id = tmp_cust_id GROUP BY time_id ORDER BY time_id;
                 END IF;
            END LOOP;

        CLOSE cursor_a;
-- ____________________________________________________________________________________
-- Update Customer Product Grouping table . product count field based on ',' in the 
-- grouped_product_name. If there are 3 products in a row , this field will have value 3 
-- ____________________________________________________________________________________

                    UPDATE G5CMPE295.APT_CUST_PRD_GROUPING
                    SET    product_count = ROUND ( ( LENGTH(grouped_product_name) - LENGTH(REPLACE(grouped_product_name, ",", "") ) ) / LENGTH(",") ) + 1 ;
        
                  COMMIT;
-- ____________________________________________________________________________________
-- Update Customer Product Grouping table . purge flag field based on product_count value 
-- value. If the product_count < 2 , the item is purchased as single item , and not needed 
-- for providing Shelf Suggestions. 
-- ____________________________________________________________________________________

        	    UPDATE G5CMPE295.APT_CUST_PRD_GROUPING
		    SET    purge_flag = "Y" 
		    WHERE  product_count < 2;  

    	          COMMIT;
-- ____________________________________________________________________________________
-- Update Customer Product Grouping table . purge flag field based on product_count value 
-- value. If the product_count < 2 , the item is purchased as single item , and not needed 
-- for providing Shelf Suggestions. This should eliminate thousands of transactions and the 
-- resulting data set should be a few hundred which can be used for providing suggestions. 
-- The Count(*) below is the count(unique customers) who purchased the same set of products
-- displayed in the grouped_product_name column .  
-- ____________________________________________________________________________________

                    INSERT INTO G5CMPE295.APT_SHELF_SUGGESTIONS
                                ( cust_count, freq_grouped_items )
		    SELECT COUNT(*),grouped_product_name
		    FROM G5CMPE295.APT_CUST_PRD_GROUPING
		    WHERE purge_flag IS NULL  
		    GROUP BY grouped_product_name
		    HAVING count(*) > 1 
		    ORDER BY count(*) DESC;

    	          COMMIT;

        END;

--    SELECT * FROM G5CMPE295.APT_CUST_PRD_GROUPING;
    SELECT * FROM G5CMPE295.APT_SHELF_SUGGESTIONS;
END$$

