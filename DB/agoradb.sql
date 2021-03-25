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
-- Table `shopping_cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shopping_cart` ;

CREATE TABLE IF NOT EXISTS `shopping_cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `is_purchased` TINYINT NULL DEFAULT 0,
  `user_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `checkout_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shopping_cart_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_shopping_cart_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
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
  `purchase_date` DATETIME NULL,
  `shopping_cart_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchase_inventory_idx` (`inventory_id` ASC),
  INDEX `fk_purchase_shopping_cart1_idx` (`shopping_cart_id` ASC),
  CONSTRAINT `fk_purchase_inventory`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_shopping_cart1`
    FOREIGN KEY (`shopping_cart_id`)
    REFERENCES `shopping_cart` (`id`)
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
-- DROP USER IF EXISTS agorauser@localhost;
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
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (3, '1137 Diamond Cove', 'Providence', 'RI', '29061');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (4, '754 Brown Avenue', 'Greenwood', 'SC', '29646');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (5, '4157 Burwell Road', 'Beaumont', 'TX', '77701');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (6, '1229 Ottis Street', 'SouthFields', 'NY', '10975');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (7, '1082 Johnson Street', 'Benson', 'NC', '27504');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (8, '1030 Angus Road', 'New York', 'NY', '10048');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (9, '3226 Spring Avenue', 'Philadelphia', 'PA', '19108');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (10, '4281 Murry Street', 'Virgina Beach', 'VA', '23462');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (11, '276 Trails End Road', 'Riverdale', 'GA', '30296');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (12, '352 Quiet Valley Lane', 'Burbank', 'CA', '91502');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (1, 'admin', 'admin', 1, 'admin', 'adminemail@email.com', 'Bob', 'Dole', 'NULL', 1);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (2, 'testuser', 'testuser', 1, 'admin', 'test@email.com', 'tes1', 'test2', 'NULL', 2);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (3, 'sondrauser', 'sondrapass', 1, 'user', 'sondra@email.com', 'Sondra', 'Criswell', 'NULL', 3);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (4, 'maryuser', 'marypass', 1, 'user', 'mary@email.com', 'Mary', 'Wieland', 'NULL', 4);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (5, 'clarenceuser', 'clarencepass', 1, 'user', 'clarence@email.com', 'Clarence', 'Beltran', 'NULL', 5);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (6, 'danieluser', 'danielpass', 1, 'user', 'daniel@email.com', 'Daniel', 'Clark', 'NULL', 6);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (7, 'melissauser', 'melissapass ', 1, 'user', 'melissa@email.com', 'Melissa', 'Fort', 'NULL', 7);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (8, 'felipeuser', 'felipepass', 1, 'user', 'felipe@email.com', 'Felipe', 'Standley', 'NULL', 8);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (9, 'orauser ', 'orapass ', 1, 'user', 'ora@email.com', 'Ora', 'Webb', 'NULL', 9);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (10, 'melanieuser', 'melaniepass', 1, 'user', 'melanie@email.com', 'Melanie', 'Brumbaugh', 'NULL', 10);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (11, 'rodgeruser', 'rodgerpass', 1, 'user', 'rodger@email.com', 'Rodger', 'Davis', 'NULL', 11);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `first_name`, `last_name`, `profile_img_url`, `address_id`) VALUES (12, 'eileenuser', 'eileenpass', 1, 'user', 'eileen@email.com', 'Eileen', 'Downs', 'NULL', 12);

COMMIT;


