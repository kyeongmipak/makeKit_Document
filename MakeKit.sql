-- MySQL Script generated by MySQL Workbench
-- Mon Jan 11 23:07:42 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema makekit
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema makekit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `makekit` DEFAULT CHARACTER SET utf8 ;
USE `makekit` ;

-- -----------------------------------------------------
-- Table `makekit`.`userinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`userinfo` (
  `userEmail` VARCHAR(15) NOT NULL,
  `userPw` VARCHAR(25) NOT NULL,
  `userName` VARCHAR(10) NULL DEFAULT NULL,
  `userAddress` VARCHAR(45) NULL DEFAULT NULL,
  `userAddressDetail` VARCHAR(45) NULL DEFAULT NULL,
  `userTel` VARCHAR(15) NULL DEFAULT NULL,
  `userBirth` VARCHAR(13) NULL DEFAULT NULL,
  `userInsertDate` DATE NULL DEFAULT NULL,
  `userDeleteDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`userEmail`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `makekit`.`cartinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`cartinfo` (
  `cartNo` INT(11) NOT NULL AUTO_INCREMENT,
  `userinfo_userEmail` VARCHAR(15) NOT NULL,
  `cartDate` DATETIME NULL DEFAULT NULL,
  `cartTotalPrice` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`cartNo`, `userinfo_userEmail`),
  INDEX `fk_orderinfo_user2_idx` (`userinfo_userEmail` ASC) VISIBLE,
  CONSTRAINT `fk_orderinfo_user20`
    FOREIGN KEY (`userinfo_userEmail`)
    REFERENCES `makekit`.`userinfo` (`userEmail`))
ENGINE = InnoDB
AUTO_INCREMENT = 69
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `makekit`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`product` (
  `productNo` INT(11) NOT NULL AUTO_INCREMENT,
  `productName` VARCHAR(45) NULL DEFAULT NULL,
  `productType` VARCHAR(25) NULL DEFAULT NULL,
  `productPrice` VARCHAR(10) NULL DEFAULT NULL,
  `productStock` VARCHAR(5) NULL DEFAULT NULL,
  `productContent` TEXT NULL DEFAULT NULL,
  `productFilename` VARCHAR(45) NULL DEFAULT NULL,
  `productDFilename` VARCHAR(45) NULL DEFAULT NULL,
  `productAFilename` VARCHAR(45) NULL DEFAULT NULL,
  `productInsertDate` DATETIME NULL DEFAULT NULL,
  `productDeleteDate` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`productNo`),
  UNIQUE INDEX `prdNo_UNIQUE` (`productNo` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `makekit`.`cartdetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`cartdetail` (
  `DcartNo` INT(11) NOT NULL AUTO_INCREMENT,
  `product_productNo` INT(11) NOT NULL,
  `userinfo_userEmail` VARCHAR(15) NOT NULL,
  `cartinfo_cartNo` INT(11) NOT NULL,
  `cartQuantity` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`DcartNo`),
  INDEX `goods_prdNo` (`product_productNo` ASC) VISIBLE,
  INDEX `user_userId` (`userinfo_userEmail` ASC) VISIBLE,
  INDEX `fk_orderdetail_copy1_cartinfo1_idx` (`cartinfo_cartNo` ASC) VISIBLE,
  CONSTRAINT `fk_orderdetail_copy1_cartinfo1`
    FOREIGN KEY (`cartinfo_cartNo`)
    REFERENCES `makekit`.`cartinfo` (`cartNo`),
  CONSTRAINT `orderdetail_ibfk_20`
    FOREIGN KEY (`product_productNo`)
    REFERENCES `makekit`.`product` (`productNo`),
  CONSTRAINT `orderdetail_ibfk_30`
    FOREIGN KEY (`userinfo_userEmail`)
    REFERENCES `makekit`.`userinfo` (`userEmail`))
