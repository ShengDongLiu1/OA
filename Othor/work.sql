/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-04 19:10:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `wtypeid` int(255) DEFAULT NULL COMMENT '类型',
  `wname` varchar(255) DEFAULT NULL COMMENT '名称',
  `wcount` int(255) DEFAULT NULL,
  `wamount` int(255) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`wid`),
  KEY `work_type_id` (`wtypeid`),
  CONSTRAINT `work_type_id` FOREIGN KEY (`wtypeid`) REFERENCES `worktype` (`swid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES ('17', '2', '吉他', '15', '15');
INSERT INTO `work` VALUES ('18', '2', '篮球', '23', '23');
SET FOREIGN_KEY_CHECKS=1;
