/*
Navicat MySQL Data Transfer

Source Server         : bright
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : book

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2018-03-19 14:05:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `typeid` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `detail` varchar(500) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_book_ref_type` (`typeid`),
  CONSTRAINT `Fk_book_ref_type` FOREIGN KEY (`typeid`) REFERENCES `booktype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('4', '4', 'java2入门经典', '99.99', '露娜', '这是一本java教程', '1513929085195.jpg');
INSERT INTO `book` VALUES ('6', '6', '培育男孩', '88', '吕布', '少儿教育书籍', '1513922933139.jpg');
INSERT INTO `book` VALUES ('7', '4', '别做正常的傻瓜', '99.9', '傻瓜', '莫名其妙', '1513922986153.jpg');
INSERT INTO `book` VALUES ('8', '4', '学会宽容', '123.8', '后羿', '这是一本不错的书', '1513923053803.jpg');
INSERT INTO `book` VALUES ('9', '4', '大勇和小花的欧洲日记', '199', '金科', '这是一本很休闲的书', '1513923132534.jpg');
INSERT INTO `book` VALUES ('10', '4', '穿越时空', '23.6', '詹姆斯', '这是一本科幻书籍', '1513925323182.jpg');
INSERT INTO `book` VALUES ('11', '4', '谁动了我的奶酪', '88.8', '王昭君', '这是一本人生转向的书', '1513925370218.jpg');
INSERT INTO `book` VALUES ('12', '4', '感悟', '76.8', '狄仁杰', '这是一本关于人生感悟的书！！！', '1513925566706.jpg');
INSERT INTO `book` VALUES ('13', '9', '科普咋说追', '12', '詹姆斯', '阿迪萨斯', '1521169760866..jpg');
