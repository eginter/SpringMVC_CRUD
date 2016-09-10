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
-- Table `travelDB`.`state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `travelDB`.`state` ;

CREATE TABLE IF NOT EXISTS `travelDB`.`state` (
  `abbrev` CHAR(2) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`abbrev`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelDB`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `travelDB`.`city` ;

CREATE TABLE IF NOT EXISTS `travelDB`.`city` (
  `name` VARCHAR(45) NOT NULL,
  `state_abbrev` CHAR(2) NOT NULL,
  PRIMARY KEY (`name`, `state_abbrev`),
  INDEX `fk_city_state_idx` (`state_abbrev` ASC),
  CONSTRAINT `fk_city_state`
    FOREIGN KEY (`state_abbrev`)
    REFERENCES `travelDB`.`state` (`abbrev`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelDB`.`trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `travelDB`.`trip` ;

CREATE TABLE IF NOT EXISTS `travelDB`.`trip` (
  `id` INT NOT NULL,
  `state_abbrev` CHAR(2) NULL,
  `city` VARCHAR(45) NULL,
  `start_date` DATETIME NULL,
  `end_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trip_city_state_abbrev_idx` (`city` ASC, `state_abbrev` ASC),
  CONSTRAINT `fk_trip_city_city`
    FOREIGN KEY (`city` , `state_abbrev`)
    REFERENCES `travelDB`.`city` (`name` , `state_abbrev`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelDB`.`recommendation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `travelDB`.`recommendation` ;

CREATE TABLE IF NOT EXISTS `travelDB`.`recommendation` (
  `id` INT NOT NULL,
  `trip_id` INT NOT NULL,
  `img_url` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recommendation_trip_tripid_idx` (`trip_id` ASC),
  CONSTRAINT `fk_recommendation_trip_tripid`
    FOREIGN KEY (`trip_id`)
    REFERENCES `travelDB`.`trip` (`id`)
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
-- Data for table `travelDB`.`state`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelDB`;
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('NY', 'New York');
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('GA', 'Georgia');
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('CO', 'Colorado');
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('TX', 'Texas');
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('CA', 'California');
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('OR', 'Oregon');
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('NV', 'Nevada');
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('AK', 'Alaska');
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('OH', 'Ohio');
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('FL', 'Florida');
INSERT INTO `travelDB`.`state` (`abbrev`, `name`) VALUES ('OK', 'Oklahoma');

COMMIT;


-- -----------------------------------------------------
-- Data for table `travelDB`.`city`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelDB`;
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Buffalo', 'NY');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Chico', 'CA');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Denver', 'CO');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('San Antonio', 'TX');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Atlanta', 'GA');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Portland', 'OR');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Reno', 'NV');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Sacramento', 'CA');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Anchorage', 'AK');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Cleveland', 'OH');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Daytona', 'FL');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Destin', 'FL');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Oklahoma City', 'OK');
INSERT INTO `travelDB`.`city` (`name`, `state_abbrev`) VALUES ('Savannah', 'GA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `travelDB`.`trip`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelDB`;
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (1, 'CO', 'Denver', '2016-10-10', '2016-10-15');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (2, 'NY', 'Buffalo', '2016-10-20', '2016-10-23');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (3, 'GA', 'Atlanta', '2016-10-25', '2016-11-01');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (4, 'TX', 'San Antonio', '2016-11-05', '2016-11-12');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (5, 'CA', 'Chico', '2016-11-15', '2016-11-22');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (6, 'OR', 'Portland', '2016-11-23', '2016-11-29');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (7, 'NV', 'Reno', '2016-12-25', '2016-12-29');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (8, 'CA', 'Sacramento', '2017-01-01', '2017-01-20');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (9, 'AK', 'Anchorage', '2017-01-21', '2017-02-22');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (10, 'OH', 'Cleveland', '2017-02-10', '2017-02-15');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (11, 'FL', 'Daytona', '2017-02-20', '2017-02-25');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (12, 'FL', 'Destin', '2017-02-26', '2017-02-28');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (13, 'OK', 'Oklahoma', '2017-03-01', '2017-03-05');
INSERT INTO `travelDB`.`trip` (`id`, `state_abbrev`, `city`, `start_date`, `end_date`) VALUES (14, 'GA', 'Savannah', '2017-04-02', '2017-04-10');

COMMIT;


-- -----------------------------------------------------
-- Data for table `travelDB`.`recommendation`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelDB`;
INSERT INTO `travelDB`.`recommendation` (`id`, `trip_id`, `img_url`) VALUES (1, 6, 'portland.jpg');
INSERT INTO `travelDB`.`recommendation` (`id`, `trip_id`, `img_url`) VALUES (2, 7, 'reno.jpg');
INSERT INTO `travelDB`.`recommendation` (`id`, `trip_id`, `img_url`) VALUES (3, 8, 'sacramento.jpg');
INSERT INTO `travelDB`.`recommendation` (`id`, `trip_id`, `img_url`) VALUES (4, 4, 'sanantonio.jpg');
INSERT INTO `travelDB`.`recommendation` (`id`, `trip_id`, `img_url`) VALUES (5, 9, 'anchorage.jpg');
INSERT INTO `travelDB`.`recommendation` (`id`, `trip_id`, `img_url`) VALUES (6, 10, 'cleveland.jpg');
INSERT INTO `travelDB`.`recommendation` (`id`, `trip_id`, `img_url`) VALUES (7, 11, 'daytona.jpg');
INSERT INTO `travelDB`.`recommendation` (`id`, `trip_id`, `img_url`) VALUES (8, 12, 'destin.jpg');
INSERT INTO `travelDB`.`recommendation` (`id`, `trip_id`, `img_url`) VALUES (9, 13, 'oklahoma.jpg');
INSERT INTO `travelDB`.`recommendation` (`id`, `trip_id`, `img_url`) VALUES (10, 14, 'savannah.jpg');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
