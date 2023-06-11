/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : pos_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2023-06-11 20:26:59
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
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
INSERT INTO `customer` VALUES ('144', '2007706554', '', '', '', '');
INSERT INTO `customer` VALUES ('145', '920487654', '', '', '', '');
INSERT INTO `customer` VALUES ('146', '1357477176', '', '', '', '');
INSERT INTO `customer` VALUES ('147', '959127263', '', '', '', '');
INSERT INTO `customer` VALUES ('148', '1025140772', '', '', '', '');
INSERT INTO `customer` VALUES ('149', '1834120249', '', '', '', '');
INSERT INTO `customer` VALUES ('150', '1360795605', '', '', '', '');
INSERT INTO `customer` VALUES ('151', '1527824296', '', '', '', '');
INSERT INTO `customer` VALUES ('152', '1087144650', '', '', '', '');
INSERT INTO `customer` VALUES ('153', '1543348579', '', '', '', '');
INSERT INTO `customer` VALUES ('154', '242970417', '', '', '', '');
INSERT INTO `customer` VALUES ('155', '1205240146', '', '', '', '');
INSERT INTO `customer` VALUES ('156', '1753645629', '', '', '', '');
INSERT INTO `customer` VALUES ('157', '892755579', '', '', '', '');
INSERT INTO `customer` VALUES ('158', '932194326', '', '', '', '');
INSERT INTO `customer` VALUES ('159', '455660197', '', '', '', '');
INSERT INTO `customer` VALUES ('160', '1569655016', '', '', '', '');
INSERT INTO `customer` VALUES ('161', '1261599641', '', '', '', '');
INSERT INTO `customer` VALUES ('162', '458518562', '', '', '', '');
INSERT INTO `customer` VALUES ('163', '363009252', '', '', '', '');
INSERT INTO `customer` VALUES ('164', '1092027880', '', '', '', '');
INSERT INTO `customer` VALUES ('165', '2090316140', '', '', '', '');
INSERT INTO `customer` VALUES ('166', '1425920765', '', '', '', '');
INSERT INTO `customer` VALUES ('167', '1298689038', '', '', '', '');
INSERT INTO `customer` VALUES ('168', '2010499170', '', '', '', '');
INSERT INTO `customer` VALUES ('169', '1093196856', '', '', '', '');
INSERT INTO `customer` VALUES ('170', '1105937811', '', '', '', '');
INSERT INTO `customer` VALUES ('171', '1574260737', '', '', '', '');
INSERT INTO `customer` VALUES ('172', '732641761', '', '', '', '');
INSERT INTO `customer` VALUES ('173', '1040699757', '', '', '', '');
INSERT INTO `customer` VALUES ('174', '1481899959', '', '', '', '');
INSERT INTO `customer` VALUES ('175', '2109395514', '', '', '', '');
INSERT INTO `customer` VALUES ('176', '552240322', '', '', '', '');
INSERT INTO `customer` VALUES ('177', '1572812491', '', '', '', '');
INSERT INTO `customer` VALUES ('178', '347788077', '', '', '', '');
INSERT INTO `customer` VALUES ('179', '1647628564', '', '', '', '');
INSERT INTO `customer` VALUES ('180', '1742117910', '', '', '', '');
INSERT INTO `customer` VALUES ('181', '1804577839', '', '', '', '');
INSERT INTO `customer` VALUES ('182', '1693270416', '', '', '', '');
INSERT INTO `customer` VALUES ('183', '720320512', '', '', '', '');
INSERT INTO `customer` VALUES ('184', '1091480897', '', '', '', '');
INSERT INTO `customer` VALUES ('185', '1164248272', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
INSERT INTO `logs` VALUES ('44', 'admin', 'User admin login', '2023-06-11 00:50:53');
INSERT INTO `logs` VALUES ('45', 'user', 'User user login', '2023-06-11 18:51:05');
INSERT INTO `logs` VALUES ('46', 'user', 'Product sold', '2023-06-11 18:52:35');
INSERT INTO `logs` VALUES ('47', 'user', 'Product sold', '2023-06-11 18:53:22');
INSERT INTO `logs` VALUES ('48', 'user', 'Product sold', '2023-06-11 18:53:47');
INSERT INTO `logs` VALUES ('49', 'user', 'Product sold', '2023-06-11 18:55:03');
INSERT INTO `logs` VALUES ('50', 'user', 'Product sold', '2023-06-11 18:56:29');
INSERT INTO `logs` VALUES ('51', 'user', 'Product sold', '2023-06-11 18:59:23');
INSERT INTO `logs` VALUES ('52', 'user', 'Product sold', '2023-06-11 18:59:40');
INSERT INTO `logs` VALUES ('53', 'user', 'Product sold', '2023-06-11 19:15:25');
INSERT INTO `logs` VALUES ('54', 'admin', 'User admin login', '2023-06-11 19:39:26');
INSERT INTO `logs` VALUES ('55', 'user', 'User user login', '2023-06-11 19:49:10');
INSERT INTO `logs` VALUES ('56', 'user', 'Product sold', '2023-06-11 19:49:34');
INSERT INTO `logs` VALUES ('57', 'user', 'User user login', '2023-06-11 19:54:55');
INSERT INTO `logs` VALUES ('58', 'user', 'Product sold', '2023-06-11 19:55:57');
INSERT INTO `logs` VALUES ('59', 'user', 'User user login', '2023-06-11 19:59:58');
INSERT INTO `logs` VALUES ('60', 'user', 'Product sold', '2023-06-11 20:00:13');
INSERT INTO `logs` VALUES ('61', 'user', 'Product sold', '2023-06-11 20:01:18');
INSERT INTO `logs` VALUES ('62', 'user', 'Product sold', '2023-06-11 20:01:24');
INSERT INTO `logs` VALUES ('63', 'user', 'Product sold', '2023-06-11 20:02:02');
INSERT INTO `logs` VALUES ('64', 'user', 'Product sold', '2023-06-11 20:02:34');
INSERT INTO `logs` VALUES ('65', 'user', 'Product sold', '2023-06-11 20:03:51');
INSERT INTO `logs` VALUES ('66', 'user', 'Product sold', '2023-06-11 20:04:07');
INSERT INTO `logs` VALUES ('67', 'user', 'Product sold', '2023-06-11 20:04:47');
INSERT INTO `logs` VALUES ('68', 'user', 'Product sold', '2023-06-11 20:05:07');
INSERT INTO `logs` VALUES ('69', 'user', 'Product sold', '2023-06-11 20:05:45');
INSERT INTO `logs` VALUES ('70', 'user', 'Product sold', '2023-06-11 20:06:26');
INSERT INTO `logs` VALUES ('71', 'user', 'Product sold', '2023-06-11 20:07:21');
INSERT INTO `logs` VALUES ('72', 'user', 'Product sold', '2023-06-11 20:08:47');
INSERT INTO `logs` VALUES ('73', 'user', 'Product sold', '2023-06-11 20:09:36');
INSERT INTO `logs` VALUES ('74', 'user', 'Product sold', '2023-06-11 20:11:06');
INSERT INTO `logs` VALUES ('75', 'user', 'Product sold', '2023-06-11 20:11:24');
INSERT INTO `logs` VALUES ('76', 'user', 'Product sold', '2023-06-11 20:12:21');
INSERT INTO `logs` VALUES ('77', 'user', 'Product sold', '2023-06-11 20:12:46');
INSERT INTO `logs` VALUES ('78', 'user', 'Product sold', '2023-06-11 20:13:14');
INSERT INTO `logs` VALUES ('79', 'user', 'Product sold', '2023-06-11 20:14:27');
INSERT INTO `logs` VALUES ('80', 'user', 'Product sold', '2023-06-11 20:14:32');
INSERT INTO `logs` VALUES ('81', 'user', 'Product sold', '2023-06-11 20:14:59');
INSERT INTO `logs` VALUES ('82', 'user', 'Product sold', '2023-06-11 20:15:26');
INSERT INTO `logs` VALUES ('83', 'user', 'Product sold', '2023-06-11 20:16:14');
INSERT INTO `logs` VALUES ('84', 'user', 'Product sold', '2023-06-11 20:16:47');
INSERT INTO `logs` VALUES ('85', 'user', 'Product sold', '2023-06-11 20:17:01');
INSERT INTO `logs` VALUES ('86', 'user', 'Product sold', '2023-06-11 20:17:25');
INSERT INTO `logs` VALUES ('87', 'user', 'Product sold', '2023-06-11 20:17:34');
INSERT INTO `logs` VALUES ('88', 'user', 'Product sold', '2023-06-11 20:18:02');
INSERT INTO `logs` VALUES ('89', 'user', 'Product sold', '2023-06-11 20:18:37');
INSERT INTO `logs` VALUES ('90', 'user', 'Product sold', '2023-06-11 20:20:38');

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
INSERT INTO `products` VALUES ('123', '123', '123', '90', 'small', null, '123', null, null, '123', '123', '123');
INSERT INTO `products` VALUES ('202301', 'Americano', '49.00', '-27', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew Am.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202302', 'Americano', '59.00', '75', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew Am.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202303', 'Caramel Macchiatto', '75.00', '-111', 'Regular', '50', 'IcedCoffee', 'Ayala  Harbor Point', 'Cold Brew Cara.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202304', 'Caramel Macchiato', '89.00', '-93', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew Cara.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202305', 'French Vanilla Latte', '75.00', '27', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202306', 'French Vanilla Latte', '89.00', '33', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202307', 'Cold Brew Mocha', '89.00', '35', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew M.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202308', 'Salted Caramel Macchiato', '75.00', '38', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202309', 'Salted Caramel Macchiato', '89.00', '35', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202310', 'Cookie Latte', '75.00', '45', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202311', 'Cookie Latte', '89.00', '44', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202312', 'Hazelnut latte', '75.00', '38', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202313', 'Hazelnut latte', '89.00', '40', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202314', 'Almond Latte', '75.00', '47', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202315', 'Almond Latte', '89.00', '38', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202316', 'Choco -Caramel', '75.00', '44', 'Regular', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('202317', 'Choco -Caramel', '89.00', '44', 'Large ', '50', 'IcedCoffee', 'Ayala Harbor Point', 'Cold Brew lat.jpg', '0.1', '0.1', '0.1');
INSERT INTO `products` VALUES ('20232222', 'New Coffee1', '123', '90', 'small', null, '123', null, 'Cold Brew lat.jpg', '123', '123', '123');
INSERT INTO `products` VALUES ('685489718187', 'Secret Menu Coffe', '120', '90', 'large', null, 'Coffee', null, null, '0.02', '0.02', '0.05');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of raw_mats
-- ----------------------------
INSERT INTO `raw_mats` VALUES ('1', 'Coffee', '7.2', null, '2023-06-11 20:20:38', '125', 'main', '0');
INSERT INTO `raw_mats` VALUES ('2', 'Sugar', '7.2', null, '2023-06-11 20:20:38', '125', 'main', '0');
INSERT INTO `raw_mats` VALUES ('3', 'Milk', '7.2', null, '2023-06-11 20:20:38', '125', 'main', '0');
INSERT INTO `raw_mats` VALUES ('4', 'Pearl', '10', null, '2023-06-11 20:01:01', '123', 'addons', '12');
INSERT INTO `raw_mats` VALUES ('6', 'Cream', '10', null, '2023-06-11 20:01:01', '123', 'addons', '23');
INSERT INTO `raw_mats` VALUES ('10', 'Nuts', '10', null, '2023-06-11 20:01:01', '125', 'addons', '12');
INSERT INTO `raw_mats` VALUES ('11', 'Coffee Jelly', '9.97', null, '2023-06-11 20:13:14', '124', 'addons', '10');
INSERT INTO `raw_mats` VALUES ('12', 'Choco Sprinkle', '9.96', null, '2023-06-11 20:13:14', '125', 'addons', '15');

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
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
INSERT INTO `raw_mats_sales` VALUES ('16', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('17', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('18', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('19', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('20', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('21', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('22', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('23', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('24', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('25', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('26', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('27', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('28', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('29', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('30', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('31', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('32', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('33', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('34', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('35', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('36', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('37', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('38', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('39', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('40', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('41', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('42', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('43', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('44', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('45', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('46', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('47', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('48', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('49', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('50', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('51', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('52', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('53', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('54', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('55', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('56', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('57', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('58', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('59', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('60', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('61', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('62', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('63', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('64', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('65', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('66', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('67', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('68', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('69', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('70', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('71', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('72', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('73', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('74', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('75', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('76', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('77', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('78', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('79', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('80', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('81', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('82', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('83', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('84', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('85', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('86', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('87', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('88', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('89', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('90', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('91', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('92', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('93', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('94', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('95', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('96', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('97', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('98', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('99', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('100', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('101', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('102', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('103', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('104', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('105', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('106', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('107', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('108', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('109', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('110', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('111', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('112', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('113', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('114', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('115', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('116', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('117', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('118', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('119', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('120', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('121', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('122', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('123', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('124', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('125', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('126', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('127', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('128', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('129', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('130', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('131', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('132', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('133', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('134', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('135', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('136', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('137', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('138', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('139', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('140', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('141', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('142', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('143', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('144', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('145', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('146', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('147', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('148', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('149', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('150', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('151', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('152', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('153', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('154', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('155', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('156', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('157', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('158', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('159', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('160', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('161', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('162', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('163', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('164', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('165', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('166', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('167', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('168', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('169', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('170', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('171', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('172', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('173', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('174', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('175', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('176', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('177', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('178', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('179', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('180', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('181', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('182', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('183', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('184', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('185', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('186', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('187', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('188', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('189', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('190', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('191', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('192', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('193', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('194', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('195', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('196', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('197', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('198', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('199', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('200', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('201', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('202', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('203', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('204', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('205', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('206', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('207', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('208', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('209', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('210', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('211', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('212', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('213', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('214', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('215', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('216', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('217', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('218', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('219', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('220', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('221', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('222', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('223', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('224', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('225', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('226', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('227', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('228', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('229', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('230', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('231', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('232', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('233', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('234', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('235', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('236', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('237', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('238', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('239', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('240', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('241', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('242', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('243', '12', '0.01', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('244', '1', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('245', '2', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('246', '3', '100', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('247', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('248', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('249', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('250', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('251', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('252', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('253', '1', '123', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('254', '2', '123', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('255', '3', '123', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('256', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('257', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('258', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('259', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('260', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('261', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('262', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('263', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('264', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('265', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('266', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('267', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('268', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('269', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('270', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('271', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('272', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('273', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('274', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('275', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('276', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('277', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('278', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('279', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('280', '1', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('281', '2', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('282', '3', '0.1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('283', '1', '0.30000000000000004', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('284', '2', '0.30000000000000004', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('285', '3', '0.30000000000000004', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('286', '11', '0.03', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('287', '12', '0.03', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('288', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('289', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('290', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('291', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('292', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('293', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('294', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('295', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('296', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('297', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('298', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('299', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('300', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('301', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('302', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('303', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('304', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('305', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('306', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('307', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('308', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('309', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('310', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('311', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('312', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('313', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('314', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('315', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('316', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('317', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('318', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('319', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('320', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('321', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('322', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('323', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('324', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('325', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('326', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('327', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('328', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('329', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('330', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('331', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('332', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('333', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('334', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('335', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('336', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('337', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('338', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('339', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('340', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('341', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('342', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('343', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('344', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('345', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('346', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('347', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('348', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('349', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('350', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('351', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('352', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('353', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('354', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('355', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('356', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('357', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('358', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('359', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('360', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('361', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('362', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('363', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('364', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('365', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('366', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('367', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('368', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('369', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('370', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('371', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('372', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('373', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('374', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('375', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('376', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('377', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('378', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('379', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('380', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('381', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('382', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('383', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('384', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('385', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('386', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('387', '1', '12.3', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('388', '2', '12.3', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('389', '3', '12.3', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('390', '1', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('391', '2', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('392', '3', '1', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('393', '1', '1.2000000000000002', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('394', '2', '1.2000000000000002', '1', '2023-06-11');
INSERT INTO `raw_mats_sales` VALUES ('395', '3', '1.2000000000000002', '1', '2023-06-11');

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('46', '1481899959', 'user', '0', 'Manual', '2130', '2023-06-11 20:14:27');
INSERT INTO `sales` VALUES ('47', '2109395514', 'user', '0', 'Manual', '2130', '2023-06-11 20:14:32');
INSERT INTO `sales` VALUES ('48', '552240322', 'user', '0', 'Manual', '2130', '2023-06-11 20:14:59');
INSERT INTO `sales` VALUES ('49', '1572812491', 'user', '0', 'Manual', '2130', '2023-06-11 20:15:26');
INSERT INTO `sales` VALUES ('50', '347788077', 'user', '0', 'Manual', '2130', '2023-06-11 20:16:14');
INSERT INTO `sales` VALUES ('51', '1647628564', 'user', '0', 'Manual', '2130', '2023-06-11 20:16:47');
INSERT INTO `sales` VALUES ('52', '1742117910', 'user', '0', 'Manual', '2130', '2023-06-11 20:17:01');
INSERT INTO `sales` VALUES ('53', '1804577839', 'user', '0', 'Manual', '2130', '2023-06-11 20:17:25');
INSERT INTO `sales` VALUES ('54', '1693270416', 'user', '0', 'Manual', '2130', '2023-06-11 20:17:34');
INSERT INTO `sales` VALUES ('55', '720320512', 'user', '0', 'Manual', '2130', '2023-06-11 20:18:02');
INSERT INTO `sales` VALUES ('56', '1091480897', 'user', '0', 'Manual', '2130', '2023-06-11 20:18:37');
INSERT INTO `sales` VALUES ('57', '1164248272', 'user', '0', 'Manual', '1658', '2023-06-11 20:20:38');

-- ----------------------------
-- Table structure for `sales_product`
-- ----------------------------
DROP TABLE IF EXISTS `sales_product`;
CREATE TABLE `sales_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reciept_no` int(11) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sales_product
-- ----------------------------
INSERT INTO `sales_product` VALUES ('21', '50', '202301', '49', '10');
INSERT INTO `sales_product` VALUES ('22', '50', '202303', '75', '10');
INSERT INTO `sales_product` VALUES ('23', '50', '202304', '89', '10');
INSERT INTO `sales_product` VALUES ('24', '51', '202301', '49', '10');
INSERT INTO `sales_product` VALUES ('25', '51', '202303', '75', '10');
INSERT INTO `sales_product` VALUES ('26', '51', '202304', '89', '10');
INSERT INTO `sales_product` VALUES ('27', '52', '202301', '49', '10');
INSERT INTO `sales_product` VALUES ('28', '52', '202303', '75', '10');
INSERT INTO `sales_product` VALUES ('29', '52', '202304', '89', '10');
INSERT INTO `sales_product` VALUES ('30', '53', '202301', '49', '10');
INSERT INTO `sales_product` VALUES ('31', '53', '202303', '75', '10');
INSERT INTO `sales_product` VALUES ('32', '53', '202304', '89', '10');
INSERT INTO `sales_product` VALUES ('33', '54', '202301', '49', '10');
INSERT INTO `sales_product` VALUES ('34', '54', '202303', '75', '10');
INSERT INTO `sales_product` VALUES ('35', '54', '202304', '89', '10');
INSERT INTO `sales_product` VALUES ('36', '55', '202301', '49', '10');
INSERT INTO `sales_product` VALUES ('37', '55', '202303', '75', '10');
INSERT INTO `sales_product` VALUES ('38', '55', '202304', '89', '10');
INSERT INTO `sales_product` VALUES ('39', '56', '202301', '49', '10');
INSERT INTO `sales_product` VALUES ('40', '56', '202303', '75', '10');
INSERT INTO `sales_product` VALUES ('41', '56', '202304', '89', '10');
INSERT INTO `sales_product` VALUES ('42', '57', '202302', '590', '10');
INSERT INTO `sales_product` VALUES ('43', '57', '202307', '1068', '12');

-- ----------------------------
-- Table structure for `sales_product_stg`
-- ----------------------------
DROP TABLE IF EXISTS `sales_product_stg`;
CREATE TABLE `sales_product_stg` (
  `reciept_no` int(11) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `reciept_no` (`reciept_no`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of sales_product_stg
-- ----------------------------
INSERT INTO `sales_product_stg` VALUES ('38', '202303', '75.00', '1', '39');

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
INSERT INTO `users` VALUES ('17', 'user', 'Rey Marc', 'Montemayor', 'Employee', '09999876587', 'Worker.png', 'ceb6c970658f31504a901b89dcd3e461');
INSERT INTO `users` VALUES ('18', 'admin', 'thecoffeecart.ph', '', 'Admin', '09999876587', 'Group 3.png', 'ceb6c970658f31504a901b89dcd3e461');
