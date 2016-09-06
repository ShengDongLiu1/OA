/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-06 22:50:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for computer
-- ----------------------------
DROP TABLE IF EXISTS `computer`;
CREATE TABLE `computer` (
  `comid` int(11) NOT NULL AUTO_INCREMENT,
  `coma` varchar(255) DEFAULT NULL COMMENT '电脑',
  `comb` varchar(255) DEFAULT NULL COMMENT '配件',
  `comcount` int(11) DEFAULT NULL,
  `stuid` int(11) DEFAULT NULL COMMENT '学生',
  PRIMARY KEY (`comid`),
  KEY `stuid` (`stuid`),
  CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of computer
-- ----------------------------
INSERT INTO `computer` VALUES ('3', 'x223', '华为', '1', '35');
INSERT INTO `computer` VALUES ('4', 'XF23', '上的', '1', '35');
INSERT INTO `computer` VALUES ('5', 'XD34', '华硕', '1', '35');
INSERT INTO `computer` VALUES ('11', 'DS23', '联想', '1', '35');
INSERT INTO `computer` VALUES ('28', 'esa', 'sdfsdfg', '1', '35');
INSERT INTO `computer` VALUES ('29', 'df', 'fs', '1', '35');
SET FOREIGN_KEY_CHECKS=1;
