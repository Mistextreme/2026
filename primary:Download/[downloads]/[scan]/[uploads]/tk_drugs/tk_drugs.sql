CREATE TABLE IF NOT EXISTS `tk_drugs_equipment` (
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`configIndex` VARCHAR(100) NOT NULL,
	`coords` VARCHAR(1024) NOT NULL,
	`rotation` VARCHAR(1024) NOT NULL,
	`bucket` BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS `tk_drugs_plants` (
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`coords` VARCHAR(1024) NOT NULL,
	`rotation` VARCHAR(1024) NOT NULL,
	`water` INT(3) DEFAULT 50,
	`fertilizer` INT(3) DEFAULT 50,
	`configIndex` VARCHAR(100) NOT NULL,
	`placeTime` BIGINT NOT NULL,
	`lastResourceUpdate` BIGINT NOT NULL,
	`bucket` BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS `tk_drugs_lamps` (
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`coords` VARCHAR(1024) NOT NULL,
	`rotation` VARCHAR(1024) NOT NULL,
	`configIndex` VARCHAR(100) NOT NULL,
	`plantId` INT(11) DEFAULT NULL,
	`bucket` BIGINT NOT NULL
);