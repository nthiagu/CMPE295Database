ALTER TABLE `G5CMPE295`.`N_SENSORS` 
CHANGE COLUMN `sensor_location` `sensor_location` VARCHAR(200) NULL DEFAULT NULL ;
ALTER TABLE `G5CMPE295`.`N_SENSORS` 
CHANGE COLUMN `sensor_location` `sensor_location` VARCHAR(200) NULL DEFAULT NULL ,
ADD COLUMN `sensor_color` VARCHAR(100) NULL AFTER `sensor_attr6`,
ADD COLUMN `sensor_indoor_location` VARCHAR(200) NULL AFTER `sensor_color`,
ADD COLUMN `sensor_tag` VARCHAR(200) NULL AFTER `sensor_indoor_location`,
ADD COLUMN `sensor_uuid` VARCHAR(100) NULL AFTER `sensor_tag`,
ADD COLUMN `sensor_mac_addr` VARCHAR(45) NULL AFTER `sensor_uuid`,
ADD COLUMN `sensor_major` INT(11) NULL AFTER `sensor_mac_addr`,
ADD COLUMN `sensor_minor` INT(11) NULL AFTER `sensor_major`;
