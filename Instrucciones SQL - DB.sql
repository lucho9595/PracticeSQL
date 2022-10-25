-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProyectFinal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProyectFinal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProyectFinal` DEFAULT CHARACTER SET utf8 ;
USE `ProyectFinal` ;

-- -----------------------------------------------------
-- Table `ProyectFinal`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectFinal`.`user` (
  `idUser` INT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`idUser`));


-- -----------------------------------------------------
-- Table `ProyectFinal`.`Experiencia Laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectFinal`.`Experiencia Laboral` (
  `id` INT NOT NULL,
  `datos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectFinal`.`Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectFinal`.`Educacion` (
  `id` INT NOT NULL,
  `EducacionData` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectFinal`.`Hard Skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectFinal`.`Hard Skills` (
  `idHard` INT NOT NULL,
  `Hard Skills` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idHard`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectFinal`.`Soft Skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectFinal`.`Soft Skills` (
  `idSoft` INT NOT NULL,
  `Soft Skills` VARCHAR(45) NULL,
  PRIMARY KEY (`idSoft`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectFinal`.`Skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectFinal`.`Skills` (
  `idSkills` INT NOT NULL,
  `Soft Skills_idSoft` INT NOT NULL,
  `Hard Skills_idHard` INT NOT NULL,
  PRIMARY KEY (`idSkills`),
  INDEX `fk_Skills_Soft Skills1_idx` (`Soft Skills_idSoft` ASC) VISIBLE,
  INDEX `fk_Skills_Hard Skills1_idx` (`Hard Skills_idHard` ASC) VISIBLE,
  CONSTRAINT `fk_Skills_Soft Skills1`
    FOREIGN KEY (`Soft Skills_idSoft`)
    REFERENCES `ProyectFinal`.`Soft Skills` (`idSoft`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Skills_Hard Skills1`
    FOREIGN KEY (`Hard Skills_idHard`)
    REFERENCES `ProyectFinal`.`Hard Skills` (`idHard`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectFinal`.`Proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectFinal`.`Proyectos` (
  `idProyectos` INT NOT NULL,
  `Proyectoscol` VARCHAR(45) NOT NULL,
  `Image_proyects` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProyectos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProyectFinal`.`Portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProyectFinal`.`Portfolio` (
  `Skills_idSkills` INT NOT NULL,
  `Experiencia Laboral_id` INT NOT NULL,
  `Educacion_id` INT NOT NULL,
  `Proyectos_idProyectos` INT NOT NULL,
  `user_idUser` INT NOT NULL,
  INDEX `fk_Portfolio_Skills_idx` (`Skills_idSkills` ASC) VISIBLE,
  INDEX `fk_Portfolio_Experiencia Laboral1_idx` (`Experiencia Laboral_id` ASC) VISIBLE,
  INDEX `fk_Portfolio_Educacion1_idx` (`Educacion_id` ASC) VISIBLE,
  INDEX `fk_Portfolio_Proyectos1_idx` (`Proyectos_idProyectos` ASC) VISIBLE,
  INDEX `fk_Portfolio_user1_idx` (`user_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Portfolio_Skills`
    FOREIGN KEY (`Skills_idSkills`)
    REFERENCES `ProyectFinal`.`Skills` (`idSkills`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Portfolio_Experiencia Laboral1`
    FOREIGN KEY (`Experiencia Laboral_id`)
    REFERENCES `ProyectFinal`.`Experiencia Laboral` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Portfolio_Educacion1`
    FOREIGN KEY (`Educacion_id`)
    REFERENCES `ProyectFinal`.`Educacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Portfolio_Proyectos1`
    FOREIGN KEY (`Proyectos_idProyectos`)
    REFERENCES `ProyectFinal`.`Proyectos` (`idProyectos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Portfolio_user1`
    FOREIGN KEY (`user_idUser`)
    REFERENCES `ProyectFinal`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
