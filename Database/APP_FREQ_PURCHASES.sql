CREATE DEFINER=`G5CMPE295B`@`%` PROCEDURE `APP_FREQ_PURCHASES`()
BEGIN
     
    BEGIN
    

        DECLARE l_count int;
        DECLARE cursor_a CURSOR FOR SELECT ROUND(MAX(PHASE1COUNT)/2) FROM G5CMPE295.APV_TEMP_FREQ_PURCHASES;
          
        OPEN cursor_a;
		
            cursor_a_loop: LOOP
                 FETCH cursor_a INTO l_count;
					
                 IF l_count <> 0 THEN
                    DELETE FROM G5CMPE295.APT_CUST_FREQ_PURCHASES_ALL WHERE KOUNT < l_count; 
                    -- l_count +1;
                 END IF;
            END LOOP;
          
        CLOSE cursor_a;
    END;
    
END
