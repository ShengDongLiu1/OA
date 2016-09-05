/*
Navicat MySQL Data Transfer

Source Server         : su
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-05 20:41:24
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
  `current_course` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '讲课内容',
  PRIMARY KEY (`kid`),
  KEY `empid` (`empid`),
  KEY `objectid` (`objectid`),
  CONSTRAINT `courseplan_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courseplan_ibfk_2` FOREIGN KEY (`objectid`) REFERENCES `course` (`objectid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseplan
-- ----------------------------
INSERT INTO `courseplan` VALUES ('1', '2', '1', '1', '变量');
INSERT INTO `courseplan` VALUES ('2', '2', '2', '2', '查询');
INSERT INTO `courseplan` VALUES ('3', '3', '3', '3', '异常');
INSERT INTO `courseplan` VALUES ('4', '5', '5', '4', '服务器');
INSERT INTO `courseplan` VALUES ('6', '2', '4', '12', '连接查询');
