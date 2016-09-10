-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema travelDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `travelDB` ;

-- -----------------------------------------------------
-- Schema travelDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `travelDB` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
USE `travelDB` ;

-- -----------------------------------------------------
-- Table `travelDB`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `travelDB`.`location` ;

CREATE TABLE IF NOT EXISTS `travelDB`.`location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelDB`.`trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `travelDB`.`trip` ;

CREATE TABLE IF NOT EXISTS `travelDB`.`trip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `location_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trip_location_location_id_idx` (`location_id` ASC),
  CONSTRAINT `fk_trip_location_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `travelDB`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO application;
 DROP USER application;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'application' IDENTIFIED BY 'application';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `travelDB`.* TO 'application';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `mydb`.* TO 'application';

-- -----------------------------------------------------
-- Data for table `travelDB`.`location`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelDB`;
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (1, 'Buffalo', 'NY');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (2, 'Chico', 'CA');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (3, 'Denver', 'CO');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (4, 'San Antonio', 'TX');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (5, 'Atlanta', 'GA');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (6, 'Portland', 'OR');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (7, 'Reno', 'NV');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (8, 'Sacramento', 'CA');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (9, 'Anchorage', 'AK');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (10, 'Cleveland', 'OH');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (11, 'Daytona', 'FL');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (12, 'Destin', 'FL');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (13, 'Oklahoma City', 'OK');
INSERT INTO `travelDB`.`location` (`id`, `city`, `state`) VALUES (14, 'Savannah', 'GA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `travelDB`.`trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelDB`;
INSERT INTO `travelDB`.`trip` (`id`, `start_date`, `end_date`, `location_id`) VALUES (1, '2016-10-10', '2016-10-15', 1);
INSERT INTO `travelDB`.`trip` (`id`, `start_date`, `end_date`, `location_id`) VALUES (2, '2016-10-20', '2016-10-23', 2);
INSERT INTO `travelDB`.`trip` (`id`, `start_date`, `end_date`, `location_id`) VALUES (3, '2016-10-25', '2016-11-01', 3);
INSERT INTO `travelDB`.`trip` (`id`, `start_date`, `end_date`, `location_id`) VALUES (4, '2016-11-15', '2016-11-22', 4);
INSERT INTO `travelDB`.`trip` (`id`, `start_date`, `end_date`, `location_id`) VALUES (5, '2016-12-01', '2016-12-15', 5);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
