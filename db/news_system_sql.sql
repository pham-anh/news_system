-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema heroku_38ebe7dc01ca634
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema heroku_38ebe7dc01ca634
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `heroku_38ebe7dc01ca634` DEFAULT CHARACTER SET latin1 ;
USE `heroku_38ebe7dc01ca634` ;

-- -----------------------------------------------------
-- Table `heroku_38ebe7dc01ca634`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_38ebe7dc01ca634`.`category` ;

CREATE TABLE IF NOT EXISTS `heroku_38ebe7dc01ca634`.`category` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` CHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `heroku_38ebe7dc01ca634`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_38ebe7dc01ca634`.`user` ;

CREATE TABLE IF NOT EXISTS `heroku_38ebe7dc01ca634`.`user` (
  `user_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `level` CHAR(1) NOT NULL DEFAULT '1',
  `password` CHAR(72) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 54
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `heroku_38ebe7dc01ca634`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_38ebe7dc01ca634`.`post` ;

CREATE TABLE IF NOT EXISTS `heroku_38ebe7dc01ca634`.`post` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` TEXT CHARACTER SET 'utf8' NOT NULL,
  `category` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `author` INT(10) UNSIGNED NOT NULL,
  `short_content` TEXT CHARACTER SET 'utf8' NOT NULL,
  `content` LONGTEXT CHARACTER SET 'utf8' NOT NULL,
  `img` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `topic` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `ref` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id` (`id` ASC),
  INDEX `author` (`author` ASC),
  INDEX `category` (`category` ASC),
  INDEX `author_2` (`author` ASC),
  INDEX `author_3` (`author` ASC),
  CONSTRAINT `author`
    FOREIGN KEY (`author`)
    REFERENCES `heroku_38ebe7dc01ca634`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `heroku_38ebe7dc01ca634`.`topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `heroku_38ebe7dc01ca634`.`topic` ;

CREATE TABLE IF NOT EXISTS `heroku_38ebe7dc01ca634`.`topic` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
