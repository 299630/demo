/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-28 16:57:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '1');
INSERT INTO `authority` VALUES ('1', '2');
INSERT INTO `authority` VALUES ('1', '3');
INSERT INTO `authority` VALUES ('1', '4');
INSERT INTO `authority` VALUES ('1', '5');
INSERT INTO `authority` VALUES ('1', '6');
INSERT INTO `authority` VALUES ('1', '7');
INSERT INTO `authority` VALUES ('1', '8');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menu_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '#' COMMENT '菜单路径',
  `parent_id` int(11) NOT NULL COMMENT '父菜单id',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0按钮1菜单',
  `permission` varchar(100) NOT NULL DEFAULT '' COMMENT '权限标识',
  `menu_icon` varchar(100) DEFAULT '#' COMMENT '图标',
  `menu_sort` int(4) NOT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '系统管理', '/', '0', '1', 'system:all:view', 'fa fa-sitemap', '1');
INSERT INTO `menu` VALUES ('2', '系统监控', '/', '0', '1', 'monitor:all:view', 'fa fa-video-camera', '2');
INSERT INTO `menu` VALUES ('3', '用户管理', '/system/user', '1', '1', 'system:user:view', 'fa fa-user', '1');
INSERT INTO `menu` VALUES ('4', '角色管理', '/system/role', '1', '1', 'system:role:view', 'fa fa-users', '2');
INSERT INTO `menu` VALUES ('5', '菜单管理', '/system/menu', '1', '1', 'system:menu:view', 'fa fa-list', '3');
INSERT INTO `menu` VALUES ('7', '数据监控', '/druid', '2', '1', 'monitor:druid:view', 'fa fa-database', '1');
INSERT INTO `menu` VALUES ('8', '服务监控', '/monitor/server', '2', '1', 'monitor:server:view', 'fa fa-server', '2');
INSERT INTO `menu` VALUES ('9', '添加', '/system/user/insert', '3', '0', 'system:user:insert', 'fa fa-plus', '1');
INSERT INTO `menu` VALUES ('10', '修改', '/system/user/update', '3', '0', 'system:user:update', 'fa fa-pencil-square-o', '2');
INSERT INTO `menu` VALUES ('11', '重置密码', '/system/user/updPass', '3', '0', 'system:user:updPass', 'fa fa-refresh', '3');
INSERT INTO `menu` VALUES ('12', '删除', '/system/user/delete', '3', '0', 'system:user:delete', 'fa fa-close', '4');
INSERT INTO `menu` VALUES ('13', '添加', '/system/role/insert', '4', '0', 'system:role:insert', 'fa fa-plus', '1');
INSERT INTO `menu` VALUES ('14', '修改', '/system/role/update', '4', '0', 'system:role:update', 'fa fa-pencil-square-o', '2');
INSERT INTO `menu` VALUES ('15', '分配权限', '/system/role/permission', '4', '0', 'system:role:permission', '#', '3');
INSERT INTO `menu` VALUES ('16', '添加', '/system/menu/insert', '5', '0', 'system:menu:insert', '#', '1');
INSERT INTO `menu` VALUES ('17', '修改', '/system/menu/update', '5', '0', 'system:menu:update', '#', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '1');
INSERT INTO `role` VALUES ('2', '普通用户', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户姓名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '帐号状态（1正常 0停用）',
  `login_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '登录账号',
  `img` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `theme` varchar(255) DEFAULT 'default' COMMENT '主题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '管理员', '21232f297a57a5a743894a0e4a801fc3', '1', '1', 'admin', '777d215a4b744116b920bea6fc8c3bb6.jpg', 'default');