-- -----------------------------------------------------
-- Data for table `product`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (1, 'Mask product', 'Face mask in Product', '2020-03-18', 3.99, 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Full_face_diving_mask_-_ocean_reef.JPG/220px-Full_face_diving_mask_-_ocean_reef.JPG');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (2, 'test product', 'this is a test product', '2020-03-18', 15.99, 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/StateLibQld_1_100348.jpg/220px-StateLibQld_1_100348.jpg');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (3, 'Nintendo Entertainment System', 'NES is an 8-bit third-generation home video game console produced by Nintendo. The NES featured a number of groundbreaking games. ', '2020-03-18', 500.00, 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/220px-NES-Console-Set.jpg');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (4, 'Sega Genesis', 'Sega Gensis is a 16-bit fourth-generation home video game console developed and sold by Sega', '2020-03-18', 200.00, 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Sega-Mega-Drive-JP-Mk1-Console-Set.jpg/250px-Sega-Mega-Drive-JP-Mk1-Console-Set.jpg');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (5, 'PlayStation', 'PlayStation or PS1 is a home video game console developed and marketed by Sony Computer Entertainment. ', '2020-03-18', 100.00, 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/PSX-Console-wController.jpg/250px-PSX-Console-wController.jpg');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (6, 'Xbox', 'Video Gaming console created by Microsoft. The name Xbox was derived from a contraction of DirectX Box, a reference to Microsoft’s graphics API, DirectX', '2020-03-18', 100.00, 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Xbox-console.jpg/220px-Xbox-console.jpg');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (7, 'PlayStation 580', 'The next new Sony console yet to be release but is obviously over hyped.', '2020-03-18', 1000.00, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB1U9irN1OjwZAxZTXNLfH6cRRuj9HF4Uk_Q&usqp=CAU');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (8, 'Xbox 1000', 'The next new Microsoft console yet to be release but is obviously over hyped.', '2020-03-18', 1000.00, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM_Y9_38q6Kac-9oE0dzu8_BbmugbQ_Y9y1A&usqp=CAU');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (9, 'Halo', 'First-person shooter centered on interstellar war between humanity and an alliance of aliens known as the Covenant.', '2020-03-18', 60.00, 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Halo_%28series%29_logo.svg/120px-Halo_%28series%29_logo.svg.png');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (10, 'God of War', 'Action-adventure based in ancient mythology, the story follow Kratos, a Spartan warrior who was tricked into killing his family by his former master, the Greek God of War Ares.', '2020-03-18', 60.00, 5, 'https://upload.wikimedia.org/wikipedia/en/thumb/b/b5/God_of_War_%28Norse%29_logo.png/250px-God_of_War_%28Norse%29_logo.png');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (11, 'Atari 2600', 'Home video game console developed by Atari, Inc. Credited with popularizing the use of microprocessor-based hardware and games stored on ROM cartridges.', '2020-03-18', 1000.00, 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Atari-2600-Wood-4Sw-Set.jpg/300px-Atari-2600-Wood-4Sw-Set.jpg');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (12, 'Space Invaders', 'The first fixed shooter set the template for the shoot ‘em up genre.', '2020-03-18', 200.00, 1, 'https://upload.wikimedia.org/wikipedia/en/0/0f/Space_Invaders_flyer%2C_1978.jpg');
INSERT INTO `product` (`id`, `name`, `description`, `creation_date`, `price`, `seller_id`, `product_img_url`) VALUES (13, 'Pac-Man', 'Player controls the title character who attempts to consume all of the wafers while avoiding four ghosts that pursue him.', '2020-03-18', 200.00, 1, 'https://upload.wikimedia.org/wikipedia/en/0/03/PacMan2600box.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (1, 'Mask Inventory', 'In the Inventory', 3.99, 1, 1);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (2, 'Test Inventory', 'Test in Inventory', 15.99, 1, 2);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (3, 'Atari 2600', 'Home video game console developed by Atari, Inc. Credited with popularizing the use of microprocessor-based hardware and games stored on ROM cartridges.', 5000.00, 1, 11);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (4, 'Nintendo Entertainment System', 'NES is an 8-bit third-generation home video game console produced by Nintendo. The NES featured a number of groundbreaking games. ', 500.00, 1, 3);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (5, 'Nintendo Entertainment System', 'NES is an 8-bit third-generation home video game console produced by Nintendo. The NES featured a number of groundbreaking games. ', 500.00, 1, 3);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (6, 'Nintendo Entertainment System', 'NES is an 8-bit third-generation home video game console produced by Nintendo. The NES featured a number of groundbreaking games. ', 500.00, 0, 3);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (7, 'Sega Genesis', 'Sega Gensis is a 16-bit fourth-generation home video game console developed and sold by Sega', 200.00, 1, 4);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (8, 'Sega Genesis', 'Sega Gensis is a 16-bit fourth-generation home video game console developed and sold by Sega', 200.00, 0, 4);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (9, 'PlayStation', 'PlayStation or PS1 is a home video game console developed and marketed by Sony Computer Entertainment. ', 100.00, 1, 5);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (10, 'Xbox', 'Video Gaming console created by Microsoft. The name Xbox was derived from a contraction of DirectX Box, a reference to Microsoft’s graphics API, DirectX', 100.00, 1, 6);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (11, 'PlayStation 580', 'The next new Sony console yet to be release but is obviously over hyped.', 1000.00, 0, 7);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (12, 'Xbox 1000', 'The next new Microsoft console yet to be release but is obviously over hyped.', 1000.00, 0, 8);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (13, 'Halo', 'First-person shooter centered on interstellar war between humanity and an alliance of aliens known as the Covenant.', 69.00, 1, 9);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (14, 'Halo', 'First-person shooter centered on interstellar war between humanity and an alliance of aliens known as the Covenant.', 69.00, 1, 9);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (15, 'Halo', 'First-person shooter centered on interstellar war between humanity and an alliance of aliens known as the Covenant.', 69.00, 0, 9);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (16, 'Halo', 'First-person shooter centered on interstellar war between humanity and an alliance of aliens known as the Covenant.', 69.00, 0, 9);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (17, 'God of War', 'Action-adventure based in ancient mythology, the story follow Kratos, a Spartan warrior who was tricked into killing his family by his former master, the Greek God of War Ares.', 65.00, 1, 10);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (18, 'God of War', 'Action-adventure based in ancient mythology, the story follow Kratos, a Spartan warrior who was tricked into killing his family by his former master, the Greek God of War Ares.', 65.00, 1, 10);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (19, 'God of War', 'Action-adventure based in ancient mythology, the story follow Kratos, a Spartan warrior who was tricked into killing his family by his former master, the Greek God of War Ares.', 65.00, 0, 10);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (20, 'God of War', 'Action-adventure based in ancient mythology, the story follow Kratos, a Spartan warrior who was tricked into killing his family by his former master, the Greek God of War Ares.', 65.00, 0, 10);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (21, 'Space Invaders', 'The first fixed shooter set the template for the shoot ‘em up genre.', 200.00, 1, 12);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (22, 'Space Invaders', 'The first fixed shooter set the template for the shoot ‘em up genre.', 200.00, 0, 12);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (23, 'Pac-Man', 'Player controls the title character who attempts to consume all of the wafers while avoiding four ghosts that pursue him.', 200.00, 0, 13);
INSERT INTO `inventory` (`id`, `item_name`, `item_description`, `price`, `is_available`, `product_id`) VALUES (24, 'Pac-Man', 'Player controls the title character who attempts to consume all of the wafers while avoiding four ghosts that pursue him.', 200.00, 0, 13);

COMMIT;


-- -----------------------------------------------------
-- Data for table `shopping_cart`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `shopping_cart` (`id`, `is_purchased`, `user_id`, `create_date`, `checkout_date`) VALUES (1, 0, 2, '2020-03-18', '2020-03-18');
INSERT INTO `shopping_cart` (`id`, `is_purchased`, `user_id`, `create_date`, `checkout_date`) VALUES (2, 0, 2, '2020-03-18', '2020-03-18');

COMMIT;


-- -----------------------------------------------------
-- Data for table `purchase`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `purchase` (`id`, `inventory_id`, `rating`, `review`, `purchase_date`, `shopping_cart_id`) VALUES (1, 1, 3, 'This mask is a test comment', '2020-03-18', 1);
INSERT INTO `purchase` (`id`, `inventory_id`, `rating`, `review`, `purchase_date`, `shopping_cart_id`) VALUES (2, 2, 4, 'This test is another test comment', '2020-03-18', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `agoradb`;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'Mask', 'In Category - mask');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (2, 'Test', 'Test in Category');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (3, 'Video Game Console', 'The latest video game console');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (4, 'Video Game', 'A video game');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (5, 'New', 'A new product');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (6, 'Used', 'A used product');

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
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (1, 'This is the BEST MASK EVER!', '2020-03-18', 1, 1);
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (2, 'A test Comment', '2020-03-18', 2, 1);
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (3, 'You\'ll LOVE the NES!', '2020-03-18', 3, 3);
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (4, 'GENESIS is the best!', '2020-03-18', 4, 4);
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (5, 'PS RULES!', '2020-03-18', 5, 5);
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (6, 'XBOX is SOOOO COOL', '2020-03-18', 6, 1);
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (7, 'HALO, need I say more!?', '2020-03-18', 9, 4);
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (8, 'GOW, the only reason to own PS', '2020-03-18', 10, 5);
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (9, 'Atari is the GOAT', '2020-03-18', 11, 1);
INSERT INTO `product_comment` (`id`, `content`, `create_date`, `product_id`, `user_id`) VALUES (10, 'Atari is the GOAT(UPDATE/DELETE)', '2020-03-18', 11, 1);

COMMIT;
