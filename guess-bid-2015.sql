-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema guessbid
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `guessbid` ;

-- -----------------------------------------------------
-- Schema guessbid
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `guessbid` ;
USE `guessbid` ;

-- -----------------------------------------------------
-- Table `guessbid`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `guessbid`.`User` ;

CREATE TABLE IF NOT EXISTS `guessbid`.`User` (
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `VirtualCredit` INT NOT NULL,
  `Telephone` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Birthday` DATE NOT NULL,
  PRIMARY KEY (`Email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `guessbid`.`Auction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `guessbid`.`Auction` ;

CREATE TABLE IF NOT EXISTS `guessbid`.`Auction` (
  `ID` INT NOT NULL,
  `DateStart` DATE NOT NULL,
  `DateEnd` DATE NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NULL,
  `OwnerID` VARCHAR(45) NOT NULL,
  `State` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  INDEX `fk_Auction_User1_idx` (`OwnerID` ASC),
  CONSTRAINT `fk_Auction_User1`
    FOREIGN KEY (`OwnerID`)
    REFERENCES `guessbid`.`User` (`Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `guessbid`.`Bid`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `guessbid`.`Bid` ;

CREATE TABLE IF NOT EXISTS `guessbid`.`Bid` (
  `UserID` VARCHAR(45) NOT NULL,
  `AuctionID` INT NOT NULL,
  `Amount` INT NOT NULL,
  `CheckNotification` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`UserID`, `AuctionID`),
  INDEX `fk_User_has_Auction_Auction1_idx` (`AuctionID` ASC),
  INDEX `fk_User_has_Auction_User1_idx` (`UserID` ASC),
  CONSTRAINT `fk_User_has_Auction_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `guessbid`.`User` (`Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Auction_Auction1`
    FOREIGN KEY (`AuctionID`)
    REFERENCES `guessbid`.`Auction` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
