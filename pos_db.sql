/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : pos_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2023-06-11 00:01:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cashflow`
-- ----------------------------
DROP TABLE IF EXISTS `cashflow`;
CREATE TABLE `cashflow` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL,
  `amount` decimal(18,2) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `transaction_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`transaction_id`),
  KEY `username` (`username`),
  CONSTRAINT `cashflow_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of cashflow
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `image` varchar(30) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('123', 'test', 'test', 'test', 'test', '');
INSERT INTO `customer` VALUES ('124', '714268404', '', '', '', '');
INSERT INTO `customer` VALUES ('125', '1802042194', '', '', '', '');
INSERT INTO `customer` VALUES ('126', '2127232689', '', '', '', '');
INSERT INTO `customer` VALUES ('127', '1757957385', '', '', '', '');
INSERT INTO `customer` VALUES ('128', '1937713834', '', '', '', '');
INSERT INTO `customer` VALUES ('129', '589824579', '', '', '', '');
INSERT INTO `customer` VALUES ('130', '614706133', '', '', '', '');
INSERT INTO `customer` VALUES ('131', '2065772843', '', '', '', '');
INSERT INTO `customer` VALUES ('132', '1316144292', '', '', '', '');
INSERT INTO `customer` VALUES ('133', '1583191926', '', '', '', '');
INSERT INTO `customer` VALUES ('134', '608572225', '', '', '', '');
INSERT INTO `customer` VALUES ('135', '1769075497', '', '', '', '');
INSERT INTO `customer` VALUES ('136', '394429503', '', '', '', '');
INSERT INTO `customer` VALUES ('137', '569374165', '', '', '', '');
INSERT INTO `customer` VALUES ('138', '899478627', '', '', '', '');
INSERT INTO `customer` VALUES ('139', '1730118667', '', '', '', '');
INSERT INTO `customer` VALUES ('140', '1784359225', '', '', '', '');
INSERT INTO `customer` VALUES ('141', '1591605931', '', '', '', '');
INSERT INTO `customer` VALUES ('142', '553749880', '', '', '', '');
INSERT INTO `customer` VALUES ('143', '1408014617', '', '', '', '');

-- ----------------------------
-- Table structure for `delivery`
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `transaction_no` varchar(20) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`transaction_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of delivery
-- ----------------------------

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `logs_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('1', 'user', 'User user login', '2023-06-08 23:35:19');
INSERT INTO `logs` VALUES ('2', 'user', 'User user login', '2023-06-08 23:42:26');
INSERT INTO `logs` VALUES ('3', 'user', 'User user login', '2023-06-09 00:02:01');
INSERT INTO `logs` VALUES ('4', 'user', 'Product sold', '2023-06-09 00:15:32');
INSERT INTO `logs` VALUES ('5', 'user', 'Product sold', '2023-06-09 00:17:50');
INSERT INTO `logs` VALUES ('6', 'user', 'Product sold', '2023-06-09 00:20:24');
INSERT INTO `logs` VALUES ('7', 'user', 'User user logout', '2023-06-09 00:23:07');
INSERT INTO `logs` VALUES ('8', 'admin', 'User admin login', '2023-06-09 00:23:16');
INSERT INTO `logs` VALUES ('9', 'admin', 'User admin login', '2023-06-10 10:56:31');
INSERT INTO `logs` VALUES ('10', 'admin', 'User admin login', '2023-06-10 10:57:39');
INSERT INTO `logs` VALUES ('11', 'admin', 'User admin login', '2023-06-10 11:01:47');
INSERT INTO `logs` VALUES ('12', 'admin', 'User admin login', '2023-06-10 11:02:12');
INSERT INTO `logs` VALUES ('13', 'user', 'User user login', '2023-06-10 11:02:30');
INSERT INTO `logs` VALUES ('14', 'admin', 'User admin login', '2023-06-10 11:06:03');
INSERT INTO `logs` VALUES ('15', 'user', 'User user login', '2023-06-10 11:30:07');
INSERT INTO `logs` VALUES ('16', 'user', 'User user logout', '2023-06-10 12:27:20');
INSERT INTO `logs` VALUES ('17', 'admin', 'User admin login', '2023-06-10 12:27:25');
INSERT INTO `logs` VALUES ('18', 'user', 'User user login', '2023-06-10 16:59:08');
INSERT INTO `logs` VALUES ('19', 'user', 'User user logout', '2023-06-10 17:08:53');
INSERT INTO `logs` VALUES ('20', 'admin', 'User admin login', '2023-06-10 17:08:59');
INSERT INTO `logs` VALUES ('21', 'user', 'User user login', '2023-06-10 17:16:37');
INSERT INTO `logs` VALUES ('22', 'user', 'Product sold', '2023-06-10 18:49:31');
INSERT INTO `logs` VALUES ('23', 'user', 'User user logout', '2023-06-10 19:41:44');
INSERT INTO `logs` VALUES ('24', 'admin', 'User admin login', '2023-06-10 19:41:49');
INSERT INTO `logs` VALUES ('25', 'user', 'User user login', '2023-06-10 19:49:37');
INSERT INTO `logs` VALUES ('26', 'user', 'User user logout', '2023-06-10 20:13:57');
INSERT INTO `logs` VALUES ('27', 'admin', 'User admin login', '2023-06-10 20:15:20');
INSERT INTO `logs` VALUES ('28', 'admin', 'User admin login', '2023-06-10 20:32:37');
INSERT INTO `logs` VALUES ('29', 'user', 'User user login', '2023-06-10 20:39:21');
INSERT INTO `logs` VALUES ('30', 'user', 'Product sold', '2023-06-10 21:10:50');
INSERT INTO `logs` VALUES ('31', 'user', 'Product sold', '2023-06-10 21:12:20');
INSERT INTO `logs` VALUES ('32', 'user', 'Product sold', '2023-06-10 21:13:30');
INSERT INTO `logs` VALUES ('33', 'user', 'Product sold', '2023-06-10 21:13:44');
INSERT INTO `logs` VALUES ('34', 'user', 'Product sold', '2023-06-10 21:13:49');
INSERT INTO `logs` VALUES ('35', 'user', 'Product sold', '2023-06-10 21:21:30');
INSERT INTO `logs` VALUES ('36', 'user', 'Product sold', '2023-06-10 21:22:08');
INSERT INTO `logs` VALUES ('37', 'user', 'Product sold', '2023-06-10 21:25:09');
INSERT INTO `logs` VALUES ('38', 'user', 'Product sold', '2023-06-10 22:06:49');
INSERT INTO `logs` VALUES ('39', 'user', 'Product sold', '2023-06-10 22:56:44');
INSERT INTO `logs` VALUES ('40', 'user', 'Product sold', '2023-06-10 22:57:41');
INSERT INTO `logs` VALUES ('41', 'user', 'User user login', '2023-06-10 23:02:46');
INSERT INTO `logs` VALUES ('42', 'user', 'Product sold', '2023-06-10 23:02:58');
INSERT INTO `logs` VALUES ('43', 'user', 'User user logout', '2023-06-10 23:15:00');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_no` varchar(255) NOT NULL DEFAULT '',
  `product_name` varchar(255) DEFAULT NULL,
  `sell_price` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `min_stocks` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `sugar` varchar(255) DEFAULT NULL,
  `milk` varchar(255) DEFAULT NULL,
  `coffee` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('202301', 'Americano', '49.00', '2', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew Am.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202302', 'Americano', '59.00', '-95', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew Am.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202303', 'Caramel Macchiatto', '75.00', '20', 'Regular', '50', 'IcedCoffee', 'Ayala  Harbor Point', 'Cold Brew Cara.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202304', 'Caramel Macchiato', '89.00', '23', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew Cara.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202305', 'French Vanilla Latte', '75.00', '33', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202306', 'French Vanilla Latte', '89.00', '33', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202307', 'Cold Brew Mocha', '89.00', '47', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew M.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202308', 'Salted Caramel Macchiato', '75.00', '50', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202309', 'Salted Caramel Macchiato', '89.00', '49', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202310', 'Cookie Latte', '75.00', '45', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202311', 'Cookie Latte', '89.00', '44', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202312', 'Hazelnut latte', '75.00', '41', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202313', 'Hazelnut latte', '89.00', '41', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202314', 'Almond Latte', '75.00', '48', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202315', 'Almond Latte', '89.00', '38', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202316', 'Choco -Caramel', '75.00', '47', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202317', 'Choco -Caramel', '89.00', '45', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('20232222', 'New Coffee1', '123', null, 'small', null, '123', null, 'Cold Brew lat.jpg', '123', '123', '123');
INSERT INTO `products` VALUES ('685489718187', 'Secret Menu Coffe', '120', null, 'large', null, 'Coffee', null, null, '0.02', '0.02', '0.05');

-- ----------------------------
-- Table structure for `product_delivered`
-- ----------------------------
DROP TABLE IF EXISTS `product_delivered`;
CREATE TABLE `product_delivered` (
  `transaction_no` varchar(30) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `buy_price` decimal(18,2) NOT NULL,
  `tax_rate` int(11) NOT NULL,
  PRIMARY KEY (`transaction_no`),
  KEY `product_id` (`product_id`),
  KEY `transaction_no` (`transaction_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of product_delivered
-- ----------------------------

-- ----------------------------
-- Table structure for `raw_mats`
-- ----------------------------
DROP TABLE IF EXISTS `raw_mats`;
CREATE TABLE `raw_mats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `kg` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `supplier_id` varchar(255) DEFAULT '',
  `remarks` varchar(255) DEFAULT NULL,
  `price_per_serving` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of raw_mats
-- ----------------------------
INSERT INTO `raw_mats` VALUES ('1', 'Coffee', '12.8', null, '2023-06-10 23:02:58', '125', 'main', '0');
INSERT INTO `raw_mats` VALUES ('2', 'Sugar', '12.8', null, '2023-06-10 23:02:58', '125', 'main', '0');
INSERT INTO `raw_mats` VALUES ('3', 'Milk', '12.8', null, '2023-06-10 23:02:58', '125', 'main', '0');
INSERT INTO `raw_mats` VALUES ('4', 'Pearl', '0.9', null, '2023-06-10 21:25:09', '123', 'addons', '12');
INSERT INTO `raw_mats` VALUES ('6', 'Cream', '0.9', null, '2023-06-10 21:25:09', '123', 'addons', '23');
INSERT INTO `raw_mats` VALUES ('10', 'Nuts', '0.9', null, '2023-06-10 21:25:09', '125', 'addons', '12');
INSERT INTO `raw_mats` VALUES ('11', 'Coffee Jelly', '9.680000000000001', null, '2023-06-10 23:02:58', '124', 'addons', '10');
INSERT INTO `raw_mats` VALUES ('12', 'Choco Sprinkle', '9.580000000000002', null, '2023-06-10 23:02:58', '125', 'addons', '15');

-- ----------------------------
-- Table structure for `raw_mats_sales`
-- ----------------------------
DROP TABLE IF EXISTS `raw_mats_sales`;
CREATE TABLE `raw_mats_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_mats_id` varchar(255) DEFAULT '',
  `quantity` varchar(255) DEFAULT NULL,
  `sales_id` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of raw_mats_sales
-- ----------------------------
INSERT INTO `raw_mats_sales` VALUES ('6', '1', '1.2000000000000002', '1', '2023-06-10');
INSERT INTO `raw_mats_sales` VALUES ('7', '2', '1.2000000000000002', '1', '2023-06-10');
INSERT INTO `raw_mats_sales` VALUES ('8', '3', '1.2000000000000002', '1', '2023-06-10');
INSERT INTO `raw_mats_sales` VALUES ('9', '11', '1.2000000000000002', '1', '2023-06-10');
INSERT INTO `raw_mats_sales` VALUES ('10', '12', '1.2000000000000002', '1', '2023-06-10');
INSERT INTO `raw_mats_sales` VALUES ('11', '1', '1.2000000000000002', '1', '2023-06-10');
INSERT INTO `raw_mats_sales` VALUES ('12', '2', '1.2000000000000002', '1', '2023-06-10');
INSERT INTO `raw_mats_sales` VALUES ('13', '3', '1.2000000000000002', '1', '2023-06-10');
INSERT INTO `raw_mats_sales` VALUES ('14', '11', '1.2000000000000002', '1', '2023-06-10');
INSERT INTO `raw_mats_sales` VALUES ('15', '12', '1.2000000000000002', '1', '2023-06-10');

-- ----------------------------
-- Table structure for `sales`
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `reciept_no` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `username` varchar(30) NOT NULL,
  `discount` int(11) NOT NULL,
  `Discounttype` text NOT NULL,
  `total` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`reciept_no`),
  KEY `customer_id` (`customer_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('1', '714268404', 'user', '0', 'Manual', '49', '2023-06-09 00:15:32');
INSERT INTO `sales` VALUES ('2', '1937713834', 'user', '20', 'PWD', '47', '2023-06-09 00:17:50');
INSERT INTO `sales` VALUES ('3', '614706133', 'user', '20', 'Senior', '47', '2023-06-09 00:20:24');
INSERT INTO `sales` VALUES ('4', '2065772843', 'user', '0', 'Manual', '192', '2023-06-10 18:49:31');
INSERT INTO `sales` VALUES ('5', '1316144292', 'user', '0', 'Manual', '840', '2023-06-10 21:10:50');
INSERT INTO `sales` VALUES ('6', '1583191926', 'user', '0', 'Manual', '590', '2023-06-10 21:12:20');
INSERT INTO `sales` VALUES ('7', '608572225', 'user', '0', 'Manual', '590', '2023-06-10 21:13:30');
INSERT INTO `sales` VALUES ('8', '1769075497', 'user', '0', 'Manual', '1430', '2023-06-10 21:13:44');
INSERT INTO `sales` VALUES ('9', '394429503', 'user', '0', 'Manual', '1430', '2023-06-10 21:13:49');
INSERT INTO `sales` VALUES ('10', '569374165', 'user', '0', 'Manual', '1210', '2023-06-10 21:21:30');
INSERT INTO `sales` VALUES ('11', '899478627', 'user', '20', 'Manual', '1210', '2023-06-10 22:00:03');
INSERT INTO `sales` VALUES ('12', '1730118667', 'user', '20', 'Manual', '1210', '2023-06-10 22:00:03');
INSERT INTO `sales` VALUES ('13', '1784359225', 'user', '148', 'PWD', '592', '2023-06-10 22:06:49');
INSERT INTO `sales` VALUES ('14', '1591605931', 'user', '0', 'Manual', '840', '2023-06-10 22:56:44');
INSERT INTO `sales` VALUES ('15', '553749880', 'user', '0', 'Manual', '840', '2023-06-10 22:57:41');
INSERT INTO `sales` VALUES ('16', '1408014617', 'user', '0', 'Manual', '888', '2023-06-10 23:02:58');

-- ----------------------------
-- Table structure for `sales_product`
-- ----------------------------
DROP TABLE IF EXISTS `sales_product`;
CREATE TABLE `sales_product` (
  `reciept_no` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(20) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`reciept_no`),
  KEY `product_id` (`product_id`),
  KEY `reciept_no` (`reciept_no`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of sales_product
-- ----------------------------
INSERT INTO `sales_product` VALUES ('1', '202301', '49.00', '1');
INSERT INTO `sales_product` VALUES ('2', '202302', '59.00', '1');
INSERT INTO `sales_product` VALUES ('3', '202302', '59.00', '1');
INSERT INTO `sales_product` VALUES ('4', '202301', '49.00', '2');
INSERT INTO `sales_product` VALUES ('5', '202302', '59.00', '10');
INSERT INTO `sales_product` VALUES ('6', '202302', '59.00', '10');
INSERT INTO `sales_product` VALUES ('10', '202301', '49.00', '10');
INSERT INTO `sales_product` VALUES ('11', '202301', '49.00', '10');
INSERT INTO `sales_product` VALUES ('12', '202301', '49.00', '10');
INSERT INTO `sales_product` VALUES ('13', '202302', '59.00', '10');
INSERT INTO `sales_product` VALUES ('14', '202302', '59.00', '10');
INSERT INTO `sales_product` VALUES ('15', '202302', '59.00', '10');
INSERT INTO `sales_product` VALUES ('16', '202301', '49.00', '12');

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(30) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `image` varchar(60) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('123', 'Amcor', '123', '123', '123', '123', '');
INSERT INTO `supplier` VALUES ('124', 'Nestle', '123', '123', '123', '123', '');
INSERT INTO `supplier` VALUES ('125', 'Aling Puring', '123', '123', '123', '123', '');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `position` varchar(20) NOT NULL,
  `contact_number` varchar(30) NOT NULL,
  `image` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  UNIQUE KEY `user_id` (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('17', 'user', 'Rey Marc', 'Montemayor', 'Employee', '09999876587', 'Worker.png', '4535878c3de62f828262eb5fbe660bd8');
INSERT INTO `users` VALUES ('18', 'admin', 'thecoffeecart.ph', '', 'Admin', '09999876587', 'Group 3.png', 'ceb6c970658f31504a901b89dcd3e461');
