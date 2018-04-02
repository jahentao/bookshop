/*
Navicat MySQL Data Transfer

Source Server         : bright
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : book

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2018-03-19 14:05:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` int(50) NOT NULL,
  `detail` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '少儿', '1', '我叫小白\r\n          \r\n          \r\n          \r\n          \r\n          \r\n          \r\n          ');
INSERT INTO `booktype` VALUES ('4', '文化', '1', '文化读物');
INSERT INTO `booktype` VALUES ('5', '科技', '1', '科技书籍');
INSERT INTO `booktype` VALUES ('6', '教育', '1', '用于儿童少年的教育书籍');
INSERT INTO `booktype` VALUES ('7', '育儿', '1', '养育幼儿的书籍');
INSERT INTO `booktype` VALUES ('8', '考试', '1', '考试相关的书籍');
INSERT INTO `booktype` VALUES ('9', '科普', '1', '科学普及读物');
