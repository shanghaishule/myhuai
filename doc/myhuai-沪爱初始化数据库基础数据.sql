/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : myhuai

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2014-11-02 21:19:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_access`;
CREATE TABLE `tp_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`,`node_id`),
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_access
-- ----------------------------
INSERT INTO `tp_access` VALUES ('5', '95', '84', '2', null);
INSERT INTO `tp_access` VALUES ('5', '94', '84', '2', null);
INSERT INTO `tp_access` VALUES ('5', '93', '84', '2', null);
INSERT INTO `tp_access` VALUES ('5', '92', '84', '2', null);
INSERT INTO `tp_access` VALUES ('5', '90', '84', '2', null);
INSERT INTO `tp_access` VALUES ('5', '89', '84', '2', null);
INSERT INTO `tp_access` VALUES ('5', '88', '84', '2', null);
INSERT INTO `tp_access` VALUES ('5', '86', '84', '2', null);
INSERT INTO `tp_access` VALUES ('5', '87', '84', '2', null);
INSERT INTO `tp_access` VALUES ('5', '84', '1', '0', null);
INSERT INTO `tp_access` VALUES ('5', '47', '46', '3', null);
INSERT INTO `tp_access` VALUES ('5', '46', '45', '2', null);
INSERT INTO `tp_access` VALUES ('5', '45', '1', '0', null);
INSERT INTO `tp_access` VALUES ('5', '81', '80', '2', null);
INSERT INTO `tp_access` VALUES ('5', '80', '1', '1', null);
INSERT INTO `tp_access` VALUES ('5', '56', '50', '3', null);
INSERT INTO `tp_access` VALUES ('5', '55', '50', '3', null);
INSERT INTO `tp_access` VALUES ('5', '54', '50', '3', null);
INSERT INTO `tp_access` VALUES ('5', '53', '50', '3', null);
INSERT INTO `tp_access` VALUES ('5', '52', '50', '3', null);
INSERT INTO `tp_access` VALUES ('5', '51', '50', '3', null);
INSERT INTO `tp_access` VALUES ('5', '50', '3', '2', null);
INSERT INTO `tp_access` VALUES ('5', '49', '48', '3', null);
INSERT INTO `tp_access` VALUES ('5', '48', '3', '2', null);
INSERT INTO `tp_access` VALUES ('5', '31', '25', '3', null);
INSERT INTO `tp_access` VALUES ('5', '30', '25', '3', null);
INSERT INTO `tp_access` VALUES ('5', '29', '25', '3', null);
INSERT INTO `tp_access` VALUES ('5', '28', '25', '3', null);
INSERT INTO `tp_access` VALUES ('5', '27', '25', '3', null);
INSERT INTO `tp_access` VALUES ('5', '26', '25', '3', null);
INSERT INTO `tp_access` VALUES ('5', '25', '3', '2', null);
INSERT INTO `tp_access` VALUES ('5', '24', '18', '3', null);
INSERT INTO `tp_access` VALUES ('5', '23', '18', '3', null);
INSERT INTO `tp_access` VALUES ('5', '22', '18', '3', null);
INSERT INTO `tp_access` VALUES ('5', '21', '18', '3', null);
INSERT INTO `tp_access` VALUES ('5', '20', '18', '3', null);
INSERT INTO `tp_access` VALUES ('5', '19', '18', '3', null);
INSERT INTO `tp_access` VALUES ('5', '18', '3', '2', null);
INSERT INTO `tp_access` VALUES ('5', '3', '1', '0', null);
INSERT INTO `tp_access` VALUES ('5', '17', '11', '3', null);
INSERT INTO `tp_access` VALUES ('5', '16', '11', '3', null);
INSERT INTO `tp_access` VALUES ('5', '15', '11', '3', null);
INSERT INTO `tp_access` VALUES ('5', '14', '11', '3', null);
INSERT INTO `tp_access` VALUES ('5', '13', '11', '3', null);
INSERT INTO `tp_access` VALUES ('5', '12', '11', '3', null);
INSERT INTO `tp_access` VALUES ('5', '11', '2', '2', null);
INSERT INTO `tp_access` VALUES ('5', '83', '6', '3', null);
INSERT INTO `tp_access` VALUES ('5', '32', '6', '3', null);
INSERT INTO `tp_access` VALUES ('5', '10', '6', '3', null);
INSERT INTO `tp_access` VALUES ('5', '9', '6', '3', null);
INSERT INTO `tp_access` VALUES ('5', '8', '6', '3', null);
INSERT INTO `tp_access` VALUES ('5', '7', '6', '3', null);
INSERT INTO `tp_access` VALUES ('5', '6', '2', '2', null);
INSERT INTO `tp_access` VALUES ('5', '2', '1', '0', null);
INSERT INTO `tp_access` VALUES ('5', '1', '0', '1', null);

-- ----------------------------
-- Table structure for tp_admin
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role_id` smallint(5) NOT NULL,
  `last_ip` varchar(15) NOT NULL,
  `last_time` int(10) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_admin
