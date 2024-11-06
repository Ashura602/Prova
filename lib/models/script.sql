-- MySQL Script generated by MySQL Workbench
-- Wed Nov  6 08:35:43 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema prova
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema prova
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prova` DEFAULT CHARACTER SET utf8 ;
USE `prova` ;

-- -----------------------------------------------------
-- Table `prova`.`Professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prova`.`Professores` (
  `idProfessores` INT NOT NULL AUTO_INCREMENT,
  `nomeProfessor` VARCHAR(45) NOT NULL,
  `senhaProfessor` VARCHAR(45) NOT NULL,
  `emailProfessor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfessores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prova`.`Turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prova`.`Turmas` (
  `idTurmas` INT NOT NULL AUTO_INCREMENT,
  `nomeTurma` VARCHAR(45) NOT NULL,
  `periodoLetivo` VARCHAR(45) NOT NULL,
  `Professores_idProfessores` INT NOT NULL,
  PRIMARY KEY (`idTurmas`, `Professores_idProfessores`),
    FOREIGN KEY (`Professores_idProfessores`)
    REFERENCES `prova`.`Professores` (`idProfessores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prova`.`Atividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prova`.`Atividades` (
  `idAtividade` INT NOT NULL AUTO_INCREMENT,
  `idTurmas` INT NOT NULL,
  `nomeAtividade` VARCHAR(45) NOT NULL,
  `descricaoAtividade` VARCHAR(45) NOT NULL,
  `dataEntrega` VARCHAR(45) NOT NULL,
  `pesoNota` INT NOT NULL,
  PRIMARY KEY (`idAtividade`, `idTurmas`),
    FOREIGN KEY (`idTurmas`)
    REFERENCES `prova`.`Turmas` (`idTurmas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
