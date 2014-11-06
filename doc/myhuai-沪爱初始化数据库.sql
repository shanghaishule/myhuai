/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : myhuai

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2014-11-02 21:00:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for slimstat
-- ----------------------------
DROP TABLE IF EXISTS `slimstat`;
CREATE TABLE `slimstat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `remote_ip` varchar(15) NOT NULL DEFAULT '',
  `remote_addr` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `language` varchar(255) NOT NULL DEFAULT '',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `searchterms` varchar(255) NOT NULL DEFAULT '',
  `resource` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `platform` varchar(50) NOT NULL DEFAULT '',
  `browser` varchar(50) NOT NULL DEFAULT '',
  `version` varchar(15) NOT NULL DEFAULT '',
  `visit` int(10) unsigned NOT NULL DEFAULT '0',
  `dt` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `referer_idx` (`referer`),
  KEY `user_agent_idx` (`user_agent`),
  KEY `version_idx` (`version`),
  KEY `remote_ip_remote_addr_idx` (`remote_ip`,`remote_addr`),
  KEY `resource_total_uniques_idx` (`resource`,`id`,`visit`,`remote_ip`),
  KEY `searchterms_total_uniques_idx` (`searchterms`,`id`,`visit`,`remote_ip`),
  KEY `domain_total_uniques_idx` (`domain`,`id`,`visit`,`remote_ip`),
  KEY `platform_total_uniques_idx` (`platform`,`id`,`visit`,`remote_ip`),
  KEY `browser_version_total_uniques_idx` (`browser`,`version`,`id`,`visit`,`remote_ip`),
  KEY `country_total_uniques_idx` (`country`,`id`,`visit`,`remote_ip`),
  KEY `language_total_uniques_idx` (`language`,`id`,`visit`,`remote_ip`),
  KEY `dt_total_uniques_idx` (`dt`,`id`,`visit`,`remote_ip`),
  KEY `visit_total_uniques_idx` (`visit`,`id`,`remote_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for tp_account_bill_dtl
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_bill_dtl`;
CREATE TABLE `tp_account_bill_dtl` (
  `billnum` varchar(50) NOT NULL COMMENT '账单单号',
  `itemno` int(11) NOT NULL COMMENT '明细号',
  `orderId` varchar(50) NOT NULL COMMENT '订单号',
  `goods_sumPrice` decimal(10,2) NOT NULL COMMENT '商品总额',
  `order_sumPrice` decimal(10,2) NOT NULL COMMENT '订单总额',
  PRIMARY KEY (`billnum`,`itemno`),
  UNIQUE KEY `billnum` (`billnum`,`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_account_bill_mst
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_bill_mst`;
CREATE TABLE `tp_account_bill_mst` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `billnum` varchar(50) NOT NULL COMMENT '账单单号',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `gen` varchar(50) NOT NULL DEFAULT '' COMMENT '生成人',
  `gen_time` int(10) NOT NULL DEFAULT '0' COMMENT '生成时间',
  `start_time` int(10) NOT NULL DEFAULT '0' COMMENT '账单开始时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '账单结束时间',
  `totalamt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账单总金额',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '扣率',
  `yingjie` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应结金额',
  `tokenTall` varchar(20) NOT NULL DEFAULT '' COMMENT '商家token',
  `duizhang` varchar(50) DEFAULT NULL COMMENT '商城对账人',
  `duizhang_time` int(10) DEFAULT NULL COMMENT '商城对账时间',
  `duizhang2` varchar(50) DEFAULT NULL COMMENT '商家对账人',
  `duizhang2_time` int(10) DEFAULT NULL COMMENT '商家对账时间',
  `pay` varchar(50) DEFAULT NULL COMMENT '付款人',
  `pay_time` int(10) DEFAULT NULL COMMENT '付款时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `billnum` (`billnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_account_setting
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_setting`;
CREATE TABLE `tp_account_setting` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `bankname` varchar(200) NOT NULL COMMENT '银行名称',
  `account` varchar(100) NOT NULL COMMENT '银行账号',
  `payee` varchar(255) NOT NULL COMMENT '收款人',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `tokenTall` varchar(20) NOT NULL DEFAULT '' COMMENT '商家token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_ad
-- ----------------------------
DROP TABLE IF EXISTS `tp_ad`;
CREATE TABLE `tp_ad` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `board_id` smallint(5) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `extimg` varchar(255) NOT NULL,
  `extval` varchar(200) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `clicks` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `checkstatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未申请 1-已申请',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_adboard
-- ----------------------------
DROP TABLE IF EXISTS `tp_adboard`;
CREATE TABLE `tp_adboard` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tpl` varchar(20) NOT NULL,
  `width` smallint(5) NOT NULL,
  `height` smallint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_address
-- ----------------------------
DROP TABLE IF EXISTS `tp_address`;
CREATE TABLE `tp_address` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `contacts` varchar(100) DEFAULT '联系人',
  `Province` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `postcode` varchar(30) DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `name` varchar(50) NOT NULL COMMENT '公司名称',
  `isno` varchar(10) DEFAULT '0' COMMENT '0:否 1:是',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_adforhome
-- ----------------------------
DROP TABLE IF EXISTS `tp_adforhome`;
CREATE TABLE `tp_adforhome` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `board_id` smallint(5) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `extimg` varchar(255) NOT NULL,
  `extval` varchar(200) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `clicks` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `checkstatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未审核 1-审核通过 2-等待',
  `boadid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0--未投入 1-首页头部 2-首页中部 3-首页中下部位',
  `adid` int(11) NOT NULL DEFAULT '0' COMMENT '对应商家广告id',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_adma
-- ----------------------------
DROP TABLE IF EXISTS `tp_adma`;
CREATE TABLE `tp_adma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(60) NOT NULL,
  `url` varchar(100) NOT NULL,
  `copyright` varchar(50) NOT NULL,
  `info` varchar(120) NOT NULL,
  `title` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for tp_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_auth`;
CREATE TABLE `tp_admin_auth` (
  `role_id` tinyint(3) NOT NULL,
  `menu_id` smallint(6) NOT NULL,
  KEY `role_id` (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for tp_album
-- ----------------------------
DROP TABLE IF EXISTS `tp_album`;
CREATE TABLE `tp_album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `cover_cache` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `likes` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `follows` int(10) unsigned NOT NULL DEFAULT '0',
  `is_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_album_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_album_cate`;
