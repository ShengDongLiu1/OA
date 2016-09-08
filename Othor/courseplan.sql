/*
Navicat MySQL Data Transfer

Source Server         : su
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-08 16:54:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for courseplan
-- ----------------------------
DROP TABLE IF EXISTS `courseplan`;
CREATE TABLE `courseplan` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `empid` int(11) DEFAULT NULL COMMENT '教师编码',
  `objectid` int(11) DEFAULT NULL COMMENT '课程编码',
  `current_course` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '讲课内容',
  PRIMARY KEY (`kid`),
  KEY `empid` (`empid`),
  KEY `objectid` (`objectid`),
  CONSTRAINT `courseplan_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courseplan_ibfk_2` FOREIGN KEY (`objectid`) REFERENCES `course` (`objectid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseplan
-- ----------------------------
INSERT INTO `courseplan` VALUES ('1', '15', '1', '3', '变量');
INSERT INTO `courseplan` VALUES ('2', '15', '2', '4', '方法');
INSERT INTO `courseplan` VALUES ('3', '15', '3', '10', 'TCP');
INSERT INTO `courseplan` VALUES ('18', '15', '2', '20', '123');
INSERT INTO `courseplan` VALUES ('19', '15', '3', '20', '123');
INSERT INTO `courseplan` VALUES ('20', '15', '6', '10', '23');
INSERT INTO `courseplan` VALUES ('21', '15', '1', '4', '123');
INSERT INTO `courseplan` VALUES ('23', '15', '5', '20', '服务器');
