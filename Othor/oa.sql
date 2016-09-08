/*
Navicat MySQL Data Transfer

Source Server         : oa
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-08 21:38:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `gname` varchar(255) DEFAULT NULL COMMENT '物品名称',
  `gcounts` varchar(255) DEFAULT NULL COMMENT '数量',
  `gprice` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `gtotle` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `gpurpose` varchar(255) DEFAULT NULL COMMENT '用途',
  `adatetime` datetime DEFAULT NULL COMMENT '申请时间',
  `astatus` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`aid`),
  KEY `eid` (`eid`),
  KEY `wid` (`wid`),
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`wid`) REFERENCES `worktype` (`swid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('7', '1', '2', '铅球', '30', '0.00', '0.00', '上体育课使用', '2016-09-02 15:18:07', '已审批');
INSERT INTO `apply` VALUES ('8', '4', '7', '山水', '30', '0.00', '0.00', '事实上事实上杀', '2016-09-02 15:19:24', '已审批');
INSERT INTO `apply` VALUES ('9', '4', '2', '多读书', '15', '300.00', '4500.00', '积极急急急', '2016-09-02 15:23:21', '已购买');
INSERT INTO `apply` VALUES ('10', '1', '2', '铅球', '10', '100.00', '1000.00', '是哪个体育节', '2016-09-03 08:48:26', '已审批');
INSERT INTO `apply` VALUES ('13', '1', '15', '11', '11', '11.00', '121.00', '11111111', '2016-09-05 11:36:15', '已购买');
INSERT INTO `apply` VALUES ('14', '4', '15', '12强', '11', '111.00', '1221.00', '1111111111', '2016-09-05 14:00:21', '已审批');
INSERT INTO `apply` VALUES ('15', '1', '15', '4578', '100', '1000.00', '100000.00', '觉得坑大家思考', '2016-09-08 20:56:43', '已审批');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) DEFAULT NULL COMMENT '名称',
  `classcount` int(11) DEFAULT NULL COMMENT '班级人数',
  `classmax` int(11) DEFAULT NULL,
  `empteach` int(255) DEFAULT NULL COMMENT '任课老师',
  `empteachs` int(255) DEFAULT NULL COMMENT '辅导老师',
  `empteaches` int(255) DEFAULT NULL COMMENT '班主任',
  `classaddr` varchar(255) DEFAULT NULL COMMENT '班级地址',
  `classlx` varchar(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`classid`),
  KEY `empteach` (`empteach`),
  KEY `empteachs` (`empteachs`),
  KEY `empteaches` (`empteaches`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`empteach`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`empteachs`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `classes_ibfk_3` FOREIGN KEY (`empteaches`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('34', '15春', '1', '20', '15', '14', '25', '211', '空');
INSERT INTO `classes` VALUES ('36', '16春', '0', '20', '37', '32', '25', '3楼', '空');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of computer
-- ----------------------------
INSERT INTO `computer` VALUES ('4', 'XF23', '上的', '1', '1');
INSERT INTO `computer` VALUES ('5', 'XD34', '华硕', '1', '1');
INSERT INTO `computer` VALUES ('11', 'DS23', '联想', '1', '1');
INSERT INTO `computer` VALUES ('35', 'Acer', '阿斯顿', '1', '44');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `objectid` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程编码',
  `objectname` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `semester` int(11) DEFAULT NULL,
  `period` int(255) DEFAULT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'c++', '1', '10');
INSERT INTO `course` VALUES ('2', 'java', '2', '20');
INSERT INTO `course` VALUES ('3', 'jsp', '3', '20');
INSERT INTO `course` VALUES ('4', 'sql', '2', '15');
INSERT INTO `course` VALUES ('5', 'web', '4', '20');
INSERT INTO `course` VALUES ('6', 'script', '3', '10');
INSERT INTO `course` VALUES ('10', 'java', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

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
INSERT INTO `courseplan` VALUES ('26', '15', '3', '13', '13');

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dep
-- ----------------------------
INSERT INTO `dep` VALUES ('1', '武平', '男', '2', '2016-09-06 15:21:23', '15779768753', '36073119895241564', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:23', '3', '3000.0');
INSERT INTO `dep` VALUES ('2', '武平1', '男', '2', '2016-09-06 15:21:27', '15779768753', '360731199810021025', '江西赣州', '汉族', '专科', '您觉得和大家教教我表达   ', '2016-09-06 15:21:27', '2', '3000.0');
INSERT INTO `dep` VALUES ('3', '武平2', '男', '2', '2016-09-06 15:21:28', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:28', '5', '3000.0');
INSERT INTO `dep` VALUES ('4', '武平3', '男', '2', '2016-09-06 15:21:33', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:33', '4', '3000.0');
INSERT INTO `dep` VALUES ('5', '武平4', '男', '2', '2016-09-06 15:21:34', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:34', '1', '3000.0');
INSERT INTO `dep` VALUES ('6', '武平5', '男', '2', '2016-09-06 15:21:35', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:35', '5', '3000.0');
INSERT INTO `dep` VALUES ('7', '武平6', '男', '2', '2016-09-06 15:21:35', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:35', '5', '3000.0');
INSERT INTO `dep` VALUES ('8', '武平7', '男', '2', '2016-09-06 15:21:36', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:36', '5', '3000.0');
INSERT INTO `dep` VALUES ('9', '武平8', '男', '2', '2016-09-06 15:21:36', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:36', '5', '3000.0');
INSERT INTO `dep` VALUES ('10', '武平9', '男', '2', '2016-09-06 15:21:37', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:37', '5', '3000.0');
INSERT INTO `dep` VALUES ('11', '武平10', '男', '2', '2016-09-06 15:21:37', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:37', '5', '3000.0');
INSERT INTO `dep` VALUES ('12', '武平11', '男', '2', '2016-09-06 15:21:37', '15779768753', '360731199810021025', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:37', '5', '3000.0');
INSERT INTO `dep` VALUES ('13', '武平12', '男', '2', '2016-09-06 15:21:38', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-06 15:21:38', '3', '3000.0');
INSERT INTO `dep` VALUES ('14', '武平13', '男', '2', '2016-09-06 15:21:38', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-06 15:21:38', '2', '3000.0');
INSERT INTO `dep` VALUES ('15', '武平14', '男', '2', '2016-09-06 15:21:39', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-06 15:21:39', '1', '3000.0');
INSERT INTO `dep` VALUES ('16', '武平15', '男', '2', '2016-09-06 15:21:39', '15779768753', '360731199810021025', '江西赣州', '汉族', '初中', '江都', '2016-09-06 15:21:39', '3', '3000.0');
INSERT INTO `dep` VALUES ('17', '武平16', '男', '2', '2016-09-06 15:21:40', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:40', '2', '3000.0');
INSERT INTO `dep` VALUES ('18', '武平17', '男', '2', '2016-09-06 15:21:40', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:40', '1', '3000.0');
INSERT INTO `dep` VALUES ('19', '武平18', '男', '2', '2016-09-06 15:21:41', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:41', '5', '3000.0');
INSERT INTO `dep` VALUES ('20', '武平19', '男', '2', '2016-09-06 15:21:41', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:41', '7', '3000.0');
INSERT INTO `dep` VALUES ('21', '武平20', '男', '2', '2016-09-06 15:21:42', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:42', '6', '3000.0');
INSERT INTO `dep` VALUES ('22', '武平21', '男', '2', '2016-09-06 15:21:42', '15779768753', '360731199810021025', '江西赣州', '汉族', '本科', '江都', '2016-09-06 15:21:42', '4', '3000.0');
INSERT INTO `dep` VALUES ('23', '天仁孝', '男', '2', '2016-09-06 15:21:43', '12345678901', '360731199810021025', '江西赣州', '汉族', '专科', '江都', '2016-09-06 15:21:43', '4', '3000.0');
INSERT INTO `dep` VALUES ('25', '京津冀', '男', '6', '2016-09-06 15:21:43', '15768357954', '360731199810021475', '江西赣州', '汉族', '高中', '江都', '2016-09-06 15:21:43', '3', '3000.0');
INSERT INTO `dep` VALUES ('26', '霹雳舞', '男', '6', '2016-09-06 15:21:44', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:44', '1', '3000.0');
INSERT INTO `dep` VALUES ('27', '霹雳舞', '男', '6', '2016-09-06 15:21:44', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:44', '4', '3000.0');
INSERT INTO `dep` VALUES ('28', '霹雳舞', '男', '6', '2016-09-06 15:21:44', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:44', '4', '3000.0');
INSERT INTO `dep` VALUES ('29', '霹雳舞', '男', '6', '2016-09-06 15:21:45', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:45', '4', '3000.0');
INSERT INTO `dep` VALUES ('30', '霹雳舞', '男', '6', '2016-09-06 15:21:45', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:45', '4', '3000.0');
INSERT INTO `dep` VALUES ('31', '霹雳舞', '男', '6', '2016-09-06 15:21:46', '15797635241', '360731199810021457', '江西赣州', '汉族', '硕士', '建光', '2016-09-06 15:21:46', '4', '3000.0');
INSERT INTO `dep` VALUES ('32', '口水话', '男', '8', '2016-09-06 15:21:46', '15779768755', '36079687542357896', '江西赣州', '汉族', '其它', '剑姬', '2016-09-06 15:21:46', '2', '3000.0');
INSERT INTO `dep` VALUES ('33', '口水话', '男', '8', '2016-09-06 15:21:47', '15779768755', '36079687542357896', '江西赣州', '汉族', '其它', '剑姬', '2016-09-06 15:21:47', '2', '3000.0');
INSERT INTO `dep` VALUES ('34', '口水话', '男', '8', '2016-09-06 15:21:47', '15779768755', '36079687542357896', '江西赣州', '汉族', '其它', '剑姬', '2016-09-06 15:21:47', '2', '3000.0');
INSERT INTO `dep` VALUES ('35', '怡和', '女', '9', '2016-09-06 15:21:48', '15797678542', '36079354997854254', '江西赣州', '汉族', '硕士', '袅袅娜娜', '2016-09-06 15:27:23', '3', '3000.0');
INSERT INTO `dep` VALUES ('37', '张二', '女', '6', '2016-09-06 15:21:48', '11111111111', '1111111111111111', '江西赣州', '汉族', '本科', '赣州', '2016-09-06 15:25:51', '1', '3000.0');
INSERT INTO `dep` VALUES ('41', '姬发', '男', '2', '2016-09-07 00:00:00', '15779753872', '360731199810021542', '江西赣州', '汉族', '本科', '江西省南康市', '2016-09-07 09:15:52', '4', '3000.0');
INSERT INTO `dep` VALUES ('42', '李克强', '男', '2', '1990-09-26 00:00:00', '15779753875', '360731199811002547', '江西赣州', '汉族', '博士', '建都石头宴', '2016-09-07 14:39:13', '12', '3500.0');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL,
  `dcreatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('2', '行政部', '2016-08-30 14:27:15');
INSERT INTO `department` VALUES ('6', '教务部', '2016-09-01 10:43:05');
INSERT INTO `department` VALUES ('8', '人事部', '2016-09-02 15:35:10');
INSERT INTO `department` VALUES ('9', '市场部', '2016-09-03 08:22:00');
INSERT INTO `department` VALUES ('10', '企鹅部', '2016-09-08 21:33:58');

-- ----------------------------
-- Table structure for dstatus
-- ----------------------------
DROP TABLE IF EXISTS `dstatus`;
CREATE TABLE `dstatus` (
  `dsid` int(11) NOT NULL AUTO_INCREMENT,
  `dsname` varchar(255) NOT NULL,
  PRIMARY KEY (`dsid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dstatus
-- ----------------------------
INSERT INTO `dstatus` VALUES ('1', '任课老师');
INSERT INTO `dstatus` VALUES ('2', '辅导老师');
INSERT INTO `dstatus` VALUES ('3', '班主任');
INSERT INTO `dstatus` VALUES ('4', '招生老师');
INSERT INTO `dstatus` VALUES ('5', '教务主任');
INSERT INTO `dstatus` VALUES ('6', '后勤主任');
INSERT INTO `dstatus` VALUES ('7', '助理');
INSERT INTO `dstatus` VALUES ('12', '财务主任');

-- ----------------------------
-- Table structure for duty
-- ----------------------------
DROP TABLE IF EXISTS `duty`;
CREATE TABLE `duty` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `ddatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `dstatus` varchar(255) DEFAULT NULL COMMENT '类型',
  `drange` varchar(255) DEFAULT NULL COMMENT '范围',
  `ddesc` varchar(255) DEFAULT NULL COMMENT '情况',
  PRIMARY KEY (`did`),
  KEY `eid` (`eid`),
  CONSTRAINT `duty_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of duty
-- ----------------------------
INSERT INTO `duty` VALUES ('1', '1', '2016-09-03 11:48:01', '班级巡查', '15春', '啊啊啊啊啊啊啊啊啊');
INSERT INTO `duty` VALUES ('2', '1', '2016-09-04 21:12:15', '宿舍巡查', '二栋', '222222222222');
INSERT INTO `duty` VALUES ('4', '1', '2016-09-28 08:19:30', '宿舍巡查', '六栋', '是是是是是是是是是谁谁谁');
INSERT INTO `duty` VALUES ('5', '15', '2016-09-05 16:47:35', '宿舍巡查', '六栋', '1111111111111111111111');
INSERT INTO `duty` VALUES ('14', '15', '2016-09-09 17:05:08', '班级巡查', '16秋', '上课吵闹严重');
INSERT INTO `duty` VALUES ('15', '15', '2016-09-14 20:52:01', '宿舍巡查', '七栋', '卫生太差了');

-- ----------------------------
-- Table structure for expend
-- ----------------------------
DROP TABLE IF EXISTS `expend`;
CREATE TABLE `expend` (
  `payid` int(11) NOT NULL AUTO_INCREMENT COMMENT '支出编号',
  `paypro` varchar(1000) DEFAULT NULL COMMENT '支出原因',
  `paycount` decimal(10,2) DEFAULT NULL COMMENT '支出金额',
  `ptime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `payname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`payid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expend
-- ----------------------------
INSERT INTO `expend` VALUES ('23', '发放工资', '3121.00', '2016-09-07 08:15:53', '武平14');
INSERT INTO `expend` VALUES ('24', '发放工资', '3110.00', '2016-09-07 14:42:02', '李克强');
INSERT INTO `expend` VALUES ('25', '发放工资', '9300.00', '2016-09-07 14:43:26', '李克强');
INSERT INTO `expend` VALUES ('26', '发放工资null', '3100.00', '2016-09-07 14:49:28', '武平14');
INSERT INTO `expend` VALUES ('27', '给霹雳舞发放工资', '3111.00', '2016-09-07 15:03:09', '李克强');
INSERT INTO `expend` VALUES ('28', '给姬发、怡和、口水话发放工资', '9000.00', '2016-09-07 19:03:02', '武平14');
INSERT INTO `expend` VALUES ('29', '给张二、霹雳舞、霹雳舞、霹雳舞、霹雳舞、霹雳舞、霹雳舞、京津冀发放工资', '24000.00', '2016-09-07 19:04:53', '武平14');
INSERT INTO `expend` VALUES ('30', '给李克强发放工资', '3500.00', '2016-09-07 19:18:33', '武平14');
INSERT INTO `expend` VALUES ('31', '给李克强、怡和发放工资', '6500.00', '2016-09-07 19:25:15', '武平14');
INSERT INTO `expend` VALUES ('32', '给张二、口水话发放工资', '6000.00', '2016-09-07 19:31:58', '武平14');
INSERT INTO `expend` VALUES ('33', '给霹雳舞发放工资', '4500.00', '2016-09-07 19:39:46', '武平14');
INSERT INTO `expend` VALUES ('34', '给霹雳舞发放工资', '3000.00', '2016-09-07 19:42:39', '武平14');
INSERT INTO `expend` VALUES ('35', '给张二、口水话发放工资', '0.00', '2016-09-08 11:22:53', '武平14');
INSERT INTO `expend` VALUES ('37', '购买物品', '121.00', '2016-09-08 19:41:35', '怡和');
INSERT INTO `expend` VALUES ('38', '购买物品', '4500.00', '2016-09-08 19:42:15', '怡和');
INSERT INTO `expend` VALUES ('39', '给怡和发放工资', '377161.00', '2016-09-08 21:24:38', '武平14');
INSERT INTO `expend` VALUES ('40', '给李克强、姬发发放工资', '0.00', '2016-09-08 21:25:00', '武平14');
INSERT INTO `expend` VALUES ('41', '给李克强、姬发发放工资', '0.00', '2016-09-08 21:25:16', '武平14');
INSERT INTO `expend` VALUES ('42', '给李克强发放工资', '0.00', '2016-09-08 21:25:55', '武平14');
INSERT INTO `expend` VALUES ('43', '给怡和发放工资', '0.00', '2016-09-08 21:26:23', '武平14');
INSERT INTO `expend` VALUES ('44', '给李克强发放工资', '3500.00', '2016-09-08 21:31:56', '武平14');
INSERT INTO `expend` VALUES ('45', '给李克强发放工资', '3500.00', '2016-09-08 21:33:31', '武平14');

-- ----------------------------
-- Table structure for fankui
-- ----------------------------
DROP TABLE IF EXISTS `fankui`;
CREATE TABLE `fankui` (
  `tbackid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `pro` varchar(300) NOT NULL COMMENT '内容',
  `ans` varchar(255) DEFAULT NULL COMMENT '答案',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tbackid`),
  KEY `tep_tde_pk` (`eid`),
  CONSTRAINT `tep_tde_pk` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fankui
-- ----------------------------
INSERT INTO `fankui` VALUES ('4', '2', '11', 'hhh ', '11', '2016-09-02 10:30:02');
INSERT INTO `fankui` VALUES ('5', '3', '11', '你睡觉熬了点空间哦ID去看你空间啊大家卡拉放极爱哦哦啊见佛年 按开发那', '11', '2016-09-02 10:30:14');
INSERT INTO `fankui` VALUES ('6', '4', '11', '11', '11', '2016-09-02 10:30:41');
INSERT INTO `fankui` VALUES ('7', '2', 'sssssss', '暂未回复', 'sss', '2016-09-03 09:00:21');
INSERT INTO `fankui` VALUES ('8', '41', '是否赠送九龙湾别墅', '暂未回复', '九龙湾别墅', '2016-09-07 14:09:19');
INSERT INTO `fankui` VALUES ('9', '41', '听说经理级别的会分配九龙湾别墅一栋', '暂未回复', '九龙湾别墅', '2016-09-07 14:09:21');
INSERT INTO `fankui` VALUES ('10', '41', '就看见快乐撒娇的撒娇的空间啊低俗俺家卡', '暂未回复', '山丹丹那个红艳艳', '2016-09-07 14:23:24');
INSERT INTO `fankui` VALUES ('11', '41', '打理好福利就不放技能发你家擦就开门是v', '打算打打打爱的阿达阿达阿', '来咯你', '2016-09-08 21:09:05');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of getjob
-- ----------------------------
INSERT INTO `getjob` VALUES ('2', '12331231', '1', '2016-09-09 00:00:00', '321312.0', '313131');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `scoid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` int(11) DEFAULT NULL,
  `score` float(11,2) DEFAULT NULL COMMENT '成绩',
  `sconame` varchar(255) DEFAULT NULL COMMENT '课程名称',
  PRIMARY KEY (`scoid`),
  KEY `stuid` (`stuid`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('37', '20', '11.00', 'C++');
INSERT INTO `grade` VALUES ('38', '1', '222.00', 'C++');
INSERT INTO `grade` VALUES ('40', '1', '2.00', 'JSP');
INSERT INTO `grade` VALUES ('41', '2', '11.00', 'JSP');
INSERT INTO `grade` VALUES ('42', '4', '111.00', 'JSP');
INSERT INTO `grade` VALUES ('43', '5', '0.00', 'JSP');
INSERT INTO `grade` VALUES ('45', '2', '123.00', 'C++');
INSERT INTO `grade` VALUES ('46', '2', '100.00', 'C++');
INSERT INTO `grade` VALUES ('49', '44', '132.00', 'c++');
INSERT INTO `grade` VALUES ('50', '43', '123.00', 'jsp');
INSERT INTO `grade` VALUES ('51', '44', '123.00', 'jsp');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hourse
-- ----------------------------
INSERT INTO `hourse` VALUES ('1', '二栋', '500', '16', '484');
INSERT INTO `hourse` VALUES ('2', '小红楼', '233', '201', '32');
INSERT INTO `hourse` VALUES ('3', '六栋', '480', '450', '30');
INSERT INTO `hourse` VALUES ('5', '一栋', '500', '400', '100');
INSERT INTO `hourse` VALUES ('6', '三栋', '480', '450', '30');
INSERT INTO `hourse` VALUES ('7', '四栋', '480', '350', '130');
INSERT INTO `hourse` VALUES ('8', '五栋', '480', '402', '78');
INSERT INTO `hourse` VALUES ('9', '七栋 ', '500', '300', '200');

-- ----------------------------
-- Table structure for income
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `monid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `moncount` decimal(10,2) DEFAULT NULL COMMENT '收入金额，可是学费，学杂费，企业经营收入额等',
  `monpro` varchar(255) DEFAULT NULL COMMENT '收入的原因',
  `mname` varchar(255) DEFAULT NULL COMMENT '收入人',
  `mdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`monid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of income
-- ----------------------------
INSERT INTO `income` VALUES ('25', '4000.00', '收取古钟同学的学费', '武平14', '2016-09-07 08:58:15');
INSERT INTO `income` VALUES ('26', '7000.00', '收取钟胜峰22同学第三学期的学费', '李克强', '2016-09-07 14:40:57');
INSERT INTO `income` VALUES ('27', '4000.00', '收取古钟同学第一学期的学费', '武平14', '2016-09-08 09:45:20');
INSERT INTO `income` VALUES ('28', '4000.00', '收取古钟同学第一学期的学费', '武平14', '2016-09-08 09:46:17');
INSERT INTO `income` VALUES ('29', '4000.00', '收取古钟同学第一学期的学费', '武平14', '2016-09-08 09:47:05');
INSERT INTO `income` VALUES ('30', '6000.00', '收取古钟同学第三学期的学费', '武平14', '2016-09-08 09:48:16');
INSERT INTO `income` VALUES ('31', '200.00', '收取古钟同学预科的学费', '武平14', '2016-09-08 09:48:50');
INSERT INTO `income` VALUES ('32', '6000.00', '收取古钟同学第三学期的学费', '武平14', '2016-09-08 09:49:17');
INSERT INTO `income` VALUES ('33', '300.00', '收取古钟同学预科的学费', '武平14', '2016-09-08 09:51:53');
INSERT INTO `income` VALUES ('34', '4000.00', '收取古钟同学第一学期的学费', '武平14', '2016-09-08 09:52:03');
INSERT INTO `income` VALUES ('35', '5000.00', '收取古钟同学第二学期的学费', '武平14', '2016-09-08 09:56:54');
INSERT INTO `income` VALUES ('36', '5500.00', '古钟同学补交第二学期的学费', null, '2016-09-08 09:57:08');
INSERT INTO `income` VALUES ('37', '5000.00', '收取古钟同学第二学期的学费', '武平14', '2016-09-08 09:58:38');
INSERT INTO `income` VALUES ('38', '5500.00', '古钟同学补交第二学期的学费', null, '2016-09-08 09:58:45');
INSERT INTO `income` VALUES ('39', '5000.00', '收取着眼于同学第二学期的学费', '武平14', '2016-09-08 10:43:52');
INSERT INTO `income` VALUES ('40', '5400.00', '着眼于同学补交第二学期的学费', '武平14', '2016-09-08 10:44:02');
INSERT INTO `income` VALUES ('41', '200.00', '收取古钟同学预科的学费', '武平14', '2016-09-08 21:23:19');
INSERT INTO `income` VALUES ('42', '300.00', '古钟同学补交预科的学费', '武平14', '2016-09-08 21:23:39');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `xid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `sstuid` int(11) DEFAULT NULL,
  `steacher` int(11) DEFAULT NULL,
  `sdate` varchar(255) DEFAULT NULL COMMENT '时间',
  `score` float(11,0) DEFAULT NULL COMMENT '分数',
  PRIMARY KEY (`xid`),
  KEY `sstuid` (`sstuid`),
  KEY `steacher` (`steacher`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`sstuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`steacher`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('9', 'Java', '44', '37', '2016-09-10', '90');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `eid` int(11) NOT NULL,
  `jstart` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `jend` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `jcompany` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  `jedu` varchar(255) DEFAULT NULL COMMENT '职位',
  `jpeople` varchar(255) DEFAULT NULL COMMENT '证明人',
  `jtel` varchar(255) DEFAULT NULL COMMENT '证明人号码',
  PRIMARY KEY (`eid`),
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES ('23', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('25', '宏图学院', '2011-09-14 08:18:51', '2016-09-02 08:18:56', '主任', '潇潇', '12345678936');
INSERT INTO `jobs` VALUES ('26', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('27', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('28', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('29', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('30', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('31', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('32', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('33', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('34', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('35', '刚刚', '2009-09-01 08:24:44', '2016-09-01 08:24:49', '经理', '记录', '1579768543');
INSERT INTO `jobs` VALUES ('37', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('41', null, null, null, null, null, null);
INSERT INTO `jobs` VALUES ('42', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for money
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` int(11) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL COMMENT '学期',
  `ys` decimal(10,2) DEFAULT NULL COMMENT '应该收取的费用',
  `actual` decimal(10,2) DEFAULT NULL COMMENT '实际收取的费用',
  `owe` decimal(10,2) DEFAULT NULL COMMENT '还欠的费用',
  `mtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '收取时间',
  PRIMARY KEY (`mid`),
  KEY `stuid` (`stuid`),
  KEY `eid` (`eid`),
  CONSTRAINT `money_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`intenid`),
  CONSTRAINT `money_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES ('21', '1', '15', '第三学期', '6500.00', '6500.00', '0.00', '2016-09-08 09:48:16');
INSERT INTO `money` VALUES ('22', '1', '15', '预科', '300.00', '300.00', '0.00', '2016-09-08 09:48:50');
INSERT INTO `money` VALUES ('23', '1', '15', '第三学期', '6500.00', '6500.00', '0.00', '2016-09-08 09:49:17');
INSERT INTO `money` VALUES ('24', '1', '15', '预科', '300.00', '300.00', '0.00', '2016-09-08 09:51:53');
INSERT INTO `money` VALUES ('25', '1', '15', '第一学期', '4500.00', '4500.00', '0.00', '2016-09-08 09:52:03');
INSERT INTO `money` VALUES ('26', '1', '15', '第二学期', '5500.00', '5500.00', '0.00', '2016-09-08 09:56:53');
INSERT INTO `money` VALUES ('27', '1', '15', '第二学期', '5500.00', '5500.00', '0.00', '2016-09-08 09:58:38');
INSERT INTO `money` VALUES ('28', '27', '15', '第二学期', '5500.00', '5400.00', '100.00', '2016-09-08 10:43:51');
INSERT INTO `money` VALUES ('29', '1', '15', '预科', '300.00', '300.00', '0.00', '2016-09-08 21:23:18');

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `msgcon` varchar(600) DEFAULT NULL COMMENT '公告内容',
  `msgks` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `msgjz` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`msgid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('18', '9月14日到9月17日放假.', '2016-09-08 17:07:04', '2016-09-08 20:53:07');

-- ----------------------------
-- Table structure for pays
-- ----------------------------
DROP TABLE IF EXISTS `pays`;
CREATE TABLE `pays` (
  `paysid` int(11) NOT NULL AUTO_INCREMENT COMMENT '工资编码',
  `empid` int(11) DEFAULT NULL COMMENT '员工编码',
  `paysa` decimal(10,2) DEFAULT NULL COMMENT '奖励金额',
  `paysb` decimal(10,2) DEFAULT NULL COMMENT '惩罚金额',
  `payspro` varchar(255) DEFAULT NULL COMMENT '惩罚原因',
  `payssta` decimal(10,2) DEFAULT NULL COMMENT '基本工资',
  `paysc` decimal(10,2) DEFAULT NULL COMMENT '补贴工资',
  `paysd` decimal(10,2) DEFAULT NULL COMMENT '结余工资',
  `paytime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`paysid`),
  KEY `empid` (`empid`),
  CONSTRAINT `pays_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pays
-- ----------------------------
INSERT INTO `pays` VALUES ('41', '2', '121.00', '-122.00', '迟到早退', '3000.00', '122.00', '3121.00', '2016-09-07 08:15:22');
INSERT INTO `pays` VALUES ('42', '37', '0.00', '-100.00', '迟到早退', '3000.00', '0.00', '2900.00', '2016-09-07 08:23:20');
INSERT INTO `pays` VALUES ('43', '29', '100.00', '0.00', '积极加班', '3000.00', '100.00', '3200.00', '2016-09-07 08:23:20');
INSERT INTO `pays` VALUES ('44', '27', '0.00', '0.00', '无', '3000.00', '0.00', '3000.00', '2016-09-07 08:23:20');
INSERT INTO `pays` VALUES ('45', '37', '0.00', '-100.00', '迟到早退', '3000.00', '0.00', '2900.00', '2016-09-07 08:23:20');
INSERT INTO `pays` VALUES ('46', '29', '100.00', '0.00', '积极加班', '3000.00', '100.00', '3200.00', '2016-09-07 08:23:20');
INSERT INTO `pays` VALUES ('81', '26', '0.00', '0.00', '无', '3000.00', '0.00', '3000.00', '2016-09-07 00:00:00');
INSERT INTO `pays` VALUES ('82', '37', '0.00', '0.00', '', '0.00', '0.00', '0.00', '2016-09-08 00:00:00');
INSERT INTO `pays` VALUES ('83', '34', '0.00', '0.00', '', '0.00', '0.00', '0.00', '2016-09-08 00:00:00');
INSERT INTO `pays` VALUES ('84', '35', '414134.00', '-41414.00', '无', '3000.00', '1441.00', '377161.00', '2016-09-08 00:00:00');
INSERT INTO `pays` VALUES ('85', '42', '0.00', '0.00', '无', '0.00', '0.00', '0.00', '2016-09-09 00:00:00');
INSERT INTO `pays` VALUES ('86', '41', '0.00', '0.00', '无', '0.00', '0.00', '0.00', '2016-09-09 00:00:00');
INSERT INTO `pays` VALUES ('87', '42', '0.00', '0.00', '无', '0.00', '0.00', '0.00', '2016-09-08 00:00:00');
INSERT INTO `pays` VALUES ('88', '41', '0.00', '0.00', '无', '0.00', '0.00', '0.00', '2016-09-08 00:00:00');
INSERT INTO `pays` VALUES ('89', '42', '0.00', '0.00', '无', '0.00', '0.00', '0.00', '2016-09-08 00:00:00');
INSERT INTO `pays` VALUES ('90', '35', '0.00', '0.00', '无', '0.00', '0.00', '0.00', '2016-09-08 00:00:00');
INSERT INTO `pays` VALUES ('91', '42', '0.00', '0.00', '无', '0.00', '0.00', '3500.00', '2016-09-09 00:00:00');
INSERT INTO `pays` VALUES ('92', '42', '0.00', '0.00', '无', '3500.00', '0.00', '3500.00', '2016-09-09 00:00:00');

-- ----------------------------
-- Table structure for rawpun
-- ----------------------------
DROP TABLE IF EXISTS `rawpun`;
CREATE TABLE `rawpun` (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `jstuid` int(11) DEFAULT NULL,
  `jtitle` varchar(255) DEFAULT NULL COMMENT '奖惩对象',
  `jcontent` varchar(255) DEFAULT NULL COMMENT '奖惩内容',
  PRIMARY KEY (`jid`),
  KEY `jstuid` (`jstuid`),
  CONSTRAINT `rawpun_ibfk_1` FOREIGN KEY (`jstuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf16;

-- ----------------------------
-- Records of rawpun
-- ----------------------------
INSERT INTO `rawpun` VALUES ('5', '1', '上课睡觉', '做50个俯卧撑和50个下蹲');

-- ----------------------------
-- Table structure for receiue
-- ----------------------------
DROP TABLE IF EXISTS `receiue`;
CREATE TABLE `receiue` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '申领编号',
  `eid` int(11) DEFAULT NULL COMMENT '员工编号',
  `uwork` int(11) DEFAULT NULL COMMENT '申领物品名称',
  `ucount` int(11) DEFAULT NULL COMMENT '申领物品数量',
  `upurpose` varchar(255) DEFAULT NULL COMMENT '用途',
  `ucreattime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `uendtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  `restore` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`uid`),
  KEY `eid` (`eid`),
  KEY `receiue_work_wid` (`uwork`),
  CONSTRAINT `receiue_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receiue_work_wid` FOREIGN KEY (`uwork`) REFERENCES `work` (`wid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receiue
-- ----------------------------
INSERT INTO `receiue` VALUES ('16', '1', '18', '10', '这个学生在本学期表现良好', '2016-09-03 00:00:00', '2016-09-14 00:00:00', '还');
INSERT INTO `receiue` VALUES ('18', '1', '21', '100', '你管我干什么', '2016-09-07 00:00:00', '2016-09-07 00:00:00', '还');
INSERT INTO `receiue` VALUES ('20', '15', '20', '12', '11212', '2016-09-08 00:00:00', '2016-09-08 00:00:00', '还');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL COMMENT '员工编号',
  `rdate` varchar(100) DEFAULT NULL COMMENT '本周日期',
  `rsun` varchar(255) DEFAULT NULL COMMENT '周日',
  `rmon` varchar(255) DEFAULT NULL COMMENT '周一',
  `rtue` varchar(255) DEFAULT NULL,
  `twed` varchar(255) DEFAULT NULL,
  `rthu` varchar(255) DEFAULT NULL,
  `tfri` varchar(255) DEFAULT NULL,
  `rsta` varchar(255) DEFAULT NULL,
  `rsummary` varchar(255) DEFAULT NULL COMMENT '本周总结',
  PRIMARY KEY (`rid`),
  KEY `eid` (`eid`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for says
-- ----------------------------
DROP TABLE IF EXISTS `says`;
CREATE TABLE `says` (
  `sayid` int(11) NOT NULL AUTO_INCREMENT COMMENT '谈心编号 ',
  `sayface` int(100) DEFAULT NULL COMMENT '谈心对象',
  `sayempid` int(11) DEFAULT NULL COMMENT '策划人',
  `sayscon` varchar(100) DEFAULT NULL COMMENT '谈心内容',
  `sayspro` varchar(100) DEFAULT NULL COMMENT '谈心问题',
  `sysback` varchar(255) DEFAULT NULL COMMENT '学生反馈',
  PRIMARY KEY (`sayid`),
  KEY `sayface` (`sayface`),
  KEY `sayempid` (`sayempid`),
  CONSTRAINT `says_ibfk_1` FOREIGN KEY (`sayface`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `says_ibfk_2` FOREIGN KEY (`sayempid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16;

-- ----------------------------
-- Records of says
-- ----------------------------
INSERT INTO `says` VALUES ('2', '1', '1', '2222222222222222222222222222', '22222222222222222222222', '2222222222222222222222222222222');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `zid` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', '任课老师');
INSERT INTO `status` VALUES ('2', '辅导老师');
INSERT INTO `status` VALUES ('3', '班主任');
INSERT INTO `status` VALUES ('4', '招生老师');
INSERT INTO `status` VALUES ('5', '教务主任');
INSERT INTO `status` VALUES ('6', '后勤主任');
INSERT INTO `status` VALUES ('7', '助理');
INSERT INTO `status` VALUES ('8', '意向学生');
INSERT INTO `status` VALUES ('9', '预订学生');
INSERT INTO `status` VALUES ('10', '正式学生');
INSERT INTO `status` VALUES ('11', '超级管理员');
INSERT INTO `status` VALUES ('12', '财务主任');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `intenid` int(11) NOT NULL AUTO_INCREMENT,
  `intenname` varchar(50) DEFAULT NULL COMMENT '名字',
  `intensch` varchar(255) DEFAULT NULL COMMENT '毕业学校',
  `intensex` char(2) DEFAULT NULL COMMENT '性别',
  `intenage` int(11) DEFAULT NULL COMMENT '年龄',
  `intenbir` varchar(255) DEFAULT NULL COMMENT '出生年月',
  `intenfat` varchar(50) DEFAULT NULL COMMENT '家长',
  `intentel` varchar(20) DEFAULT NULL COMMENT '号码',
  `intenfatel` varchar(255) DEFAULT NULL COMMENT '家长号码',
  `intenaddr` varchar(255) DEFAULT NULL COMMENT '住址',
  `intenpeo` varchar(255) DEFAULT NULL COMMENT '就读疑问',
  `intenmz` varchar(255) DEFAULT NULL COMMENT '民族',
  `intenjg` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `intenstatus` varchar(255) DEFAULT NULL COMMENT '状态',
  `classid` int(11) DEFAULT NULL,
  `hourid` int(11) DEFAULT NULL,
  `intendate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `stustatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`intenid`),
  KEY `hourid` (`hourid`),
  KEY `classid` (`classid`),
  KEY `stustatus` (`stustatus`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`hourid`) REFERENCES `hourse` (`hourid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`classid`) REFERENCES `classes` (`classid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`stustatus`) REFERENCES `status` (`zid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '古钟', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-05 14:13:53', '9');
INSERT INTO `student` VALUES ('2', '钟胜峰2', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:52', '9');
INSERT INTO `student` VALUES ('3', '钟胜峰3', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:53', '9');
INSERT INTO `student` VALUES ('4', '钟胜峰4', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:54', '9');
INSERT INTO `student` VALUES ('5', '钟胜峰5', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:54', '9');
INSERT INTO `student` VALUES ('6', '钟胜峰6', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-08 20:12:59', '10');
INSERT INTO `student` VALUES ('7', '钟胜峰7', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:55', '9');
INSERT INTO `student` VALUES ('8', '钟胜峰8', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '退学', '34', '1', '2016-09-08 20:13:05', '10');
INSERT INTO `student` VALUES ('9', '钟胜峰9', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-08 20:13:05', '10');
INSERT INTO `student` VALUES ('10', '钟胜峰10', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '退学', '34', '1', '2016-09-08 20:13:06', '10');
INSERT INTO `student` VALUES ('11', '钟胜峰11', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '休学', '34', '1', '2016-09-08 20:13:07', '10');
INSERT INTO `student` VALUES ('12', '钟胜峰12', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '休学', '34', '1', '2016-09-08 20:13:08', '10');
INSERT INTO `student` VALUES ('13', '钟胜峰13', '二中1111', '男', null, '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无111111111', '汉族', '江西赣州', null, '34', '1', '2016-09-08 20:13:08', '10');
INSERT INTO `student` VALUES ('14', '钟胜峰14', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-08 20:13:09', '10');
INSERT INTO `student` VALUES ('15', '钟胜峰15', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:12', '9');
INSERT INTO `student` VALUES ('16', '钟胜峰16', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:12', '9');
INSERT INTO `student` VALUES ('17', '钟胜峰17', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:11', '9');
INSERT INTO `student` VALUES ('18', '钟胜峰18', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '毕业', '34', '1', '2016-09-01 14:14:10', '9');
INSERT INTO `student` VALUES ('19', '钟胜峰19', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:14:02', '9');
INSERT INTO `student` VALUES ('20', '钟胜峰20', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:59', '9');
INSERT INTO `student` VALUES ('21', '钟胜峰21', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:58', '9');
INSERT INTO `student` VALUES ('22', '钟胜峰22', '二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-01 14:13:57', '9');
INSERT INTO `student` VALUES ('27', '着眼于', '击飞学院', '男', '25', '2016-09-02', '集合分', '14796325879', '65479312876', '斤斤计较', '无', '汉族', '江西赣州', '在读', '34', '1', '2016-09-08 19:58:34', '9');
INSERT INTO `student` VALUES ('31', '剑姬', '于都二中', '男', '18', '2016-09-03', '剑圣', '15797685435', '15798654852', '京津冀', '学生学生学习学习嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻想嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻', '蒙古族', '江西赣州', '在读', '34', '8', '2016-09-08 19:58:35', '9');
INSERT INTO `student` VALUES ('34', '马克思', '1111', '男', null, '1990-01-01', '111', '11111111111', '11111111111', '1111', '111111', '汉族', '1111', null, '34', '1', '2016-09-07 09:54:32', '9');
INSERT INTO `student` VALUES ('37', '马克', '老家上课', '男', '26', '1990-02-07', '可口可乐', '15454554552', '55454545454', '阿萨看到了', '爱的世界', '蒙古族', '快快快', '在读', '34', '8', '2016-09-08 19:58:23', '9');
INSERT INTO `student` VALUES ('38', '9999', '9999', '男', '26', '1990-01-01', '9999', '99999999999', '99999999999', '99999', '999999', '汉族', '9999', '在读', '34', '8', '2016-09-08 19:58:22', '9');
INSERT INTO `student` VALUES ('39', '利客隆', '啥地方放', '男', '26', '1990-01-01', '爱的色放', '15779797875', '78798754125', '安防罚安抚', '大大发', '汉族', '圣达菲都', '在读', '34', '1', '2016-09-08 20:18:34', '9');
INSERT INTO `student` VALUES ('40', '刘克军', '离开汉就', '男', '26', '1990-01-01', '老对手', '15779787878', '15454545487', '基金奶奶说', '文案无诶你卡尼积分  ', '汉族', '离开大号呢', '在读', '34', '1', '2016-09-08 20:20:05', null);
INSERT INTO `student` VALUES ('41', '吉克斯', '普京大学', '男', '26', '1990-01-01', '吉利区', '15797987989', '15778787968', '凤凰军事', '打好款啦啦啦家爱几分', '汉族', '拢盟孤独', '在读', '34', '1', '2016-09-08 20:21:31', '10');
INSERT INTO `student` VALUES ('42', '大时代', '911大学', '男', '26', '1990-01-01', '打开', '15789856968', '55465201658', '打安抚', '罚发啊啊罚罚', '汉族', '看江苏很', '在读', '34', '1', '2016-09-08 20:22:17', '10');
INSERT INTO `student` VALUES ('43', '铃兰', '育德据卡萨', '男', null, '1990-01-01', '李康生', '15797987581', '15786532361', '打多久', '按打开黄金卡打开肯定还记得艾克几', '汉族', '江西赣州', null, '36', '2', '2016-09-08 21:01:59', '9');
INSERT INTO `student` VALUES ('44', '李淑萍', '大禾中学', '男', null, '1990-01-01', '立刻解决', '15778788968', '15787887939', '大会的垃圾啊', '大国手段和低价', '汉族', '江西赣州', null, '36', '2', '2016-09-08 21:03:17', '10');

-- ----------------------------
-- Table structure for studentyx
-- ----------------------------
DROP TABLE IF EXISTS `studentyx`;
CREATE TABLE `studentyx` (
  `intenid` int(11) NOT NULL AUTO_INCREMENT,
  `intenname` varchar(50) DEFAULT NULL,
  `intensch` varchar(255) DEFAULT NULL,
  `intensex` char(2) DEFAULT NULL,
  `intenage` int(11) DEFAULT NULL,
  `intenbir` varchar(255) DEFAULT NULL,
  `intenfat` varchar(50) DEFAULT NULL,
  `intentel` varchar(20) DEFAULT NULL,
  `intenfatel` varchar(255) DEFAULT NULL,
  `intenaddr` varchar(255) DEFAULT NULL,
  `intenpeo` varchar(255) DEFAULT NULL,
  `intenmz` varchar(255) DEFAULT NULL,
  `intenjg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`intenid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentyx
-- ----------------------------
INSERT INTO `studentyx` VALUES ('1', '钟胜峰', '于都二中', '男', '18', '1998-1-1', '钟勇', '15779753877', '13876972586', '于都', '无', '汉', '江西赣州');
INSERT INTO `studentyx` VALUES ('2', '剑姬', '于都二中', '男', '18', '2016-09-03', '剑圣', '15797685435', '15798654852', '京津冀', '无', '蒙古族', '江西赣州');

-- ----------------------------
-- Table structure for stutotal
-- ----------------------------
DROP TABLE IF EXISTS `stutotal`;
CREATE TABLE `stutotal` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` int(11) DEFAULT NULL COMMENT '学生编码',
  `ssay` varchar(255) DEFAULT NULL COMMENT '学生评语',
  `semester` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `stuid` (`stuid`),
  CONSTRAINT `stutotal_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stutotal
-- ----------------------------
INSERT INTO `stutotal` VALUES ('10', '1', '这个学生在本学期表现良好', '第一学期');
INSERT INTO `stutotal` VALUES ('11', '2', '这是一个斗笔你人文   撒旦', '第一学期');
INSERT INTO `stutotal` VALUES ('12', '1', '企鹅企鹅企鹅企鹅而且前期为轻微', '第四学期');
INSERT INTO `stutotal` VALUES ('13', '44', '而武器二恶趣味企鹅企鹅请二位请额', '第一学期');

-- ----------------------------
-- Table structure for tuition
-- ----------------------------
DROP TABLE IF EXISTS `tuition`;
CREATE TABLE `tuition` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `one` decimal(10,2) DEFAULT NULL COMMENT '预科费用',
  `two` decimal(10,2) DEFAULT NULL COMMENT '第一学期费用',
  `three` decimal(10,2) DEFAULT NULL COMMENT '第二学期费用',
  `four` decimal(10,2) DEFAULT NULL COMMENT '第三学期费用',
  `five` decimal(10,2) DEFAULT NULL COMMENT '第四学期费用',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tuition
-- ----------------------------
INSERT INTO `tuition` VALUES ('1', '300.00', '4500.00', '5500.00', '6500.00', '7500.00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `pwd` varchar(255) DEFAULT 'JdVa0oOqQAr0ZMdtcTwHrQ==',
  `status` int(11) NOT NULL COMMENT '状态',
  `eid` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`),
  KEY `eid` (`eid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`zid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '123456', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '7', '15');
INSERT INTO `user` VALUES ('11', '110120119', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '11', '15');
INSERT INTO `user` VALUES ('12', '15797635241', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '4', '31');
INSERT INTO `user` VALUES ('13', '15779768755', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '2', '34');
INSERT INTO `user` VALUES ('14', '15797678542', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '6', '35');
INSERT INTO `user` VALUES ('16', '11111111111', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '1', '37');
INSERT INTO `user` VALUES ('17', '15779753872', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '4', '41');
INSERT INTO `user` VALUES ('18', '15779753875', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '12', '42');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES ('18', '2', '篮球', '23', '23');
INSERT INTO `work` VALUES ('19', '4', '12强', '11', '11');
INSERT INTO `work` VALUES ('20', '1', '铅球', '99', '200');
INSERT INTO `work` VALUES ('21', '1', '羽毛球', '100', '200');
INSERT INTO `work` VALUES ('23', '1', '乒乓球', '20', '20');
INSERT INTO `work` VALUES ('27', '1', '排球', '101', '101');
INSERT INTO `work` VALUES ('28', '2', '电脑', '995', '995');
INSERT INTO `work` VALUES ('32', '4', '多读书', '15', '15');

-- ----------------------------
-- Table structure for workcheck
-- ----------------------------
DROP TABLE IF EXISTS `workcheck`;
CREATE TABLE `workcheck` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `wdate` datetime DEFAULT NULL COMMENT '打卡时间',
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`wid`),
  KEY `eid` (`eid`),
  CONSTRAINT `workcheck_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workcheck
-- ----------------------------
INSERT INTO `workcheck` VALUES ('60', '2', '2016-09-01 11:25:17', '签到');
INSERT INTO `workcheck` VALUES ('61', '15', '2016-09-03 08:56:42', '签到');
INSERT INTO `workcheck` VALUES ('62', '15', '2016-09-03 08:56:53', '签到');

-- ----------------------------
-- Table structure for worktype
-- ----------------------------
DROP TABLE IF EXISTS `worktype`;
CREATE TABLE `worktype` (
  `swid` int(11) NOT NULL AUTO_INCREMENT,
  `swname` varchar(255) NOT NULL,
  PRIMARY KEY (`swid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worktype
-- ----------------------------
INSERT INTO `worktype` VALUES ('1', '体育类');
INSERT INTO `worktype` VALUES ('2', '电子类');
INSERT INTO `worktype` VALUES ('3', '书本类');
INSERT INTO `worktype` VALUES ('4', '其他类');
