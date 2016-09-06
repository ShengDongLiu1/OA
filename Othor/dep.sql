/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : 127.0.0.1:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-06 09:59:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dep
-- ----------------------------
DROP TABLE IF EXISTS `dep`;
CREATE TABLE `dep` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(255) DEFAULT NULL COMMENT '员工姓名',
  `esex` varchar(255) DEFAULT NULL COMMENT '性别',
  `mid` int(11) DEFAULT NULL COMMENT '部门',
  `ebirth` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '生日',
  `enumber` varchar(255) DEFAULT NULL COMMENT '号码',
  `ecertid` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `ecity` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `eanton` varchar(255) DEFAULT NULL COMMENT '民族',
  `edu` varchar(255) DEFAULT NULL COMMENT '学历',
  `eaddr` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `etry` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '录用时间',
  `estatus` int(11) DEFAULT NULL COMMENT '职位',
  `basepay` decimal(11,1) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `mid` (`mid`),
  KEY `estatus` (`estatus`),
  CONSTRAINT `dep_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `department` (`did`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dep_ibfk_2` FOREIGN KEY (`estatus`) REFERENCES `dstatus` (`dsid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dep
-- ----------------------------
INSERT INTO `dep` VALUES ('1', '武平', '男', '2', '2016-09-02 10:36:20', '15779768753', '36073119895241564', '江西赣州', '汉族', '本科', '江都', '2016-09-02 10:36:20', '3', null);
INSERT INTO `dep` VALUES ('2', '武平1', '男', '2', '2016-09-02 10:35:07', '15779768753', '360731199810021025', '江西赣州', '汉族', '专科', '您觉得和大家教教我表达   ', '2016-09-02 15:32:58', '2', null);
INSERT INTO `dep` VALUES ('3', '武平2', '男', '2', '2016-09-02 10:36:06', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-02 10:36:06', '5', null);
INSERT INTO `dep` VALUES ('4', '武平3', '男', '2', '2016-09-02 10:36:07', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-02 15:33:05', '4', null);
INSERT INTO `dep` VALUES ('5', '武平4', '男', '2', '2016-09-02 10:36:07', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-02 15:33:13', '1', null);
INSERT INTO `dep` VALUES ('6', '武平5', '男', '2', '2016-09-02 10:36:08', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-02 10:36:08', '5', null);
INSERT INTO `dep` VALUES ('7', '武平6', '男', '2', '2016-09-02 10:36:08', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-02 10:36:08', '5', null);
INSERT INTO `dep` VALUES ('8', '武平7', '男', '2', '2016-09-02 10:36:09', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-02 10:36:09', '5', null);
INSERT INTO `dep` VALUES ('9', '武平8', '男', '2', '2016-09-02 10:36:19', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-02 10:36:19', '5', null);
INSERT INTO `dep` VALUES ('10', '武平9', '男', '2', '2016-09-02 10:36:27', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-02 10:36:27', '5', null);
INSERT INTO `dep` VALUES ('11', '武平10', '男', '2', '2016-09-02 10:36:33', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-02 10:36:33', '5', null);
INSERT INTO `dep` VALUES ('12', '武平11', '男', '2', '2016-09-02 10:36:24', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-02 10:36:24', '5', null);
INSERT INTO `dep` VALUES ('13', '武平12', '男', '2', '2016-09-02 10:36:24', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-02 10:36:24', '3', null);
INSERT INTO `dep` VALUES ('14', '武平13', '男', '2', '2016-09-02 10:36:23', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-02 10:36:23', '2', null);
INSERT INTO `dep` VALUES ('15', '武平14', '男', '2', '2016-09-02 10:36:23', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-02 10:36:23', '1', null);
INSERT INTO `dep` VALUES ('16', '武平15', '男', '2', '2016-09-02 10:36:22', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-02 10:36:22', '3', null);
INSERT INTO `dep` VALUES ('17', '武平16', '男', '2', '2016-09-02 10:36:22', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-02 10:36:22', '2', null);
INSERT INTO `dep` VALUES ('18', '武平17', '男', '2', '2016-09-02 10:36:17', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-02 10:36:17', '1', null);
INSERT INTO `dep` VALUES ('19', '武平18', '男', '2', '2016-09-02 10:36:17', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-02 10:36:17', '5', null);
INSERT INTO `dep` VALUES ('20', '武平19', '男', '2', '2016-09-02 10:36:16', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-02 10:36:16', '7', null);
INSERT INTO `dep` VALUES ('21', '武平20', '男', '2', '2016-09-02 10:36:16', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-02 10:36:16', '6', null);
INSERT INTO `dep` VALUES ('22', '武平21', '男', '2', '2016-09-02 10:36:12', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-02 10:36:12', '4', null);
INSERT INTO `dep` VALUES ('23', '天仁孝', '男', '2', '2016-09-02 10:36:05', '12345678901', '360731199810021025', '江西赣州', '汉族', '专科', '江都', '2016-09-02 10:36:05', '4', null);
INSERT INTO `dep` VALUES ('25', '京津冀', '男', '6', '2016-09-02 10:36:00', '15768357954', '360731199810021475', '江西赣州', '汉族', '高中', '江都', '2016-09-02 10:59:57', '3', null);
INSERT INTO `dep` VALUES ('26', '霹雳舞', '男', '6', '2016-09-02 00:00:00', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-02 14:22:08', '1', null);
INSERT INTO `dep` VALUES ('27', '霹雳舞', '男', '6', '2016-09-02 00:00:00', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-02 14:22:14', '4', null);
INSERT INTO `dep` VALUES ('28', '霹雳舞', '男', '6', '2016-09-02 00:00:00', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-02 14:22:18', '4', null);
INSERT INTO `dep` VALUES ('29', '霹雳舞', '男', '6', '2016-09-02 00:00:00', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-02 14:22:19', '4', null);
INSERT INTO `dep` VALUES ('30', '霹雳舞', '男', '6', '2016-09-02 00:00:00', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-02 14:22:28', '4', null);
INSERT INTO `dep` VALUES ('31', '霹雳舞', '男', '6', '2016-09-02 00:00:00', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-02 14:29:09', '4', null);
INSERT INTO `dep` VALUES ('32', '口水话', '男', '8', '2016-09-02 00:00:00', '15779768755', '36079687542357896', '江西赣州', '汉族', '其它', '剑姬', '2016-09-02 15:36:13', '2', null);
INSERT INTO `dep` VALUES ('33', '口水话', '男', '8', '2016-09-02 00:00:00', '15779768755', '36079687542357896', '江西赣州', '汉族', '其它', '剑姬', '2016-09-02 15:36:15', '2', null);
INSERT INTO `dep` VALUES ('34', '口水话', '男', '8', '2016-09-02 00:00:00', '15779768755', '36079687542357896', '江西赣州', '汉族', '其它', '剑姬', '2016-09-02 15:37:31', '2', null);
INSERT INTO `dep` VALUES ('35', '怡和', '男', '9', '2016-09-03 00:00:00', '15797678542', '36079354997854254', '江西赣州', '汉族', '硕士', '袅袅娜娜', '2016-09-03 08:24:25', '3', null);
INSERT INTO `dep` VALUES ('37', '张二', '男', '6', '2016-09-06 00:00:00', '11111111111', '1111111111111111', '江西赣州', '汉族', '本科', '赣州', '2016-09-06 09:42:53', '1', '1000.0');