ENGINE = InnoDB
AUTO_INCREMENT = 199
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `makekit`.`chatting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`chatting` (
  `userinfo_userEmail_sender` VARCHAR(15) NOT NULL,
  `userinfo_userEmail_receiver` VARCHAR(15) NOT NULL,
  `chattingContents` TEXT NULL DEFAULT NULL,
  `chattingInsertDate` DATETIME NULL DEFAULT NULL,
  `chattingNumber` INT(11) NULL DEFAULT NULL,
  INDEX `fk_chatting_userinfo1_idx` (`userinfo_userEmail_sender` ASC) VISIBLE,
  INDEX `fk_chatting_userinfo2_idx` (`userinfo_userEmail_receiver` ASC) VISIBLE,
  CONSTRAINT `fk_chatting_userinfo1`
    FOREIGN KEY (`userinfo_userEmail_sender`)
    REFERENCES `makekit`.`userinfo` (`userEmail`),
  CONSTRAINT `fk_chatting_userinfo2`
    FOREIGN KEY (`userinfo_userEmail_receiver`)
    REFERENCES `makekit`.`userinfo` (`userEmail`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `makekit`.`likeuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`likeuser` (
  `userinfo_userEmail` VARCHAR(15) NOT NULL,
  `userinfo_like_userEmail` VARCHAR(15) NOT NULL,
  INDEX `fk_likeuser_userinfo1_idx` (`userinfo_userEmail` ASC) VISIBLE,
  INDEX `fk_likeuser_userinfo2_idx` (`userinfo_like_userEmail` ASC) VISIBLE,
  CONSTRAINT `fk_likeuser_userinfo1`
    FOREIGN KEY (`userinfo_userEmail`)
    REFERENCES `makekit`.`userinfo` (`userEmail`),
  CONSTRAINT `fk_likeuser_userinfo2`
    FOREIGN KEY (`userinfo_like_userEmail`)
    REFERENCES `makekit`.`userinfo` (`userEmail`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `makekit`.`notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`notice` (
  `nSeqno` INT(11) NOT NULL AUTO_INCREMENT,
  `nTitle` VARCHAR(45) NOT NULL,
  `nContent` TEXT NOT NULL,
  `nDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`nSeqno`),
  UNIQUE INDEX `seqno_UNIQUE` (`nSeqno` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `makekit`.`orderinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`orderinfo` (
  `orderNo` INT(11) NOT NULL,
  `userinfo_userEmail` VARCHAR(15) NOT NULL,
  `orderDate` DATETIME NULL DEFAULT NULL,
  `orderReceiver` VARCHAR(15) NULL DEFAULT NULL,
  `orderRcvAddress` VARCHAR(45) NULL DEFAULT NULL,
  `orderRcvAddressDetail` VARCHAR(45) NULL DEFAULT NULL,
  `orderRcvPhone` VARCHAR(15) NULL DEFAULT NULL,
  `orderTotalPrice` INT(11) NULL DEFAULT NULL,
  `orderBank` VARCHAR(6) NULL DEFAULT NULL,
  `orderCardNo` VARCHAR(20) NULL DEFAULT NULL,
  `orderCardPw` VARCHAR(10) NULL DEFAULT NULL,
  `orderDelivery` VARCHAR(15) NULL DEFAULT '상품 준비중',
  `orderDeliveryDate` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`orderNo`),
  INDEX `fk_orderinfo_user2_idx` (`userinfo_userEmail` ASC) VISIBLE,
  CONSTRAINT `fk_orderinfo_user2`
    FOREIGN KEY (`userinfo_userEmail`)
    REFERENCES `makekit`.`userinfo` (`userEmail`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `makekit`.`orderdetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`orderdetail` (
  `orderDetailNo` INT(11) NOT NULL,
  `orderinfo_orderNo` INT(11) NOT NULL,
  `userinfo_userEmail` VARCHAR(15) NOT NULL,
  `goods_productNo` INT(11) NOT NULL,
  `orderQuantity` INT(11) NULL DEFAULT NULL,
  `orderConfirm` INT(2) NULL DEFAULT NULL,
  `orderRefund` DATETIME NULL DEFAULT NULL,
  `orderStar` VARCHAR(3) NULL DEFAULT NULL,
  `orderReview` TEXT NULL DEFAULT NULL,
  `orderReviewImg` VARCHAR(45) NULL DEFAULT NULL,
  `orderReviewInsertDate` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`orderDetailNo`),
  INDEX `fk_orderdetail_orderinfo1_idx` (`orderinfo_orderNo` ASC) VISIBLE,
  INDEX `goods_prdNo` (`goods_productNo` ASC) VISIBLE,
  INDEX `fk_orderdetail_userinfo1_idx` (`userinfo_userEmail` ASC) VISIBLE,
  CONSTRAINT `orderdetail_ibfk_1`
    FOREIGN KEY (`orderinfo_orderNo`)
    REFERENCES `makekit`.`orderinfo` (`orderNo`),
  CONSTRAINT `orderdetail_ibfk_2`
    FOREIGN KEY (`goods_productNo`)
    REFERENCES `makekit`.`product` (`productNo`),
  CONSTRAINT `fk_orderdetail_userinfo1`
    FOREIGN KEY (`userinfo_userEmail`)
    REFERENCES `makekit`.`userinfo` (`userEmail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `makekit`.`register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`register` (
  `userinfo_userEmail` VARCHAR(15) NOT NULL,
  `product_productNo` INT(11) NOT NULL,
  `selleraddress` VARCHAR(45) NULL DEFAULT NULL,
  `selleraddressdetail` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`product_productNo`),
  INDEX `fk_register_userinfo1_idx` (`userinfo_userEmail` ASC) VISIBLE,
  CONSTRAINT `fk_register_product1`
    FOREIGN KEY (`product_productNo`)
    REFERENCES `makekit`.`product` (`productNo`),
  CONSTRAINT `fk_register_userinfo1`
    FOREIGN KEY (`userinfo_userEmail`)
    REFERENCES `makekit`.`userinfo` (`userEmail`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `makekit`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `makekit`.`wishlist` (
  `userinfo_userEmail` VARCHAR(15) NOT NULL,
  `product_productNo` INT(11) NOT NULL,
  `wishlistInsertDate` DATETIME NULL DEFAULT NULL,
  INDEX `fk_wishlist_userinfo1_idx` (`userinfo_userEmail` ASC) VISIBLE,
  INDEX `fk_wishlist_product1_idx` (`product_productNo` ASC) VISIBLE,
  CONSTRAINT `fk_wishlist_product1`
    FOREIGN KEY (`product_productNo`)
    REFERENCES `makekit`.`product` (`productNo`),
  CONSTRAINT `fk_wishlist_userinfo1`
    FOREIGN KEY (`userinfo_userEmail`)
    REFERENCES `makekit`.`userinfo` (`userEmail`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
