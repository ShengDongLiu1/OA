/*
Navicat MySQL Data Transfer

Source Server         : oa
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-09-01 09:36:11
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('5', '1', '2', '篮球', '99', '999.00', '1000.00', '999', '2016-08-30 20:35:38', '已购买');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) DEFAULT NULL COMMENT '名称',
  `classcount` int(11) DEFAULT NULL COMMENT '班级人数',
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('34', '15春', '1', '2', '2', '2', '2', '2');

-- ----------------------------
-- Table structure for computer
-- ----------------------------
DROP TABLE IF EXISTS `computer`;
CREATE TABLE `computer` (
  `comid` int(11) NOT NULL AUTO_INCREMENT,
  `coma` varchar(255) DEFAULT NULL COMMENT '电脑',
  `comb` varchar(255) DEFAULT NULL COMMENT '配件',
  `stuid` int(11) DEFAULT NULL COMMENT '学生',
  PRIMARY KEY (`comid`),
  KEY `stuid` (`stuid`),
  CONSTRAINT `computer_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of computer
-- ----------------------------
INSERT INTO `computer` VALUES ('7', '1', '1', '3');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `objectid` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程编码',
  `objectname` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `semester` int(11) DEFAULT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'C++', '1');
INSERT INTO `course` VALUES ('2', 'Java', '2');
INSERT INTO `course` VALUES ('3', 'JSP', '2');

-- ----------------------------
-- Table structure for courseplan
-- ----------------------------
DROP TABLE IF EXISTS `courseplan`;
CREATE TABLE `courseplan` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `empid` int(11) DEFAULT NULL COMMENT '教师编码',
  `objectid` int(11) DEFAULT NULL COMMENT '课程编码',
  `content` varchar(255) DEFAULT NULL COMMENT '讲课内容',
  PRIMARY KEY (`kid`),
  KEY `empid` (`empid`),
  KEY `objectid` (`objectid`),
  CONSTRAINT `courseplan_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `courseplan_ibfk_2` FOREIGN KEY (`objectid`) REFERENCES `course` (`objectid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseplan
-- ----------------------------
INSERT INTO `courseplan` VALUES ('4', '2', '1', '1');

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
  PRIMARY KEY (`eid`),
  KEY `mid` (`mid`),
  KEY `estatus` (`estatus`),
  CONSTRAINT `dep_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `department` (`did`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dep_ibfk_2` FOREIGN KEY (`estatus`) REFERENCES `dstatus` (`dsid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dep
-- ----------------------------
INSERT INTO `dep` VALUES ('1', '未分配', '男', '1', '2016-08-29 11:15:14', '1', '1', '1', '1', '1', '1', '2016-08-29 11:15:26', '1');
INSERT INTO `dep` VALUES ('2', '武平1', '男', '2', '2016-08-31 14:59:02', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:02', '5');
INSERT INTO `dep` VALUES ('3', '武平2', '男', '2', '2016-08-31 14:58:57', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:58:57', '5');
INSERT INTO `dep` VALUES ('4', '武平3', '男', '2', '2016-08-31 14:59:05', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:05', '5');
INSERT INTO `dep` VALUES ('5', '武平4', '男', '2', '2016-08-31 14:59:06', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:06', '5');
INSERT INTO `dep` VALUES ('6', '武平5', '男', '2', '2016-08-31 14:59:10', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:10', '5');
INSERT INTO `dep` VALUES ('7', '武平6', '男', '2', '2016-08-31 14:59:11', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:11', '5');
INSERT INTO `dep` VALUES ('8', '武平7', '男', '2', '2016-08-31 14:59:12', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:12', '5');
INSERT INTO `dep` VALUES ('9', '武平8', '男', '2', '2016-08-31 14:59:14', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:14', '5');
INSERT INTO `dep` VALUES ('10', '武平9', '男', '2', '2016-08-31 14:59:15', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:15', '5');
INSERT INTO `dep` VALUES ('11', '武平10', '男', '2', '2016-08-31 14:59:17', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:17', '5');
INSERT INTO `dep` VALUES ('12', '武平11', '男', '2', '2016-08-31 14:59:18', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:18', '5');
INSERT INTO `dep` VALUES ('13', '武平12', '男', '2', '2016-08-31 14:59:19', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:19', '5');
INSERT INTO `dep` VALUES ('14', '武平13', '男', '2', '2016-08-31 14:59:21', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:21', '5');
INSERT INTO `dep` VALUES ('15', '武平14', '男', '2', '2016-08-31 14:59:23', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:23', '5');
INSERT INTO `dep` VALUES ('16', '武平15', '男', '2', '2016-08-31 14:59:26', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:26', '5');
INSERT INTO `dep` VALUES ('17', '武平16', '男', '2', '2016-08-31 14:59:30', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:30', '5');
INSERT INTO `dep` VALUES ('18', '武平17', '男', '2', '2016-08-31 14:59:32', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:32', '5');
INSERT INTO `dep` VALUES ('19', '武平18', '男', '2', '2016-08-31 14:59:34', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:34', '5');
INSERT INTO `dep` VALUES ('20', '武平19', '男', '2', '2016-08-31 14:59:37', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:37', '5');
INSERT INTO `dep` VALUES ('21', '武平20', '男', '2', '2016-08-31 14:59:39', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:39', '5');
INSERT INTO `dep` VALUES ('22', '武平21', '男', '2', '2016-08-31 14:59:40', '11', '1111111', '1', '1', '1', '1', '2016-08-31 14:59:40', '5');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL,
  `dcreatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '未分配', '2016-08-26 10:34:35');
INSERT INTO `department` VALUES ('2', '行政部·', '2016-08-30 14:27:15');

-- ----------------------------
-- Table structure for dstatus
-- ----------------------------
DROP TABLE IF EXISTS `dstatus`;
CREATE TABLE `dstatus` (
  `dsid` int(11) NOT NULL AUTO_INCREMENT,
  `dsname` varchar(255) NOT NULL,
  PRIMARY KEY (`dsid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dstatus
-- ----------------------------
INSERT INTO `dstatus` VALUES ('1', '任课老师');
INSERT INTO `dstatus` VALUES ('2', '辅导老师');
INSERT INTO `dstatus` VALUES ('3', '班主任');
INSERT INTO `dstatus` VALUES ('4', '教务主任');
INSERT INTO `dstatus` VALUES ('5', '后勤主任');
INSERT INTO `dstatus` VALUES ('6', '招生老师');
INSERT INTO `dstatus` VALUES ('7', '助理');

-- ----------------------------
-- Table structure for duty
-- ----------------------------
DROP TABLE IF EXISTS `duty`;
CREATE TABLE `duty` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `ddatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `dstatus` int(11) DEFAULT NULL COMMENT '类型',
  `drange` varchar(255) DEFAULT NULL COMMENT '范围',
  `ddesc` varchar(255) DEFAULT NULL COMMENT '情况',
  PRIMARY KEY (`did`),
  KEY `eid` (`eid`),
  CONSTRAINT `duty_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of duty
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expend
-- ----------------------------
INSERT INTO `expend` VALUES ('1', '购物', '1000.00', null, null);
INSERT INTO `expend` VALUES ('2', '发放工资', '1122.00', null, null);
INSERT INTO `expend` VALUES ('3', '发放工资', '44.00', null, null);
INSERT INTO `expend` VALUES ('4', '发放工资', '44.00', null, null);
INSERT INTO `expend` VALUES ('5', '发放工资', '2521.00', null, null);
INSERT INTO `expend` VALUES ('6', '发放工资', '7300.00', null, null);
INSERT INTO `expend` VALUES ('7', '购买物品', '98901.00', null, null);
INSERT INTO `expend` VALUES ('8', '发放工资', '0.00', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fankui
-- ----------------------------
INSERT INTO `fankui` VALUES ('3', '1', '1', '1', '1', '2016-08-31 19:44:00');

-- ----------------------------
-- Table structure for getjob
-- ----------------------------
DROP TABLE IF EXISTS `getjob`;
CREATE TABLE `getjob` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `jobstu` int(255) DEFAULT NULL COMMENT '学生编码',
  `jobdesc` varchar(255) DEFAULT NULL COMMENT '职位描述',
  PRIMARY KEY (`jobid`),
  KEY `jobstu` (`jobstu`),
  CONSTRAINT `getjob_ibfk_1` FOREIGN KEY (`jobstu`) REFERENCES `student` (`intenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of getjob
-- ----------------------------
INSERT INTO `getjob` VALUES ('2', '后天', '5', '经理');
INSERT INTO `getjob` VALUES ('3', '1', '3', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('36', '3', '11.00', 'C++');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hourse
-- ----------------------------
INSERT INTO `hourse` VALUES ('1', '未分配', null, null, null);
INSERT INTO `hourse` VALUES ('2', '二栋1', null, null, null);
INSERT INTO `hourse` VALUES ('3', '小红楼', null, null, null);
INSERT INTO `hourse` VALUES ('4', '土砖楼', null, null, null);
INSERT INTO `hourse` VALUES ('5', '123', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of income
-- ----------------------------
INSERT INTO `income` VALUES ('21', '300.00', '收取学费', '廖文汉', '2016-08-28 15:01:41');
INSERT INTO `income` VALUES ('22', '300.00', '收取学费', '廖文汉', '2016-08-28 15:01:44');
INSERT INTO `income` VALUES ('23', '1000.00', '收取学费', '廖文汉', '2016-08-28 15:09:06');
INSERT INTO `income` VALUES ('24', '1000.00', '收取学费', '廖文汉', '2016-08-28 15:09:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('5', '1', '3', '2', '2016-08-31 19:45:35', '1');

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
INSERT INTO `jobs` VALUES ('1', '1', '2016-08-31 19:46:04', '2016-08-31 19:46:07', '1', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('2', '放假一天', '2016-08-13 00:19:31', '2016-08-23 00:19:33');
INSERT INTO `msg` VALUES ('5', '放假一天', '2016-08-28 04:17:40', '2016-08-29 04:17:56');
INSERT INTO `msg` VALUES ('6', '放假一天', '2016-08-29 04:18:11', '2016-08-30 04:17:58');
INSERT INTO `msg` VALUES ('7', '放假一天', '2016-08-29 04:18:14', '2016-08-30 04:17:43');
INSERT INTO `msg` VALUES ('9', '放假一天', '2016-08-29 04:18:22', '2016-08-30 04:17:44');
INSERT INTO `msg` VALUES ('11', '放假一天', '2016-08-29 04:18:28', '2016-08-30 04:17:45');
INSERT INTO `msg` VALUES ('12', '放假一天', '2016-08-29 04:18:31', '2016-08-30 04:17:46');
INSERT INTO `msg` VALUES ('13', '放假一天\r\n', '2016-08-29 04:18:34', '2016-10-27 04:17:48');
INSERT INTO `msg` VALUES ('15', '招收教员', '2016-09-01 09:11:56', '2017-02-07 15:12:07');

-- ----------------------------
-- Table structure for pays
-- ----------------------------
DROP TABLE IF EXISTS `pays`;
CREATE TABLE `pays` (
  `paysid` int(11) NOT NULL AUTO_INCREMENT COMMENT '工资编码',
  `empid` int(11) DEFAULT NULL COMMENT '员工编码',
  `paysa` decimal(10,0) DEFAULT NULL COMMENT '奖励金额',
  `paysb` decimal(10,0) DEFAULT NULL COMMENT '惩罚金额',
  `payspro` varchar(255) DEFAULT NULL COMMENT '惩罚原因',
  `payssta` decimal(10,0) DEFAULT NULL COMMENT '基本工资',
  `paysc` decimal(10,0) DEFAULT NULL COMMENT '补贴工资',
  `paysd` decimal(10,0) DEFAULT NULL COMMENT '结余工资',
  `paytime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`paysid`),
  KEY `empid` (`empid`),
  CONSTRAINT `pays_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pays
-- ----------------------------
INSERT INTO `pays` VALUES ('18', '2', '123', '-123', '123', '123', '123', '246', '2016-08-31 11:45:41');
INSERT INTO `pays` VALUES ('19', '2', '1234', '-1234', '12345678', '1234', '1234', '2468', '2016-08-31 11:49:17');
INSERT INTO `pays` VALUES ('20', '3', '1234', '-1234', '12345678', '1234', '1234', '2468', '2016-08-31 11:49:20');
INSERT INTO `pays` VALUES ('21', '4', '1234', '-1234', '12345678', '1234', '1234', '2468', '2016-08-31 11:49:23');
INSERT INTO `pays` VALUES ('22', '2', '12', '-1', '12', '1221', '1212', '2444', '2016-08-31 14:07:42');
INSERT INTO `pays` VALUES ('23', '2', '1234', '-1234', '1234', '1234', '1234', '2468', '2016-08-31 14:14:32');
INSERT INTO `pays` VALUES ('24', '3', '1234', '-1234', '2345', '1234', '1234', '2468', '2016-08-31 14:14:32');
INSERT INTO `pays` VALUES ('25', '4', '2345', '-2345', '2345', '345', '2345', '2690', '2016-08-31 14:14:32');
INSERT INTO `pays` VALUES ('26', '2', '111', '-111', '111', '111', '111', '222', '2016-08-23 14:27:43');
INSERT INTO `pays` VALUES ('27', '3', '111', '-111', '111', '111', '111', '222', '2016-08-23 14:27:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16;

-- ----------------------------
-- Records of rawpun
-- ----------------------------
INSERT INTO `rawpun` VALUES ('4', '3', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receiue
-- ----------------------------
INSERT INTO `receiue` VALUES ('13', '2', '17', '1', '1', '2016-08-31 00:00:00', '2016-08-31 00:00:00', '借');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf16;

-- ----------------------------
-- Records of says
-- ----------------------------
INSERT INTO `says` VALUES ('6', '3', '1', '1', '1', '1');

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
INSERT INTO `status` VALUES ('2', '班主任');
INSERT INTO `status` VALUES ('3', '招生老师');
INSERT INTO `status` VALUES ('4', '教务主任');
INSERT INTO `status` VALUES ('5', '后勤主任');
INSERT INTO `status` VALUES ('6', '助理');
INSERT INTO `status` VALUES ('7', '辅导老师');
INSERT INTO `status` VALUES ('8', '意向学生');
INSERT INTO `status` VALUES ('9', '预订学生');
INSERT INTO `status` VALUES ('10', '正式学生');
INSERT INTO `status` VALUES ('11', '超级管理员');
INSERT INTO `status` VALUES ('12', '普通管理员');

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
  `intenstatus` int(11) DEFAULT NULL COMMENT '状态',
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '钟胜峰1', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 19:48:57', '1');
INSERT INTO `student` VALUES ('2', '钟胜峰2', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 19:49:01', '1');
INSERT INTO `student` VALUES ('3', '钟胜峰3', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:18', '1');
INSERT INTO `student` VALUES ('4', '钟胜峰4', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:19', '1');
INSERT INTO `student` VALUES ('5', '钟胜峰5', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:19', '1');
INSERT INTO `student` VALUES ('6', '钟胜峰6', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:20', '1');
INSERT INTO `student` VALUES ('7', '钟胜峰7', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:21', '1');
INSERT INTO `student` VALUES ('8', '钟胜峰8', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:22', '1');
INSERT INTO `student` VALUES ('9', '钟胜峰9', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:22', '1');
INSERT INTO `student` VALUES ('10', '钟胜峰10', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:31', '1');
INSERT INTO `student` VALUES ('11', '钟胜峰11', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:35', '1');
INSERT INTO `student` VALUES ('12', '钟胜峰12', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:36', '1');
INSERT INTO `student` VALUES ('13', '钟胜峰13', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:39', '1');
INSERT INTO `student` VALUES ('14', '钟胜峰14', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 10:12:40', '1');
INSERT INTO `student` VALUES ('15', '钟胜峰15', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 19:48:40', '1');
INSERT INTO `student` VALUES ('16', '钟胜峰16', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 19:48:43', '1');
INSERT INTO `student` VALUES ('17', '钟胜峰17', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 19:48:47', '1');
INSERT INTO `student` VALUES ('18', '钟胜峰18', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 19:48:49', '1');
INSERT INTO `student` VALUES ('19', '钟胜峰19', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 19:48:52', '1');
INSERT INTO `student` VALUES ('20', '钟胜峰20', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 19:48:55', '1');
INSERT INTO `student` VALUES ('21', '钟胜峰21', '二中', '男', '18', '2016-08-30', '钟楼盘', '1571689534', '15779756842', '地底', '无', '汉', '江西', null, '34', '1', '2016-08-31 19:49:03', '1');

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
  `stustatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`intenid`),
  KEY `stustatus` (`stustatus`),
  CONSTRAINT `studentyx_ibfk_3` FOREIGN KEY (`stustatus`) REFERENCES `status` (`zid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentyx
-- ----------------------------
INSERT INTO `studentyx` VALUES ('22', '张青', '人头', '男', '12', '1990-01-01', '张浩', '13435', '413414', '413141', '21414', '汉', '江西', '8');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stutotal
-- ----------------------------
INSERT INTO `stutotal` VALUES ('9', '3', 'sd', '第一学期');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '状态',
  `eid` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`),
  KEY `eid` (`eid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`zid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `dep` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '13876619779', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '1', '1');
INSERT INTO `user` VALUES ('2', '15779753872', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '1', '1');
INSERT INTO `user` VALUES ('3', '123456', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '11', '2');
INSERT INTO `user` VALUES ('11', '110120119', 'JdVa0oOqQAr0ZMdtcTwHrQ==', '11', '2');

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `wtypeid` int(255) DEFAULT NULL COMMENT '类型',
  `wname` varchar(255) DEFAULT NULL COMMENT '名称',
  `wamount` int(255) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`wid`),
  KEY `work_type_id` (`wtypeid`),
  CONSTRAINT `work_type_id` FOREIGN KEY (`wtypeid`) REFERENCES `worktype` (`swid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES ('17', '2', '吉他', '10');
INSERT INTO `work` VALUES ('18', '1', '篮球', '23');
INSERT INTO `work` VALUES ('19', '1', '羽毛球', '23');

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workcheck
-- ----------------------------

-- ----------------------------
-- Table structure for worktype
-- ----------------------------
DROP TABLE IF EXISTS `worktype`;
CREATE TABLE `worktype` (
  `swid` int(11) NOT NULL AUTO_INCREMENT,
  `swname` varchar(255) NOT NULL,
  PRIMARY KEY (`swid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worktype
-- ----------------------------
INSERT INTO `worktype` VALUES ('1', '体育类');
INSERT INTO `worktype` VALUES ('2', '电子类');
INSERT INTO `worktype` VALUES ('3', '书本类');
