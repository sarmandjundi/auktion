create database auktion;



CREATE TABLE
  `bid` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `item_id` int unsigned NOT NULL,
    `user_id` int unsigned NOT NULL,
    `price` double(8, 2) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `bid_item_id_foreign` (`item_id`),
    KEY `bid_user_id_foreign` (`user_id`),
    CONSTRAINT `bid_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
    CONSTRAINT `bid_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 15 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci
  
  
  
  CREATE TABLE
  `picture` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `url` varchar(255) NOT NULL,
    `item_id` int unsigned NOT NULL,
    PRIMARY KEY (`id`),
    KEY `picture_item_id_foreign` (`item_id`),
    CONSTRAINT `picture_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci
  
  
  
  
  CREATE TABLE
  `item` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(255) NOT NULL,
    `description` varchar(255) NOT NULL,
    `start_time` timestamp NOT NULL,
    `end_time` timestamp NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 29 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci




CREATE TABLE
  `user` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `firstname` varchar(255) NOT NULL,
    `lastname` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci

