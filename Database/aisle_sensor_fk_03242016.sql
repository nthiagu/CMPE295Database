ALTER TABLE `G5CMPE295`.`N_AISLE` 
ADD COLUMN `aisle_sensor_id` INT(11) NULL AFTER `aisle_attr6`,
ADD INDEX `aisle_sensor_idx` (`aisle_sensor_id` ASC);
ALTER TABLE `G5CMPE295`.`N_AISLE` 
ADD CONSTRAINT `aisle_sensor`
  FOREIGN KEY (`aisle_sensor_id`)
  REFERENCES `G5CMPE295`.`N_SENSORS` (`sensor_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