-- ----------------------------
INSERT INTO `tp_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', '58.246.228.194', '1400071603', '123456@qq.com', '1');

-- ----------------------------
-- Table structure for tp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role`;
CREATE TABLE `tp_admin_role` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `ordid` tinyint(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_admin_role
-- ----------------------------
INSERT INTO `tp_admin_role` VALUES ('1', '超级管理员', '超级管理员', '0', '1');

-- ----------------------------
-- Table structure for tp_menu
-- ----------------------------
DROP TABLE IF EXISTS `tp_menu`;
CREATE TABLE `tp_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  `action_name` varchar(20) NOT NULL,
  `data` varchar(120) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `often` tinyint(1) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_menu
-- ----------------------------
INSERT INTO `tp_menu` VALUES ('1', '全局', '0', 'setting', 'index', '', '', '-1', '7', '0');
INSERT INTO `tp_menu` VALUES ('2', '核心设置', '1', 'setting', 'index', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('3', '全局参数', '148', 'setting', 'index', '&type=site', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('4', '邮件设置', '148', 'setting', 'index', '&type=mail', '', '-1', '5', '1');
INSERT INTO `tp_menu` VALUES ('172', '专辑管理', '285', 'album', 'index', '', '', '-1', '4', '1');
INSERT INTO `tp_menu` VALUES ('6', '菜单管理', '2', 'menu', 'index', '', '', '-1', '7', '1');
INSERT INTO `tp_menu` VALUES ('7', '新增', '6', 'menu', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('8', '编辑', '6', 'menu', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('9', '删除', '6', 'menu', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('10', '运营', '0', 'operate', 'index', '', '', '-1', '4', '0');
INSERT INTO `tp_menu` VALUES ('11', '广告管理', '10', 'advert', 'index', '', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('12', '广告管理', '11', 'ad', 'index', '', '', '2', '0', '1');
INSERT INTO `tp_menu` VALUES ('13', '广告位管理', '11', 'adboard', 'index', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('14', '友情链接', '10', 'flink', 'index', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('15', '友情链接', '14', 'flink', 'index', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('16', '链接分类', '14', 'flink_cate', 'index', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('17', '新增', '15', 'flink', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('18', '编辑', '15', 'flink', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('19', '删除', '15', 'flink', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('20', '新增', '16', 'flink_cate', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('21', '编辑', '16', 'flink_cate', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('22', '删除', '16', 'flink_cate', 'del', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('23', '新增', '12', 'ad', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('24', '编辑', '12', 'ad', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('25', '删除', '12', 'ad', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('26', '新增', '13', 'adboard', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('27', '编辑', '13', 'adboard', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('28', '删除', '13', 'adboard', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('29', '数据', '0', 'data', 'index', '', '', '-1', '5', '0');
INSERT INTO `tp_menu` VALUES ('258', '商品分类', '256', 'score_item_cate', 'index', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('31', '数据库管理', '29', 'backup', 'index', '', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('32', '数据备份', '31', 'backup', 'index', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('33', '数据恢复', '31', 'backup', 'restore', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('34', '缓存管理', '254', 'cache', 'index', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('195', '登陆接口', '245', 'oauth', 'index', '', '', '-1', '2', '0');
INSERT INTO `tp_menu` VALUES ('36', '黑名单管理', '117', 'ipban', 'index', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('37', '新增', '36', 'ipban', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('38', '编辑', '36', 'ipban', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('50', '商品', '0', 'content', 'index', '', '', '-1', '1', '0');
INSERT INTO `tp_menu` VALUES ('51', '商品管理', '50', 'article', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('52', '商品管理', '51', 'item', 'index', '', '', '0', '1', '1');
INSERT INTO `tp_menu` VALUES ('54', '编辑', '52', 'article', 'edit', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('190', '删除', '52', 'item', 'delete', '', '', '-1', '4', '0');
INSERT INTO `tp_menu` VALUES ('56', '商品分类', '51', 'item_cate', 'index', '', '', '0', '6', '1');
INSERT INTO `tp_menu` VALUES ('57', '新增', '56', 'article_cate', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('58', '编辑', '56', 'article_cate', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('59', '删除', '56', 'article_cate', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('60', '管理员管理', '1', 'admin', 'index', '', '', '-1', '4', '1');
INSERT INTO `tp_menu` VALUES ('61', '管理员管理', '60', 'admin', 'index', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('62', '新增', '61', 'admin', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('63', '编辑', '61', 'admin', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('64', '删除', '61', 'admin', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('65', '角色管理', '60', 'admin_role', 'index', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('66', '新增', '65', 'admin_role', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('192', '淘宝采集', '164', 'collect_alimama', 'index', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('70', '用户', '0', 'user', 'index', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('119', '新增', '149', 'user', 'add', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('118', '编辑', '149', 'user', 'edit', '', '', '-1', '4', '0');
INSERT INTO `tp_menu` VALUES ('117', '会员管理', '70', 'user', 'index', '', '', '4', '0', '1');
INSERT INTO `tp_menu` VALUES ('156', '文章分类', '154', 'article_cate', 'index', '', '', '-1', '3', '1');
INSERT INTO `tp_menu` VALUES ('151', '导航设置', '216', 'nav', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('149', '会员管理', '117', 'user', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('150', '删除', '149', 'user', 'delete', '', '', '-1', '5', '0');
INSERT INTO `tp_menu` VALUES ('152', '主导航', '151', 'nav', 'index', '&type=main', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('153', '底部导航', '151', 'nav', 'index', '&type=bottom', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('154', '文章管理', '10', 'article', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('155', '文章管理', '154', 'article', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('148', '站点设置', '2', 'setting', 'index', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('157', '添加文章', '155', 'article', 'add', '', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('158', '编辑', '155', 'article', 'edit', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('159', '删除', '155', 'article', 'delete', '', '', '-1', '4', '0');
INSERT INTO `tp_menu` VALUES ('160', '新增', '156', 'article_cate', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('161', '编辑', '156', 'article_cate', '编辑', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('162', '删除', '156', 'article_cate', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('164', '商品采集', '50', 'item_collect', 'index', '', '', '-1', '2', '0');
INSERT INTO `tp_menu` VALUES ('173', '专辑管理', '172', 'album', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('174', '专辑分类', '172', 'album_cate', 'index', '', '', '-1', '3', '1');
INSERT INTO `tp_menu` VALUES ('175', '新增', '174', 'album_cate', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('176', '编辑', '174', 'album_cate', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('177', '删除', '174', 'album_cate', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('178', '敏感词管理', '254', 'badword', 'index', '', '', '-1', '4', '1');
INSERT INTO `tp_menu` VALUES ('179', '新增', '178', 'badword', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('180', '编辑', '178', 'badword', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('181', '删除', '36', 'ipban', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('182', '删除', '178', 'badword', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('255', '采集马甲', '117', 'auto_user', 'index', '', '', '-1', '2', '0');
INSERT INTO `tp_menu` VALUES ('184', '标签管理', '254', 'tag', 'index', '', '', '-1', '3', '1');
INSERT INTO `tp_menu` VALUES ('185', '商品接口', '245', 'item_site', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('186', '商品评论', '51', 'item_comment', 'index', '', '', '-1', '7', '0');
INSERT INTO `tp_menu` VALUES ('187', '删除', '186', 'item_comment', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('265', '删除', '257', 'score_item', 'edit', '', '', '-1', '4', '0');
INSERT INTO `tp_menu` VALUES ('250', '一键删除', '51', 'item', 'delete_search', '', '', '-1', '5', '1');
INSERT INTO `tp_menu` VALUES ('198', '新增', '196', 'message', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('199', '商品来源', '51', 'item_orig', 'index', '', '', '-1', '6', '0');
INSERT INTO `tp_menu` VALUES ('200', '新增', '199', 'item_orig', 'add', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('201', '编辑', '199', 'item_orig', 'edit', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('202', '删除', '199', 'item_orig', 'delete', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('203', '商品审核', '51', 'item', 'check', '', '', '-1', '5', '0');
INSERT INTO `tp_menu` VALUES ('249', '添加商品', '51', 'item', 'add', '', '', '0', '3', '1');
INSERT INTO `tp_menu` VALUES ('259', '新增', '258', 'score_item_cate', 'add', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('268', '批量添加', '164', 'collect_batch', 'index', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('269', '积分设置', '2', 'score', 'setting', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('210', '专辑审核', '172', 'album', 'check', '', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('257', '积分商品', '256', 'score_item', 'index', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('212', '日志管理', '29', 'log', 'index', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('213', '管理员日志', '212', 'log', 'index', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('214', '用户日志', '212', 'log', 'user', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('215', '积分日志', '212', 'log', 'score', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('216', '界面设置', '1', 'setting', 'index', '&type=show', '', '-1', '2', '0');
INSERT INTO `tp_menu` VALUES ('256', '积分商城', '70', 'score_item', 'index', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('254', '系统数据', '29', 'tag', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('264', '编辑', '257', 'score_item', 'edit', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('263', '添加商品', '257', 'score_item', 'add', '', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('262', '积分订单', '256', 'score_order', 'index', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('261', '删除', '258', 'score_item_cate', 'delete', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('260', '编辑', '258', 'score_item_cate', 'edit', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('232', '站内信管理', '70', 'message', 'index', '', '', '-1', '0', '0');
INSERT INTO `tp_menu` VALUES ('233', '系统通知', '232', 'message', 'index', '&type=1', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('234', '用户私信', '232', 'message', 'index', '&type=2', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('235', '通知模版', '2', 'message_tpl', 'index', '&type=msg', '', '-1', '4', '0');
INSERT INTO `tp_menu` VALUES ('236', '添加模版', '235', 'message_tpl', 'add', '', '', '-1', '7', '1');
INSERT INTO `tp_menu` VALUES ('237', '编辑', '235', 'message_tpl', 'edit', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('238', '删除', '235', 'message_tpl', 'delete', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('240', '单页管理', '154', 'article', 'page', '', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('242', '积分记录', '269', 'score', 'logs', '', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('244', '应用', '0', 'plugin', 'index', '', '', '-1', '6', '0');
INSERT INTO `tp_menu` VALUES ('245', '系统接口', '244', 'apis', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('246', '应用管理', '244', 'plugin', 'index', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('247', '应用中心', '246', 'plugin', 'index', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('248', '已安装应用', '246', 'plugin', 'list', '', '', '-1', '0', '1');
INSERT INTO `tp_menu` VALUES ('252', '用户整合', '245', 'integrate', 'index', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('253', '图片模式', '52', 'item', 'index', '&sm=image', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('267', '批量注册', '149', 'user', 'add_users', '', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('270', '邮件模板', '235', 'message_tpl', 'index', '&type=mail', '', '-1', '6', '1');
INSERT INTO `tp_menu` VALUES ('271', '短消息模板', '235', 'message_tpl', 'index', '&type=msg', '', '-1', '5', '1');
INSERT INTO `tp_menu` VALUES ('272', '附件设置', '148', 'setting', 'index', '&type=attachment', '', '-1', '4', '1');
INSERT INTO `tp_menu` VALUES ('273', '显示设置', '216', 'setting', 'index', '&type=style', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('274', '模板管理', '216', 'template', 'index', '', '', '-1', '3', '0');
INSERT INTO `tp_menu` VALUES ('275', '站点设置', '148', 'setting', 'index', '', '', '99', '1', '1');
INSERT INTO `tp_menu` VALUES ('276', '积分设置', '269', 'score', 'setting', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('277', '商品管理', '52', 'item', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('278', '文章管理', '155', 'article', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('279', '会员管理', '149', 'user', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('280', '积分商品', '257', 'score_item', 'index', '', '', '-1', '1', '1');
INSERT INTO `tp_menu` VALUES ('281', '淘宝评论', '164', 'cmt_taobao', 'index', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('282', 'SEO设置', '2', 'seo', 'url', '', '', '-1', '5', '0');
INSERT INTO `tp_menu` VALUES ('283', 'UR静态化', '282', 'seo', 'url', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('284', '页面SEO', '282', 'seo', 'page', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('285', '专辑', '0', 'album', 'index', '', '', '-1', '2', '0');
INSERT INTO `tp_menu` VALUES ('286', '注册登陆', '2', 'setting', 'user', '', '', '-1', '2', '1');
INSERT INTO `tp_menu` VALUES ('293', '编辑', '291', 'brandlist', ' edit', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('292', '新增', '291', 'brandlist', 'add', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('291', '品牌管理', '51', 'brandlist', 'index', '', '', '0', '1', '1');
INSERT INTO `tp_menu` VALUES ('294', '删除', '291', 'brandlist', 'delete', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('295', '交易管理', '50', 'item_order', 'index', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('296', '订单管理', '295', 'item_order', 'index', '', '', '1', '255', '1');
INSERT INTO `tp_menu` VALUES ('297', '快递方式管理', '295', 'delivery', 'index', '', '', '1', '255', '1');
INSERT INTO `tp_menu` VALUES ('298', '发货地址管理', '295', 'address', 'index', '', '', '1', '255', '1');
INSERT INTO `tp_menu` VALUES ('299', '回复设置', '0', 'keyword', 'index', '', '', '-1', '2', '0');
INSERT INTO `tp_menu` VALUES ('300', '回复设置', '299', 'keyword', 'index', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('301', '关键词自动回复', '300', 'keyword', 'addkeyword', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('302', '消息自动回复', '300', 'keyword', 'addmess', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('303', '关注自动回复', '300', 'keyword', 'addfollow', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('304', '收款方式设置', '295', 'alipay', 'index', '', '', '99', '255', '1');
INSERT INTO `tp_menu` VALUES ('305', '自定义菜单', '300', 'custom_menu', 'index', '', '', '-1', '255', '1');
INSERT INTO `tp_menu` VALUES ('306', '添加', '305', 'custom_menu', 'add', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('307', '编辑', '305', 'custom_menu', 'edit', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('308', '删除', '305', 'custom_menu', 'delete', '', '', '-1', '255', '0');
INSERT INTO `tp_menu` VALUES ('310', '结账方式管理', '0', 'account', 'setting', '', '', '3', '255', '1');
INSERT INTO `tp_menu` VALUES ('311', '账单管理', '0', 'account', 'index', '', '', '3', '255', '1');

-- ----------------------------
-- Table structure for tp_node
-- ----------------------------
DROP TABLE IF EXISTS `tp_node`;
CREATE TABLE `tp_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '节点名称',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1：是 2：否',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '节点等级',
  `data` varchar(255) DEFAULT NULL COMMENT '附加参数',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序权重',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '菜单显示类型 0:不显示 1:导航菜单 2:左侧菜单',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_node
-- ----------------------------
INSERT INTO `tp_node` VALUES ('1', 'cms', '根节点', '1', '', '0', '1', null, '0', '0');
INSERT INTO `tp_node` VALUES ('2', 'Site', '站点管理', '1', '', '1', '0', null, '0', '1');
INSERT INTO `tp_node` VALUES ('3', 'User', '用户管理', '1', '', '1', '0', null, '0', '1');
INSERT INTO `tp_node` VALUES ('4', 'extent', '扩展管理', '1', '', '1', '0', null, '0', '0');
INSERT INTO `tp_node` VALUES ('5', 'article', '内容管理', '1', '', '1', '0', null, '0', '1');
INSERT INTO `tp_node` VALUES ('6', 'Site', '站点设置', '1', '', '2', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('7', 'index', '基本信息设置', '1', '', '6', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('11', 'Node', '节点管理', '1', null, '2', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('12', 'add', '添加节点', '1', '', '11', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('13', 'index', '节点列表', '1', '', '11', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('14', 'insert', '写入', '1', '0', '11', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('15', 'edit', '编辑节点', '1', '0', '11', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('16', 'update', '更新节点', '1', '0', '11', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('17', 'del', '删除节点', '1', '0', '11', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('18', 'User', '用户中心', '1', '0', '3', '2', null, '0', '0');
INSERT INTO `tp_node` VALUES ('19', 'add', '添加用户', '1', '0', '18', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('20', 'index', '用户列表', '1', '0', '18', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('21', 'edit', '编辑用户', '1', '0', '18', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('22', 'insert', '写入数据库', '1', '0', '18', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('23', 'update', '更新用户', '1', '0', '18', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('24', 'del', '删除用户', '1', '0', '18', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('25', 'Group', '管理组', '1', '0', '3', '2', null, '0', '0');
INSERT INTO `tp_node` VALUES ('26', 'add', '创建用户组', '1', '0', '25', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('27', 'index', '用户组列表', '1', '0', '25', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('28', 'edit', '编辑用户组', '1', '0', '25', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('29', 'del', '删除用户组', '1', '0', '25', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('30', 'insert', '写入数据库', '1', '0', '25', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('31', 'update', '更新用户组', '1', '0', '25', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('36', 'menu', '左侧栏', '1', '0', '35', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('35', 'System', '首页', '1', '0', '1', '0', null, '0', '0');
INSERT INTO `tp_node` VALUES ('37', 'main', '右侧栏目', '1', '0', '35', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('38', 'Article', '微信图文', '1', '0', '5', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('39', 'index', '图文列表', '1', '0', '38', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('40', 'add', '图文添加', '1', '0', '38', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('41', 'edit', '微信图文编辑', '1', '0', '38', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('42', 'del', '微信图文删除', '1', '0', '38', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('80', 'token', '公众号管理', '1', '0', '1', '1', null, '0', '1');
INSERT INTO `tp_node` VALUES ('45', 'Function', '功能模块', '1', '0', '1', '0', null, '0', '1');
INSERT INTO `tp_node` VALUES ('46', 'Function', '功能模块', '1', '0', '45', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('47', 'add', '添加模块', '1', '0', '46', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('48', 'User_group', '会员组', '1', '0', '3', '2', null, '0', '0');
INSERT INTO `tp_node` VALUES ('49', 'add', '添加会员组', '1', '0', '48', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('50', 'Users', '前台用户', '1', '0', '3', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('51', 'index', '用户列表', '1', '0', '50', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('52', 'add', '添加用户', '1', '0', '50', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('53', 'edit', '编辑用户', '1', '0', '50', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('54', 'del', '删除用户', '1', '0', '50', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('55', 'insert', '写入数据库', '1', '0', '50', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('56', 'upsave', '更新用户', '1', '0', '50', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('57', 'Text', '微信文本', '1', '0', '5', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('58', 'index', '文本列表', '1', '0', '57', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('59', 'del', '删除', '1', '0', '57', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('60', 'Custom', '自定义页面', '1', '0', '5', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('61', 'index', '列表', '1', '0', '60', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('62', 'edit', '编辑', '1', '0', '60', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('63', 'del', '删除', '1', '0', '60', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('64', 'Records', '充值记录', '1', '0', '4', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('65', 'index', '充值列表', '1', '0', '64', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('66', 'Case', '用户案例', '1', '0', '4', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('67', 'index', '案例列表', '1', '0', '66', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('68', 'add', '添加案例', '1', '0', '66', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('69', 'edit', '编辑案例', '1', '0', '66', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('70', 'del', '删除案例', '1', '0', '66', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('71', 'insert', '写入数据库', '1', '0', '66', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('72', 'upsave', '更新数据库', '1', '0', '66', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('73', 'Links', '友情链接', '1', '0', '4', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('74', 'index', '友情链接', '1', '0', '73', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('75', 'add', '添加链接', '1', '0', '73', '3', null, '0', '2');
INSERT INTO `tp_node` VALUES ('76', 'edit', '编辑链接', '1', '0', '73', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('77', 'insert', '插入数据库', '1', '0', '73', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('78', 'upsave', '更新数据库', '1', '0', '73', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('79', 'del', '删除友情链接', '1', '0', '73', '3', null, '0', '0');
INSERT INTO `tp_node` VALUES ('81', 'Token', '公众号管理', '1', '0', '80', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('84', 'Tall', '商城管理', '1', '0', '1', '0', null, '0', '0');
INSERT INTO `tp_node` VALUES ('87', 'Brand', '品牌管理', '1', '品牌管理', '84', '2', null, '0', '0');
INSERT INTO `tp_node` VALUES ('86', 'Tall', '商品分类', '1', '0', '84', '2', null, '0', '0');
INSERT INTO `tp_node` VALUES ('88', 'Info_Notice', '信息发布管理', '1', '公告发布管理', '84', '2', null, '0', '2');
INSERT INTO `tp_node` VALUES ('89', 'AdNTAX', '广告及汇率设置', '1', '0', '84', '2', null, '0', '0');
INSERT INTO `tp_node` VALUES ('90', 'Statistics', '商家结算系统', '1', '0', '84', '2', null, '0', '0');
INSERT INTO `tp_node` VALUES ('92', 'Suggestion', '留言和建议', '1', '0', '84', '2', '', '0', '0');
INSERT INTO `tp_node` VALUES ('93', 'Application', '申请开店信息', '1', '0', '84', '2', null, '0', '0');
INSERT INTO `tp_node` VALUES ('94', 'Member', '会员管理', '1', '0', '84', '2', null, '0', '0');
INSERT INTO `tp_node` VALUES ('95', 'RealShop', '实体店认证', '1', '0', '84', '2', null, '0', '0');

-- ----------------------------
-- Table structure for tp_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_role`;
CREATE TABLE `tp_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '后台组名',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '是否激活 1：是 0：否',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序权重',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_role
-- ----------------------------
INSERT INTO `tp_role` VALUES ('5', '超级管理员', '0', '1', '0', '');

-- ----------------------------
-- Table structure for tp_setting
-- ----------------------------
DROP TABLE IF EXISTS `tp_setting`;
CREATE TABLE `tp_setting` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_setting
-- ----------------------------
INSERT INTO `tp_setting` VALUES ('site_name', '微商城', '');
INSERT INTO `tp_setting` VALUES ('site_title', '微商城', '');
INSERT INTO `tp_setting` VALUES ('site_keyword', '微商城', '');
INSERT INTO `tp_setting` VALUES ('site_description', '微商城', '');
INSERT INTO `tp_setting` VALUES ('site_status', '1', '');
INSERT INTO `tp_setting` VALUES ('closed_reason', '网站升级中。。', '');
INSERT INTO `tp_setting` VALUES ('site_icp', '', '');
INSERT INTO `tp_setting` VALUES ('statistics_code', '', '');
INSERT INTO `tp_setting` VALUES ('statics_url', '', '');
INSERT INTO `tp_setting` VALUES ('mail_server', '', '');
INSERT INTO `tp_setting` VALUES ('item_check', '0', '');
INSERT INTO `tp_setting` VALUES ('score_rule', 'a:16:{s:8:\"register\";s:2:\"20\";s:13:\"register_nums\";s:1:\"1\";s:5:\"login\";s:2:\"10\";s:10:\"login_nums\";s:1:\"5\";s:7:\"pubitem\";s:2:\"20\";s:12:\"pubitem_nums\";s:2:\"10\";s:8:\"likeitem\";s:1:\"1\";s:13:\"likeitem_nums\";s:2:\"20\";s:9:\"joinalbum\";s:1:\"2\";s:14:\"joinalbum_nums\";s:2:\"10\";s:6:\"fwitem\";s:1:\"2\";s:11:\"fwitem_nums\";s:2:\"10\";s:6:\"pubcmt\";s:1:\"1\";s:11:\"pubcmt_nums\";s:1:\"5\";s:7:\"delitem\";s:3:\"-20\";s:12:\"delitem_nums\";s:3:\"100\";}', '');
INSERT INTO `tp_setting` VALUES ('album_cover_items', '5', '专辑封面显示图片数量');
INSERT INTO `tp_setting` VALUES ('integrate_code', 'default', '');
INSERT INTO `tp_setting` VALUES ('integrate_config', '', '');
INSERT INTO `tp_setting` VALUES ('hot_tags', '家居,花园,美食,旅行,创意,建筑,户外,飘窗,卧室,城堡,DIY,萌宠,门厅,衣帽间,婚礼,书房,厨房,客厅,浴室,阳台,工作台,收纳,餐厅,阁楼,儿童房,小空间,性感', '');
INSERT INTO `tp_setting` VALUES ('wall_spage_max', '5', '');
INSERT INTO `tp_setting` VALUES ('wall_spage_size', '50', '');
INSERT INTO `tp_setting` VALUES ('book_page_max', '100', '');
INSERT INTO `tp_setting` VALUES ('default_keyword', '懒得逛了，我搜~', '');
INSERT INTO `tp_setting` VALUES ('album_default_title', '默认专辑', '');
INSERT INTO `tp_setting` VALUES ('avatar_size', '24,32,48,64,100,200', '');
INSERT INTO `tp_setting` VALUES ('attr_allow_exts', 'jpg,gif,png,jpeg,swf', '');
INSERT INTO `tp_setting` VALUES ('attr_allow_size', '2048', '');
INSERT INTO `tp_setting` VALUES ('itemcate_img', 'a:2:{s:5:\"width\";s:3:\"150\";s:6:\"height\";s:3:\"170\";}', '');
INSERT INTO `tp_setting` VALUES ('reg_protocol', '一、总则\r\n1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击\"立即注册\"按钮即表示用户与拼品网公司达成协议，完全接受本协议项下的全部条款。\r\n1．2　用户注册成功后，拼品网将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。\r\n1．3　用户可以使用拼品网各个频道单项服务，当用户使用拼品网各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及拼品网在该单项服务中发出的各类公告的同意。\r\n1．4　拼品网会员服务协议以及各个频道单项服务条款和公告可由拼品网公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。\r\n您在使用拼品网提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消拼品网提供的服务；您一旦使用拼品网产品，即视为您已了解并完全同意本服务协议各项内容，包括拼品网对服务协议随时所做的任何修改，并成为拼品网用户。\r\n二、注册信息和隐私保护\r\n2．1　 拼品网帐号（即拼品网用户ID）的所有权归拼品网，用户完成注册申请手续后，获得拼品网帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，拼品网概不负任何责任。\r\n2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知拼品网。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，拼品网不承担任何责任。\r\n2．3　拼品网不对外公开或向第三方提供单个用户的注册资料，除非：\r\n（1）事先获得用户的明确授权；\r\n（2）只有透露你的个人资料，才能提供你所要求的产品和服务；\r\n（3）根据有关的法律法规要求；\r\n（4）按照相关政府主管部门的要求；\r\n（5）为维护拼品网的合法权益。\r\n2．4　在你注册拼品网帐户，使用其他拼品网产品或服务，访问拼品网网页, 或参加促销和有奖游戏时，拼品网会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。\r\n三、使用规则\r\n3．1　用户在使用拼品网服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶\r\n（1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：\r\n1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的；\r\n（2）不得为任何非法目的而使用网络服务系统；\r\n（3）不利用拼品网服务从事以下活动：\r\n1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；\r\n2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；\r\n3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；\r\n4) 故意制作、传播计算机病毒等破坏性程序的；\r\n5) 其他危害计算机信息网络安全的行为。\r\n3．2　 用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿拼品网与合作公司、关联公司，并使之免受损害。对此，拼品网有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收拼品网帐号、追 究法律责任等措施。对恶意注册拼品网帐号或利用拼品网帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，拼品网有权回收其帐号。同 时，拼品网公司会视司法部门的要求，协助调查。\r\n3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。\r\n3．4　用户须对自己在使用拼品网服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在拼品网公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予拼品网公司等额的赔偿。\r\n四、服务内容\r\n4．1　拼品网网络服务的具体内容由拼品网根据实际情况提供。\r\n4．2　除非本服务协议另有其它明示规定，拼品网所推出的新产品、新功能、新服务，均受到本服务协议之规范。\r\n4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。\r\n4．4　鉴于网络服务的特殊性，用户同意拼品网有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。拼品网不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。\r\n4．5　拼品网需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，拼品网无需为此承担任何责任。拼品网保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。\r\n4．6　 本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于拼品网无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，拼品网不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，拼品网亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资 源获得的任何内容、商品或服务所产生的任何损害或损失，拼品网不承担任何责任。\r\n4．7　用户明确同意其使用拼品网网络服务所存在的风险将完全由其 自己承担。用户	理解并接受下载或通过拼品网服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。拼品网对在服务网上得 到的任何商品购物服	务、交易进程、招聘信息，都不作担保。\r\n4．8　3个月未登录的帐号，拼品网保留关闭的权利。\r\n4．9　拼品网有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，拼品网对用户和任何第三人均无需承担任何责任。\r\n4．10　终止服务\r\n您同意拼品网得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或拼品网认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使 用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并 同意，拼品网可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您 的帐号及相关信息和文件被关闭或删除，拼品网对您或任何第三人均不承担任何责任。\r\n五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）\r\n5．1　用户专属权利\r\n拼品网尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向拼品网提供资料∶\r\n请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，拼品网建议该个人或单位首先咨询专业人士。\r\n为了拼品网有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）：\r\n1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；\r\n2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。\r\n3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。\r\n4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。\r\n5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。\r\n5．1　 对于用户通过拼品网服务上传到拼品网网站上可公开获取区域的任何内容，用户同意拼品网在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知 的或以后开发的其他任何形式的作品、媒体或技术中。\r\n5．2　拼品网拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：所有的资料和图象均以获得信息为目的；\r\n所有的资料和图象均不得用于商业目的；\r\n所有的资料、图象及其任何部分都必须包括此版权声明；\r\n本网站（www.pinphp.com）所有的产品、技术与所有程序均属于拼品网知识产权，在此并未授权。\r\n“www.pinphp.com”, “拼品网”及相关图形等为拼品网的注册商标。\r\n未经拼品网许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，拼品网将依法追究法律责任。\r\n六、青少年用户特别提示\r\n青少年用户必须遵守全国青少年网络文明公约：\r\n要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。\r\n七、其他\r\n7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。\r\n7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向拼品网所在地的人民法院提起诉讼。\r\n7．3　拼品网未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。\r\n7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。\r\n拼品网对本使用协议享有最终解释权。', '');
INSERT INTO `tp_setting` VALUES ('item_cover_comments', '2', '');
INSERT INTO `tp_setting` VALUES ('user_intro_default', '这个家伙太懒，什么都木留下~', '');
INSERT INTO `tp_setting` VALUES ('ipban_switch', '1', '');
INSERT INTO `tp_setting` VALUES ('score_item_img', 'a:4:{s:6:\"swidth\";s:3:\"210\";s:7:\"sheight\";s:3:\"210\";s:6:\"bwidth\";s:3:\"350\";s:7:\"bheight\";s:3:\"350\";}', '');
INSERT INTO `tp_setting` VALUES ('seo_config', 'a:6:{s:4:\"book\";a:3:{s:5:\"title\";s:23:\"{tag_name}-{site_title}\";s:8:\"keywords\";s:23:\"逛宝贝，{site_name}\";s:11:\"description\";s:18:\"{site_description}\";}s:4:\"cate\";a:3:{s:5:\"title\";s:23:\"{cate_name}-{seo_title}\";s:8:\"keywords\";s:14:\"{seo_keywords}\";s:11:\"description\";s:17:\"{seo_description}\";}s:5:\"album\";a:3:{s:5:\"title\";s:6:\"专辑\";s:8:\"keywords\";s:47:\"{site_name},购物分享,淘宝网购物,专辑\";s:11:\"description\";s:18:\"{site_description}\";}s:10:\"album_cate\";a:3:{s:5:\"title\";s:11:\"{seo_title}\";s:8:\"keywords\";s:14:\"{seo_keywords}\";s:11:\"description\";s:17:\"{seo_description}\";}s:12:\"album_detail\";a:3:{s:5:\"title\";s:13:\"{album_title}\";s:8:\"keywords\";s:13:\"{album_intro}\";s:11:\"description\";s:23:\"杂志详细Description\";}s:4:\"item\";a:3:{s:5:\"title\";s:12:\"{item_title}\";s:8:\"keywords\";s:10:\"{item_tag}\";s:11:\"description\";s:12:\"{item_intro}\";}}', '');
INSERT INTO `tp_setting` VALUES ('item_img', 'a:2:{s:5:\"width\";s:3:\"210\";s:6:\"height\";s:4:\"1000\";}', '');
INSERT INTO `tp_setting` VALUES ('item_simg', 'a:2:{s:5:\"width\";s:3:\"100\";s:6:\"height\";s:3:\"100\";}', '');
INSERT INTO `tp_setting` VALUES ('item_bimg', 'a:2:{s:5:\"width\";s:3:\"468\";s:6:\"height\";s:4:\"1000\";}', '');
INSERT INTO `tp_setting` VALUES ('attach_path', 'data/upload/', '');
INSERT INTO `tp_setting` VALUES ('wall_distance', '500', '');
INSERT INTO `tp_setting` VALUES ('reg_status', '1', '');
INSERT INTO `tp_setting` VALUES ('reg_closed_reason', '<h1>暂时关闭注册</h1>', '');
INSERT INTO `tp_setting` VALUES ('index_wall', '1', '');
INSERT INTO `tp_setting` VALUES ('tp_img', '1308/06/5200a7cba87b0.jpg', '');
INSERT INTO `tp_setting` VALUES ('weixinshop_img', '1308/06/5200a7cba936c.jpg', '');
INSERT INTO `tp_setting` VALUES ('appid', '', '');
INSERT INTO `tp_setting` VALUES ('appsecret', '', '');

-- ----------------------------
-- Table structure for tp_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_user`;
CREATE TABLE `tp_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `role` smallint(6) unsigned NOT NULL COMMENT '组ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1:启用 0:禁止',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `last_login_time` int(11) unsigned NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `last_location` varchar(100) DEFAULT NULL COMMENT '最后登录位置',
  `email` varchar(90) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_user
-- ----------------------------
INSERT INTO `tp_user` VALUES ('1', 'admin', 'b80c4de605487af2bf83a7cbd1d68025', '5', '1', '', '1411096180', '220.248.109.242', '', '');
