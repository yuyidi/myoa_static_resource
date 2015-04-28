/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50542
Source Host           : 127.0.0.1:3306
Source Database       : myoa

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2015-04-28 18:58:29
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆日志表';

-- ----------------------------
-- Records of login_log
-- ----------------------------

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
  `metting_name` varchar(50) NOT NULL COMMENT '会议类型名称',
  PRIMARY KEY (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议类型表';

-- ----------------------------
-- Records of meeting_info
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单功能基本信息表';

-- ----------------------------
-- Records of sys_fun
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `depart_id` int(11) NOT NULL DEFAULT '2' COMMENT '所在部门',
  `gender` int(11) NOT NULL COMMENT '性别',
  `role_id` int(11) NOT NULL DEFAULT '2' COMMENT '用户角色',
  `user_state` int(11) NOT NULL DEFAULT '2' COMMENT '用户状态',
  `if_delete_user` int(11) NOT NULL DEFAULT '1' COMMENT '1:未删除 0:已删除',
  `user_pricter` varchar(100) DEFAULT NULL COMMENT '用户图像',
  PRIMARY KEY (`user_id`),
  KEY `fk_user_info_role` (`role_id`),
  KEY `fk_user_info_user_state` (`user_state`),
  CONSTRAINT `fk_user_info_role` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`),
  CONSTRAINT `fk_user_info_user_state` FOREIGN KEY (`user_state`) REFERENCES `user_state` (`user_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('a', '系统管理员', '1', '2', '2', '1', '2', '1', 'images/Users/admin.jpg');
INSERT INTO `user_info` VALUES ('jiyaoqin', '姬耀钦', 'jiyaoqin', '5', '1', '2', '2', '1', '');
INSERT INTO `user_info` VALUES ('libeibei', '李贝贝', 'libeibei', '1', '2', '2', '2', '1', 'images/Users/libeibei.jpg');
INSERT INTO `user_info` VALUES ('liuguangping', '刘广平', 'liuguangping', '3', '1', '2', '2', '1', '');
INSERT INTO `user_info` VALUES ('qijingxue', '齐静雪', 'qijingxue', '1', '2', '2', '2', '1', 'images/Users/qijingxue.jpg');
INSERT INTO `user_info` VALUES ('wangchao', '王超', '王超', '4', '1', '2', '2', '1', 'images/Users/wangchao.jpg');
INSERT INTO `user_info` VALUES ('wuliping', '武力平', 'wuliping', '2', '1', '2', '2', '1', '');
INSERT INTO `user_info` VALUES ('yangjiali', '杨嘉丽', 'yangjiali', '1', '2', '2', '2', '1', '');
INSERT INTO `user_info` VALUES ('yuanbin', '袁斌', 'yuanbin', '5', '1', '2', '2', '1', '');
INSERT INTO `user_info` VALUES ('yyd', '余乙迪', '$shiro1$SHA-512$1$$dagBUaVRWcLxFhLFXFOnXbavaXhMGNJHfyJBkZD/x1rYANeuZ789UUxeo0A6c4pjOqijrykZ6NZ4A1m8+RKghw==', '2', '1', '2', '2', '1', null);

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
