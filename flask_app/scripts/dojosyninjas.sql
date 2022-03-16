-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema esquema_usuarios
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema esquema_usuarios
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esquema_usuarios` ;
-- -----------------------------------------------------
-- Schema esquema_libros_3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema esquema_libros_3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esquema_libros_3` ;
-- -----------------------------------------------------
-- Schema esquema_muro_privado
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema esquema_muro_privado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esquema_muro_privado` ;
-- -----------------------------------------------------
-- Schema new_schema2
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema esquema_recetas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema esquema_recetas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esquema_recetas` ;
-- -----------------------------------------------------
-- Schema esquema_dojos_y_ninjas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema esquema_dojos_y_ninjas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esquema_dojos_y_ninjas` ;
USE `esquema_usuarios` ;

-- -----------------------------------------------------
-- Table `esquema_usuarios`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_usuarios`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

USE `esquema_libros_3` ;

-- -----------------------------------------------------
-- Table `esquema_libros_3`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_libros_3`.`authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_libros_3`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_libros_3`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `num_of_pages` INT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_libros_3`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_libros_3`.`favorites` (
  `author_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`author_id`, `book_id`),
  INDEX `fk_authors_has_books_books1_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_authors_has_books_authors_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_authors_has_books_authors`
    FOREIGN KEY (`author_id`)
    REFERENCES `esquema_libros_3`.`authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_authors_has_books_books1`
    FOREIGN KEY (`book_id`)
    REFERENCES `esquema_libros_3`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `esquema_muro_privado` ;

-- -----------------------------------------------------
-- Table `esquema_muro_privado`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_muro_privado`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_muro_privado`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_muro_privado`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `receiver_id` INT NOT NULL,
  `sender_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_messages_users_idx` (`receiver_id` ASC) VISIBLE,
  INDEX `fk_messages_users1_idx` (`sender_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_users`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `esquema_muro_privado`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`sender_id`)
    REFERENCES `esquema_muro_privado`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `esquema_recetas` ;

-- -----------------------------------------------------
-- Table `esquema_recetas`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_recetas`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(150) NULL,
  `last_name` VARCHAR(150) NULL,
  `email` VARCHAR(150) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_recetas`.`recipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_recetas`.`recipes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL,
  `under30` TINYINT NULL,
  `description` TEXT NULL,
  `instructions` TEXT NULL,
  `date_made` DATETIME NULL,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipes_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `esquema_recetas`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `esquema_dojos_y_ninjas` ;

-- -----------------------------------------------------
-- Table `esquema_dojos_y_ninjas`.`dojos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_dojos_y_ninjas`.`dojos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_dojos_y_ninjas`.`ninjas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_dojos_y_ninjas`.`ninjas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `age` INT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dojo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ninjas_dojos_idx` (`dojo_id` ASC) VISIBLE,
  CONSTRAINT `fk_ninjas_dojos`
    FOREIGN KEY (`dojo_id`)
    REFERENCES `esquema_dojos_y_ninjas`.`dojos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
