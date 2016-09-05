/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-04 19:10:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for getjob
-- ----------------------------
DROP TABLE IF EXISTS `getjob`;
CREATE TABLE `getjob` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `jobstu` int(255) DEFAULT NULL COMMENT '学生编码',
  `jobtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `jobmoney` varchar(255) DEFAULT NULL,
  `jobdesc` varchar(255) DEFAULT NULL COMMENT '职位描述',
  PRIMARY KEY (`jobid`),
  KEY `jobstu` (`jobstu`),
  CONSTRAINT `getjob_ibfk_1` FOREIGN KEY (`jobstu`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of getjob
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
