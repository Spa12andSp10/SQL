CREATE DATABASE IF NOT EXISTS `warthunder_auction`;
USE `warthunder_auction`;

CREATE TABLE IF NOT EXISTS `ranks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rank` int unsigned NOT NULL,
  `br` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `ranks` (`rank`, `br`) VALUES (1, '1.0-2.3'),(2, '1.7-4.3'),(3, '3.0-6.0'),(4, '4.3-7.7'),(5, '6.7-8.7'),(6, '8.0-10.0'),(7, '9.3-12.0'),(8, '10.7-12.7');

CREATE TABLE IF NOT EXISTS `classes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `classes` (`name`) VALUES ('medium tank'), ('light tank'), ('self-propelled artillery installation'), ('anti-aircraft self-propelled gun'), ('heavy tank'), ('rocket tank');

CREATE TABLE IF NOT EXISTS  `nations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `nations` (`name`) VALUES ('USA'), ('Germany'), ('USSR'), ('UK'), ('Japan'), ('China'), ('Italy'), ('France'), ('Sweden'), ('Israel');

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `currencies` (`name`) VALUES ('Silver Lions'), ('Golden Eagles'), ('Gaijin Coins'), ('Real money');

CREATE TABLE IF NOT EXISTS `tanks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rank_id` int unsigned NOT NULL,
  `nation_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `tanks` (`name`, `rank_id`, `nation_id`, `class_id`) VALUES
('T-90M', 8, 3, 1),
('Bfw. Jagdpanther G1', 4, 2, 3),
('Type 16 (FPS)', 6, 5, 2),
('T58', 5, 1, 5),
('ItPsV Leopard', 6, 9, 4),
('T-69 II G', 6, 6, 1),
('Vijayanta', 6, 4, 1),
('Lorraine 155 Mle.50', 3, 8, 3),
('Zrinyi I', 3, 7, 3),
('HSTV-L', 8, 1, 2),
('Ra"am Sagol', 8, 10, 2),
('T-35', 1, 3, 5),
('BMPT-72', 8, 3, 6),
('TOG II', 3, 4, 5),
('IS-7', 6, 3, 5);

CREATE TABLE IF NOT EXISTS  `players` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `players` (`nickname`) VALUES ('Spa12andSp10'), ('Kitten cook'), ('YaBrauzer777'), ('Sever801'), ('user19878834'), ('StiVPiSaSanos'), ('Rain_the_knight');

CREATE TABLE IF NOT EXISTS `auctions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tank_id` int unsigned NOT NULL,
  `start_price` decimal(25, 2) NOT NULL,
  `finish_price` decimal(25, 2) DEFAULT NULL,
  `step` decimal(25, 2) DEFAULT NULL,
  `currency_id` int unsigned NOT NULL,
  `auction_date` date NOT NULL,
  `purchase` tinyint unsigned DEFAULT '0',
  `player_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `auctions` (`tank_id`, `start_price`, `finish_price`, `step`, `currency_id`, `auction_date`, `purchase`, `player_id`) VALUES
(10, 950000, 1000000, 50000, 1, '2025-05-20', 1, 1),
(3, 3899, NULL, 1000, 4, '2025-06-18', 0, NULL),
(2, 6090, 8090, 100, 2, '2026-03-25', 1, 2),
(6, 9090, 11090, 100, 2, '2026-03-27', 1, 6),
(9, 20, 40, 5, 3, '2026-03-29', 1, 7),
(11, 4999, NULL, 1000, 4, '2026-04-05', 0, NULL),
(5, 450000, 1450000, 100000, 1, '2026-05-14', 1, 3),
(8, 10000, 46000, 1000, 4, '2026-05-16', 1, 4),
(12, 2100, 4600, 500, 2, '2026-05-17', 1, 5),
(4, 35, 100, 5, 3, '2026-05-18', 1, 3),
(1, 1100000, 2600000, 100000, 1, '2026-05-19', 1, 1),
(7, 9590, NULL, 100, 2, '2026-05-20', 0, NULL),
(13, 4999, 10999, 1000, 4, '2026-05-21', 1, 6),
(14, 299, NULL, 100, 3, '2026-05-22', 0, NULL),
(15, 2500, 4000, 500, 3, '2026-05-23', 1, 3);

