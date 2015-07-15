-- MySQL Script generated by MySQL Workbench
-- Fri Jul 10 08:33:20 2015
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

GRANT ALL ON good_morning_claremont.* TO 'gmc'@'localhost' IDENTIFIED BY 'summer2015';

-- -----------------------------------------------------
-- Schema good_morning_claremont
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `good_morning_claremont` ;

-- -----------------------------------------------------
-- Schema good_morning_claremont
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `good_morning_claremont` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `good_morning_claremont` ;

-- -----------------------------------------------------
-- Table `contributions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contributions` ;

CREATE TABLE IF NOT EXISTS `contributions` (
  `contr_id` INT NOT NULL COMMENT '',
  `author_id` INT NOT NULL COMMENT '',
  `description` VARCHAR(1000) NOT NULL COMMENT '',
  `img` BLOB NOT NULL COMMENT '',
  `campus` VARCHAR(45) NOT NULL COMMENT '',
  `club_or_organization` VARCHAR(45) NOT NULL COMMENT '',
  `date_posted` DATETIME NOT NULL COMMENT '',
  `date_submitted` DATETIME NOT NULL COMMENT '',
  PRIMARY KEY (`contr_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contributors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contributors` ;

CREATE TABLE IF NOT EXISTS `contributors` (
  `author_id` INT NOT NULL COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `college` VARCHAR(45) NOT NULL COMMENT '',
  `username` VARCHAR(45) NOT NULL COMMENT '',
  `email` VARCHAR(100) NOT NULL COMMENT '',
  `password` VARCHAR(45) NOT NULL COMMENT '',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`author_id`)  COMMENT '');


-- -----------------------------------------------------
-- Table `events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `events` ;

CREATE TABLE IF NOT EXISTS `events` (
  `event_id` INT NOT NULL COMMENT '',
  `where` VARCHAR(45) NOT NULL COMMENT '',
  `when` VARCHAR(45) NOT NULL COMMENT '',
  `time` VARCHAR(45) NOT NULL COMMENT '',
  `title` VARCHAR(45) NOT NULL COMMENT '',
  `url` VARCHAR(45) NOT NULL COMMENT '',
  `type` VARCHAR(45) NOT NULL COMMENT '',
  `date_added` DATETIME NOT NULL COMMENT '',
  `date_posted` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`event_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ath`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ath` ;

CREATE TABLE IF NOT EXISTS `ath` (
  `ath_id` INT NOT NULL COMMENT '',
  `speaker` VARCHAR(45) NOT NULL COMMENT '',
  `category` VARCHAR(45) NOT NULL COMMENT '',
  `recognition` VARCHAR(45) NOT NULL COMMENT '',
  `food` VARCHAR(45) NOT NULL COMMENT '',
  `event_time` VARCHAR(45) NOT NULL COMMENT '',
  `date_posted` DATE NOT NULL COMMENT '',
  `date_added` DATETIME NOT NULL COMMENT '',
  PRIMARY KEY (`ath_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flex_hours`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `flex_hours` ;

CREATE TABLE IF NOT EXISTS `flex_hours` (
  `flex_id` INT NOT NULL COMMENT '',
  `store_name` VARCHAR(45) NOT NULL COMMENT '',
  `wk_m_o` VARCHAR(45) NOT NULL COMMENT '',
  `wk_m_c` VARCHAR(45) NOT NULL COMMENT '',
  `wk_l_o` VARCHAR(45) NOT NULL COMMENT '',
  `wk_l_c` VARCHAR(45) NOT NULL COMMENT '',
  `wk_d_o` VARCHAR(45) NOT NULL COMMENT '',
  `wk_d_c` VARCHAR(45) NOT NULL COMMENT '',
  `wkn_m_o` VARCHAR(45) NOT NULL COMMENT '',
  `wkn_m_c` VARCHAR(45) NOT NULL COMMENT '',
  `wkn_l_o` VARCHAR(45) NOT NULL COMMENT '',
  `wkn_l_c` VARCHAR(45) NOT NULL COMMENT '',
  `wkn_d_o` VARCHAR(45) NOT NULL COMMENT '',
  `wkn_d_c` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`flex_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dining_hall_hours`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dining_hall_hours` ;

CREATE TABLE IF NOT EXISTS `dining_hall_hours` (
  `dhall_id` INT NOT NULL COMMENT '',
  `dining_hall_name` VARCHAR(45) NOT NULL COMMENT '',
  `dining_hall_real` VARCHAR(45) NOT NULL COMMENT '',
  `wk_b_o` VARCHAR(45) NOT NULL COMMENT '',
  `wk_b_c` VARCHAR(45) NOT NULL COMMENT '',
  `wk_l_o` VARCHAR(45) NOT NULL COMMENT '',
  `wk_l_c` VARCHAR(45) NOT NULL COMMENT '',
  `wk_d_o` VARCHAR(45) NOT NULL COMMENT '',
  `wk_d_c` VARCHAR(45) NOT NULL COMMENT '',
  `wk_br_o` VARCHAR(45) NOT NULL COMMENT '',
  `wk_br_c` VARCHAR(45) NOT NULL COMMENT '',
  `wk_wd_o` VARCHAR(45) NOT NULL COMMENT '',
  `wk_wd_c` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`dhall_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `snack`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `snack` ;

CREATE TABLE IF NOT EXISTS `snack` (
  `snack_id` INT NOT NULL COMMENT '',
  `foodname` VARCHAR(45) NOT NULL COMMENT '',
  `date_posted` DATE NOT NULL COMMENT '',
  `date_added` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`snack_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sports` ;

CREATE TABLE IF NOT EXISTS `sports` (
  `sports_id` INT NOT NULL COMMENT '',
  `college` VARCHAR(45) NOT NULL COMMENT '',
  `sport` VARCHAR(45) NOT NULL DEFAULT 'Would also say Men\'s or Women\'s' COMMENT '',
  `opponent` VARCHAR(45) NOT NULL COMMENT '',
  `location` VARCHAR(45) NOT NULL COMMENT '',
  `date_posted` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`sports_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subscribers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subscribers` ;

CREATE TABLE IF NOT EXISTS `subscribers` (
  `subscriber_id` INT NOT NULL COMMENT '',
  `email` VARCHAR(45) NOT NULL COMMENT '',
  `subscr_date` DATETIME NOT NULL COMMENT '',
  PRIMARY KEY (`subscriber_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `email_articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `email_articles` ;

CREATE TABLE IF NOT EXISTS `email_articles` (
  `article_id` INT NOT NULL COMMENT '',
  `file_directory` VARCHAR(45) NOT NULL DEFAULT 'Where the email is kept after it\'s compiled' COMMENT '',
  `date_posted` DATE NOT NULL COMMENT '',
  `date_added` DATETIME NOT NULL COMMENT '',
  PRIMARY KEY (`article_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weather`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `weather` ;

CREATE TABLE IF NOT EXISTS `weather` (
  `weather_id` INT NOT NULL COMMENT '',
  `morning_temp` VARCHAR(45) NOT NULL COMMENT '',
  `day_hi` VARCHAR(45) NOT NULL COMMENT '',
  `day_lo` VARCHAR(45) NOT NULL COMMENT '',
  `next_day_hi` VARCHAR(45) NOT NULL COMMENT '',
  `next_day_lo` VARCHAR(45) NOT NULL COMMENT '',
  `next_day2_hi` VARCHAR(45) NOT NULL COMMENT '',
  `next_day2_lo` VARCHAR(45) NOT NULL COMMENT '',
  `next_day3_hi` VARCHAR(45) NOT NULL COMMENT '',
  `next_day3_lo` VARCHAR(45) NOT NULL COMMENT '',
  `date_posted` DATE NOT NULL COMMENT '',
  PRIMARY KEY (`weather_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `api_keys`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `api_keys` ;

CREATE TABLE IF NOT EXISTS `api_keys` (
  `api_id` INT NOT NULL COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `key` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`api_id`)  COMMENT '')
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;