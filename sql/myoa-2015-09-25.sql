/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50542
Source Host           : 127.0.0.1:3306
Source Database       : myoa

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2015-09-25 19:02:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accessory_file
-- ----------------------------
DROP TABLE IF EXISTS `accessory_file`;
CREATE TABLE `accessory_file` (
  `accessory_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL COMMENT '文件Id',
  `accessory_name` varchar(50) NOT NULL COMMENT '附件名称',
  `accessory_size` int(11) NOT NULL COMMENT '附件大小',
  `accessory_type` int(11) NOT NULL COMMENT '附件类型',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `accessory_path` varchar(100) NOT NULL COMMENT '附件路径',
  PRIMARY KEY (`accessory_id`),
  KEY `fk_accessory_file_file_info` (`file_id`),
  CONSTRAINT `fk_accessory_file_file_info` FOREIGN KEY (`file_id`) REFERENCES `file_info` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件文件';

-- ----------------------------
-- Records of accessory_file
-- ----------------------------

-- ----------------------------
-- Table structure for branch_info
-- ----------------------------
DROP TABLE IF EXISTS `branch_info`;
CREATE TABLE `branch_info` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(50) NOT NULL COMMENT '机构全称',
  `branch_short_name` varchar(20) NOT NULL COMMENT '机构简称',
  `if_delete_brance` int(11) NOT NULL COMMENT '机构是否被删除 1:未删除 0:已删除',
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='机构信息表';

-- ----------------------------
-- Records of branch_info
-- ----------------------------
INSERT INTO `branch_info` VALUES ('1', '华北电力科学研究院', '中国电力要地', '1');
INSERT INTO `branch_info` VALUES ('2', '中国科学院声学研究所', '声学院', '1');
INSERT INTO `branch_info` VALUES ('3', '北大青鸟集团', 'IT学校', '1');
INSERT INTO `branch_info` VALUES ('4', '大堂国际盘山发电有限公司', '简介略略略略略略', '1');
INSERT INTO `branch_info` VALUES ('5', '中国农科院', '研究院', '1');

-- ----------------------------
-- Table structure for depart_info
-- ----------------------------
DROP TABLE IF EXISTS `depart_info`;
CREATE TABLE `depart_info` (
  `depart_id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(50) NOT NULL COMMENT '部门名称',
  `principal_user` varchar(50) NOT NULL COMMENT '部门负责人',
  `connect_tel_no` bigint(11) DEFAULT NULL COMMENT '联系电话',
  `connect_mobile_tel_no` bigint(11) DEFAULT NULL COMMENT '移动电话',
  `fares` bigint(20) DEFAULT NULL COMMENT '传真',
  `branch_id` int(11) NOT NULL COMMENT '所属机构',
  `if_delete_depart` int(11) NOT NULL COMMENT '1：未删除  0：已删除',
  PRIMARY KEY (`depart_id`),
  KEY `fk_depart_info_user_info` (`principal_user`),
  CONSTRAINT `fk_depart_info_user_info` FOREIGN KEY (`principal_user`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Records of depart_info
-- ----------------------------
INSERT INTO `depart_info` VALUES ('1', '销售部', 'qijingxue', '13454356545', '3454567', '4354678', '1', '1');
INSERT INTO `depart_info` VALUES ('2', '研发部', 'a', '13478989878', '6756456', '8978787', '2', '1');
INSERT INTO `depart_info` VALUES ('3', '综合部', 'liuguangping', '13456564532', '6756577', '8954365', '3', '1');
INSERT INTO `depart_info` VALUES ('4', '培训部', 'wangchao', '13478957687', '56748656', '9078654', '3', '1');
INSERT INTO `depart_info` VALUES ('5', '发电部', 'yuanbin', '13564567876', '6756877', '6543234', '4', '1');

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(50) NOT NULL COMMENT '文件名称',
  `file_type` int(50) NOT NULL COMMENT '文件类型',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `file_owner` varchar(50) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `parent_id` int(11) NOT NULL COMMENT '父节点Id',
  `file_path` varchar(100) NOT NULL COMMENT '文件路径 ',
  `if_delete` int(11) NOT NULL COMMENT '0：已删除、1：未删除',
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `fk_file_info_file_type` (`file_type`),
  CONSTRAINT `fk_file_info_file_type` FOREIGN KEY (`file_type`) REFERENCES `file_type_info` (`file_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件信息表';

-- ----------------------------
-- Records of file_info
-- ----------------------------

-- ----------------------------
-- Table structure for file_type_info
-- ----------------------------
DROP TABLE IF EXISTS `file_type_info`;
CREATE TABLE `file_type_info` (
  `file_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_type_name` varchar(50) NOT NULL COMMENT '文件类型名',
  `file_type_image` varchar(50) NOT NULL COMMENT '文件类型对应的图标',
  `file_type_suffix` varchar(50) DEFAULT NULL COMMENT '文件类型后缀',
  PRIMARY KEY (`file_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件类型表';

-- ----------------------------
-- Records of file_type_info
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `user_id` varchar(20) DEFAULT '',
  `login_desc` varchar(20) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '登录成功', '2015-06-03 13:55:01');
INSERT INTO `log` VALUES ('3', '登录成功', '2015-06-03 14:27:18');
INSERT INTO `log` VALUES ('4', '登录成功', '2015-06-03 14:37:49');
INSERT INTO `log` VALUES ('5', '登录成功', '2015-06-03 14:49:10');
INSERT INTO `log` VALUES ('6', '登录成功', '2015-06-03 15:07:41');
INSERT INTO `log` VALUES ('7', '登录成功', '2015-06-04 15:14:57');
INSERT INTO `log` VALUES ('8', '登录成功', '2015-06-04 15:16:28');
INSERT INTO `log` VALUES ('9', '登录成功', '2015-06-04 15:22:53');
INSERT INTO `log` VALUES ('10', '登录成功', '2015-06-04 15:23:22');
INSERT INTO `log` VALUES ('11', '登录成功', '2015-06-04 16:21:30');
INSERT INTO `log` VALUES ('12', '登录成功', '2015-06-04 16:51:53');
INSERT INTO `log` VALUES ('13', '登录成功', '2015-06-04 17:04:40');
INSERT INTO `log` VALUES ('14', '登录成功', '2015-06-04 17:21:08');
INSERT INTO `log` VALUES ('15', '登录成功', '2015-06-04 18:47:30');
INSERT INTO `log` VALUES ('16', '登录', '2015-06-05 14:28:36');
INSERT INTO `log` VALUES ('17', '登录', '2015-06-05 18:49:55');
INSERT INTO `log` VALUES ('18', '登录', '2015-06-05 18:52:38');
INSERT INTO `log` VALUES ('19', '登录', '2015-06-05 19:03:38');
INSERT INTO `log` VALUES ('20', '登录', '2015-06-05 20:14:04');
INSERT INTO `log` VALUES ('21', '登录', '2015-06-05 20:44:23');
INSERT INTO `log` VALUES ('22', '登录', '2015-06-05 21:13:20');
INSERT INTO `log` VALUES ('23', '登录', '2015-06-05 21:34:12');
INSERT INTO `log` VALUES ('24', '登录', '2015-06-05 21:38:18');
INSERT INTO `log` VALUES ('25', '登录', '2015-06-05 21:45:34');
INSERT INTO `log` VALUES ('26', '登录', '2015-06-05 21:51:27');
INSERT INTO `log` VALUES ('27', '登录', '2015-06-05 21:52:42');
INSERT INTO `log` VALUES ('28', '登录', '2015-06-05 21:55:08');
INSERT INTO `log` VALUES ('29', '登录', '2015-06-05 21:57:15');
INSERT INTO `log` VALUES ('30', '登录', '2015-06-05 22:01:19');
INSERT INTO `log` VALUES ('31', '登录', '2015-06-05 22:03:39');
INSERT INTO `log` VALUES ('32', '登录', '2015-06-05 22:08:25');
INSERT INTO `log` VALUES ('33', '登录', '2015-06-05 22:10:09');
INSERT INTO `log` VALUES ('34', '登录', '2015-06-05 22:23:55');
INSERT INTO `log` VALUES ('35', '登录', '2015-06-05 22:26:20');
INSERT INTO `log` VALUES ('36', '登录', '2015-06-05 22:29:36');
INSERT INTO `log` VALUES ('37', '登录', '2015-06-05 22:31:28');
INSERT INTO `log` VALUES ('38', '登录', '2015-06-05 22:33:19');
INSERT INTO `log` VALUES ('39', '登录', '2015-06-05 22:36:20');
INSERT INTO `log` VALUES ('40', '登录', '2015-06-05 22:36:53');
INSERT INTO `log` VALUES ('41', '登录', '2015-06-05 22:40:28');
INSERT INTO `log` VALUES ('42', '登录', '2015-06-05 22:42:36');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL COMMENT '登陆者',
  `login_time` datetime NOT NULL COMMENT '登陆时间',
  `if_success` int(11) NOT NULL COMMENT '1:成功 0:失败 ',
  `login_user_ip` varchar(100) NOT NULL COMMENT '登陆用户IP',
  `login_desc` varchar(100) DEFAULT NULL COMMENT '登陆备注',
  PRIMARY KEY (`login_id`),
  KEY `fk_login_log_user` (`user_id`),
  CONSTRAINT `fk_login_log_user` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COMMENT='登陆日志表';

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES ('1', 'yuyidi', '2015-06-03 13:55:01', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('3', 'yuyidi', '2015-06-03 14:27:18', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('4', 'yuyidi', '2015-06-03 14:37:49', '1', '192.168.0.147:8080', '登录成功');
INSERT INTO `login_log` VALUES ('5', 'yuyidi', '2015-06-03 14:49:10', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('6', 'yuyidi', '2015-06-03 15:07:41', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('7', 'yuyidi', '2015-06-04 15:14:57', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('8', 'yuyidi', '2015-06-04 15:16:28', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('9', 'yuyidi', '2015-06-04 15:22:53', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('10', 'yuyidi', '2015-06-04 15:23:22', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('11', 'yuyidi', '2015-06-04 16:21:30', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('12', 'yuyidi', '2015-06-04 16:51:53', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('13', 'yuyidi', '2015-06-04 17:04:40', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('14', 'yuyidi', '2015-06-04 17:21:08', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('15', 'yuyidi', '2015-06-04 18:47:30', '1', '127.0.0.1:8080', '登录成功');
INSERT INTO `login_log` VALUES ('16', 'yuyidi', '2015-06-05 14:28:36', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('17', 'yuyidi', '2015-06-05 18:49:55', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('18', 'yuyidi', '2015-06-05 18:52:38', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('19', 'yuyidi', '2015-06-05 19:03:38', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('20', 'yuyidi', '2015-06-05 20:14:04', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('21', 'yuyidi', '2015-06-05 20:44:23', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('22', 'yuyidi', '2015-06-05 21:13:20', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('23', 'yuyidi', '2015-06-05 21:34:12', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('24', 'yuyidi', '2015-06-05 21:38:18', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('25', 'yuyidi', '2015-06-05 21:45:34', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('26', 'yuyidi', '2015-06-05 21:51:27', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('27', 'yuyidi', '2015-06-05 21:52:42', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('28', 'yuyidi', '2015-06-05 21:55:08', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('29', 'yuyidi', '2015-06-05 21:57:15', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('30', 'yuyidi', '2015-06-05 22:01:19', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('31', 'yuyidi', '2015-06-05 22:03:39', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('32', 'yuyidi', '2015-06-05 22:08:25', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('33', 'yuyidi', '2015-06-05 22:10:09', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('34', 'yuyidi', '2015-06-05 22:23:55', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('35', 'yuyidi', '2015-06-05 22:26:20', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('36', 'yuyidi', '2015-06-05 22:29:36', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('37', 'yuyidi', '2015-06-05 22:31:28', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('38', 'yuyidi', '2015-06-05 22:33:19', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('39', 'yuyidi', '2015-06-05 22:36:20', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('40', 'yuyidi', '2015-06-05 22:36:53', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('41', 'yuyidi', '2015-06-05 22:40:28', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('42', 'yuyidi', '2015-06-05 22:42:36', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('43', 'yuyidi', '2015-06-09 17:44:46', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('44', 'yuyidi', '2015-08-13 10:24:18', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('45', 'yuyidi', '2015-08-13 10:28:23', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('46', 'yuyidi', '2015-08-13 11:04:25', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('47', 'yuyidi', '2015-08-13 11:06:51', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('48', 'yuyidi', '2015-08-13 11:18:27', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('49', 'yuyidi', '2015-08-13 11:23:21', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('50', 'yuyidi', '2015-08-13 11:27:00', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('51', 'yuyidi', '2015-08-13 11:30:42', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('52', 'yuyidi', '2015-08-13 11:35:18', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('53', 'yuyidi', '2015-08-13 11:48:59', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('54', 'yuyidi', '2015-08-13 11:50:02', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('55', 'yuyidi', '2015-08-13 11:51:45', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('56', 'yuyidi', '2015-08-13 11:53:20', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('57', 'yuyidi', '2015-08-13 11:55:19', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('58', 'yuyidi', '2015-08-13 11:58:18', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('59', 'yuyidi', '2015-08-13 11:58:51', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('60', 'yuyidi', '2015-08-13 12:00:37', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('61', 'yuyidi', '2015-08-13 12:02:02', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('62', 'yuyidi', '2015-08-13 12:02:57', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('63', 'yuyidi', '2015-08-13 12:09:40', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('64', 'yuyidi', '2015-08-13 12:10:43', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('65', 'yuyidi', '2015-08-13 12:13:57', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('66', 'yuyidi', '2015-08-13 12:14:29', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('67', 'yuyidi', '2015-08-13 12:15:58', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('68', 'yuyidi', '2015-08-13 12:19:23', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('69', 'yuyidi', '2015-08-13 12:23:09', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('70', 'yuyidi', '2015-08-13 12:24:08', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('71', 'yuyidi', '2015-08-13 12:26:16', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('72', 'yuyidi', '2015-08-13 12:27:20', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('73', 'yuyidi', '2015-08-13 12:39:09', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('74', 'yuyidi', '2015-08-13 13:42:50', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('77', 'yuyidi', '2015-08-13 13:45:59', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('78', 'yuyidi', '2015-08-13 14:25:37', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('79', 'yuyidi', '2015-08-13 14:26:42', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('80', 'yuyidi', '2015-08-13 14:30:53', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('81', 'yuyidi', '2015-08-13 14:33:02', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('82', 'yuyidi', '2015-08-13 14:44:43', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('83', 'yuyidi', '2015-08-13 14:49:32', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('84', 'yuyidi', '2015-08-13 14:50:05', '1', 'localhost:8080', '登录');
INSERT INTO `login_log` VALUES ('85', 'yuyidi', '2015-08-13 15:02:24', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('86', 'yuyidi', '2015-08-13 15:13:56', '1', '127.0.0.1:8080', '登录');
INSERT INTO `login_log` VALUES ('87', 'yuyidi', '2015-09-01 15:32:20', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('88', 'yuyidi', '2015-09-01 16:25:01', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('89', 'yuyidi', '2015-09-01 16:35:30', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('90', 'yuyidi', '2015-09-23 16:27:32', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('91', 'yuyidi', '2015-09-23 16:28:47', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('92', 'yuyidi', '2015-09-23 16:30:16', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('93', 'yuyidi', '2015-09-23 16:42:57', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('94', 'yuyidi', '2015-09-23 16:48:48', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('95', 'yuyidi', '2015-09-23 16:50:10', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('96', 'yuyidi', '2015-09-23 16:54:35', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('97', 'yuyidi', '2015-09-23 16:59:47', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('98', 'yuyidi', '2015-09-23 17:01:49', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('99', 'yuyidi', '2015-09-23 17:05:33', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('100', 'yuyidi', '2015-09-23 17:39:28', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('101', 'yuyidi', '2015-09-23 18:09:33', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('102', 'yuyidi', '2015-09-23 18:25:49', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('103', 'yuyidi', '2015-09-23 18:30:07', '1', '192.168.0.118', '登录');
INSERT INTO `login_log` VALUES ('104', 'yuyidi', '2015-09-23 18:33:33', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('105', 'yuyidi', '2015-09-23 18:44:45', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('106', 'yuyidi', '2015-09-23 18:51:47', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('107', 'yuyidi', '2015-09-23 18:59:28', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('108', 'yuyidi', '2015-09-23 19:01:30', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('109', 'yuyidi', '2015-09-23 19:02:48', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('110', 'yuyidi', '2015-09-23 19:04:33', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('111', 'yuyidi', '2015-09-25 10:44:03', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('112', 'yuyidi', '2015-09-25 11:47:00', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('113', 'yuyidi', '2015-09-25 12:23:56', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('114', 'yuyidi', '2015-09-25 14:07:17', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('115', 'yuyidi', '2015-09-25 14:26:34', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('116', 'yuyidi', '2015-09-25 14:52:25', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('117', 'yuyidi', '2015-09-25 15:46:51', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('118', 'yuyidi', '2015-09-25 15:48:59', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('119', 'yuyidi', '2015-09-25 15:53:35', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('120', 'yuyidi', '2015-09-25 17:00:39', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('121', 'yuyidi', '2015-09-25 17:01:19', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('122', 'yuyidi', '2015-09-25 17:01:25', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('123', 'yuyidi', '2015-09-25 17:01:50', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('124', 'yuyidi', '2015-09-25 17:04:56', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('125', 'yuyidi', '2015-09-25 17:06:03', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('126', 'yuyidi', '2015-09-25 17:06:57', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('127', 'yuyidi', '2015-09-25 17:08:05', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('128', 'yuyidi', '2015-09-25 17:11:30', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('129', 'yuyidi', '2015-09-25 17:11:54', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('130', 'yuyidi', '2015-09-25 17:11:58', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('131', 'yuyidi', '2015-09-25 17:12:08', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('132', 'yuyidi', '2015-09-25 17:12:39', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('133', 'yuyidi', '2015-09-25 17:13:08', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('134', 'yuyidi', '2015-09-25 17:13:19', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('135', 'yuyidi', '2015-09-25 17:13:36', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('136', 'yuyidi', '2015-09-25 17:13:57', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('137', 'yuyidi', '2015-09-25 17:14:17', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('138', 'yuyidi', '2015-09-25 17:14:38', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('139', 'yuyidi', '2015-09-25 17:15:00', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('140', 'yuyidi', '2015-09-25 17:15:05', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('141', 'yuyidi', '2015-09-25 17:16:03', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('142', 'yuyidi', '2015-09-25 17:16:38', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('143', 'yuyidi', '2015-09-25 17:17:38', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('144', 'yuyidi', '2015-09-25 17:18:32', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('145', 'yuyidi', '2015-09-25 17:21:18', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('146', 'yuyidi', '2015-09-25 17:21:33', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('147', 'yuyidi', '2015-09-25 17:21:47', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('148', 'yuyidi', '2015-09-25 17:21:53', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('149', 'yuyidi', '2015-09-25 17:24:33', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('150', 'yuyidi', '2015-09-25 17:26:39', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('151', 'yuyidi', '2015-09-25 17:26:54', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('152', 'yuyidi', '2015-09-25 17:31:18', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('153', 'yuyidi', '2015-09-25 17:31:37', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('154', 'yuyidi', '2015-09-25 17:31:59', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('155', 'yuyidi', '2015-09-25 17:32:25', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('156', 'yuyidi', '2015-09-25 17:32:39', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('157', 'yuyidi', '2015-09-25 17:43:17', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('158', 'yuyidi', '2015-09-25 17:52:46', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('159', 'yuyidi', '2015-09-25 18:12:35', '1', '127.0.0.1', '登录');
INSERT INTO `login_log` VALUES ('160', 'yuyidi', '2015-09-25 18:28:37', '1', '127.0.0.1', '登录');

-- ----------------------------
-- Table structure for manua_sign
-- ----------------------------
DROP TABLE IF EXISTS `manua_sign`;
CREATE TABLE `manua_sign` (
  `sign_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL COMMENT '用户Id',
  `sign_time` datetime NOT NULL COMMENT '签卡时间',
  `sign_desc` varchar(50) NOT NULL COMMENT '签卡备注',
  `sign_tag` int(11) NOT NULL COMMENT '签卡标记   0:签到   1：签退 ',
  PRIMARY KEY (`sign_id`),
  KEY `fk_manua_sign_user_info` (`user_id`),
  CONSTRAINT `fk_manua_sign_user_info` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤信息表';

-- ----------------------------
-- Records of manua_sign
-- ----------------------------

-- ----------------------------
-- Table structure for meeting_info
-- ----------------------------
DROP TABLE IF EXISTS `meeting_info`;
CREATE TABLE `meeting_info` (
  `meeting_id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_name` varchar(50) NOT NULL COMMENT '会议类型名称',
  PRIMARY KEY (`meeting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会议类型表';

-- ----------------------------
-- Records of meeting_info
-- ----------------------------
INSERT INTO `meeting_info` VALUES ('1', '全体会议');
INSERT INTO `meeting_info` VALUES ('2', '部门会议');
INSERT INTO `meeting_info` VALUES ('3', '个人日程');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '消息标题',
  `content` varchar(500) NOT NULL COMMENT '消息内容',
  `type` int(11) NOT NULL COMMENT '消息类型',
  `begin_time` datetime NOT NULL COMMENT '开始有效时间',
  `end_time` datetime NOT NULL COMMENT '有效时间',
  `from_user_id` varchar(50) NOT NULL COMMENT '发送者',
  `if_publish` int(11) NOT NULL COMMENT '是否已发布1:未发布 0:已发布',
  `record_time` datetime NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`message_id`),
  KEY `fk_message_message_type` (`type`),
  CONSTRAINT `fk_message_message_type` FOREIGN KEY (`type`) REFERENCES `message_type` (`message_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for message_to_user
-- ----------------------------
DROP TABLE IF EXISTS `message_to_user`;
CREATE TABLE `message_to_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL COMMENT '消息Id',
  `to_user_id` varchar(50) NOT NULL COMMENT '发送对象Id',
  `if_read` int(11) NOT NULL COMMENT '1：已读、0：未读',
  PRIMARY KEY (`id`),
  KEY `fk_message_to_user_message` (`message_id`),
  CONSTRAINT `fk_message_to_user_message` FOREIGN KEY (`message_id`) REFERENCES `message` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息发送对象';

-- ----------------------------
-- Records of message_to_user
-- ----------------------------

-- ----------------------------
-- Table structure for message_type
-- ----------------------------
DROP TABLE IF EXISTS `message_type`;
CREATE TABLE `message_type` (
  `message_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type_name` varchar(50) NOT NULL COMMENT '消息类型名称',
  `message_desc` varchar(50) DEFAULT NULL COMMENT '消息类型描述',
  PRIMARY KEY (`message_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息类型表';

-- ----------------------------
-- Records of message_type
-- ----------------------------

-- ----------------------------
-- Table structure for my_note
-- ----------------------------
DROP TABLE IF EXISTS `my_note`;
CREATE TABLE `my_note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `note_title` varchar(50) NOT NULL COMMENT '便签标题',
  `note_content` varchar(100) DEFAULT NULL COMMENT '便签内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建者',
  PRIMARY KEY (`note_id`),
  KEY `fk_my_note_user_info` (`create_user`),
  CONSTRAINT `fk_my_note_user_info` FOREIGN KEY (`create_user`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='便签\r\n';

-- ----------------------------
-- Records of my_note
-- ----------------------------

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log` (
  `operate_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL COMMENT '操作者',
  `operate_name` varchar(50) NOT NULL COMMENT '操作名称',
  `object_id` varchar(50) NOT NULL COMMENT '操作对象Id',
  `operate_desc` varchar(200) NOT NULL COMMENT '操作描述',
  `operate_date` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`operate_id`),
  KEY `fk_operate_log_user_info` (`user_id`),
  CONSTRAINT `fk_operate_log_user_info` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for pre_contract
-- ----------------------------
DROP TABLE IF EXISTS `pre_contract`;
CREATE TABLE `pre_contract` (
  `pre_contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL COMMENT '日程Id',
  `user_id` varchar(50) NOT NULL COMMENT '预约人',
  PRIMARY KEY (`pre_contract_id`),
  KEY `fk_pre_contract_schedule` (`schedule_id`),
  CONSTRAINT `fk_pre_contract_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约人表';

-- ----------------------------
-- Records of pre_contract
-- ----------------------------

-- ----------------------------
-- Table structure for read_common_message
-- ----------------------------
DROP TABLE IF EXISTS `read_common_message`;
CREATE TABLE `read_common_message` (
  `read_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL COMMENT '消息Id',
  `user_id` varchar(50) NOT NULL COMMENT '消息读取者',
  PRIMARY KEY (`read_id`),
  KEY `fk_read_common_message_user_info` (`user_id`),
  CONSTRAINT `fk_read_common_message_user_info` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户已读消息表';

-- ----------------------------
-- Records of read_common_message
-- ----------------------------

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(100) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色基本信息';

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '系统管理员', '拥有本系统最高管理权限');
INSERT INTO `role_info` VALUES ('2', '普通用户', '一般用户');
INSERT INTO `role_info` VALUES ('3', '未审批用户', '还没使用该系统的权限');
INSERT INTO `role_info` VALUES ('4', '公司老总', '拥有最高的检查权');
INSERT INTO `role_info` VALUES ('5', '部门经理', '管辖本部门相关工作');
INSERT INTO `role_info` VALUES ('6', '临时角色', '测试几个项目');

-- ----------------------------
-- Table structure for role_right
-- ----------------------------
DROP TABLE IF EXISTS `role_right`;
CREATE TABLE `role_right` (
  `role_right_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色权限id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `node_id` int(11) DEFAULT NULL COMMENT '菜单节点id',
  PRIMARY KEY (`role_right_id`),
  KEY `fk_role_right_role` (`role_id`),
  KEY `fk_role_right_fun` (`node_id`),
  CONSTRAINT `fk_role_right_fun` FOREIGN KEY (`node_id`) REFERENCES `sys_fun` (`node_id`),
  CONSTRAINT `fk_role_right_role` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存放所有角色权限表';

-- ----------------------------
-- Records of role_right
-- ----------------------------

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '日程标题',
  `address` varchar(100) NOT NULL COMMENT '会议地址',
  `meeting_id` int(11) NOT NULL COMMENT '会议类型',
  `begin_time` datetime NOT NULL COMMENT '日程开始时间',
  `end_time` datetime NOT NULL COMMENT '日程结束时间',
  `schedule_content` varchar(500) NOT NULL COMMENT '日程内容',
  `create_user` varchar(50) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `if_private` int(11) NOT NULL COMMENT '是否私有   0否  1：是',
  PRIMARY KEY (`schedule_id`),
  KEY `fk_schedule_meeting_info` (`meeting_id`),
  CONSTRAINT `fk_schedule_meeting_info` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_info` (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程';

-- ----------------------------
-- Records of schedule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_fun
-- ----------------------------
DROP TABLE IF EXISTS `sys_fun`;
CREATE TABLE `sys_fun` (
  `node_id` int(11) NOT NULL,
  `display_name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `node_url` varchar(200) DEFAULT NULL COMMENT '菜单链接地址',
  `display_order` int(11) NOT NULL COMMENT '菜单显示顺序',
  `parent_node_id` int(11) NOT NULL COMMENT '父节点id',
  `icon` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单功能基本信息表';

-- ----------------------------
-- Records of sys_fun
-- ----------------------------
INSERT INTO `sys_fun` VALUES ('101', '组织机构', null, '1', '0', 'icon-home');
INSERT INTO `sys_fun` VALUES ('102', '机构管理', '/user-info/demo', '1', '101', 'icon-bar-chart');
INSERT INTO `sys_fun` VALUES ('103', '部门管理', '/user-info/table', '2', '101', 'icon-bulb');
INSERT INTO `sys_fun` VALUES ('104', '权限管理', null, '2', '0', 'icon-graph');
INSERT INTO `sys_fun` VALUES ('105', '用户管理', null, '1', '104', 'icon-basket');
INSERT INTO `sys_fun` VALUES ('106', '角色管理', null, '2', '104', 'icon-tag');
INSERT INTO `sys_fun` VALUES ('107', '资源管理', null, '3', '104', 'icon-handbag');
INSERT INTO `sys_fun` VALUES ('108', '系统管理', null, '3', '0', 'icon-settings');
INSERT INTO `sys_fun` VALUES ('109', '操作日志', null, '1', '108', 'icon-briefcase');
INSERT INTO `sys_fun` VALUES ('110', '登录日志', null, '2', '108', 'icon-docs');
INSERT INTO `sys_fun` VALUES ('111', '考勤记录', null, '3', '108', 'icon-check');
INSERT INTO `sys_fun` VALUES ('112', '时间管理', null, '4', '108', 'icon-envelope');
INSERT INTO `sys_fun` VALUES ('114', '个人中心', null, '4', '0', 'icon-user-following');
INSERT INTO `sys_fun` VALUES ('115', '预约', null, '1', '114', 'icon-calendar');
INSERT INTO `sys_fun` VALUES ('116', '消息', null, '2', '114', 'icon-clock');
INSERT INTO `sys_fun` VALUES ('117', '签到', null, '3', '114', 'icon-speech');
INSERT INTO `sys_fun` VALUES ('118', '便签', '/user-info/demo', '4', '114', 'icon-bell');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `password` varchar(400) NOT NULL COMMENT '密码',
  `email` varchar(50) NOT NULL,
  `depart_id` int(11) NOT NULL DEFAULT '2' COMMENT '所在部门',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `role_id` int(11) NOT NULL DEFAULT '2' COMMENT '用户角色',
  `user_state` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `if_delete_user` int(11) NOT NULL DEFAULT '1' COMMENT '1:未删除 0:已删除',
  `user_pricter` varchar(100) DEFAULT NULL COMMENT '用户图像',
  `acti_code` varchar(200) DEFAULT NULL COMMENT '激活码',
  `acti_code_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_info_role` (`role_id`),
  KEY `fk_user_info_user_state` (`user_state`),
  CONSTRAINT `fk_user_info_role` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`),
  CONSTRAINT `fk_user_info_user_state` FOREIGN KEY (`user_state`) REFERENCES `user_state` (`user_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('a', '系统管理员', '1', '', '2', '2', '1', '1', '1', 'images/Users/admin.jpg', null, null);
INSERT INTO `user_info` VALUES ('jiyaoqin', '姬耀钦', 'jiyaoqin', '', '5', '1', '2', '1', '1', '', null, null);
INSERT INTO `user_info` VALUES ('libeibei', '李贝贝', 'libeibei', '', '1', '2', '2', '1', '1', 'images/Users/libeibei.jpg', null, null);
INSERT INTO `user_info` VALUES ('liuguangping', '刘广平', 'liuguangping', '', '3', '1', '2', '1', '1', '', null, null);
INSERT INTO `user_info` VALUES ('qijingxue', '齐静雪', 'qijingxue', '', '1', '2', '2', '1', '1', 'images/Users/qijingxue.jpg', null, null);
INSERT INTO `user_info` VALUES ('test', 'test', '11', '', '2', '1', '2', '1', '1', null, null, null);
INSERT INTO `user_info` VALUES ('wangchao', '王超', '王超', '', '4', '1', '2', '1', '1', 'images/Users/wangchao.jpg', null, null);
INSERT INTO `user_info` VALUES ('wuliping', '武力平', 'wuliping', '', '2', '1', '2', '1', '1', '', null, null);
INSERT INTO `user_info` VALUES ('yangjiali', '杨嘉丽', 'yangjiali', '', '1', '2', '2', '1', '1', '', null, null);
INSERT INTO `user_info` VALUES ('yuanbin', '袁斌', 'yuanbin', '', '5', '1', '2', '1', '1', '', null, null);
INSERT INTO `user_info` VALUES ('yuyidi', '余乙迪', '$shiro1$SHA-512$1$$vUWXg6szWq+BxlEQV7yCShPHTnQ0c3bh0p3wVz5EVd0vS3t140AWzKw10/xcs7HH8b9tjVHMYFzfSUs5UlXDbQ==', '243549367@qq.com', '2', null, '2', '2', '1', null, '$shiro1$SHA-512$1$$cAfVQXUmIqP5VBjheRWZ/Tm+uQ9wfsFhkpbMxncmoT38UyKwxr7zpKPUAMwEPqKhOZ0J/SvzGdbeNfUvx8MTWA==', '$shiro1$SHA-512$1$$07MUyY2egz5URZ0FoVf4iwn1mb1vGOOIIPRrvl4fwIoG0+l4XAQlBuYO7oF3tu8QCFlyra+CtpGwCLTnkIfwtg==');

-- ----------------------------
-- Table structure for user_state
-- ----------------------------
DROP TABLE IF EXISTS `user_state`;
CREATE TABLE `user_state` (
  `user_state_id` int(11) NOT NULL COMMENT '1:正常状态 2:被屏蔽',
  `user_state_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户是否被屏蔽的状态表';

-- ----------------------------
-- Records of user_state
-- ----------------------------
INSERT INTO `user_state` VALUES ('1', '被屏蔽');
INSERT INTO `user_state` VALUES ('2', '正常状态');

-- ----------------------------
-- Table structure for user_verify
-- ----------------------------
DROP TABLE IF EXISTS `user_verify`;
CREATE TABLE `user_verify` (
  `user_id` varchar(20) NOT NULL,
  `acti_code` varchar(200) NOT NULL,
  `acti_name_code` varchar(200) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_verify_user_info` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户注册验证信息';

-- ----------------------------
-- Records of user_verify
-- ----------------------------

-- ----------------------------
-- Table structure for work_time
-- ----------------------------
DROP TABLE IF EXISTS `work_time`;
CREATE TABLE `work_time` (
  `work_time_id` int(11) NOT NULL AUTO_INCREMENT,
  `on_duty_time` varchar(20) NOT NULL COMMENT '上班时间',
  `off_duty_time` varchar(20) NOT NULL COMMENT '下班时间',
  PRIMARY KEY (`work_time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上下班时间表';

-- ----------------------------
-- Records of work_time
-- ----------------------------

-- ----------------------------
-- Procedure structure for loginLogCursor
-- ----------------------------
DROP PROCEDURE IF EXISTS `loginLogCursor`;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `loginLogCursor`(IN start_ datetime,IN end_ datetime)
BEGIN
	-- 读取登陆信息表并存放到游标中
	DECLARE	no_more_record int default 0;
	DECLARE	loginID int;
	DECLARE userID VARCHAR(20);
  DECLARE loginDesc VARCHAR(20);
	DECLARE loginTime datetime;
	DECLARE	sql_ text;
	DECLARE cur_login CURSOR for SELECT login_id,user_id,login_desc,login_time,login_id,login_id from login_log where login_time BETWEEN start_ and end_;
	DECLARE CONTINUE HANDLER FOR NOT FOUND  SET  no_more_record = 1; 
	OPEN cur_login;	
		REPEAT				
			FETCH cur_login INTO loginID,userID,loginDesc,loginTime,loginID,loginID;
			IF no_more_record = 0 THEN
					IF sql_ IS NULL THEN
						set sql_ = CONCAT('insert into log values',CONCAT("('",CONCAT(loginID,"','",loginDesc,"','",loginTime),"')"));
					ELSE
						set sql_ = CONCAT(sql_,CONCAT(",('",CONCAT(loginID,"','",loginDesc,"','",loginTime),"')"));
					END IF;
			END IF;	
		UNTIL no_more_record = 1 
		END REPEAT;	
	CLOSE cur_login;
	set @sql_ = sql_;
	PREPARE sqls from @sql_;
	EXECUTE sqls;
	DEALLOCATE PREPARE sqls;
END
;;
DELIMITER ;
