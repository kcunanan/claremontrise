-- MySQL Script generated by MySQL Workbench
-- Wed Jul 15 16:06:00 2015
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

USE db584027681;

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL ,
  `college` VARCHAR(50) NOT NULL ,
  `username` VARCHAR(100) NOT NULL ,
  `email` VARCHAR(100) NOT NULL ,
  `password` VARCHAR(100) NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `remember_token` VARCHAR(45) NULL ,
  PRIMARY KEY (`user_id`)  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Claremont Rise`.`weather`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `weather` ;

CREATE TABLE IF NOT EXISTS `weather` (
  `weather_id` INT NOT NULL AUTO_INCREMENT ,
  `morning_temp` VARCHAR(45) NOT NULL ,
  `day_hi` VARCHAR(45) NOT NULL ,
  `day_lo` VARCHAR(45) NOT NULL ,
  `next_day_hi` VARCHAR(45) NOT NULL ,
  `next_day_lo` VARCHAR(45) NOT NULL ,
  `next_day2_hi` VARCHAR(45) NOT NULL ,
  `next_day2_lo` VARCHAR(45) NOT NULL ,
  `next_day3_hi` VARCHAR(45) NOT NULL ,
  `next_day3_lo` VARCHAR(45) NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  PRIMARY KEY (`weather_id`)  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Claremont Rise`.`subscribers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subscribers` ;

CREATE TABLE IF NOT EXISTS `subscribers` (
  `subscriber_id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(100) NOT NULL ,
  `college` VARCHAR(50) NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  PRIMARY KEY (`subscriber_id`)  )
ENGINE = InnoDB;