CREATE TABLE `tp_album_cate` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `albums` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_album_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_album_comment`;
CREATE TABLE `tp_album_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_album_follow
-- ----------------------------
DROP TABLE IF EXISTS `tp_album_follow`;
CREATE TABLE `tp_album_follow` (
  `uid` int(10) NOT NULL,
  `album_id` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  UNIQUE KEY `uid` (`uid`,`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_album_item
-- ----------------------------
DROP TABLE IF EXISTS `tp_album_item`;
CREATE TABLE `tp_album_item` (
  `album_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `intro` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`album_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_alipay
-- ----------------------------
DROP TABLE IF EXISTS `tp_alipay`;
CREATE TABLE `tp_alipay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付宝名称',
  `partner` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '合作身份者id',
  `key` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '安全检验码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_alipay_biz
-- ----------------------------
DROP TABLE IF EXISTS `tp_alipay_biz`;
CREATE TABLE `tp_alipay_biz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) DEFAULT NULL COMMENT '支付宝名称',
  `partner` varchar(100) DEFAULT NULL COMMENT '合作身份者id',
  `key` varchar(100) DEFAULT NULL COMMENT '安全检验码',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_alipay_config`;
CREATE TABLE `tp_alipay_config` (
  `token` varchar(60) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `pid` varchar(40) NOT NULL DEFAULT '',
  `key` varchar(60) NOT NULL DEFAULT '',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_alipay_person
-- ----------------------------
DROP TABLE IF EXISTS `tp_alipay_person`;
CREATE TABLE `tp_alipay_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) DEFAULT NULL COMMENT '支付宝名称',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_api
-- ----------------------------
DROP TABLE IF EXISTS `tp_api`;
CREATE TABLE `tp_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(60) NOT NULL,
  `url` varchar(100) NOT NULL,
  `number` tinyint(1) NOT NULL,
  `order` tinyint(1) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_application
-- ----------------------------
DROP TABLE IF EXISTS `tp_application`;
CREATE TABLE `tp_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL COMMENT '用户id',
  `uname` varchar(30) DEFAULT NULL COMMENT '用户名',
  `umail` varchar(30) DEFAULT NULL COMMENT '用户邮箱',
  `applicant` varchar(30) DEFAULT NULL COMMENT '申请人',
  `addr` varchar(255) DEFAULT NULL COMMENT '地址',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `licence` varchar(255) DEFAULT NULL COMMENT '营业执照',
  `shopname` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  `trueshop` smallint(1) DEFAULT '0' COMMENT '是否有实体店',
  `text` varchar(500) DEFAULT NULL COMMENT '其他说明',
  `createtime` int(20) DEFAULT NULL COMMENT '申请时间',
  `uptatetime` int(20) DEFAULT NULL,
  `tokenTall` varchar(30) NOT NULL,
  `re` varchar(500) DEFAULT NULL,
  `wecha_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_areply
-- ----------------------------
DROP TABLE IF EXISTS `tp_areply`;
CREATE TABLE `tp_areply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `uid` int(11) NOT NULL,
  `uname` varchar(90) NOT NULL,
  `createtime` varchar(13) NOT NULL,
  `updatetime` varchar(13) NOT NULL,
  `token` char(30) NOT NULL,
  `home` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(90) NOT NULL,
  `description` char(255) NOT NULL,
  `author` varchar(15) NOT NULL,
  `form` varchar(30) NOT NULL,
  `updatetime` varchar(13) NOT NULL,
  `createtime` varchar(13) NOT NULL,
  `content` text NOT NULL,
  `imgs` char(40) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_article_cate`;
CREATE TABLE `tp_article_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `spid` varchar(50) NOT NULL,
  `ordid` smallint(4) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_article_page
-- ----------------------------
DROP TABLE IF EXISTS `tp_article_page`;
CREATE TABLE `tp_article_page` (
  `cate_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL,
  `info` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_article_wetall
-- ----------------------------
DROP TABLE IF EXISTS `tp_article_wetall`;
CREATE TABLE `tp_article_wetall` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `colors` varchar(10) NOT NULL,
  `author` varchar(100) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序值',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_auto_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_auto_user`;
CREATE TABLE `tp_auto_user` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `users` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_background
-- ----------------------------
DROP TABLE IF EXISTS `tp_background`;
CREATE TABLE `tp_background` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `img` char(255) NOT NULL,
  `info` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_badword
-- ----------------------------
DROP TABLE IF EXISTS `tp_badword`;
CREATE TABLE `tp_badword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：禁用；2：替换；3：审核',
  `badword` varchar(100) NOT NULL,
  `replaceword` varchar(100) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_brandlist
-- ----------------------------
DROP TABLE IF EXISTS `tp_brandlist`;
CREATE TABLE `tp_brandlist` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_call
-- ----------------------------
DROP TABLE IF EXISTS `tp_call`;
CREATE TABLE `tp_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(60) CHARACTER SET latin1 NOT NULL,
  `phone_account` varchar(50) CHARACTER SET latin1 NOT NULL,
  `phone_password` varchar(50) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_canyu
-- ----------------------------
DROP TABLE IF EXISTS `tp_canyu`;
CREATE TABLE `tp_canyu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` int(11) NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  `token` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `number` int(11) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_case
-- ----------------------------
DROP TABLE IF EXISTS `tp_case`;
CREATE TABLE `tp_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `url` char(255) NOT NULL,
  `img` char(200) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_classify
-- ----------------------------
DROP TABLE IF EXISTS `tp_classify`;
CREATE TABLE `tp_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `info` varchar(90) NOT NULL COMMENT '分类描述',
  `sorts` varchar(6) NOT NULL COMMENT '显示顺序',
  `img` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `token` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_comments
-- ----------------------------
DROP TABLE IF EXISTS `tp_comments`;
CREATE TABLE `tp_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `comments_type` int(3) unsigned NOT NULL,
  `user_comments` varchar(1024) DEFAULT NULL,
  `create_time` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_company
-- ----------------------------
DROP TABLE IF EXISTS `tp_company`;
CREATE TABLE `tp_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `shortname` varchar(50) NOT NULL DEFAULT '',
  `mp` varchar(11) NOT NULL DEFAULT '',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL DEFAULT '',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `intro` text NOT NULL,
  `catid` mediumint(3) NOT NULL DEFAULT '0',
  `taxis` int(10) NOT NULL DEFAULT '0',
  `isbranch` tinyint(1) NOT NULL DEFAULT '0',
  `logourl` varchar(180) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_custom_menu
-- ----------------------------
DROP TABLE IF EXISTS `tp_custom_menu`;
CREATE TABLE `tp_custom_menu` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `spid` varchar(50) NOT NULL,
  `fcolor` varchar(10) NOT NULL,
  `remark` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `likes` int(10) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:商品分类 1:标签分类',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `key` varchar(255) DEFAULT NULL COMMENT 'key值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_delivery
-- ----------------------------
DROP TABLE IF EXISTS `tp_delivery`;
CREATE TABLE `tp_delivery` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_diymen_class
-- ----------------------------
DROP TABLE IF EXISTS `tp_diymen_class`;
CREATE TABLE `tp_diymen_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `url` varchar(180) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_diymen_set
-- ----------------------------
DROP TABLE IF EXISTS `tp_diymen_set`;
CREATE TABLE `tp_diymen_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `appid` varchar(18) NOT NULL,
  `appsecret` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_dream
-- ----------------------------
DROP TABLE IF EXISTS `tp_dream`;
CREATE TABLE `tp_dream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_flash
-- ----------------------------
DROP TABLE IF EXISTS `tp_flash`;
CREATE TABLE `tp_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `img` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `info` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_flink
-- ----------------------------
DROP TABLE IF EXISTS `tp_flink`;
CREATE TABLE `tp_flink` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `cate_id` smallint(5) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_flink_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_flink_cate`;
CREATE TABLE `tp_flink_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_follow
-- ----------------------------
DROP TABLE IF EXISTS `tp_follow`;
CREATE TABLE `tp_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follow_form_id` varchar(100) NOT NULL,
  `follow_to_id` varchar(100) NOT NULL,
  `follow_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=657 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_function
-- ----------------------------
DROP TABLE IF EXISTS `tp_function`;
CREATE TABLE `tp_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(7) NOT NULL DEFAULT '1',
  `usenum` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL,
  `funname` varchar(100) NOT NULL,
  `actname` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(200) NOT NULL DEFAULT '',
  `isserve` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `belonguser` int(11) NOT NULL DEFAULT '1',
  `funtype` varchar(100) NOT NULL DEFAULT '默认',
  `funcolor` varchar(100) NOT NULL DEFAULT '',
  `havenext` varchar(10) NOT NULL DEFAULT '否',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=326 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_function_master
-- ----------------------------
DROP TABLE IF EXISTS `tp_function_master`;
CREATE TABLE `tp_function_master` (
  `name` varchar(255) NOT NULL,
  `img` varchar(1024) NOT NULL,
  `orderno` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isshow` varchar(10) NOT NULL,
  `class` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_home
-- ----------------------------
DROP TABLE IF EXISTS `tp_home`;
CREATE TABLE `tp_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `title` varchar(30) NOT NULL,
  `picurl` varchar(120) NOT NULL,
  `info` varchar(120) NOT NULL,
  `plugmenucolor` varchar(10) NOT NULL,
  `copyright` varchar(200) NOT NULL,
  `homeurl` varchar(150) NOT NULL,
  `advancetpl` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_host
-- ----------------------------
DROP TABLE IF EXISTS `tp_host`;
CREATE TABLE `tp_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL,
  `keyword` varchar(50) NOT NULL COMMENT '关键词',
  `title` varchar(50) NOT NULL COMMENT '商家名称',
  `address` varchar(50) NOT NULL COMMENT '商家地',
  `tel` varchar(13) NOT NULL COMMENT '商家电话',
  `tel2` varchar(13) NOT NULL COMMENT '手机号',
  `ppicurl` varchar(250) NOT NULL COMMENT '订房封面图片',
  `headpic` varchar(250) NOT NULL COMMENT '订单页头部图片',
  `name` varchar(50) NOT NULL COMMENT '文字描述',
  `sort` int(11) NOT NULL COMMENT '排序',
  `picurl` varchar(100) NOT NULL COMMENT '图片地址',
  `url` varchar(50) NOT NULL COMMENT '图片跳转地址以http',
  `info` text NOT NULL COMMENT '商家介绍：',
  `info2` text NOT NULL COMMENT '订房说明u',
  `creattime` int(11) NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_host_list_add
-- ----------------------------
DROP TABLE IF EXISTS `tp_host_list_add`;
CREATE TABLE `tp_host_list_add` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) NOT NULL COMMENT '商家id',
  `token` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT '房间类型',
  `typeinfo` varchar(100) NOT NULL COMMENT '简要说明',
  `price` decimal(10,2) NOT NULL COMMENT '原价：',
  `yhprice` decimal(10,2) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '文字描述',
  `picurl` varchar(110) NOT NULL COMMENT '图片地址',
  `url` varchar(100) NOT NULL COMMENT '图片跳转地址以http',
  `info` text NOT NULL COMMENT '配套设施',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_host_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_host_order`;
CREATE TABLE `tp_host_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL,
  `wecha_id` varchar(50) NOT NULL,
  `book_people` varchar(50) NOT NULL COMMENT '预订人',
  `tel` varchar(13) NOT NULL COMMENT '电话',
  `check_in` int(11) NOT NULL COMMENT '入住时间',
  `check_out` int(11) NOT NULL COMMENT '离开时间',
  `room_type` varchar(50) NOT NULL COMMENT '房间类型',
  `book_time` int(11) NOT NULL COMMENT '预订时间',
  `book_num` int(11) NOT NULL COMMENT '预订数量',
  `price` decimal(10,2) NOT NULL COMMENT ' 价格',
  `order_status` int(11) NOT NULL COMMENT '订单状态 1 成功,2 失败,3 未处理',
  `hid` int(11) NOT NULL COMMENT '订房商家id',
  `remarks` varchar(250) NOT NULL COMMENT '留言备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_images
-- ----------------------------
DROP TABLE IF EXISTS `tp_images`;
CREATE TABLE `tp_images` (
  `iid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(300) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_img
-- ----------------------------
DROP TABLE IF EXISTS `tp_img`;
CREATE TABLE `tp_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(90) NOT NULL,
  `keyword` char(255) NOT NULL,
  `type` varchar(1) NOT NULL COMMENT '关键词匹配类型',
  `text` text NOT NULL COMMENT '简介',
  `classid` int(11) NOT NULL,
  `classname` varchar(60) NOT NULL,
  `pic` char(255) NOT NULL COMMENT '封面图片',
  `showpic` varchar(1) NOT NULL COMMENT '图片是否显示封面',
  `info` text NOT NULL COMMENT '图文详细内容',
  `url` char(255) NOT NULL COMMENT '图文外链地址',
  `createtime` varchar(13) NOT NULL,
  `uptatetime` varchar(13) NOT NULL,
  `click` int(11) NOT NULL,
  `token` char(30) NOT NULL,
  `title` varchar(60) NOT NULL,
  `statdate` varchar(13) NOT NULL,
  `person` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classid` (`classid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=11106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_indent
-- ----------------------------
DROP TABLE IF EXISTS `tp_indent`;
CREATE TABLE `tp_indent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `gid` tinyint(2) NOT NULL,
  `uname` varchar(60) NOT NULL,
  `title` varchar(60) NOT NULL,
  `info` int(11) NOT NULL,
  `indent_id` char(20) NOT NULL,
  `widtrade_no` int(20) NOT NULL,
  `price` float NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_info_notice
-- ----------------------------
DROP TABLE IF EXISTS `tp_info_notice`;
CREATE TABLE `tp_info_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `content` text,
  `ptime` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_ipban
-- ----------------------------
DROP TABLE IF EXISTS `tp_ipban`;
CREATE TABLE `tp_ipban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `expires_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item
-- ----------------------------
DROP TABLE IF EXISTS `tp_item`;
CREATE TABLE `tp_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned DEFAULT NULL,
  `orig_id` smallint(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `rates` float(8,2) NOT NULL COMMENT '佣金比率xxx.xx%',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:商品,2:图片',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `cmt_taobao_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info` text,
  `news` tinyint(4) DEFAULT '0',
  `tuijian` tinyint(4) DEFAULT '0',
  `goods_stock` int(11) DEFAULT '50' COMMENT '库存',
  `buy_num` int(11) DEFAULT '0' COMMENT '卖出数量',
  `brand` int(11) DEFAULT '1' COMMENT '品牌',
  `pingyou` decimal(10,2) DEFAULT '0.00',
  `kuaidi` decimal(10,2) DEFAULT '0.00',
  `ems` decimal(10,2) DEFAULT '0.00',
  `free` int(11) DEFAULT '1',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `size` varchar(255) DEFAULT NULL COMMENT '尺寸',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item_attr
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_attr`;
CREATE TABLE `tp_item_attr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) NOT NULL,
  `attr_name` varchar(50) NOT NULL,
  `attr_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_cate`;
CREATE TABLE `tp_item_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `spid` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `fcolor` varchar(10) NOT NULL,
  `remark` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `likes` int(10) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:商品分类 1:标签分类',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item_cate_tag
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_cate_tag`;
CREATE TABLE `tp_item_cate_tag` (
  `cate_id` smallint(4) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `cate_id` (`cate_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_comment`;
CREATE TABLE `tp_item_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item_img
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_img`;
CREATE TABLE `tp_item_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item_like
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_like`;
CREATE TABLE `tp_item_like` (
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`item_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_order`;
CREATE TABLE `tp_item_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(50) NOT NULL COMMENT '订单号',
  `add_time` int(11) DEFAULT NULL COMMENT '下单时间',
  `goods_sumPrice` decimal(10,2) NOT NULL COMMENT '商品总额',
  `order_sumPrice` decimal(10,2) NOT NULL COMMENT '订单总额',
  `note` text CHARACTER SET utf8 COMMENT '客服备注',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `userName` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `address_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系手机',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '收货地址',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 1:待付款 2：待发货  3:待收货 4:完成 5:关闭',
  `supportmetho` tinyint(5) DEFAULT NULL COMMENT '支付方式 1:支付宝 2:货到付款',
  `freetype` int(11) DEFAULT NULL COMMENT '用户快递方式  1:平邮 2:快递 3:ems 0:卖家包邮',
  `freeprice` decimal(10,2) DEFAULT '0.00' COMMENT '快递费用',
  `closemsg` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '关闭原因',
  `support_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `sellerRemark` text CHARACTER SET utf8 COMMENT '客服备注',
  `userfree` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '给用户配送快递方式 0:无需快递',
  `freecode` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '快递编号',
  `fahuoaddress` int(11) DEFAULT NULL COMMENT '发货地址',
  `fahuo_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_item_orig
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_orig`;
CREATE TABLE `tp_item_orig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item_site
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_site`;
CREATE TABLE `tp_item_site` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item_tag
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_tag`;
CREATE TABLE `tp_item_tag` (
  `item_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `item_id` (`item_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_item_taobao
-- ----------------------------
DROP TABLE IF EXISTS `tp_item_taobao`;
CREATE TABLE `tp_item_taobao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned DEFAULT NULL,
  `orig_id` smallint(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `rates` float(8,2) NOT NULL COMMENT '佣金比率xxx.xx%',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:商品,2:图片',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `cmt_taobao_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info` text,
  `news` tinyint(4) DEFAULT '0',
  `tuijian` tinyint(4) DEFAULT '0',
  `goods_stock` int(11) DEFAULT '50' COMMENT '库存',
  `buy_num` int(11) DEFAULT '0' COMMENT '卖出数量',
  `brand` int(11) DEFAULT '1' COMMENT '品牌',
  `pingyou` decimal(10,2) DEFAULT '0.00',
  `kuaidi` decimal(10,2) DEFAULT '0.00',
  `ems` decimal(10,2) DEFAULT '0.00',
  `free` int(11) DEFAULT '1',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `size` varchar(255) DEFAULT NULL COMMENT '尺寸',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  `Uninum` varchar(50) NOT NULL COMMENT '商品编号',
  `imagesDetail` blob,
  `Huohao` varchar(255) NOT NULL,
  `item_model` int(4) NOT NULL,
  `images` varchar(255) DEFAULT '|1001|1002|1003|1004|1005',
  `detail_stock` text NOT NULL,
  `old_price` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=460 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_jianyi
-- ----------------------------
DROP TABLE IF EXISTS `tp_jianyi`;
CREATE TABLE `tp_jianyi` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `D_id` int(11) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tp_keyword
-- ----------------------------
DROP TABLE IF EXISTS `tp_keyword`;
CREATE TABLE `tp_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` char(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `token` varchar(60) NOT NULL,
  `module` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_keyword_wetall
-- ----------------------------
DROP TABLE IF EXISTS `tp_keyword_wetall`;
CREATE TABLE `tp_keyword_wetall` (
  `kid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kename` varchar(300) DEFAULT NULL,
  `kecontent` varchar(500) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1:文本 2：图文',
  `kyword` varchar(255) DEFAULT NULL,
  `titles` varchar(1000) DEFAULT NULL,
  `imageinfo` varchar(1000) DEFAULT NULL,
  `linkinfo` varchar(1000) DEFAULT NULL,
  `ismess` tinyint(1) DEFAULT NULL,
  `isfollow` tinyint(1) DEFAULT NULL,
  `iskey` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_links
-- ----------------------------
DROP TABLE IF EXISTS `tp_links`;
CREATE TABLE `tp_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `url` char(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_liuyan
-- ----------------------------
DROP TABLE IF EXISTS `tp_liuyan`;
CREATE TABLE `tp_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(30) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  `createtime` int(20) DEFAULT NULL,
  `uptatetime` int(20) DEFAULT NULL,
  `token` varchar(30) NOT NULL,
  `re` varchar(500) DEFAULT NULL,
  `wecha_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_liuyan1
-- ----------------------------
DROP TABLE IF EXISTS `tp_liuyan1`;
CREATE TABLE `tp_liuyan1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(30) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  `createtime` int(20) DEFAULT NULL,
  `uptatetime` int(20) DEFAULT NULL,
  `token` varchar(30) NOT NULL,
  `re` varchar(500) DEFAULT NULL,
  `wecha_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_lottery
-- ----------------------------
DROP TABLE IF EXISTS `tp_lottery`;
CREATE TABLE `tp_lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joinnum` int(11) NOT NULL COMMENT '参与人数',
  `click` int(11) NOT NULL,
  `token` varchar(30) NOT NULL,
  `keyword` varchar(10) NOT NULL,
  `starpicurl` varchar(100) NOT NULL COMMENT '填写活动开始图片网址',
  `title` varchar(60) NOT NULL COMMENT '活动名称',
  `txt` varchar(60) NOT NULL COMMENT '用户输入兑奖时候的显示信息',
  `sttxt` varchar(200) NOT NULL COMMENT '简介',
  `statdate` int(11) NOT NULL COMMENT '活动开始时间',
  `enddate` int(11) NOT NULL COMMENT '活动结束时间',
  `info` varchar(200) NOT NULL COMMENT '活动说明',
  `aginfo` varchar(200) NOT NULL COMMENT '重复抽奖回复',
  `endtite` varchar(60) NOT NULL COMMENT '活动结束公告主题',
  `endpicurl` varchar(100) NOT NULL,
  `endinfo` varchar(60) NOT NULL,
  `fist` varchar(50) NOT NULL COMMENT '一等奖奖品设置',
  `fistnums` int(4) NOT NULL COMMENT '一等奖奖品数量',
  `fistlucknums` int(1) NOT NULL COMMENT '一等奖中奖号码',
  `second` varchar(50) NOT NULL COMMENT '二等奖奖品设置',
  `type` tinyint(1) NOT NULL,
  `secondnums` int(4) NOT NULL,
  `secondlucknums` int(1) NOT NULL,
  `third` varchar(50) NOT NULL,
  `thirdnums` int(4) NOT NULL,
  `thirdlucknums` int(1) NOT NULL,
  `allpeople` int(11) NOT NULL,
  `canrqnums` int(2) NOT NULL COMMENT '个人限制抽奖次数',
  `parssword` int(15) NOT NULL,
  `renamesn` varchar(50) NOT NULL,
  `renametel` varchar(60) NOT NULL,
  `displayjpnums` int(1) NOT NULL,
  `createtime` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `four` varchar(50) NOT NULL,
  `fournums` int(11) NOT NULL,
  `fourlucknums` int(11) NOT NULL,
  `five` varchar(50) NOT NULL,
  `fivenums` int(11) NOT NULL,
  `fivelucknums` int(11) NOT NULL,
  `six` varchar(50) NOT NULL COMMENT '六等奖',
  `sixnums` int(11) NOT NULL,
  `sixlucknums` int(11) NOT NULL,
  `zjpic` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_lottery_record
-- ----------------------------
DROP TABLE IF EXISTS `tp_lottery_record`;
CREATE TABLE `tp_lottery_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) NOT NULL,
  `usenums` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户使用次数',
  `wecha_id` varchar(60) NOT NULL COMMENT '微信唯一识别码',
  `token` varchar(30) NOT NULL,
  `islottery` int(1) NOT NULL COMMENT '是否中奖',
  `wecha_name` varchar(60) NOT NULL COMMENT '微信号',
  `phone` varchar(15) NOT NULL,
  `sn` varchar(13) NOT NULL COMMENT '中奖后序列号',
  `time` int(11) NOT NULL,
  `prize` varchar(50) NOT NULL DEFAULT '' COMMENT '已中奖项',
  `sendstutas` int(11) NOT NULL DEFAULT '0',
  `sendtime` int(11) NOT NULL,
  PRIMARY KEY (`id`,`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_mail_queue
-- ----------------------------
DROP TABLE IF EXISTS `tp_mail_queue`;
CREATE TABLE `tp_mail_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail_to` varchar(120) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `err_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `lock_expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_member
-- ----------------------------
DROP TABLE IF EXISTS `tp_member`;
CREATE TABLE `tp_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `isopen` int(1) NOT NULL,
  `homepic` varchar(100) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_member_card_contact
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_card_contact`;
CREATE TABLE `tp_member_card_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `cname` varchar(30) NOT NULL,
  `tel` varchar(12) NOT NULL,
  `sort` tinyint(1) NOT NULL,
  `info` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_member_card_coupon
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_card_coupon`;
CREATE TABLE `tp_member_card_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `title` varchar(60) NOT NULL,
  `group` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `price` int(11) NOT NULL,
  `people` int(3) NOT NULL,
  `statdate` int(11) NOT NULL,
  `enddate` int(11) NOT NULL,
  `info` varchar(200) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_member_card_create
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_card_create`;
CREATE TABLE `tp_member_card_create` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `number` varchar(20) NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_member_card_exchange
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_card_exchange`;
CREATE TABLE `tp_member_card_exchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `everyday` tinyint(4) NOT NULL,
  `continuation` tinyint(4) NOT NULL,
  `reward` tinyint(4) NOT NULL,
  `cardinfo` varchar(200) NOT NULL,
  `cardinfo2` varchar(200) NOT NULL,
  `create_time` int(11) NOT NULL,
  `shareFriend` int(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_member_card_info
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_card_info`;
CREATE TABLE `tp_member_card_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `info` varchar(200) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `description` varchar(12) NOT NULL,
  `class` tinyint(1) NOT NULL,
  `password` varchar(11) NOT NULL,
  `crate_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_member_card_integral
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_card_integral`;
CREATE TABLE `tp_member_card_integral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `title` varchar(60) NOT NULL,
  `integral` int(8) NOT NULL,
  `statdate` int(11) NOT NULL,
  `enddate` int(11) NOT NULL,
  `info` varchar(200) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_member_card_set
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_card_set`;
CREATE TABLE `tp_member_card_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `cardname` varchar(60) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `bg` varchar(100) NOT NULL,
  `diybg` varchar(200) NOT NULL,
  `msg` varchar(100) NOT NULL,
  `numbercolor` varchar(10) NOT NULL,
  `vipnamecolor` varchar(10) NOT NULL,
  `Lastmsg` varchar(100) NOT NULL,
  `vip` varchar(100) NOT NULL,
  `qiandao` varchar(100) NOT NULL,
  `shopping` varchar(100) NOT NULL,
  `memberinfo` varchar(100) NOT NULL,
  `membermsg` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_member_card_sign
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_card_sign`;
CREATE TABLE `tp_member_card_sign` (
  `id` int(11) NOT NULL,
  `token` varchar(50) NOT NULL,
  `wecha_id` varchar(50) NOT NULL,
  `sign_time` int(11) NOT NULL,
  `is_sign` int(11) NOT NULL,
  `score_type` int(11) NOT NULL,
  `expense` int(11) NOT NULL,
  `sell_expense` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_member_card_vip
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_card_vip`;
CREATE TABLE `tp_member_card_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `title` varchar(60) NOT NULL,
  `group` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `statdate` int(11) NOT NULL,
  `enddate` int(11) NOT NULL,
  `info` varchar(200) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for tp_message
-- ----------------------------
DROP TABLE IF EXISTS `tp_message`;
CREATE TABLE `tp_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ftid` int(10) unsigned NOT NULL,
  `from_id` int(10) NOT NULL,
  `from_name` varchar(50) NOT NULL,
  `to_id` int(10) NOT NULL,
  `to_name` varchar(50) NOT NULL,
  `add_time` int(10) NOT NULL,
  `info` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_message_check
-- ----------------------------
DROP TABLE IF EXISTS `tp_message_check`;
CREATE TABLE `tp_message_check` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_message_tpl
-- ----------------------------
DROP TABLE IF EXISTS `tp_message_tpl`;
CREATE TABLE `tp_message_tpl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `is_sys` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL COMMENT '别名',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_micro_research
-- ----------------------------
DROP TABLE IF EXISTS `tp_micro_research`;
CREATE TABLE `tp_micro_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text,
  `optionA` text,
  `optionB` text,
  `optionC` text,
  `optionD` text,
  `optionE` text,
  `display` varchar(1) DEFAULT 'Y',
  `type` varchar(1) DEFAULT 'D',
  `answerA` int(11) NOT NULL DEFAULT '0',
  `answerB` int(11) NOT NULL DEFAULT '0',
  `answerC` int(11) NOT NULL DEFAULT '0',
  `answerD` int(11) NOT NULL DEFAULT '0',
  `answerE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_myfun
-- ----------------------------
DROP TABLE IF EXISTS `tp_myfun`;
CREATE TABLE `tp_myfun` (
  `users` int(11) NOT NULL,
  `funtype` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tp_nav
-- ----------------------------
DROP TABLE IF EXISTS `tp_nav`;
CREATE TABLE `tp_nav` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` tinyint(1) NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `mod` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_nearby_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_nearby_user`;
CREATE TABLE `tp_nearby_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(30) NOT NULL,
  `uid` varchar(32) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for tp_oauth
-- ----------------------------
DROP TABLE IF EXISTS `tp_oauth`;
CREATE TABLE `tp_oauth` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `config` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_ordering_class
-- ----------------------------
DROP TABLE IF EXISTS `tp_ordering_class`;
CREATE TABLE `tp_ordering_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `name` varchar(10) NOT NULL,
  `sort` tinyint(2) NOT NULL,
  `info` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_ordering_set
-- ----------------------------
DROP TABLE IF EXISTS `tp_ordering_set`;
CREATE TABLE `tp_ordering_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `keyword` varchar(10) NOT NULL,
  `title` varchar(60) NOT NULL,
  `info` varchar(120) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  `flash` text NOT NULL,
  `create_time` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_detail`;
CREATE TABLE `tp_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '订单编号',
  `itemId` int(11) NOT NULL COMMENT '商品ID',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名称',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片路径',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `quantity` int(11) NOT NULL COMMENT '购买数量',
  `size` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_order_merge
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_merge`;
CREATE TABLE `tp_order_merge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) DEFAULT NULL COMMENT '订单号',
  `mergeid` varchar(50) DEFAULT NULL COMMENT '合并订单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_other
-- ----------------------------
DROP TABLE IF EXISTS `tp_other`;
CREATE TABLE `tp_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `keyword` varchar(60) NOT NULL,
  `info` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_panorama
-- ----------------------------
DROP TABLE IF EXISTS `tp_panorama`;
CREATE TABLE `tp_panorama` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(300) NOT NULL DEFAULT '',
  `frontpic` varchar(100) NOT NULL DEFAULT '',
  `rightpic` varchar(100) NOT NULL DEFAULT '',
  `backpic` varchar(100) NOT NULL DEFAULT '',
  `leftpic` varchar(100) NOT NULL DEFAULT '',
  `toppic` varchar(100) NOT NULL DEFAULT '',
  `bottompic` varchar(100) NOT NULL DEFAULT '',
  `keyword` varchar(60) NOT NULL DEFAULT '',
  `taxis` int(10) NOT NULL DEFAULT '0',
  `music` varchar(100) NOT NULL,
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_photo
-- ----------------------------
DROP TABLE IF EXISTS `tp_photo`;
CREATE TABLE `tp_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `title` varchar(20) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  `isshoinfo` tinyint(1) NOT NULL,
  `num` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `info` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_photo_list
-- ----------------------------
DROP TABLE IF EXISTS `tp_photo_list`;
CREATE TABLE `tp_photo_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `info` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_product
-- ----------------------------
DROP TABLE IF EXISTS `tp_product`;
CREATE TABLE `tp_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `catid` mediumint(4) NOT NULL DEFAULT '0',
  `storeid` mediumint(4) NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '',
  `price` float NOT NULL DEFAULT '0',
  `oprice` float NOT NULL DEFAULT '0',
  `discount` float NOT NULL DEFAULT '10',
  `intro` text NOT NULL,
  `token` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `salecount` mediumint(4) NOT NULL DEFAULT '0',
  `logourl` varchar(150) NOT NULL DEFAULT '',
  `dining` tinyint(1) NOT NULL DEFAULT '0',
  `groupon` tinyint(1) NOT NULL DEFAULT '0',
  `endtime` int(10) NOT NULL DEFAULT '0',
  `fakemembercount` mediumint(4) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`storeid`),
  KEY `catid_2` (`catid`),
  KEY `storeid` (`storeid`),
  KEY `token` (`token`),
  KEY `price` (`price`),
  KEY `oprice` (`oprice`),
  KEY `discount` (`discount`),
  KEY `dining` (`dining`),
  KEY `groupon` (`groupon`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_product_cart
-- ----------------------------
DROP TABLE IF EXISTS `tp_product_cart`;
CREATE TABLE `tp_product_cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL DEFAULT '',
  `wecha_id` varchar(60) NOT NULL DEFAULT '',
  `info` varchar(300) NOT NULL DEFAULT '',
  `total` mediumint(4) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `truename` varchar(20) NOT NULL DEFAULT '',
  `tel` varchar(14) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `diningtype` mediumint(2) NOT NULL DEFAULT '0',
  `tableid` mediumint(4) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  `buytime` varchar(100) NOT NULL DEFAULT '',
  `groupon` tinyint(1) NOT NULL DEFAULT '0',
  `dining` tinyint(1) NOT NULL DEFAULT '0',
  `year` mediumint(4) NOT NULL DEFAULT '0',
  `month` mediumint(4) NOT NULL DEFAULT '0',
  `day` mediumint(4) NOT NULL DEFAULT '0',
  `hour` smallint(4) NOT NULL DEFAULT '0',
  `printed` tinyint(1) NOT NULL DEFAULT '0',
  `handled` tinyint(1) NOT NULL DEFAULT '0',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `orderid` varchar(40) NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `logistics` varchar(70) NOT NULL,
  `logisticsid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`,`time`),
  KEY `groupon` (`groupon`),
  KEY `dining` (`dining`),
  KEY `printed` (`printed`),
  KEY `year` (`year`,`month`,`day`,`hour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_product_cart_list
-- ----------------------------
DROP TABLE IF EXISTS `tp_product_cart_list`;
CREATE TABLE `tp_product_cart_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cartid` int(10) NOT NULL DEFAULT '0',
  `productid` int(10) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `total` mediumint(4) NOT NULL DEFAULT '0',
  `wecha_id` varchar(60) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cartid` (`cartid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_product_cat
-- ----------------------------
DROP TABLE IF EXISTS `tp_product_cat`;
CREATE TABLE `tp_product_cat` (
  `id` mediumint(4) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL,
  `des` varchar(500) NOT NULL DEFAULT '',
  `parentid` mediumint(4) NOT NULL,
  `logourl` varchar(100) NOT NULL,
  `dining` tinyint(1) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  KEY `token` (`token`),
  KEY `dining` (`dining`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_product_diningtable
-- ----------------------------
DROP TABLE IF EXISTS `tp_product_diningtable`;
CREATE TABLE `tp_product_diningtable` (
  `id` mediumint(4) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `intro` varchar(500) NOT NULL DEFAULT '',
  `taxis` mediumint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_reply_info
-- ----------------------------
DROP TABLE IF EXISTS `tp_reply_info`;
CREATE TABLE `tp_reply_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `title` varchar(30) NOT NULL DEFAULT '',
  `picurl` varchar(120) NOT NULL DEFAULT '',
  `info` varchar(120) NOT NULL DEFAULT '',
  `infotype` varchar(20) NOT NULL DEFAULT '',
  `diningyuding` tinyint(1) NOT NULL DEFAULT '1',
  `diningwaimai` tinyint(1) NOT NULL DEFAULT '1',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_requestdata
-- ----------------------------
DROP TABLE IF EXISTS `tp_requestdata`;
CREATE TABLE `tp_requestdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `year` int(4) NOT NULL,
  `month` int(2) NOT NULL,
  `day` int(2) NOT NULL,
  `time` int(11) NOT NULL,
  `textnum` int(5) NOT NULL,
  `imgnum` int(5) NOT NULL,
  `videonum` int(5) NOT NULL,
  `other` int(5) NOT NULL,
  `follownum` int(5) NOT NULL,
  `unfollownum` int(5) NOT NULL,
  `3g` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

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
-- Table structure for tp_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_role_user`;
CREATE TABLE `tp_role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` smallint(6) unsigned NOT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_score_item
-- ----------------------------
DROP TABLE IF EXISTS `tp_score_item`;
CREATE TABLE `tp_score_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL,
  `title` varchar(120) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：实物；1：虚拟',
  `img` varchar(255) NOT NULL,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `stock` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_num` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `buy_num` mediumint(8) NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_score_item_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_score_item_cate`;
CREATE TABLE `tp_score_item_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_score_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_score_log`;
CREATE TABLE `tp_score_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_score_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_score_order`;
CREATE TABLE `tp_score_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `item_name` varchar(120) NOT NULL,
  `item_num` mediumint(8) NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `order_score` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_selfform
-- ----------------------------
DROP TABLE IF EXISTS `tp_selfform`;
CREATE TABLE `tp_selfform` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(400) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `time` int(10) NOT NULL DEFAULT '0',
  `successtip` varchar(60) NOT NULL DEFAULT '',
  `failtip` varchar(60) NOT NULL DEFAULT '',
  `endtime` int(10) NOT NULL DEFAULT '0',
  `logourl` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `endtime` (`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_selfform_input
-- ----------------------------
DROP TABLE IF EXISTS `tp_selfform_input`;
CREATE TABLE `tp_selfform_input` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `formid` int(10) NOT NULL DEFAULT '0',
  `displayname` varchar(30) NOT NULL DEFAULT '',
  `fieldname` varchar(30) NOT NULL DEFAULT '',
  `inputtype` varchar(20) NOT NULL DEFAULT '',
  `options` varchar(200) NOT NULL DEFAULT '',
  `require` tinyint(1) NOT NULL DEFAULT '0',
  `regex` varchar(100) NOT NULL DEFAULT '',
  `taxis` mediumint(4) NOT NULL DEFAULT '0',
  `errortip` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `formid` (`formid`,`taxis`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_selfform_value
-- ----------------------------
DROP TABLE IF EXISTS `tp_selfform_value`;
CREATE TABLE `tp_selfform_value` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `formid` int(10) NOT NULL DEFAULT '0',
  `wecha_id` varchar(50) NOT NULL DEFAULT '',
  `values` varchar(2000) NOT NULL DEFAULT '',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `formid` (`formid`,`wecha_id`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for tp_set_tax
-- ----------------------------
DROP TABLE IF EXISTS `tp_set_tax`;
CREATE TABLE `tp_set_tax` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `shoptax` float DEFAULT '0',
  `coupontax` float DEFAULT '0',
  `giftpointtax` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_shop_favi
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_favi`;
CREATE TABLE `tp_shop_favi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `tokenTall` varchar(30) DEFAULT NULL COMMENT '店铺token',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`tokenTall`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_site_plugmenu
-- ----------------------------
DROP TABLE IF EXISTS `tp_site_plugmenu`;
CREATE TABLE `tp_site_plugmenu` (
  `token` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `taxis` mediumint(4) NOT NULL DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(200) DEFAULT NULL,
  KEY `token` (`token`,`taxis`,`display`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_snccode
-- ----------------------------
DROP TABLE IF EXISTS `tp_snccode`;
CREATE TABLE `tp_snccode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `wechaname` varchar(60) NOT NULL,
  `caeatetime` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `token` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_system_info
-- ----------------------------
DROP TABLE IF EXISTS `tp_system_info`;
CREATE TABLE `tp_system_info` (
  `lastsqlupdate` int(10) NOT NULL,
  `version` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_tag
-- ----------------------------
DROP TABLE IF EXISTS `tp_tag`;
CREATE TABLE `tp_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_taobao
-- ----------------------------
DROP TABLE IF EXISTS `tp_taobao`;
CREATE TABLE `tp_taobao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `title` varchar(100) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  `homeurl` varchar(100) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_text
-- ----------------------------
DROP TABLE IF EXISTS `tp_text`;
CREATE TABLE `tp_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(90) NOT NULL,
  `keyword` char(255) NOT NULL,
  `type` varchar(1) NOT NULL,
  `text` text NOT NULL,
  `createtime` varchar(13) NOT NULL,
  `updatetime` varchar(13) NOT NULL,
  `click` int(11) NOT NULL,
  `token` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_token_open
-- ----------------------------
DROP TABLE IF EXISTS `tp_token_open`;
CREATE TABLE `tp_token_open` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(60) NOT NULL,
  `queryname` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_topic
-- ----------------------------
DROP TABLE IF EXISTS `tp_topic`;
CREATE TABLE `tp_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `extra` text NOT NULL,
  `src_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '引用内容类型',
  `src_id` int(10) unsigned NOT NULL COMMENT '引用内容ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0，原创；1，转发；',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  `forwards` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '转发数量',
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_topic_at
-- ----------------------------
DROP TABLE IF EXISTS `tp_topic_at`;
CREATE TABLE `tp_topic_at` (
  `uid` int(10) unsigned NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_topic_comment`;
CREATE TABLE `tp_topic_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `author_uid` int(10) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_topic_index
-- ----------------------------
DROP TABLE IF EXISTS `tp_topic_index`;
CREATE TABLE `tp_topic_index` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `author_id` int(10) unsigned NOT NULL COMMENT '发布者ID',
  `add_time` int(10) unsigned NOT NULL,
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_topic_relation
-- ----------------------------
DROP TABLE IF EXISTS `tp_topic_relation`;
CREATE TABLE `tp_topic_relation` (
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `src_tid` int(10) unsigned NOT NULL COMMENT '被引用信息ID',
  `author_uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '操作类型(1,转发)',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_tousu
-- ----------------------------
DROP TABLE IF EXISTS `tp_tousu`;
CREATE TABLE `tp_tousu` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `cwho` char(10) NOT NULL,
  `cdetail` varchar(1000) NOT NULL,
  `cphone` varchar(11) NOT NULL,
  `cname` char(10) NOT NULL,
  `addtime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_upyun_attachement
-- ----------------------------
DROP TABLE IF EXISTS `tp_upyun_attachement`;
CREATE TABLE `tp_upyun_attachement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `url` varchar(160) NOT NULL,
  `code` varchar(10) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for tp_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `tp_userinfo`;
CREATE TABLE `tp_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  `wechaname` varchar(60) NOT NULL,
  `truename` varchar(60) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `qq` int(11) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `age` int(3) NOT NULL,
  `birthday` varchar(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `info` varchar(200) NOT NULL,
  `total_score` int(11) NOT NULL,
  `sign_score` int(11) NOT NULL,
  `expend_score` int(11) NOT NULL,
  `continuous` int(11) NOT NULL,
  `add_expend` int(11) NOT NULL,
  `add_expend_time` int(11) NOT NULL,
  `live_time` int(11) NOT NULL,
  `getcardtime` bigint(20) NOT NULL DEFAULT '1',
  `shared` varchar(1) NOT NULL DEFAULT 'X',
  `sharedM` varchar(1) NOT NULL DEFAULT 'X',
  `sharedW` varchar(1) NOT NULL DEFAULT 'X',
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_users
-- ----------------------------
DROP TABLE IF EXISTS `tp_users`;
CREATE TABLE `tp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(90) NOT NULL,
  `createtime` varchar(13) NOT NULL,
  `lasttime` varchar(13) NOT NULL,
  `status` varchar(1) NOT NULL,
  `createip` varchar(30) NOT NULL,
  `lastip` varchar(30) NOT NULL,
  `diynum` int(11) NOT NULL,
  `activitynum` int(11) NOT NULL,
  `card_num` int(11) NOT NULL,
  `card_create_status` tinyint(1) NOT NULL,
  `wechat_card_num` mediumint(4) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL,
  `viptime` varchar(13) NOT NULL,
  `connectnum` int(11) NOT NULL DEFAULT '0',
  `lastloginmonth` smallint(2) NOT NULL DEFAULT '0',
  `belonguser` int(11) NOT NULL DEFAULT '0',
  `headerpic` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_address
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_address`;
CREATE TABLE `tp_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `sheng` varchar(50) DEFAULT NULL,
  `shi` varchar(50) DEFAULT NULL,
  `qu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_bind
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_bind`;
CREATE TABLE `tp_user_bind` (
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(60) NOT NULL,
  `keyid` varchar(100) NOT NULL,
  `info` text NOT NULL,
  KEY `uid` (`uid`),
  KEY `uid_type` (`uid`,`type`),
  KEY `type_keyid` (`type`,`keyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_follow`;
CREATE TABLE `tp_user_follow` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `follow_uid` int(10) unsigned NOT NULL COMMENT '被关注者ID',
  `add_time` int(10) unsigned NOT NULL,
  `mutually` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`follow_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_group`;
CREATE TABLE `tp_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `diynum` int(11) NOT NULL,
  `connectnum` int(11) NOT NULL,
  `iscopyright` tinyint(1) NOT NULL,
  `activitynum` int(3) NOT NULL,
  `price` int(11) NOT NULL,
  `statistics_user` int(11) NOT NULL,
  `create_card_num` int(4) NOT NULL,
  `wechat_card_num` int(4) NOT NULL DEFAULT '4',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_msgtip
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_msgtip`;
CREATE TABLE `tp_user_msgtip` (
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:关注，2:提到，3:私信，4:通知',
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_request
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_request`;
CREATE TABLE `tp_user_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(30) NOT NULL,
  `uid` varchar(32) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `msgtype` varchar(15) NOT NULL DEFAULT 'text',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msgtype` (`msgtype`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_stat
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_stat`;
CREATE TABLE `tp_user_stat` (
  `uid` int(10) unsigned NOT NULL,
  `action` varchar(20) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  UNIQUE KEY `uid_type` (`uid`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_user_wetall
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_wetall`;
CREATE TABLE `tp_user_wetall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uc_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1男，0女',
  `tags` varchar(50) NOT NULL COMMENT '个人标签',
  `intro` varchar(500) NOT NULL,
  `byear` smallint(4) unsigned NOT NULL,
  `bmonth` tinyint(2) unsigned NOT NULL,
  `bday` tinyint(2) unsigned NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `score_level` int(10) unsigned NOT NULL DEFAULT '0',
  `cover` varchar(255) NOT NULL,
  `reg_ip` varchar(15) NOT NULL,
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(15) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `shares` int(10) unsigned DEFAULT '0',
  `likes` int(10) unsigned DEFAULT '0',
  `follows` int(10) unsigned DEFAULT '0',
  `fans` int(10) unsigned DEFAULT '0',
  `albums` int(10) unsigned DEFAULT '0',
  `daren` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_voiceresponse
-- ----------------------------
DROP TABLE IF EXISTS `tp_voiceresponse`;
CREATE TABLE `tp_voiceresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(90) NOT NULL,
  `createtime` varchar(13) NOT NULL,
  `uptatetime` varchar(13) NOT NULL,
  `keyword` char(255) NOT NULL,
  `title` varchar(60) NOT NULL,
  `musicurl` char(255) NOT NULL,
  `hqmusicurl` char(255) NOT NULL,
  `description` char(255) NOT NULL,
  `token` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_weather
-- ----------------------------
DROP TABLE IF EXISTS `tp_weather`;
CREATE TABLE `tp_weather` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `code` char(9) NOT NULL,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2502 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wechawall_api
-- ----------------------------
DROP TABLE IF EXISTS `tp_wechawall_api`;
CREATE TABLE `tp_wechawall_api` (
  `token` varchar(20) CHARACTER SET latin1 NOT NULL,
  `email` varchar(200) NOT NULL,
  `url` text,
  `password` varchar(200) NOT NULL,
  `descr` text,
  `imgurl` varchar(180) DEFAULT NULL,
  `tdcode` varchar(180) DEFAULT NULL,
  PRIMARY KEY (`token`),
  UNIQUE KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Table structure for tp_wecha_shop
-- ----------------------------
DROP TABLE IF EXISTS `tp_wecha_shop`;
CREATE TABLE `tp_wecha_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `tokenTall` varchar(20) DEFAULT NULL,
  `weName` varchar(20) DEFAULT NULL,
  `credit` int(11) NOT NULL DEFAULT '0' COMMENT '信誉点数',
  `headurl` varchar(180) DEFAULT NULL,
  `HaveReal` tinyint(4) DEFAULT '0' COMMENT '0-无实体店 1-有实体店',
  `title` varchar(150) DEFAULT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `descr` text,
  `twodcode` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `closeReason` text,
  `licence` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokenTall` (`tokenTall`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wecha_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_wecha_user`;
CREATE TABLE `tp_wecha_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  PRIMARY KEY (`token`,`wecha_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wecha_wall_xunlie
-- ----------------------------
DROP TABLE IF EXISTS `tp_wecha_wall_xunlie`;
CREATE TABLE `tp_wecha_wall_xunlie` (
  `id` varchar(29) NOT NULL,
  `token` varchar(20) DEFAULT NULL,
  `right` char(1) DEFAULT 'X'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tp_weixin_vote
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_vote`;
CREATE TABLE `tp_weixin_vote` (
  `token` varchar(30) CHARACTER SET latin1 NOT NULL,
  `name` varchar(30) NOT NULL,
  `res` int(11) NOT NULL,
  `gameOverFlag` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'Y',
  `heardUrl` varchar(200) DEFAULT NULL,
  `tokenTall` varchar(20) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`token`),
  UNIQUE KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Table structure for tp_wxpay
-- ----------------------------
DROP TABLE IF EXISTS `tp_wxpay`;
CREATE TABLE `tp_wxpay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tokenTall` varchar(30) NOT NULL,
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `appId` varchar(255) NOT NULL COMMENT '公众号身份的唯一标识',
  `paySignKey` varchar(255) NOT NULL COMMENT '公众号支付请求中用于加密的密钥Key',
  `appSecret` varchar(255) NOT NULL,
  `partnerId` varchar(255) NOT NULL COMMENT '财付通商户身份的标识',
  `partnerKey` varchar(255) NOT NULL COMMENT '财付通商户权限密钥Key',
  `notify_url` varchar(255) NOT NULL COMMENT '后台通知url',
  `success_url` varchar(255) NOT NULL COMMENT '前台通知url_成功支付',
  `fail_url` varchar(255) NOT NULL COMMENT '前台通知url_失败支付',
  `cancel_url` varchar(255) NOT NULL COMMENT '前台通知url_取消支付',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wxpay_alarm
-- ----------------------------
DROP TABLE IF EXISTS `tp_wxpay_alarm`;
CREATE TABLE `tp_wxpay_alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) DEFAULT NULL COMMENT '公众号身份的唯一标识',
  `errortype` varchar(255) DEFAULT NULL COMMENT '错误类型',
  `description` varchar(255) DEFAULT NULL COMMENT '错误描述',
  `alarmcontent` varchar(255) DEFAULT NULL COMMENT '错误详情',
  `timestamp` varchar(255) DEFAULT NULL COMMENT '时间戳',
  `appsignature` varchar(255) DEFAULT NULL,
  `signmethod` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wxpay_history
-- ----------------------------
DROP TABLE IF EXISTS `tp_wxpay_history`;
CREATE TABLE `tp_wxpay_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sign_type` varchar(255) DEFAULT NULL COMMENT '签名类型',
  `service_version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `input_charset` varchar(255) DEFAULT NULL COMMENT '字符编码',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  `sign_key_index` int(11) DEFAULT NULL COMMENT '多密钥支持的密钥序号',
  `trade_mode` int(11) DEFAULT NULL COMMENT '交易模式：1-即时到账',
  `trade_state` int(11) DEFAULT NULL COMMENT '支付结果：0—成功',
  `pay_info` varchar(255) DEFAULT NULL COMMENT '支付结果信息，支付成功时为空',
  `partner` varchar(255) DEFAULT NULL COMMENT '商户号',
  `bank_type` varchar(255) DEFAULT NULL COMMENT '银行类型，在微信中使用WX',
  `bank_billno` varchar(255) DEFAULT NULL COMMENT '银行订单号',
  `total_fee` int(11) DEFAULT NULL COMMENT '支付金额，单位为分',
  `fee_type` int(11) DEFAULT NULL COMMENT '币种,1-人民币',
  `notify_id` varchar(255) DEFAULT NULL COMMENT '支付结果通知id',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT '交易号',
  `out_trade_no` varchar(255) DEFAULT NULL COMMENT '商户系统的订单号',
  `attach` varchar(255) DEFAULT NULL COMMENT '商户数据包',
  `time_end` varchar(255) DEFAULT NULL COMMENT '支付完成时间',
  `transport_fee` int(11) DEFAULT NULL COMMENT '物流费用，单位分',
  `product_fee` int(11) DEFAULT NULL COMMENT '物品费用，单位分',
  `discount` int(11) DEFAULT NULL COMMENT '折扣价格，单位分',
  `buyer_alias` varchar(255) DEFAULT NULL COMMENT '买家别名',
  `openid` varchar(255) DEFAULT NULL COMMENT '购买用户',
  `appid` varchar(255) DEFAULT NULL,
  `issubscribe` varchar(255) DEFAULT NULL COMMENT '是否关注',
  `timestamp` varchar(255) DEFAULT NULL COMMENT '时间戳',
  `noncestr` varchar(255) DEFAULT NULL COMMENT '随机串',
  `appsignature` varchar(255) DEFAULT NULL,
  `signmethod` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wxpay_rights
-- ----------------------------
DROP TABLE IF EXISTS `tp_wxpay_rights`;
CREATE TABLE `tp_wxpay_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL COMMENT '购买用户',
  `appid` varchar(255) DEFAULT NULL COMMENT '公众号身份的唯一标识',
  `timestamp` varchar(255) DEFAULT NULL COMMENT '时间戳',
  `msgtype` varchar(255) DEFAULT NULL COMMENT '消息类型',
  `feedbackid` varchar(255) DEFAULT NULL COMMENT '投诉单号',
  `transid` varchar(255) DEFAULT NULL COMMENT '交易号',
  `reason` varchar(255) DEFAULT NULL COMMENT '投诉原因',
  `solution` varchar(255) DEFAULT NULL COMMENT '解决方法',
  `extinfo` varchar(255) DEFAULT NULL COMMENT '备注',
  `appsignature` varchar(255) DEFAULT NULL,
  `signmethod` varchar(255) DEFAULT NULL,
  `picurl` text,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_wxuser
-- ----------------------------
DROP TABLE IF EXISTS `tp_wxuser`;
CREATE TABLE `tp_wxuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `wxid` varchar(20) NOT NULL COMMENT '公众号原始ID',
  `weixin` char(20) NOT NULL COMMENT '微信号',
  `headerpic` char(255) NOT NULL COMMENT '头像地址',
  `token` char(255) NOT NULL,
  `province` varchar(30) NOT NULL COMMENT '省',
  `city` varchar(60) NOT NULL COMMENT '市',
  `qq` char(25) NOT NULL COMMENT '公众号邮箱',
  `wxfans` int(11) NOT NULL COMMENT '微信粉丝',
  `typeid` int(11) NOT NULL COMMENT '分类ID',
  `typename` varchar(90) NOT NULL DEFAULT '0' COMMENT '分类名',
  `tongji` text NOT NULL,
  `allcardnum` int(11) NOT NULL,
  `cardisok` int(11) NOT NULL,
  `yetcardnum` int(11) NOT NULL,
  `totalcardnum` int(11) NOT NULL,
  `createtime` varchar(13) NOT NULL,
  `tpltypeid` varchar(2) NOT NULL DEFAULT '1' COMMENT '默认首页模版ID',
  `updatetime` varchar(13) NOT NULL,
  `tpltypename` varchar(20) NOT NULL COMMENT '首页模版名',
  `tpllistid` varchar(2) NOT NULL COMMENT '列表模版ID',
  `tpllistname` varchar(20) NOT NULL COMMENT '列表模版名',
  `tplcontentid` varchar(2) NOT NULL COMMENT '内容模版ID',
  `tplcontentname` varchar(20) NOT NULL COMMENT '内容模版名',
  `color_id` mediumint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_xitie
-- ----------------------------
DROP TABLE IF EXISTS `tp_xitie`;
CREATE TABLE `tp_xitie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(40) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `opening_animation` varchar(100) DEFAULT NULL,
  `small_pic` varchar(100) DEFAULT NULL,
  `man_name` varchar(20) DEFAULT NULL,
  `girl_name` varchar(20) DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `background_music` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `site_map_2` varchar(100) DEFAULT NULL,
  `site_map_3` varchar(100) DEFAULT NULL,
  `site_map_4` varchar(100) DEFAULT NULL,
  `site_map_5` varchar(100) DEFAULT NULL,
  `site_map_1` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_yuyue
-- ----------------------------
DROP TABLE IF EXISTS `tp_yuyue`;
CREATE TABLE `tp_yuyue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(100) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `topic` varchar(200) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  `statdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_yuyue_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_yuyue_order`;
CREATE TABLE `tp_yuyue_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `token` varchar(40) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `num` int(4) DEFAULT NULL,
  `memo` varchar(200) DEFAULT NULL,
  `type` smallint(4) DEFAULT '0',
  `wecha_id` int(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tp_zhufu
-- ----------------------------
DROP TABLE IF EXISTS `tp_zhufu`;
CREATE TABLE `tp_zhufu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` int(11) NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  `token` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `phone` varchar(30) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
