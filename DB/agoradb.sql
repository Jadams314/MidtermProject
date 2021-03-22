-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema agoradb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `agoradb` ;

-- -----------------------------------------------------
-- Schema agoradb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `agoradb` DEFAULT CHARACTER SET utf8 ;
USE `agoradb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(2000) NULL,
  `city` VARCHAR(200) NULL,
  `state` VARCHAR(200) NULL,
  `zip_code` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `profile_img_url` VARCHAR(2000) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `creation_date` DATETIME NULL,
  `price` DOUBLE NULL,
  `seller_id` INT NOT NULL,
  `product_img_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_user1_idx` (`seller_id` ASC),
  CONSTRAINT `fk_product_user1`
    FOREIGN KEY (`seller_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory` ;

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(100) NOT NULL,
  `item_description` TEXT NULL,
  `price` DOUBLE NULL,
  `is_available` TINYINT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inventory_product1_idx` (`product_id` ASC),
  CONSTRAINT `fk_inventory_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase` ;

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inventory_id` INT NOT NULL,
  `rating` SMALLINT(5) NULL,
  `review` VARCHAR(1000) NULL,
  `buyer_id` INT NOT NULL,
  `purchase_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchase_user1_idx` (`buyer_id` ASC),
  INDEX `fk_purchase_inventory_idx` (`inventory_id` ASC),
  CONSTRAINT `fk_purchase_user1`
    FOREIGN KEY (`buyer_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_inventory`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping_cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shopping_cart` ;

CREATE TABLE IF NOT EXISTS `shopping_cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `is_purchased` TINYINT NULL DEFAULT 0,
  `user_id` INT NOT NULL,
  `purchase_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `checkout_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shopping_cart_user_idx` (`user_id` ASC),
  INDEX `fk_shopping_cart_history1_idx` (`purchase_id` ASC),
  CONSTRAINT `fk_shopping_cart_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_cart_history1`
    FOREIGN KEY (`purchase_id`)
    REFERENCES `purchase` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventory_to_shopping_cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory_to_shopping_cart` ;

CREATE TABLE IF NOT EXISTS `inventory_to_shopping_cart` (
  `shopping_cart_id` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  PRIMARY KEY (`shopping_cart_id`, `inventory_id`),
  INDEX `fk_shopping_cart_has_inventory_inventory1_idx` (`inventory_id` ASC),
  INDEX `fk_shopping_cart_has_inventory_shopping_cart1_idx` (`shopping_cart_id` ASC),
  CONSTRAINT `fk_shopping_cart_has_inventory_shopping_cart1`
    FOREIGN KEY (`shopping_cart_id`)
    REFERENCES `shopping_cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_cart_has_inventory_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product_to_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product_to_category` ;

CREATE TABLE IF NOT EXISTS `product_to_category` (
  `category_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `product_id`),
  INDEX `fk_category_has_product_product1_idx` (`product_id` ASC),
  INDEX `fk_category_has_product_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product_comment` ;

CREATE TABLE IF NOT EXISTS `product_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `create_date` DATETIME NULL,
  `product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_comment_product1_idx` (`product_id` ASC),
  INDEX `fk_product_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_product_comment_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS agorauser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'agorauser'@'localhost' IDENTIFIED BY 'agorauser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'agorauser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (1, '4 Elm', 'Elm City', 'CA', '60026');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (2, 'teststreet', 'test city', 'CO', '56312');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (1, 'admin', 'admin', 1, 'admin', 'adminemail@email.com', 'Bob', 'Dole', NULL, 1);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (2, 'testuser', 'testuser', 1, 'admin', 'test@email.com', 'tes1', 'test2', NULL, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `product`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (1, 'Mask product', 'Face mask in Product', '2020-03-18', 5.00, 1, NULL);
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (2, 'test product', 'this is a test product', '2020-03-18', 19.99, 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (1, 'Mask Inventory', 'In the Inventory', 3.99, 1, 1);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (2, 'Test Inventory', 'Test in Inventory', 15.99, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `purchase`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `purchase` (`id`, `inventory_id`, `rating`, `review`, `buyer_id`, `purchase_date`) VALUES (1, 1, 3, 'This mask is a test comment', 2, '2020-03-18');
INSERT INTO `purchase` (`id`, `inventory_id`, `rating`, `review`, `buyer_id`, `purchase_date`) VALUES (2, 2, 4, 'This test is another test comment', 2, '2020-03-18');

COMMIT;


-- -----------------------------------------------------
-- Data for table `shopping_cart`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `shopping_cart` (`id`, `is_purchased`, `user_id`, `purchase_id`, `create_date`, `checkout_date`) VALUES (1, 0, 2, 1, '2020-03-18', '2020-03-18');
INSERT INTO `shopping_cart` (`id`, `is_purchased`, `user_id`, `purchase_id`, `create_date`, `checkout_date`) VALUES (2, 0, 2, 2, '2020-03-18', '2020-03-18');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory_to_shopping_cart`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `inventory_to_shopping_cart` (`shopping_cart_id`, `inventory_id`) VALUES (1, 1);
INSERT INTO `inventory_to_shopping_cart` (`shopping_cart_id`, `inventory_id`) VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'Mask Category', 'In Category - mask');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (2, 'Test', 'Test in Category');

COMMIT;


-- -----------------------------------------------------
-- Data for table `product_to_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `product_to_category` (`category_id`, `product_id`) VALUES (1, 1);
INSERT INTO `product_to_category` (`category_id`, `product_id`) VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `product_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (1, 'A comment', '2020-03-18', 1, 1);
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (2, 'A test Comment', '2020-03-18', 2, 1);

COMMIT;

