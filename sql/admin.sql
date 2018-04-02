/*
Navicat MySQL Data Transfer

Source Server         : bright
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : book

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2018-03-19 14:04:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sex` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('30', 'admin', '111111', 'admin@126.com', '1');
INSERT INTO `admin` VALUES ('31', 'admin1', '111111', 'admin@126.com', '1');
INSERT INTO `admin` VALUES ('32', '貂蝉', '111111', 'dad@126.com', '1');
INSERT INTO `admin` VALUES ('33', '王昭君', '111111', 'wangzhaojun@126.com', '2');
INSERT INTO `admin` VALUES ('34', '老夫子', '111111', 'laofuzi@126.com', '1');
INSERT INTO `admin` VALUES ('36', '后羿', '111111', 'houyi@126.com', '1');
