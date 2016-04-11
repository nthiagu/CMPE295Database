DELIMITER $$

DROP PROCEDURE IF EXISTS `G5CMPE295`.`APP_SALES_PROCESSING`$$

CREATE PROCEDURE `G5CMPE295`.`APP_SALES_PROCESSING`()

--  Created by Thiagarajan Natarajan
--  Created on April 09, 2016 - Draft version  
--   --------------------------------------------------------------------- 
--    Created for : CMPE 295B , Spring 2016 
--    Project : Smart Retail Analytics - Group 5
--   --------------------------------------------------------------------- 
--    Implementation of Processing Sales Transaction Records for ShopSmart Retail
--   --------------------------------------------------------------------- 
--   Input : 	Customer Id and 1 product name from the Shopping Cart 
--   Output: 	Sales Transactions in ShopSmart will be processed for inclusion 
--              in Sales Fact table and POS Txn Views for inclusion in the Data Analytics 
--   Utility: 	Cumulative Sales transactions used for different types of Data analysis 
--              and predictive analytics to help Shop Smart admins in providing a better 
--              shopping experience for their customers. Win Win scenario. 
--    		Allows retailers to initiate Deals/Offers based on proven data.
--    
--   --------------------------------------------------------------------- 

BEGIN 

--	DECLARE done BOOLEAN DEFAULT FALSE;
-- 	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;	

	DROP TABLE IF EXISTS `G5CMPE295`.`SALES_TEMP`;

	CREATE TABLE `G5CMPE295`.`SALES_TEMP` 
			(
  			`S_CART_ID` INT NULL,
  			`S_CART_CUSTOMER_ID` INT NULL,
  			`S_CART_PRODUCT_ID` INT NULL,
  			`S_CART_TIME_ID` INT NULL,
  			`S_CART_ATTR1` VARCHAR(45) NULL,
  			`S_CART_ATTR2` VARCHAR(45) NULL,
  			`S_CART_ATTR3` INT NULL,
  			`S_CART_ATTR4` DATETIME NULL
			);

--   --------------------------------------------------------------------- 
--   STEP 1  INSERTs into temp table with time id 
--   --------------------------------------------------------------------- 

		INSERT INTO G5CMPE295.SALES_TEMP( S_CART_ID,S_CART_CUSTOMER_ID,S_CART_PRODUCT_ID,S_CART_TIME_ID) select A.cart_id,A.cart_customer_id, B.product_id,A.cart_id+1000
from G5CMPE295.N_CART_INFO A , G5CMPE295.N_CART_PRD B WHERE A.CART_STATUS = 'processed' and A.cart_id = B.cart_id and A.cart_attr1 is null and A.cart_attr5 is null ;
		COMMIT;
--   --------------------------------------------------------------------- 
--   STEP 2  UPDATEs cart info table with SALE PROCESSED status 
--   --------------------------------------------------------------------- 

		UPDATE G5CMPE295.N_CART_INFO A SET A.CART_ATTR1 = 'SALE PROCESSED', A.CART_ATTR5 = NOW() WHERE A.CART_ID IN ( SELECT DISTINCT B.S_CART_ID FROM G5CMPE295.SALES_TEMP B WHERE B.S_CART_TIME_ID IS NOT NULL);
		COMMIT;
--   --------------------------------------------------------------------- 
--   STEP 3 INSERT into test_sales_fact as select from sales_t1 
--        where s_cart_customer_id,s_cart_product_id,s_cart_time_id 
--        where s_cart_customer_id is not null
--   --------------------------------------------------------------------- 

		INSERT INTO G5CMPE295.N_SALES_FACT_1997(CUSTOMER_ID, PRODUCT_ID,TIME_ID) SELECT S_CART_CUSTOMER_ID,S_CART_PRODUCT_ID,S_CART_TIME_ID FROM G5CMPE295.SALES_TEMP WHERE S_CART_CUSTOMER_ID IS NOT NULL;
		COMMIT;
--   --------------------------------------------------------------------- 
--   STEP 4 DELETE from sales_temp where s_cart_customer_id is not null
--   --------------------------------------------------------------------- 

		DELETE FROM G5CMPE295.SALES_TEMP WHERE S_CART_CUSTOMER_ID IS NOT NULL;

		COMMIT;

    		SELECT * FROM G5CMPE295.N_SALES_FACT_1997 order by ID desc LIMIT 50;

    -- SELECT * FROM G5CMPE295.TEST_SALES_FACT order by ID desc ;

END$$
