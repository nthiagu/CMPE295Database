DELIMITER $$

DROP PROCEDURE IF EXISTS `G5CMPE295`.`APP_NEXT_IN_BASKET`$$

CREATE PROCEDURE `G5CMPE295`.`APP_NEXT_IN_BASKET`(IN l_cust_id INT(11), IN l_prd_name VARCHAR(200))
--    
--  Created by Thiagarajan Natarajan
--  Created on March 12, 2016 - Draft version  
--   --------------------------------------------------------------------- 
--    Created for : CMPE 295B , Spring 2016 
--    Project : Smart Retail Analytics - Group 5
--   --------------------------------------------------------------------- 
--    Implementation of APRIORI ALGORITHM for Next-in-Basket on MYSQL/iOS
--   --------------------------------------------------------------------- 
--   Input : 	Customer Id and 1 product name from the Shopping Cart 
--   Output: 	NEXT IN BASKET Suggestions provided to the Recommendation engine
--   Utility: 	Retailers are provided with predictable customer behavior, buying patterns. 
--    		Allows retailers to initiate Deals/Offers based on proven data.
--    
--   --------------------------------------------------------------------- 

BEGIN 

	DECLARE done BOOLEAN DEFAULT FALSE;
	DECLARE tmp_prd_name VARCHAR(200) DEFAULT NULL;
        DECLARE cursor_a CURSOR FOR SELECT DISTINCT PRD_NAME FROM G5CMPE295.APT_CUST_FREQ_PURCHASES_ALL where cust_id = l_cust_id and prd_name <> l_prd_name;

        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;	
-- 	DECLARE tmp_cust_id INT DEFAULT 0;

	DROP TABLE IF EXISTS `G5CMPE295`.`APT_NEXT_IN_BASKET`;

	CREATE TABLE `G5CMPE295`.`APT_NEXT_IN_BASKET` 
			(
  			`final_product_name` VARCHAR(255) NULL,
  			`final_count` INT NULL
			);

        OPEN cursor_a;
		
            cursor_a_loop: LOOP

             FETCH cursor_a INTO tmp_prd_name;

		 IF done THEN
		   LEAVE cursor_a_loop;
		 END IF;     
	BEGIN
		DECLARE done2 BOOLEAN DEFAULT FALSE;

	  	DECLARE bl_count INT DEFAULT 0;
  		DECLARE bl_product_name VARCHAR(200) DEFAULT NULL ;
       -- 	DECLARE cursor_b CURSOR FOR SELECT COUNT(*),PRODUCT_NAME FROM G5CMPE295.N_POS_TXN a where a.customer_id = l_cust_id and a.product_name = tmp_prd_name and a.trans_id IN (select trans_id from G5CMPE295.N_POS_TXN where customer_id = l_cust_id and product_name = l_prd_name and a.time_id = time_id ) ;
        	DECLARE cursor_b CURSOR FOR SELECT COUNT(*),PRODUCT_NAME FROM G5CMPE295.N_POS_TXN a where a.customer_id = l_cust_id and a.product_name = tmp_prd_name and a.trans_id IN (select trans_id from G5CMPE295.N_POS_TXN where customer_id = l_cust_id and product_name = l_prd_name ) ;
        	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2 = TRUE;	

		   OPEN cursor_b;
			cursor_b_loop: LOOP 
			 FETCH cursor_b INTO bl_count,bl_product_name;	

			 IF done2 THEN
				LEAVE cursor_b_loop;
			 END IF;     

                  	IF bl_product_name IS NOT NULL THEN
                     		INSERT INTO G5CMPE295.APT_NEXT_IN_BASKET(Final_product_name,Final_Count) values (bl_product_name,bl_count); 
                      	END IF;
		      END LOOP;
	   	    CLOSE cursor_b;
       		END;
            END LOOP;
        CLOSE cursor_a;

    SELECT * FROM G5CMPE295.APT_NEXT_IN_BASKET order by final_count desc;
END$$
