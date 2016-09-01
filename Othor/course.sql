/*
Navicat MySQL Data Transfer

Source Server         : su
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-01 16:44:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `objectid` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程编码',
  `objectname` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `semester` int(11) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'C++', '1', '十讲');
INSERT INTO `course` VALUES ('2', 'Java', '2', '二十讲');
INSERT INTO `course` VALUES ('3', 'JSP', '3', '十五讲');
INSERT INTO `course` VALUES ('4', 'sql', '2', '十讲');
INSERT INTO `course` VALUES ('5', 'Web', '4', '三十讲');
