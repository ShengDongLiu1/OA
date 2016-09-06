/*
Navicat MySQL Data Transfer

Source Server         : su
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-06 23:17:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hourse
-- ----------------------------
DROP TABLE IF EXISTS `hourse`;
CREATE TABLE `hourse` (
  `hourid` int(11) NOT NULL AUTO_INCREMENT,
  `hourname` varchar(255) DEFAULT NULL COMMENT '宿舍名称',
  `hourkz` int(11) DEFAULT NULL,
  `houryz` int(11) DEFAULT NULL,
  `hourhkz` int(11) DEFAULT NULL,
  PRIMARY KEY (`hourid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hourse
-- ----------------------------
INSERT INTO `hourse` VALUES ('1', '二栋', '500', '12', '488');
INSERT INTO `hourse` VALUES ('2', '小红楼', '233', '200', '33');
INSERT INTO `hourse` VALUES ('3', '六栋', '480', '450', '30');
INSERT INTO `hourse` VALUES ('4', '七栋', '800', '600', '200');
INSERT INTO `hourse` VALUES ('5', '一栋', '500', '400', '100');
INSERT INTO `hourse` VALUES ('6', '三栋', '480', '450', '30');
INSERT INTO `hourse` VALUES ('7', '四栋', '480', '350', '130');
INSERT INTO `hourse` VALUES ('8', '五栋', '480', '400', '80');
