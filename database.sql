-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd-manga-shoten
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd-manga-shoten
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd-manga-shoten` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bd-manga-shoten` ;

-- -----------------------------------------------------
-- Table `bd-manga-shoten`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-manga-shoten`.`author` (
  `id_author` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_author`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd-manga-shoten`.`editor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-manga-shoten`.`editor` (
  `id_editor` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `website` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_editor`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd-manga-shoten`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-manga-shoten`.`genre` (
  `id_type` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_type`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd-manga-shoten`.`manga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-manga-shoten`.`manga` (
  `id_manga` INT NOT NULL AUTO_INCREMENT,
  `title_en` VARCHAR(50) NOT NULL,
  `title_jp` VARCHAR(50) NOT NULL,
  `synopsis` VARCHAR(255) NULL DEFAULT NULL,
  `release_date` VARCHAR(4) NULL DEFAULT NULL,
  `id_author` INT NOT NULL,
  PRIMARY KEY (`id_manga`),
  UNIQUE INDEX `title_en` (`title_en` ASC) VISIBLE,
  UNIQUE INDEX `title_jp` (`title_jp` ASC) VISIBLE,
  INDEX `manga_ibfk_1` (`id_author` ASC) VISIBLE,
  CONSTRAINT `manga_ibfk_1`
    FOREIGN KEY (`id_author`)
    REFERENCES `bd-manga-shoten`.`author` (`id_author`))
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd-manga-shoten`.`genre_manga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-manga-shoten`.`genre_manga` (
  `id_manga` INT NOT NULL,
  `id_type` INT NOT NULL,
  PRIMARY KEY (`id_manga`, `id_type`),
  INDEX `id_type` (`id_type` ASC) VISIBLE,
  CONSTRAINT `genre_manga_ibfk_1`
    FOREIGN KEY (`id_manga`)
    REFERENCES `bd-manga-shoten`.`manga` (`id_manga`),
  CONSTRAINT `genre_manga_ibfk_2`
    FOREIGN KEY (`id_type`)
    REFERENCES `bd-manga-shoten`.`genre` (`id_type`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd-manga-shoten`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-manga-shoten`.`role` (
  `id_role` INT NOT NULL,
  `code_role` CHAR(20) NOT NULL,
  PRIMARY KEY (`id_role`),
  UNIQUE INDEX `code_role` (`code_role` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd-manga-shoten`.`tome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-manga-shoten`.`tome` (
  `id_tome` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `page_number` INT NULL DEFAULT NULL,
  `cover` VARCHAR(255) NULL DEFAULT NULL,
  `id_editor` INT NOT NULL,
  `id_manga` INT NOT NULL,
  PRIMARY KEY (`id_tome`),
  INDEX `tome_ibfk_1` (`id_editor` ASC) VISIBLE,
  INDEX `tome_ibfk_2` (`id_manga` ASC) VISIBLE,
  CONSTRAINT `tome_ibfk_1`
    FOREIGN KEY (`id_editor`)
    REFERENCES `bd-manga-shoten`.`editor` (`id_editor`),
  CONSTRAINT `tome_ibfk_2`
    FOREIGN KEY (`id_manga`)
    REFERENCES `bd-manga-shoten`.`manga` (`id_manga`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd-manga-shoten`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-manga-shoten`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `mail` VARCHAR(255) NOT NULL,
  `avatar` VARCHAR(255) NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(50) NOT NULL,
  `date_of_birth` DATE NULL DEFAULT NULL,
  `id_role` INT NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE,
  UNIQUE INDEX `mail` (`mail` ASC) VISIBLE,
  INDEX `id_role` (`id_role` ASC) VISIBLE,
  CONSTRAINT `user_ibfk_1`
    FOREIGN KEY (`id_role`)
    REFERENCES `bd-manga-shoten`.`role` (`id_role`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd-manga-shoten`.`user_tome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-manga-shoten`.`user_tome` (
  `id_user` INT NOT NULL,
  `id_tome` INT NOT NULL,
  PRIMARY KEY (`id_user`, `id_tome`),
  INDEX `id_tome` (`id_tome` ASC) VISIBLE,
  CONSTRAINT `user_tome_ibfk_1`
    FOREIGN KEY (`id_user`)
    REFERENCES `bd-manga-shoten`.`user` (`id_user`),
  CONSTRAINT `user_tome_ibfk_2`
    FOREIGN KEY (`id_tome`)
    REFERENCES `bd-manga-shoten`.`tome` (`id_tome`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
