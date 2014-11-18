-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2014 年 11 月 18 日 10:50
-- 服务器版本: 5.5.32
-- PHP 版本: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `myhuai`
--
CREATE DATABASE IF NOT EXISTS `myhuai` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `myhuai`;

-- --------------------------------------------------------

--
-- 表的结构 `slimstat`
--

CREATE TABLE IF NOT EXISTS `slimstat` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `slimstat`
--

INSERT INTO `slimstat` (`id`, `remote_ip`, `remote_addr`, `country`, `language`, `domain`, `referer`, `searchterms`, `resource`, `user_agent`, `platform`, `browser`, `version`, `visit`, `dt`) VALUES
(1, '::1', '::1', 'Unknown', 'zh-CN', 'localhost', 'http://localhost/', '', '/index.php?m=Users&a=checklogin', '', 'Macintosh', 'Safari', '537.36', 1, 1416210534),
(2, '::1', '::1', 'Unknown', 'zh-CN', 'localhost', 'http://localhost/index.php?m=Users&a=checklogin', '', '/index.php?g=User&m=Index&a=index', '', 'Macintosh', 'Safari', '537.36', 1, 1416210538),
(3, '::1', '::1', 'Unknown', 'zh-CN', 'localhost', 'http://localhost/index.php?g=User&m=Index&a=index', '', '/index.php?g=User&m=Wetall_item&a=&classid=574&token=pjeupf1402729544', '', 'Macintosh', 'Safari', '537.36', 1, 1416210547),
(4, '::1', '::1', 'Unknown', 'zh-CN', 'localhost', 'http://localhost/index.php?g=User&m=Wetall_item&a=&classid=574&token=pjeupf1402729544', '', '/index.php?g=User&m=Wetall_item&a=edit&id=10', '', 'Macintosh', 'Safari', '537.36', 1, 1416210560),
(5, '::1', '::1', 'Unknown', 'zh-CN', 'localhost', 'http://localhost/index.php?g=User&m=Wetall_item&a=edit&id=10', '', '/index.php?g=User&m=Wetall_item&a=get_category', '', 'Macintosh', 'Safari', '537.36', 1, 1416210563),
(6, '::1', '::1', 'Unknown', 'zh-CN', 'localhost', 'http://localhost/index.php?g=User&m=Wetall_item&a=edit&id=10', '', '/index.php?g=User&m=Classify&a=&classid=568&token=pjeupf1402729544', '', 'Macintosh', 'Safari', '537.36', 1, 1416210593),
(7, '::1', '::1', 'Unknown', 'zh-CN', 'localhost', 'http://localhost/index.php?g=User&m=Wetall_item&a=edit&id=10', '', '/index.php?g=User&m=Img&a=&classid=488&token=pjeupf1402729544', '', 'Macintosh', 'Safari', '537.36', 1, 1416210596);

-- --------------------------------------------------------

--
-- 表的结构 `tp_access`
--

CREATE TABLE IF NOT EXISTS `tp_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`,`node_id`),
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_access`
--

INSERT INTO `tp_access` (`role_id`, `node_id`, `pid`, `level`, `module`) VALUES
(10, 90, 84, 2, NULL),
(10, 89, 84, 2, NULL),
(10, 88, 84, 2, NULL),
(9, 47, 46, 3, NULL),
(9, 46, 45, 2, NULL),
(9, 45, 1, 0, NULL),
(9, 1, 0, 1, NULL),
(6, 90, 84, 2, NULL),
(6, 89, 84, 2, NULL),
(6, 88, 84, 2, NULL),
(6, 86, 84, 2, NULL),
(6, 87, 84, 2, NULL),
(6, 84, 1, 0, NULL),
(6, 47, 46, 3, NULL),
(6, 46, 45, 2, NULL),
(6, 45, 1, 0, NULL),
(6, 1, 0, 1, NULL),
(19, 47, 46, 3, NULL),
(19, 46, 45, 2, NULL),
(19, 45, 1, 0, NULL),
(19, 56, 50, 3, NULL),
(19, 55, 50, 3, NULL),
(19, 54, 50, 3, NULL),
(19, 53, 50, 3, NULL),
(19, 52, 50, 3, NULL),
(19, 51, 50, 3, NULL),
(19, 50, 3, 2, NULL),
(5, 95, 84, 2, NULL),
(5, 94, 84, 2, NULL),
(5, 93, 84, 2, NULL),
(5, 92, 84, 2, NULL),
(5, 90, 84, 2, NULL),
(5, 89, 84, 2, NULL),
(5, 88, 84, 2, NULL),
(5, 86, 84, 2, NULL),
(5, 87, 84, 2, NULL),
(5, 84, 1, 0, NULL),
(5, 47, 46, 3, NULL),
(5, 46, 45, 2, NULL),
(5, 45, 1, 0, NULL),
(5, 81, 80, 2, NULL),
(5, 80, 1, 1, NULL),
(5, 56, 50, 3, NULL),
(5, 55, 50, 3, NULL),
(5, 54, 50, 3, NULL),
(5, 53, 50, 3, NULL),
(5, 52, 50, 3, NULL),
(5, 51, 50, 3, NULL),
(5, 50, 3, 2, NULL),
(5, 49, 48, 3, NULL),
(5, 48, 3, 2, NULL),
(5, 31, 25, 3, NULL),
(5, 30, 25, 3, NULL),
(5, 29, 25, 3, NULL),
(5, 28, 25, 3, NULL),
(5, 27, 25, 3, NULL),
(5, 26, 25, 3, NULL),
(5, 25, 3, 2, NULL),
(5, 24, 18, 3, NULL),
(5, 23, 18, 3, NULL),
(5, 22, 18, 3, NULL),
(5, 21, 18, 3, NULL),
(5, 20, 18, 3, NULL),
(5, 19, 18, 3, NULL),
(5, 18, 3, 2, NULL),
(5, 3, 1, 0, NULL),
(5, 17, 11, 3, NULL),
(5, 16, 11, 3, NULL),
(5, 15, 11, 3, NULL),
(5, 14, 11, 3, NULL),
(5, 13, 11, 3, NULL),
(5, 12, 11, 3, NULL),
(5, 11, 2, 2, NULL),
(5, 83, 6, 3, NULL),
(5, 32, 6, 3, NULL),
(5, 10, 6, 3, NULL),
(5, 9, 6, 3, NULL),
(5, 8, 6, 3, NULL),
(10, 86, 84, 2, NULL),
(10, 87, 84, 2, NULL),
(10, 84, 1, 0, NULL),
(10, 47, 46, 3, NULL),
(10, 46, 45, 2, NULL),
(10, 45, 1, 0, NULL),
(10, 81, 80, 2, NULL),
(10, 80, 1, 1, NULL),
(10, 37, 35, 3, NULL),
(10, 36, 35, 3, NULL),
(10, 63, 60, 3, NULL),
(10, 62, 60, 3, NULL),
(10, 61, 60, 3, NULL),
(10, 60, 5, 2, NULL),
(10, 59, 57, 3, NULL),
(10, 58, 57, 3, NULL),
(10, 57, 5, 2, NULL),
(10, 42, 38, 3, NULL),
(10, 41, 38, 3, NULL),
(10, 40, 38, 3, NULL),
(10, 39, 38, 3, NULL),
(10, 38, 5, 2, NULL),
(10, 5, 1, 0, NULL),
(10, 56, 50, 3, NULL),
(10, 55, 50, 3, NULL),
(10, 54, 50, 3, NULL),
(10, 53, 50, 3, NULL),
(10, 52, 50, 3, NULL),
(10, 51, 50, 3, NULL),
(10, 50, 3, 2, NULL),
(10, 49, 48, 3, NULL),
(10, 48, 3, 2, NULL),
(10, 24, 18, 3, NULL),
(10, 23, 18, 3, NULL),
(10, 22, 18, 3, NULL),
(10, 21, 18, 3, NULL),
(10, 20, 18, 3, NULL),
(10, 19, 18, 3, NULL),
(10, 18, 3, 2, NULL),
(10, 3, 1, 0, NULL),
(10, 79, 73, 3, NULL),
(10, 78, 73, 3, NULL),
(10, 77, 73, 3, NULL),
(10, 76, 73, 3, NULL),
(10, 75, 73, 3, NULL),
(10, 74, 73, 3, NULL),
(10, 73, 4, 2, NULL),
(10, 72, 66, 3, NULL),
(10, 71, 66, 3, NULL),
(10, 70, 66, 3, NULL),
(10, 69, 66, 3, NULL),
(10, 68, 66, 3, NULL),
(10, 67, 66, 3, NULL),
(10, 66, 4, 2, NULL),
(10, 65, 64, 3, NULL),
(10, 64, 4, 2, NULL),
(10, 4, 1, 0, NULL),
(10, 1, 0, 1, NULL),
(5, 7, 6, 3, NULL),
(5, 6, 2, 2, NULL),
(5, 2, 1, 0, NULL),
(5, 1, 0, 1, NULL),
(11, 37, 35, 3, NULL),
(11, 36, 35, 3, NULL),
(11, 35, 1, 0, NULL),
(11, 1, 0, 1, NULL),
(11, 84, 1, 0, NULL),
(11, 87, 84, 2, NULL),
(11, 86, 84, 2, NULL),
(11, 88, 84, 2, NULL),
(11, 89, 84, 2, NULL),
(11, 90, 84, 2, NULL),
(11, 92, 84, 2, NULL),
(11, 93, 84, 2, NULL),
(11, 94, 84, 2, NULL),
(11, 95, 84, 2, NULL),
(12, 95, 84, 2, NULL),
(12, 94, 84, 2, NULL),
(12, 93, 84, 2, NULL),
(12, 92, 84, 2, NULL),
(12, 90, 84, 2, NULL),
(12, 88, 84, 2, NULL),
(12, 86, 84, 2, NULL),
(12, 87, 84, 2, NULL),
(12, 84, 1, 0, NULL),
(12, 47, 46, 3, NULL),
(12, 46, 45, 2, NULL),
(12, 45, 1, 0, NULL),
(12, 81, 80, 2, NULL),
(12, 80, 1, 1, NULL),
(12, 37, 35, 3, NULL),
(12, 36, 35, 3, NULL),
(12, 35, 1, 0, NULL),
(12, 63, 60, 3, NULL),
(12, 62, 60, 3, NULL),
(12, 61, 60, 3, NULL),
(12, 60, 5, 2, NULL),
(12, 59, 57, 3, NULL),
(12, 58, 57, 3, NULL),
(12, 57, 5, 2, NULL),
(12, 42, 38, 3, NULL),
(12, 41, 38, 3, NULL),
(12, 40, 38, 3, NULL),
(12, 39, 38, 3, NULL),
(12, 38, 5, 2, NULL),
(12, 5, 1, 0, NULL),
(12, 56, 50, 3, NULL),
(12, 55, 50, 3, NULL),
(12, 54, 50, 3, NULL),
(12, 53, 50, 3, NULL),
(12, 52, 50, 3, NULL),
(12, 51, 50, 3, NULL),
(12, 50, 3, 2, NULL),
(12, 49, 48, 3, NULL),
(12, 48, 3, 2, NULL),
(12, 3, 1, 0, NULL),
(12, 79, 73, 3, NULL),
(12, 78, 73, 3, NULL),
(12, 77, 73, 3, NULL),
(12, 76, 73, 3, NULL),
(12, 75, 73, 3, NULL),
(12, 74, 73, 3, NULL),
(12, 73, 4, 2, NULL),
(12, 72, 66, 3, NULL),
(12, 71, 66, 3, NULL),
(12, 70, 66, 3, NULL),
(12, 69, 66, 3, NULL),
(12, 68, 66, 3, NULL),
(12, 67, 66, 3, NULL),
(12, 66, 4, 2, NULL),
(12, 65, 64, 3, NULL),
(12, 64, 4, 2, NULL),
(12, 4, 1, 0, NULL),
(12, 1, 0, 1, NULL),
(13, 47, 46, 3, NULL),
(13, 46, 45, 2, NULL),
(13, 45, 1, 0, NULL),
(13, 81, 80, 2, NULL),
(13, 80, 1, 1, NULL),
(13, 37, 35, 3, NULL),
(13, 36, 35, 3, NULL),
(13, 35, 1, 0, NULL),
(13, 62, 60, 3, NULL),
(13, 63, 60, 3, NULL),
(13, 1, 0, 1, NULL),
(13, 3, 1, 0, NULL),
(13, 48, 3, 2, NULL),
(13, 49, 48, 3, NULL),
(13, 50, 3, 2, NULL),
(13, 51, 50, 3, NULL),
(13, 52, 50, 3, NULL),
(13, 53, 50, 3, NULL),
(13, 54, 50, 3, NULL),
(13, 55, 50, 3, NULL),
(13, 56, 50, 3, NULL),
(13, 5, 1, 0, NULL),
(13, 38, 5, 2, NULL),
(13, 39, 38, 3, NULL),
(13, 40, 38, 3, NULL),
(13, 41, 38, 3, NULL),
(13, 42, 38, 3, NULL),
(13, 57, 5, 2, NULL),
(13, 58, 57, 3, NULL),
(13, 59, 57, 3, NULL),
(13, 60, 5, 2, NULL),
(13, 61, 60, 3, NULL),
(19, 3, 1, 0, NULL),
(19, 1, 0, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tp_account_bill_dtl`
--

CREATE TABLE IF NOT EXISTS `tp_account_bill_dtl` (
  `billnum` varchar(50) NOT NULL COMMENT '账单单号',
  `itemno` int(11) NOT NULL COMMENT '明细号',
  `orderId` varchar(50) NOT NULL COMMENT '订单号',
  `goods_sumPrice` decimal(10,2) NOT NULL COMMENT '商品总额',
  `order_sumPrice` decimal(10,2) NOT NULL COMMENT '订单总额',
  PRIMARY KEY (`billnum`,`itemno`),
  UNIQUE KEY `billnum` (`billnum`,`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_account_bill_mst`
--

CREATE TABLE IF NOT EXISTS `tp_account_bill_mst` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_account_setting`
--

CREATE TABLE IF NOT EXISTS `tp_account_setting` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `bankname` varchar(200) NOT NULL COMMENT '银行名称',
  `account` varchar(100) NOT NULL COMMENT '银行账号',
  `payee` varchar(255) NOT NULL COMMENT '收款人',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `tokenTall` varchar(20) NOT NULL DEFAULT '' COMMENT '商家token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_ad`
--

CREATE TABLE IF NOT EXISTS `tp_ad` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `tp_ad`
--

INSERT INTO `tp_ad` (`id`, `board_id`, `type`, `name`, `url`, `content`, `extimg`, `extval`, `desc`, `start_time`, `end_time`, `clicks`, `add_time`, `ordid`, `status`, `checkstatus`, `tokenTall`) VALUES
(2, 1, 'image', '正品包邮阿迪达斯2014新款男女式耐磨透气跑步鞋D66861缓冲运动鞋', 'http://www.163.com/special/0077450P/login_frame.html', '/Uploads/image/20140512/53704c82ee904.jpg', '/wxshoppingmall/SRC/Uploads/image/20140429/535f4bf2e21b3.png', '', '', 1398182400, 1398355200, 0, 0, 255, 1, 0, 'labnkv1398317973'),
(4, 1, 'image', '巧诗尚迪 2014夏季新款高档真丝连衣裙 短袖印花桑蚕丝中年女装', 'http://www.slweinxin.com/index.php?g=User&m=Wetall_ad&a=edit&id=4', '/Uploads/image/20140512/53704ca4f289b.jpg', '', '', '巧诗尚迪 2014夏季新款高档真丝连衣裙 短袖印花桑蚕丝中年女装', 1398700800, 1398787200, 0, 0, 255, 1, 0, 'labnkv1398317973'),
(5, 1, 'image', '广告1', 'http://www.slweinxin.com/index.php?g=Home&m=Index&a=about', '/Uploads/image/20140510/536e52320b553.jpg', '', '', '精彩无限', 1399737600, 1399824000, 0, 0, 255, 1, 0, 'rmzthc1399729257');

-- --------------------------------------------------------

--
-- 表的结构 `tp_adboard`
--

CREATE TABLE IF NOT EXISTS `tp_adboard` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tpl` varchar(20) NOT NULL,
  `width` smallint(5) NOT NULL,
  `height` smallint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `tp_adboard`
--

INSERT INTO `tp_adboard` (`id`, `name`, `tpl`, `width`, `height`, `description`, `status`) VALUES
(1, '首页焦点图', 'indexfocus', 730, 395, '小图调用扩展图', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_address`
--

CREATE TABLE IF NOT EXISTS `tp_address` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tp_address`
--

INSERT INTO `tp_address` (`id`, `contacts`, `Province`, `City`, `Area`, `address`, `postcode`, `mobile`, `phone`, `name`, `isno`, `status`, `ordid`, `tokenTall`) VALUES
(1, '22', '北京市', '市辖区', '东城区', '3', '', '', '', '', '1', 1, 255, 'labnkv1398317973'),
(2, 'q', '天津市', '市辖区', '和平区', 'b', 'c', 'd', 'e', 'f', '0', 1, 255, 'labnkv1398317973');

-- --------------------------------------------------------

--
-- 表的结构 `tp_adforhome`
--

CREATE TABLE IF NOT EXISTS `tp_adforhome` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_adma`
--

CREATE TABLE IF NOT EXISTS `tp_adma` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin`
--

CREATE TABLE IF NOT EXISTS `tp_admin` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_admin`
--

INSERT INTO `tp_admin` (`id`, `username`, `password`, `role_id`, `last_ip`, `last_time`, `email`, `status`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '58.246.228.194', 1400071603, '123456@qq.com', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin_auth`
--

CREATE TABLE IF NOT EXISTS `tp_admin_auth` (
  `role_id` tinyint(3) NOT NULL,
  `menu_id` smallint(6) NOT NULL,
  KEY `role_id` (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin_role`
--

CREATE TABLE IF NOT EXISTS `tp_admin_role` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `ordid` tinyint(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tp_admin_role`
--

INSERT INTO `tp_admin_role` (`id`, `name`, `remark`, `ordid`, `status`) VALUES
(1, '超级管理员', '超级管理员', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_album`
--

CREATE TABLE IF NOT EXISTS `tp_album` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_album_cate`
--

CREATE TABLE IF NOT EXISTS `tp_album_cate` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_album_comment`
--

CREATE TABLE IF NOT EXISTS `tp_album_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_album_follow`
--

CREATE TABLE IF NOT EXISTS `tp_album_follow` (
  `uid` int(10) NOT NULL,
  `album_id` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  UNIQUE KEY `uid` (`uid`,`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_album_item`
--

CREATE TABLE IF NOT EXISTS `tp_album_item` (
  `album_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `intro` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`album_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_alipay`
--

CREATE TABLE IF NOT EXISTS `tp_alipay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付宝名称',
  `partner` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '合作身份者id',
  `key` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '安全检验码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `tp_alipay`
--

INSERT INTO `tp_alipay` (`id`, `alipayname`, `partner`, `key`) VALUES
(21, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tp_alipay_biz`
--

CREATE TABLE IF NOT EXISTS `tp_alipay_biz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) DEFAULT NULL COMMENT '支付宝名称',
  `partner` varchar(100) DEFAULT NULL COMMENT '合作身份者id',
  `key` varchar(100) DEFAULT NULL COMMENT '安全检验码',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_alipay_config`
--

CREATE TABLE IF NOT EXISTS `tp_alipay_config` (
  `token` varchar(60) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `pid` varchar(40) NOT NULL DEFAULT '',
  `key` varchar(60) NOT NULL DEFAULT '',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_alipay_person`
--

CREATE TABLE IF NOT EXISTS `tp_alipay_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) DEFAULT NULL COMMENT '支付宝名称',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_alipay_person`
--

INSERT INTO `tp_alipay_person` (`id`, `alipayname`, `tokenTall`) VALUES
(1, 'alipay@alipay.com', 'labnkv1398317973');

-- --------------------------------------------------------

--
-- 表的结构 `tp_api`
--

CREATE TABLE IF NOT EXISTS `tp_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(60) NOT NULL,
  `url` varchar(100) NOT NULL,
  `number` tinyint(1) NOT NULL,
  `order` tinyint(1) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_application`
--

CREATE TABLE IF NOT EXISTS `tp_application` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_areply`
--

CREATE TABLE IF NOT EXISTS `tp_areply` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tp_areply`
--

INSERT INTO `tp_areply` (`id`, `keyword`, `content`, `uid`, `uname`, `createtime`, `updatetime`, `token`, `home`) VALUES
(4, '首页显示', '', 6, '', '1402731977', '1410253216', 'pjeupf1402729544', '1');

-- --------------------------------------------------------

--
-- 表的结构 `tp_arrearage_people`
--

CREATE TABLE IF NOT EXISTS `tp_arrearage_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `company` varchar(200) DEFAULT NULL,
  `qianjiao_money` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_article`
--

CREATE TABLE IF NOT EXISTS `tp_article` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_article_cate`
--

CREATE TABLE IF NOT EXISTS `tp_article_cate` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_article_new`
--

CREATE TABLE IF NOT EXISTS `tp_article_new` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) NOT NULL,
  `business_id` int(5) NOT NULL,
  `name` varchar(200) NOT NULL,
  `img` varchar(255) NOT NULL,
  `tuijian` smallint(1) NOT NULL DEFAULT '0',
  `info` text,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tp_article_new`
--

INSERT INTO `tp_article_new` (`id`, `cate_id`, `business_id`, `name`, `img`, `tuijian`, `info`, `add_time`) VALUES
(2, 17, 1, '测试资讯2', '/Uploads/image/20141117/5469661c14d7a.png', 1, '资讯测试中……', 1416193573);

-- --------------------------------------------------------

--
-- 表的结构 `tp_article_page`
--

CREATE TABLE IF NOT EXISTS `tp_article_page` (
  `cate_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL,
  `info` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_article_wetall`
--

CREATE TABLE IF NOT EXISTS `tp_article_wetall` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_auto_user`
--

CREATE TABLE IF NOT EXISTS `tp_auto_user` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `users` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_background`
--

CREATE TABLE IF NOT EXISTS `tp_background` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `img` char(255) NOT NULL,
  `info` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `tp_background`
--

INSERT INTO `tp_background` (`id`, `token`, `img`, `info`) VALUES
(1, 'labnkv1398317973', '/wxshoppingmall/SRC/Uploads/image/20140505/5366e87d6acda.jpg', '去去去'),
(2, 'rmzthc1399729257', '/Uploads/image/20140510/536e314b27a2d.jpg', '1'),
(13, 'kaybwr1401157066', '/Uploads/image/20140527/538466bd75d75.jpg', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_badword`
--

CREATE TABLE IF NOT EXISTS `tp_badword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：禁用；2：替换；3：审核',
  `badword` varchar(100) NOT NULL,
  `replaceword` varchar(100) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_brandlist`
--

CREATE TABLE IF NOT EXISTS `tp_brandlist` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `tp_brandlist`
--

INSERT INTO `tp_brandlist` (`id`, `name`, `status`, `ordid`, `tokenTall`) VALUES
(1, '耐克', 1, 0, 'labnkv1398317973'),
(4, '阿迪达斯', 1, 255, 'labnkv1398317973'),
(7, '彪马', 1, 255, 'labnkv1398317973'),
(8, '86测试款', 1, 255, 'rmzthc1399729257');

-- --------------------------------------------------------

--
-- 表的结构 `tp_business`
--

CREATE TABLE IF NOT EXISTS `tp_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(100) NOT NULL,
  `b_uname` varchar(20) NOT NULL,
  `b_phone` varchar(11) NOT NULL,
  `b_address` varchar(200) NOT NULL,
  `b_bankName` varchar(20) NOT NULL,
  `b_bankNum` varchar(19) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_business`
--

INSERT INTO `tp_business` (`id`, `b_name`, `b_uname`, `b_phone`, `b_address`, `b_bankName`, `b_bankNum`) VALUES
(1, '杭州阿里巴巴集团', '马云', '13801523232', '杭州九堡健康路50号', '中国招商银行', '622800256548526');

-- --------------------------------------------------------

--
-- 表的结构 `tp_business_item_order`
--

CREATE TABLE IF NOT EXISTS `tp_business_item_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `businessId` int(10) NOT NULL COMMENT '商家id',
  `orderId` varchar(50) NOT NULL,
  `itemId` int(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已结算',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_call`
--

CREATE TABLE IF NOT EXISTS `tp_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(60) CHARACTER SET latin1 NOT NULL,
  `phone_account` varchar(50) CHARACTER SET latin1 NOT NULL,
  `phone_password` varchar(50) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_canyu`
--

CREATE TABLE IF NOT EXISTS `tp_canyu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` int(11) NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  `token` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `number` int(11) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_case`
--

CREATE TABLE IF NOT EXISTS `tp_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `url` char(255) NOT NULL,
  `img` char(200) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_category`
--

CREATE TABLE IF NOT EXISTS `tp_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `catname` varchar(50) NOT NULL,
  `linkurl` varchar(255) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `parentid` int(10) NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `outlinkurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `tp_category`
--

INSERT INTO `tp_category` (`id`, `catname`, `linkurl`, `level`, `parentid`, `arrparentid`, `picurl`, `outlinkurl`) VALUES
(1, '手机', 'www.shouji.com', 1, 0, '0', 'aa', 'dd'),
(2, '蔬菜', 'www.shucai.com', 2, 0, '0', 'bb', NULL),
(3, 'apple', 'www.linkurl.com', 1, 1, '0,1', 'vv', ''),
(4, '菠菜', 'www.bocai.com', 1, 2, '0,2', 'cc', NULL),
(5, '三星', 'www.sanxing.com', 2, 1, '0,1', 'dd', NULL),
(6, '空心菜', 'www.kongxin.com', 2, 2, '0,2', 'ee', NULL),
(14, '小菠菜', 'www.xiaobaocai.com', 1, 4, '0,2,4', '/Uploads/image/20141112/5462c57b088ae.png', ''),
(15, 'iphone6', 'www.w.com', 3, 3, '0,1,3', NULL, NULL),
(17, '空心菜三级', 'www.kongxincai.com', 2, 6, '0,2,6', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tp_classify`
--

CREATE TABLE IF NOT EXISTS `tp_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `info` varchar(90) NOT NULL COMMENT '分类描述',
  `sorts` varchar(6) NOT NULL COMMENT '显示顺序',
  `img` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `token` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=114 ;

--
-- 转存表中的数据 `tp_classify`
--

INSERT INTO `tp_classify` (`id`, `name`, `info`, `sorts`, `img`, `url`, `status`, `token`) VALUES
(110, '就医资讯', '就医 资讯', '1', '', '', '0', 'pjeupf1402729544'),
(111, '专家观点', '专家观点', '1', '', '', '1', 'pjeupf1402729544'),
(112, '绿色通道', '绿色通道', '1', '', '', '1', 'pjeupf1402729544'),
(113, '公司 新闻', '公司 新闻', '1', '', '', '1', 'pjeupf1402729544');

-- --------------------------------------------------------

--
-- 表的结构 `tp_comments`
--

CREATE TABLE IF NOT EXISTS `tp_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `comments_type` int(3) unsigned NOT NULL,
  `user_comments` varchar(1024) DEFAULT NULL,
  `create_time` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_comments_copy`
--

CREATE TABLE IF NOT EXISTS `tp_comments_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `user_name` varchar(64) NOT NULL,
  `comments_type` int(3) unsigned NOT NULL,
  `user_comments` varchar(1024) DEFAULT NULL,
  `create_time` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_company`
--

CREATE TABLE IF NOT EXISTS `tp_company` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_custom_menu`
--

CREATE TABLE IF NOT EXISTS `tp_custom_menu` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_delivery`
--

CREATE TABLE IF NOT EXISTS `tp_delivery` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `tp_delivery`
--

INSERT INTO `tp_delivery` (`id`, `name`, `status`, `ordid`, `tokenTall`) VALUES
(1, 'EMS', 1, 0, 'labnkv1398317973'),
(2, '中通速递', 1, 0, 'labnkv1398317973'),
(3, '圆通速递', 1, 0, 'labnkv1398317973'),
(4, '汇通快运', 1, 0, 'labnkv1398317973'),
(5, '申通快递', 1, 0, 'labnkv1398317973'),
(6, '韵达快运', 1, 0, 'labnkv1398317973'),
(7, '顺丰速运', 1, 0, 'labnkv1398317973'),
(12, '顺丰速递', 1, 1, 'labnkv1398317973'),
(13, '圆通快递', 1, 2, 'labnkv1398317973'),
(15, '申通', 1, 255, 'rmzthc1399729257'),
(16, '圆通', 1, 255, 'rmzthc1399729257');

-- --------------------------------------------------------

--
-- 表的结构 `tp_diymen_class`
--

CREATE TABLE IF NOT EXISTS `tp_diymen_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `url` varchar(180) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `tp_diymen_class`
--

INSERT INTO `tp_diymen_class` (`id`, `token`, `pid`, `title`, `keyword`, `is_show`, `sort`, `url`) VALUES
(2, 'pjeupf1402729544', 2, '开发区简介', '', 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_diymen_set`
--

CREATE TABLE IF NOT EXISTS `tp_diymen_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `appid` varchar(18) NOT NULL,
  `appsecret` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_diymen_set`
--

INSERT INTO `tp_diymen_set` (`id`, `token`, `appid`, `appsecret`) VALUES
(1, 'pjeupf1402729544', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_dream`
--

CREATE TABLE IF NOT EXISTS `tp_dream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- 转存表中的数据 `tp_dream`
--

INSERT INTO `tp_dream` (`id`, `title`, `content`) VALUES
(1, '梦见父母', '梦见自己成了幼儿与父母相处  幸运的事情即将发生。可以尝到美昧可口的咖啡、得到电影招待券等等。你将不觉莞尔一笑。梦见和父母快乐地有说有笑  家中将起波澜。对父母将感觉厌烦，会有离家出走的行为。你还未成年，不要因轻率急躁而遗恨终身，要多多自重。梦见父母离婚  朋友运不如意。你无心的一句话，将引起误解。如果置之不理，朋友将离你而去，要设法解释清楚才好。梦见受母亲疼爱  在爱情方面将有乐事。约会的地方最好尽量选择幽静的地方，诸如图书馆、博物馆、黄昏的公园等等。梦见被父亲大骂一顿  健康方面有不良征兆。尤其要注意的是意外事故，在上下车、横穿车道时要特别小心哪。梦见离开父母而成孤苦伶仃  爱情方面将有很大的幸运。如果有意中人，不必迟疑可以进攻，绝对不会被封杀出局。因为这是梦中注定的'),
(2, '梦见护士', ' 已婚女子梦见护士  不久会怀孕，得贵子。 少女梦见有一群美貌的护士  很快要出嫁。 少女梦见和护士争吵  婚事不顺利，迟迟不能出嫁。 病人梦见护士  痛苦很快要过去。');

-- --------------------------------------------------------

--
-- 表的结构 `tp_flash`
--

CREATE TABLE IF NOT EXISTS `tp_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `img` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `info` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `tp_flash`
--

INSERT INTO `tp_flash` (`id`, `token`, `img`, `url`, `info`) VALUES
(51, 'pjeupf1402729544', '/Uploads/image/20141020/5444b38f44aa3.png', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_flink`
--

CREATE TABLE IF NOT EXISTS `tp_flink` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `cate_id` smallint(5) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_flink_cate`
--

CREATE TABLE IF NOT EXISTS `tp_flink_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_follow`
--

CREATE TABLE IF NOT EXISTS `tp_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follow_form_id` varchar(100) NOT NULL,
  `follow_to_id` varchar(100) NOT NULL,
  `follow_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=257 ;

--
-- 转存表中的数据 `tp_follow`
--

INSERT INTO `tp_follow` (`id`, `follow_form_id`, `follow_to_id`, `follow_time`) VALUES
(1, 'otZyJjv-9sStefX3uYRH3EQx45oc', 'gh_9fa5181bb0af', 1399697379),
(2, 'otZyJjgWlO5jZJfO_zvW_qtzv4hE', 'gh_9fa5181bb0af', 1399698147),
(3, 'otZyJjpb7Lm-3cQWoVlBbzvBE3mY', 'gh_9fa5181bb0af', 1399698635),
(4, 'otZyJjqfRQPn4OimXaumLnkVwCyY', 'gh_9fa5181bb0af', 1399699330),
(5, 'otZyJjqfRQPn4OimXaumLnkVwCyY', 'gh_9fa5181bb0af', 1399699330),
(6, 'otZyJjorOegx87iTusseDk9-tsg4', 'gh_9fa5181bb0af', 1399703293),
(7, 'otZyJjs6mOI45kQPQO1D4h4ve1uw', 'gh_9fa5181bb0af', 1399705085),
(8, 'otZyJjs6mOI45kQPQO1D4h4ve1uw', 'gh_9fa5181bb0af', 1399705085),
(9, 'otZyJjgGUY-VlTh6kQBMpyqaGU-c', 'gh_9fa5181bb0af', 1399707563),
(10, 'otZyJjvtVWHAXCEukFFmncaENbXI', 'gh_9fa5181bb0af', 1399708011),
(11, 'otZyJjvtVWHAXCEukFFmncaENbXI', 'gh_9fa5181bb0af', 1399708011),
(12, 'o3IQEuLF6g9MJmW2Kwnau5ACjNdw', 'gh_ec40c2ae850e', 1399708483),
(13, 'otZyJjhQKhJOF95gsWS_qMbJdpaA', 'gh_9fa5181bb0af', 1399709750),
(14, 'otZyJjrABvnNc2iGCp2OcB8Yfp4c', 'gh_9fa5181bb0af', 1399718011),
(15, 'otZyJjoGztRSfcHFQ23a1SMSBFWA', 'gh_9fa5181bb0af', 1399719919),
(16, 'otZyJjjEHFPgn45jleQTh2x3Tg2k', 'gh_9fa5181bb0af', 1399720833),
(17, 'otZyJjjEHFPgn45jleQTh2x3Tg2k', 'gh_9fa5181bb0af', 1399720833),
(18, 'otZyJjt2quKggfeI4vLBG8ajOo8Q', 'gh_9fa5181bb0af', 1399724249),
(19, 'otZyJjpO3w_SCbR8vbLws0LzyKDQ', 'gh_9fa5181bb0af', 1399724417),
(20, 'otZyJjqRfpLl5RQ7IHj5bFsr65BY', 'gh_9fa5181bb0af', 1399725268),
(21, 'otZyJjgog8CM9zb8BdBHbA6FsCwQ', 'gh_9fa5181bb0af', 1399726940),
(22, 'otZyJjvcwhn9jdCZ5I0tu14OR8Xs', 'gh_9fa5181bb0af', 1399729175),
(23, 'otZyJjjfSJU3KjTbDsM023i5EX-A', 'gh_9fa5181bb0af', 1399730787),
(25, 'o9M9_t4GUYk9BpndgfPuSj8nF-t0', 'gh_f806db7a5ffc', 1399731172),
(26, 'otZyJjrcTsCZOug2VvOW5vVCByq8', 'gh_9fa5181bb0af', 1399733471),
(27, 'otZyJjqYpAHbEcoOY_ixHUvWqvVg', 'gh_9fa5181bb0af', 1399734550),
(28, 'otZyJjtQYmJSS5X8PCBVq8E31f8g', 'gh_9fa5181bb0af', 1399735233),
(29, 'otZyJjorH1R5oSLmi8Pr_mklu-AU', 'gh_9fa5181bb0af', 1399735502),
(30, 'otZyJjjc8IXTkXWunvohyz5xhkUQ', 'gh_9fa5181bb0af', 1399738033),
(31, 'otZyJjsWYrknJZm93KX2ZdpIq2U0', 'gh_9fa5181bb0af', 1399739331),
(32, 'otZyJjswMLxPJGDmqT5jNChngtlg', 'gh_9fa5181bb0af', 1399759829),
(33, 'otZyJjp9xdX-e7_v2dEeQWnZ3I_0', 'gh_9fa5181bb0af', 1399764259),
(34, 'otZyJjlCJkU_cM9OlyfjLL6gA1_Y', 'gh_9fa5181bb0af', 1399766899),
(36, 'otZyJjne_BIxVs1N44N-rOCBHEvM', 'gh_9fa5181bb0af', 1399768308),
(37, 'otZyJjhPYIPRFBLIWs7UF-wKoULk', 'gh_9fa5181bb0af', 1399769271),
(38, 'otZyJjvQirRMvJs9keqIrhvT-Dco', 'gh_9fa5181bb0af', 1399769635),
(39, 'otZyJjqnd0uVwOXrG-kp0eN-MR7o', 'gh_9fa5181bb0af', 1399769912),
(40, 'otZyJjm9_1KFeq0yvqJrfD-TzPwM', 'gh_9fa5181bb0af', 1399771459),
(41, 'otZyJjoS51JJfWVtDs7DMJZmrrbo', 'gh_9fa5181bb0af', 1399773460),
(42, 'oIBMCuNptW1iXWtU0zJXi7H7SsO0', 'gh_8154d3ddaa39', 1399774952),
(43, 'oeiNDuLuQQnvZy0mQlKULSkqQBYg', 'gh_eddff0b6d304', 1399775102),
(44, 'otZyJjj-Jakd_7TzKKv7yEvA3DHg', 'gh_9fa5181bb0af', 1399777496),
(99, 'otZyJjt88sJafCe2N1izz3J23CdU', 'gh_9fa5181bb0af', 1399982710),
(46, 'otZyJjgggfTbqpVfGxxpjMXZx4I4', 'gh_9fa5181bb0af', 1399787245),
(47, 'otZyJjtsmh0rX6r1j_TciVDk8kRQ', 'gh_9fa5181bb0af', 1399796168),
(48, 'otZyJjsQjrBeRnz1s-mpN9Q8wnWo', 'gh_9fa5181bb0af', 1399797976),
(49, 'oeiNDuMXP5BlxgSaf6ePcBOf-exk', 'gh_eddff0b6d304', 1399806198),
(50, 'otZyJjoFJLT9jgvSbsn06YSorr98', 'gh_9fa5181bb0af', 1399806716),
(51, 'otZyJjrxB2YBV70d9nXfFlnlq9zw', 'gh_9fa5181bb0af', 1399812924),
(52, 'otZyJjjTk1twQkUTX_CXFIcD6EKE', 'gh_9fa5181bb0af', 1399816290),
(53, 'otZyJjm7ny2apbxXii6PgOsm4CNA', 'gh_9fa5181bb0af', 1399820527),
(54, 'otZyJjoiztjevVGkbD4dyEMsRbNI', 'gh_9fa5181bb0af', 1399820877),
(55, 'otZyJjnbh0huEL4GafEZBOokvXo4', 'gh_9fa5181bb0af', 1399822801),
(56, 'otZyJjiPy3PNSdhOr9gsWc2t6caA', 'gh_9fa5181bb0af', 1399822963),
(57, 'otZyJjmQsQU656tRaUszbUAbPLFE', 'gh_9fa5181bb0af', 1399823476),
(58, 'otZyJjtBJG0sjWg53kyYF4fjpi4k', 'gh_9fa5181bb0af', 1399838548),
(59, 'otZyJjlEsRStHofMLgYHWfcqN0K8', 'gh_9fa5181bb0af', 1399858889),
(60, 'otZyJjhHlNIML24jKsb5iEGSfcSc', 'gh_9fa5181bb0af', 1399859531),
(61, 'oeiNDuKSa1Op4H9Druw76rijJwzg', 'gh_eddff0b6d304', 1399862374),
(62, 'otZyJjq4OiVyufD2rtKku-J38_P4', 'gh_9fa5181bb0af', 1399867020),
(63, 'otZyJjkQ0HBpr6y_8W7cyATlx8Gs', 'gh_9fa5181bb0af', 1399867203),
(64, 'otZyJjl64jmgJy2hiqHrCw3xUVmk', 'gh_9fa5181bb0af', 1399867802),
(65, 'otZyJjuQ8NFV2BaIJ5EYLsq-8yoQ', 'gh_9fa5181bb0af', 1399869934),
(66, 'otZyJjkr4vLoGSXuo6j8bMjzJtf8', 'gh_9fa5181bb0af', 1399874459),
(67, 'otZyJjp7Yb2BSyfWd3LI1peb6J0A', 'gh_9fa5181bb0af', 1399874489),
(71, 'otZyJjhtPTwNX_Tu4NJcyv9IW9oQ', 'gh_9fa5181bb0af', 1399882817),
(70, 'otZyJjhH7vakEbGAEtD-lt_m-cVU', 'gh_9fa5181bb0af', 1399880864),
(72, 'otZyJjsnO_eTD4qNQUeGr-gA8OFU', 'gh_9fa5181bb0af', 1399884109),
(73, 'otZyJjpuR9UBowmQ5EKysqEW-mQ8', 'gh_9fa5181bb0af', 1399884867),
(74, 'otZyJjtyaAy2kbJvRaU7CxXq2tSM', 'gh_9fa5181bb0af', 1399888344),
(75, 'otZyJjsOsL-iiRChxx9sGn6WaPfc', 'gh_9fa5181bb0af', 1399900257),
(76, 'otZyJjk5uB144aZStMyRNKEP6NGs', 'gh_9fa5181bb0af', 1399904110),
(77, 'o3IQEuGmob4nhUqAVdd5BGcUo2fM', 'gh_ec40c2ae850e', 1399906343),
(78, 'otZyJjtVLqhvbEoEFivbur0C3Y0g', 'gh_9fa5181bb0af', 1399906545),
(79, 'otZyJjgHH7nlvXN-Z6d5jlFVb-R8', 'gh_9fa5181bb0af', 1399906837),
(81, 'otZyJjjCCM6nZXgLRsS7RdFe0wDU', 'gh_9fa5181bb0af', 1399911063),
(82, 'otZyJjv4cPiOa4oUQismSCsOQEc8', 'gh_9fa5181bb0af', 1399911286),
(83, 'otZyJjsHL6nbxyxnuDeZQhcDiA20', 'gh_9fa5181bb0af', 1399911483),
(84, 'otZyJjh070XcVF10PE-knInGOnKA', 'gh_9fa5181bb0af', 1399934718),
(85, 'otZyJjolvlBBnBRDPkjCTZ7SABHA', 'gh_9fa5181bb0af', 1399938130),
(86, 'otZyJjphm72XNzKUXPbhM26gI2I0', 'gh_9fa5181bb0af', 1399942037),
(87, 'otZyJjo77cnecWxR7sVFsKDGYk7E', 'gh_9fa5181bb0af', 1399942273),
(88, 'otZyJjv46RO2aLbm9w_lpx7JU_E4', 'gh_9fa5181bb0af', 1399943412),
(89, 'o9M9_twWRY4Zvze3j9eYA7tc0M9E', 'gh_f806db7a5ffc', 1399944658),
(90, 'otZyJjgtzWrsiQ6wWAln22_1Qjms', 'gh_9fa5181bb0af', 1399944751),
(91, 'o3IQEuI7GeIOGBX3-rVaJXUkO0cg', 'gh_ec40c2ae850e', 1399945818),
(92, 'otZyJjpOR_getq5Cn7qlMhDjFx14', 'gh_9fa5181bb0af', 1399946105),
(93, 'otZyJjiMMOoFflVT-7_iz7Pc-_ns', 'gh_9fa5181bb0af', 1399951076),
(94, 'otZyJjqObXtJif_3_FVoh-RAzdhU', 'gh_9fa5181bb0af', 1399952195),
(95, 'oeiNDuGByvV9saT3l0lJm_As3AIQ', 'gh_eddff0b6d304', 1399953272),
(96, 'otZyJjqBDpsJjF8FCMdqPnVEKx_0', 'gh_9fa5181bb0af', 1399957239),
(97, 'otZyJjj8uXp1CLE-j9-WDLuH1lCc', 'gh_9fa5181bb0af', 1399958998),
(98, 'otZyJjh8zuBSTnRP3LGxHoFInOak', 'gh_9fa5181bb0af', 1399974386),
(100, 'otZyJjnx_IZnFiaNEDagncrH5FGs', 'gh_9fa5181bb0af', 1399989890),
(101, 'otZyJjnimmXeCGOyCh95w8DQ95uw', 'gh_9fa5181bb0af', 1399994140),
(102, 'otZyJjmKBJMJROQsQLgYDEsoR_gI', 'gh_9fa5181bb0af', 1399994302),
(103, 'otZyJjt7Jqo_xMEmP9Ykgk4iaA3c', 'gh_9fa5181bb0af', 1400020412),
(104, 'otZyJjvL_QB97t6v_BWdExp5YaWQ', 'gh_9fa5181bb0af', 1400021330),
(105, 'otZyJjndaGTleUFLPrqul5hLWDiU', 'gh_9fa5181bb0af', 1400027032),
(106, 'otZyJjgmuNODpJbyGVxLnVkgS0XM', 'gh_9fa5181bb0af', 1400029137),
(107, 'otZyJjky5NPXbcGaSF6SNJr3T0z0', 'gh_9fa5181bb0af', 1400038457),
(108, 'otZyJjkf_UoH1UwsJr2JwLCtWpB8', 'gh_9fa5181bb0af', 1400039164),
(109, 'otZyJjtrf0lDC1ktmCrUgVVWslJ4', 'gh_9fa5181bb0af', 1400040233),
(110, 'oQ121tzVRUCVLXYcm5U9cghoxD-Q', 'gh_2e70eca365a3', 1400040632),
(111, 'otZyJjnIBA7uor8wdsCEXit0dKFk', 'gh_9fa5181bb0af', 1400041495),
(112, 'otZyJjiUCQbXvmseT_DscJTsrprg', 'gh_9fa5181bb0af', 1400044212),
(116, 'oeiNDuC5muqnhWNMysdlkD8Z-3cY', 'gh_eddff0b6d304', 1400049584),
(115, 'o3IQEuAfU4yqE5t4-Uk30E4eO4JI', 'gh_ec40c2ae850e', 1400049533),
(117, 'otZyJjv6zLLMBV9MjJaRkp29fHXw', 'gh_9fa5181bb0af', 1400066718),
(118, 'otZyJjhKEQJbttA9R7AsZWdtMHNo', 'gh_9fa5181bb0af', 1400071033),
(119, 'otZyJjrsHjr72ZGijLJwrwZHMY8s', 'gh_9fa5181bb0af', 1400074871),
(120, 'otZyJjpWcAPH265-kWJWMUSFZKaU', 'gh_9fa5181bb0af', 1400076310),
(121, 'otZyJjmAHmMTI1kE00YPtjE7gI6U', 'gh_9fa5181bb0af', 1400078477),
(122, 'otZyJjgj8MDsWp-kCagMbzy6gtEc', 'gh_9fa5181bb0af', 1400080580),
(123, 'otZyJjlP4rhNX38s5FPCJQbLyQog', 'gh_9fa5181bb0af', 1400084049),
(125, 'otZyJjoh2N4vhSozLlEzAteidzE4', 'gh_9fa5181bb0af', 1400108953),
(126, 'otZyJjlxoh7fWJtpmGDF77-ZUkDM', 'gh_9fa5181bb0af', 1400117319),
(127, 'otZyJjpu4Id4_QmbJIFSsEoG3JoU', 'gh_9fa5181bb0af', 1400127854),
(128, 'oIBMCuDy3bPcM3nX2LY8NXm2gLTE', 'gh_8154d3ddaa39', 1400129483),
(130, 'otZyJjqqKuU_VwAP4qgIUBty3xmg', 'gh_9fa5181bb0af', 1400134679),
(131, 'oGLUPt-7lgKaeybzqrA6bFFVCfcg', 'gh_467191c387b5', 1400137026),
(136, 'otZyJjuBgZKO0ux5DE8C6Q6wzS94', 'gh_9fa5181bb0af', 1400142941),
(172, 'o3IQEuJ_CNK3LT5HwiLSE_8B6FTo', 'gh_ec40c2ae850e', 1400170186),
(134, 'oGLUPty6X5Euk54VQZH54XwhUY3w', 'gh_467191c387b5', 1400137829),
(135, 'oGLUPt8cXv3DAuTPqdMn6gCW4Cec', 'gh_467191c387b5', 1400137856),
(137, 'oGLUPt_P4bGQ0MLymBBa2Jv4esMI', 'gh_467191c387b5', 1400144817),
(138, 'oGLUPt90qro427QvXS4IkXulagD0', 'gh_467191c387b5', 1400144975),
(157, 'oeiNDuNQIN2BUzQdnsJUxSByP5yg', 'gh_eddff0b6d304', 1400148796),
(151, 'oGLUPt2wTY-H7qgbCCWaAVh51XK4', 'gh_467191c387b5', 1400145446),
(167, 'otZyJjiMVTafV1y3YxKJMPkSFYHw', 'gh_9fa5181bb0af', 1400163322),
(150, 'oGLUPtwQR4Pv3Y-u85dFz_Er7COE', 'gh_467191c387b5', 1400145387),
(148, 'oGLUPt4h0HI-27CIJB3IyhfrgQVI', 'gh_467191c387b5', 1400145355),
(144, 'oGLUPtxuH_jljpSs63Dc1XxIrIXM', 'gh_467191c387b5', 1400145075),
(152, 'oGLUPt7kBxKV8aR9YNGJjkFrQPfo', 'gh_467191c387b5', 1400145451),
(146, 'oGLUPty0-rpWO_n0S6IbdAURi1sg', 'gh_467191c387b5', 1400145193),
(147, 'oGLUPt0c54wT2r5pd_yjONBTNyZM', 'gh_467191c387b5', 1400145192),
(156, 'oeiNDuH5Tpr_7l0Rq6tdyIFdVZv4', 'gh_eddff0b6d304', 1400146980),
(158, 'otZyJjr89Elv0C13jmcvJVub838U', 'gh_9fa5181bb0af', 1400154701),
(159, 'otZyJjjEDDksXzVV_SSA_3sllfkg', 'gh_9fa5181bb0af', 1400155414),
(160, 'otZyJjjQ3xRN_PRBXj6GZju-jfAA', 'gh_9fa5181bb0af', 1400156978),
(161, 'otZyJjsu3gY0q35KofBa015AO8Z8', 'gh_9fa5181bb0af', 1400159801),
(163, 'otZyJjlctWFe3-h4pYRg9JCnSlnQ', 'gh_9fa5181bb0af', 1400161054),
(164, 'o3IQEuEXlEAWLO32baTj33cWFT3s', 'gh_ec40c2ae850e', 1400161722),
(165, 'otZyJjhtjztXM_AwOgCfwHnx2TSI', 'gh_9fa5181bb0af', 1400161837),
(166, 'otZyJjnSe_4afckbxfu45uX9jLNQ', 'gh_9fa5181bb0af', 1400161993),
(170, 'otZyJjrU99hF8SOcqT1aSBEOkEe0', 'gh_9fa5181bb0af', 1400166283),
(171, 'otZyJjux5o3hCHkMNAaBMal4g474', 'gh_9fa5181bb0af', 1400167705),
(174, 'otZyJjirmq_-nkvXp3oexvBIcvMg', 'gh_9fa5181bb0af', 1400184592),
(175, 'otZyJjk6iGM8LcTCmsvOA6vYU2ZU', 'gh_9fa5181bb0af', 1400199994),
(176, 'o04Jet8kXLWFGRdoTBM6Xx753lVI', 'gh_44e55b3a0549', 1400200866),
(177, 'o0l1jt7R1krlIGVtlxlxSPHcjOZA', 'gh_9c697b9bb434', 1401364638),
(224, 'oXNmPtyVGBZSxWg9Fy_MQDDVXmHk', 'gh_b3901293dc4b', 1404115298),
(183, 'oXNmPt7Xy-a7YyZ9n30TExdQpVII', 'gh_b3901293dc4b', 1402739003),
(211, 'oXNmPt198E9OZJTw4DLscowrq4u0', 'gh_b3901293dc4b', 1403835941),
(188, 'oXNmPt_sQiMEHFFuZ-wt1qpvSDZI', 'gh_b3901293dc4b', 1402805824),
(189, 'oXNmPtwy54Ggqtd_DzwDBcV90JdE', 'gh_b3901293dc4b', 1402813652),
(191, 'oXNmPt8-QAe5aC-mRHmytEE6CCJQ', 'gh_b3901293dc4b', 1402880094),
(198, 'oXNmPtzJetZK46hfKfYMWy_gioPE', 'gh_b3901293dc4b', 1403055639),
(202, 'oXNmPt33wUg-KSJ_DSToriNxTRlQ', 'gh_b3901293dc4b', 1403508664),
(195, 'oXNmPt_MGGvDBsOaOnqFDc6hRQIE', 'gh_b3901293dc4b', 1402970281),
(196, 'oXNmPt-1nYdqOsr4FJmH8jh3hwtc', 'gh_b3901293dc4b', 1403042218),
(197, 'oXNmPt3Hk81Hu8StBbIwB2sQBRp4', 'gh_b3901293dc4b', 1403053209),
(200, 'oXNmPt-kAb51tsntT_riOQleVBkA', 'gh_b3901293dc4b', 1403162207),
(203, 'oXNmPt_ABPShfDLHKRP0qY8FuG8M', 'gh_b3901293dc4b', 1403788104),
(214, 'oXNmPt6UZQ_iHTUE2_3NCit18alw', 'gh_b3901293dc4b', 1403837645),
(215, 'oXNmPtyoEmH4LVqS96MAzPh7R1Zs', 'gh_b3901293dc4b', 1403841511),
(219, 'oXNmPt8-r4jujhPv512-FX3gDerU', 'gh_b3901293dc4b', 1403919020),
(220, 'oXNmPt4NIiflkjw0kXZhVvRKraDo', 'gh_b3901293dc4b', 1403919964),
(222, 'oXNmPtxUAQOxeQPZrMgjHbiYSxec', 'gh_b3901293dc4b', 1404089507),
(223, 'oXNmPt2cbTesx2mTS3-RVEOOkzkc', 'gh_b3901293dc4b', 1404092605),
(225, 'oXNmPt7_3AGJXize6AGEx5yIZMmk', 'gh_b3901293dc4b', 1404124656),
(226, 'oXNmPt3bCNqGA3aEmh0eJyktNPKc', 'gh_b3901293dc4b', 1404194286),
(227, 'oXNmPt-NdcRrtsW2re_ST6CNdPms', 'gh_b3901293dc4b', 1404203338),
(228, 'oXNmPt0QOWoxSXJHg-DTBEGrkE3o', 'gh_b3901293dc4b', 1404208250),
(229, 'oXNmPtyP32kU04zs-rO48196AHCk', 'gh_b3901293dc4b', 1404286313),
(230, 'oRD5St40GcuKp221h-ov-gnCuXBE', 'gh_f5653cf32abc', 1408352097),
(231, 'o9i_XjhNZYnuymPbzWh0kWJD1Vhk', 'gh_67ac5743339f', 1410390655),
(232, 'o9i_XjldtftotA3786cEw_2Wx-Q0', 'gh_67ac5743339f', 1411006557),
(233, 'o9i_Xjj70hVvtuddjlgiKW82H3nU', 'gh_67ac5743339f', 1411183232),
(234, 'o9i_XjrV4JXukHJhBCXtFVTRx0VM', 'gh_67ac5743339f', 1411435622),
(235, 'o9i_XjpxzYleHTpWZLT9bVm6XB-A', 'gh_67ac5743339f', 1411435673),
(236, 'o9i_XjmBmX-7y525QwaKf_xXfhKo', 'gh_67ac5743339f', 1411435692),
(237, 'o9i_XjqtMPAdQDMhSHbphNh8BaL0', 'gh_67ac5743339f', 1411436164),
(238, 'o9i_XjtABgFmymXpHiEXD4yP4OHo', 'gh_67ac5743339f', 1411440270),
(239, 'o9i_XjpDedUM5KcttzQGCdl80AsI', 'gh_67ac5743339f', 1411440363),
(240, 'o9i_XjjHxM4vNJXcLO9yyPzL8fm0', 'gh_67ac5743339f', 1411443715),
(241, 'o9i_XjhVDu6Urn6LPXuU8m-vBWzY', 'gh_67ac5743339f', 1411450249),
(242, 'o9i_XjhXiWI3QZQDEJALQfM-u6es', 'gh_67ac5743339f', 1411451728),
(243, 'o9i_Xjj2jQ2U0jO5QT7LqlFu-nCU', 'gh_67ac5743339f', 1411456318),
(244, 'o9i_XjqmIHfqSvjQ1KiWZUJqnYKs', 'gh_67ac5743339f', 1411456327),
(245, 'o9i_XjvbK2Z8evqsC-7bs7NSHuVE', 'gh_67ac5743339f', 1411456924),
(246, 'o9i_XjhwgweUb77j46HHcM0n0huk', 'gh_67ac5743339f', 1411457167),
(247, 'o9i_XjlopZx_b_pQx2BSTEOfspOE', 'gh_67ac5743339f', 1411460318),
(248, 'o9i_XjoLEofgO7HzN0QTYtvJ0qOc', 'gh_67ac5743339f', 1411603771),
(249, 'o9i_XjvfV1q0mDBnrvIPAvRsEyKU', 'gh_67ac5743339f', 1411718292),
(250, 'o9i_XjjAdFytAVB7z1J1d__LURzI', 'gh_67ac5743339f', 1411718314),
(251, 'o9i_XjmCZqw2AiA-IE_NYeucNheI', 'gh_67ac5743339f', 1411863482),
(252, 'o9i_Xjgl_d0t5M0nG-X1NbYX4Y6Y', 'gh_67ac5743339f', 1411950504),
(253, 'o9i_XjjLnLV-coiWB6PJG9rB-CUU', 'gh_67ac5743339f', 1412038500),
(254, 'o9i_Xjr-tcsYiIVl3U2177Eh_u4s', 'gh_67ac5743339f', 1412746060),
(255, 'o9i_XjmaWp5ZrjqJR9mTFwKt1OpM', 'gh_67ac5743339f', 1413532554),
(256, 'o9i_XjuGLSYUHvXL2g65JEwXXZAQ', 'gh_67ac5743339f', 1413769845);

-- --------------------------------------------------------

--
-- 表的结构 `tp_function`
--

CREATE TABLE IF NOT EXISTS `tp_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(7) NOT NULL DEFAULT '1',
  `usenum` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL,
  `funname` varchar(100) NOT NULL,
  `actname` varchar(100) NOT NULL DEFAULT 'index',
  `info` varchar(200) NOT NULL DEFAULT '',
  `isserve` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `belonguser` int(11) NOT NULL DEFAULT '1',
  `funtype` varchar(100) NOT NULL DEFAULT '默认',
  `funcolor` varchar(100) NOT NULL DEFAULT '',
  `havenext` varchar(10) NOT NULL DEFAULT '否',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=578 ;

--
-- 转存表中的数据 `tp_function`
--

INSERT INTO `tp_function` (`id`, `gid`, `usenum`, `name`, `funname`, `actname`, `info`, `isserve`, `status`, `belonguser`, `funtype`, `funcolor`, `havenext`) VALUES
(6, 0, 2, '关注回复', 'Areply', 'index', '', 1, 1, 1, '基本功能', 'Highland', '否'),
(7, 0, 2, '文本回复', 'Text', 'index', '', 1, 1, 1, '基本功能', 'Navy', '否'),
(10, 0, 3, '自定义菜单', 'Diymen', 'index', '', 1, 1, 1, '公众平台样式', 'LightBlue', '否'),
(15, 0, 4, '首页设置', 'Home', 'set', '', 2, 1, 1, '基本功能', 'Red', '否'),
(18, 0, 4, '幻灯片', 'Flash', 'index', '', 2, 1, 1, '公众平台样式', 'Orange', '否'),
(44, 0, 1, '我的公众号', 'Myinfo', 'index', '', 1, 1, 1, '基本功能', '', '否'),
(43, 0, 1, '修改密码', 'Myinfo', 'useredit', '', 1, 1, 1, '基本功能', '', '否'),
(105, 0, 4, '相册', 'Photo', 'index', '', 2, 1, 1, '公众平台样式', 'Orange', '否'),
(42, 0, 0, '访问数据', 'Index', 'index', '', 1, 1, 1, '基本功能', '', '否'),
(568, 2, 0, '图文分类', 'Classify', 'index', '图文分类', 2, 1, 1, '基本功能', 'ff0000', '否'),
(488, 2, 0, '图文回复', 'Img', 'index', '', 1, 1, 1, '基本功能', '', '否'),
(569, 2, 0, '一级分类', 'FunctionMaster', 'index', '', 2, 1, 1, '分类管理', '', '否'),
(570, 2, 0, '二级分类', 'FunctionClassify', 'index', '', 2, 1, 1, '分类管理', '', '否'),
(572, 2, 0, '三级分类', 'Category', 'index', '', 2, 1, 1, '分类管理', '', '否'),
(573, 2, 0, '商家信息', 'Business', 'index', '商家基本信息', 2, 1, 1, '商家管理', '', '否'),
(574, 2, 0, '商品管理', 'Wetall_item', 'index', '', 2, 1, 1, '服务项目', '', '否'),
(575, 2, 0, '服务管理', 'Service', 'index', '服务添加', 2, 1, 1, '服务项目', '', '否'),
(576, 2, 0, '资讯管理', 'Article', 'index', '资讯添加', 1, 1, 1, '服务项目', '', '否'),
(577, 2, 0, '营业数据', 'Business_data', 'index', '营业数据', 1, 1, 1, '商家管理', '', '否');

-- --------------------------------------------------------

--
-- 表的结构 `tp_function_master`
--

CREATE TABLE IF NOT EXISTS `tp_function_master` (
  `name` varchar(255) NOT NULL,
  `img` varchar(1024) NOT NULL,
  `orderno` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isshow` varchar(10) NOT NULL,
  `class` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `tp_function_master`
--

INSERT INTO `tp_function_master` (`name`, `img`, `orderno`, `id`, `isshow`, `class`) VALUES
('机构概况', '/Uploads/image/20141020/5444cca6f4240.png', 1, 48, '是', 1),
('征点分布', '/Uploads/image/20141020/5444ccc18d24e.png', 2, 49, '是', 1),
('通知公告', '/Uploads/image/20141020/5444cccf3d090.png', 3, 50, '是', 1),
('政策法规', '/Uploads/image/20141020/5444ccf11e849.png', 4, 51, '是', 1),
('办事指南', '/Uploads/image/20141020/5444cd06c65d5.png', 6, 52, '是', 1),
('欠税单位', '/Uploads/image/20141020/5444ccfc44aa2.png', 5, 55, '是', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_home`
--

CREATE TABLE IF NOT EXISTS `tp_home` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `tp_home`
--

INSERT INTO `tp_home` (`id`, `token`, `title`, `picurl`, `info`, `plugmenucolor`, `copyright`, `homeurl`, `advancetpl`) VALUES
(1, 'labnkv1398317973', '222', 'http://www.slweinxin.com/Uploads/image/20140514/5372e145e4984.jpg', '222222', '', '', '/wxshoppingmall/SRC/Uploads/image/20140505/5366e87d6acda.jpg', 0),
(2, 'rmzthc1399729257', '欢迎来到86男装街，男装时尚，你我同行>>>>', 'http://www.slweinxin.com/Uploads/image/20140510/536e3035bb006.png', '86男装街，致力于做中国男人最时尚的顾问。你的时尚，我的责任！', '', '', '/Uploads/image/20140510/536e314b27a2d.jpg', 0),
(3, 'tejdsg1399856577', '首页', 'http://www.slweinxin.com/Uploads/image/20140512/53701e687d807.jpg', '首页', '', '', '', 0),
(4, 'kaybwr1401157066', '你好', 'http://www.ttiantian.com/Uploads/image/20140527/5383f69d1c089.jpg', '点击进入首页', '', '', '/Uploads/image/20140527/538466bd75d75.jpg', 0),
(5, 'pjeupf1402729544', '欢迎关注临港协税护税', 'http://lingang.weixinkf.cn/Uploads/image/20140615/539da8551c51c.jpg', '您好！欢迎进入临港协税护税微信公众平台！', '', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_host`
--

CREATE TABLE IF NOT EXISTS `tp_host` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_host_list_add`
--

CREATE TABLE IF NOT EXISTS `tp_host_list_add` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_host_order`
--

CREATE TABLE IF NOT EXISTS `tp_host_order` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_images`
--

CREATE TABLE IF NOT EXISTS `tp_images` (
  `iid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(300) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_img`
--

CREATE TABLE IF NOT EXISTS `tp_img` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11090 ;

--
-- 转存表中的数据 `tp_img`
--

INSERT INTO `tp_img` (`id`, `uid`, `uname`, `keyword`, `type`, `text`, `classid`, `classname`, `pic`, `showpic`, `info`, `url`, `createtime`, `uptatetime`, `click`, `token`, `title`, `statdate`, `person`) VALUES
(11078, 6, 'user', '中国家庭医生：阿司匹林，防心脑血管意外的良药', '2', '众所周知，心脑血管病是人类的头号杀手，全世界每年死于心脑血管病的人超过1700万，我国每15秒就有1人被心脑血管病夺去生命！', 110, '就医资讯', 'http://www.hajk.com.cn/Uploads/image/20141024/5449f3c8e04a7.jpg', '1', '<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	拯救心脑血管，阿司匹林很给力\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	众所周知，心脑血管病是人类的头号杀手，全世界每年死于心脑血管病的人超过1700万，我国每15秒就有1人被心脑血管病夺去生命！\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	这些心脑血管事件的根源是，动脉粥样硬化斑块破裂和血栓形成，导致血管闭塞、血流不通，引起相应脏器缺血、坏死。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	若发生在供血心脏的冠状动脉，即表现为不稳定性心绞痛和/或急性心肌梗死，甚至猝死；若发生在脑部，就是急性缺血性中风。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	可见，血栓形成在心脑血管事件中扮演了极不光彩的重要角色，而这一切都与血小板的不寻常聚集息息相关。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	要想预防心脑血管意外，抗血小板聚集、减少血栓发生势必成为关键。于是，具有强烈抗血小板聚集功能的老药——阿司匹林，再次获得临床关注，被广泛用于心脑血管病的预防体系中。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	小剂量，肠溶片最合适<img src="/Uploads/image/20141114/5465af9f2a6e2.png" alt="" /> \r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	需要提醒注意的是，小剂量阿司匹林便足以抑制血小板的聚集，达到预防心脑血管病的目的；大剂量不仅不能增加疗效，反而会增加毒副反应。鉴于此，国内一般推荐用量为100毫克/日。 &nbsp; 剂型上，建议最好采用肠溶片，以减少对胃黏膜的刺激，且阿司匹林主要在小肠上段吸收，肠溶片吸收慢，作用达24小时，抑制血小板作用更可长达2~7天。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	话虽如此，却不意味着2~3天服一次即可，因为血小板每日更新10%，且不受前一天服用阿司匹林的影响。所以，必须每日预防性用药，并持之以恒。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	出血概率很低\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	服用阿司匹林，往往会担心消化道出血，其实这种概率是很低的。据统计，每1000例服用阿司匹林1年的病人中，仅有1例会出现消化道出血，且多发生在有出血倾向、溃疡病和中重度肝病者身上。针对此，可考虑合用胃黏膜保护剂和制酸药，以减少胃肠道出血。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	但有活动性出血者，则不宜使用阿司匹林。至于对阿司匹林过敏、有禁忌、有严重不良反应，或对阿司匹林抵抗者，可考虑改用氯吡格雷等抗血小板药。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	最后必须指出，急性出血性脑中风者绝对不能使用阿司匹林。而高血压病人，一定要把血压控制好后方可使用。（编辑：姚文怡）\r\n</p>', '', '1414132715', '1415951026', 0, 'pjeupf1402729544', '中国家庭医生：阿司匹林，防心脑血管意外的良药', '2014-10-24', 'user'),
(11079, 6, 'user', '喉癌主要发生在声带等部位', '2', '喉癌主要发生在3个部位，一个是声门区，长在声带上。这类喉癌若能早发现，仅做手术，效果非常好，术后五年生存率达到90%。目前，上海及周边地区的喉癌病例，70%以上都是声门区的，即长在声带上的。', 110, '就医资讯', 'http://www.hajk.com.cn/Uploads/image/20141024/5449f43f01a64.jpg', '1', '<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	声门区喉癌 最常见\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	喉癌主要发生在3个部位，一个是声门区，长在声带上。这类喉癌若能早发现，仅做手术，效果非常好，术后五年生存率达到90%。目前，上海及周边地区的喉癌病例，70%以上都是声门区的，即长在声带上的。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	二是长在声门上区，一般发现比较晚，预后比较差，且转移比较早。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	三是长在声门下区，多数发现就是晚期了。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	判断期别时，主要看两个指标，一是看肿瘤所在位置，另一个是看肿瘤大小。此外，还可以看有没有淋巴结转移或远处转移。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	肿瘤分期是通过三个指标联合评估的，即TNM分期，其中T描述肿瘤局部大小，N描述肿瘤局部是否有淋巴结转移，M描述肿瘤是否有远处转移。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	如声门上型的喉癌，T1为早期，指肿瘤限于声门上一个亚区，声带活动正常。声门型喉癌，T1指肿瘤局限于声带，但声带活动正常。声门下型喉癌，T1指肿瘤限于声门下。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	一般，出现淋巴结或远处转移的，就是喉癌晚期了。像T4多是晚期。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	喉镜 快速筛查和辨别\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	如果老百姓发现自己声音突然哑了，应该到医院做一个喉镜。现在喉镜显露非常好，可以完整看到声带等正常结构，病变的大小、范围。有些喉镜下还能做染色，判断白斑等癌前病变。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	喉镜下可以按声带息肉进行切除，再做病理。如果报告良性的，就不用处理了。如果报告是恶性的，需要进一步诊断。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	喉癌首选手术治疗\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	喉癌是一个实体肿瘤，跟身体其他部位的肿瘤可能略有不同。如血液系统等肿瘤，以化疗为主；扁桃体下咽部肿瘤，放化疗的效果也很好。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	但喉癌由于解剖结构的特殊性，一旦发现，首选手术。只有在很早期病变的情况下，可以采用放疗，跟手术效果差不多。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	一般，早期声门区的喉癌仅做手术，效果就很好。T3以上需要加放疗。声门上区的喉癌一般都要手术加放疗。声门下区的患者要做全喉切除手术，术后需要综合治疗，如加放化疗。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	早期喉癌采用手术，治愈率高，超过90%，费用低。手术治疗早期喉癌治疗时间短，激光切除只需住院数天，喉部分切除术住院约半个月左右。其优点在于不会影响吃饭，对免疫功能无影响。但缺点在于，术后患者声音嘶哑明显。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	复发率来讲，早期癌的手术和放疗，效果都差不多。晚期喉癌，如T3、T4，术后五年生存率在50%，还有50%的患者在治疗后一年到两年间，容易复发，此后可以进一步手术。晚期喉癌患者不建议首选放疗。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	如果选择手术，手术种类很多，包括比较微创的切除术、激光切除和常规手术等。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	喉癌手术切口 因人而异\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	肿瘤较大者，可以做包括声带切除、水平半喉切除、垂直半喉切除在内的喉部分切除。如果病情更重，可以做全喉切除。做了全喉切除的患者有时会担心说话的问题，我们可以通过发音功能的重建、术后训练，帮助其发声。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	由于肿瘤位置的不同，手术切口的位置、大小等，会有很大区别。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	经典切口在环甲膜平面横切口、比甲状腺高一点的位置，做一个弧形切口；其次，可以做正中结构，从舌骨往下，垂直竖下来。全喉切除的话，做垂直切口比较好，感染概率比较低。早期喉癌声带裂开，也可以做垂直切口。\r\n</p>', '', '1414132810', '1414132810', 0, 'pjeupf1402729544', '喉癌主要发生在声带等部位', '2014-10-24', 'user'),
(11080, 6, 'user', '60%的习惯性流产，和免疫因素相关', '2', '怀孕本是人生一大喜事，然而对于曾经接二连三发生过自然流产的女性来说，看到验孕试纸变成“中队长”（两条杠）时，心情却是复杂得很，有一半是喜悦，一半却是忐忑不安。', 110, '就医资讯', 'http://www.hajk.com.cn/Uploads/image/20141024/5449f49984519.jpg', '1', '<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	怀孕本是人生一大喜事，然而对于曾经接二连三发生过自然流产的女性来说，看到验孕试纸变成“中队长”（两条杠）时，心情却是复杂得很，有一半是喜悦，一半却是忐忑不安。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	不安的原因，当然是担心这次的怀孕会否和以前一样，中途突然自行流产，保都保不住。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	这样的担心，显然不是多余的。事实上，习惯性流产在临床上很是常见。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	有过3次或3次以上在28周之前的自然流产，就被称为习惯性流产。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	说起习惯性流产的发生原因，张建平教授认为：“超过60%的习惯性流产是与免疫因素相关的。”\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	比起那些连发病原因都还没找到的疾病来说，显然，习惯性流产这个已经找到主要原因的疾病，其治疗并没有一般人想象中那么难。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	“通过各种免疫治疗，90%以上免疫相关引起的习惯性流产，患者最终能够成功妊娠。”张建平教授的一句话，带给大家极大的希望。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	正常情况下，外来异物入侵人体后，人体会发生一定的免疫反应，对该异物进行攻击和清除。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	不过，一般正常的怀孕过程中，妻子会对来自丈夫的基因抗原产生免疫耐受，告诉自己的免疫细胞，不要把它当成异物攻击排斥。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	这个过程，当然不是妻子用嘴巴说说就可以的，它依靠的还是妻子身体里的免疫反应。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	面对丈夫的基因抗原，妻子的身体就会产生一种保护性的因子（即封闭因子或封闭抗体），它能对丈夫的抗原进行修饰伪装。这相当于打了个印章，告诉妻子的免疫系统：这是自家人。这样一来，妻子身体里的免疫系统就不会对来自丈夫的基因进行打击。这样就不会发生免疫相关的流产。\r\n</p>\r\n<p style="text-indent:2em;color:#333333;font-family:宋体, tahoma, arial;font-size:14px;background-color:#FFFFFF;">\r\n	发生免疫相关性流产的孕妇，往往就是因为孕妇无法对自己丈夫的基因抗原产生封闭因子。因此即便怀孕了，孕妇自身的免疫系统还是会不停地攻击含有丈夫基因的“外来物”，从而导致流产的发生。这就是最常见的同种免疫型流产。\r\n</p>', '', '1414132891', '1414132891', 0, 'pjeupf1402729544', '60%的习惯性流产，和免疫因素相关', '2014-10-24', 'user'),
(11081, 6, 'user', '破解看病难应从“小处着手”', '2', '借助金融IC居民健康卡可以预约挂号、缴费支付，减少挂号和缴费时反复排队的麻烦;借助微信也可以直接在北京个别大医院挂号了……这两天，关于看病挂号新方式的新闻吸引不少人的关注。别小看这些细节上的小改变，它们可以让病人少许多不必要的折腾，正是宏大的医疗体制改革中不能忽视的小细节', 110, '就医资讯', 'http://www.hajk.com.cn/Uploads/image/20141024/5449f4e405821.jpg', '1', '<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	借助金融IC居民<a href="http://healthplan.999120.net/" target="_blank">健康</a>卡可以<a href="http://order.999120.net/" target="_blank">预约挂号</a>、缴费支付，减少挂号和缴费时反复排队的麻烦;借助微信也可以直接在北京个别大医院挂号了……这两天，关于看病挂号新方式的新闻吸引不少人的关注。别小看这些细节上的小改变，它们可以让病人少许多不必要的折腾，正是宏大的医疗体制改革中不能忽视的小细节。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	“看病难”是百姓生活中的“老大难”。尤其是北京、上海等大城市的大医院，人山人海，往往一人看病、全家出动。而仔细分析，看病的时间大多用在排队挂号、排队候诊、排队缴费、排队检查、再排队看医生，再排队缴费、再排队取药等环节上，医生“望闻问切”的过程反倒是花费时间最短的。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	医改之所以难，难在很多问题动辄涉及机制体制根源，非一日之功能化解，非一方之力能奏效。但是，大部分病人感受到的“难”，有一些并不涉及体制机制。例如<a href="http://daoyi.999120.net/" target="_blank">导诊</a>不明晰，去错了科室只有从头再排队挂号;缴费制度不科学，要反复排队交钱;医院科室标识不清晰，病人往往满楼上下跑，苦不堪言。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	地方卫生主管部门当年曾经推出过“院长当一天患者”的活动。19家医院院长“扮成”普通患者，各自选择一家不熟悉的医院就诊。结果，每个院长都有一肚子“苦水”。而这些“苦水”并非全是涉及医改的体制机制问题，有一些是医院导医专业知识不够等看起来不起眼的小细节，给患者带来很多麻烦，这也是使病人对看病“发憷”的重要原因。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	近年来，医患冲突大多发生在大医院，而非基层医疗机构。其中一个重要原因就是大医院的就诊感受太差，容易产生不满情绪。要改变这些就诊小细节，就需要多建立一些畅通的挂号渠道，多挂几块指路的牌子，多加几个专业的导医台，建立一个更完善的结账系统。与医改这样的宏大改革相比，这种抓小细节的改变要容易得多，但是见效可能并不小。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	为破解“看病难、看病贵”，近些年国家坚持“保基本、强基层、建机制”的基本原则，推动医改取得一定的进步。但是，在抓大的同时，也不应当忽视医院服务的小细节。医院应当从小细节改起，改变服务理念和服务方式，尽量让患者能少排队、少费时、少折腾。\r\n</p>', '', '1414132965', '1414132965', 0, 'pjeupf1402729544', '破解看病难应从“小处着手”', '2014-10-24', 'user'),
(11082, 6, 'user', '挂号网“已满”、“淘宝号”慎重，网上挂号该走向哪里？', '2', '挂号网作为挂号平台中的一员，经常出现号源已满的情况，这让很多患者不能挂到号，经几次挂号试验，热门医院的热门专家，均出现号源瞬间就被秒杀的情况。', 110, '就医资讯', 'http://www.hajk.com.cn/Uploads/image/20141024/5449f5464099f.jpg', '1', '<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	挂号网作为挂号平台中的一员，经常出现号源已满的情况，这让很多患者不能挂到号，经几次挂号试验，热门医院的热门专家，均出现号源瞬间就被秒杀的情况。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	<img height="225" alt="医院<a href=''http://order.999120.net/'' target=_blank>预约挂号</a>" width="300" src="http://999120.net/news/photo_news/20140626145344.jpg" />\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp; 某市刘小姐全家守在挂号网上，抢挂华山医院某专家号，号源瞬间被秒杀。让她意外的是，淘宝上却有卖家抛售专家号，售价300元，忍痛挨宰一刀后，刘小姐收到了落款为挂号网的确认短信，并成功看上了该专家。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp; 多家医院提醒市民，去医院就诊时，身份证信息原则上必须与预约时的身份信息完全一致方能挂号。从黄牛手中非正常途径购买的号，存在不能正常问诊的风险，一旦出现纠纷，市民将很难维权。面对这种挂号网“已满”、“淘宝号”慎重的情况，<a href="http://order.999120.net/"></a><a href="http://order.999120.net/" target="_blank">网上挂号</a>该走向哪里？\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp; 导医网（<a href="http://999120.net/">http://999120.net</a>）作为挂号平台中的一员，坚持为患者解决挂号难的问题。导医网与全国多家医院有合作关系，为老百姓解决看病难，住院难等全方面问题。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	&nbsp;&nbsp;&nbsp; 导医网在此提醒广大患者，请勿盲目就医，挂号请选择正规的号源平台，谨防上当受骗。\r\n</p>', '', '1414133063', '1414133063', 0, 'pjeupf1402729544', '挂号网“已满”、“淘宝号”慎重，网上挂号该走向哪里？', '2014-10-24', 'user'),
(11083, 6, 'user', '如何应对煤气中毒', '2', '按期查看煤气。固然目前不少家庭开端用电磁炉炒菜，但运用煤气罐的也照样居多。因而运用煤气的家庭必然要养成按期查看管道、阀门能否有走漏的习气，烧完饭菜顺手就把煤气灶和阀门拧紧，以免一时忽略遗忘了。煤气罐到了年限必然要送去检修，避免有残次的钢瓶寄存在家里。', 110, '就医资讯', 'http://www.hajk.com.cn/Uploads/image/20141024/5449f5bc2cf6e.jpg', '1', '\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n		按期查看煤气。固然目前不少家庭开端用电磁炉炒菜，但运用煤气罐的也照样居多。因而运用煤气的家庭必然要养成按期查看管道、阀门能否有走漏的习气，烧完饭菜顺手就把煤气灶和阀门拧紧，以免一时忽略遗忘了。煤气罐到了年限必然要送去检修，避免有残次的钢瓶寄存在家里。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n		留意通风。在运用煤气时，必然要翻开窗户，坚持通风的优越。假如是用老式的燃气热水器洗澡时，门窗也不宜关死，略微留一条小裂缝，只需不直接吹到身体上惹起着凉就行。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n		尽量不在室内烧煤炭。这个包罗烧煤炭炉取暖，以及烧炭暖锅、烧烤吃器械。必然要烧，也要放在可以通风的当地，而不是由于惧怕外界的凉风进入室内将门户紧闭。取暖时要留意人与火盆之间坚持必然的间隔，既能取暖，又不会直接吸入很多的一氧化碳。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n		不要留老人单独取暖。老年人的年岁大，记忆不免会有些跟不上，能否有烧炭都不一定记得。再加上感官都曾经有些愚钝，即便摄入了良多的一氧化碳也未必可以很灵敏地察觉出来。因而万万不要把老人独自留在这种危机四伏的场合。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n		睡觉前熄灭一切炭火。曾经发作过良多起如许的惨剧，居民们为了取暖而烧了一盆炭火，后果睡觉之前忘了熄灭，以致于在睡梦中不知不觉吸入过量的一氧化碳中毒身亡。所以在上床之前，必然要把一切能够发生一氧化碳的设备都封闭，炭火都熄灭，而且开窗通风。\r\n	</p>\r\n	<table width="580" border="0" cellspacing="0" cellpadding="0" style="border:none;" class="ke-zeroborder">\r\n		<tbody>\r\n			<tr>\r\n				<td align="left" class="infofont" style="border:none;font-size:14px;font-family:宋体;color:#333333;">\r\n					<br />\r\n<br />\r\n<a href="http://bjxhyy.hos.999120.net/" target="_blank"></a><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<a href="http://zhongliu.999120.net/" target="_blank"></a><br />\r\n<br />\r\n<a href="http://bjtryy.hos.999120.net/" target="_blank"></a><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<a href="http://bjetyy.hos.999120.net/" target="_blank"></a><br />\r\n<br />\r\n<br />\r\n<br />\r\n<a href="http://bjazyy.hos.999120.net/" target="_blank"></a><br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<a href="http://zhongliu.999120.net/" target="_blank"></a><br />\r\n<br />\r\n<a href="http://zhongliu.999120.net/" target="_blank"></a><br />\r\n<br />\r\n<a href="http://www.999120.net/disease/kq" target="_blank"></a><br />\r\n<br />\r\n<br />\r\n<a href="http://www.999120.net/disease/kq" target="_blank"></a><br />\r\n<br />\r\n<a href="http://www.999120.net/disease/kq" target="_blank"></a><br />\r\n<br />\r\n<a href="http://zhongliu.999120.net/" target="_blank"></a><br />\r\n<br />\r\n<a href="http://zhengxingmeirong.999120.net/" target="_blank"></a>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n\r\n<table width="600" border="0" cellspacing="0" cellpadding="0" style="border:none;color:#000000;font-family:宋体, Verdana, Arial, Helvetica, sans-serif;font-size:12px;background-color:#FFFFFF;" class="ke-zeroborder">\r\n	<tbody>\r\n		<tr>\r\n		</tr>\r\n	</tbody>\r\n</table>', '', '1414133182', '1414133182', 0, 'pjeupf1402729544', '如何应对煤气中毒', '2014-10-24', 'user'),
(11084, 6, 'user', '小中风不可忽视要急诊', '2', '过性的局部脑缺血造成的中风，俗称小中风。小中风发作时也会有脸面麻痹、言词不清、半身不遂、视力模糊和头痛等等症状，只不过这些症状通常会在24小时之内自行消除，毛病好像不治而愈，所以许多人往往对此缺乏足够的重视，并不当即就去看急诊或者及时治疗。', 110, '就医资讯', 'http://www.hajk.com.cn/Uploads/image/20141024/5449f5f424aae.jpg', '1', '<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	过性的局部脑缺血造成的中风，俗称小中风。小中风发作时也会有脸面麻痹、言词不清、半身不遂、视力模糊和头痛等等症状，只不过这些症状通常会在24小时之内自行消除，毛病好像不治而愈，所以许多人往往对此缺乏足够的重视，并不当即就去看急诊或者及时治疗。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	最近英国牛津大学的彼得罗斯威尔医师在著名外科杂志《柳叶刀》上发表文章指出，根据他的观察，如果对小中风的病人在发病的24小时之内及时处理，包括给病人服用阿斯匹灵，降低病人的血压、胆固醇，防止血栓等，这样可以降低这些病人在此后3个月内再度发生严重中风的风险。罗斯威尔医师曾对10万多人进行血管疾病的普查，他发现其中有1278名病人有中风的症状。其中600名就是上面所说的小中风。他将其中310名病人按照英国目前常规的处理办法，将病人转到门诊部医生处去就医。通常，这些病人在3周内都得到了一定的药物治疗。而对另外290名病人，他在24小时之内就给他们进行处理。结果这些病人在此后3个月发生大中风的比例只有2%。相比之下，在24小时之内没有得到及时处理的病人，在3个月内再次大中风的比例竟然高达10%。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	在另外一本《柳叶刀神经学分册》杂志上，一位来自法国巴黎的阿玛里可医生的观测，也支持了这种说法。他们对1085名在24小时之内得到处理的小中风病人进行随访的结果表明，在90天之内再次发生大中风的比例大概只有1%多一点。而根据当地医院的病史记录，小中风病人在90天之内再次中风的平均几率是6%左右。\r\n</p>\r\n<p style="color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;">\r\n	针对这些研究成果，美国迈阿密大学神经科主任赛克博士认为，犹如胸痛对于急性<a href="http://ycxd.999120.net/" target="_blank">心肌梗死</a>一样，小中风对大脑缺血也是一种严重的预警信号，虽然症状可能会自行消除，但是病人和医生也应该立即采取措施，切不可掉以轻心。\r\n</p>', '', '1414133237', '1414133237', 0, 'pjeupf1402729544', '小中风不可忽视要急诊', '2014-10-24', 'user'),
(11085, 6, 'user', '感冒了？用这几个方法科学治感冒', '2', '每到流感季节，有些人都会不幸中招，身边却总有人能“逃过一劫”。据报道，不用羡慕别人有副“百毒不侵”的好身体，只要掌握他们不感冒的秘密，你也能轻松度过流感高发期。那么，在这个气温不断下降的秋季，如果你也有感冒的迹象了，该如何科学治疗感冒呢？看看《印度时报》怎么说。', 110, '就医资讯', 'http://www.hajk.com.cn/Uploads/image/20141024/5449f8521f585.jpg', '1', '<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	每到<a href="http://jbk.39.net/lhxgm/" target="_blank">流感</a>季节，有些人都会不幸中招，身边却总有人能“逃过一劫”。据报道，不用羡慕别人有副“百毒不侵”的好身体，只要掌握他们不<a href="http://jbk.39.net/gm/" target="_blank">感冒</a>的秘密，你也能轻松度过流感高发期。那么，在这个气温不断下降的秋季，如果你也有感冒的迹象了，该如何科学治疗感冒呢？看看《印度时报》怎么说。\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	 一、备<a href="http://ypk.39.net/yaopin/hxxtyy/qita/aafbb.html" target="_blank">好感</a>冒药\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	家里备好止痛药，如<a href="http://ypk.39.net/yaopin/mianyi/ky/kfsy/adf79.html" target="_blank">布洛芬</a>，<a href="http://ypk.39.net/yaopin/zty/7b2cd.html" target="_blank">对乙酰氨基酚</a>和<a href="http://ypk.39.net/yaopin/xyxt/kxxby/b479f.html" target="_blank">阿司匹林</a>都是已知的治疗感冒的药物。市场上虽然存在着各式各样的感冒药，但基本都是以上成分，无论你选择药片，胶囊，一种可溶性片剂或一杯<a href="http://ypk.39.net/yaopin/c5771.html" target="_blank">冲剂</a>，这样做的最好的治疗感冒的方式。\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	 二、准备解充血药\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	解充血药可以帮助人们清理鼻窦腔，减轻大家由于感冒引起的鼻塞、呼吸不畅等症状。大多数治疗感冒和流感的药物中都会存在一定的解充血药物成分，能够起到提神醒脑的功效。但是如果你想休息，提前尽量不要服用，因为药物中兴奋的成分恐怕没有那么容易让你睡着了。\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	 三、补充锌元素\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	最近的一项研究表明，服用锌糖浆、片剂或含片能够减轻感冒患者的症状，加速感冒康复的时间。但是使用这个方法应当十分谨慎，因为长期服用可能会对人体造成<a href="http://jbk.39.net/keshi/zxy/zhongyi/ba267.html" target="_blank">呕吐</a>和<a href="http://jbk.39.net/fx/" target="_blank">腹泻</a>等不良副作用。\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	 四、时刻检查你的药箱\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	大家应该经常检查自家药箱，看看里面是否有过期的药物，或者药效作用相抵抗的作用。此外，大家也要注意服用的感冒药是否与你现在正在服用的其他药物有不良反应。如果对此有任何疑问，请向你的医生请求帮助。\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	 五、尽量不用抗生素\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	平时，大家患的感冒几乎都是由病毒感染引起，而使用抗生素绝对不会减轻感冒的症状。反而，过度使用抗生素会提高人体内细菌对抗生素的耐药性，所以抗生<a href="http://ypk.39.net/yaopin/d7ba1.html" target="_blank">素能</a>不用则不用，除非你真的需要它们。\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	 六、在办公桌前摆放加湿器\r\n</p>\r\n<p style="color:#333333;font-family:Verdana;font-size:16px;background-color:#FFFFFF;">\r\n	加湿器能够让你的工作环境更加潮湿，吸入蒸汽可以帮助你湿润鼻子里的粘液，使它更容易通过擤鼻而排出。如果你在办公室工作，可以在桌上摆放一盆热水，或者摆放一台空气加湿器。\r\n</p>', '', '1414133843', '1414133843', 0, 'pjeupf1402729544', '感冒了？用这几个方法科学治感冒', '2014-10-24', 'user');

-- --------------------------------------------------------

--
-- 表的结构 `tp_indent`
--

CREATE TABLE IF NOT EXISTS `tp_indent` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_info_notice`
--

CREATE TABLE IF NOT EXISTS `tp_info_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `content` text,
  `ptime` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_ipban`
--

CREATE TABLE IF NOT EXISTS `tp_ipban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `expires_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_item`
--

CREATE TABLE IF NOT EXISTS `tp_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL,
  `isBusiness` int(10) NOT NULL COMMENT '所属商家',
  `orig_id` smallint(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `zb_price` decimal(10,2) DEFAULT NULL COMMENT '周边价格',
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `tp_item`
--

INSERT INTO `tp_item` (`id`, `cate_id`, `isBusiness`, `orig_id`, `title`, `intro`, `img`, `price`, `zb_price`, `rates`, `type`, `comments`, `cmt_taobao_time`, `add_time`, `ordid`, `status`, `info`, `news`, `tuijian`, `goods_stock`, `buy_num`, `brand`, `pingyou`, `kuaidi`, `ems`, `free`, `color`, `size`, `tokenTall`) VALUES
(10, 15, 1, 0, 'A1586', '苹果最新iphone6', '/Uploads/image/20141112/5462c407d0317.png', '233.00', '300.00', 0.00, 1, 0, 0, 1415758885, 255, 1, 'test', 0, 1, 15, 0, 0, '0.00', '0.00', '0.00', 1, '黑色|', 'X|', 'pjeupf1402729544');

-- --------------------------------------------------------

--
-- 表的结构 `tp_item_attr`
--

CREATE TABLE IF NOT EXISTS `tp_item_attr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) NOT NULL,
  `attr_name` varchar(50) NOT NULL,
  `attr_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_item_cate`
--

CREATE TABLE IF NOT EXISTS `tp_item_cate` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- 转存表中的数据 `tp_item_cate`
--

INSERT INTO `tp_item_cate` (`id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc`, `tokenTall`) VALUES
(1, '上衣', '', 0, '0', '/Uploads/image/20140512/53703b0885aab.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'labnkv1398317973'),
(5, '挂饰', '', 0, '0', '/Uploads/image/20140512/53703b3e4cb2c.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'labnkv1398317973'),
(6, '女装', '', 0, '0', '/Uploads/image/20140512/53703eceda4e4.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'labnkv1398317973'),
(7, '运动', '', 0, '0', '/Uploads/image/20140512/53703f461c211.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'labnkv1398317973'),
(8, '内衣', '', 0, '0', '/Uploads/image/20140512/53703fc7db78e.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'labnkv1398317973'),
(9, '86测试款1', '', 0, '0', '/Uploads/image/20140512/5370cbec1773c.png', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'rmzthc1399729257'),
(11, '测试', '', 0, '0', '/Uploads/image/20140518/537860024f806.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'labnkv1398317973'),
(12, '男士内衣', '', 0, '0', '/Uploads/image/20140519/5379a67469162.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'labnkv1398317973'),
(13, '新闻资讯', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(14, '大事记', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(15, '开发区简介', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(25, '建言献策', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(24, '办事指南', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(23, '临港产业', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(19, '经开发区大事记', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(20, '办事指南', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(29, '入住企业', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(30, '上市公司', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(27, '投资优势', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(31, '工作动态', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(32, '通知公告', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(33, '媒体聚焦', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(34, '他山之石', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(35, '特色产业', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(36, '整体布局', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(37, '整体布局', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(38, '功能配套', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(39, '港城底蕴', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(40, '环保理念', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(41, '生态环境', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(42, '社会保障', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(43, '文化活动', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(44, '名牌企业', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(45, '企业动态', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(46, '企业服务', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(47, '生活环境', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(48, '人文民风', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(49, '国家级平台', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(50, '名声动态', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(51, '政策法规', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(52, '工作思路', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(53, '办公室文件', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(54, '机构概况', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(55, '政府概况', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(56, '政策法规', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(57, '规划计划', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(58, '人事信息', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(59, '财政信息', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(60, '工作报告', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(61, '工作会议', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(62, '实事项目', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(63, '重点工作', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(64, '应急管理', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(65, '统计信息', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(66, '农村工作', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(67, '计划生育', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(68, '土地利用', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(69, '房屋拆迁', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(70, '公益求助', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(71, '大事记', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '', 'pjeupf1402729544'),
(72, '江阴概况', '106', 0, '', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', '', 'pjeupf1402729544'),
(73, '他山之石', '107', 0, '', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', '', 'pjeupf1402729544'),
(74, '通知公告', '108', 0, '', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', '', 'pjeupf1402729544'),
(76, '就医资讯', '110', 0, '', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', '', 'pjeupf1402729544'),
(77, '专家观点', '111', 0, '', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', '', 'pjeupf1402729544'),
(78, '绿色通道', '112', 0, '', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', '', 'pjeupf1402729544'),
(79, '公司 新闻', '113', 0, '', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', '', 'pjeupf1402729544');

-- --------------------------------------------------------

--
-- 表的结构 `tp_item_cate_tag`
--

CREATE TABLE IF NOT EXISTS `tp_item_cate_tag` (
  `cate_id` smallint(4) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `cate_id` (`cate_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_item_comment`
--

CREATE TABLE IF NOT EXISTS `tp_item_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_item_img`
--

CREATE TABLE IF NOT EXISTS `tp_item_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `tp_item_img`
--

INSERT INTO `tp_item_img` (`id`, `item_id`, `url`, `add_time`, `ordid`, `status`) VALUES
(5, 6, '/Uploads/image/20140512/5370437724f91.png', 1398870532, 255, 1),
(7, 8, '/Uploads/image/20140512/537042ff09b52.jpg', 1398877470, 255, 1),
(8, 9, '/Uploads/image/20140512/5370cc8db86d7.jpg', 1399901410, 255, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_item_like`
--

CREATE TABLE IF NOT EXISTS `tp_item_like` (
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`item_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_item_order`
--

CREATE TABLE IF NOT EXISTS `tp_item_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '订单号',
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
  `tokenTall` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `orderSource` smallint(1) NOT NULL COMMENT '订单来源0.客户 1.客服',
  `orderType` varchar(20) NOT NULL DEFAULT '0' COMMENT '服务类/商品类',
  `personnel` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tp_item_order`
--

INSERT INTO `tp_item_order` (`id`, `orderId`, `add_time`, `goods_sumPrice`, `order_sumPrice`, `note`, `userId`, `userName`, `address_name`, `mobile`, `address`, `status`, `supportmetho`, `freetype`, `freeprice`, `closemsg`, `support_time`, `sellerRemark`, `userfree`, `freecode`, `fahuoaddress`, `fahuo_time`, `tokenTall`, `orderSource`, `orderType`, `personnel`) VALUES
(3, '201405061215271539', 1399349727, '1.00', '1.00', '', 27, 'ddd', '去去去', '1234567890', '北京市市辖区东城区我问问', 1, 1, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL, 'labnkv1398317973', 0, '0', ''),
(4, '201405141125001858', 1400037900, '258.00', '269.00', 'sadfsadfsdf', 1, 'admin', 'asdf', '15358568456', '天津市市辖区和平区sdfsdf', 1, NULL, 2, '11.00', NULL, NULL, NULL, '', NULL, NULL, NULL, 'labnkv1398317973', 0, '0', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_item_orig`
--

CREATE TABLE IF NOT EXISTS `tp_item_orig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_item_site`
--

CREATE TABLE IF NOT EXISTS `tp_item_site` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_item_tag`
--

CREATE TABLE IF NOT EXISTS `tp_item_tag` (
  `item_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `item_id` (`item_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_keyword`
--

CREATE TABLE IF NOT EXISTS `tp_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` char(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `token` varchar(60) NOT NULL,
  `module` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `token` (`token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=147 ;

--
-- 转存表中的数据 `tp_keyword`
--

INSERT INTO `tp_keyword` (`id`, `keyword`, `pid`, `token`, `module`) VALUES
(1, '', 1, 'labnkv1398317973', 'diymen'),
(3, '大转盘', 2, 'labnkv1398317973', 'Lottery'),
(48, '入驻企业', 10991, 'pjeupf1402729544', 'Img'),
(5, '', 2, 'pjeupf1402729544', 'diymen'),
(6, '便民', 3, 'pjeupf1402729544', 'diymen'),
(7, '', 4, 'pjeupf1402729544', 'diymen'),
(8, '', 5, 'pjeupf1402729544', 'diymen'),
(57, '功能配套', 11000, 'pjeupf1402729544', 'Img'),
(58, '功能配套', 11001, 'pjeupf1402729544', 'Img'),
(59, '功能配套', 11002, 'pjeupf1402729544', 'Img'),
(56, '关注回复', 10999, 'pjeupf1402729544', 'Img'),
(46, '', 2759, 'pjeupf1402729544', 'Img'),
(50, '公共服务', 10993, 'pjeupf1402729544', 'Img'),
(51, '公共服务', 10994, 'pjeupf1402729544', 'Img'),
(20, '', 17, 'pjeupf1402729544', 'diymen'),
(54, '入驻企业', 10997, 'pjeupf1402729544', 'Img'),
(52, '公共服务', 10995, 'pjeupf1402729544', 'Img'),
(49, '入驻企业', 10992, 'pjeupf1402729544', 'Img'),
(24, '机构设置', 1, 'pjeupf1402729544', 'Text'),
(25, '开发区简介', 4, 'pjeupf1402729544', 'Img'),
(26, '港城风貌', 5, 'pjeupf1402729544', 'Img'),
(55, '关注回复', 10998, 'pjeupf1402729544', 'Img'),
(31, '通知公告', 10, 'pjeupf1402729544', 'Img'),
(32, '通知公告', 11, 'pjeupf1402729544', 'Img'),
(33, '媒体聚焦', 12, 'pjeupf1402729544', 'Img'),
(74, '办事指南', 11017, 'pjeupf1402729544', 'Img'),
(53, '公共服务', 10996, 'pjeupf1402729544', 'Img'),
(60, '功能配套', 11003, 'pjeupf1402729544', 'Img'),
(61, '功能配套', 11004, 'pjeupf1402729544', 'Img'),
(62, '功能配套', 11005, 'pjeupf1402729544', 'Img'),
(63, '功能配套', 11006, 'pjeupf1402729544', 'Img'),
(64, '功能配套', 11007, 'pjeupf1402729544', 'Img'),
(65, '功能配套', 11008, 'pjeupf1402729544', 'Img'),
(66, '功能配套', 11009, 'pjeupf1402729544', 'Img'),
(73, '办事指南', 11016, 'pjeupf1402729544', 'Img'),
(75, '办事指南', 11018, 'pjeupf1402729544', 'Img'),
(76, '新闻视频', 11019, 'pjeupf1402729544', 'Img'),
(77, '新闻视频', 11020, 'pjeupf1402729544', 'Img'),
(78, '新闻视频', 11021, 'pjeupf1402729544', 'Img'),
(79, '机构概况', 11022, 'pjeupf1402729544', 'Img'),
(81, '证点分布', 11024, 'pjeupf1402729544', 'Img'),
(82, '证点分布', 11025, 'pjeupf1402729544', 'Img'),
(83, '证点分布', 11026, 'pjeupf1402729544', 'Img'),
(84, '证点分布', 11027, 'pjeupf1402729544', 'Img'),
(135, '中国家庭医生：阿司匹林，防心脑血管意外的良药', 11078, 'pjeupf1402729544', 'Img'),
(87, '风格的', 11030, 'pjeupf1402729544', 'Img'),
(96, '冻死了副教授了地方军绿色的', 11039, 'pjeupf1402729544', 'Img'),
(97, '测试', 11040, 'pjeupf1402729544', 'Img'),
(98, '是的发放', 11041, 'pjeupf1402729544', 'Img'),
(99, '出特色', 11042, 'pjeupf1402729544', 'Img'),
(100, '测试', 11043, 'pjeupf1402729544', 'Img'),
(126, '通知公告', 11069, 'pjeupf1402729544', 'Img'),
(103, '', 11046, 'pjeupf1402729544', 'Img'),
(114, '办事指南', 11057, 'pjeupf1402729544', 'Img'),
(107, '政策法规', 11050, 'pjeupf1402729544', 'Img'),
(106, '政策法规', 11049, 'pjeupf1402729544', 'Img'),
(108, '政策法规', 11051, 'pjeupf1402729544', 'Img'),
(109, '政策法规', 11052, 'pjeupf1402729544', 'Img'),
(110, '政策法规', 11053, 'pjeupf1402729544', 'Img'),
(111, '政策法规', 11054, 'pjeupf1402729544', 'Img'),
(112, '政策法规', 11055, 'pjeupf1402729544', 'Img'),
(113, '办事指南', 11056, 'pjeupf1402729544', 'Img'),
(115, '办事指南', 11058, 'pjeupf1402729544', 'Img'),
(116, '办事指南', 11059, 'pjeupf1402729544', 'Img'),
(117, '办事指南', 11060, 'pjeupf1402729544', 'Img'),
(118, '办事指南', 11061, 'pjeupf1402729544', 'Img'),
(119, '办事指南', 11062, 'pjeupf1402729544', 'Img'),
(120, '办事指南', 11063, 'pjeupf1402729544', 'Img'),
(121, '办事指南', 11064, 'pjeupf1402729544', 'Img'),
(122, '办事指南', 11065, 'pjeupf1402729544', 'Img'),
(124, '', 11067, 'pjeupf1402729544', 'Img'),
(125, '通知公告', 11068, 'pjeupf1402729544', 'Img'),
(127, '通知公告', 11070, 'pjeupf1402729544', 'Img'),
(131, '征点分布', 11074, 'pjeupf1402729544', 'Img'),
(130, '征点分布', 11073, 'pjeupf1402729544', 'Img'),
(132, '通知公告', 11075, 'pjeupf1402729544', 'Img'),
(134, '机构概况', 11077, 'pjeupf1402729544', 'Img'),
(136, '喉癌主要发生在声带等部位', 11079, 'pjeupf1402729544', 'Img'),
(137, '60%的习惯性流产，和免疫因素相关', 11080, 'pjeupf1402729544', 'Img'),
(138, '破解看病难应从“小处着手”', 11081, 'pjeupf1402729544', 'Img'),
(139, '挂号网“已满”、“淘宝号”慎重，网上挂号该走向哪里？', 11082, 'pjeupf1402729544', 'Img'),
(140, '如何应对煤气中毒', 11083, 'pjeupf1402729544', 'Img'),
(141, '小中风不可忽视要急诊', 11084, 'pjeupf1402729544', 'Img'),
(142, '感冒了？用这几个方法科学治感冒', 11085, 'pjeupf1402729544', 'Img');

-- --------------------------------------------------------

--
-- 表的结构 `tp_keyword_wetall`
--

CREATE TABLE IF NOT EXISTS `tp_keyword_wetall` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_links`
--

CREATE TABLE IF NOT EXISTS `tp_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `url` char(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_liuyan`
--

CREATE TABLE IF NOT EXISTS `tp_liuyan` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_liuyan1`
--

CREATE TABLE IF NOT EXISTS `tp_liuyan1` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_lottery`
--

CREATE TABLE IF NOT EXISTS `tp_lottery` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tp_lottery`
--

INSERT INTO `tp_lottery` (`id`, `joinnum`, `click`, `token`, `keyword`, `starpicurl`, `title`, `txt`, `sttxt`, `statdate`, `enddate`, `info`, `aginfo`, `endtite`, `endpicurl`, `endinfo`, `fist`, `fistnums`, `fistlucknums`, `second`, `type`, `secondnums`, `secondlucknums`, `third`, `thirdnums`, `thirdlucknums`, `allpeople`, `canrqnums`, `parssword`, `renamesn`, `renametel`, `displayjpnums`, `createtime`, `status`, `four`, `fournums`, `fourlucknums`, `five`, `fivenums`, `fivelucknums`, `six`, `sixnums`, `sixlucknums`, `zjpic`) VALUES
(2, 0, 0, 'labnkv1398317973', '大转盘', './tpl/Wap/default/common/css/guajiang/images/activity-lottery-start.jpg', '幸运大转盘活动开始了', '兑奖请联系我们，电话18950099999', '231', 1399824000, 1400083200, '亲，请点击进入大转盘抽奖活动页面，祝您好运哦！', '亲，继续努力哦！', '幸运大转盘活动已经结束了', './tpl/Wap/default/common/css/guajiang/images/activity-lottery-end.jpg', '亲，活动已经结束，请继续关注我们的后续活动哦。', '212', 1, 0, '231', 1, 2, 0, '', 0, 0, 4, 5, 0, '', '', 0, 1399906819, 1, '', 0, 0, '', 0, 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_lottery_record`
--

CREATE TABLE IF NOT EXISTS `tp_lottery_record` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_mail_queue`
--

CREATE TABLE IF NOT EXISTS `tp_mail_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail_to` varchar(120) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `err_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `lock_expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_member`
--

CREATE TABLE IF NOT EXISTS `tp_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `isopen` int(1) NOT NULL,
  `homepic` varchar(100) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_member_card_contact`
--

CREATE TABLE IF NOT EXISTS `tp_member_card_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `cname` varchar(30) NOT NULL,
  `tel` varchar(12) NOT NULL,
  `sort` tinyint(1) NOT NULL,
  `info` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_member_card_coupon`
--

CREATE TABLE IF NOT EXISTS `tp_member_card_coupon` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_member_card_create`
--

CREATE TABLE IF NOT EXISTS `tp_member_card_create` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `number` varchar(20) NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

--
-- 转存表中的数据 `tp_member_card_create`
--

INSERT INTO `tp_member_card_create` (`id`, `token`, `number`, `wecha_id`) VALUES
(1, 'rmzthc1399729257', '86show8602', ''),
(2, 'rmzthc1399729257', '86show8603', ''),
(3, 'rmzthc1399729257', '86show8604', ''),
(4, 'rmzthc1399729257', '86show8605', ''),
(5, 'rmzthc1399729257', '86show8606', ''),
(6, 'rmzthc1399729257', '86show8607', ''),
(7, 'rmzthc1399729257', '86show8608', ''),
(8, 'rmzthc1399729257', '86show8609', ''),
(9, 'rmzthc1399729257', '86show8610', ''),
(10, 'rmzthc1399729257', '86show8611', ''),
(11, 'rmzthc1399729257', '86show8612', ''),
(12, 'rmzthc1399729257', '86show8613', ''),
(13, 'rmzthc1399729257', '86show8614', ''),
(14, 'rmzthc1399729257', '86show8615', ''),
(15, 'rmzthc1399729257', '86show8616', ''),
(16, 'rmzthc1399729257', '86show8617', ''),
(17, 'rmzthc1399729257', '86show8618', ''),
(18, 'rmzthc1399729257', '86show8619', ''),
(19, 'rmzthc1399729257', '86show8620', ''),
(20, 'rmzthc1399729257', '86show8621', ''),
(21, 'rmzthc1399729257', '86show8622', ''),
(22, 'rmzthc1399729257', '86show8623', ''),
(23, 'rmzthc1399729257', '86show8624', ''),
(24, 'rmzthc1399729257', '86show8625', ''),
(25, 'rmzthc1399729257', '86show8626', ''),
(26, 'rmzthc1399729257', '86show8627', ''),
(27, 'rmzthc1399729257', '86show8628', ''),
(28, 'rmzthc1399729257', '86show8629', ''),
(29, 'rmzthc1399729257', '86show8630', ''),
(30, 'rmzthc1399729257', '86show8631', ''),
(31, 'rmzthc1399729257', '86show8632', ''),
(32, 'rmzthc1399729257', '86show8633', ''),
(33, 'rmzthc1399729257', '86show8634', ''),
(34, 'rmzthc1399729257', '86show8635', ''),
(35, 'rmzthc1399729257', '86show8636', ''),
(36, 'rmzthc1399729257', '86show8637', ''),
(37, 'rmzthc1399729257', '86show8638', ''),
(38, 'rmzthc1399729257', '86show8639', ''),
(39, 'rmzthc1399729257', '86show8640', ''),
(40, 'rmzthc1399729257', '86show8641', ''),
(41, 'rmzthc1399729257', '86show8642', ''),
(42, 'rmzthc1399729257', '86show8643', ''),
(43, 'rmzthc1399729257', '86show8644', ''),
(44, 'rmzthc1399729257', '86show8645', ''),
(45, 'rmzthc1399729257', '86show8646', ''),
(46, 'rmzthc1399729257', '86show8647', ''),
(47, 'rmzthc1399729257', '86show8648', ''),
(48, 'rmzthc1399729257', '86show8649', ''),
(49, 'rmzthc1399729257', '86show8650', ''),
(50, 'rmzthc1399729257', '86show8651', ''),
(51, 'rmzthc1399729257', '86show8652', ''),
(52, 'rmzthc1399729257', '86show8653', ''),
(53, 'rmzthc1399729257', '86show8654', ''),
(54, 'rmzthc1399729257', '86show8655', ''),
(55, 'rmzthc1399729257', '86show8656', ''),
(56, 'rmzthc1399729257', '86show8657', ''),
(57, 'rmzthc1399729257', '86show8658', ''),
(58, 'rmzthc1399729257', '86show8659', ''),
(59, 'rmzthc1399729257', '86show8660', ''),
(60, 'rmzthc1399729257', '86show8661', ''),
(61, 'rmzthc1399729257', '86show8662', ''),
(62, 'rmzthc1399729257', '86show8663', ''),
(63, 'rmzthc1399729257', '86show8664', ''),
(64, 'rmzthc1399729257', '86show8665', ''),
(65, 'rmzthc1399729257', '86show8666', ''),
(66, 'rmzthc1399729257', '86show8667', ''),
(67, 'rmzthc1399729257', '86show8668', ''),
(68, 'rmzthc1399729257', '86show8669', ''),
(69, 'rmzthc1399729257', '86show8670', ''),
(70, 'rmzthc1399729257', '86show8671', ''),
(71, 'rmzthc1399729257', '86show8672', ''),
(72, 'rmzthc1399729257', '86show8673', ''),
(73, 'rmzthc1399729257', '86show8674', ''),
(74, 'rmzthc1399729257', '86show8675', ''),
(75, 'rmzthc1399729257', '86show8676', ''),
(76, 'rmzthc1399729257', '86show8677', ''),
(77, 'rmzthc1399729257', '86show8678', ''),
(78, 'rmzthc1399729257', '86show8679', ''),
(79, 'rmzthc1399729257', '86show8680', ''),
(80, 'rmzthc1399729257', '86show8681', ''),
(81, 'rmzthc1399729257', '86show8682', ''),
(82, 'rmzthc1399729257', '86show8683', ''),
(83, 'rmzthc1399729257', '86show8684', ''),
(84, 'rmzthc1399729257', '86show8685', ''),
(85, 'rmzthc1399729257', '86show8686', ''),
(86, 'rmzthc1399729257', '86show8687', ''),
(87, 'rmzthc1399729257', '86show8688', ''),
(88, 'rmzthc1399729257', '86show8689', ''),
(89, 'rmzthc1399729257', '86show8690', ''),
(90, 'rmzthc1399729257', '86show8691', ''),
(91, 'rmzthc1399729257', '86show8692', ''),
(92, 'rmzthc1399729257', '86show8693', ''),
(93, 'rmzthc1399729257', '86show8694', ''),
(94, 'rmzthc1399729257', '86show8695', ''),
(95, 'rmzthc1399729257', '86show8696', ''),
(96, 'rmzthc1399729257', '86show8697', ''),
(97, 'rmzthc1399729257', '86show8698', ''),
(98, 'rmzthc1399729257', '86show8699', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_member_card_exchange`
--

CREATE TABLE IF NOT EXISTS `tp_member_card_exchange` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_member_card_exchange`
--

INSERT INTO `tp_member_card_exchange` (`id`, `token`, `everyday`, `continuation`, `reward`, `cardinfo`, `cardinfo2`, `create_time`, `shareFriend`, `url`, `title`, `content`) VALUES
(1, 'rmzthc1399729257', 10, 100, 1, '1', '2', 1399903704, 20, '', '', '3');

-- --------------------------------------------------------

--
-- 表的结构 `tp_member_card_info`
--

CREATE TABLE IF NOT EXISTS `tp_member_card_info` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_member_card_integral`
--

CREATE TABLE IF NOT EXISTS `tp_member_card_integral` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_member_card_set`
--

CREATE TABLE IF NOT EXISTS `tp_member_card_set` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_member_card_sign`
--

CREATE TABLE IF NOT EXISTS `tp_member_card_sign` (
  `id` int(11) NOT NULL,
  `token` varchar(50) NOT NULL,
  `wecha_id` varchar(50) NOT NULL,
  `sign_time` int(11) NOT NULL,
  `is_sign` int(11) NOT NULL,
  `score_type` int(11) NOT NULL,
  `expense` int(11) NOT NULL,
  `sell_expense` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_member_card_vip`
--

CREATE TABLE IF NOT EXISTS `tp_member_card_vip` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_menu`
--

CREATE TABLE IF NOT EXISTS `tp_menu` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=314 ;

--
-- 转存表中的数据 `tp_menu`
--

INSERT INTO `tp_menu` (`id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display`) VALUES
(1, '全局', 0, 'setting', 'index', '', '', -1, 7, 0),
(2, '核心设置', 1, 'setting', 'index', '', '', -1, 0, 1),
(3, '全局参数', 148, 'setting', 'index', '&type=site', '', -1, 2, 1),
(4, '邮件设置', 148, 'setting', 'index', '&type=mail', '', -1, 5, 1),
(172, '专辑管理', 285, 'album', 'index', '', '', -1, 4, 1),
(6, '菜单管理', 2, 'menu', 'index', '', '', -1, 7, 1),
(7, '新增', 6, 'menu', 'add', '', '', -1, 0, 0),
(8, '编辑', 6, 'menu', 'edit', '', '', -1, 0, 0),
(9, '删除', 6, 'menu', 'delete', '', '', -1, 0, 0),
(10, '运营', 0, 'operate', 'index', '', '', -1, 4, 0),
(11, '广告管理', 10, 'advert', 'index', '', '', -1, 2, 1),
(12, '广告管理', 11, 'ad', 'index', '', '', 2, 0, 1),
(13, '广告位管理', 11, 'adboard', 'index', '', '', -1, 0, 0),
(14, '友情链接', 10, 'flink', 'index', '', '', -1, 3, 0),
(15, '友情链接', 14, 'flink', 'index', '', '', -1, 0, 1),
(16, '链接分类', 14, 'flink_cate', 'index', '', '', -1, 0, 1),
(17, '新增', 15, 'flink', 'add', '', '', -1, 0, 0),
(18, '编辑', 15, 'flink', 'edit', '', '', -1, 0, 0),
(19, '删除', 15, 'flink', 'delete', '', '', -1, 0, 0),
(20, '新增', 16, 'flink_cate', 'add', '', '', -1, 0, 0),
(21, '编辑', 16, 'flink_cate', 'edit', '', '', -1, 0, 0),
(22, '删除', 16, 'flink_cate', 'del', '', '', -1, 0, 0),
(23, '新增', 12, 'ad', 'add', '', '', -1, 0, 0),
(24, '编辑', 12, 'ad', 'edit', '', '', -1, 0, 0),
(25, '删除', 12, 'ad', 'delete', '', '', -1, 0, 0),
(26, '新增', 13, 'adboard', 'add', '', '', -1, 0, 0),
(27, '编辑', 13, 'adboard', 'edit', '', '', -1, 0, 0),
(28, '删除', 13, 'adboard', 'delete', '', '', -1, 0, 0),
(29, '数据', 0, 'data', 'index', '', '', -1, 5, 0),
(258, '商品分类', 256, 'score_item_cate', 'index', '', '', -1, 255, 1),
(31, '数据库管理', 29, 'backup', 'index', '', '', -1, 2, 1),
(32, '数据备份', 31, 'backup', 'index', '', '', -1, 0, 1),
(33, '数据恢复', 31, 'backup', 'restore', '', '', -1, 0, 1),
(34, '缓存管理', 254, 'cache', 'index', '', '', -1, 0, 1),
(195, '登陆接口', 245, 'oauth', 'index', '', '', -1, 2, 0),
(36, '黑名单管理', 117, 'ipban', 'index', '', '', -1, 3, 0),
(37, '新增', 36, 'ipban', 'add', '', '', -1, 0, 0),
(38, '编辑', 36, 'ipban', 'edit', '', '', -1, 0, 0),
(50, '商品', 0, 'content', 'index', '', '', -1, 1, 0),
(51, '商品管理', 50, 'article', 'index', '', '', -1, 1, 1),
(52, '商品管理', 51, 'item', 'index', '', '', 0, 1, 1),
(54, '编辑', 52, 'article', 'edit', '', '', -1, 3, 0),
(190, '删除', 52, 'item', 'delete', '', '', -1, 4, 0),
(56, '商品分类', 51, 'item_cate', 'index', '', '', 0, 6, 1),
(57, '新增', 56, 'article_cate', 'add', '', '', -1, 0, 0),
(58, '编辑', 56, 'article_cate', 'edit', '', '', -1, 0, 0),
(59, '删除', 56, 'article_cate', 'delete', '', '', -1, 0, 0),
(60, '管理员管理', 1, 'admin', 'index', '', '', -1, 4, 1),
(61, '管理员管理', 60, 'admin', 'index', '', '', -1, 0, 1),
(62, '新增', 61, 'admin', 'add', '', '', -1, 0, 0),
(63, '编辑', 61, 'admin', 'edit', '', '', -1, 0, 0),
(64, '删除', 61, 'admin', 'delete', '', '', -1, 0, 0),
(65, '角色管理', 60, 'admin_role', 'index', '', '', -1, 0, 1),
(66, '新增', 65, 'admin_role', 'add', '', '', -1, 0, 0),
(192, '淘宝采集', 164, 'collect_alimama', 'index', '', '', -1, 0, 1),
(70, '用户', 0, 'user', 'index', '', '', -1, 3, 0),
(119, '新增', 149, 'user', 'add', '', '', -1, 3, 0),
(118, '编辑', 149, 'user', 'edit', '', '', -1, 4, 0),
(117, '会员管理', 70, 'user', 'index', '', '', 4, 0, 1),
(156, '文章分类', 154, 'article_cate', 'index', '', '', -1, 3, 1),
(151, '导航设置', 216, 'nav', 'index', '', '', -1, 1, 1),
(149, '会员管理', 117, 'user', 'index', '', '', -1, 1, 1),
(150, '删除', 149, 'user', 'delete', '', '', -1, 5, 0),
(152, '主导航', 151, 'nav', 'index', '&type=main', '', -1, 1, 1),
(153, '底部导航', 151, 'nav', 'index', '&type=bottom', '', -1, 2, 1),
(154, '文章管理', 10, 'article', 'index', '', '', -1, 1, 1),
(155, '文章管理', 154, 'article', 'index', '', '', -1, 1, 1),
(148, '站点设置', 2, 'setting', 'index', '', '', -1, 0, 1),
(157, '添加文章', 155, 'article', 'add', '', '', -1, 2, 1),
(158, '编辑', 155, 'article', 'edit', '', '', -1, 3, 0),
(159, '删除', 155, 'article', 'delete', '', '', -1, 4, 0),
(160, '新增', 156, 'article_cate', 'add', '', '', -1, 0, 0),
(161, '编辑', 156, 'article_cate', '编辑', '', '', -1, 0, 0),
(162, '删除', 156, 'article_cate', 'delete', '', '', -1, 0, 0),
(164, '商品采集', 50, 'item_collect', 'index', '', '', -1, 2, 0),
(173, '专辑管理', 172, 'album', 'index', '', '', -1, 1, 1),
(174, '专辑分类', 172, 'album_cate', 'index', '', '', -1, 3, 1),
(175, '新增', 174, 'album_cate', 'add', '', '', -1, 0, 0),
(176, '编辑', 174, 'album_cate', 'edit', '', '', -1, 0, 0),
(177, '删除', 174, 'album_cate', 'delete', '', '', -1, 0, 0),
(178, '敏感词管理', 254, 'badword', 'index', '', '', -1, 4, 1),
(179, '新增', 178, 'badword', 'add', '', '', -1, 0, 0),
(180, '编辑', 178, 'badword', 'edit', '', '', -1, 0, 0),
(181, '删除', 36, 'ipban', 'delete', '', '', -1, 0, 0),
(182, '删除', 178, 'badword', 'delete', '', '', -1, 0, 0),
(255, '采集马甲', 117, 'auto_user', 'index', '', '', -1, 2, 0),
(184, '标签管理', 254, 'tag', 'index', '', '', -1, 3, 1),
(185, '商品接口', 245, 'item_site', 'index', '', '', -1, 1, 1),
(186, '商品评论', 51, 'item_comment', 'index', '', '', -1, 7, 0),
(187, '删除', 186, 'item_comment', 'delete', '', '', -1, 0, 0),
(265, '删除', 257, 'score_item', 'edit', '', '', -1, 4, 0),
(250, '一键删除', 51, 'item', 'delete_search', '', '', -1, 5, 1),
(198, '新增', 196, 'message', 'add', '', '', -1, 0, 0),
(199, '商品来源', 51, 'item_orig', 'index', '', '', -1, 6, 0),
(200, '新增', 199, 'item_orig', 'add', '', '', -1, 0, 0),
(201, '编辑', 199, 'item_orig', 'edit', '', '', -1, 0, 0),
(202, '删除', 199, 'item_orig', 'delete', '', '', -1, 0, 0),
(203, '商品审核', 51, 'item', 'check', '', '', -1, 5, 0),
(249, '添加商品', 51, 'item', 'add', '', '', 0, 3, 1),
(259, '新增', 258, 'score_item_cate', 'add', '', '', -1, 255, 0),
(268, '批量添加', 164, 'collect_batch', 'index', '', '', -1, 255, 0),
(269, '积分设置', 2, 'score', 'setting', '', '', -1, 3, 0),
(210, '专辑审核', 172, 'album', 'check', '', '', -1, 2, 1),
(257, '积分商品', 256, 'score_item', 'index', '', '', -1, 255, 1),
(212, '日志管理', 29, 'log', 'index', '', '', -1, 3, 0),
(213, '管理员日志', 212, 'log', 'index', '', '', -1, 0, 0),
(214, '用户日志', 212, 'log', 'user', '', '', -1, 0, 1),
(215, '积分日志', 212, 'log', 'score', '', '', -1, 0, 0),
(216, '界面设置', 1, 'setting', 'index', '&type=show', '', -1, 2, 0),
(256, '积分商城', 70, 'score_item', 'index', '', '', -1, 255, 0),
(254, '系统数据', 29, 'tag', 'index', '', '', -1, 1, 1),
(264, '编辑', 257, 'score_item', 'edit', '', '', -1, 3, 0),
(263, '添加商品', 257, 'score_item', 'add', '', '', -1, 2, 1),
(262, '积分订单', 256, 'score_order', 'index', '', '', -1, 255, 1),
(261, '删除', 258, 'score_item_cate', 'delete', '', '', -1, 255, 0),
(260, '编辑', 258, 'score_item_cate', 'edit', '', '', -1, 255, 0),
(232, '站内信管理', 70, 'message', 'index', '', '', -1, 0, 0),
(233, '系统通知', 232, 'message', 'index', '&type=1', '', -1, 0, 1),
(234, '用户私信', 232, 'message', 'index', '&type=2', '', -1, 0, 1),
(235, '通知模版', 2, 'message_tpl', 'index', '&type=msg', '', -1, 4, 0),
(236, '添加模版', 235, 'message_tpl', 'add', '', '', -1, 7, 1),
(237, '编辑', 235, 'message_tpl', 'edit', '', '', -1, 255, 0),
(238, '删除', 235, 'message_tpl', 'delete', '', '', -1, 255, 0),
(240, '单页管理', 154, 'article', 'page', '', '', -1, 2, 1),
(242, '积分记录', 269, 'score', 'logs', '', '', -1, 2, 1),
(244, '应用', 0, 'plugin', 'index', '', '', -1, 6, 0),
(245, '系统接口', 244, 'apis', 'index', '', '', -1, 1, 1),
(246, '应用管理', 244, 'plugin', 'index', '', '', -1, 3, 0),
(247, '应用中心', 246, 'plugin', 'index', '', '', -1, 0, 1),
(248, '已安装应用', 246, 'plugin', 'list', '', '', -1, 0, 1),
(252, '用户整合', 245, 'integrate', 'index', '', '', -1, 255, 0),
(253, '图片模式', 52, 'item', 'index', '&sm=image', '', -1, 2, 1),
(267, '批量注册', 149, 'user', 'add_users', '', '', -1, 2, 1),
(270, '邮件模板', 235, 'message_tpl', 'index', '&type=mail', '', -1, 6, 1),
(271, '短消息模板', 235, 'message_tpl', 'index', '&type=msg', '', -1, 5, 1),
(272, '附件设置', 148, 'setting', 'index', '&type=attachment', '', -1, 4, 1),
(273, '显示设置', 216, 'setting', 'index', '&type=style', '', -1, 2, 1),
(274, '模板管理', 216, 'template', 'index', '', '', -1, 3, 0),
(275, '站点设置', 148, 'setting', 'index', '', '', 99, 1, 1),
(276, '积分设置', 269, 'score', 'setting', '', '', -1, 1, 1),
(277, '商品管理', 52, 'item', 'index', '', '', -1, 1, 1),
(278, '文章管理', 155, 'article', 'index', '', '', -1, 1, 1),
(279, '会员管理', 149, 'user', 'index', '', '', -1, 1, 1),
(280, '积分商品', 257, 'score_item', 'index', '', '', -1, 1, 1),
(281, '淘宝评论', 164, 'cmt_taobao', 'index', '', '', -1, 255, 0),
(282, 'SEO设置', 2, 'seo', 'url', '', '', -1, 5, 0),
(283, 'UR静态化', 282, 'seo', 'url', '', '', -1, 255, 1),
(284, '页面SEO', 282, 'seo', 'page', '', '', -1, 255, 1),
(285, '专辑', 0, 'album', 'index', '', '', -1, 2, 0),
(286, '注册登陆', 2, 'setting', 'user', '', '', -1, 2, 1),
(293, '编辑', 291, 'brandlist', ' edit', '', '', -1, 255, 0),
(292, '新增', 291, 'brandlist', 'add', '', '', -1, 255, 0),
(291, '品牌管理', 51, 'brandlist', 'index', '', '', 0, 1, 1),
(294, '删除', 291, 'brandlist', 'delete', '', '', -1, 255, 0),
(295, '交易管理', 50, 'item_order', 'index', '', '', -1, 255, 1),
(296, '订单管理', 295, 'item_order', 'index', '', '', 1, 255, 1),
(297, '快递方式管理', 295, 'delivery', 'index', '', '', 1, 255, 1),
(298, '发货地址管理', 295, 'address', 'index', '', '', 1, 255, 1),
(299, '回复设置', 0, 'keyword', 'index', '', '', -1, 2, 0),
(300, '回复设置', 299, 'keyword', 'index', '', '', -1, 255, 1),
(301, '关键词自动回复', 300, 'keyword', 'addkeyword', '', '', -1, 255, 1),
(302, '消息自动回复', 300, 'keyword', 'addmess', '', '', -1, 255, 1),
(303, '关注自动回复', 300, 'keyword', 'addfollow', '', '', -1, 255, 1),
(304, '收款方式设置', 295, 'alipay', 'index', '', '', 99, 255, 1),
(305, '自定义菜单', 300, 'custom_menu', 'index', '', '', -1, 255, 1),
(306, '添加', 305, 'custom_menu', 'add', '', '', -1, 255, 0),
(307, '编辑', 305, 'custom_menu', 'edit', '', '', -1, 255, 0),
(308, '删除', 305, 'custom_menu', 'delete', '', '', -1, 255, 0),
(310, '结账方式管理', 0, 'account', 'setting', '', '', 3, 255, 1),
(311, '账单管理', 0, 'account', 'index', '', '', 3, 255, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_message`
--

CREATE TABLE IF NOT EXISTS `tp_message` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_message_check`
--

CREATE TABLE IF NOT EXISTS `tp_message_check` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `tokenTall` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_message_tpl`
--

CREATE TABLE IF NOT EXISTS `tp_message_tpl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `is_sys` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL COMMENT '别名',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_micro_research`
--

CREATE TABLE IF NOT EXISTS `tp_micro_research` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tp_micro_research`
--

INSERT INTO `tp_micro_research` (`id`, `question`, `optionA`, `optionB`, `optionC`, `optionD`, `optionE`, `display`, `type`, `answerA`, `answerB`, `answerC`, `answerD`, `answerE`) VALUES
(2, '您对我们的工作满意吗', '非常满意', '满意', '一般', '不满意', '非常不满意', 'Y', 'D', 1, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_myfun`
--

CREATE TABLE IF NOT EXISTS `tp_myfun` (
  `users` int(11) NOT NULL,
  `funtype` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_myfun`
--

INSERT INTO `tp_myfun` (`users`, `funtype`) VALUES
(9, '基本功能'),
(9, '公众平台样式'),
(15, '基本功能'),
(15, '公众平台样式'),
(15, '魅力港城'),
(15, '模块管理'),
(15, '新闻中心'),
(15, '政务相关'),
(15, '招商引资'),
(15, '临港产业城'),
(15, '政务公开'),
(15, '互动交流'),
(15, '档案中心'),
(8, '新闻中心'),
(16, '基本功能'),
(16, '公众平台样式'),
(16, '征点分布'),
(16, '通知公告'),
(16, '政策法规'),
(16, '征税案例'),
(16, '模块管理'),
(16, '机构概况'),
(20, '基本功能'),
(20, '征点分布'),
(20, '通知公告'),
(20, '政策法规'),
(20, '机构概况'),
(20, '办事指南'),
(20, '欠税单位'),
(22, '基本功能'),
(22, '征点分布'),
(22, '通知公告'),
(22, '政策法规'),
(22, '机构概况'),
(22, '办事指南'),
(22, '欠税单位'),
(23, '基本功能'),
(23, '通知公告'),
(23, '政策法规'),
(23, '模块管理'),
(23, '机构概况'),
(23, '办事指南'),
(23, '欠税单位'),
(19, '基本功能'),
(19, '机构概况'),
(19, '征点分布'),
(19, '通知公告'),
(19, '政策法规'),
(19, '模块管理'),
(19, '办事指南'),
(19, '欠税单位'),
(18, '基本功能'),
(18, '机构概况'),
(18, '征点分布'),
(18, '通知公告'),
(18, '政策法规'),
(18, '模块管理'),
(18, '办事指南'),
(18, '欠税单位'),
(24, '基本功能'),
(24, '机构概况'),
(24, '征点分布'),
(24, '通知公告'),
(24, '政策法规'),
(24, '模块管理'),
(24, '办事指南'),
(24, '欠税单位'),
(26, '基本功能'),
(26, '机构概况'),
(26, '征点分布'),
(26, '通知公告'),
(26, '政策法规'),
(26, '模块管理'),
(26, '办事指南'),
(26, '欠税单位'),
(25, '基本功能'),
(25, '机构概况'),
(25, '征点分布'),
(25, '通知公告'),
(25, '政策法规'),
(25, '模块管理'),
(25, '办事指南'),
(25, '欠税单位'),
(27, '基本功能'),
(27, '机构概况'),
(27, '征点分布'),
(27, '通知公告'),
(27, '政策法规'),
(27, '模块管理'),
(27, '办事指南'),
(27, '欠税单位'),
(21, '基本功能'),
(21, '机构概况'),
(21, '征点分布'),
(21, '通知公告'),
(21, '政策法规'),
(21, '办事指南'),
(21, '欠税单位'),
(17, '基本功能'),
(17, '公众平台样式'),
(17, '机构概况'),
(17, '征点分布'),
(17, '通知公告'),
(17, '政策法规'),
(17, '模块管理'),
(17, '办事指南'),
(17, '欠税单位'),
(6, '基本功能'),
(6, '公众平台样式'),
(6, '分类管理'),
(6, '商家管理'),
(6, '服务项目');

-- --------------------------------------------------------

--
-- 表的结构 `tp_nav`
--

CREATE TABLE IF NOT EXISTS `tp_nav` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_nearby_user`
--

CREATE TABLE IF NOT EXISTS `tp_nearby_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(30) NOT NULL,
  `uid` varchar(32) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_node`
--

CREATE TABLE IF NOT EXISTS `tp_node` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- 转存表中的数据 `tp_node`
--

INSERT INTO `tp_node` (`id`, `name`, `title`, `status`, `remark`, `pid`, `level`, `data`, `sort`, `display`) VALUES
(1, 'cms', '根节点', 1, '', 0, 1, NULL, 0, 0),
(2, 'Site', '站点管理', 1, '', 1, 0, NULL, 0, 1),
(3, 'User', '用户管理', 1, '', 1, 0, NULL, 0, 1),
(4, 'extent', '扩展管理', 1, '', 1, 0, NULL, 0, 0),
(5, 'article', '内容管理', 1, '', 1, 0, NULL, 0, 1),
(6, 'Site', '站点设置', 1, '', 2, 2, NULL, 0, 2),
(7, 'index', '基本信息设置', 1, '', 6, 3, NULL, 0, 2),
(11, 'Node', '节点管理', 1, NULL, 2, 2, NULL, 0, 2),
(12, 'add', '添加节点', 1, '', 11, 3, NULL, 0, 2),
(13, 'index', '节点列表', 1, '', 11, 3, NULL, 0, 2),
(14, 'insert', '写入', 1, '0', 11, 3, NULL, 0, 0),
(15, 'edit', '编辑节点', 1, '0', 11, 3, NULL, 0, 0),
(16, 'update', '更新节点', 1, '0', 11, 3, NULL, 0, 0),
(17, 'del', '删除节点', 1, '0', 11, 3, NULL, 0, 0),
(18, 'User', '用户中心', 1, '0', 3, 2, NULL, 0, 1),
(19, 'add', '添加用户', 1, '0', 18, 3, NULL, 0, 2),
(20, 'index', '用户列表', 1, '0', 18, 3, NULL, 0, 2),
(21, 'edit', '编辑用户', 1, '0', 18, 3, NULL, 0, 0),
(22, 'insert', '写入数据库', 1, '0', 18, 3, NULL, 0, 0),
(23, 'update', '更新用户', 1, '0', 18, 3, NULL, 0, 0),
(24, 'del', '删除用户', 1, '0', 18, 3, NULL, 0, 0),
(25, 'Group', '管理组', 1, '0', 3, 2, NULL, 0, 0),
(26, 'add', '创建用户组', 1, '0', 25, 3, NULL, 0, 2),
(27, 'index', '用户组列表', 1, '0', 25, 3, NULL, 0, 2),
(28, 'edit', '编辑用户组', 1, '0', 25, 3, NULL, 0, 0),
(29, 'del', '删除用户组', 1, '0', 25, 3, NULL, 0, 0),
(30, 'insert', '写入数据库', 1, '0', 25, 3, NULL, 0, 0),
(31, 'update', '更新用户组', 1, '0', 25, 3, NULL, 0, 0),
(36, 'menu', '左侧栏', 1, '0', 35, 3, NULL, 0, 0),
(35, 'System', '首页', 1, '0', 1, 0, NULL, 0, 0),
(37, 'main', '右侧栏目', 1, '0', 35, 3, NULL, 0, 0),
(38, 'Article', '微信图文', 1, '0', 5, 2, NULL, 0, 2),
(39, 'index', '图文列表', 1, '0', 38, 3, NULL, 0, 2),
(40, 'add', '图文添加', 1, '0', 38, 3, NULL, 0, 2),
(41, 'edit', '微信图文编辑', 1, '0', 38, 3, NULL, 0, 0),
(42, 'del', '微信图文删除', 1, '0', 38, 3, NULL, 0, 0),
(80, 'token', '公众号管理', 1, '0', 1, 1, NULL, 0, 1),
(45, 'Function', '功能模块', 1, '0', 1, 0, NULL, 0, 1),
(46, 'Function', '功能模块', 1, '0', 45, 2, NULL, 0, 2),
(47, 'add', '添加模块', 1, '0', 46, 3, NULL, 0, 2),
(48, 'User_group', '会员组', 1, '0', 3, 2, NULL, 0, 0),
(49, 'add', '添加会员组', 1, '0', 48, 3, NULL, 0, 2),
(50, 'Users', '前台用户', 1, '0', 3, 2, NULL, 0, 2),
(51, 'index', '用户列表', 1, '0', 50, 3, NULL, 0, 0),
(52, 'add', '添加用户', 1, '0', 50, 3, NULL, 0, 2),
(53, 'edit', '编辑用户', 1, '0', 50, 3, NULL, 0, 0),
(54, 'del', '删除用户', 1, '0', 50, 3, NULL, 0, 0),
(55, 'insert', '写入数据库', 1, '0', 50, 3, NULL, 0, 0),
(56, 'upsave', '更新用户', 1, '0', 50, 3, NULL, 0, 0),
(57, 'Text', '微信文本', 1, '0', 5, 2, NULL, 0, 2),
(58, 'index', '文本列表', 1, '0', 57, 3, NULL, 0, 2),
(59, 'del', '删除', 1, '0', 57, 3, NULL, 0, 0),
(60, 'Custom', '自定义页面', 1, '0', 5, 2, NULL, 0, 2),
(61, 'index', '列表', 1, '0', 60, 3, NULL, 0, 2),
(62, 'edit', '编辑', 1, '0', 60, 3, NULL, 0, 0),
(63, 'del', '删除', 1, '0', 60, 3, NULL, 0, 0),
(64, 'Records', '充值记录', 1, '0', 4, 2, NULL, 0, 2),
(65, 'index', '充值列表', 1, '0', 64, 3, NULL, 0, 2),
(66, 'Case', '用户案例', 1, '0', 4, 2, NULL, 0, 2),
(67, 'index', '案例列表', 1, '0', 66, 3, NULL, 0, 2),
(68, 'add', '添加案例', 1, '0', 66, 3, NULL, 0, 2),
(69, 'edit', '编辑案例', 1, '0', 66, 3, NULL, 0, 0),
(70, 'del', '删除案例', 1, '0', 66, 3, NULL, 0, 0),
(71, 'insert', '写入数据库', 1, '0', 66, 3, NULL, 0, 0),
(72, 'upsave', '更新数据库', 1, '0', 66, 3, NULL, 0, 0),
(73, 'Links', '友情链接', 1, '0', 4, 2, NULL, 0, 2),
(74, 'index', '友情链接', 1, '0', 73, 3, NULL, 0, 2),
(75, 'add', '添加链接', 1, '0', 73, 3, NULL, 0, 2),
(76, 'edit', '编辑链接', 1, '0', 73, 3, NULL, 0, 0),
(77, 'insert', '插入数据库', 1, '0', 73, 3, NULL, 0, 0),
(78, 'upsave', '更新数据库', 1, '0', 73, 3, NULL, 0, 0),
(79, 'del', '删除友情链接', 1, '0', 73, 3, NULL, 0, 0),
(81, 'Token', '公众号管理', 1, '0', 80, 2, NULL, 0, 2),
(84, 'Tall', '商城管理', 1, '0', 1, 0, NULL, 0, 0),
(87, 'Brand', '品牌管理', 1, '品牌管理', 84, 2, NULL, 0, 0),
(86, 'Tall', '商品分类', 1, '0', 84, 2, NULL, 0, 0),
(88, 'Info_Notice', '信息发布管理', 1, '公告发布管理', 84, 2, NULL, 0, 2),
(89, 'AdNTAX', '广告及汇率设置', 1, '0', 84, 2, NULL, 0, 0),
(90, 'Statistics', '商家结算系统', 1, '0', 84, 2, NULL, 0, 0),
(92, 'Suggestion', '留言和建议', 1, '0', 84, 2, '', 0, 0),
(93, 'Application', '申请开店信息', 1, '0', 84, 2, NULL, 0, 0),
(94, 'Member', '会员管理', 1, '0', 84, 2, NULL, 0, 0),
(95, 'RealShop', '实体店认证', 1, '0', 84, 2, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_oauth`
--

CREATE TABLE IF NOT EXISTS `tp_oauth` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `config` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_ordering_class`
--

CREATE TABLE IF NOT EXISTS `tp_ordering_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `name` varchar(10) NOT NULL,
  `sort` tinyint(2) NOT NULL,
  `info` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_ordering_set`
--

CREATE TABLE IF NOT EXISTS `tp_ordering_set` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_order_detail`
--

CREATE TABLE IF NOT EXISTS `tp_order_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tp_order_detail`
--

INSERT INTO `tp_order_detail` (`id`, `orderId`, `itemId`, `title`, `img`, `price`, `quantity`, `size`, `color`) VALUES
(3, '201405061215271539', 8, '11', '/wxshoppingmall/SRC/Uploads/image/20140501/53612d116ea65.png', '1.00', 1, '3', '6'),
(4, '201405141125001858', 5, '正品阿迪达斯经典条纹2014款男款外套夹克X23502 X20756 G70357现', '/Uploads/image/20140512/537043d19ba74.png', '258.00', 1, '3', '6');

-- --------------------------------------------------------

--
-- 表的结构 `tp_order_merge`
--

CREATE TABLE IF NOT EXISTS `tp_order_merge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) DEFAULT NULL COMMENT '订单号',
  `mergeid` varchar(50) DEFAULT NULL COMMENT '合并订单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tp_order_merge`
--

INSERT INTO `tp_order_merge` (`id`, `orderid`, `mergeid`) VALUES
(3, '201405061215271539', '201405061215271911'),
(4, '201405141125001858', '201405141125001836');

-- --------------------------------------------------------

--
-- 表的结构 `tp_other`
--

CREATE TABLE IF NOT EXISTS `tp_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `keyword` varchar(60) NOT NULL,
  `info` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_panorama`
--

CREATE TABLE IF NOT EXISTS `tp_panorama` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_photo`
--

CREATE TABLE IF NOT EXISTS `tp_photo` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_photo_list`
--

CREATE TABLE IF NOT EXISTS `tp_photo_list` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_plt_mobile_msg`
--

CREATE TABLE IF NOT EXISTS `tp_plt_mobile_msg` (
  `OID` varchar(36) NOT NULL,
  `ReceTelNo` varchar(20) NOT NULL,
  `MsgContent` varchar(3000) DEFAULT NULL,
  `InsertTime` datetime NOT NULL,
  `SendStates` varchar(512) DEFAULT NULL,
  `SendTime` datetime DEFAULT NULL,
  `Note` varchar(1024) DEFAULT NULL,
  `IsSend` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_plt_mobile_msg`
--

INSERT INTO `tp_plt_mobile_msg` (`OID`, `ReceTelNo`, `MsgContent`, `InsertTime`, `SendStates`, `SendTime`, `Note`, `IsSend`) VALUES
('076b975a-46b4-11e4-a31a-e7c939bf1427', '13063657825', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:44', NULL, '1'),
('07713516-46b4-11e4-a31a-e7c939bf1427', '13218775120', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:44', NULL, '1'),
('0774de5c-46b4-11e4-a31a-e7c939bf1427', '13337914870', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:44', NULL, '1'),
('07779a67-46b4-11e4-a31a-e7c939bf1427', '13585068817', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:44', NULL, '1'),
('077d1396-46b4-11e4-a31a-e7c939bf1427', '15152297978', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:44', NULL, '1'),
('0780bb76-46b4-11e4-a31a-e7c939bf1427', '13093025189', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:44', NULL, '1'),
('07854b99-46b4-11e4-a31a-e7c939bf1427', '13921367157', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:44', NULL, '1'),
('078809ab-46b4-11e4-a31a-e7c939bf1427', '13921211757', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:44', NULL, '1'),
('078baffd-46b4-11e4-a31a-e7c939bf1427', '15961515325', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('0792162b-46b4-11e4-a31a-e7c939bf1427', '13771618551', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('0795bb50-46b4-11e4-a31a-e7c939bf1427', '15861656037', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('079c2308-46b4-11e4-a31a-e7c939bf1427', '13921239421', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('079fcf45-46b4-11e4-a31a-e7c939bf1427', '18001522222', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('07a28794-46b4-11e4-a31a-e7c939bf1427', '15961680335', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('07a62c99-46b4-11e4-a31a-e7c939bf1427', '13771287780', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('07a8ea0b-46b4-11e4-a31a-e7c939bf1427', '13921250781', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('07ae66c0-46b4-11e4-a31a-e7c939bf1427', '13338152219', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('07b1231b-46b4-11e4-a31a-e7c939bf1427', '13912451520', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('07b4c8dc-46b4-11e4-a31a-e7c939bf1427', '13771211213', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('07b95a54-46b4-11e4-a31a-e7c939bf1427', '13915258757', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:44', '1', '2014-09-28 10:06:45', NULL, '1'),
('0de523a2-46b4-11e4-a31a-e7c939bf1427', '13921237599', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:54', '1', '2014-09-28 10:07:04', NULL, '1'),
('0de7f7c5-46b4-11e4-a31a-e7c939bf1427', '13771286689', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:54', '1', '2014-09-28 10:07:04', NULL, '1'),
('0deb9cc2-46b4-11e4-a31a-e7c939bf1427', '13901524830', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:04', NULL, '1'),
('0dee5c9a-46b4-11e4-a31a-e7c939bf1427', '13961666697', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:04', NULL, '1'),
('0df2f44a-46b4-11e4-a31a-e7c939bf1427', '13585053882', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:04', NULL, '1'),
('0df5a9de-46b4-11e4-a31a-e7c939bf1427', '13961614559', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0dfa3b90-46b4-11e4-a31a-e7c939bf1427', '13806163986', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0dfcfb6c-46b4-11e4-a31a-e7c939bf1427', '13906169150', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e009ef6-46b4-11e4-a31a-e7c939bf1427', '15852622777', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e035e53-46b4-11e4-a31a-e7c939bf1427', '15306167618', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e0703b9-46b4-11e4-a31a-e7c939bf1427', '13961672990', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e09c13b-46b4-11e4-a31a-e7c939bf1427', '15961661032', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e0d67f5-46b4-11e4-a31a-e7c939bf1427', '13706161078', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e1025a6-46b4-11e4-a31a-e7c939bf1427', '13771238301', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e13cce0-46b4-11e4-a31a-e7c939bf1427', '13914191037', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e168a34-46b4-11e4-a31a-e7c939bf1427', '13706161078', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e1a317f-46b4-11e4-a31a-e7c939bf1427', '13337911786', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e1ec4b1-46b4-11e4-a31a-e7c939bf1427', '18961656792', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e260b78-46b4-11e4-a31a-e7c939bf1427', '13270153077', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('0e2b8b1a-46b4-11e4-a31a-e7c939bf1427', '13906162980', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:55', '1', '2014-09-28 10:07:05', NULL, '1'),
('13d698d6-46b4-11e4-a31a-e7c939bf1427', '13182788918', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:04', '1', '2014-09-28 10:07:14', NULL, '1'),
('13dc27bf-46b4-11e4-a31a-e7c939bf1427', '13914176818', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:04', '1', '2014-09-28 10:07:15', NULL, '1'),
('13e288cf-46b4-11e4-a31a-e7c939bf1427', '13771251510', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('13f03759-46b4-11e4-a31a-e7c939bf1427', '13952481896', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('13f78dac-46b4-11e4-a31a-e7c939bf1427', '13812109066', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('1409c6e8-46b4-11e4-a31a-e7c939bf1427', '13812170708', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('1413dd1f-46b4-11e4-a31a-e7c939bf1427', '13915253902', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('141de5f4-46b4-11e4-a31a-e7c939bf1427', '13771615680', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('1427f16d-46b4-11e4-a31a-e7c939bf1427', '13915228684', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('142e55a3-46b4-11e4-a31a-e7c939bf1427', '13771615680', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('1435a30b-46b4-11e4-a31a-e7c939bf1427', '13218766662', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('143cf0d1-46b4-11e4-a31a-e7c939bf1427', '13306191071', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('14435a08-46b4-11e4-a31a-e7c939bf1427', '13151953088', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:05', '1', '2014-09-28 10:07:15', NULL, '1'),
('281db690-5597-11e4-a31a-e7c939bf1427', '13812116151', '江阴市申港平安装卸队你好,你单位本月申报的税金1008.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '1', '2014-10-17 08:48:38', NULL, '1'),
('28227af3-5597-11e4-a31a-e7c939bf1427', '13771259899', '江阴市鼎顺广告制作部你好,你单位本月申报的税金873.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '1', '2014-10-17 08:48:38', NULL, '1'),
('2825387a-5597-11e4-a31a-e7c939bf1427', '81652733', '江阴市申港家特福鞋服超市你好,你单位本月申报的税金840.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '1', '2014-10-17 08:48:38', NULL, '1'),
('2828de44-5597-11e4-a31a-e7c939bf1427', '13921204350', '江阴市申港时锋空调电器服务部你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '1', '2014-10-17 08:48:38', NULL, '1'),
('282d7088-5597-11e4-a31a-e7c939bf1427', '18861653222', '江阴市申港陈辉通讯设备商店你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '1', '2014-10-17 08:48:38', NULL, '1'),
('283116a8-5597-11e4-a31a-e7c939bf1427', '15161659938', '江阴市申港新华电脑商店你好,你单位本月申报的税金705.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '1', '2014-10-17 08:48:38', NULL, '1'),
('2833d485-5597-11e4-a31a-e7c939bf1427', '86682341', '江阴市恒宇自动化设备厂你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '1', '2014-10-17 08:48:38', NULL, '1'),
('28377b29-5597-11e4-a31a-e7c939bf1427', '13013659095', '江阴市申港诚和五交化商店你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '1', '2014-10-17 08:48:38', NULL, '1'),
('283a395f-5597-11e4-a31a-e7c939bf1427', '', '江阴市申港恒港建材商店你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '104', '2014-10-17 08:48:38', NULL, '1'),
('283ddfbe-5597-11e4-a31a-e7c939bf1427', '13584140134', '江阴市申港俊锋电器商店你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '1', '2014-10-17 08:48:39', NULL, '1'),
('284187a7-5597-11e4-a31a-e7c939bf1427', '13626231688', '江阴市申港玖玖宝酒业商行你好,你单位本月申报的税金705.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:32', '1', '2014-10-17 08:48:39', NULL, '1'),
('28452e01-5597-11e4-a31a-e7c939bf1427', '15861608807', '江阴市云逸装潢材料店你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:33', '1', '2014-10-17 08:48:39', NULL, '1'),
('2847ebd2-5597-11e4-a31a-e7c939bf1427', '13395165052', '江阴市恒平热水服务部你好,你单位本月申报的税金1042.200元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:33', '1', '2014-10-17 08:48:39', NULL, '1'),
('284b91e4-5597-11e4-a31a-e7c939bf1427', '15251557928', '江阴市海鹏玻璃钢制品厂你好,你单位本月申报的税金1158.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:33', '1', '2014-10-17 08:48:39', NULL, '1'),
('284e507b-5597-11e4-a31a-e7c939bf1427', '13914282098', '江阴市申港瑀轩花岗岩加工厂你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:33', '1', '2014-10-17 08:48:39', NULL, '1'),
('2853caef-5597-11e4-a31a-e7c939bf1427', '13584166658', '江阴市尤斌螺杆加工厂你好,你单位本月申报的税金910.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:33', '1', '2014-10-17 08:48:39', NULL, '1'),
('2856888c-5597-11e4-a31a-e7c939bf1427', '13861634795', '江阴市申港安诚汽车服务部你好,你单位本月申报的税金739.200元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:33', '1', '2014-10-17 08:48:39', NULL, '1'),
('285a2eb1-5597-11e4-a31a-e7c939bf1427', '15950137866', '江阴市申港钦钦干货商行你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:48:33', '1', '2014-10-17 08:48:39', NULL, '1'),
('2ec17d97-55c3-11e4-a31a-e7c939bf1427', '18961656792', '江阴市申港乐文副食超市你好,你单位本月申报的税金705.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 14:03:42', '1', '2014-10-17 14:03:48', NULL, '1'),
('2ec3a583-55c3-11e4-a31a-e7c939bf1427', '13812158552', '江阴市申港裕兴车行你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 14:03:42', '1', '2014-10-17 14:03:48', NULL, '1'),
('2ec6617d-55c3-11e4-a31a-e7c939bf1427', '13806163785', '江阴市申港西达文具经营部你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 14:03:42', '1', '2014-10-17 14:03:48', NULL, '1'),
('2ec83626-55c3-11e4-a31a-e7c939bf1427', '13301528555', '江阴市申港丰旗机械厂你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 14:03:42', '1', '2014-10-17 14:03:48', NULL, '1'),
('2ecbdc1a-55c3-11e4-a31a-e7c939bf1427', '13506166109', '江阴市申港钢丝网络厂你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 14:03:42', '1', '2014-10-17 14:03:48', NULL, '1'),
('2ecdb101-55c3-11e4-a31a-e7c939bf1427', '13921211757', '江阴市申港镇广源喷塑厂你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 14:03:42', '1', '2014-10-17 14:03:48', NULL, '1'),
('2ed06e80-55c3-11e4-a31a-e7c939bf1427', '13093025189', '江阴市申港伟平家具商行你好,你单位本月申报的税金810.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 14:03:42', '1', '2014-10-17 14:03:48', NULL, '1'),
('2ed24182-55c3-11e4-a31a-e7c939bf1427', '13901524830', '江阴市晟伟建筑机械经营部你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 14:03:42', '1', '2014-10-17 14:03:48', NULL, '1'),
('2ed4fdeb-55c3-11e4-a31a-e7c939bf1427', '13961643267', '江阴市申港友于耐火材料经营部你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 14:03:42', '1', '2014-10-17 14:03:49', NULL, '1'),
('2ed8a624-55c3-11e4-a31a-e7c939bf1427', '13812115056', '江阴市临港制盖厂你好,你单位本月申报的税金965.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 14:03:42', '1', '2014-10-17 14:03:49', NULL, '1'),
('3024441d-46b4-11e4-a31a-e7c939bf1427', '13921364597', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:54', NULL, '1'),
('3027d52b-46b4-11e4-a31a-e7c939bf1427', '15251557928', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:54', NULL, '1'),
('302b7fa1-46b4-11e4-a31a-e7c939bf1427', '13182730588', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:54', NULL, '1'),
('302f2369-46b4-11e4-a31a-e7c939bf1427', '13961620328', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('3031c8b9-46b4-11e4-a31a-e7c939bf1427', '13812158161', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('30358b4a-46b4-11e4-a31a-e7c939bf1427', '13063699165', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('30382b52-46b4-11e4-a31a-e7c939bf1427', '86684881', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('303cdd18-46b4-11e4-a31a-e7c939bf1427', '13626231688', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('303f79a3-46b4-11e4-a31a-e7c939bf1427', '15861608807', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('30433880-46b4-11e4-a31a-e7c939bf1427', '15365201955', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('3045dd6c-46b4-11e4-a31a-e7c939bf1427', '18921353828', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('30499cff-46b4-11e4-a31a-e7c939bf1427', '13914282098', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('304c4201-46b4-11e4-a31a-e7c939bf1427', '13861615585', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('305736a2-46b4-11e4-a31a-e7c939bf1427', '13812585070', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('305e85a9-46b4-11e4-a31a-e7c939bf1427', '13771217377', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('3064e8f8-46b4-11e4-a31a-e7c939bf1427', '13921352588', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('306994fc-46b4-11e4-a31a-e7c939bf1427', '13921356228', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('306fde30-46b4-11e4-a31a-e7c939bf1427', '13584166658', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('30746f71-46b4-11e4-a31a-e7c939bf1427', '13812179129', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:52', '1', '2014-09-28 10:07:55', NULL, '1'),
('307bd7ee-46b4-11e4-a31a-e7c939bf1427', '13003355090', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:07:53', '1', '2014-09-28 10:07:55', NULL, '1'),
('378bfb2b-54cf-11e4-a31a-e7c939bf1427', '13921250288', '江阴市申港申江餐厅你好,你单位本月申报的税金34569.320元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 08:57:17', '1', '2014-10-16 08:57:28', NULL, '1'),
('37921663-54cf-11e4-a31a-e7c939bf1427', '051086689777', '江阴市申港长源大酒店你好,你单位本月申报的税金4500.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 08:57:17', '1', '2014-10-16 08:57:28', NULL, '1'),
('37987b33-54cf-11e4-a31a-e7c939bf1427', '13656160268', '江阴市申港土灶台餐馆你好,你单位本月申报的税金6390.380元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 08:57:17', '1', '2014-10-16 08:57:28', NULL, '1'),
('3b52014e-46b4-11e4-a31a-e7c939bf1427', '13921250781', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:14', NULL, '1'),
('3b57b270-46b4-11e4-a31a-e7c939bf1427', '15961623367', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:14', NULL, '1'),
('3b5c2815-46b4-11e4-a31a-e7c939bf1427', '13901525909', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:14', NULL, '1'),
('3b61c2de-46b4-11e4-a31a-e7c939bf1427', '13812151266', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:14', NULL, '1'),
('3b6d83fd-46b4-11e4-a31a-e7c939bf1427', '13771290121', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b705ba9-46b4-11e4-a31a-e7c939bf1427', '13301527535', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b74023e-46b4-11e4-a31a-e7c939bf1427', '13961666697', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b76adbe-46b4-11e4-a31a-e7c939bf1427', '18626365800', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b7a6669-46b4-11e4-a31a-e7c939bf1427', '13706160108', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b7e0ece-46b4-11e4-a31a-e7c939bf1427', '13914180910', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b81b438-46b4-11e4-a31a-e7c939bf1427', '18921260977', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b845a0d-46b4-11e4-a31a-e7c939bf1427', '15312285168', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b881970-46b4-11e4-a31a-e7c939bf1427', '13585052156', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b8abc09-46b4-11e4-a31a-e7c939bf1427', '13771259899', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b9123d0-46b4-11e4-a31a-e7c939bf1427', '15261625605', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b98943a-46b4-11e4-a31a-e7c939bf1427', '13506161558', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b9c3544-46b4-11e4-a31a-e7c939bf1427', '13921263088', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3b9ed3de-46b4-11e4-a31a-e7c939bf1427', '13506165755', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3ba29464-46b4-11e4-a31a-e7c939bf1427', '13806168712', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('3ba5372e-46b4-11e4-a31a-e7c939bf1427', '13961685998', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:11', '1', '2014-09-28 10:08:15', NULL, '1'),
('4208ae4d-46b4-11e4-a31a-e7c939bf1427', '13961662510', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:24', NULL, '1'),
('420c8ddf-46b4-11e4-a31a-e7c939bf1427', '13771270688', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:24', NULL, '1'),
('420f4c41-46b4-11e4-a31a-e7c939bf1427', '13771270688', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:24', NULL, '1'),
('4212f26a-46b4-11e4-a31a-e7c939bf1427', '13801529488', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:24', NULL, '1'),
('4215b0bf-46b4-11e4-a31a-e7c939bf1427', '13961618955', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:24', NULL, '1'),
('4219582a-46b4-11e4-a31a-e7c939bf1427', '13861625288', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:24', NULL, '1'),
('421cfee8-46b4-11e4-a31a-e7c939bf1427', '13812177219', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:24', NULL, '1'),
('4220a602-46b4-11e4-a31a-e7c939bf1427', '13961672990', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:24', NULL, '1'),
('42262500-46b4-11e4-a31a-e7c939bf1427', '13961616881', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:24', NULL, '1'),
('422ab12d-46b4-11e4-a31a-e7c939bf1427', '13861621175', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('422f4314-46b4-11e4-a31a-e7c939bf1427', '18906165089', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('4236b1a1-54e0-11e4-a31a-e7c939bf1427', '18961656792', '江阴市申港乐文副食超市你好,你单位本月申报的税金705.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 10:59:16', '1', '2014-10-16 10:59:18', NULL, '1'),
('4238634e-46b4-11e4-a31a-e7c939bf1427', '13506161555', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('423c0f34-54e0-11e4-a31a-e7c939bf1427', '86624299', '江阴市申港裕兴车行你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 10:59:16', '1', '2014-10-16 10:59:18', NULL, '1'),
('423cf59a-46b4-11e4-a31a-e7c939bf1427', '13861667861', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('42409ba9-46b4-11e4-a31a-e7c939bf1427', '13013659095', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('4240a022-54e0-11e4-a31a-e7c939bf1427', '', '江阴市申港西达文具经营部你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 10:59:16', '104', '2014-10-16 10:59:18', NULL, '1'),
('424273ad-54e0-11e4-a31a-e7c939bf1427', '86623586', '江阴市申港丰旗机械厂你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 10:59:16', '1', '2014-10-16 10:59:18', NULL, '1'),
('42435a53-46b4-11e4-a31a-e7c939bf1427', '13057255157', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('4245301e-54e0-11e4-a31a-e7c939bf1427', '86623519', '江阴市申港钢丝网络厂你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 10:59:16', '1', '2014-10-16 10:59:18', NULL, '1'),
('42470432-54e0-11e4-a31a-e7c939bf1427', '86620937', '江阴市申港镇广源喷塑厂你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 10:59:16', '1', '2014-10-16 10:59:18', NULL, '1'),
('4247e9d6-46b4-11e4-a31a-e7c939bf1427', '13961642435', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('4249c103-54e0-11e4-a31a-e7c939bf1427', '13093025189', '江阴市申港伟平家具商行你好,你单位本月申报的税金810.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 10:59:16', '1', '2014-10-16 10:59:18', NULL, '1'),
('424aa84e-46b4-11e4-a31a-e7c939bf1427', '13771270688', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('424b95e4-54e0-11e4-a31a-e7c939bf1427', '', '江阴市晟伟建筑机械经营部你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 10:59:16', '104', '2014-10-16 10:59:18', NULL, '1'),
('424e4e30-46b4-11e4-a31a-e7c939bf1427', '15961519538', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('424f3da9-54e0-11e4-a31a-e7c939bf1427', '', '江阴市申港友于耐火材料经营部你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 10:59:16', '104', '2014-10-16 10:59:18', NULL, '1'),
('42510cd8-46b4-11e4-a31a-e7c939bf1427', '13806164540', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('42511148-54e0-11e4-a31a-e7c939bf1427', '86629527', '江阴市临港制盖厂你好,你单位本月申报的税金965.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 10:59:16', '1', '2014-10-16 10:59:18', NULL, '1'),
('4254b307-46b4-11e4-a31a-e7c939bf1427', '13861634795', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:22', '1', '2014-09-28 10:08:25', NULL, '1'),
('49b05f40-46b4-11e4-a31a-e7c939bf1427', '13405795854', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:44', NULL, '1'),
('49b45652-46b4-11e4-a31a-e7c939bf1427', '13961601562', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:44', NULL, '1'),
('49b8ccc3-46b4-11e4-a31a-e7c939bf1427', '13771270688', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:44', NULL, '1'),
('49bc943e-46b4-11e4-a31a-e7c939bf1427', '86623131', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49c4aba6-46b4-11e4-a31a-e7c939bf1427', '13801527556', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49cb0ea1-46b4-11e4-a31a-e7c939bf1427', '13585061933', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49ced627-46b4-11e4-a31a-e7c939bf1427', '13003355300', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49d51909-46b4-11e4-a31a-e7c939bf1427', '15950120088', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49d9ca14-46b4-11e4-a31a-e7c939bf1427', '13376229935', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49e02dbe-46b4-11e4-a31a-e7c939bf1427', '13291207261', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49e4be99-46b4-11e4-a31a-e7c939bf1427', '13656160268', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49e863e9-46b4-11e4-a31a-e7c939bf1427', '15365267595', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1');
INSERT INTO `tp_plt_mobile_msg` (`OID`, `ReceTelNo`, `MsgContent`, `InsertTime`, `SendStates`, `SendTime`, `Note`, `IsSend`) VALUES
('49eb2245-46b4-11e4-a31a-e7c939bf1427', '13901527322', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49eec967-46b4-11e4-a31a-e7c939bf1427', '18901525189', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49f188fe-46b4-11e4-a31a-e7c939bf1427', '13915220010', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49f52d48-46b4-11e4-a31a-e7c939bf1427', '13701524595', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49f8df40-46b4-11e4-a31a-e7c939bf1427', '13815125389', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('49fe5608-46b4-11e4-a31a-e7c939bf1427', '13806168712', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('4a01135a-46b4-11e4-a31a-e7c939bf1427', '18861653222', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('4a04b466-46b4-11e4-a31a-e7c939bf1427', '13812572148', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:35', '1', '2014-09-28 10:08:45', NULL, '1'),
('4c9ec1f4-46a8-11e4-a31a-e7c939bf1427', '15961677039', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:54', NULL, '1'),
('4ca5340a-46a8-11e4-a31a-e7c939bf1427', '13815130889', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:54', NULL, '1'),
('4ca894bd-46a8-11e4-a31a-e7c939bf1427', '13812115056', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:54', NULL, '1'),
('4cab5331-46a8-11e4-a31a-e7c939bf1427', '13584111937', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cb1fceb-46a8-11e4-a31a-e7c939bf1427', '13057371305', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cb475f9-46a8-11e4-a31a-e7c939bf1427', '13961608711', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cb81b77-46a8-11e4-a31a-e7c939bf1427', '13906160291', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cbbc230-46a8-11e4-a31a-e7c939bf1427', '13771231983', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cbe80ed-46a8-11e4-a31a-e7c939bf1427', '13584111937', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cc226e9-46a8-11e4-a31a-e7c939bf1427', '13901528961', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cc4e560-46a8-11e4-a31a-e7c939bf1427', '13701529586', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cc88c1a-46a8-11e4-a31a-e7c939bf1427', '18906165089', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4ccd1dfe-46a8-11e4-a31a-e7c939bf1427', '13506166109', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cd0c3b8-46a8-11e4-a31a-e7c939bf1427', '13815130889', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cd38200-46a8-11e4-a31a-e7c939bf1427', '13806168712', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cd7287a-46a8-11e4-a31a-e7c939bf1427', '13812152381', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cd9e6c1-46a8-11e4-a31a-e7c939bf1427', '13921250781', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4cdd8c85-46a8-11e4-a31a-e7c939bf1427', '13961643267', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4ce21ec6-46a8-11e4-a31a-e7c939bf1427', '15601522988', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4ce5c550-46a8-11e4-a31a-e7c939bf1427', '13806163580', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:42:46', '1', '2014-09-28 08:42:55', NULL, '1'),
('4db0d718-451b-11e4-a31a-e7c939bf1427', '13921250781', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4db5ff3c-451b-11e4-a31a-e7c939bf1427', '15961623367', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4db8bde6-451b-11e4-a31a-e7c939bf1427', '13901525909', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dbc630b-451b-11e4-a31a-e7c939bf1427', '13812151266', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dbf21aa-451b-11e4-a31a-e7c939bf1427', '13771290121', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dc2c7ba-451b-11e4-a31a-e7c939bf1427', '13301527535', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dc58628-451b-11e4-a31a-e7c939bf1427', '13961666697', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dcafffe-451b-11e4-a31a-e7c939bf1427', '18626365800', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dcdbe20-451b-11e4-a31a-e7c939bf1427', '13706160108', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dd163fc-451b-11e4-a31a-e7c939bf1427', '13914180910', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dd422d2-451b-11e4-a31a-e7c939bf1427', '18921260977', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dd7c8a6-451b-11e4-a31a-e7c939bf1427', '15312285168', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4ddc5a44-451b-11e4-a31a-e7c939bf1427', '13585052156', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4de0009b-451b-11e4-a31a-e7c939bf1427', '13771259899', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4de1d606-451b-11e4-a31a-e7c939bf1427', '15261625605', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4de922af-451b-11e4-a31a-e7c939bf1427', '13506161558', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4debe0bd-451b-11e4-a31a-e7c939bf1427', '13921263088', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4def86ff-451b-11e4-a31a-e7c939bf1427', '13506165755', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:54', '1', '2014-09-26 09:20:55', NULL, '1'),
('4df418b1-451b-11e4-a31a-e7c939bf1427', '13806168712', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:54', '1', '2014-09-26 09:20:55', NULL, '1'),
('4df7bec2-451b-11e4-a31a-e7c939bf1427', '13961685998', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:54', '1', '2014-09-26 09:20:55', NULL, '1'),
('5021801c-46b4-11e4-a31a-e7c939bf1427', '13812572148', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:54', NULL, '1'),
('502663bd-46b4-11e4-a31a-e7c939bf1427', '13771270688', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:54', NULL, '1'),
('502947c0-46b4-11e4-a31a-e7c939bf1427', '18961675766', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:54', NULL, '1'),
('502b1b0a-46b4-11e4-a31a-e7c939bf1427', '13771270688', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:54', NULL, '1'),
('502dd79c-46b4-11e4-a31a-e7c939bf1427', '13812116151', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:54', NULL, '1'),
('502fab35-46b4-11e4-a31a-e7c939bf1427', '15950137866', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:54', NULL, '1'),
('50326769-46b4-11e4-a31a-e7c939bf1427', '13901527322', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:54', NULL, '1'),
('5035017b-46b4-11e4-a31a-e7c939bf1427', '13815121006', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:54', NULL, '1'),
('5037e21a-46b4-11e4-a31a-e7c939bf1427', '13706164005', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:54', NULL, '1'),
('5039b6dd-46b4-11e4-a31a-e7c939bf1427', '13771598108', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('503c7343-46b4-11e4-a31a-e7c939bf1427', '13861618629', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('503e4868-46b4-11e4-a31a-e7c939bf1427', '18651030124', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('50410427-46b4-11e4-a31a-e7c939bf1427', '13395169652', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('5044ac5a-46b4-11e4-a31a-e7c939bf1427', '13771270688', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('504768bc-46b4-11e4-a31a-e7c939bf1427', '13812108188', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('50493d2f-46b4-11e4-a31a-e7c939bf1427', '13093111125', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('504bf949-46b4-11e4-a31a-e7c939bf1427', '13093111125', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('504dce55-46b4-11e4-a31a-e7c939bf1427', '15161659938', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('50525dd1-46b4-11e4-a31a-e7c939bf1427', '13093111125', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('505432c6-46b4-11e4-a31a-e7c939bf1427', '13395165052', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:46', '1', '2014-09-28 10:08:55', NULL, '1'),
('5640031c-46b4-11e4-a31a-e7c939bf1427', '13815138752', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('5642e181-46b4-11e4-a31a-e7c939bf1427', '13301525770', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('56459d31-46b4-11e4-a31a-e7c939bf1427', '13914202262', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('56477572-46b4-11e4-a31a-e7c939bf1427', '13585052277', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('564a2df0-46b4-11e4-a31a-e7c939bf1427', '13915251111', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('564c022e-46b4-11e4-a31a-e7c939bf1427', '13906160040', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('565076d2-46b4-11e4-a31a-e7c939bf1427', '15961650807', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('56532bf8-46b4-11e4-a31a-e7c939bf1427', '13806165992', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('5657ea37-46b4-11e4-a31a-e7c939bf1427', '13584140134', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('5659b6e1-46b4-11e4-a31a-e7c939bf1427', '13861622587', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('565c7264-46b4-11e4-a31a-e7c939bf1427', '18906165089', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:04', NULL, '1'),
('565e46b1-46b4-11e4-a31a-e7c939bf1427', '13961614559', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:08:56', '1', '2014-09-28 10:09:05', NULL, '1'),
('588786d2-46a8-11e4-a31a-e7c939bf1427', '13485029018', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:14', NULL, '1'),
('5889ce33-46a8-11e4-a31a-e7c939bf1427', '13151958828', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:14', NULL, '1'),
('588c8c6c-46a8-11e4-a31a-e7c939bf1427', '13921351002', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:14', NULL, '1'),
('5892b8f7-46a8-11e4-a31a-e7c939bf1427', '13901527399', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:14', NULL, '1'),
('58991fa1-46a8-11e4-a31a-e7c939bf1427', '13337911786', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:14', NULL, '1'),
('589e989d-46a8-11e4-a31a-e7c939bf1427', '18861627761', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:14', NULL, '1'),
('58a50080-46a8-11e4-a31a-e7c939bf1427', '13861601895', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58ac8284-46a8-11e4-a31a-e7c939bf1427', '13961618955', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58af3fe2-46a8-11e4-a31a-e7c939bf1427', '18915250957', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58b2e61e-46a8-11e4-a31a-e7c939bf1427', '15961667171', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58b5a3e5-46a8-11e4-a31a-e7c939bf1427', '13921209170', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58b94956-46a8-11e4-a31a-e7c939bf1427', '18651036804', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58bddb44-46a8-11e4-a31a-e7c939bf1427', '13771258765', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58c1818f-46a8-11e4-a31a-e7c939bf1427', '13196511668', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58c43f7d-46a8-11e4-a31a-e7c939bf1427', '13812131170', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58c7e5f1-46a8-11e4-a31a-e7c939bf1427', '13861612356', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58caa3e0-46a8-11e4-a31a-e7c939bf1427', '13961625017', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58cfe829-46a8-11e4-a31a-e7c939bf1427', '13656159803', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58d2dc27-46a8-11e4-a31a-e7c939bf1427', '13812109066', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('58d682d5-46a8-11e4-a31a-e7c939bf1427', '13506162989', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:06', '1', '2014-09-28 08:43:15', NULL, '1'),
('5f5a14e0-451b-11e4-a31a-e7c939bf1427', '13961662510', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f5e6776-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f6125d6-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f64cb07-451b-11e4-a31a-e7c939bf1427', '13801529488', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f6789df-451b-11e4-a31a-e7c939bf1427', '13961618955', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f6b2fbc-451b-11e4-a31a-e7c939bf1427', '13861625288', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f6dee4b-451b-11e4-a31a-e7c939bf1427', '13812177219', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f7255c4-451b-11e4-a31a-e7c939bf1427', '13961672990', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f74524d-451b-11e4-a31a-e7c939bf1427', '13961616881', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f77f8b3-451b-11e4-a31a-e7c939bf1427', '13861621175', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f7ab6f4-451b-11e4-a31a-e7c939bf1427', '18906165089', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f7e5cbd-451b-11e4-a31a-e7c939bf1427', '13506161555', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f811b91-451b-11e4-a31a-e7c939bf1427', '13861667861', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f866d2c-451b-11e4-a31a-e7c939bf1427', '13013659095', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f89536f-451b-11e4-a31a-e7c939bf1427', '13057255157', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f8cf964-451b-11e4-a31a-e7c939bf1427', '13961642435', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f8fb858-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f935da6-451b-11e4-a31a-e7c939bf1427', '15961519538', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f97065d-451b-11e4-a31a-e7c939bf1427', '13806164540', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f9aac95-451b-11e4-a31a-e7c939bf1427', '13861634795', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('653a2666-46a8-11e4-a31a-e7c939bf1427', '1381254608', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:34', NULL, '1'),
('653e9f0b-46a8-11e4-a31a-e7c939bf1427', '13801527562', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:34', NULL, '1'),
('6544183f-46a8-11e4-a31a-e7c939bf1427', '13337911786', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:34', NULL, '1'),
('6548ab97-46a8-11e4-a31a-e7c939bf1427', '13771258765', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:34', NULL, '1'),
('654c50da-46a8-11e4-a31a-e7c939bf1427', '18651007881', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:34', NULL, '1'),
('654f0e4b-46a8-11e4-a31a-e7c939bf1427', '18906165089', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:34', NULL, '1'),
('6552b541-46a8-11e4-a31a-e7c939bf1427', '13915306762', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:34', NULL, '1'),
('6555730f-46a8-11e4-a31a-e7c939bf1427', '13404275932', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('655aed0b-46a8-11e4-a31a-e7c939bf1427', '13915239277', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('655daaea-46a8-11e4-a31a-e7c939bf1427', '13771270755', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('656151a7-46a8-11e4-a31a-e7c939bf1427', '13182723092', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('6565c3bc-46a8-11e4-a31a-e7c939bf1427', '13901521280', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('656e1ab9-46a8-11e4-a31a-e7c939bf1427', '13914170598', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('6570d8a1-46a8-11e4-a31a-e7c939bf1427', '13812158552', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('6578023e-46a8-11e4-a31a-e7c939bf1427', '13961650559', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('657ae48b-46a8-11e4-a31a-e7c939bf1427', '13806163785', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('657f7504-46a8-11e4-a31a-e7c939bf1427', '13771213325', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('658232ce-46a8-11e4-a31a-e7c939bf1427', '13003369873', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('6587ad22-46a8-11e4-a31a-e7c939bf1427', '13506162989', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('658a6acd-46a8-11e4-a31a-e7c939bf1427', '13771298308', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:27', '1', '2014-09-28 08:43:35', NULL, '1'),
('6acce84f-451b-11e4-a31a-e7c939bf1427', '13405795854', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ad0e6dd-451b-11e4-a31a-e7c939bf1427', '13961601562', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ad3a50a-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ad74b5e-451b-11e4-a31a-e7c939bf1427', '86623131', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ada0a2a-451b-11e4-a31a-e7c939bf1427', '13801527556', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6adf5c82-451b-11e4-a31a-e7c939bf1427', '13585061933', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ae157be-451b-11e4-a31a-e7c939bf1427', '13003355300', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ae4fdcc-451b-11e4-a31a-e7c939bf1427', '15950120088', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ae7bca5-451b-11e4-a31a-e7c939bf1427', '13376229935', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6aeb6245-451b-11e4-a31a-e7c939bf1427', '13291207261', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6aeee206-451b-11e4-a31a-e7c939bf1427', '13656160268', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6af1c6ea-451b-11e4-a31a-e7c939bf1427', '15365267595', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6af485bb-451b-11e4-a31a-e7c939bf1427', '13901527322', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6af82b46-451b-11e4-a31a-e7c939bf1427', '18901525189', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6afae9dc-451b-11e4-a31a-e7c939bf1427', '13915220010', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6afe9010-451b-11e4-a31a-e7c939bf1427', '13701524595', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6b02380c-451b-11e4-a31a-e7c939bf1427', '13815125389', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6b05de06-451b-11e4-a31a-e7c939bf1427', '13806168712', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6b089cf9-451b-11e4-a31a-e7c939bf1427', '18861653222', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6b0c4296-451b-11e4-a31a-e7c939bf1427', '13812572148', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6bfb45e6-46a8-11e4-a31a-e7c939bf1427', '13063657825', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:38', '1', '2014-09-28 08:43:44', NULL, '1'),
('6c0c181f-46a8-11e4-a31a-e7c939bf1427', '13218775120', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:38', '1', '2014-09-28 08:43:44', NULL, '1'),
('6c10a7f0-46a8-11e4-a31a-e7c939bf1427', '13337914870', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:38', '1', '2014-09-28 08:43:44', NULL, '1'),
('6c144e99-46a8-11e4-a31a-e7c939bf1427', '13585068817', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:38', '1', '2014-09-28 08:43:44', NULL, '1'),
('6c170bda-46a8-11e4-a31a-e7c939bf1427', '15152297978', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:38', '1', '2014-09-28 08:43:44', NULL, '1'),
('6c1ab2e2-46a8-11e4-a31a-e7c939bf1427', '13093025189', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:38', '1', '2014-09-28 08:43:44', NULL, '1'),
('6c1d708d-46a8-11e4-a31a-e7c939bf1427', '13921367157', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:38', '1', '2014-09-28 08:43:44', NULL, '1'),
('6c22eac8-46a8-11e4-a31a-e7c939bf1427', '13921211757', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:44', NULL, '1'),
('6c25a800-46a8-11e4-a31a-e7c939bf1427', '15961515325', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('6c294ef2-46a8-11e4-a31a-e7c939bf1427', '13771618551', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('6c2c0c6b-46a8-11e4-a31a-e7c939bf1427', '15861656037', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('6c2fb49d-46a8-11e4-a31a-e7c939bf1427', '13921239421', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('6c3271d8-46a8-11e4-a31a-e7c939bf1427', '18001522222', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('6c37ebbe-46a8-11e4-a31a-e7c939bf1427', '15961680335', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('6c3b92e5-46a8-11e4-a31a-e7c939bf1427', '13771287780', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1');
INSERT INTO `tp_plt_mobile_msg` (`OID`, `ReceTelNo`, `MsgContent`, `InsertTime`, `SendStates`, `SendTime`, `Note`, `IsSend`) VALUES
('6c41f745-46a8-11e4-a31a-e7c939bf1427', '13921250781', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('6c4688f9-46a8-11e4-a31a-e7c939bf1427', '13338152219', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('6c4a34de-46a8-11e4-a31a-e7c939bf1427', '13912451520', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('6c4ced1d-46a8-11e4-a31a-e7c939bf1427', '13771211213', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('6c5266e1-46a8-11e4-a31a-e7c939bf1427', '13915258757', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:39', '1', '2014-09-28 08:43:45', NULL, '1'),
('734aba60-46a8-11e4-a31a-e7c939bf1427', '13921237599', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('734e717e-46a8-11e4-a31a-e7c939bf1427', '13771286689', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('73512ef3-46a8-11e4-a31a-e7c939bf1427', '13901524830', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('7354d5f5-46a8-11e4-a31a-e7c939bf1427', '13961666697', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('735793e8-46a8-11e4-a31a-e7c939bf1427', '13585053882', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('735b53e3-46a8-11e4-a31a-e7c939bf1427', '13961614559', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('73637365-46a8-11e4-a31a-e7c939bf1427', '13806163986', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('7369cb1f-46a8-11e4-a31a-e7c939bf1427', '13906169150', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('73712573-46a8-11e4-a31a-e7c939bf1427', '15852622777', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('73777e00-46a8-11e4-a31a-e7c939bf1427', '15306167618', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('737c0c61-46a8-11e4-a31a-e7c939bf1427', '13961672990', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('73836985-46a8-11e4-a31a-e7c939bf1427', '15961661032', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:54', NULL, '1'),
('7388e3cf-46a8-11e4-a31a-e7c939bf1427', '13706161078', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:55', NULL, '1'),
('738d74e5-46a8-11e4-a31a-e7c939bf1427', '13771238301', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:55', NULL, '1'),
('7392051e-46a8-11e4-a31a-e7c939bf1427', '13914191037', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:55', NULL, '1'),
('7394c2dd-46a8-11e4-a31a-e7c939bf1427', '13706161078', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:55', NULL, '1'),
('739869d8-46a8-11e4-a31a-e7c939bf1427', '13337911786', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:55', NULL, '1'),
('739cfae8-46a8-11e4-a31a-e7c939bf1427', '18961656792', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:55', NULL, '1'),
('73a0a15c-46a8-11e4-a31a-e7c939bf1427', '13270153077', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:55', NULL, '1'),
('73a35f77-46a8-11e4-a31a-e7c939bf1427', '13906162980', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:43:51', '1', '2014-09-28 08:43:55', NULL, '1'),
('73d21adf-451b-11e4-a31a-e7c939bf1427', '13812572148', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73d49c45-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73d841d1-451b-11e4-a31a-e7c939bf1427', '18961675766', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73daffec-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73dea633-451b-11e4-a31a-e7c939bf1427', '13812116151', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73e13bcd-451b-11e4-a31a-e7c939bf1427', '15950137866', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73e5f499-451b-11e4-a31a-e7c939bf1427', '13901527322', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73e88a23-451b-11e4-a31a-e7c939bf1427', '13815121006', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73ec3142-451b-11e4-a31a-e7c939bf1427', '13706164005', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73eeeec9-451b-11e4-a31a-e7c939bf1427', '13771598108', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73f29586-451b-11e4-a31a-e7c939bf1427', '13861618629', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73f5533a-451b-11e4-a31a-e7c939bf1427', '18651030124', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73fa0c2d-451b-11e4-a31a-e7c939bf1427', '13395169652', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73fcca72-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('7400483b-451b-11e4-a31a-e7c939bf1427', '13812108188', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('74032eca-451b-11e4-a31a-e7c939bf1427', '13093111125', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('7406ad2d-451b-11e4-a31a-e7c939bf1427', '13093111125', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('740c50e1-451b-11e4-a31a-e7c939bf1427', '15161659938', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('740fced4-451b-11e4-a31a-e7c939bf1427', '13093111125', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('7412b51b-451b-11e4-a31a-e7c939bf1427', '13395165052', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('7840449e-54e0-11e4-a31a-e7c939bf1427', '', '江阴市申港平安装卸队你好,你单位本月申报的税金1008.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('78439cbf-54e0-11e4-a31a-e7c939bf1427', '', '江阴市鼎顺广告制作部你好,你单位本月申报的税金873.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('78456f71-54e0-11e4-a31a-e7c939bf1427', '81652733', '江阴市申港家特福鞋服超市你好,你单位本月申报的税金840.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '1', '2014-10-16 11:00:48', NULL, '1'),
('78482b7c-54e0-11e4-a31a-e7c939bf1427', '13921204350', '江阴市申港时锋空调电器服务部你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '1', '2014-10-16 11:00:48', NULL, '1'),
('784bd36f-54e0-11e4-a31a-e7c939bf1427', '18861653222', '江阴市申港陈辉通讯设备商店你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '1', '2014-10-16 11:00:48', NULL, '1'),
('784e8fe5-54e0-11e4-a31a-e7c939bf1427', '15161659938', '江阴市申港新华电脑商店你好,你单位本月申报的税金705.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '1', '2014-10-16 11:00:48', NULL, '1'),
('78506420-54e0-11e4-a31a-e7c939bf1427', '86682341', '江阴市恒宇自动化设备厂你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '1', '2014-10-16 11:00:48', NULL, '1'),
('78532156-54e0-11e4-a31a-e7c939bf1427', '86684881', '江阴市申港镇申新水电装潢经营部你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '1', '2014-10-16 11:00:48', NULL, '1'),
('7854f56c-54e0-11e4-a31a-e7c939bf1427', '86621272', '江阴市申港诚和五交化商店你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '1', '2014-10-16 11:00:48', NULL, '1'),
('7857b1c5-54e0-11e4-a31a-e7c939bf1427', '', '江阴市申港恒港建材商店你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('785b5960-54e0-11e4-a31a-e7c939bf1427', '', '江阴市申港俊锋电器商店你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('785e1626-54e0-11e4-a31a-e7c939bf1427', '', '江阴市申港玖玖宝酒业商行你好,你单位本月申报的税金705.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('785fec6c-54e0-11e4-a31a-e7c939bf1427', '', '江阴市云逸装潢材料店你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('7862a709-54e0-11e4-a31a-e7c939bf1427', '', '江阴市恒平热水服务部你好,你单位本月申报的税金1042.200元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('78647b7c-54e0-11e4-a31a-e7c939bf1427', '81651927', '江阴市申港小鲸鱼汽车维修部你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '1', '2014-10-16 11:00:48', NULL, '1'),
('78675ccb-54e0-11e4-a31a-e7c939bf1427', '', '江阴市海鹏玻璃钢制品厂你好,你单位本月申报的税金1158.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('786ae0cd-54e0-11e4-a31a-e7c939bf1427', '', '江阴市申港瑀轩花岗岩加工厂你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('786cb36f-54e0-11e4-a31a-e7c939bf1427', '', '江阴市尤斌螺杆加工厂你好,你单位本月申报的税金910.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('786f71b1-54e0-11e4-a31a-e7c939bf1427', '', '江阴市申港安诚汽车服务部你好,你单位本月申报的税金739.200元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '104', '2014-10-16 11:00:48', NULL, '1'),
('787146e1-54e0-11e4-a31a-e7c939bf1427', '15950137866', '江阴市申港钦钦干货商行你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 11:00:47', '1', '2014-10-16 11:00:48', NULL, '1'),
('79f5ddae-46a8-11e4-a31a-e7c939bf1427', '13182788918', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('79faf0ff-46a8-11e4-a31a-e7c939bf1427', '13914176818', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('79feb502-46a8-11e4-a31a-e7c939bf1427', '13771251510', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7a03467d-46a8-11e4-a31a-e7c939bf1427', '13952481896', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7a08c05c-46a8-11e4-a31a-e7c939bf1427', '13812109066', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7a0b7d84-46a8-11e4-a31a-e7c939bf1427', '13812170708', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7a0d513d-46a8-11e4-a31a-e7c939bf1427', '13915253902', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7a11e1a3-46a8-11e4-a31a-e7c939bf1427', '13771615680', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7a13b5a1-46a8-11e4-a31a-e7c939bf1427', '13915228684', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7a167293-46a8-11e4-a31a-e7c939bf1427', '13771615680', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7a18465d-46a8-11e4-a31a-e7c939bf1427', '13218766662', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7a1b0342-46a8-11e4-a31a-e7c939bf1427', '13306191071', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7a1cd77b-46a8-11e4-a31a-e7c939bf1427', '13151953088', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:02', '1', '2014-09-28 08:44:04', NULL, '1'),
('7b9bb064-451b-11e4-a31a-e7c939bf1427', '13815138752', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7b9ffa4d-451b-11e4-a31a-e7c939bf1427', '13301525770', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7ba39f9d-451b-11e4-a31a-e7c939bf1427', '13914202262', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7ba65d65-451b-11e4-a31a-e7c939bf1427', '13585052277', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7baaed65-451b-11e4-a31a-e7c939bf1427', '13915251111', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7badac78-451b-11e4-a31a-e7c939bf1427', '13906160040', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bb151b0-451b-11e4-a31a-e7c939bf1427', '15961650807', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bb4109c-451b-11e4-a31a-e7c939bf1427', '13806165992', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bb7b672-451b-11e4-a31a-e7c939bf1427', '13584140134', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bba74ef-451b-11e4-a31a-e7c939bf1427', '13861622587', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bbf06a6-451b-11e4-a31a-e7c939bf1427', '18906165089', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bc1c3a8-451b-11e4-a31a-e7c939bf1427', '13961614559', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('80a7db4b-54fb-11e4-a31a-e7c939bf1427', '13961662510', '江阴市申港恒港建材商店你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 14:14:18', '1', '2014-10-16 14:14:18', NULL, '1'),
('879e62b6-5597-11e4-a31a-e7c939bf1427', '18961656792', '江阴市申港乐文副食超市你好,你单位本月申报的税金705.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:51:12', '1', '2014-10-17 08:51:18', NULL, '1'),
('87a4f382-5597-11e4-a31a-e7c939bf1427', '86624299', '江阴市申港裕兴车行你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:51:13', '1', '2014-10-17 08:51:18', NULL, '1'),
('87aa6cbb-5597-11e4-a31a-e7c939bf1427', '86621039', '江阴市申港西达文具经营部你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:51:13', '1', '2014-10-17 08:51:18', NULL, '1'),
('87ae141d-5597-11e4-a31a-e7c939bf1427', '86623586', '江阴市申港丰旗机械厂你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:51:13', '1', '2014-10-17 08:51:18', NULL, '1'),
('87b1bb16-5597-11e4-a31a-e7c939bf1427', '86623519', '江阴市申港钢丝网络厂你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:51:13', '1', '2014-10-17 08:51:18', NULL, '1'),
('87b47881-5597-11e4-a31a-e7c939bf1427', '86620937', '江阴市申港镇广源喷塑厂你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:51:13', '1', '2014-10-17 08:51:18', NULL, '1'),
('87b81eca-5597-11e4-a31a-e7c939bf1427', '13093025189', '江阴市申港伟平家具商行你好,你单位本月申报的税金810.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:51:13', '1', '2014-10-17 08:51:18', NULL, '1'),
('87badcf3-5597-11e4-a31a-e7c939bf1427', '86621039', '江阴市晟伟建筑机械经营部你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:51:13', '1', '2014-10-17 08:51:18', NULL, '1'),
('87be8352-5597-11e4-a31a-e7c939bf1427', '86621039', '江阴市申港友于耐火材料经营部你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:51:13', '1', '2014-10-17 08:51:18', NULL, '1'),
('87c22b2d-5597-11e4-a31a-e7c939bf1427', '86629527', '江阴市临港制盖厂你好,你单位本月申报的税金965.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-17 08:51:13', '1', '2014-10-17 08:51:18', NULL, '1'),
('96c10643-46a8-11e4-a31a-e7c939bf1427', '13921364597', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:54', NULL, '1'),
('96c776b8-46a8-11e4-a31a-e7c939bf1427', '15251557928', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:54', NULL, '1'),
('96c94aa6-46a8-11e4-a31a-e7c939bf1427', '13182730588', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:54', NULL, '1'),
('96cc06c9-46a8-11e4-a31a-e7c939bf1427', '13961620328', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:54', NULL, '1'),
('96cfaf76-46a8-11e4-a31a-e7c939bf1427', '13812158161', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96d26b2c-46a8-11e4-a31a-e7c939bf1427', '13063699165', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96d440b6-46a8-11e4-a31a-e7c939bf1427', '86684881', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96d6fcc7-46a8-11e4-a31a-e7c939bf1427', '13626231688', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96d8d0ff-46a8-11e4-a31a-e7c939bf1427', '15861608807', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96db8c96-46a8-11e4-a31a-e7c939bf1427', '15365201955', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96de4b9a-46a8-11e4-a31a-e7c939bf1427', '18921353828', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96e1096c-46a8-11e4-a31a-e7c939bf1427', '13914282098', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96e2dc47-46a8-11e4-a31a-e7c939bf1427', '13861615585', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96e59886-46a8-11e4-a31a-e7c939bf1427', '13812585070', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96e76d82-46a8-11e4-a31a-e7c939bf1427', '13771217377', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96ea1e27-46a8-11e4-a31a-e7c939bf1427', '13921352588', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96ece6f7-46a8-11e4-a31a-e7c939bf1427', '13921356228', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96efa885-46a8-11e4-a31a-e7c939bf1427', '13584166658', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96f34b81-46a8-11e4-a31a-e7c939bf1427', '13812179129', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('96f60a6d-46a8-11e4-a31a-e7c939bf1427', '13003355090', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:44:50', '1', '2014-09-28 08:44:55', NULL, '1'),
('9d86ab7a-46a8-11e4-a31a-e7c939bf1427', '13921250781', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:01', '1', '2014-09-28 08:45:04', NULL, '1'),
('9d8bd75b-46a8-11e4-a31a-e7c939bf1427', '15961623367', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:01', '1', '2014-09-28 08:45:04', NULL, '1'),
('9d8e95fd-46a8-11e4-a31a-e7c939bf1427', '13901525909', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:01', '1', '2014-09-28 08:45:04', NULL, '1'),
('9d9324e7-46a8-11e4-a31a-e7c939bf1427', '13812151266', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:01', '1', '2014-09-28 08:45:04', NULL, '1'),
('9d95e37a-46a8-11e4-a31a-e7c939bf1427', '13771290121', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:01', '1', '2014-09-28 08:45:04', NULL, '1'),
('9d9989e2-46a8-11e4-a31a-e7c939bf1427', '13301527535', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:01', '1', '2014-09-28 08:45:04', NULL, '1'),
('9d9e1bad-46a8-11e4-a31a-e7c939bf1427', '13961666697', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:04', NULL, '1'),
('9da1c18e-46a8-11e4-a31a-e7c939bf1427', '18626365800', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:04', NULL, '1'),
('9da48035-46a8-11e4-a31a-e7c939bf1427', '13706160108', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:04', NULL, '1'),
('9da8262a-46a8-11e4-a31a-e7c939bf1427', '13914180910', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:04', NULL, '1'),
('9daae491-46a8-11e4-a31a-e7c939bf1427', '18921260977', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:04', NULL, '1'),
('9dae8a79-46a8-11e4-a31a-e7c939bf1427', '15312285168', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:04', NULL, '1'),
('9db31ca7-46a8-11e4-a31a-e7c939bf1427', '13585052156', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:04', NULL, '1'),
('9db6c343-46a8-11e4-a31a-e7c939bf1427', '13771259899', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:05', NULL, '1'),
('9db981fa-46a8-11e4-a31a-e7c939bf1427', '15261625605', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:05', NULL, '1'),
('9dbefb30-46a8-11e4-a31a-e7c939bf1427', '13506161558', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:05', NULL, '1'),
('9dc2a32d-46a8-11e4-a31a-e7c939bf1427', '13921263088', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:05', NULL, '1'),
('9dc6494e-46a8-11e4-a31a-e7c939bf1427', '13506165755', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:05', NULL, '1'),
('9dcbc5a6-46a8-11e4-a31a-e7c939bf1427', '13806168712', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:05', NULL, '1'),
('9dcf6ab7-46a8-11e4-a31a-e7c939bf1427', '13961685998', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:02', '1', '2014-09-28 08:45:05', NULL, '1'),
('a37330bc-57ef-11e4-a31a-e7c939bf1427', '13806163785', '江阴市申港西达文具经营部你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-20 08:27:04', '1', '2014-10-20 08:27:08', NULL, '1'),
('a376ef41-57ef-11e4-a31a-e7c939bf1427', '13301528555', '江阴市申港丰旗机械厂你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-20 08:27:04', '1', '2014-10-20 08:27:08', NULL, '1'),
('a37b7ef8-57ef-11e4-a31a-e7c939bf1427', '13506166109', '江阴市申港钢丝网络厂你好,你单位本月申报的税金600.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-20 08:27:04', '1', '2014-10-20 08:27:08', NULL, '1'),
('a37f2635-57ef-11e4-a31a-e7c939bf1427', '13921211757', '江阴市申港镇广源喷塑厂你好,你单位本月申报的税金772.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-20 08:27:04', '1', '2014-10-20 08:27:09', NULL, '1'),
('a381e284-57ef-11e4-a31a-e7c939bf1427', '13093025189', '江阴市申港伟平家具商行你好,你单位本月申报的税金810.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-20 08:27:04', '1', '2014-10-20 08:27:09', NULL, '1'),
('a3858977-57ef-11e4-a31a-e7c939bf1427', '13901524830', '江阴市晟伟建筑机械经营部你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-20 08:27:04', '1', '2014-10-20 08:27:09', NULL, '1'),
('a38847cd-57ef-11e4-a31a-e7c939bf1427', '13812115056', '江阴市临港制盖厂你好,你单位本月申报的税金965.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-20 08:27:04', '1', '2014-10-20 08:27:09', NULL, '1'),
('a4230ce8-46a8-11e4-a31a-e7c939bf1427', '13961662510', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:12', '1', '2014-09-28 08:45:14', NULL, '1'),
('a428f576-46a8-11e4-a31a-e7c939bf1427', '13771270688', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a433026d-46a8-11e4-a31a-e7c939bf1427', '13771270688', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a435c665-46a8-11e4-a31a-e7c939bf1427', '13801529488', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a43a50ff-46a8-11e4-a31a-e7c939bf1427', '13961618955', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a43df7e4-46a8-11e4-a31a-e7c939bf1427', '13861625288', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a4419ded-46a8-11e4-a31a-e7c939bf1427', '13812177219', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a4445c65-46a8-11e4-a31a-e7c939bf1427', '13961672990', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a448ec2f-46a8-11e4-a31a-e7c939bf1427', '13961616881', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a44c5ac8-46a8-11e4-a31a-e7c939bf1427', '13861621175', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a45124d6-46a8-11e4-a31a-e7c939bf1427', '18906165089', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a453e32f-46a8-11e4-a31a-e7c939bf1427', '13506161555', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a45786fa-46a8-11e4-a31a-e7c939bf1427', '13861667861', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a45b2f48-46a8-11e4-a31a-e7c939bf1427', '13013659095', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a45ed572-46a8-11e4-a31a-e7c939bf1427', '13057255157', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a461934f-46a8-11e4-a31a-e7c939bf1427', '13961642435', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:14', NULL, '1'),
('a4644f9d-46a8-11e4-a31a-e7c939bf1427', '13771270688', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:15', NULL, '1'),
('a4662444-46a8-11e4-a31a-e7c939bf1427', '15961519538', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:15', NULL, '1'),
('a468e074-46a8-11e4-a31a-e7c939bf1427', '13806164540', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:15', NULL, '1'),
('a46b9f46-46a8-11e4-a31a-e7c939bf1427', '13861634795', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:13', '1', '2014-09-28 08:45:15', NULL, '1'),
('a6ad5dc6-4548-11e4-a31a-e7c939bf1427', '13901522951', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 14:45:30', '1', '2014-09-26 14:45:34', NULL, '1'),
('ab702547-46a8-11e4-a31a-e7c939bf1427', '13405795854', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:34', NULL, '1'),
('ab7480ff-46a8-11e4-a31a-e7c939bf1427', '13961601562', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:34', NULL, '1'),
('ab773cc8-46a8-11e4-a31a-e7c939bf1427', '13771270688', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:34', NULL, '1');
INSERT INTO `tp_plt_mobile_msg` (`OID`, `ReceTelNo`, `MsgContent`, `InsertTime`, `SendStates`, `SendTime`, `Note`, `IsSend`) VALUES
('ab791185-46a8-11e4-a31a-e7c939bf1427', '86623131', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:34', NULL, '1'),
('ab7bcd62-46a8-11e4-a31a-e7c939bf1427', '13801527556', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:34', NULL, '1'),
('ab7f7608-46a8-11e4-a31a-e7c939bf1427', '13585061933', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:34', NULL, '1'),
('ab823210-46a8-11e4-a31a-e7c939bf1427', '13003355300', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:34', NULL, '1'),
('ab84077d-46a8-11e4-a31a-e7c939bf1427', '15950120088', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('ab86c321-46a8-11e4-a31a-e7c939bf1427', '13376229935', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('ab889795-46a8-11e4-a31a-e7c939bf1427', '13291207261', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('ab8c3d92-46a8-11e4-a31a-e7c939bf1427', '13656160268', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('ab8fe73b-46a8-11e4-a31a-e7c939bf1427', '15365267595', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('ab9476b6-46a8-11e4-a31a-e7c939bf1427', '13901527322', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('ab964ac3-46a8-11e4-a31a-e7c939bf1427', '18901525189', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('ab9906cc-46a8-11e4-a31a-e7c939bf1427', '13915220010', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('ab9add23-46a8-11e4-a31a-e7c939bf1427', '13701524595', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('ab9f2903-46a8-11e4-a31a-e7c939bf1427', '13815125389', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('aba14038-46a8-11e4-a31a-e7c939bf1427', '13806168712', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('aba3fca0-46a8-11e4-a31a-e7c939bf1427', '18861653222', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('aba5d0fc-46a8-11e4-a31a-e7c939bf1427', '13812572148', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:25', '1', '2014-09-28 08:45:35', NULL, '1'),
('b09f30d5-451b-11e4-a31a-e7c939bf1427', '15961677039', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0a32519-451b-11e4-a31a-e7c939bf1427', '13815130889', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0a6eb9f-451b-11e4-a31a-e7c939bf1427', '13812115056', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0a9a79f-451b-11e4-a31a-e7c939bf1427', '13584111937', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0ab7c7e-451b-11e4-a31a-e7c939bf1427', '13057371305', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0ae388d-451b-11e4-a31a-e7c939bf1427', '13961608711', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0b00d44-451b-11e4-a31a-e7c939bf1427', '13906160291', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0b2c9fd-451b-11e4-a31a-e7c939bf1427', '13771231983', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0b587e2-451b-11e4-a31a-e7c939bf1427', '13584111937', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0b8441f-451b-11e4-a31a-e7c939bf1427', '13901528961', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0ba18fe-451b-11e4-a31a-e7c939bf1427', '13701529586', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0bcd551-451b-11e4-a31a-e7c939bf1427', '18906165089', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0bea9b0-451b-11e4-a31a-e7c939bf1427', '13506166109', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0c165de-451b-11e4-a31a-e7c939bf1427', '13815130889', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0c50e1b-451b-11e4-a31a-e7c939bf1427', '13806168712', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0c7ca51-451b-11e4-a31a-e7c939bf1427', '13812152381', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0c99f17-451b-11e4-a31a-e7c939bf1427', '13921250781', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:45', NULL, '1'),
('b0cc5b4a-451b-11e4-a31a-e7c939bf1427', '13961643267', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:45', NULL, '1'),
('b0ce300e-451b-11e4-a31a-e7c939bf1427', '15601522988', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:45', NULL, '1'),
('b0d0ec1f-451b-11e4-a31a-e7c939bf1427', '13806163580', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:45', NULL, '1'),
('b2764b6a-46a8-11e4-a31a-e7c939bf1427', '13812572148', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:36', '1', '2014-09-28 08:45:44', NULL, '1'),
('b27b4135-46a8-11e4-a31a-e7c939bf1427', '13771270688', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b27e4a7c-46a8-11e4-a31a-e7c939bf1427', '18961675766', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b28108e5-46a8-11e4-a31a-e7c939bf1427', '13771270688', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b284af49-46a8-11e4-a31a-e7c939bf1427', '13812116151', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b2876d7d-46a8-11e4-a31a-e7c939bf1427', '15950137866', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b28b50f2-46a8-11e4-a31a-e7c939bf1427', '13901527322', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b28eba7a-46a8-11e4-a31a-e7c939bf1427', '13815121006', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b2917907-46a8-11e4-a31a-e7c939bf1427', '13706164005', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b295bc5e-46a8-11e4-a31a-e7c939bf1427', '13771598108', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b29964a9-46a8-11e4-a31a-e7c939bf1427', '13861618629', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b29d589e-46a8-11e4-a31a-e7c939bf1427', '18651030124', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:44', NULL, '1'),
('b2a0ff60-46a8-11e4-a31a-e7c939bf1427', '13395169652', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:45', NULL, '1'),
('b2a4a53b-46a8-11e4-a31a-e7c939bf1427', '13771270688', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:45', NULL, '1'),
('b2a763e1-46a8-11e4-a31a-e7c939bf1427', '13812108188', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:45', NULL, '1'),
('b2ab09c7-46a8-11e4-a31a-e7c939bf1427', '13093111125', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:45', NULL, '1'),
('b2adc8d1-46a8-11e4-a31a-e7c939bf1427', '13093111125', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:45', NULL, '1'),
('b2b16e19-46a8-11e4-a31a-e7c939bf1427', '15161659938', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:45', NULL, '1'),
('b2b516ba-46a8-11e4-a31a-e7c939bf1427', '13093111125', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:45', NULL, '1'),
('b2b8bc89-46a8-11e4-a31a-e7c939bf1427', '13395165052', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:37', '1', '2014-09-28 08:45:45', NULL, '1'),
('b7c973fc-46a8-11e4-a31a-e7c939bf1427', '13815138752', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:45', '1', '2014-09-28 08:45:57', NULL, '1'),
('b7ce150c-46a8-11e4-a31a-e7c939bf1427', '13301525770', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:45', '1', '2014-09-28 08:45:57', NULL, '1'),
('b7d1ba13-46a8-11e4-a31a-e7c939bf1427', '13914202262', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:45', '1', '2014-09-28 08:45:57', NULL, '1'),
('b7d478c4-46a8-11e4-a31a-e7c939bf1427', '13585052277', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:46', '1', '2014-09-28 08:45:57', NULL, '1'),
('b7d81e82-46a8-11e4-a31a-e7c939bf1427', '13915251111', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:46', '1', '2014-09-28 08:45:57', NULL, '1'),
('b7dadd59-46a8-11e4-a31a-e7c939bf1427', '13906160040', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:46', '1', '2014-09-28 08:45:57', NULL, '1'),
('b7de831f-46a8-11e4-a31a-e7c939bf1427', '15961650807', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:46', '1', '2014-09-28 08:45:57', NULL, '1'),
('b7e22bc1-46a8-11e4-a31a-e7c939bf1427', '13806165992', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:46', '1', '2014-09-28 08:45:57', NULL, '1'),
('b7e5d16d-46a8-11e4-a31a-e7c939bf1427', '13584140134', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:46', '1', '2014-09-28 08:45:57', NULL, '1'),
('b7e8901e-46a8-11e4-a31a-e7c939bf1427', '13861622587', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:46', '1', '2014-09-28 08:45:57', NULL, '1'),
('b7ec360e-46a8-11e4-a31a-e7c939bf1427', '18906165089', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:46', '1', '2014-09-28 08:45:58', NULL, '1'),
('b7eef4c9-46a8-11e4-a31a-e7c939bf1427', '13961614559', '友情提醒：纳税人您好！对于在本月还需办理涉税业务的企业，请于本月28.29.30三天及时办理！国税申港代办点', '2014-09-28 08:45:46', '1', '2014-09-28 08:45:58', NULL, '1'),
('bb49e307-451b-11e4-a31a-e7c939bf1427', '13485029018', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb4dc7e4-451b-11e4-a31a-e7c939bf1427', '13151958828', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb5083c6-451b-11e4-a31a-e7c939bf1427', '13921351002', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb52588f-451b-11e4-a31a-e7c939bf1427', '13901527399', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb56e811-451b-11e4-a31a-e7c939bf1427', '13337911786', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb58bd5c-451b-11e4-a31a-e7c939bf1427', '18861627761', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb5b78e1-451b-11e4-a31a-e7c939bf1427', '13861601895', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb5d4de2-451b-11e4-a31a-e7c939bf1427', '13961618955', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb600a35-451b-11e4-a31a-e7c939bf1427', '18915250957', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb61de9c-451b-11e4-a31a-e7c939bf1427', '15961667171', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb658492-451b-11e4-a31a-e7c939bf1427', '13921209170', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb67594f-451b-11e4-a31a-e7c939bf1427', '18651036804', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb6a1550-451b-11e4-a31a-e7c939bf1427', '13771258765', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb6bea27-451b-11e4-a31a-e7c939bf1427', '13196511668', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb6ea651-451b-11e4-a31a-e7c939bf1427', '13812131170', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb707b2b-451b-11e4-a31a-e7c939bf1427', '13861612356', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb750adf-451b-11e4-a31a-e7c939bf1427', '13961625017', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb76df87-451b-11e4-a31a-e7c939bf1427', '13656159803', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:05', NULL, '1'),
('bb799c03-451b-11e4-a31a-e7c939bf1427', '13812109066', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:05', NULL, '1'),
('bb7b7067-451b-11e4-a31a-e7c939bf1427', '13506162989', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:05', NULL, '1'),
('c31e5651-451b-11e4-a31a-e7c939bf1427', '1381254608', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c323315b-451b-11e4-a31a-e7c939bf1427', '13801527562', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c325062b-451b-11e4-a31a-e7c939bf1427', '13337911786', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c327c20a-451b-11e4-a31a-e7c939bf1427', '13771258765', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c32996fc-451b-11e4-a31a-e7c939bf1427', '18651007881', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c32d3cd0-451b-11e4-a31a-e7c939bf1427', '18906165089', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c32fe19d-451b-11e4-a31a-e7c939bf1427', '13915306762', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c3348b2e-451b-11e4-a31a-e7c939bf1427', '13404275932', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c3372fd8-451b-11e4-a31a-e7c939bf1427', '13915239277', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c33a0609-451b-11e4-a31a-e7c939bf1427', '13771270755', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c33caafa-451b-11e4-a31a-e7c939bf1427', '13182723092', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c3406a45-451b-11e4-a31a-e7c939bf1427', '13901521280', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c3430f7e-451b-11e4-a31a-e7c939bf1427', '13914170598', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c346cef2-451b-11e4-a31a-e7c939bf1427', '13812158552', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c34973fc-451b-11e4-a31a-e7c939bf1427', '13961650559', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c34d34ab-451b-11e4-a31a-e7c939bf1427', '13806163785', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c351ac20-451b-11e4-a31a-e7c939bf1427', '13771213325', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c3556b18-451b-11e4-a31a-e7c939bf1427', '13003369873', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c35810e3-451b-11e4-a31a-e7c939bf1427', '13506162989', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c35cb9fc-451b-11e4-a31a-e7c939bf1427', '13771298308', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:11', '1', '2014-09-26 09:24:14', NULL, '1'),
('c64726cb-4519-11e4-a31a-e7c939bf1427', '15365201955', '所留电话是否一致？国税申港代办点', '2014-09-26 09:09:56', '1', '2014-09-26 09:10:04', NULL, '1'),
('c8b8b078-123e-11e4-af4a-1d68b34852c0', '15214328120', '郑凯恩你好,你单位本月申报的税金10000.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如已经交纳请忽略该提醒', '2014-07-23 15:56:06', '1', '2014-07-23 16:19:06', NULL, '1'),
('c9bccb7f-451b-11e4-a31a-e7c939bf1427', '13063657825', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9c69a3e-451b-11e4-a31a-e7c939bf1427', '13218775120', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9c95676-451b-11e4-a31a-e7c939bf1427', '13337914870', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9cd114f-451b-11e4-a31a-e7c939bf1427', '13585068817', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9cfbab4-451b-11e4-a31a-e7c939bf1427', '15152297978', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9d37590-451b-11e4-a31a-e7c939bf1427', '13093025189', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9d61f22-451b-11e4-a31a-e7c939bf1427', '13921367157', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9dac462-451b-11e4-a31a-e7c939bf1427', '13921211757', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9dd83cf-451b-11e4-a31a-e7c939bf1427', '15961515325', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9e3e6d3-451b-11e4-a31a-e7c939bf1427', '13771618551', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9ea372d-451b-11e4-a31a-e7c939bf1427', '15861656037', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9edf1e0-451b-11e4-a31a-e7c939bf1427', '13921239421', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9f283d6-451b-11e4-a31a-e7c939bf1427', '18001522222', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9f6293d-451b-11e4-a31a-e7c939bf1427', '15961680335', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9f8d2e2-451b-11e4-a31a-e7c939bf1427', '13771287780', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9fc8de1-451b-11e4-a31a-e7c939bf1427', '13921250781', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9ff3839-451b-11e4-a31a-e7c939bf1427', '13338152219', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('ca02f243-451b-11e4-a31a-e7c939bf1427', '13912451520', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('ca0783e6-451b-11e4-a31a-e7c939bf1427', '13771211213', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('ca0b2a5b-451b-11e4-a31a-e7c939bf1427', '13915258757', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('ccad41b6-4f54-11e4-a31a-e7c939bf1427', '13606164011', '纳税人您好！你单位前三个月开票销售超过所核定定额的30%以上，需要调整定额，请来电86621039！国税申港代办点', '2014-10-09 09:38:07', '1', '2014-10-09 09:38:15', NULL, '1'),
('ccbf629c-451a-11e4-a31a-e7c939bf1427', '13921364597', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccc4e60a-451a-11e4-a31a-e7c939bf1427', '15251557928', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('cccb486e-451a-11e4-a31a-e7c939bf1427', '13182730588', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('cccefb35-451a-11e4-a31a-e7c939bf1427', '13961620328', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccd4752a-451a-11e4-a31a-e7c939bf1427', '13812158161', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccd732d9-451a-11e4-a31a-e7c939bf1427', '13063699165', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccdada53-451a-11e4-a31a-e7c939bf1427', '86684881', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccdd9772-451a-11e4-a31a-e7c939bf1427', '13626231688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('cce13e10-451a-11e4-a31a-e7c939bf1427', '15861608807', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('cce3fc1c-451a-11e4-a31a-e7c939bf1427', '15365201955', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('cce7a244-451a-11e4-a31a-e7c939bf1427', '18921353828', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccea60b3-451a-11e4-a31a-e7c939bf1427', '13914282098', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccee06b0-451a-11e4-a31a-e7c939bf1427', '13861615585', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccf0c4e3-451a-11e4-a31a-e7c939bf1427', '13812585070', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('ccf46ba1-451a-11e4-a31a-e7c939bf1427', '13771217377', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('ccf8133d-451a-11e4-a31a-e7c939bf1427', '13921352588', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('ccfbb9da-451a-11e4-a31a-e7c939bf1427', '13921356228', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('ccfe77d5-451a-11e4-a31a-e7c939bf1427', '13584166658', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('cd021e60-451a-11e4-a31a-e7c939bf1427', '13812179129', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('cd04dc5b-451a-11e4-a31a-e7c939bf1427', '13003355090', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('d1079ee2-3e41-11e4-a31a-e7c939bf1427', '13815121006', '黄惠芬你好,你单位本月申报的税金664.730元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询。江阴临港协税护税', '2014-09-17 16:08:37', '1', '2014-09-17 16:08:42', NULL, '1'),
('d1504534-46b3-11e4-a31a-e7c939bf1427', '15961677039', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:14', NULL, '1'),
('d153d3c9-46b3-11e4-a31a-e7c939bf1427', '13815130889', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:14', NULL, '1'),
('d1586495-46b3-11e4-a31a-e7c939bf1427', '13812115056', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:14', NULL, '1'),
('d15c0ad4-46b3-11e4-a31a-e7c939bf1427', '13584111937', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:14', NULL, '1'),
('d15ec961-46b3-11e4-a31a-e7c939bf1427', '13057371305', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d1626fab-46b3-11e4-a31a-e7c939bf1427', '13961608711', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d1652d69-46b3-11e4-a31a-e7c939bf1427', '13906160291', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d168d9ff-46b3-11e4-a31a-e7c939bf1427', '13771231983', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d16c7b76-46b3-11e4-a31a-e7c939bf1427', '13584111937', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d16f395c-46b3-11e4-a31a-e7c939bf1427', '13901528961', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d172df94-46b3-11e4-a31a-e7c939bf1427', '13701529586', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d1759d9c-46b3-11e4-a31a-e7c939bf1427', '18906165089', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d179441d-46b3-11e4-a31a-e7c939bf1427', '13506166109', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d17dd647-46b3-11e4-a31a-e7c939bf1427', '13815130889', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d1817d17-46b3-11e4-a31a-e7c939bf1427', '13806168712', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d1843af0-46b3-11e4-a31a-e7c939bf1427', '13812152381', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d187e260-46b3-11e4-a31a-e7c939bf1427', '13921250781', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d18a9fbc-46b3-11e4-a31a-e7c939bf1427', '13961643267', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d18e4561-46b3-11e4-a31a-e7c939bf1427', '15601522988', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1');
INSERT INTO `tp_plt_mobile_msg` (`OID`, `ReceTelNo`, `MsgContent`, `InsertTime`, `SendStates`, `SendTime`, `Note`, `IsSend`) VALUES
('d192d781-46b3-11e4-a31a-e7c939bf1427', '13806163580', '更正一下，你们所收到得是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:05:13', '1', '2014-09-28 10:05:15', NULL, '1'),
('d985a94b-451b-11e4-a31a-e7c939bf1427', '13921237599', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d987730d-451b-11e4-a31a-e7c939bf1427', '13771286689', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d98a2ec9-451b-11e4-a31a-e7c939bf1427', '13901524830', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d98c0389-451b-11e4-a31a-e7c939bf1427', '13961666697', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9909418-451b-11e4-a31a-e7c939bf1427', '13585053882', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d99267d7-451b-11e4-a31a-e7c939bf1427', '13961614559', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9952403-451b-11e4-a31a-e7c939bf1427', '13806163986', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d996f8fd-451b-11e4-a31a-e7c939bf1427', '13906169150', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d999b550-451b-11e4-a31a-e7c939bf1427', '15852622777', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d99d4292-451b-11e4-a31a-e7c939bf1427', '15306167618', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9a019e6-451b-11e4-a31a-e7c939bf1427', '13961672990', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9a1ee89-451b-11e4-a31a-e7c939bf1427', '15961661032', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9a4aa8e-451b-11e4-a31a-e7c939bf1427', '13706161078', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9a67f90-451b-11e4-a31a-e7c939bf1427', '13771238301', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9a93b72-451b-11e4-a31a-e7c939bf1427', '13914191037', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9acc8d6-451b-11e4-a31a-e7c939bf1427', '13706161078', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:55', NULL, '1'),
('d9afa09a-451b-11e4-a31a-e7c939bf1427', '13337911786', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:55', NULL, '1'),
('d9b17502-451b-11e4-a31a-e7c939bf1427', '18961656792', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:55', NULL, '1'),
('d9b4310a-451b-11e4-a31a-e7c939bf1427', '13270153077', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:55', NULL, '1'),
('d9b60557-451b-11e4-a31a-e7c939bf1427', '13906162980', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:55', NULL, '1'),
('da067684-42cd-11e4-a31a-e7c939bf1427', '13901522951', '申港企业你好,你单位本月申报的税金200.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询86621039。江阴临港协税护税', '2014-09-23 11:01:19', '1', '2014-09-23 11:01:23', NULL, '1'),
('df1427a6-3ae5-11e4-89f0-8a3b87f32f10', '13616160833', '将in高荣你好,你单位本月申报的税金1000.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如已经交纳请忽略该提醒', '2014-09-13 09:33:13', '1', '2014-09-13 09:33:15', NULL, '1'),
('dfe77b1b-451b-11e4-a31a-e7c939bf1427', '13182788918', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:58', '1', '2014-09-26 09:25:04', NULL, '1'),
('dfea1b48-451b-11e4-a31a-e7c939bf1427', '13914176818', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:58', '1', '2014-09-26 09:25:04', NULL, '1'),
('dfecd959-451b-11e4-a31a-e7c939bf1427', '13771251510', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:58', '1', '2014-09-26 09:25:04', NULL, '1'),
('dff07fc4-451b-11e4-a31a-e7c939bf1427', '13952481896', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:58', '1', '2014-09-26 09:25:04', NULL, '1'),
('dff253c1-451b-11e4-a31a-e7c939bf1427', '13812109066', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:58', '1', '2014-09-26 09:25:04', NULL, '1'),
('dff5102c-451b-11e4-a31a-e7c939bf1427', '13812170708', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('dff98245-451b-11e4-a31a-e7c939bf1427', '13915253902', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('dffc5ea6-451b-11e4-a31a-e7c939bf1427', '13771615680', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('dffe3344-451b-11e4-a31a-e7c939bf1427', '13915228684', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('e000eef8-451b-11e4-a31a-e7c939bf1427', '13771615680', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('e002c38f-451b-11e4-a31a-e7c939bf1427', '13218766662', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('e0058022-451b-11e4-a31a-e7c939bf1427', '13306191071', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('e00908ba-451b-11e4-a31a-e7c939bf1427', '13151953088', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('e4d7c045-42c3-11e4-a31a-e7c939bf1427', '18921260039', '424你好,你单位本月申报的税金100.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询13166155025。江阴临港协税护税', '2014-09-23 09:50:02', '1', '2014-09-23 09:50:12', NULL, '1'),
('ecd935f4-54fe-11e4-a31a-e7c939bf1427', '13812116151', '江阴市申港平安装卸队你好,你单位本月申报的税金1008.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 14:38:48', '1', '2014-10-16 14:38:48', NULL, '1'),
('ecdc1554-54fe-11e4-a31a-e7c939bf1427', '13771259899', '江阴市鼎顺广告制作部你好,你单位本月申报的税金873.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 14:38:48', '1', '2014-10-16 14:38:48', NULL, '1'),
('ecdde9e9-54fe-11e4-a31a-e7c939bf1427', '13584140134', '江阴市申港俊锋电器商店你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 14:38:48', '1', '2014-10-16 14:38:48', NULL, '1'),
('ece18fef-54fe-11e4-a31a-e7c939bf1427', '15861608807', '江阴市云逸装潢材料店你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 14:38:48', '1', '2014-10-16 14:38:48', NULL, '1'),
('ece3642c-54fe-11e4-a31a-e7c939bf1427', '13395165052', '江阴市恒平热水服务部你好,你单位本月申报的税金1042.200元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 14:38:48', '1', '2014-10-16 14:38:48', NULL, '1'),
('ece620ff-54fe-11e4-a31a-e7c939bf1427', '15251557928', '江阴市海鹏玻璃钢制品厂你好,你单位本月申报的税金1158.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 14:38:48', '1', '2014-10-16 14:38:48', NULL, '1'),
('ece9c884-54fe-11e4-a31a-e7c939bf1427', '13914282098', '江阴市申港瑀轩花岗岩加工厂你好,你单位本月申报的税金672.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 14:38:48', '1', '2014-10-16 14:38:48', NULL, '1'),
('ecef36ab-54fe-11e4-a31a-e7c939bf1427', '13584166658', '江阴市尤斌螺杆加工厂你好,你单位本月申报的税金910.600元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 14:38:48', '1', '2014-10-16 14:38:48', NULL, '1'),
('ecf3c9e9-54fe-11e4-a31a-e7c939bf1427', '13861634795', '江阴市申港安诚汽车服务部你好,你单位本月申报的税金739.200元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86621039。江阴临港协税护税', '2014-10-16 14:38:48', '1', '2014-10-16 14:38:48', NULL, '1'),
('f0f26864-42cc-11e4-a31a-e7c939bf1427', '13901522951', '许荣忠你好,你单位本月申报的税金200.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询86621039。江阴临港协税护税', '2014-09-23 10:54:48', '1', '2014-09-23 10:54:53', NULL, '1'),
('f320fa28-46b3-11e4-a31a-e7c939bf1427', '13485029018', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:14', NULL, '1'),
('f325f727-46b3-11e4-a31a-e7c939bf1427', '13151958828', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:14', NULL, '1'),
('f328b4f6-46b3-11e4-a31a-e7c939bf1427', '13921351002', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:14', NULL, '1'),
('f32c5b8c-46b3-11e4-a31a-e7c939bf1427', '13901527399', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f32f1989-46b3-11e4-a31a-e7c939bf1427', '13337911786', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f332c05e-46b3-11e4-a31a-e7c939bf1427', '18861627761', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f3357dbd-46b3-11e4-a31a-e7c939bf1427', '13861601895', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f33a0e83-46b3-11e4-a31a-e7c939bf1427', '13961618955', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f33ccc7b-46b3-11e4-a31a-e7c939bf1427', '18915250957', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f3407349-46b3-11e4-a31a-e7c939bf1427', '15961667171', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f343305b-46b3-11e4-a31a-e7c939bf1427', '13921209170', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f346d6dd-46b3-11e4-a31a-e7c939bf1427', '18651036804', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f34995e9-46b3-11e4-a31a-e7c939bf1427', '13771258765', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f34c528b-46b3-11e4-a31a-e7c939bf1427', '13196511668', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f34ffaed-46b3-11e4-a31a-e7c939bf1427', '13812131170', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f352b8ed-46b3-11e4-a31a-e7c939bf1427', '13861612356', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f3565e13-46b3-11e4-a31a-e7c939bf1427', '13961625017', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f3591b1c-46b3-11e4-a31a-e7c939bf1427', '13656159803', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f35dabc2-46b3-11e4-a31a-e7c939bf1427', '13812109066', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f36069dc-46b3-11e4-a31a-e7c939bf1427', '13506162989', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:10', '1', '2014-09-28 10:06:15', NULL, '1'),
('f6ce3d02-42c5-11e4-a31a-e7c939bf1427', '13861635900', '请于两日内来做定额调整！', '2014-09-23 10:04:51', '1', '2014-09-23 10:04:53', NULL, '1'),
('f6d20a1d-42c5-11e4-a31a-e7c939bf1427', '13961602119', '请于两日内来做定额调整！', '2014-09-23 10:04:51', '1', '2014-09-23 10:04:53', NULL, '1'),
('fc15f345-46b3-11e4-a31a-e7c939bf1427', '1381254608', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:34', NULL, '1'),
('fc1bf1ad-46b3-11e4-a31a-e7c939bf1427', '13801527562', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:34', NULL, '1'),
('fc1dc50f-46b3-11e4-a31a-e7c939bf1427', '13337911786', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:34', NULL, '1'),
('fc225714-46b3-11e4-a31a-e7c939bf1427', '13771258765', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:34', NULL, '1'),
('fc30f2e5-46b3-11e4-a31a-e7c939bf1427', '18651007881', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:34', NULL, '1'),
('fc416221-46b3-11e4-a31a-e7c939bf1427', '18906165089', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc468d23-46b3-11e4-a31a-e7c939bf1427', '13915306762', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc4e2d3c-46b3-11e4-a31a-e7c939bf1427', '13404275932', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc51d9ff-46b3-11e4-a31a-e7c939bf1427', '13915239277', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc591529-46b3-11e4-a31a-e7c939bf1427', '13771270755', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc5f87e9-46b3-11e4-a31a-e7c939bf1427', '13182723092', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc6a7b7b-46b3-11e4-a31a-e7c939bf1427', '13901521280', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc70e07f-46b3-11e4-a31a-e7c939bf1427', '13914170598', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc7570cb-46b3-11e4-a31a-e7c939bf1427', '13812158552', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc782ee1-46b3-11e4-a31a-e7c939bf1427', '13961650559', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc7f7c2c-46b3-11e4-a31a-e7c939bf1427', '13806163785', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc814ece-46b3-11e4-a31a-e7c939bf1427', '13771213325', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc84f60c-46b3-11e4-a31a-e7c939bf1427', '13003369873', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc8b5b99-46b3-11e4-a31a-e7c939bf1427', '13506162989', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1'),
('fc8e17f3-46b3-11e4-a31a-e7c939bf1427', '13771298308', '更正一下，你们所收到的是整个临港公众平台所留电话，国税申港代办点咨询电话为：86621039、81655039，给您带来不便请谅解！', '2014-09-28 10:06:25', '1', '2014-09-28 10:06:35', NULL, '1');

-- --------------------------------------------------------

--
-- 表的结构 `tp_plt_mobile_msg_copy`
--

CREATE TABLE IF NOT EXISTS `tp_plt_mobile_msg_copy` (
  `OID` varchar(36) NOT NULL,
  `ReceTelNo` varchar(20) NOT NULL,
  `MsgContent` varchar(3000) DEFAULT NULL,
  `InsertTime` datetime NOT NULL,
  `SendStates` varchar(512) DEFAULT NULL,
  `SendTime` datetime DEFAULT NULL,
  `Note` varchar(1024) DEFAULT NULL,
  `IsSend` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_plt_mobile_msg_copy`
--

INSERT INTO `tp_plt_mobile_msg_copy` (`OID`, `ReceTelNo`, `MsgContent`, `InsertTime`, `SendStates`, `SendTime`, `Note`, `IsSend`) VALUES
('0207df90-42c4-11e4-a31a-e7c939bf1427', '13771617986', '424你好,你单位本月申报的税金100.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询13166155025。江阴临港协税护税', '2014-09-23 09:50:51', '1', '2014-09-23 09:50:52', NULL, '1'),
('169f0f99-42e7-11e4-a31a-e7c939bf1427', '15861608630', '夏港你好,你单位本月申报的税金200.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询13166155025。江阴临港协税护税', '2014-09-23 14:01:59', '1', '2014-09-23 14:02:03', NULL, '1'),
('20a8be64-123f-11e4-af4a-1d68b34852c0', '15061786875', '胡玉凤你好,你单位本月申报的税金1222.220元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如已经交纳请忽略该提醒', '2014-07-23 15:58:33', '1', '2014-07-23 16:19:35', NULL, '1'),
('3495651f-42bd-11e4-a31a-e7c939bf1427', '', '', '2014-09-23 09:02:09', '104', '2014-09-23 09:02:12', NULL, '1'),
('349b3847-42bd-11e4-a31a-e7c939bf1427', '', '', '2014-09-23 09:02:10', '104', '2014-09-23 09:02:12', NULL, '1'),
('349d0d8e-42bd-11e4-a31a-e7c939bf1427', '', '', '2014-09-23 09:02:10', '104', '2014-09-23 09:02:12', NULL, '1'),
('34a19cf5-42bd-11e4-a31a-e7c939bf1427', '', '', '2014-09-23 09:02:10', '104', '2014-09-23 09:02:12', NULL, '1'),
('3ba2aed4-42bd-11e4-a31a-e7c939bf1427', '', '', '2014-09-23 09:02:21', '104', '2014-09-23 09:02:22', NULL, '1'),
('3ba4fde4-42bd-11e4-a31a-e7c939bf1427', '', '', '2014-09-23 09:02:21', '104', '2014-09-23 09:02:22', NULL, '1'),
('3ba6d20a-42bd-11e4-a31a-e7c939bf1427', '', '', '2014-09-23 09:02:21', '104', '2014-09-23 09:02:22', NULL, '1'),
('3baa7829-42bd-11e4-a31a-e7c939bf1427', '', '', '2014-09-23 09:02:21', '104', '2014-09-23 09:02:22', NULL, '1'),
('3ce582b8-3fd3-11e4-a31a-e7c939bf1427', '15061786875', '测试', '2014-09-19 16:02:11', '1', '2014-09-19 16:02:12', NULL, '1'),
('430ad87c-438b-11e4-a31a-e7c939bf1427', '15214328120', '16464你好,你单位本月申报的税金100.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询86621039。江阴临港协税护税', '2014-09-24 09:37:12', '1', '2014-09-24 09:37:14', NULL, '1'),
('4db0d718-451b-11e4-a31a-e7c939bf1427', '13921250781', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4db5ff3c-451b-11e4-a31a-e7c939bf1427', '15961623367', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4db8bde6-451b-11e4-a31a-e7c939bf1427', '13901525909', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dbc630b-451b-11e4-a31a-e7c939bf1427', '13812151266', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dbf21aa-451b-11e4-a31a-e7c939bf1427', '13771290121', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dc2c7ba-451b-11e4-a31a-e7c939bf1427', '13301527535', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dc58628-451b-11e4-a31a-e7c939bf1427', '13961666697', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dcafffe-451b-11e4-a31a-e7c939bf1427', '18626365800', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dcdbe20-451b-11e4-a31a-e7c939bf1427', '13706160108', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dd163fc-451b-11e4-a31a-e7c939bf1427', '13914180910', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dd422d2-451b-11e4-a31a-e7c939bf1427', '18921260977', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:54', NULL, '1'),
('4dd7c8a6-451b-11e4-a31a-e7c939bf1427', '15312285168', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4ddc5a44-451b-11e4-a31a-e7c939bf1427', '13585052156', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4de0009b-451b-11e4-a31a-e7c939bf1427', '13771259899', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4de1d606-451b-11e4-a31a-e7c939bf1427', '15261625605', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4de922af-451b-11e4-a31a-e7c939bf1427', '13506161558', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4debe0bd-451b-11e4-a31a-e7c939bf1427', '13921263088', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:53', '1', '2014-09-26 09:20:55', NULL, '1'),
('4def86ff-451b-11e4-a31a-e7c939bf1427', '13506165755', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:54', '1', '2014-09-26 09:20:55', NULL, '1'),
('4df418b1-451b-11e4-a31a-e7c939bf1427', '13806168712', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:54', '1', '2014-09-26 09:20:55', NULL, '1'),
('4df7bec2-451b-11e4-a31a-e7c939bf1427', '13961685998', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:20:54', '1', '2014-09-26 09:20:55', NULL, '1'),
('573ec836-3fd3-11e4-a31a-e7c939bf1427', '15061786875', '江阴高通你好,你单位本月申报的税金10000.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询。江阴临港协税护税', '2014-09-19 16:02:55', '1', '2014-09-19 16:03:02', NULL, '1'),
('5da4a32b-4388-11e4-a31a-e7c939bf1427', '13771617986', '123你好,你单位本月申报的税金12.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-860939。江阴临港协税护税', '2014-09-24 09:16:28', '1', '2014-09-24 09:16:34', NULL, '1'),
('5f5a14e0-451b-11e4-a31a-e7c939bf1427', '13961662510', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f5e6776-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f6125d6-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f64cb07-451b-11e4-a31a-e7c939bf1427', '13801529488', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f6789df-451b-11e4-a31a-e7c939bf1427', '13961618955', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f6b2fbc-451b-11e4-a31a-e7c939bf1427', '13861625288', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f6dee4b-451b-11e4-a31a-e7c939bf1427', '13812177219', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f7255c4-451b-11e4-a31a-e7c939bf1427', '13961672990', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f74524d-451b-11e4-a31a-e7c939bf1427', '13961616881', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f77f8b3-451b-11e4-a31a-e7c939bf1427', '13861621175', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f7ab6f4-451b-11e4-a31a-e7c939bf1427', '18906165089', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f7e5cbd-451b-11e4-a31a-e7c939bf1427', '13506161555', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f811b91-451b-11e4-a31a-e7c939bf1427', '13861667861', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f866d2c-451b-11e4-a31a-e7c939bf1427', '13013659095', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f89536f-451b-11e4-a31a-e7c939bf1427', '13057255157', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f8cf964-451b-11e4-a31a-e7c939bf1427', '13961642435', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f8fb858-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f935da6-451b-11e4-a31a-e7c939bf1427', '15961519538', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f97065d-451b-11e4-a31a-e7c939bf1427', '13806164540', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('5f9aac95-451b-11e4-a31a-e7c939bf1427', '13861634795', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:23', '1', '2014-09-26 09:21:24', NULL, '1'),
('639d3b62-439c-11e4-a31a-e7c939bf1427', '13771617986', '16464你好,你单位本月申报的税金100.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86093916。江阴临港协税护税', '2014-09-24 11:39:49', '1', '2014-09-24 11:39:54', NULL, '1'),
('66f39a3c-42cd-11e4-a31a-e7c939bf1427', '13901522951', '许荣忠你好,你单位本月申报的税金200.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询86621039。江阴临港协税护税', '2014-09-23 10:58:06', '1', '2014-09-23 10:58:13', NULL, '1'),
('6868f889-439c-11e4-a31a-e7c939bf1427', '13771617986', '16464你好,你单位本月申报的税金100.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-86093916。江阴临港协税护税', '2014-09-24 11:39:57', '1', '2014-09-24 11:40:04', NULL, '1'),
('686ffe80-42c3-11e4-a31a-e7c939bf1427', '0510-86023389', '这里编辑发送信息的格式', '2014-09-23 09:46:34', '1', '2014-09-23 09:46:43', NULL, '1'),
('6acce84f-451b-11e4-a31a-e7c939bf1427', '13405795854', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ad0e6dd-451b-11e4-a31a-e7c939bf1427', '13961601562', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ad3a50a-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ad74b5e-451b-11e4-a31a-e7c939bf1427', '86623131', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ada0a2a-451b-11e4-a31a-e7c939bf1427', '13801527556', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6adf5c82-451b-11e4-a31a-e7c939bf1427', '13585061933', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ae157be-451b-11e4-a31a-e7c939bf1427', '13003355300', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ae4fdcc-451b-11e4-a31a-e7c939bf1427', '15950120088', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6ae7bca5-451b-11e4-a31a-e7c939bf1427', '13376229935', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6aeb6245-451b-11e4-a31a-e7c939bf1427', '13291207261', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6aeee206-451b-11e4-a31a-e7c939bf1427', '13656160268', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6af1c6ea-451b-11e4-a31a-e7c939bf1427', '15365267595', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6af485bb-451b-11e4-a31a-e7c939bf1427', '13901527322', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6af82b46-451b-11e4-a31a-e7c939bf1427', '18901525189', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:44', NULL, '1'),
('6afae9dc-451b-11e4-a31a-e7c939bf1427', '13915220010', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6afe9010-451b-11e4-a31a-e7c939bf1427', '13701524595', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6b02380c-451b-11e4-a31a-e7c939bf1427', '13815125389', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6b05de06-451b-11e4-a31a-e7c939bf1427', '13806168712', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6b089cf9-451b-11e4-a31a-e7c939bf1427', '18861653222', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6b0c4296-451b-11e4-a31a-e7c939bf1427', '13812572148', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:42', '1', '2014-09-26 09:21:45', NULL, '1'),
('6d6d2d5c-1242-11e4-af4a-1d68b34852c0', '15061786875', '胡玉凤你好,你单位本月申报的税金1222.220元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如已经交纳请忽略该提醒', '2014-07-23 16:22:11', '1', '2014-07-23 16:22:15', NULL, '1'),
('6d7115ac-1242-11e4-af4a-1d68b34852c0', '15061786875', '胡玉凤你好,你单位本月申报的税金2222.230元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如已经交纳请忽略该提醒', '2014-07-23 16:22:11', '1', '2014-07-23 16:22:15', NULL, '1'),
('72d16536-123e-11e4-af4a-1d68b34852c0', '15061786875', '胡玉凤你好,你单位本月申报的税金1222.220元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如已经交纳请忽略该提醒', '2014-07-23 15:53:42', '1', '2014-07-23 16:19:45', NULL, '1'),
('73d21adf-451b-11e4-a31a-e7c939bf1427', '13812572148', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73d49c45-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73d841d1-451b-11e4-a31a-e7c939bf1427', '18961675766', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73daffec-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73dea633-451b-11e4-a31a-e7c939bf1427', '13812116151', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73e13bcd-451b-11e4-a31a-e7c939bf1427', '15950137866', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73e5f499-451b-11e4-a31a-e7c939bf1427', '13901527322', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73e88a23-451b-11e4-a31a-e7c939bf1427', '13815121006', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73ec3142-451b-11e4-a31a-e7c939bf1427', '13706164005', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73eeeec9-451b-11e4-a31a-e7c939bf1427', '13771598108', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73f29586-451b-11e4-a31a-e7c939bf1427', '13861618629', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73f5533a-451b-11e4-a31a-e7c939bf1427', '18651030124', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73fa0c2d-451b-11e4-a31a-e7c939bf1427', '13395169652', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:04', NULL, '1'),
('73fcca72-451b-11e4-a31a-e7c939bf1427', '13771270688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('7400483b-451b-11e4-a31a-e7c939bf1427', '13812108188', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('7401cf29-3fd5-11e4-a31a-e7c939bf1427', '15061786875', '江阴高通你好,你单位本月申报的税金10000.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询13166155025。江阴临港协税护税', '2014-09-19 16:18:02', '1', '2014-09-19 16:18:12', NULL, '1'),
('74032eca-451b-11e4-a31a-e7c939bf1427', '13093111125', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('7406ad2d-451b-11e4-a31a-e7c939bf1427', '13093111125', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('740c50e1-451b-11e4-a31a-e7c939bf1427', '15161659938', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('740fced4-451b-11e4-a31a-e7c939bf1427', '13093111125', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('7412b51b-451b-11e4-a31a-e7c939bf1427', '13395165052', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:21:57', '1', '2014-09-26 09:22:05', NULL, '1'),
('797b63b9-438b-11e4-a31a-e7c939bf1427', '15214328120', '16464你好,你单位本月申报的税金100.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询0510-860939。江阴临港协税护税', '2014-09-24 09:38:44', '1', '2014-09-24 09:38:54', NULL, '1'),
('7b9bb064-451b-11e4-a31a-e7c939bf1427', '13815138752', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7b9ffa4d-451b-11e4-a31a-e7c939bf1427', '13301525770', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7ba39f9d-451b-11e4-a31a-e7c939bf1427', '13914202262', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7ba65d65-451b-11e4-a31a-e7c939bf1427', '13585052277', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7baaed65-451b-11e4-a31a-e7c939bf1427', '13915251111', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7badac78-451b-11e4-a31a-e7c939bf1427', '13906160040', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bb151b0-451b-11e4-a31a-e7c939bf1427', '15961650807', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bb4109c-451b-11e4-a31a-e7c939bf1427', '13806165992', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bb7b672-451b-11e4-a31a-e7c939bf1427', '13584140134', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bba74ef-451b-11e4-a31a-e7c939bf1427', '13861622587', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bbf06a6-451b-11e4-a31a-e7c939bf1427', '18906165089', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('7bc1c3a8-451b-11e4-a31a-e7c939bf1427', '13961614559', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:22:10', '1', '2014-09-26 09:22:14', NULL, '1'),
('866d53a6-3ae6-11e4-89f0-8a3b87f32f10', '0510-86023389', '耿世杰是·····', '2014-09-13 09:37:54', '1', '2014-09-13 09:37:55', NULL, '1'),
('86b5396c-42cd-11e4-a31a-e7c939bf1427', '13901522951', '许荣忠你好,你单位本月申报的税金200.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询86621039。江阴临港协税护税', '2014-09-23 10:58:59', '1', '2014-09-23 10:59:03', NULL, '1'),
('8b7c5551-42ce-11e4-a31a-e7c939bf1427', '13901522951', '申港企业你好,你单位本月申报的税金200.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询86621039。江阴临港协税护税', '2014-09-23 11:06:17', '1', '2014-09-23 11:06:23', NULL, '1'),
('a593044d-3ae6-11e4-89f0-8a3b87f32f10', '0510-86023389', '耿世杰是·····电话：86023389', '2014-09-13 09:38:46', '1', '2014-09-13 09:38:55', NULL, '1'),
('ab28e970-42ce-11e4-a31a-e7c939bf1427', '13616160833', '申港企业你好,你单位本月申报的税金200.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询86621039。江阴临港协税护税', '2014-09-23 11:07:10', '1', '2014-09-23 11:07:13', NULL, '1'),
('b09f30d5-451b-11e4-a31a-e7c939bf1427', '15961677039', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0a32519-451b-11e4-a31a-e7c939bf1427', '13815130889', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0a6eb9f-451b-11e4-a31a-e7c939bf1427', '13812115056', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0a9a79f-451b-11e4-a31a-e7c939bf1427', '13584111937', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0ab7c7e-451b-11e4-a31a-e7c939bf1427', '13057371305', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0ae388d-451b-11e4-a31a-e7c939bf1427', '13961608711', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0b00d44-451b-11e4-a31a-e7c939bf1427', '13906160291', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0b2c9fd-451b-11e4-a31a-e7c939bf1427', '13771231983', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0b587e2-451b-11e4-a31a-e7c939bf1427', '13584111937', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0b8441f-451b-11e4-a31a-e7c939bf1427', '13901528961', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0ba18fe-451b-11e4-a31a-e7c939bf1427', '13701529586', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0bcd551-451b-11e4-a31a-e7c939bf1427', '18906165089', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0bea9b0-451b-11e4-a31a-e7c939bf1427', '13506166109', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0c165de-451b-11e4-a31a-e7c939bf1427', '13815130889', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0c50e1b-451b-11e4-a31a-e7c939bf1427', '13806168712', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0c7ca51-451b-11e4-a31a-e7c939bf1427', '13812152381', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:44', NULL, '1'),
('b0c99f17-451b-11e4-a31a-e7c939bf1427', '13921250781', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:45', NULL, '1'),
('b0cc5b4a-451b-11e4-a31a-e7c939bf1427', '13961643267', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:45', NULL, '1'),
('b0ce300e-451b-11e4-a31a-e7c939bf1427', '15601522988', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:45', NULL, '1'),
('b0d0ec1f-451b-11e4-a31a-e7c939bf1427', '13806163580', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:39', '1', '2014-09-26 09:23:45', NULL, '1'),
('b4f9ae81-1240-11e4-af4a-1d68b34852c0', '15061786875', '胡玉凤你好,你单位本月申报的税金1222.220元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如已经交纳请忽略该提醒', '2014-07-23 16:09:52', '1', '2014-07-23 16:19:45', NULL, '1'),
('bb49e307-451b-11e4-a31a-e7c939bf1427', '13485029018', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb4dc7e4-451b-11e4-a31a-e7c939bf1427', '13151958828', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb5083c6-451b-11e4-a31a-e7c939bf1427', '13921351002', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb52588f-451b-11e4-a31a-e7c939bf1427', '13901527399', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb56e811-451b-11e4-a31a-e7c939bf1427', '13337911786', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb58bd5c-451b-11e4-a31a-e7c939bf1427', '18861627761', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb5b78e1-451b-11e4-a31a-e7c939bf1427', '13861601895', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb5d4de2-451b-11e4-a31a-e7c939bf1427', '13961618955', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb600a35-451b-11e4-a31a-e7c939bf1427', '18915250957', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb61de9c-451b-11e4-a31a-e7c939bf1427', '15961667171', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb658492-451b-11e4-a31a-e7c939bf1427', '13921209170', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb67594f-451b-11e4-a31a-e7c939bf1427', '18651036804', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb6a1550-451b-11e4-a31a-e7c939bf1427', '13771258765', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb6bea27-451b-11e4-a31a-e7c939bf1427', '13196511668', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb6ea651-451b-11e4-a31a-e7c939bf1427', '13812131170', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb707b2b-451b-11e4-a31a-e7c939bf1427', '13861612356', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb750adf-451b-11e4-a31a-e7c939bf1427', '13961625017', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:04', NULL, '1'),
('bb76df87-451b-11e4-a31a-e7c939bf1427', '13656159803', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:05', NULL, '1'),
('bb799c03-451b-11e4-a31a-e7c939bf1427', '13812109066', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:05', NULL, '1'),
('bb7b7067-451b-11e4-a31a-e7c939bf1427', '13506162989', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:23:57', '1', '2014-09-26 09:24:05', NULL, '1'),
('c1737c30-42c3-11e4-a31a-e7c939bf1427', '18921260039', '424你好,你单位本月申报的税金100.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询13166155025。江阴临港协税护税', '2014-09-23 09:49:03', '1', '2014-09-23 09:49:12', NULL, '1'),
('c2da79aa-42cd-11e4-a31a-e7c939bf1427', '13901522951', '申港企业你好,你单位本月申报的税金200.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询86621039。江阴临港协税护税', '2014-09-23 11:00:40', '1', '2014-09-23 11:00:43', NULL, '1'),
('c31e5651-451b-11e4-a31a-e7c939bf1427', '1381254608', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c323315b-451b-11e4-a31a-e7c939bf1427', '13801527562', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c325062b-451b-11e4-a31a-e7c939bf1427', '13337911786', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c327c20a-451b-11e4-a31a-e7c939bf1427', '13771258765', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c32996fc-451b-11e4-a31a-e7c939bf1427', '18651007881', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c32d3cd0-451b-11e4-a31a-e7c939bf1427', '18906165089', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c32fe19d-451b-11e4-a31a-e7c939bf1427', '13915306762', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1');
INSERT INTO `tp_plt_mobile_msg_copy` (`OID`, `ReceTelNo`, `MsgContent`, `InsertTime`, `SendStates`, `SendTime`, `Note`, `IsSend`) VALUES
('c3348b2e-451b-11e4-a31a-e7c939bf1427', '13404275932', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c3372fd8-451b-11e4-a31a-e7c939bf1427', '13915239277', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c33a0609-451b-11e4-a31a-e7c939bf1427', '13771270755', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c33caafa-451b-11e4-a31a-e7c939bf1427', '13182723092', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c3406a45-451b-11e4-a31a-e7c939bf1427', '13901521280', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c3430f7e-451b-11e4-a31a-e7c939bf1427', '13914170598', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c346cef2-451b-11e4-a31a-e7c939bf1427', '13812158552', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c34973fc-451b-11e4-a31a-e7c939bf1427', '13961650559', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c34d34ab-451b-11e4-a31a-e7c939bf1427', '13806163785', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c351ac20-451b-11e4-a31a-e7c939bf1427', '13771213325', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c3556b18-451b-11e4-a31a-e7c939bf1427', '13003369873', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c35810e3-451b-11e4-a31a-e7c939bf1427', '13506162989', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:10', '1', '2014-09-26 09:24:14', NULL, '1'),
('c35cb9fc-451b-11e4-a31a-e7c939bf1427', '13771298308', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:11', '1', '2014-09-26 09:24:14', NULL, '1'),
('c64726cb-4519-11e4-a31a-e7c939bf1427', '15365201955', '所留电话是否一致？国税申港代办点', '2014-09-26 09:09:56', '1', '2014-09-26 09:10:04', NULL, '1'),
('c8b8b078-123e-11e4-af4a-1d68b34852c0', '15214328120', '郑凯恩你好,你单位本月申报的税金10000.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如已经交纳请忽略该提醒', '2014-07-23 15:56:06', '1', '2014-07-23 16:19:06', NULL, '1'),
('c9bccb7f-451b-11e4-a31a-e7c939bf1427', '13063657825', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9c69a3e-451b-11e4-a31a-e7c939bf1427', '13218775120', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9c95676-451b-11e4-a31a-e7c939bf1427', '13337914870', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9cd114f-451b-11e4-a31a-e7c939bf1427', '13585068817', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9cfbab4-451b-11e4-a31a-e7c939bf1427', '15152297978', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9d37590-451b-11e4-a31a-e7c939bf1427', '13093025189', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9d61f22-451b-11e4-a31a-e7c939bf1427', '13921367157', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9dac462-451b-11e4-a31a-e7c939bf1427', '13921211757', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9dd83cf-451b-11e4-a31a-e7c939bf1427', '15961515325', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9e3e6d3-451b-11e4-a31a-e7c939bf1427', '13771618551', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:21', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9ea372d-451b-11e4-a31a-e7c939bf1427', '15861656037', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9edf1e0-451b-11e4-a31a-e7c939bf1427', '13921239421', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9f283d6-451b-11e4-a31a-e7c939bf1427', '18001522222', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9f6293d-451b-11e4-a31a-e7c939bf1427', '15961680335', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9f8d2e2-451b-11e4-a31a-e7c939bf1427', '13771287780', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9fc8de1-451b-11e4-a31a-e7c939bf1427', '13921250781', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('c9ff3839-451b-11e4-a31a-e7c939bf1427', '13338152219', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('ca02f243-451b-11e4-a31a-e7c939bf1427', '13912451520', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('ca0783e6-451b-11e4-a31a-e7c939bf1427', '13771211213', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('ca0b2a5b-451b-11e4-a31a-e7c939bf1427', '13915258757', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:22', '1', '2014-09-26 09:24:24', NULL, '1'),
('ccbf629c-451a-11e4-a31a-e7c939bf1427', '13921364597', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccc4e60a-451a-11e4-a31a-e7c939bf1427', '15251557928', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('cccb486e-451a-11e4-a31a-e7c939bf1427', '13182730588', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('cccefb35-451a-11e4-a31a-e7c939bf1427', '13961620328', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccd4752a-451a-11e4-a31a-e7c939bf1427', '13812158161', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccd732d9-451a-11e4-a31a-e7c939bf1427', '13063699165', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccdada53-451a-11e4-a31a-e7c939bf1427', '86684881', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccdd9772-451a-11e4-a31a-e7c939bf1427', '13626231688', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('cce13e10-451a-11e4-a31a-e7c939bf1427', '15861608807', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('cce3fc1c-451a-11e4-a31a-e7c939bf1427', '15365201955', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('cce7a244-451a-11e4-a31a-e7c939bf1427', '18921353828', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccea60b3-451a-11e4-a31a-e7c939bf1427', '13914282098', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccee06b0-451a-11e4-a31a-e7c939bf1427', '13861615585', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:24', NULL, '1'),
('ccf0c4e3-451a-11e4-a31a-e7c939bf1427', '13812585070', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('ccf46ba1-451a-11e4-a31a-e7c939bf1427', '13771217377', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('ccf8133d-451a-11e4-a31a-e7c939bf1427', '13921352588', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('ccfbb9da-451a-11e4-a31a-e7c939bf1427', '13921356228', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('ccfe77d5-451a-11e4-a31a-e7c939bf1427', '13584166658', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('cd021e60-451a-11e4-a31a-e7c939bf1427', '13812179129', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('cd04dc5b-451a-11e4-a31a-e7c939bf1427', '13003355090', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:17:17', '1', '2014-09-26 09:17:25', NULL, '1'),
('d1079ee2-3e41-11e4-a31a-e7c939bf1427', '13815121006', '黄惠芬你好,你单位本月申报的税金664.730元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询。江阴临港协税护税', '2014-09-17 16:08:37', '1', '2014-09-17 16:08:42', NULL, '1'),
('d640f629-3fd5-11e4-a31a-e7c939bf1427', '15061786875', '江阴高通你好,你单位本月申报的税金10000.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询13166155025。江阴临港协税护税', '2014-09-19 16:20:47', '1', '2014-09-19 16:20:52', NULL, '1'),
('d985a94b-451b-11e4-a31a-e7c939bf1427', '13921237599', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d987730d-451b-11e4-a31a-e7c939bf1427', '13771286689', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d98a2ec9-451b-11e4-a31a-e7c939bf1427', '13901524830', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d98c0389-451b-11e4-a31a-e7c939bf1427', '13961666697', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9909418-451b-11e4-a31a-e7c939bf1427', '13585053882', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d99267d7-451b-11e4-a31a-e7c939bf1427', '13961614559', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9952403-451b-11e4-a31a-e7c939bf1427', '13806163986', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d996f8fd-451b-11e4-a31a-e7c939bf1427', '13906169150', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d999b550-451b-11e4-a31a-e7c939bf1427', '15852622777', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d99d4292-451b-11e4-a31a-e7c939bf1427', '15306167618', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9a019e6-451b-11e4-a31a-e7c939bf1427', '13961672990', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9a1ee89-451b-11e4-a31a-e7c939bf1427', '15961661032', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9a4aa8e-451b-11e4-a31a-e7c939bf1427', '13706161078', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9a67f90-451b-11e4-a31a-e7c939bf1427', '13771238301', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9a93b72-451b-11e4-a31a-e7c939bf1427', '13914191037', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:54', NULL, '1'),
('d9acc8d6-451b-11e4-a31a-e7c939bf1427', '13706161078', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:55', NULL, '1'),
('d9afa09a-451b-11e4-a31a-e7c939bf1427', '13337911786', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:55', NULL, '1'),
('d9b17502-451b-11e4-a31a-e7c939bf1427', '18961656792', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:55', NULL, '1'),
('d9b4310a-451b-11e4-a31a-e7c939bf1427', '13270153077', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:55', NULL, '1'),
('d9b60557-451b-11e4-a31a-e7c939bf1427', '13906162980', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:48', '1', '2014-09-26 09:24:55', NULL, '1'),
('da067684-42cd-11e4-a31a-e7c939bf1427', '13901522951', '申港企业你好,你单位本月申报的税金200.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询86621039。江阴临港协税护税', '2014-09-23 11:01:19', '1', '2014-09-23 11:01:23', NULL, '1'),
('df1427a6-3ae5-11e4-89f0-8a3b87f32f10', '13616160833', '将in高荣你好,你单位本月申报的税金1000.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如已经交纳请忽略该提醒', '2014-09-13 09:33:13', '1', '2014-09-13 09:33:15', NULL, '1'),
('dfe77b1b-451b-11e4-a31a-e7c939bf1427', '13182788918', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:58', '1', '2014-09-26 09:25:04', NULL, '1'),
('dfea1b48-451b-11e4-a31a-e7c939bf1427', '13914176818', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:58', '1', '2014-09-26 09:25:04', NULL, '1'),
('dfecd959-451b-11e4-a31a-e7c939bf1427', '13771251510', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:58', '1', '2014-09-26 09:25:04', NULL, '1'),
('dff07fc4-451b-11e4-a31a-e7c939bf1427', '13952481896', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:58', '1', '2014-09-26 09:25:04', NULL, '1'),
('dff253c1-451b-11e4-a31a-e7c939bf1427', '13812109066', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:58', '1', '2014-09-26 09:25:04', NULL, '1'),
('dff5102c-451b-11e4-a31a-e7c939bf1427', '13812170708', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('dff98245-451b-11e4-a31a-e7c939bf1427', '13915253902', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('dffc5ea6-451b-11e4-a31a-e7c939bf1427', '13771615680', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('dffe3344-451b-11e4-a31a-e7c939bf1427', '13915228684', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('e000eef8-451b-11e4-a31a-e7c939bf1427', '13771615680', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('e002c38f-451b-11e4-a31a-e7c939bf1427', '13218766662', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('e0058022-451b-11e4-a31a-e7c939bf1427', '13306191071', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('e00908ba-451b-11e4-a31a-e7c939bf1427', '13151953088', '纳税人您好！本次信息为核对你们企业所预留的手机联系号码，如有和所发送企业联系号码不相符的，可来电86621039更正！国税申港代办点', '2014-09-26 09:24:59', '1', '2014-09-26 09:25:04', NULL, '1'),
('e4d7c045-42c3-11e4-a31a-e7c939bf1427', '18921260039', '424你好,你单位本月申报的税金100.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询13166155025。江阴临港协税护税', '2014-09-23 09:50:02', '1', '2014-09-23 09:50:12', NULL, '1'),
('f0f26864-42cc-11e4-a31a-e7c939bf1427', '13901522951', '许荣忠你好,你单位本月申报的税金200.000元,因你单位扣税帐上余额不足,导致无法扣款,请速到帐上加钱.如有疑问请电询86621039。江阴临港协税护税', '2014-09-23 10:54:48', '1', '2014-09-23 10:54:53', NULL, '1'),
('f6ce3d02-42c5-11e4-a31a-e7c939bf1427', '13861635900', '请于两日内来做定额调整！', '2014-09-23 10:04:51', '1', '2014-09-23 10:04:53', NULL, '1'),
('f6d20a1d-42c5-11e4-a31a-e7c939bf1427', '13961602119', '请于两日内来做定额调整！', '2014-09-23 10:04:51', '1', '2014-09-23 10:04:53', NULL, '1');

-- --------------------------------------------------------

--
-- 表的结构 `tp_product`
--

CREATE TABLE IF NOT EXISTS `tp_product` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_product_cart`
--

CREATE TABLE IF NOT EXISTS `tp_product_cart` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_product_cart_list`
--

CREATE TABLE IF NOT EXISTS `tp_product_cart_list` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_product_cat`
--

CREATE TABLE IF NOT EXISTS `tp_product_cat` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_product_diningtable`
--

CREATE TABLE IF NOT EXISTS `tp_product_diningtable` (
  `id` mediumint(4) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `intro` varchar(500) NOT NULL DEFAULT '',
  `taxis` mediumint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_reply_info`
--

CREATE TABLE IF NOT EXISTS `tp_reply_info` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_requestdata`
--

CREATE TABLE IF NOT EXISTS `tp_requestdata` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- 转存表中的数据 `tp_requestdata`
--

INSERT INTO `tp_requestdata` (`id`, `token`, `year`, `month`, `day`, `time`, `textnum`, `imgnum`, `videonum`, `other`, `follownum`, `unfollownum`, `3g`) VALUES
(1, 'ivhtrp1396858196', 2014, 5, 10, 1399697384, 9, 0, 0, 0, 26, 5, 0),
(2, 'eeiyik1395720221', 2014, 5, 10, 1399708484, 2, 0, 0, 0, 1, 1, 0),
(3, 'fsxdvk1398647898', 2014, 5, 10, 1399717117, 1, 0, 0, 0, 0, 0, 0),
(4, 'rmzthc1399729257', 2014, 5, 10, 1399731129, 0, 0, 0, 0, 2, 1, 0),
(5, 'ivhtrp1396858196', 2014, 5, 11, 1399738034, 10, 0, 0, 0, 24, 2, 0),
(6, 'ivzukg1397897301', 2014, 5, 11, 1399767288, 1, 0, 0, 0, 2, 1, 0),
(7, 'howlfu1396082964', 2014, 5, 11, 1399773715, 1, 0, 0, 0, 0, 0, 0),
(8, 'eeiyik1395720221', 2014, 5, 11, 1399775103, 0, 0, 0, 0, 2, 0, 0),
(9, 'eeiyik1395720221', 2014, 5, 12, 1399832722, 4, 0, 0, 0, 4, 1, 0),
(10, 'ivhtrp1396858196', 2014, 5, 12, 1399838551, 10, 0, 0, 0, 18, 3, 0),
(11, 'fsxdvk1398647898', 2014, 5, 12, 1399859568, 1, 0, 0, 0, 0, 0, 0),
(12, 'tejdsg1399856577', 2014, 5, 12, 1399891645, 0, 0, 0, 0, 0, 1, 0),
(13, 'ivhtrp1396858196', 2014, 5, 13, 1399910972, 14, 0, 0, 0, 20, 8, 0),
(14, 'eeiyik1395720221', 2014, 5, 13, 1399940975, 2, 0, 0, 0, 2, 0, 0),
(15, 'rmzthc1399729257', 2014, 5, 13, 1399944659, 0, 0, 0, 0, 1, 0, 0),
(16, 'ivzukg1397897301', 2014, 5, 13, 1399966983, 1, 0, 0, 0, 0, 1, 0),
(17, 'fsxdvk1398647898', 2014, 5, 13, 1399974960, 1, 0, 0, 0, 0, 0, 0),
(18, 'ivhtrp1396858196', 2014, 5, 14, 1400020413, 14, 0, 0, 0, 15, 5, 0),
(19, 'tejdsg1399856577', 2014, 5, 14, 1400040632, 0, 0, 0, 0, 1, 0, 0),
(20, 'eeiyik1395720221', 2014, 5, 14, 1400044425, 3, 0, 0, 0, 4, 1, 0),
(21, 'ivhtrp1396858196', 2014, 5, 15, 1400084050, 9, 0, 0, 0, 17, 6, 0),
(22, 'eeiyik1395720221', 2014, 5, 15, 1400085742, 7, 0, 0, 0, 6, 5, 0),
(23, 'ivzukg1397897301', 2014, 5, 15, 1400129486, 3, 0, 0, 0, 1, 0, 0),
(24, 'howlfu1396082964', 2014, 5, 15, 1400136986, 1, 0, 0, 0, 0, 0, 0),
(25, 'kwgucc1400132373', 2014, 5, 15, 1400137027, 0, 0, 0, 0, 24, 17, 0),
(26, 'eylytk1400162961', 2014, 5, 15, 1400164130, 0, 0, 0, 0, 1, 1, 0),
(27, 'eeiyik1395720221', 2014, 5, 16, 1400170187, 0, 0, 0, 0, 1, 0, 0),
(28, 'ivhtrp1396858196', 2014, 5, 16, 1400174951, 1, 0, 0, 0, 2, 1, 0),
(29, 'ivzukg1397897301', 2014, 5, 16, 1400179419, 1, 0, 0, 0, 1, 1, 0),
(30, 'eylytk1400162961', 2014, 5, 16, 1400200867, 0, 0, 0, 0, 1, 0, 0),
(31, 'kaybwr1401157066', 2014, 5, 29, 1401364640, 0, 0, 0, 0, 1, 0, 0),
(32, 'pjeupf1402729544', 2014, 6, 14, 1402733768, 0, 45, 0, 22, 9, 8, 0),
(33, 'pjeupf1402729544', 2014, 6, 15, 1402796194, 0, 51, 0, 2, 4, 2, 0),
(34, 'pjeupf1402729544', 2014, 6, 16, 1402871564, 0, 116, 0, 15, 3, 1, 0),
(35, 'pjeupf1402729544', 2014, 6, 17, 1402961545, 0, 109, 0, 17, 2, 1, 0),
(36, 'pjeupf1402729544', 2014, 6, 18, 1403042219, 0, 51, 0, 1, 4, 2, 0),
(37, 'pjeupf1402729544', 2014, 6, 19, 1403136416, 0, 77, 0, 19, 1, 0, 0),
(38, 'pjeupf1402729544', 2014, 6, 20, 1403219945, 0, 4, 0, 2, 0, 0, 0),
(39, 'pjeupf1402729544', 2014, 6, 21, 1403315087, 0, 20, 0, 7, 0, 0, 0),
(40, 'pjeupf1402729544', 2014, 6, 22, 1403401868, 0, 35, 0, 1, 0, 0, 0),
(41, 'pjeupf1402729544', 2014, 6, 23, 1403481338, 0, 86, 0, 6, 2, 2, 0),
(42, 'pjeupf1402729544', 2014, 6, 24, 1403569570, 0, 20, 0, 2, 0, 0, 0),
(43, 'pjeupf1402729544', 2014, 6, 25, 1403652632, 0, 13, 0, 0, 0, 0, 0),
(44, 'pjeupf1402729544', 2014, 6, 26, 1403738819, 0, 43, 0, 4, 1, 0, 0),
(45, 'pjeupf1402729544', 2014, 6, 27, 1403828108, 0, 93, 0, 6, 15, 13, 0),
(46, 'pjeupf1402729544', 2014, 6, 28, 1403919006, 0, 18, 0, 0, 3, 3, 0),
(47, 'pjeupf1402729544', 2014, 6, 29, 1404027545, 0, 2, 0, 0, 0, 0, 0),
(48, 'pjeupf1402729544', 2014, 6, 30, 1404089507, 0, 40, 0, 0, 4, 2, 0),
(49, 'pjeupf1402729544', 2014, 7, 1, 1404194194, 0, 10, 0, 0, 3, 0, 0),
(50, 'pjeupf1402729544', 2014, 7, 2, 1404279005, 0, 17, 0, 0, 1, 0, 0),
(51, 'pjeupf1402729544', 2014, 7, 4, 1404436584, 0, 2, 0, 0, 0, 0, 0),
(52, 'pjeupf1402729544', 2014, 8, 18, 1408352057, 0, 1, 0, 0, 1, 1, 0),
(53, 'pjeupf1402729544', 2014, 9, 9, 1410253280, 0, 1, 0, 0, 0, 0, 0),
(54, 'pjeupf1402729544', 2014, 9, 11, 1410390658, 0, 0, 0, 0, 1, 0, 0),
(55, 'pjeupf1402729544', 2014, 9, 18, 1411006481, 0, 2, 0, 0, 1, 1, 0),
(56, 'pjeupf1402729544', 2014, 9, 20, 1411183232, 0, 0, 0, 0, 1, 0, 0),
(57, 'pjeupf1402729544', 2014, 9, 23, 1411435624, 0, 0, 0, 0, 14, 0, 0),
(58, 'pjeupf1402729544', 2014, 9, 25, 1411603770, 0, 0, 0, 0, 1, 0, 0),
(59, 'pjeupf1402729544', 2014, 9, 26, 1411718292, 0, 0, 0, 0, 2, 0, 0),
(60, 'pjeupf1402729544', 2014, 9, 28, 1411863482, 0, 0, 0, 0, 1, 0, 0),
(61, 'pjeupf1402729544', 2014, 9, 29, 1411950503, 0, 0, 0, 0, 1, 0, 0),
(62, 'pjeupf1402729544', 2014, 9, 30, 1412038499, 0, 0, 0, 0, 1, 0, 0),
(63, 'pjeupf1402729544', 2014, 10, 8, 1412746060, 0, 0, 0, 0, 1, 0, 0),
(64, 'pjeupf1402729544', 2014, 10, 17, 1413532561, 0, 0, 0, 0, 1, 0, 0),
(65, 'pjeupf1402729544', 2014, 10, 20, 1413769842, 0, 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_role`
--

CREATE TABLE IF NOT EXISTS `tp_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '后台组名',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '是否激活 1：是 0：否',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序权重',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `tp_role`
--

INSERT INTO `tp_role` (`id`, `name`, `pid`, `status`, `sort`, `remark`) VALUES
(5, '超级管理员', 0, 1, 0, ''),
(19, '征税点', 0, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_role_user`
--

CREATE TABLE IF NOT EXISTS `tp_role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` smallint(6) unsigned NOT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_role_user`
--

INSERT INTO `tp_role_user` (`user_id`, `role_id`) VALUES
(2, 9),
(12, 12),
(13, 12),
(14, 13);

-- --------------------------------------------------------

--
-- 表的结构 `tp_score_item`
--

CREATE TABLE IF NOT EXISTS `tp_score_item` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_score_item_cate`
--

CREATE TABLE IF NOT EXISTS `tp_score_item_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_score_log`
--

CREATE TABLE IF NOT EXISTS `tp_score_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_score_order`
--

CREATE TABLE IF NOT EXISTS `tp_score_order` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_selfform`
--

CREATE TABLE IF NOT EXISTS `tp_selfform` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_selfform_input`
--

CREATE TABLE IF NOT EXISTS `tp_selfform_input` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_selfform_value`
--

CREATE TABLE IF NOT EXISTS `tp_selfform_value` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `formid` int(10) NOT NULL DEFAULT '0',
  `wecha_id` varchar(50) NOT NULL DEFAULT '',
  `values` varchar(2000) NOT NULL DEFAULT '',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `formid` (`formid`,`wecha_id`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_service`
--

CREATE TABLE IF NOT EXISTS `tp_service` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `cate_id` smallint(4) NOT NULL,
  `business_id` smallint(4) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `zb_price` decimal(10,2) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `add_time` int(10) NOT NULL,
  `tuijian` tinyint(1) NOT NULL DEFAULT '0',
  `info` text,
  `img` varchar(255) NOT NULL,
  `tokenTall` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tp_service`
--

INSERT INTO `tp_service` (`id`, `name`, `cate_id`, `business_id`, `price`, `zb_price`, `status`, `add_time`, `tuijian`, `info`, `img`, `tokenTall`) VALUES
(2, '母婴服务', 15, 1, '20.00', '25.00', '0', 1415758885, 1, '这是一项服务', '/Uploads/image/20140512/53704435351f7.png', 'pjeupf1402729544'),
(4, '绿色通道', 5, 1, '50.00', '102.00', '1', 1415933142, 1, '<img src="/Uploads/image/20141117/546957151801f.png" alt="" />sdfsadfsadfefsdfaaaaaaaaaaaaaadf', '/Uploads/image/20141114/54656cc65bd5d.png', 'pjeupf1402729544');

-- --------------------------------------------------------

--
-- 表的结构 `tp_setting`
--

CREATE TABLE IF NOT EXISTS `tp_setting` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_setting`
--

INSERT INTO `tp_setting` (`name`, `data`, `remark`) VALUES
('site_name', '微商城', ''),
('site_title', '微商城', ''),
('site_keyword', '微商城', ''),
('site_description', '微商城', ''),
('site_status', '1', ''),
('closed_reason', '网站升级中。。', ''),
('site_icp', '', ''),
('statistics_code', '', ''),
('statics_url', '', ''),
('mail_server', '', ''),
('item_check', '0', ''),
('score_rule', 'a:16:{s:8:"register";s:2:"20";s:13:"register_nums";s:1:"1";s:5:"login";s:2:"10";s:10:"login_nums";s:1:"5";s:7:"pubitem";s:2:"20";s:12:"pubitem_nums";s:2:"10";s:8:"likeitem";s:1:"1";s:13:"likeitem_nums";s:2:"20";s:9:"joinalbum";s:1:"2";s:14:"joinalbum_nums";s:2:"10";s:6:"fwitem";s:1:"2";s:11:"fwitem_nums";s:2:"10";s:6:"pubcmt";s:1:"1";s:11:"pubcmt_nums";s:1:"5";s:7:"delitem";s:3:"-20";s:12:"delitem_nums";s:3:"100";}', ''),
('album_cover_items', '5', '专辑封面显示图片数量'),
('integrate_code', 'default', ''),
('integrate_config', '', ''),
('hot_tags', '家居,花园,美食,旅行,创意,建筑,户外,飘窗,卧室,城堡,DIY,萌宠,门厅,衣帽间,婚礼,书房,厨房,客厅,浴室,阳台,工作台,收纳,餐厅,阁楼,儿童房,小空间,性感', ''),
('wall_spage_max', '5', ''),
('wall_spage_size', '50', ''),
('book_page_max', '100', ''),
('default_keyword', '懒得逛了，我搜~', ''),
('album_default_title', '默认专辑', ''),
('avatar_size', '24,32,48,64,100,200', ''),
('attr_allow_exts', 'jpg,gif,png,jpeg,swf', ''),
('attr_allow_size', '2048', ''),
('itemcate_img', 'a:2:{s:5:"width";s:3:"150";s:6:"height";s:3:"170";}', ''),
('reg_protocol', '一、总则\r\n1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"立即注册"按钮即表示用户与拼品网公司达成协议，完全接受本协议项下的全部条款。\r\n1．2　用户注册成功后，拼品网将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。\r\n1．3　用户可以使用拼品网各个频道单项服务，当用户使用拼品网各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及拼品网在该单项服务中发出的各类公告的同意。\r\n1．4　拼品网会员服务协议以及各个频道单项服务条款和公告可由拼品网公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。\r\n您在使用拼品网提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消拼品网提供的服务；您一旦使用拼品网产品，即视为您已了解并完全同意本服务协议各项内容，包括拼品网对服务协议随时所做的任何修改，并成为拼品网用户。\r\n二、注册信息和隐私保护\r\n2．1　 拼品网帐号（即拼品网用户ID）的所有权归拼品网，用户完成注册申请手续后，获得拼品网帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，拼品网概不负任何责任。\r\n2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知拼品网。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，拼品网不承担任何责任。\r\n2．3　拼品网不对外公开或向第三方提供单个用户的注册资料，除非：\r\n（1）事先获得用户的明确授权；\r\n（2）只有透露你的个人资料，才能提供你所要求的产品和服务；\r\n（3）根据有关的法律法规要求；\r\n（4）按照相关政府主管部门的要求；\r\n（5）为维护拼品网的合法权益。\r\n2．4　在你注册拼品网帐户，使用其他拼品网产品或服务，访问拼品网网页, 或参加促销和有奖游戏时，拼品网会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。\r\n三、使用规则\r\n3．1　用户在使用拼品网服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶\r\n（1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：\r\n1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的；\r\n（2）不得为任何非法目的而使用网络服务系统；\r\n（3）不利用拼品网服务从事以下活动：\r\n1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；\r\n2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；\r\n3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；\r\n4) 故意制作、传播计算机病毒等破坏性程序的；\r\n5) 其他危害计算机信息网络安全的行为。\r\n3．2　 用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿拼品网与合作公司、关联公司，并使之免受损害。对此，拼品网有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收拼品网帐号、追 究法律责任等措施。对恶意注册拼品网帐号或利用拼品网帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，拼品网有权回收其帐号。同 时，拼品网公司会视司法部门的要求，协助调查。\r\n3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。\r\n3．4　用户须对自己在使用拼品网服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在拼品网公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予拼品网公司等额的赔偿。\r\n四、服务内容\r\n4．1　拼品网网络服务的具体内容由拼品网根据实际情况提供。\r\n4．2　除非本服务协议另有其它明示规定，拼品网所推出的新产品、新功能、新服务，均受到本服务协议之规范。\r\n4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。\r\n4．4　鉴于网络服务的特殊性，用户同意拼品网有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。拼品网不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。\r\n4．5　拼品网需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，拼品网无需为此承担任何责任。拼品网保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。\r\n4．6　 本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于拼品网无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，拼品网不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，拼品网亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资 源获得的任何内容、商品或服务所产生的任何损害或损失，拼品网不承担任何责任。\r\n4．7　用户明确同意其使用拼品网网络服务所存在的风险将完全由其 自己承担。用户	理解并接受下载或通过拼品网服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。拼品网对在服务网上得 到的任何商品购物服	务、交易进程、招聘信息，都不作担保。\r\n4．8　3个月未登录的帐号，拼品网保留关闭的权利。\r\n4．9　拼品网有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，拼品网对用户和任何第三人均无需承担任何责任。\r\n4．10　终止服务\r\n您同意拼品网得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或拼品网认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使 用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并 同意，拼品网可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您 的帐号及相关信息和文件被关闭或删除，拼品网对您或任何第三人均不承担任何责任。\r\n五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）\r\n5．1　用户专属权利\r\n拼品网尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向拼品网提供资料∶\r\n请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，拼品网建议该个人或单位首先咨询专业人士。\r\n为了拼品网有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）：\r\n1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；\r\n2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。\r\n3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。\r\n4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。\r\n5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。\r\n5．1　 对于用户通过拼品网服务上传到拼品网网站上可公开获取区域的任何内容，用户同意拼品网在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知 的或以后开发的其他任何形式的作品、媒体或技术中。\r\n5．2　拼品网拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：所有的资料和图象均以获得信息为目的；\r\n所有的资料和图象均不得用于商业目的；\r\n所有的资料、图象及其任何部分都必须包括此版权声明；\r\n本网站（www.pinphp.com）所有的产品、技术与所有程序均属于拼品网知识产权，在此并未授权。\r\n“www.pinphp.com”, “拼品网”及相关图形等为拼品网的注册商标。\r\n未经拼品网许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，拼品网将依法追究法律责任。\r\n六、青少年用户特别提示\r\n青少年用户必须遵守全国青少年网络文明公约：\r\n要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。\r\n七、其他\r\n7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。\r\n7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向拼品网所在地的人民法院提起诉讼。\r\n7．3　拼品网未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。\r\n7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。\r\n拼品网对本使用协议享有最终解释权。', ''),
('item_cover_comments', '2', ''),
('user_intro_default', '这个家伙太懒，什么都木留下~', ''),
('ipban_switch', '1', ''),
('score_item_img', 'a:4:{s:6:"swidth";s:3:"210";s:7:"sheight";s:3:"210";s:6:"bwidth";s:3:"350";s:7:"bheight";s:3:"350";}', ''),
('seo_config', 'a:6:{s:4:"book";a:3:{s:5:"title";s:23:"{tag_name}-{site_title}";s:8:"keywords";s:23:"逛宝贝，{site_name}";s:11:"description";s:18:"{site_description}";}s:4:"cate";a:3:{s:5:"title";s:23:"{cate_name}-{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:5:"album";a:3:{s:5:"title";s:6:"专辑";s:8:"keywords";s:47:"{site_name},购物分享,淘宝网购物,专辑";s:11:"description";s:18:"{site_description}";}s:10:"album_cate";a:3:{s:5:"title";s:11:"{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:12:"album_detail";a:3:{s:5:"title";s:13:"{album_title}";s:8:"keywords";s:13:"{album_intro}";s:11:"description";s:23:"杂志详细Description";}s:4:"item";a:3:{s:5:"title";s:12:"{item_title}";s:8:"keywords";s:10:"{item_tag}";s:11:"description";s:12:"{item_intro}";}}', ''),
('item_img', 'a:2:{s:5:"width";s:3:"210";s:6:"height";s:4:"1000";}', ''),
('item_simg', 'a:2:{s:5:"width";s:3:"100";s:6:"height";s:3:"100";}', ''),
('item_bimg', 'a:2:{s:5:"width";s:3:"468";s:6:"height";s:4:"1000";}', ''),
('attach_path', 'data/upload/', ''),
('wall_distance', '500', ''),
('reg_status', '1', ''),
('reg_closed_reason', '<h1>暂时关闭注册</h1>', ''),
('index_wall', '1', ''),
('tp_img', '1308/06/5200a7cba87b0.jpg', ''),
('weixinshop_img', '1308/06/5200a7cba936c.jpg', ''),
('appid', '', ''),
('appsecret', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_set_tax`
--

CREATE TABLE IF NOT EXISTS `tp_set_tax` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `shoptax` float DEFAULT '0',
  `coupontax` float DEFAULT '0',
  `giftpointtax` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_set_tax`
--

INSERT INTO `tp_set_tax` (`id`, `shoptax`, `coupontax`, `giftpointtax`) VALUES
(1, 0.05, 0.34, 0.56);

-- --------------------------------------------------------

--
-- 表的结构 `tp_shop_favi`
--

CREATE TABLE IF NOT EXISTS `tp_shop_favi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `tokenTall` varchar(30) DEFAULT NULL COMMENT '店铺token',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`tokenTall`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_site_plugmenu`
--

CREATE TABLE IF NOT EXISTS `tp_site_plugmenu` (
  `token` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `taxis` mediumint(4) NOT NULL DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(200) DEFAULT NULL,
  KEY `token` (`token`,`taxis`,`display`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_snccode`
--

CREATE TABLE IF NOT EXISTS `tp_snccode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `wechaname` varchar(60) NOT NULL,
  `caeatetime` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `token` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_system_info`
--

CREATE TABLE IF NOT EXISTS `tp_system_info` (
  `lastsqlupdate` int(10) NOT NULL,
  `version` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_tag`
--

CREATE TABLE IF NOT EXISTS `tp_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_taobao`
--

CREATE TABLE IF NOT EXISTS `tp_taobao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `title` varchar(100) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  `homeurl` varchar(100) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_text`
--

CREATE TABLE IF NOT EXISTS `tp_text` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_text`
--

INSERT INTO `tp_text` (`id`, `uid`, `uname`, `keyword`, `type`, `text`, `createtime`, `updatetime`, `click`, `token`) VALUES
(1, 6, '', '机构设置', '2', '江苏江阴临港经济开发区党工委、管委会共10个内设机构，均为正科级建制。\n（一）党政办公室\n    负责党工委、管委会的日常事务，检查、督办和协调党工委、管委会布置的工作；负责起草党工委、管委会的工作计划及有关文稿；负责政策研究、文书档案、机要保密、信息调研、接待、对外联络等工作；负责管委会机关的行政事务、资产管理及后勤服务工作；负责辖区内涉外事务的协调处理。\n    下设：秘书科、督查科、信息调研科、后勤服务科和综合科5个科室。\n    电话：0510-86868123\n    传真：0510-86868000\n（二）党群工作部\n    围绕党工委的中心工作，协助党工委领导抓好基层党组织建设、思想建设和党员教育工作；负责宣传落实党的统战政策，搞好统战工作；负责党工委、管委会的对外宣传工作；按干部管理权限负责干部的考察、培养、任用工作，配备好各级领导班子；负责指导和督促临港经济开发区机关各党支部和基层党组织的建章立制和“三会一课”活动；负责辖区内社会主义精神文明建设，了解和掌握基层职工群众的思想动态，开展行之有效的思想政治工作；负责做好工、青、妇等群团工作。负责办理机关及下属单位的机构编制、人事调动、劳动工资、社会保障和年度考核等事宜；负责做好机关及下属单位的离退休干部管理工作；负责拟订和统筹辖区人才发展规划，制订和执行辖区人才政策；负责做好专业技术职务的评审和工人技术等级考核的组织工作；负责辖区内出国（境）人员的政审、报批工作；负责各类人事劳动等业务的统计工作；负责人武工作。\n    下设：组织科、人事科、宣传科、统战人武科和人才服务科5个科室。\n    电话：0510-86868602\n    传真：0510-86868111\n（三）财政局（挂“国有资产监督管理办公室”、“财政国库集中收付中心”牌子）\n    负责辖区内财政收支预（决）算管理工作；各类税费的征收、监管和税收政策的落实工作；建设资金的融通、调度、筹集和资金平衡工作；按财政体制的有关规定做好与上下级财政部门的解缴和结算工作；负责机关人员工资发放工作；负责做好辖区内的会计管理工作；代表临港经济开发区管委会履行出资人的职责，负责做好对辖区国有资产的有关监督管理。\n    下设：行财综合科、预算管理科、征收管理科、经济建设科、资产管理科和财政结算中心6个科室。\n    电话：0510-86868605\n    传真：0510-86868333\n（四）经济发展局（挂“安全生产监督管理局”牌子）\n    负责编制辖区内国民经济和社会事业发展计划；负责辖区内的各类统计工作；根据管委会总体发展目标，提出一、二、三产业年度发展计划并组织实施；负责做好技术监督、物价及“三电”等工作；负责一、二、三产业的政策指导和经营管理；负责科技创新项目的申报等工作；负责做好辖区内的安全生产监督和管理工作，负责做好辖区内的环境保护和环境友好工作。\n    下设：经济运行科、优化发展科、安全监督科、环保节能科和计划管理科5个科室。\n    电话：0510-86868606\n    传真：0510-86868555\n（五）社会事业局\n    负责做好辖区内劳动社保、征地保障、职业介绍、职业培训和劳动争议调解工作；负责辖区内文教卫体、人口与计划生育、司法、法律服务、社会综合管理、政法、信访及社会稳定等工作；负责辖区内民政事业、残疾人康复就业等工作。\n    下设：劳动社保科、文化教育科、卫生计生科、信访综治科和民政科5个科室。\n    电话：0510-86868617\n    传真：0510-86868999\n（六）招商局\n     负责制订临港产业招商引资计划、外资指标任务分配方案和考核办法；负责组织开展临港产业招商活动；负责建立招商网络，捕捉项目信息，建立项目库；负责对项目信息调研、跟踪、洽谈、落实；负责做好进驻企业固定资产投资项目涉及发改、商务的审批手续；负责做好项目办理过程中的协调和服务工作。\n    下设：投资服务科、项目服务科、招商一科、招商二科、招商三科和招商四科6个科室。\n    电话：0510-86868618\n    传真：0510-86868800\n（七）规划建设局\n    负责做好辖区内总体规划的执行及组织各专项规划的编制工作；负责做好新建、改建、扩建项目的规划选址、定点、项目建设规划设计方案、基础设施建设规划设计方案的有关工作；负责做好建设用地规划许可证和建设工程规划许可证的有关工作。负责做好辖区内建设工程的招投标管理、建筑市场及各类建设工程的施工管理工作；负责做好辖区内房屋拆迁政策和安置工作；负责做好各项公用事业的管理、环境卫生、创建、综合治理工作；负责做好绿化、道路、桥梁、管线、路灯、供水、排污等工程的组织实施及管理工作。\n    下设：公用事业科、规划管理科、建设服务科、工程管理科、动迁安置科和安置房建设科6个科室。\n    电话：0510-86868608\n    传真：0510-86868666\n（八）港口发展局\n    以港口为核心通过评估港口未来发展需求制订港口发展策略；协助做好辖区内港口总体规划和控制性详规的编制及申报工作；组织和协调港口内外贸货物运输，研究分析辖区内市场货物流向和发展态势；建设和完善港航平台，推进口岸区域通关，研究、制订各类有利于发展港口的优惠政策和措施并组织实施，积极争取政策支持以促进航线航班的开辟及市场拓展；引进国际国内港口物流相关企业入驻辖区，研究新型物流交易模式及供应链理念，促进港口向具有商务、信息、分拨功能的新型港口转型发展。\n    下设：港航促进科、物流招商科、规划建设科和投资服务科4个科室。\n    电话：0510-86868901\n    传真：0510-86868900\n（九）农村工作局\n    负责辖区“三农”相关工作。贯彻执行党在农村的路线方针政策和国家相关法律法规，拟定实施行政村经济社会发展规划和具体政策措施；加强农业、农村和农民服务功能，完善农业社会化服务体系和农村合作组织，改善农业发展环境，推进农业产业结构调整，发展村级集体经济；负责指导监督村级集体资产管理工作，参与村级财务、审计、统计工作。\n    下设：农村发展科、水利农业科和集体资产管理科3个科室。\n    电话：0510-86868067\n    传真：0510-86868065\n（十）便民服务中心（挂“企业服务中心”牌子）\n    负责辖区便民服务、企业服务相关工作。负责做好政府授权或相关职能部门委托的行政许可事项；监管、督促行政职能部门所有行政许可和非行政许可项目进驻一站式服务大厅；扎口管理有关非行政许可项目和便民服务事项；配合相关部门清理、规范行政许可和非行政许可事项；制订各项行政服务制度和管理办法，并对进驻窗口及其工作人员实行日常管理和考核；牵头组织、协调有关重大审批“绿色通道”项目的联审联办；组织有关部门对需要由两个及两个以上部门办理的行政审批事项进行会商并集中办理；会同相关部门拟定行政服务体制发展规划并对涉及行政许可的职能部门实施管理；做好12345便民服务工作。\n    下设：业务科、考核科和综合科3个科室。\n    电话：0510-86868090\n    传真：0510-86868098\n    另按有关规定设置纪工委（挂“监察审计局”牌子），主要职责：\n    加强对党的路线、方针、政策、决议和国家法律法规及党工委、管委会发展战略、重大决策部署贯彻执行情况的检查。协助党工委、管委会加强党风廉政建设和组织协调反腐败工作，切实加强党风廉政教育，健全权力运行制约监督机制；负责相关信访办理和案件查处工作；加强效能监察，营造良好发展环境。负责党工委、管委会及所属各单位（部门）财政预算执行、其它财政收支情况和预算外资金的管理、使用情况的审计；负责所属国有（集体）企业、国有（集体）控股企业和国有（集体）资产占主导地位企业的资产、负债和损益审计；负责有关领导干部任期经济责任审计。负责村级集体资产的审计监督。负责本级财政性资金、政府专项资金（基金）、政府统一借贷资金等投资建设项目的标底（预算）、施工现场跟踪和竣工结算实施审计监督；负责党工委、管委会组织或委托实施拆迁涉及补偿资金的审计监督；负责辖区基本建设项目审计质量的监督和管理。\n    下设：纪检科、监察科、财经审计科和基本建设审计科（挂“政府投资项目审计中心”牌子）4个科室。\n    电话：0510-86868603\n    传真：0510-86868222\n    按照有关法律、法规和政策规定设置群团组织机构。\n \n临港经济开发区下属事业单位\n1．江阴临港经济开发区国际商务中心（挂“江苏江阴软件园管委会”牌子）\n    主要参与制订临港经济开发区核心区、中央商务区招商引资、项目建设和区域管理的有关政策；负责临港经济开发区核心区、中央商务区的招商引资工作；负责临港经济开发区核心区、中央商务区重大经贸活动组织和区内重点项目的推介、跟踪、服务工作；负责做好二次招商项目的接待、洽谈，做好入驻企业的注册、入驻协调工作，并定期做好入驻企业销售、税收等各项统计工作；负责做好临港经济开发区核心区、中央商务区前期规划、国土资料以及各地块挂牌的各项事宜；协助做好入驻项目在规划、国土、建设等方面各项手续的报批、报建工作；协助做好区域内安全生产工作，做好管辖区域事故统计、上报工作，并配合市级安全生产事故调查组参与事故调查；负责抓好临港经济开发区核心区、中央商务区内公共物业管理，督促做好环境卫生、户外广告等工作；负责贯彻实施国家、省、市发展软件产业的法律、法规和有关规定，落实发展软件产业的各项优惠政策，在园区创造发展软件产业的良好环境；承办临港经济开发区党工委、管委会交办的其他事项。\n    下设：招商一科、招商二科、项目服务科３个科室。\n    电话：0510-86868639\n    传真：0510-86868865\n2．江阴长江港口综合物流园区管委会\n    主要负责组织制订并实施园区发展规划和开发建设计划；负责园区内的招商引资工作；负责园区财政收支预决算及组织管理工作；负责管理和经营园区国有资产，确保其保值增值；负责管委会的财务管理和投融资工作；负责入园项目的把关，项目投资合同的签订，园区内项目合同履约及建设的管理；依法保障园区企业自主经营，为园内企业提供服务，创造良好的招商引资发展环境；负责做好园区内企业的统计及经济运行分析等工作；承办江阴临港经济开发区党工委、管委会交办的其他事项。\n    下设：综合管理科、招商发展科、园区服务科３个科室\n    电话：0510-86023001\n    传真：0510-86023000\n3．江阴市保税物流中心\n    主要负责本中心内的招商引资、招商揽货工作；负责综合保税区申报工作；负责做好中心内招商引资、入驻企业的开票销售、税金、监管货值、报关单量、统计等服务和管理工作；负责与海关、国检、各业务单位沟通协调；负责做好仓储管理，包括出租、仓内货物管理以及安全操作管理等工作；承办江阴临港经济开发区党工委、管委会交办的其他事项。\n    下设：综合服务科、招商发展科、市场运管科３个科室\n    电话：0510-81651601\n    传真：0510-81651611\n4．江阴临港经济开发区政府投资项目审计中心和江阴临港经济开发区财政国库集中收付中心\n    临港新城国家建设项目审计中心更名为江阴临港经济开发区政府投资项目审计中心，临港新城财政国库集中收付中心更名为江阴临港经济开发区财政国库集中收付中心。更名后，政府投资项目审计中心和财政国库集中收付中心2家事业单位不实际运转，其职责分别整合到纪工委（挂“监察审计局”牌子）、财政局，其机构、事业编制保留，原在编人员由临港经济开发区管委会统一调配使用。', '1402741917', '1402741917', 0, 'pjeupf1402729544');

-- --------------------------------------------------------

--
-- 表的结构 `tp_token_open`
--

CREATE TABLE IF NOT EXISTS `tp_token_open` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(60) NOT NULL,
  `queryname` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `tp_token_open`
--

INSERT INTO `tp_token_open` (`id`, `uid`, `token`, `queryname`) VALUES
(8, 6, 'pjeupf1402729544', 'Areply,Text,Img,Voiceresponse,Diymen,Home,MyClassify,Classify,Flash,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,Diaoyan,MyClassify,MyClassify,Zhengwu,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,Myinfo,MyClassify,Myinfo,MyClassify,Photo,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,Index,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,Areply,Text,Img,Voiceresponse,Diymen,Home,MyClassify,Classify,Flash,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,Diaoyan,MyClassify,MyClassify,Zhengwu,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,Myinfo,MyClassify,Myinfo,MyClassify,Photo,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,Index,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,MyClassify,测试一,测试二,测试二,测试三');

-- --------------------------------------------------------

--
-- 表的结构 `tp_topic`
--

CREATE TABLE IF NOT EXISTS `tp_topic` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_topic_at`
--

CREATE TABLE IF NOT EXISTS `tp_topic_at` (
  `uid` int(10) unsigned NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_topic_comment`
--

CREATE TABLE IF NOT EXISTS `tp_topic_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `author_uid` int(10) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_topic_index`
--

CREATE TABLE IF NOT EXISTS `tp_topic_index` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `author_id` int(10) unsigned NOT NULL COMMENT '发布者ID',
  `add_time` int(10) unsigned NOT NULL,
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_topic_relation`
--

CREATE TABLE IF NOT EXISTS `tp_topic_relation` (
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `src_tid` int(10) unsigned NOT NULL COMMENT '被引用信息ID',
  `author_uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '操作类型(1,转发)',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_tousu`
--

CREATE TABLE IF NOT EXISTS `tp_tousu` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `cwho` char(10) NOT NULL,
  `cdetail` varchar(1000) NOT NULL,
  `cphone` varchar(11) NOT NULL,
  `cname` char(10) NOT NULL,
  `addtime` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tp_tousu`
--

INSERT INTO `tp_tousu` (`id`, `cwho`, `cdetail`, `cphone`, `cname`, `addtime`) VALUES
(3, '撒地方', '撒地方', '13558541552', '阿斯蒂芬', '1402480624'),
(4, 'AA啊', '共商国是送给归属感', '13456788765', 'AA', '1402745113');

-- --------------------------------------------------------

--
-- 表的结构 `tp_upload_people`
--

CREATE TABLE IF NOT EXISTS `tp_upload_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shui_hao` varchar(200) NOT NULL,
  `management_num` varchar(200) NOT NULL,
  `shui_ming` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `management` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5211 ;

--
-- 转存表中的数据 `tp_upload_people`
--

INSERT INTO `tp_upload_people` (`id`, `shui_hao`, `management_num`, `shui_ming`, `name`, `phone`, `address`, `management`) VALUES
(255, '320219196806110771', '320200009202596', '江阴市利港华鑫大酒店', '曹卫华', '13301528777', '江阴市利港镇环西路', '于青荣'),
(256, '320219196303180778', '320200005113665', '江阴兴港大酒店', '朱志刚', '13606168290', '兴港路145号', '孟建林'),
(257, '320219195708090776', '320200009204661', '江阴市利港双辉大酒店', '徐立国', '13806167156', '江阴市利港西利路135号', '孟建林'),
(258, '320219197302180797', '320200100042159', '江阴市林江商务酒店', '王松涛', '13270158088', '江阴市临港新城利港兴港路208号', '于青荣'),
(259, '320219197805247279', '320200005174024', '江阴市天富宾馆', '缪红霞', '13812585866', '利康街5号', '孟建林'),
(261, '32021919690703727801', '320200100087637', '江阴市利港大酒店', '翁亚新', '13057399022', '江阴市临港新城利港利中街236号', '于青荣'),
(262, '320219196608100775', '320200100026850', '江阴市利港好灶头餐厅', '徐立国', '13806167156', '江阴市临港新城利港利南路214号', '于青荣'),
(263, '371323197210164933', '320200100060357', '江阴市利港水乡味江南饭店', '史立强', '13515199508', '江阴市临港新城利港利南街182号', '于青荣'),
(264, '320219196806110771', '320200009202596', '江阴市利港华鑫大酒店', '曹卫华', '13301528777', '江阴市利港镇环西路', '于青荣'),
(295, '320219197310231275', '320200100056397', '江阴市夏港兴英五金机械厂', '潘桂兴', '13601522797', '江阴市临港新城夏港夏南村枊家沙50号', '朱文霞'),
(296, '320219196312091275', '320200100069979', '江阴市夏港坤全五金配件加工厂', '徐坤全', '', '江阴市夏港街道镇澄路769号', '朱文霞'),
(297, '32021919730529129X', '320200009207782', '江阴市夏港新时代窗帘商行', '刘叶青', '86164150', '夏港镇镇澄路276号', '朱文霞'),
(298, '320281199301151270', '320200100060068', '江阴市祥顺五金机械配件加工厂', '周禹强', '13306162698', '江阴市夏港街道夏家村15号', '朱文霞'),
(299, '320219195003131267', '320200100056826', '江阴市夏港发顺建材商店', '周杏娣', '', '江阴市夏港街道新长江路306号', '朱文霞'),
(300, '340521198611233828', '320200100056480', '江阴市捷豹机械维修部', '尚霖铃', '', '江阴市夏港街道西城路8号', '朱文霞'),
(301, '320219196412057023', '320200100058585', '江阴文丰起重装卸队', '蒋网娣', '13812586733', '江阴市夏港街道西城路178号', '朱文霞'),
(302, '32072319751228264601', '320200100062698', '江阴市夏港红艳日用品商行', '毛广艳', '', '江阴市夏港街道五星路999号', '朱文霞'),
(303, '320219195010051273', '320200008202666', '江阴市夏港白石山预制场', '修阿网', '', '江阴市夏港镇夏南村白石山', '朱文霞'),
(304, '320219197911261277', '320200100037821', '江阴市夏港茂源起重装卸队', '石东雷', '13861668896', '江阴市夏港街道镇澄路869号', '朱文霞'),
(305, '320219196105051271', '', '江阴市夏港大运起重装卸队', '夏云华', '', '江阴市夏港街道中街192-2号', '朱文霞'),
(306, '132130197801131446', '320200100074123', '江阴真爱家具经营部', '张姗', '', '江阴市临港新城中央商务区浦江路101号', '朱文霞'),
(307, '32082619790318603101', '320200100080841', '江阴市夏港荣硕机械加工厂', '王建祥', '', '江阴市夏港街道三联村西方小庄27号', '朱文霞'),
(308, '32051119731022154X', '320200100046373', '江阴市西港电器商行', '陆小青', '', '江阴市临港新城中央商务区浦江路107号', '朱文霞'),
(309, '320219196911191315', '', '江阴市夏港小张建材经营部', '张海明', '', '江阴市夏港街道西方城路28-1号', '朱文霞'),
(310, '320219197304261339', '320200100019097', '江阴市夏港小蔡机械设备经营部', '蔡晨阳', '13701525903', '江阴市夏港街道新港花园152幢-2车库', '朱文霞'),
(311, '32021919860729126501', '320200100082677', '江阴市夏洁清洁用品商行', '周银凤', '', '江阴市夏港浦江路105号718', '朱文霞'),
(312, '320219510722127000', '320200005153818', '江阴市夏港亨通建材经营部', '李清芳', '6162527', '夏港李庄里村', '朱文霞'),
(313, '320219195610011275', '320200008006164', '江阴市夏港华鑫橡塑五金厂', '赵明玉', '86161381', '夏港镇李沟头村', '朱文霞'),
(314, '320219196501101268', '320200009212795', '江阴市夏港馨悦副食商行', '王玉娟', '6161103', '江阴市夏港镇镇澄路224号', '朱文霞'),
(315, '320219198103281274', '320200009214609', '江阴市季君包装箱厂', '季君', '', '江阴市夏港镇景贤村大陆村', '朱文霞'),
(316, '32021919621003729401', '320200100022133', '江阴市同辉百货商行', '吴成勋', '13901524037', '江阴市临港新城中央商务区珠江路203号', '朱文霞'),
(317, '36050219750305681X', '320200100102494', '江阴市金杰纸品加工厂', '廖海林', '86178583', '江阴市夏港街道景贤村新沟工业园', '朱文霞'),
(318, '32021919680208801X01', '320200230017404', '江阴市大道软件服务部', '马建华', '81602561', '江阴市临港街道浦江路105号818室', '朱文霞'),
(319, '320622196902275437', '320200100046369', '江阴市夏港树华机械加工厂', '陆书华', '', '江阴市夏港街道镇澄路300号', '朱文霞'),
(320, '320219198203071266', '320200100046371', '江阴市夏港惠智文具商行', '陈宇', '', '江阴市夏港街道新港大街11号', '朱文霞'),
(321, '320281198805135798', '320200100101887', '江阴夏港天景电器维修部', '顾晨', '', '江阴市夏港街道夏南路27-3号', '朱文霞'),
(322, '320219196712271275', '320200005182997', '江阴市夏港大力起重装卸队', '季建华', '', '江阴市临港新城夏港长达路26号', '朱文霞'),
(323, '32021919350109651401', '320200230019071', '江阴市金淼环保净水材料经营部', '朱以仁', '86851180', '江阴市滨江西路2号1-207室', '朱文霞'),
(324, '320923197312242421', '320200100100868', '江阴市新丰镭机械厂', '祁冬梅', '', '江阴市夏港街道西城路106号', '朱文霞'),
(325, '320621197503100216', '', '江阴市要塞鑫菲酒业商行', '吴海波', '13861623405', '江阴市镇澄路935-1号', '朱文霞'),
(326, '320219196612251269', '320200005114032', '江阴市夏港阿静副食水果店', '李静芬', '', '新港路', '朱文霞'),
(327, '341223198810203039', '', '江阴市要塞真爱电动车行', '孙涛', '', '江阴市夏港街道西城路178号', '朱文霞'),
(328, '34242519860208651401', '320200230026484', '江阴市辉腾机械厂', '杜荣贵', '13921351267', '江阴市临港街道三联村顾家塘99号', '朱文霞'),
(329, '321023194501184222', '320200100099985', '江阴市夏港天铸机械配件加工厂', '万朝珍', '', '江阴市夏港街道西城路106号', '朱文霞'),
(330, '32021919631013129601', '', '江阴市夏港新田园食品厂', '赵国建', '', '江阴市夏港街道新港大街6号', '朱文霞'),
(331, '32021919821006702X01', '320200230020346', '江阴市夏港培欣水泥制品厂', '居培培', '86027205', '江阴市镇澄路881号—883号', '朱文霞'),
(332, '32021919700215701802', '320200230023454', '江阴市夏港鹏耀制管厂', '徐耀清', '86161064', '江阴市临港街道景贤路811号', '朱文霞'),
(333, '32021919620615803401', '320200100090903', '江阴市哲诚电脑商行', '刘焕清', '', '江阴市夏港浦江路139号909', '朱文霞'),
(334, '32021919521015129501', '320200100086729', '江阴市夏港老徐电动车车行', '徐振华', '', '江阴市夏港街道镇镇澄路407号', '朱文霞'),
(335, '32021919530128127101', '320200100084249', '江阴市雄天建筑吊篮机械厂', '吴兴才', '', '江阴市夏港街道夏南村（江阴市夏港志超建材厂院内）', '朱文霞'),
(336, '320281199103106524', '320200100063353', '江阴尚尊广告材料销售部', '邢雅琼', '13338156232', '江阴市临港新城中央商务区浦江路105号', '朱文霞'),
(337, '32021919731008353201', '320200100082863', '江阴市永洁清洁用品商行', '卢勇', '', '江阴市夏港浦江路105号716', '朱文霞'),
(338, '32021919800319127101', '320200100021974', '江阴市夏港志超建材厂', '袁军', '', '江阴市夏港街道夏南村（江阴市夏港福鑫拆旧厂旁）', '朱文霞'),
(339, '32021919610223701001', '320200100076807', '江阴市楚信轮胎经营部', '楚肇明', '', '江阴市夏港街道镇澄路304-1号', '朱文霞'),
(340, '320219196607221276', '320200100064605', '江阴市腾烽百货商行', '林海忠', '', '江阴市夏港街道街南56号', '朱文霞'),
(341, '320219196207291275', '320200008006011', '江阴市夏港新港建材水暖商店', '徐顺虎', '', '江阴市夏港镇镇澄路611号', '朱文霞'),
(342, '320219197701011296', '320200100065227', '江阴市夏港迎春车行', '柳迎春', '', '江阴市夏港街道景贤路802号', '朱文霞'),
(343, '320219194608101285', '320200009216118', '江阴市夏港金盛烟酒店', '刘伍妹', '86033707', '江阴市夏港镇新港62号', '朱文霞'),
(344, '32092319810904241001', '320200100071835', '江阴市夏港军军机械厂', '张达军', '', '江阴市夏港街道西城路218号', '朱文霞'),
(345, '320219197304011292', '', '江阴市夏港新港夹板地板商店', '吴祖君', '', '夏港路', '朱文霞'),
(346, '320219194908081271', '320200008006012', '江阴市夏港向阳建筑装饰用品商店', '王汉章', '86161116', '夏港路', '朱文霞'),
(347, '320219196305051267', '320200009203960', '江阴市宇宙五金电器商行', '吴美芬', '88613149', '江阴市夏港镇镇澄路586号', '朱文霞'),
(348, '320219198405138510', '', '江阴天行广告设计部', '薄陶瀛', '86559999', '江阴市临港新城中央商务区浦江路98号', '朱文霞'),
(349, '32021919800609126801', '320200230022859', '江阴市夏港淼易办公用品商行', '刘晓丹', '13915300912', '江阴市新港35号车库', '朱文霞'),
(350, '32021919820628131401', '320200100091632', '江阴市夏港车洁仕汽车美容店', '张敏虎', '', '夏港街道新港花苑1-4号', '朱文霞'),
(351, '320219196607091264', '320200100115432', '江阴市汇聚五金机电商行', '蔡秀琴', '', '江阴市夏港街道镇澄路800号', '朱文霞'),
(352, '320924197212186473', '320200100102393', '江阴市夏港华鑫金属材料加工厂', '张建华', '81662246', '江阴市夏港街道西城路78号', '朱文霞'),
(353, '320219198208067274', '320200100103554', '江阴市华康化工经营部', '周俊', '', '江阴市通渡北路299号1004', '朱文霞'),
(354, '510823197903090036', '', '江阴品实装潢商行', '卫俊荣', '', '江阴市夏港新港花苑100号', '朱文霞'),
(355, '32021919621113126601', '320200100102072', '江阴市夏港舜唐烟酒商行', '陈惠娟', '86166823', '江阴市夏港街道新长江路303号', '朱文霞'),
(356, '320219195208196515', '320200100102391', '江阴市夏港德达机械厂', '章德荣', '', '江阴市镇澄路780号', '朱文霞'),
(357, '32021919650702776701', '320200230022473', '江阴市夏港宝威汽车服务部', '邓丽英', '13771236411', '江阴市滨江西路320号', '朱文霞'),
(358, '32072119810507202901', '320200230021974', '江阴市夏港巨伟五金机械加工厂', '沈小俭', '15152295833', '江阴市临港街道西城路18号—1', '朱文霞'),
(359, '34122419790627741301', '320200230018527', '江阴市夏港小崔水果店', '崔华亮', '15950122185', '江阴市临港新城夏港镇街南105号', '朱文霞'),
(360, '320219198612201295', '', '江阴市夏港弘尚贸易商行', '刘冬晨', '', '江阴市夏港钱江路22号', '朱文霞'),
(361, '32028119910910127301', '320200230019701', '江阴市夏港彬彬石材经营部', '韩彬', '68820882', '江阴市五星路588号', '朱文霞'),
(362, '320219198011061274', '320200100115434', '江阴市夏港腾鑫制衣厂', '刘彬', '', '江阴市夏港街道景贤村新沟工业园内', '朱文霞'),
(363, '320923198503034814', '320200230015078', '江阴市夏港正标汽车美容装潢店', '汪正标', '86031918', '江阴市新长江路362号', '朱文霞'),
(364, '320923195205082144', '320200100115431', '江阴德重货运代理服务部', '梁成梅', '86296169', '江阴市珠江路步行街336号-340号', '朱文霞'),
(365, '32021919670407678702', '320200230022288', '江阴市夏港北环工程机械经营部', '沈娣', '13382271803', '江阴市滨江西路370号', '朱文霞'),
(366, '14270219800623332401', '320200230025468', '江阴市夏港文安机械安装工程部', '李雪琴', '13921228866', '江阴市临港街道中央商务区珠江路203号', '朱文霞'),
(367, '32021919711207101201', '320200230019844', '江阴市源久纺织品经营部', '俞亚红', '68950561', '江阴市滨江西路398号', '朱文霞'),
(368, '32021919801110102901', '320200230026390', '江阴市夏港瑞木软件服务部', '黄惠芬', '13915302860', '江阴市临港街道新港公寓16幢102室', '朱文霞'),
(369, '32021919430730127501', '320200230022420', '江阴市夏港财盛化工机械设备服务部', '蔡金财', '13861638047', '江阴市临港街道景贤路新沟工业园区8号', '朱文霞'),
(370, '320219197711101279', '', '江阴市昊帝烟酒世界商行', '徐建峰', '86163351', '江阴市夏港街道江南路76号', '朱文霞'),
(371, '32021919790328179601', '320200230021355', '江阴市皓达广告材料商行', '胡晓峰', '18001510001', '江阴市通渡北路299号809', '朱文霞'),
(372, '32021119810227393301', '320200230025178', '江阴市夏港修通机械厂', '徐余', '13601521320', '江阴市临港街道李沟头工业园区', '朱文霞'),
(373, '32021919680603127201', '320200230017760', '江阴市夏港乐家家具店', '范叶清', '13915222179', '江阴市临港新城中央商务区浦江路112号', '朱文霞'),
(374, '320219196905026524', '320200230013971', '江阴市夏港金顺建材加工场', '黄秀英', '86251239', '江阴市临港街道景贤村白石山废弃宕口', '朱文霞'),
(375, '32021919780721127X03', '320200100086633', '江阴市夏港明华手机商行', '於明华', '', '江阴市夏港镇镇澄路515号', '朱文霞'),
(376, '320219197802281260', '320200230015237', '江阴市夏港通达汽配经营部', '田花', '86038318', '江阴市临港街道西街28号', '朱文霞'),
(377, '32021919630331127201', '320200230016229', '江阴市云普建材经营部', '朱云惠', '86162202', '江阴市临港街道新港花苑108号', '朱文霞'),
(378, '320219196112221274', '', '江阴市夏港方元电动车修理店', '庄方元', '86031267', '江阴市夏港街道镇澄路405号', '朱文霞'),
(379, '32021919811225127X01', '320200230021870', '江阴市夏港江南电脑经营部', '周军', '13382222332', '江阴市临港街道新长江路316号', '朱文霞'),
(380, '32021919750124129X01', '320200230018535', '江阴市夏港鑫嘉汽车维修服务部', '刘建华', '86168825', '江阴市镇澄路780号', '朱文霞'),
(381, '32091119700729193401', '320200230021400', '江阴市俊兰彩钢瓦厂', '胥爱云', '15961617180', '江阴市临港街道镇澄路596号', '朱文霞'),
(382, '32021919790328751401', '320200230014252', '江阴市夏港天衿机械配件厂', '卢健', '13861665822', '江阴市临港街道西城路128号', '朱文霞'),
(383, '34282319750328371X01', '320200230021210', '江阴市优品石材经营部', '章传兵', '13301523061', '江阴市临港街道镇澄路780号', '朱文霞'),
(384, '320219195908141291', '320200100102631', '江阴市腾霞海鲜食品商行', '潘建林', '15061746070', '江阴市临港街道江南路46号', '朱文霞'),
(385, '33252119611108531301', '', '江阴市夏港镇如海百货超市', '叶雄军', '13815121737', '江阴市夏港镇三联农贸市场对面', '朱文霞'),
(402, '320219196906190262', '320200100059651', '江阴市利港得月楼酒家', '曹烈', '18861630123', '江阴市临港新城利港利南街218号', '于青荣'),
(411, '32021919671001051401', '320200100091348', '江阴市利港江边公社餐厅', '施荣方', '13584156025', '江阴市临港新城利港利南街184号', '于青荣'),
(412, '32132419830604361X02', '320200100100794', '江阴市利港众鑫大酒店', '周凌骏', '13816888167', '江阴市临港新城利港兴港路339号', '孟建林'),
(413, '320219195006200512', '320200008601219', '江阴市西石桥双鹰大酒店', '许忠良', '13812591599', '人民路203号', '孟建林'),
(414, '320825198002074524', '320200100019106', '江阴市利港瑞鑫阁蒸菜馆', '丁元', '13961626967', '利中街225号', '孟建林'),
(415, '512226197303122610', '320200100037497', '江阴市利港川福骨头煲店', '尹清山', '15312278577', '江阴市临港新城利港利南街107号', '孟建林'),
(416, '320219196810307278', '320200008601220', '江阴市西石桥开鑫酒店', '张军', '13327911105', '西石桥159-2号', '孟建林'),
(417, '320219195910180775', '320200100052377', '江阴市利港喜嘉苑酒店', '徐建浦', '13601529487', '江阴市临港新城利港兴港路121号', '孟建林'),
(418, '510624710524253000', '320200008601944', '江阴市利港酸菜鱼小吃店', '杨启培', '13861612415', '南街97号', '孟建林'),
(419, '350181197508127279', '320200100033278', '江阴市利港德士基汉堡店', '洪宝政', '13515199576', '江阴市利港镇利康路125号', '孟建林'),
(420, '51072319640130309701', '320200005176923', '江阴市利港四海香川菜馆', '张孝荣', '13961429178', '南街99号', '孟建林'),
(443, '32021919791018103X', '320200005161585', '江阴市申港一品园蒸菜馆', '蔡新华', '13861635800', '江阴市申港镇镇澄路1568号', '马国强'),
(444, '320219196610161032', '320200008602337', '江阴市怡波休闲中心', '黄小中', '13182717188', '江阴市申港镇镇澄路1537号', '马国强'),
(445, '32021919760808106203', '320200100097156', '江阴市英利清洗服务部', '马英', '13915246556', '江阴市临港新城申港镇澄路1246号', '马国强'),
(446, '320281195902048027', '320200008602224', '江阴市浦东休闲中心', '周秀娣', '18888632666', '江阴市申港镇镇澄路568号', '马国强'),
(447, '32021919691219101801', '320200100071625', '江阴市江舟饭店', '钱国良', '13601520627', '江阴市临港新城申港滨江村新沟闸北', '马国强'),
(448, '51072319640130309703', '320200009202433', '江阴市申港四海香川味菜馆', '张孝荣', '13151953391', '江阴市镇澄路1576号', '马国强'),
(449, '32028119890206108101', '320200100114725', '江阴市申港于门鲜餐馆', '吕素萍', '13812159988', '江阴市临港街道镇澄路1314号', '马国强'),
(450, '320219195808261042', '320200005178428', '江阴鑫运大酒店', '沈秀华', '15861618696', '江阴市临港新城申港申新路351号', '张网华'),
(451, '512226196304041842', '320200005173102', '江阴市申港金川峡火锅店', '朱进桂', '13771277961', '江阴市临港新城申港申港村中街378号', '张网华'),
(452, '32021919670808101402', '320200100104425', '江阴市申港申江餐厅', '缪国方', '13921250288', '江阴市申港街道滨江西路589号', '张网华'),
(453, '32021919771029003902', '320200100007441', '江阴市宝悦大酒店', '黄坚', '13961677017', '江阴市临港新城申港申浦路219号', '张网华'),
(454, '14220119731120111X01', '320200230019910', '江阴市雅高酒店', '李俊伟', '15161638362', '江阴市临港街道申新路202号', '张网华'),
(455, '32108419770813151113', '320200100107373', '江阴市申港新广城餐馆', '陆银芝', '13511702922', '江阴市临港街道申新路202号', '张网华'),
(456, '32060219740602001204', '320200100107376', '江阴市申港老娘舅大酒店', '薛冠刚', '15895338992', '江阴市临港街道申新路202号', '张网华'),
(457, '320421197307163921', '320200100043626', '江阴市申港广源宾馆', '韩小芬', '13057137188', '江阴市临港新城申港申浦路102-104、120-122号', '张网华'),
(458, '32021919770624102302', '320200100081669', '江阴市申港土灶台餐馆', '薛红艳', '13616167739', '江阴市临港新城申港申新路219号', '张网华'),
(459, '320219195507200529', '320200100029207', '江阴市申港旺德福宾馆', '张小英', '13771604128', '江阴市申港街道申浦路184号', '张网华'),
(460, '32021919441021102401', '320200100093937', '江阴市申港长源大酒店', '张亚云', '13601522559', '江阴市临港新城申港镇澄路1847号', '张网华'),
(461, '32021919851225077801', '320200100087257', '江阴海港大酒店', '朱韬', '13861648877', '申港申兴路365-367', '张网华'),
(462, '320222197111201864', '320200100073906', '江阴市半岛快捷酒店', '吴晓娟', '13861667222', '江阴市临港新城申港申兴路340号', '张网华'),
(463, '320219195102051019', '320200005100139', '江阴市申港鸿运楼大酒店', '芮培坤', '13961613388', '江阴市申港街道申新路221号', '张网华'),
(464, '31010919780819681701', '320200100100798', '江阴市利港钱柜歌城', '周凌骏', '13816888167', '兴港路339号', '孟建林'),
(465, '32021919670210101001', '320200100070899', '江阴市三贝新型建材经营部', '黄兆银', '15961677039', '申港镇澄路1545号', '许荣忠'),
(466, '32021919540813102X01', '320200100089186', '江阴市双悦金属制品厂', '杨菊娣', '13815130889', '江阴市申港街道移山路25号', '许荣忠'),
(467, '32021919780401103701', '320200100050669', '江阴市临港制盖厂', '张伟', '13812115056', '江阴市临港新城申港亚包大道121号', '许荣忠'),
(468, '320219197512200514', '320200100056215', '江阴市申港多多五金商店', '徐海清', '13584111937', '江阴市临港新城申港镇澄路1626号', '许荣忠'),
(469, '320219196911281046', '320200005106460', '江阴市申港澄兴工程机械配件部', '刘亚珍', '13057371305', '镇澄路于门桥堍', '许荣忠'),
(470, '320922197404186336', '320200100062153', '江阴市龙俊建材经营部', '陈荣军', '13961608711', '江阴市临港新城申港东刘村龚家垫36-1号', '许荣忠'),
(471, '320281199110031014', '320200100017631', '江阴市立志电气销售部', '何志新', '13906160291', '江阴市临港新城申港于门村于门桥218号', '许荣忠'),
(472, '320219196311221015', '320200100063217', '江阴市永发机械厂', '杨耀庆', '13771231983', '江阴市临港新城申港亚包大道75号', '许荣忠'),
(473, '32021919741125104802', '320200005105213', '江阴市锦隆电气设备厂', '宋冬娟', '13584111937', '江阴市临港新城申港申南村前河91号', '许荣忠'),
(474, '32021919710310101302', '320200100027699', '江阴市锦程电气设备厂', '何光华', '13901528961', '江阴市临港新城申港申南村前河村91号', '许荣忠'),
(475, '320219196104201011', '320200100007479', '江阴市申港贤丰起重装卸队', '何国方', '13701529586', '江阴市临港新城申港申南村中河', '许荣忠'),
(476, '32021919811124103701', '320200100091071', '江阴市申港涵顺五金加工厂', '陈淋', '13921364597', '江阴市临港新城申港亚包大道83号（耀方厂里）', '黄泽民'),
(477, '32028119900621103101', '320200100099392', '江阴市德奥机械厂', '江超', '18906165089', '江阴市申港街道镇澄路1409号', '许荣忠'),
(478, '511024660817325000', '511024660881730', '江阴市申港钢丝网络厂', '倪念良', '13506166109', '申港镇镇澄路333号', '许荣忠'),
(479, '32028119891009104501', '320200100089184', '江阴市涵艺金属制品厂', '杨晨艳', '13815130889', '江阴市申港街道移山路25号', '许荣忠'),
(480, '320219194811161021', '320200100058224', '江阴市中广核电气设备厂', '曹美芳', '13806168712', '江阴市临港新城申港申南村中河354号', '许荣忠'),
(481, '32021919831226101801', '320200100092193', '江阴市申港东恒五金厂', '殷伟武', '13812152381', '江阴市临港新城申港申浦村东街村40号', '许荣忠'),
(483, '32021919520610102501', '320200100091182', '江阴市申港友于耐火材料经营部', '戴菊妹', '13961643267', '江阴市临港新城申港镇澄路1188号', '许荣忠'),
(484, '320219196611021023', '320200100027056', '江阴市申港仁发建材经营部', '姜红亚', '15601522988', '江阴市临港新城申港东刘村杨家店（新沟河旁）', '许荣忠'),
(485, '320219197312081039', '320200100042653', '江阴市临港汽车维修部', '黄华', '13806163580', '江阴市临新城申港镇澄路1306号', '许荣忠'),
(486, '34120319720501229301', '320200100101222', '江阴市申港张辉水产品店', '张辉', '13485029018', '江阴市申港街道东刘村水淹桥57号', '许荣忠'),
(487, '320219196202251012', '320200100014687', '江阴市佳安建材经营部', '蒋福银', '13151958828', '江阴市临港新城申港于门村孟家店60号', '许荣忠'),
(488, '320219195606061034', '320200100066490', '江阴市岳宏五金加工厂', '曹顺才', '13921351002', '申港镇澄路1100号', '许荣忠'),
(489, '32032119710105202401', '320200230018374', '江阴市申港曹洪敏建材经营部', '曹洪敏', '13901527399', '江阴市临港街道于门村孟家店78号', '许荣忠'),
(490, '320281198711080511', '320200100029744', '江阴市申港盖奇建材经营部', '凤清', '13337911786', '江阴市临港新城申港镇澄路1296号', '许荣忠'),
(491, '32021919620812101601', '320200230018743', '江阴市一久纸箱加工厂', '黄秋华', '18861627761', '江阴市临港街道横塘村苏家店西蒲塘', '许荣忠'),
(492, '32021919761122102X01', '320200100076731', '江阴市申港百年机械销售部', '徐惠琴', '13861601895', '江阴市申港街道申南村磨盘桥119号', '许荣忠'),
(493, '32021919690913102201', '320200100100414', '江阴市东菱机械厂', '陈红艳', '13961618955', '江阴市申港街道申南村中河村295号', '许荣忠'),
(494, '32021919761021128401', '320200230025013', '江阴市申港开泉机械加工厂', '缪金惠', '18915250957', '江阴市临港街道申南村余家巷99号', '许荣忠'),
(495, '32021919720316131201', '320200100051282', '江阴市申港兴达汽车维修部', '张建兴', '13093111660', '江阴市临港新城申港镇澄路1409号', '许荣忠'),
(496, '32021919681013102201', '320200230019155', '江阴市申港菊芬建材厂', '吴菊芬', '13921209170', '江阴市临港街道滨江村申港口1号', '许荣忠'),
(497, '32092119870508717X01', '320200230019243', '江阴市申港万翔汽车维修部', '严翔', '18651036804', '江阴市临港街道镇澄路1529号', '许荣忠'),
(498, '32042119721230604501', '320200230016864', '江阴市安华五金厂', '吴亚萍', '13771258765', '江阴市临港街道于门村钱新路195号', '许荣忠'),
(499, '32021919520820101101', '320200230025840', '江阴市申港裕龙电气机械经销部', '刘裕龙', '13196511668', '江阴市临港街道申南村张家桥294号', '许荣忠'),
(500, '32062519681111717602', '320200230022978', '江阴市新柏冉木制品厂', '陆国新', '13812131170', '江阴市临港街道亚包大道129号', '许荣忠'),
(501, '320281198707070011', '320200100064148', '江阴市申港双江汽修服务部', '匡协慧', '13861612356', '江阴市临港新城申港镇澄路1888号', '许荣忠'),
(502, '32021919560205101501', '320200230018695', '江阴市岳群金属制品厂', '曹岳群', '13961625017', '江阴市临港街道镇澄路1543号', '许荣忠'),
(503, '32021919671230101602', '320200100097438', '江阴市申港丹盛建材经营部', '李志洪', '13656159803', '江阴市临港新城申港于门村钱家巷85号', '许荣忠'),
(504, '32102119721023730501', '320200100100747', '江阴市申港志远模具加工厂', '张云英', '13812109066', '江阴市申港街道滨江村吴家口27号', '许荣忠'),
(506, '320219196407211049', '320200100030544', '江阴市申港佳达机械厂', '顾琴华', '1381254608', '江阴市申港镇申南村牌楼下226号', '许荣忠'),
(507, '32048319890605581101', '320200100090995', '江阴市申港晓东建材经营部', '潘晓东', '13801527562', '江阴市临港新城申港镇澄路1548号', '许荣忠'),
(508, '32021919620729053901', '320200230023091', '江阴市申港玉秀建材经营部', '凤伟成', '13337911786', '江阴市临港街道崇文路58号', '许荣忠'),
(509, '32021919690813029801', '320200100097846', '江阴市科利达五金厂', '柯建军', '13771258765', '江阴市申港街道于门村钱新路195号', '许荣忠'),
(510, '320219195411011037', '320200100070996', '江阴市申港泉方建材经营部', '华泉方', '18651007881', '申港滨江村徐村86号', '许荣忠'),
(511, '32021919760907101801', '320200100054657', '江阴市乐华模具加工厂', '杨明华', '18906165089', '江阴市临港新城申港亚包大道75号', '许荣忠'),
(512, '320219197403301017', '320200100022411', '江阴市东科空调维修服务部', '曹舜东', '13915306762', '江阴市临港新城申港镇澄路1524号', '许荣忠'),
(513, '320219197804131020', '320200005124684', '江阴市申港兄弟叉车经营部', '刘萍', '13404275932', '江阴市申港镇申浦村高头上', '许荣忠'),
(514, '320219196407051014', '320200005114517', '江阴市申浦五金塑料加工厂', '谢群', '13915239277', '申港镇东街73号', '许荣忠'),
(515, '32092219731122391901', '320200100086042', '江阴市申港博达机械厂', '李红星', '13771270755', '临港新城申港移山路148', '许荣忠'),
(516, '332521197011071816', '320200009216740', '江阴市申港众友百货商店', '陈忠霞', '13182723092', '江阴市临港新城申港于门村镇澄路北', '许荣忠'),
(517, '32021919570718101901', '320200100081651', '江阴市申港宝佳电子电气设备厂', '承建云', '13901521280', '申港街道镇澄路1338号', '许荣忠'),
(518, '51302719710120431503', '320200100079547', '江阴市申港崇学五金厂', '吴崇学', '13914170598', '江阴市临港新城申港于门村孟家店1号', '许荣忠'),
(519, '32021919690522101201', '320200100064983', '江阴市申港裕兴车行', '缪余兴', '13812158552', '江阴市临港新城申港镇澄路1598号', '许荣忠'),
(520, '32021919560307103401', '320200100083395', '江阴市华祥清金属制品厂', '华祥清', '13961650559', '江阴市临港新城申港滨江村申港口179号', '许荣忠'),
(521, '320219196102181010', '219196102181010', '江阴市申港西达文具经营部', '陈新国', '13806163785', '江阴市临港新城申港横塘村坝头18号', '许荣忠'),
(522, '32021919680906101201', '320200100082763', '江阴市申港豪鸿铁艺围栏加工部', '殷国于', '13771213325', '江阴市申港街道申浦村缪家村75号', '许荣忠'),
(523, '320219196704211010', '320200009205816', '江阴市申港辉煌汽车服务部', '刘青', '13003369873', '江阴市申港镇镇澄路399号', '许荣忠'),
(524, '320219198209021024', '320200100073364', '江阴市申港威狮针织厂', '何丹华', '13506162989', '江阴市临港新城申港镇澄路1318号', '许荣忠'),
(525, '510921197009214164', '320200100066361', '江阴市申港秀英机械厂', '梁碧蓉', '13771298308', '申港于门村于门桥81号', '许荣忠'),
(526, '320219197507011014', '320200005105937', '江阴市申港鹏源线切割加工厂', '陈建清', '13063657825', '江阴市申港镇申浦村东街村', '许荣忠'),
(527, '32021919520525103X', '320200100066642', '江阴市申港学明副食店', '李学明', '13218775120', '江阴市临港新城申港镇澄海路1246号', '许荣忠'),
(528, '32021919771026103501', '320200100080955', '江阴市申港黄伟峰叉车配件经营部', '黄伟峰', '13337914870', '申港街道镇澄路1214号', '许荣忠'),
(529, '32021919630620104401', '320200100088152', '江阴市申港沿山机械厂', '孙菊芳', '13585068817', '江阴市临港新城申港申南村田头村172号', '许荣忠'),
(530, '320219198510161069', '320200100017164', '江阴市摩柯机械设备维修部', '盛娟', '13506164011', '江阴市临港新城申港东刘村水淹桥24号', '许荣忠'),
(531, '362330197101091758', '320200009216876', '江阴市申港伟平家具商行', '周正春', '13093025189', '江阴市申港镇申浦村东街', '许荣忠'),
(532, '32021919591004102X', '320200005125579', '江阴市申港阿良木制品厂', '傅凤秀', '13921367157', '江阴市申港镇横塘村西横塘231号', '许荣忠'),
(533, '320219197403191014', '320200005105720', '江阴市申港镇广源喷塑厂', '黄勇权', '13921211757', '江阴市申港镇通江南路西', '许荣忠'),
(534, '320219196906061014', '320200100008776', '徐国林', '徐国林', '15961515325', '江阴市申港镇东刘村于门菜场', '许荣忠'),
(535, '32028119900916101701', '320200230021820', '江阴市申港晨宏金属加工厂', '张宇晨', '13771618551', '江阴市临港街道申南村张家桥52-1号', '许荣忠'),
(536, '41272519881216067601', '320200230025459', '江阴市申港申亚汽车维修部', '郭鹏', '15861656037', '江阴市临港街道镇澄路1549号', '许荣忠'),
(537, '32028119870118105201', '320200100102896', '江阴市申港益仁五金加工厂', '沈益', '13921239421', '江阴市临港新城申港横塘村坝头15号', '许荣忠'),
(538, '32021919640622101802', '320200230018476', '江阴市申港南进土石方工程队', '何建云', '18001522222', '江阴市临港街道镇澄路1388号', '许荣忠'),
(539, '32021919750818103101', '320200230025777', '江阴市申港恒发包装箱厂', '邵金龙', '15961680335', '江阴市临港街道东刘村水淹桥59号', '许荣忠'),
(540, '32021919540919105901', '320200230021953', '江阴市申港新辉电气设备厂', '张加方', '13771287780', '江阴市临港街道申南村张家村71号', '许荣忠'),
(541, '32021919740820104X01', '320200100094712', '江阴市申港美旭模具厂', '赵华', '13921250781', '江阴市临港新城申港滨江村申港口6号', '许荣忠'),
(542, '32021919441212106501', '320200230025709', '江阴市申港美康模具厂', '余玉英', '13338152219', '江阴市临港街道滨江村申港口6号', '许荣忠'),
(543, '32021919630222103X', '320200008602380', '江阴市申港镇吉安消防器材经营部', '许金龙', '13912451520', '申港镇镇澄路262号', '许荣忠'),
(544, '32028119900524109501', '320200230025726', '江阴市申港卡姆欧机械厂', '曹磊', '13771211213', '江阴市临港街道申南村余家巷100-1号', '许荣忠'),
(545, '32021919760112101701', '320200230026092', '江阴市申港悦丰五金厂', '胡建锋', '13915258757', '江阴市申港街道镇东路429号', '许荣忠'),
(546, '51292119711014792201', '320200100101237', '江阴市常澄机电维修部', '李国英', '13921237599', '江阴市申港街道镇澄路1086号', '许荣忠'),
(547, '32021919621015105406', '320200100098170', '江阴市申港荣昊服装店', '余永传', '13771286689', '江阴市临港新城申港申南村北华家村59号', '许荣忠'),
(548, '32028119880309102301', '320200100100039', '江阴市晟伟建筑机械经营部', '徐晶', '13901524830', '江阴市申港街道申南村张家桥7号', '许荣忠'),
(549, '32021919700607104301', '320200100096470', '江阴市嘉贤机械配件厂', '高菊萍', '13961666697', '江阴市申港街道镇澄路1537号', '许荣忠'),
(550, '32028119931115103901', '320200230022130', '江阴市申港成良乐器配件加工厂', '杨佳成', '13585053882', '江阴市临港街道申浦村缪家村271号', '许荣忠'),
(551, '32021919760223104X01', '320200230016836', '江阴市飘安建材经营部', '缪春琴', '13961614559', '江阴市临港街道申浦村缪家村66号', '许荣忠'),
(552, '320219196207130017', '320200230015787', '江阴市匡匡汽车维修服务部', '匡玉清', '13806163986', '江阴市临港街道镇澄路1531号', '许荣忠'),
(553, '32021919690821102001', '320200230018367', '江阴市申港翔宇电气设备经营部', '何凤秀', '13906169150', '江阴市临港街道东徐路32号', '许荣忠'),
(554, '32021919720709126X01', '320200230026759', '江阴市申港鸿峰装卸队', '范金', '15852622777', '江阴市临港街道滨江村申港口7号', '许荣忠'),
(555, '32021919860830101501', '320200230024039', '江阴市申港君良汽车维修部', '张君良', '15306167618', '江阴市临港街道镇澄路1529号', '许荣忠'),
(556, '34282319681209284001', '320200230017742', '江阴市宜学装饰装潢部', '吴成凤', '13961672990', '江阴市临港街道滨江村申港口8号', '许荣忠'),
(557, '32021919750302101201', '320200230014912', '江阴市申港伟伟汽车服务部', '冯伟', '15961661032', '江阴市临港街道镇澄路1384号', '许荣忠'),
(558, '32021919710308102403', '320200100100409', '江阴市聚财电气设备经营部', '何春英', '13706161078', '江阴市申港街道镇澄路1640号', '许荣忠'),
(559, '32021919740423101401', '320200230018800', '江阴市陈家金属板房厂', '陈建锋', '13771238301', '江阴市临港街道镇澄路1531号', '许荣忠'),
(560, '32021919770924105301', '320200230024362', '江阴市申港清锋装卸队', '黄建清', '13914191037', '江阴市临港街道滨江村申港口8号', '许荣忠'),
(561, '32021919680411578X01', '320200100100412', '江阴市盈鼎电气设备厂', '徐美亚', '13706161078', '江阴市申港街道镇澄路1640号', '许荣忠'),
(562, '32021919511225052101', '320200100101233', '江阴市申港久鼎建材经营部', '冯荷珍', '13337911786', '江阴市申港街道镇澄路1296号', '许荣忠'),
(563, '33250119870620531401', '320200230024488', '江阴市申港乐文副食超市', '陈静波', '18961656792', '江阴市临港街道镇澄路1347号', '许荣忠'),
(564, '32021919690410104301', '320200100095780', '江阴市申港巨力起重机械经营部', '殷小翔', '13270153077', '江阴市临港新城申港镇澄路1573号', '许荣忠'),
(565, '32028119881029105801', '320200230019595', '江阴市申港弘历铁栏加工厂', '缪理历', '13906162980', '江阴市临港街道申浦村缪家村271号', '许荣忠'),
(566, '32021919721013105802', '320200230019608', '江阴市申港友庆建材物资经营部', '戚光华', '13182788918', '江阴市临港街道申浦村缪家村271号', '许荣忠'),
(567, '32021919770924105302', '320200100098171', '江阴市申港龙祺装卸队', '黄建清', '13914176818', '江阴市申港街道滨江村黄史塘41号', '许荣忠'),
(568, '32032319780825363101', '320200230021227', '江阴市申港一鸣汽车服务部', '滕海平', '13771251510', '江阴市临港街道镇澄路1545号', '许荣忠'),
(569, '34212519670413251201', '320200230017458', '江阴市申港八方膜结构雨蓬厂', '张怀群', '13952481896', '江阴市申港街道镇澄路1254号', '许荣忠'),
(570, '32021919601027101901', '320200230017459', '江阴市申港新铭模具材料经营部', '华加裕', '13812109066', '江阴市临港街道申浦村缪家村273号', '许荣忠'),
(571, '32021919631020101201', '320200100053450', '江阴市申港建方建材经营部', '华建方', '13812170708', '江阴市临港新城申港镇澄路1308号', '许荣忠'),
(572, '320281198104231023', '320200100043708', '江阴市申港杰辉机械厂', '廖正朵', '13915253902', '江阴市临港新城申港滨江村徐村192号', '许荣忠'),
(573, '320219197903101126', '320200230027295', '江阴市申港杜克电气设备厂', '黄李芬', '13771615680', '江阴市申港街道申新路22号', '许荣忠'),
(574, '32021919721102102901', '320200100100140', '江阴市申港祥庆建材物资经营部', '张亚芬', '13915228684', '江阴市申港街道申浦村缪家村271号', '许荣忠'),
(575, '320219196605151024', '320200100071840', '江阴市海鹏玻璃钢制品厂', '华丽琴', '15251557928', '申港申兴村宋家圩363号', '黄泽民'),
(576, '320219197108061030', '320200005122167', '吴伟松', '吴伟松', '13182730588', '申港镇中街', '黄泽民'),
(577, '32021919660318102701', '320200100076207', '江阴市苏盈电气设备厂', '黄建英', '13961620328', '江阴市申港街道申裕街14号', '黄泽民'),
(578, '320219196909200569', '320200100040740', '江阴市申港玉清电器经营部', '瞿秋华', '13812158161', '江阴市临港新城申港申港村中街188号', '黄泽民'),
(579, '320219196408141011', '320200100041581', '江阴市申港亚庆五金商店', '吴亚庆', '13063699165', '江阴市临港新城申港人民南路3号', '黄泽民'),
(580, '320219196204031021', '320200005107338', '江阴市申港镇申新水电装潢经营部', '吴林秀', '86684881', '申港路申新路50－1号', '黄泽民'),
(581, '320219196908081027', '320200100069023', '江阴市申港玖玖宝酒业商行', '缪惠兰', '13626231688', '江阴市临港新城申港申兴路346号', '黄泽民'),
(582, '320219197009298024', '320200100073908', '江阴市云逸装潢材料店', '许俊君', '15861608807', '江阴市临港新城申港申裕街6号', '黄泽民'),
(583, '320219196206161014', '320200100064150', '江阴市盈盛电气设备厂', '苏洪方', '15365201955', '江阴市临港新城申港人民北路219号', '黄泽民'),
(584, '320219195611071034', '320200100056812', '江阴市兴港建材厂', '徐来兴', '18921353828', '江阴市临港新城申港申兴村小周家店3号', '黄泽民'),
(585, '32021919680620108301', '320200100081667', '江阴市申港瑀轩花岗岩加工厂', '王玉华', '13914282098', '江阴市申港街道东刘村杨家垫55号', '黄泽民'),
(586, '320219196809181014', '320200100017627', '江阴市耐特五金商行', '吕军', '13861615585', '江阴市临港新城申港申新路299号', '黄泽民'),
(587, '320219197608270525', '320200100056358', '江阴市宏康纺织品经营部', '朱利花', '13812585070', '江阴市临港新城申港申西村大周家垫103号', '黄泽民'),
(588, '34262319901216161X', '320200100002246', '江阴市申港车港湾汽车美容店', '刘仁亮', '13771217377', '江阴市临港街道申浦路188-189号', '黄泽民'),
(589, '32021919650804101802', '320200100083389', '江阴市申港昊英机械配件厂', '徐兴方', '13921352588', '江阴市申港街道镇澄路1858号', '黄泽民'),
(590, '32021919650224107801', '320200100082483', '江阴市申港乐鸿通信设备经营部', '宋建平', '13921356228', '江阴市申港街道申兴路301号', '黄泽民'),
(591, '34012219750823541101', '320200100091073', '江阴市尤斌螺杆加工厂', '卫尤斌', '13584166658', '江阴市临港新城申港创新村中杨家塘95-2号', '黄泽民'),
(592, '32021919481003102201', '320200100092184', '江阴市国色副食店', '金惠芳', '13812179129', '江阴市临港新城申港申兴路387号', '黄泽民'),
(593, '320219196803111015', '320200100058291', '江阴市源崴机械厂', '刘卫东', '13003355090', '申港镇澄路1477号', '黄泽民'),
(594, '320219196707081012', '320200100038412', '江阴市申港轩旺钣金加工厂', '李兴龙', '13921250781', '江阴市临港新城申港申兴村宁家圩304号', '黄泽民'),
(595, '32028119890319101301', '320200230016277', '江阴市申港旺发建材经营部', '杨锦鹏', '15961623367', '江阴市临港街道镇澄路1850号', '黄泽民'),
(596, '320219197509281018', '219197509281020', '江阴市新创废旧物资回收站', '吕刚华', '13901525909', '江阴市临港新城申港创新村西伍33号', '黄泽民'),
(597, '32021919701013077101', '320200230018757', '江阴市中宏机械厂', '俞建兴', '13812151266', '江阴市临港街道申西村省绛村112号', '黄泽民'),
(598, '320219197410011042', '320200100015411', '江阴市友鹏金属制品经营部', '张亚', '13771290121', '江阴市临港新城申港镇镇澄路1868号', '黄泽民'),
(599, '320219197411261027', '320200100027767', '江阴市申港申通电器商行', '华雪华', '13301527535', '江阴市临港新城申港申新路214号', '黄泽民'),
(600, '32021919640217104101', '320200230016575', '江阴市东泉机械配件厂', '徐杏凤', '13961666697', '江阴市临港街道镇澄路1848号', '黄泽民'),
(601, '32021919550608106201', '320200230026310', '江阴市申港聚润汽车零部件加工厂', '傅桂芳', '18626365800', '江阴市临港街道申兴村西街村253号', '黄泽民'),
(602, '32021919501123103004', '320200100097157', '江阴市申港崇文建材经营部', '王焕生', '13706160108', '江阴市申港街道崇文路555号', '黄泽民'),
(603, '32021919851125029001', '320200100097446', '江阴市申港华记禽蛋店', '解勇', '13914180910', '江阴市申港街道申西村大周家垫', '黄泽民'),
(604, '32021919720207101601', '320200230017217', '江阴市申港三木机械厂', '柳建军', '18921260977', '江阴市临港街道创新村中杨家塘95-1号', '黄泽民'),
(605, '35012419730917391001', '320200230018744', '江阴市申港鼎好家居店', '黄勤建', '15312285168', '江阴市临港街道申港路226号', '黄泽民'),
(606, '320281199311181019', '320200100058240', '江阴市宜豪模具厂', '沈豪', '13585052156', '江阴市临港新城申港创新路17号', '黄泽民'),
(607, '32028119880706102401', '320200100084903', '江阴市鼎顺广告制作部', '李萍', '13771259899', '江阴市临港新城申港申裕路107号', '黄泽民'),
(608, '32062419771225841404', '320200230016234', '江阴市申港平育通讯商行', '秦育', '15261625605', '江阴市镇澄路1728号', '黄泽民'),
(609, '32021919590321101901', '320200230019966', '江阴市双华空调设备维修部', '朱平南', '13506161558', '江阴市临港街道创新村申庄路9号', '黄泽民'),
(610, '32021919750201102301', '320200230025142', '江阴市申港程铭装饰装潢部', '陈春芬', '13921263088', '江阴市临港街道申浦路206号', '黄泽民'),
(611, '320219197210301010', '320200230013826', '江阴市申港喜乐购副食超市', '李秋荣', '13506165755', '江阴市临港街道朱家湾花园一村东区1-2号', '黄泽民'),
(612, '32021919691130076101', '320200100095155', '江阴市申港勤友机械加工厂', '苏友女', '13806168712', '江阴市临港新城申港创新村申庄2号', '黄泽民'),
(613, '320219198408211015', '320200100014861', '江阴市申港飞飞副食店', '何飞', '13961685998', '江阴市临港新城申港申裕街137号', '黄泽民'),
(614, '51293071040658900001', '930710406589000', '江阴市申港恒港建材商店', '罗长华', '13961662510', '江阴市申港街道镇澄路1830号', '黄泽民'),
(615, '32021919851022076X01', '320200100099844', '江阴市申港润积百货店', '王梅', '13771270688', '江阴市申港街道申港中街', '黄泽民'),
(616, '32021919660414077X', '320200005145797', '江阴市申港兴旺食品店', '王国华', '13771270688', '江阴市临港街道申港村中街369-1号', '黄泽民'),
(617, '32021919680405105001', '320200100091537', '江阴市申港华诚五金加工厂', '吴仁华', '13801529488', '江阴市临港新城申港镇澄路1885号', '黄泽民'),
(618, '32021919761212104701', '320200100089802', '江阴市申港申宏电讯器材厂', '殷丽娣', '13961618955', '江阴市临港新城申港申兴路313号', '黄泽民'),
(619, '320219196712261034', '320200008601631', '江阴市申港伦达建材经营部', '华建松', '13861625288', '申港中街', '黄泽民'),
(620, '320219196807251023', '320200100055358', '江阴市申港四季珠绣厂', '杨生凤', '13812177219', '江阴市临港新城申港创新村西伍村51号', '黄泽民'),
(621, '342622196910276590', '320200005107389', '江阴市申港美丽家园装饰装潢部', '汪方信', '13961672990', '江阴市临港新声码申港申新路264号', '黄泽民'),
(622, '341103197908131218', '320200005126269', '江阴市申港嘉捷通讯商店', '徐忠飞', '13961616881', '江阴市申港镇人民南路2号', '黄泽民'),
(623, '320219196703211019', '320200100008577', '江阴市申港陈国忠水产品商店', '陈国忠', '13861621175', '江阴市申港镇农贸市场', '黄泽民'),
(624, '320724198406060936', '320200100055329', '江阴市申港凯瑞五金加工厂', '马进步', '18906165089', '江阴市临港新城申港申兴北路259号', '黄泽民'),
(625, '320219196612058522', '320200009209772', '江阴市申港镇金叶烟酒店', '高晓红', '13506161555', '江阴市申港镇人民北路56号', '黄泽民'),
(626, '35060019820225153701', '320200100085770', '江阴市申港振利实验用品商店', '陈煌坤', '13861667861', '江阴市临港新城申港人民北路189号', '黄泽民'),
(627, '320219196605011048', '320200005117006', '江阴市申港诚和五交化商店', '顾美芬', '13013659095', '申港镇', '黄泽民'),
(628, '32021919780402103201', '320200100051564', '江阴市申港小鲸鱼汽车维修部', '徐骁', '13057255157', '江阴市申港镇申浦村', '黄泽民'),
(629, '320219197712071016', '320200009210786', '江阴市申港恒达装饰装潢部', '曹燕军', '13961642435', '江阴市临港新城申港镇澄路1845号', '黄泽民'),
(631, '32021919740922101801', '320200100081329', '江阴市申港文轩酒业商行', '李建新', '15961519538', '江阴市申港街道申裕路111号', '黄泽民'),
(632, '320219195910221012', '320200100066776', '江阴市申港奇佳电动车商店', '缪荣兴', '13806164540', '江阴市临港新城申港崇文南路', '黄泽民'),
(633, '32021919780309077301', '320200100071308', '江阴市申港安诚汽车服务部', '夏小龙', '13861634795', '申港申裕街164号', '黄泽民'),
(634, '32021919521030102X', '320200008601633', '江阴市申港通达家俱建材商店', '薛荷妹', '13405795854', '申港镇西街', '黄泽民'),
(635, '320219196212071031', '320200005121540', '江阴市齐心文百书店', '季伟强', '13961601562', '申港镇中街供销社', '黄泽民'),
(636, '320219196807190769', '320200100010934', '江阴市申港璟秀百货店', '周国琴', '13771270688', '江阴市临港新城申港申港村中街', '黄泽民'),
(637, '32021919631113101X01', '320200100084936', '江阴市申港兴港电器商店', '张新荣', '86623131', '江阴市临港新城申港人民北路128号', '黄泽民');
INSERT INTO `tp_upload_people` (`id`, `shui_hao`, `management_num`, `shui_ming`, `name`, `phone`, `address`, `management`) VALUES
(638, '32021919480818101301', '320200100084939', '江阴市申港怡东五金商行', '蔡新一', '13801527556', '江阴市临港新城申港申兴村西街45号', '黄泽民'),
(639, '32021919720722102801', '320200100084061', '江阴市申港华红英机械厂', '华红英', '13585061933', '江阴市申港街道镇澄路1858号', '黄泽民'),
(640, '32021919650602105603', '320200100052252', '江阴市恒佳热水服务部', '李文平', '13003355300', '江阴市临港新城申港申兴村宋家圩村277与', '黄泽民'),
(641, '320219197511010276', '320200005105943', '江阴市申港祥云线切割加工部', '刘可论', '15950120088', '江阴市临港新城申港申浦村东街', '黄泽民'),
(642, '320219197812047048', '320200230014209', '江阴市利奥纳多汽车服务部', '徐英', '13376229935', '江阴市临港街道申新路216号', '黄泽民'),
(643, '32021919620821101103', '320200100093555', '光林车行', '徐光林', '13291207261', '江阴市临港新城申港中街', '黄泽民'),
(644, '32021919770624102303', '320200100099847', '江阴市大周图文设计工作室', '薛红艳', '13656160268', '江阴市临港新城申港申新路219号', '黄泽民'),
(646, '32042119790504792001', '320200100098561', '江阴市申港王文娟副食店', '王文娟', '13901527322', '江阴市临港新城申港申兴村西街村386号', '黄泽民'),
(647, '32021919610315102401', '320200230022573', '江阴市荣拓机械配件厂', '朱巧秀', '18901525189', '江阴市临港街道申兴村戴君桥389号', '黄泽民'),
(648, '32021919741110101501', '320200230025793', '江阴市申港振鸿装卸队', '单君伟', '13915220010', '江阴市临港街道崇文路549号', '黄泽民'),
(649, '32028119890216102301', '320200100102154', '江阴市莉莉五金配件经营部', '尤莉', '13701524595', '江阴市申港街道创新村高庄上49号', '黄泽民'),
(650, '32021919420902104201', '320200230024580', '江阴市申港梦越机电经营部', '朱琴芳', '13815125389', '江阴市临港街道江南花园69-2号', '黄泽民'),
(651, '32028119911027101801', '320200100099389', '江阴市桂芬机电经营部', '郭梦超', '13806168712', '江阴市申港街道江南花园69-2号', '黄泽民'),
(652, '35018219850801683601', '320200230023391', '江阴市申港陈辉通讯设备商店', '陈辉', '18861653222', '江阴市临港新城申港人民北路13号', '黄泽民'),
(653, '32021919590704104501', '320200100102883', '江阴市申港科润五金加工厂', '吴琴芬', '13812572148', '江阴市镇澄路1885号', '黄泽民'),
(654, '32021919830419101301', '320200100102886', '江阴市申港科瑞五金加工厂', '刘文鹤', '13812572148', '江阴市临港街道申浦村东街397号', '黄泽民'),
(655, '32021919660319752001', '320200230025369', '江阴市申港蓝天日用品店', '钱金芳', '13771270688', '江阴市临港街道申港村中街369-1号', '黄泽民'),
(656, '32042119730807581901', '320200230025431', '江阴市勋业医疗器械经销部', '刘建东', '18961675766', '江阴市镇澄路1747号', '黄泽民'),
(657, '32021919640822076401', '320200230025376', '江阴市申港吉利生活用品店', '王礼华', '13771270688', '江阴市临港街道申港村中街369-1号', '黄泽民'),
(658, '512927197408114814', '320200100040447', '江阴市申港平安装卸队', '吴华平', '13812116151', '江阴市临港新城申港创新村杨家塘33号', '黄泽民'),
(659, '32028119910315101801', '320200230026426', '江阴市申港钦钦干货商行', '谢海平', '15950137866', '江阴市临港街道申兴村谢家湾4号', '黄泽民'),
(660, '32021919501126102901', '320200230027025', '江阴市申港王荷芳副食店', '王荷芳', '13901527322', '江阴市临港新城申港申港村中街村352号', '黄泽民'),
(661, '32021919621014102401', '320200230022894', '江阴市申港哆咪啦玩具商行', '黄惠芬', '13815121006', '江阴市临港街道创新村西伍村95-1号', '黄泽民'),
(662, '32042119761222582601', '320200230022565', '江阴市申港洪兴装卸搬运队', '顾霞红', '13706164005', '江阴市临港街道申裕街111号', '黄泽民'),
(663, '32021919761010102601', '320200230016956', '江阴市矿信机械厂', '严新华', '13771598108', '江阴市临港街道镇澄路1918号', '黄泽民'),
(664, '32021919680121257604', '320200230025866', '江阴市申港世纪阳光购物广场百货店', '王其明', '13861618629', '江阴市临港街道申港路257号', '黄泽民'),
(665, '350124197906063912', '320200230014878', '江阴市申港明星家居建材卖场', '黄敬樟', '18651030124', '江阴市申港街道镇澄路1958号', '黄泽民'),
(666, '32021919640826104801', '320200230016279', '江阴市申港祥瑞建材经营部', '陈玲秀', '13395169652', '江阴市临港街道镇澄路1850号', '黄泽民'),
(667, '32060219830302652001', '320200230022711', '江阴市申港盈德百货店', '王芳', '13771270688', '江阴市申港街道申港村中街', '黄泽民'),
(668, '32021919771002629701', '320200230021434', '江阴申港三江水产商行', '汤云海', '13812108188', '江阴市临港街道申圩路23号', '黄泽民'),
(669, '32021919630801104101', '320200230021667', '江阴市申港莲心文化用品经营部', '黄龙妹', '13093111125', '江阴市临港街道人民北路223号', '黄泽民'),
(670, '32021919560912104701', '320200230021683', '江阴市申港玲玲文化用品经营部', '黄琴妹', '13093111125', '江阴市临港街道崇文路281号', '黄泽民'),
(671, '32021919701018103401', '320200230021652', '江阴市申港新华电脑商店', '华健', '15161659938', '江阴市临港街道崇文路211号', '黄泽民'),
(672, '32021919780206127601', '320200230021661', '江阴市申港山峰文化用品经营部', '翟江峰', '13093111125', '江阴市临港街道崇文路281号', '黄泽民'),
(673, '32028119891123104601', '320200100095942', '江阴市恒平热水服务部', '夏静', '13395165052', '江阴市申港街道申裕街194号', '黄泽民'),
(674, '32021919620502751801', '320200100096259', '江阴市申港林建包装材料厂', '芮林坤', '13815138752', '江阴市临港新城申港申圩路363号', '黄泽民'),
(675, '32021919641014102901', '320200230020748', '江阴市天友减速机厂', '何爱娟', '13301525770', '江阴市临港街道申兴村宋家圩2号', '黄泽民'),
(676, '32028119911128127701', '320200230019600', '江阴市刘晶电气设备经营部', '刘晶', '13914202262', '江阴市临港街道创新村西伍95-2号', '黄泽民'),
(677, '22032319800228482702', '320200100102568', '江阴市宇轩广告设计制作部', '赵凤红', '13585052277', '江阴市临港新城申港申兴路323号', '黄泽民'),
(678, '332601197903112011', '320200230015481', '江阴市申港家特福鞋服超市', '李欠卫', '13915251111', '江阴市临港新城申港申新路226号', '黄泽民'),
(679, '32021919850709101201', '320200230020900', '江阴市申港刚强五金加工厂', '徐志刚', '13906160040', '江阴市临港街道镇澄路1805号', '黄泽民'),
(680, '320823196904295017', '320200100059194', '江阴市六九五金加工部', '叶如九', '15961650807', '江阴市临港新城申港镇澄路1978号', '黄泽民'),
(681, '320219196510031038', '320200005135082', '江阴市申港建华水泥块加工厂', '张建华', '13806165992', '江阴市申港镇创新村中杨家塘67号', '黄泽民'),
(682, '32021919800723101501', '320200100098574', '江阴市申港俊锋电器商店', '沈卫锋', '13584140134', '江阴市申港街道崇文路95-97号', '黄泽民'),
(683, '320219197510101037', '320200005115428', '江阴市恒宇自动化设备厂', '刘峰', '13861622587', '江阴市申港镇亚包大道121号', '黄泽民'),
(684, '51292719721205146001', '320200100094674', '江阴市申港申创机电维修部', '鲜晓玲', '18906165089', '江阴市临港新城申港镇路1334号', '黄泽民'),
(685, '32021919710822102201', '320200230019370', '江阴市申港安顺建材经营部', '程进', '13961614559', '江阴市临港街道崇文路198号', '黄泽民'),
(686, '320219196006080770', '320200009211825', '江阴市迪卡娱乐中心', '丁华明', '13812170060', '利南街125号', '孟建林'),
(687, '32021919730117103901', '320200100117387', '江阴市利港鑫凯饭店', '刘建国', '15952486362', '兴港路190号', '于青荣'),
(688, '34262319730303882301', '320200100110517', '江阴市利港印象食府', '张晓兵', '18651020630', '利康街208号', '于青荣'),
(689, '50011319860502761201', '320200100107549', '江阴市利港品味川菜馆', '蒲云浪', '18911384835', '利康街190号', '于青荣'),
(690, '32021919621014102401', '320200230022894', '江阴市申港哆咪啦玩具商行', '黄惠芬', '13815121006', '江阴市临港街道创新村西伍村95-1号', 'user'),
(691, '32021919770924105302', '320200100098171', '江阴市申港龙祺装卸队', '黄建清', '', '江阴市申港街道滨江村黄史塘41号', 'user'),
(692, '32042119790504792001', '320200100098561', '江阴市申港王文娟副食店', '王文娟', '', '江阴市临港新城申港申兴村西街村386号', 'user'),
(693, '32021919861009101001', '320200230021297', '江阴市申港迅达电脑商店', '黄建军', '15961611004', '江阴市临港街道申港路257号', 'user'),
(4921, '32021919760814078X', '320200230014739', '江阴市利港杭肃机械厂', '刘丽芳', '13861615220', '江阴市临港街道利中街377号', '孟建林'),
(4922, '32021919650905078402', '320200230018847', '江阴市利港茂达机械厂', '盛爱萍', '18915065080', '江阴市临港街道利中街268号', '孟建林'),
(4923, '32021919761205052501', '320200100085425', '江阴市利港金尔玛百货店', '梅勇芬', '', '江阴市临港新城利港利中街152号', '孟建林'),
(4924, '220125197604243667', '320200100070493', '江阴展业空调技术服务部', '李雪源', '', '江阴市临港新城利港西利路157-1号', '孟建林'),
(4925, '32021919660216077701', '320200230018850', '江阴市嘉业电子厂', '张伟平', '13382868128', '江阴市临港街道巨轮村东野塘2号', '孟建林'),
(4926, '320219195307250775', '320200100044120', '江阴市利港文乾机械厂', '单卫兴', '86639886', '江阴市临港新城利港西街115号', '孟建林'),
(4927, '320219197106150523', '320200100067765', '江阴市顺鼎机械厂', '毛莉芬', '86601169', '江阴市临港新城利港后梅社区前横村', '孟建林'),
(4928, '320219198102081027', '320200100063871', '江阴市凌越机械厂', '凌海燕', '', '江阴市临港新城利港龙港路11号', '孟建林'),
(4929, '32021919741114079401', '320200230022392', '江阴市利港璇璇机械厂', '朱华明', '13616168405', '江阴市临港街道华兴路5号', '孟建林'),
(4930, '320219197512170765', '320200008601464', '江阴市利港镇日杂部', '朱彩霞', '', '利港镇利中街', '孟建林'),
(4931, '320219195011160519', '320200100044655', '江阴市利港圆通建材厂', '王阿虎', '', '江阴市西石桥兴西路38号', '孟建林'),
(4932, '320281198801120767', '320200100101747', '江阴市西石桥晨飞玻璃钢制品厂', '丁虹', '', '江阴市临港新城利港镇澄路2222号', '孟建林'),
(4933, '32021919850630702901', '320200230021887', '江阴市利港泰利五金商行', '沈婷', '15852621818', '江阴市临港街道利港西街46号', '孟建林'),
(4934, '32021919781001077801', '320200100059266', '江阴市利港乾健机械厂', '单文健', '', '江阴市临港新城利港西街115号', '孟建林'),
(4935, '320219195701170765', '320200100042189', '江阴市利港伟刚机械厂', '郑秀萍', '', '江阴市临港新城利港滨江西路1018号', '孟建林'),
(4936, '320219197004110766', '320200100056679', '江阴市利港友佳机械厂', '徐英', '13182730282', '江阴市临港新城利港西奚墅村西奚墅路71号', '孟建林'),
(4937, '32021919760229052501', '', '江阴市西石桥旺威五金商行', '刘红燕', '13771597020', '江阴市临港街道公平路38号', '孟建林'),
(4938, '320219197809030026', '320200100063029', '江阴市利港爱克发机械厂', '吕娟', '', '江阴市临港新城利港贵宾路58号', '孟建林'),
(4939, '32041119771127001301', '320200100112514', '江阴市利港科高机械厂', '何华平', '', '江阴市临港新城利港巨轮村西野塘22号', '孟建林'),
(4940, '32021919681004027801', '320200230022226', '江阴市利港立阳建材经营部', '黄立庆', '13961600831', '江阴市临港街道贵宾路9号', '孟建林'),
(4941, '320219197812280552', '320200100065229', '江阴市尚品橱柜厂', '顾建刚', '', '江阴市临港新城利港镇澄路2058号', '孟建林'),
(4942, '32021919700513027501', '320200100093687', '江阴市利港正业机械厂', '黄伟东', '', '江阴市临港新城利港巨轮村沟湾里20号', '孟建林'),
(4943, '320219196206150761', '320200100071777', '江阴市利港瑞和建材经营部', '王玉美', '', '江阴市临港新城利港兴港路98号', '孟建林'),
(4944, '32028119901204078501', '320200100089434', '江阴市利港金越空调配件经营部', '黄涵娇', '', '江阴市临港新城利港滨江西路1166号', '孟建林'),
(4945, '320219198011218542', '320200100115415', '江阴市利港晨谷机械厂', '张佳琳', '', '江阴市临港新城利港西安村西兴圩45号', '孟建林'),
(4946, '320219195710150774', '320200100059735', '江阴市利港恒亚冲件厂', '高永伟', '', '江阴市临港新城利港西街115号', '孟建林'),
(4947, '32021919810630031101', '320200100093684', '江阴市利港富业机械厂', '李宏', '', '江阴市临港新城利港巨轮村沟湾里20号', '孟建林'),
(4948, '320219196404030779', '320200100101750', '江阴市利港雄进机械厂', '何雄伟', '', '江阴市临港新城利港镇陈墅村阚家头27号', '孟建林'),
(4949, '320219197611020260', '320200100061930', '江阴市利港鑫平机械厂', '谢爱琴', '', '江阴市临港新城利港利中街391号', '孟建林'),
(4950, '32021919620309026501', '320200100098279', '江阴市利港泰士鑫机械厂', '李玉华', '', '江阴市临港新城利港贵宾路58号', '孟建林'),
(4951, '32021919800911076X', '320200100060962', '江阴市利港洁柯机械厂', '缪丽娟', '', '江阴市临港新城利港西奚墅村西奚墅路71号', '孟建林'),
(4952, '32021919690925077701', '320200230026230', '江阴市利港中涛机械厂', '谢惠峰', '13961679036', '江阴市临港街道龙港路6号', '孟建林'),
(4953, '320219198012260515', '320200005158675', '江阴市文子电脑经营部', '刘文清', '86602227 13861785565', '江阴市利港镇西石桥北街18号', '孟建林'),
(4954, '320219197203180791', '320200005125479', '江阴市利港聚鑫制冷设备厂', '徐函清', '', '江阴市利港镇滨江路沿江工业园仁和小区', '孟建林'),
(4955, '41302319720518006401', '320200230020990', '江阴市利港东港建材经营部', '陈世梅', '13906169818', '江阴市临港街道西利路239号', '孟建林'),
(4956, '320923198706248118', '320200100066567', '江阴市杰隆机械设备经营部', '许凯祥', '', '江阴市临港新城利港维常村西维常1号', '孟建林'),
(4957, '32021919580725051X', '320200009214996', '江阴市西石桥国金五金加工厂', '戚国金', '', '江阴市利港镇苍山村幸福庄', '孟建林'),
(4958, '32021919470826026701', '320200100077172', '江阴市利港高运机械厂', '高桂娣', '', '江阴市临港新声码利港利中街377号', '孟建林'),
(4959, '320219195910120772', '320200008602551', '江阴市利港彩印厂', '俞伯兴', '6639247', '利港镇', '孟建林'),
(4960, '320219197403220516', '320200100025805', '江阴市晓雅机械厂', '胡建虎', '', '江阴市临港新城利港江市村后江市145号', '孟建林'),
(4961, '32028119920809052201', '320200230023474', '江阴市利港祥悦汽车修理部', '蒋慧萍', '18861628955', '江阴市临港街道利港社区东倪家丹66号', '孟建林'),
(4962, '32021919630921029601', '320200230017132', '江阴市利港天港机械厂', '陈加荣', '13861615659', '江阴市临港街道滨江西路1150号', '孟建林'),
(4963, '32021919761004077X01', '320200100060412', '江阴市利港平瑞机械厂', '耿建军', '', '江阴市临港新城利港陈墅村木闸头27、28号', '孟建林'),
(4964, '32021919721018002801', '320200100089815', '江阴市利港泰盛模具厂', '陈建林', '', '江阴市复试港新城利港陈墅村小朱家丹7号', '孟建林'),
(4965, '32028119670320077201', '320200230017497', '江阴市利港云东机械厂', '缪云鹤', '13806162760', '江阴市临港街道利中街387号', '孟建林'),
(4966, '32021919701101076302', '320200230027068', '江阴市西石桥洪瑞机械厂', '张英', '13906165132', '江阴市镇澄路2517号', '孟建林'),
(4967, '32021919710319079X04', '320200100102634', '江阴市利港晨亚机械厂', '候建坤', '', '江阴市利港西利路112号', '孟建林'),
(4968, '320219196701130514', '320200100069744', '江阴市西石桥许斌五金加工厂', '许维新', '', '江阴市临港新城西石桥社区三宝104号', '孟建林'),
(4969, '22230319650101001901', '320200100091547', '江阴市西石桥军联配载部', '张玉军', '', '江阴市明证港新城利港镇澄路2286号', '孟建林'),
(4970, '32021919660529077X01', '320200100085823', '江阴市利港强昊建材经营部', '黄愉强', '', '江阴市临港新城利港西利路187号', '孟建林'),
(4971, '513027197102173928', '320200100069214', '江阴市利港荣鹏机械厂', '彭光蓉', '86600401', '江阴市临港新城利港镇澄路2518号', '孟建林'),
(4972, '320219197909200790', '320200009213616', '江阴市海云机械厂', '石云', '86102428', '江阴市利港镇巨轮村', '孟建林'),
(4973, '320219195009090515', '320200230014660', '江阴市西石桥鼎茂建材经营部', '许洪华', '13337911786', '江阴市临港街道邮电路29号', '孟建林'),
(4974, '320219196409190798', '320200009214065', '江阴市利港建良线切割加工场', '徐建良', '13961616958', '江阴市利港镇利港村小徐家丹6号', '孟建林'),
(4975, '320219197403180788', '320200009215108', '江阴市利港永福模具厂', '尹美琴', '', '江阴市利港镇黄丹村永福圩48号', '孟建林'),
(4976, '32021919681001077303', '320200100077145', '江阴市利港明洪机械厂', '朱明洪', '', '江阴市临港新城利港仁和村15组', '孟建林'),
(4977, '320682198205276771', '320200100059258', '江阴市西石桥昊驰机械厂', '顾桂宏', '', '江阴市临港新城利港江市社区前江市3号', '孟建林'),
(4978, '320219196908100531', '320200008602222', '江阴市峰锦平板厂', '戴建峰', '6603550', '江阴市西石桥后梅村高家带3号', '孟建林'),
(4979, '32098119800113523X01', '320200100053510', '江阴市利港明磊建材经营部', '石辉明', '', '江阴市临港新城利港兴港路64号', '孟建林'),
(4980, '32021919590217077X', '320200005114472', '江阴市利港兴国钣焊厂', '张惠兴', '6635149', '利港镇', '孟建林'),
(4981, '320219196505280777', '320200100052618', '江阴市利港康南建材经营部', '蒋广华', '', '江阴市临港新城利港兴港路100号', '孟建林'),
(4982, '320219197107070533', '320200100002179', '江阴市振海机械厂', '徐振海', '', '江阴市临港新城利港维常村东双桥6号', '孟建林'),
(4983, '32021919690608077601', '320200230022224', '江阴市利港卫平建材经营部', '秦卫平', '15190362414', '江阴市临港街道贵宾路9号', '孟建林'),
(4984, '320219197409230272', '320200100071634', '江阴春庆机械厂', '徐建庆', '', '江阴市临港新城利港贵宾路东利港村', '孟建林'),
(4985, '320219196409040773', '320200005219267', '江阴市利港德友机械厂', '殷良德', '13921261297', '江阴市临港新城利港西奚墅村东丁墅56号', '孟建林'),
(4986, '320219197311180270', '320200100063034', '江阴市利港贾斯汀机械厂', '金旭东', '', '江阴市临港新城利港贵宾路58号', '孟建林'),
(4987, '320281198905020779', '320200100063862', '江阴市利港君欢机械厂', '赵欢', '', '江阴市临港新城利港利港社区东倪家丹65号', '孟建林'),
(4988, '320219197002180832', '320200100071447', '江阴市利港鼎凯机械厂', '王士龙', '', '江阴市临港新城利港社区严家丹', '孟建林'),
(4989, '32021919680609051201', '320200100112511', '江阴市西石桥振诚机械厂', '胡伟荣', '', '江阴市临港新城利港江市社区前江市54号', '孟建林'),
(4990, '320281198706170774', '320200100076057', '江阴市利港康益机械厂', '宦永飞', '', '江阴市临港新城利港西利路185号', '孟建林'),
(4991, '320219197109190512', '320200100029024', '江阴市栋梁机械厂', '梅栋梁', '', '江阴市临港新城利港苍山村梅家村', '孟建林'),
(4992, '320219197101010767', '320200008601378', '江阴市利港新型建材商行', '徐国芬', '6639860', '江阴市利港镇', '孟建林'),
(4993, '320219196708210760', '320200100073019', '江阴市利港新觉机械厂', '周育人', '', '江阴市临港新城利港利中街270-2号', '孟建林'),
(4994, '32021919760521077001', '320200100086403', '江阴市利港惠荣机械厂', '谢惠', '', '江阴市临港新陈利港西奚墅71号', '孟建林'),
(4995, '320421197412245021', '320200100112545', '江阴市利港美美机械厂', '祝亚妹', '', '江阴市临港新城利港华兴路7号', '孟建林'),
(4996, '320219196110110765', '320200100063036', '江阴市利港朋亿百货商店', '王玲凤', '13915210665', '江阴市临港新城利港利中街152号', '孟建林'),
(4997, '320622197508144337', '320200100065430', '江阴市利港双静建材经营部', '张红星', '', '江阴市临港新城利港西利路159-5号', '孟建林'),
(4998, '32021919750309076301', '320200100102881', '江阴市利港雷欧机械厂', '刘卫瑜', '', '江阴市利港陈墅村小朱家丹7号', '孟建林'),
(4999, '32021919510909052001', '320200230023993', '江阴市西石桥渣沟水泥制品厂', '吴花香', '13806168400', '江阴市临港街道苍山村幸福庄88号', '孟建林'),
(5000, '320219195510110815', '320200005114675', '江阴市利港双立机械设备厂', '缪建国', '6639108', '利港镇利中街142号', '孟建林'),
(5001, '32021919631126076X', '320200009211978', '江阴市丽华珠绣工艺礼品厂', '沈丽华', '6603012', '江阴市西石桥东双桥田肚村', '孟建林'),
(5002, '320219196211170783', '320200100051942', '江阴市利港威庆机械厂', '殷亚芬', '13961625989', '江阴市临港新城利港利港社区盎桥村4号', '孟建林'),
(5003, '32021919730311051201', '320200230014712', '江阴市西石桥龙亭机械厂', '王笑波', '18651003811', '江阴市临港街道维常村西维常1号', '孟建林'),
(5004, '320219197411170520', '320200100032155', '江阴市西石桥韩氏机械厂', '吴董华', '13771261685', '江阴市临港新城利港江市村江市路16号', '孟建林'),
(5005, '320219195903270510', '320200100068775', '江阴市利港明信机械厂', '陈益明', '86630997', '江阴市临港新城利港黄丹村西陇圩6号', '孟建林'),
(5006, '32021919761006051901', '320200230017196', '江阴市利港特胜机械厂', '杨栋大', '13812121012', '江阴市临港街道西奚墅村谢家头', '孟建林'),
(5007, '320219198101060523', '320200100058437', '江阴市利港柏桥机械厂', '盛燕', '', '江阴市临港新城利港利港社区小徐家丹', '孟建林'),
(5008, '320219195412270778', '320200005155890', '江阴市利港双德机械设备配件厂', '霍扣章', '', '江阴市利港镇巨轮村湾里村', '孟建林'),
(5009, '320219197606130772', '320200100065023', '江阴市利港仁龙机械厂', '朱仁龙', '', '江阴市临港新城利港华兴路2号', '孟建林'),
(5010, '320219196603120793', '320200005121468', '江阴市利港富士照相装璜印刷厂', '谢纪国', '6631662', '利港镇中街', '孟建林'),
(5011, '32021919540417079304', '320200230020987', '江阴市利港展华建材经营部', '高华东', '13906169818', '江阴市临港街道西利路239号', '孟建林'),
(5012, '32021919850409028401', '320200100051863', '江阴市绿川机械设备经销部', '谢玲', '', '江阴市临港新城利港滨江路1166号', '孟建林'),
(5013, '320219197204120512', '320200100030675', '江阴市永旺金属制品厂', '张永定', '', '江阴市临港新城利港维常村西维常1号', '孟建林'),
(5014, '320219196005110798', '320200100042197', '江阴市利港香涛机械厂', '王香桃', '', '江阴市临港新城利港黄丹村黄丹街153号', '孟建林'),
(5015, '32021919810324076301', '320200100091343', '江阴市利港东恒机械厂', '王丽娟', '', '江阴市临港新城利港西利路112号', '孟建林'),
(5016, '320219195008010798', '320200005118196', '江阴市利港华亮液压配件厂', '陈义和', '6637649', '江阴市利港镇芦埠港村', '孟建林'),
(5017, '32021919711116077701', '320200100078637', '江阴市西石桥春潮宏伟家具店', '刘国荣', '', '江阴市临港新城利港镇澄路2537', '孟建林'),
(5018, '32021919621013051X', '320200230014690', '江阴市西石桥润科机械厂', '王祖尧', '13961631238', '江阴市临港街道维常村西维常1号', '孟建林'),
(5019, '320219196406230766', '320200100067150', '江阴市利港建登机械厂', '冯建华', '', '江阴市临港新城利港利康东路5号', '孟建林'),
(5020, '320219196301090760', '320200005115717', '江阴市利港信隆金属门窗厂', '季章娣', '6631190', '利港镇兴利三村', '孟建林'),
(5021, '410728198903090076', '320200100093442', '江阴市西石桥一诺园林工艺品商行', '王晓斌', '', '江阴市临港新城利港镇澄路2250号', '孟建林'),
(5022, '32021919670123079301', '320200005114564', '江阴市旭丰电力净化设备厂', '缪正伟', '13961675578', '西义市村', '孟建林'),
(5023, '41232619621009721401', '320200100098651', '江阴市永亮起重运输队', '胡永亮', '', '江阴市临港新城利港利中街351号', '孟建林'),
(5024, '320219197011090775', '320200100037552', '江阴市华鼎烟酒商行', '徐昌余', '13961647668', '江阴市临港新城利港利康路103号', '孟建林'),
(5025, '320219195605080778', '320200100046433', '江阴市利港国艳机械厂', '田国方', '86637375', '江阴市临港新城利港巨轮村邹家丹1号', '孟建林'),
(5026, '320219196301110776', '320200100061682', '江阴市西石桥业成机械厂', '张元新', '', '江阴市临港新城利港西石桥邮电路61号', '孟建林'),
(5027, '320219195710110764', '320200100042191', '江阴市利港鸿江机械厂', '周阿华', '', '江阴市临港新城利港滨江西路1018号', '孟建林'),
(5028, '321282198107094236', '320200100072609', '江阴市利港天鑫机械厂', '丁卫', '', '江阴市临港新城利港利港社区刘墅路1号', '孟建林'),
(5029, '320281198809190778', '320200100100777', '江阴市利港利强机械厂', '戴利峰', '', '江阴市临港新城利港双良路10号', '孟建林'),
(5030, '320882198207303818', '320200100112771', '江阴市利港迅洁汽车美容店', '王国祥', '', '江阴市临港新城利港西利路163号', '孟建林'),
(5031, '32021919720923076101', '320200230019096', '江阴市利港灵达百货店', '钱惠琴', '18761506033', '江阴市临港街道利南街79号', '孟建林'),
(5032, '34242519820911248001', '320200230017302', '江阴市利港福吉百货店', '蔡霞', '18761506033', '江阴市临港街道龙港路15号', '孟建林'),
(5033, '32021919521113077901', '320200230024325', '江阴市利港荣峰铸造机械厂', '何加荣', '13771268698', '江阴市利港镇西奚市村东奚市33号', '孟建林'),
(5034, '32021919740323079X01', '320200100067544', '江阴市利港凯建机械厂', '徐建方', '', '江阴市临港新城利港巨轮村黄丹湾里74号', '孟建林'),
(5035, '32072319760402322X', '320200100062591', '江阴市西石桥学辉机械厂', '于必梅', '', '江阴市临港新城利港镇澄路2509号', '孟建林'),
(5036, '320219196607080776', '320200008602228', '江阴市利港国林五金加工厂', '潘国林', '6639432', '利港镇仁和村复兴圩82号', '孟建林'),
(5037, '320723197812163278', '320200230013818', '江阴市久源机械厂', '于必军', '18795588999', '江阴市利港镇镇澄路2356号', '孟建林'),
(5038, '32021919800221077601', '320200100103596', '江阴市利港奇瑞机械厂', '冯成', '', '江阴市临港街道利港西街115号', '孟建林'),
(5039, '320219197012220826', '320200005111262', '江阴市利港如意家具店', '钱金秀', '13771270688', '江阴市利港镇利中街50号', '孟建林'),
(5040, '320219194812020773', '320200005114666', '江阴市利港海瑞机械厂', '陈宏达', '6631963', '利港镇西安村', '孟建林'),
(5041, '330823197312262314', '320200008601891', '江阴市西石桥澄安消防器材经营部', '毛根土', '6608303', '西石桥镇澄路212号', '孟建林'),
(5042, '32028119900414077801', '320200230016112', '江阴市利吉机械厂', '殷璐', '13961625989', '江阴市临港街道西奚墅村', '孟建林'),
(5043, '32021919700719077301', '320200100067142', '江阴市利港赛卓机械厂', '朱志平', '', '江阴市临港新城利港华兴路2号', '孟建林'),
(5044, '32021919861228076301', '320200100085822', '江阴市利港昊强建材经营部', '黄晓梅', '', '江阴市临港新城利港西路187号', '孟建林'),
(5045, '321024197301015010', '320200100056687', '江阴市多普达五金厂', '施宇峰', '13812156589', '江阴市临港新城利港滨江西路1166号', '孟建林'),
(5046, '320219198306070776', '320200100054045', '江阴市利港弘强机械厂', '缪建强', '', '江阴市临港新城利港巨轮村西方城17号', '孟建林'),
(5047, '320219197412130774', '320200009204110', '江阴市永诚汽车修理厂', '朱其勇', '13961630650', '江阴市利港镇滨江菜场', '孟建林'),
(5048, '320219197212050796', '320200230013799', '江阴市利港华康机械厂', '耿建华', '13915205967', '江阴市临港街道黄丹村中陇圩20号', '孟建林'),
(5049, '41232619861020305401', '320200230025317', '江阴市西石桥鑫顾制衣厂', '张许涛', '15961696977', '江阴市临港街道西石桥人民路196号', '孟建林'),
(5050, '320219197111050519', '320200005206072', '江阴市新航五金厂', '居建新', '', '江阴市临港新城利港习里沟村居家湾30号', '孟建林'),
(5051, '32021919640603078001', '320200100094240', '江阴市利港平磊机械厂', '黄晓英', '', '江阴市临港新城利港巨轮村沟湾里20号', '孟建林'),
(5052, '320219196610070771', '320200005103139', '江阴市利港周庆机械厂', '周庆', '', '江阴市利港镇龙港路西', '孟建林'),
(5053, '32021919560929079901', '320200100087047', '江阴市浩骏机械厂', '何浩明', '', '江阴市临港新城利港西方利路161号', '孟建林'),
(5054, '32021119751003383801', '320200230017178', '江阴市利港特行机械厂', '梅建明', '13906162110', '江阴市临港街道西奚墅村谢家头', '孟建林'),
(5055, '320219197612221769', '320200100042195', '江阴市利港豪翔机械厂', '戴静华', '', '江阴市临港新城利港滨江西路1018号', '孟建林'),
(5056, '320219197510160766', '320200005223992', '江阴市利港骏丰机械厂', '潘秋惠', '13151959776', '利港村徐墅3号', '孟建林'),
(5057, '32021919700323031X', '320200100061679', '江阴市利港祥中机械厂', '束建中', '', '江阴市临港新城利港滨江西路999号', '孟建林'),
(5058, '32068119751107742X', '320200100063973', '江阴市利港康华电动工具商行', '周群', '', '江阴市临港新城利港利港社区缪家丹66号', '孟建林'),
(5059, '320281198911060793', '320200100065021', '江阴市利港江宇机械厂', '朱江', '', '江阴市临港新城利港华兴路2号', '孟建林'),
(5060, '32020219810215004801', '320200100085428', '江阴市仁余建材经营部', '赵香', '', '江阴市临港新城利港黄丹村永乐南圩58号', '孟建林'),
(5061, '32021919751111051701', '320200100102901', '江阴市西石桥繁荣机械厂', '秦万荣', '13812112806', '江阴市临港街道维常村1号', '孟建林'),
(5062, '32021919670710077001', '320200100103610', '江阴市利港天佳机械厂', '张银建', '', '江阴市临港新城利港龙港路8号', '孟建林'),
(5063, '32021919690722051501', '320200100090733', '江阴市利港润杰机械厂', '梅勇兵', '', '江阴市临港新城利港江市社区江市路6号', '孟建林'),
(5064, '32021919690516076602', '320200100060119', '江阴市利港志祥机械厂', '张凤娟', '', '江阴市临港新志利港利港村朱家丹36号', '孟建林'),
(5065, '320421196301125014', '320200100112510', '江阴市利港淦瑞机械厂', '张国才', '', '江阴市临港新城利港镇澄路2518号', '孟建林'),
(5066, '320219197602070530', '320200008602190', '江阴市西石桥名都摩托车行', '章建铭', '6605814', '西石桥北郭庄村章家头', '孟建林'),
(5067, '320219196511140762', '320200100100369', '江阴市利港芳益机械厂', '贾华芳', '15335213913', '江阴市临港新城利港滨江西路800号', '孟建林'),
(5068, '320219196503030029', '320200100041124', '江阴市西石桥赛男线切割加工场', '徐晶玉', '', '江阴市临港新城利港后梅社区前横村49号', '孟建林'),
(5069, '32021919530615055301', '320200230017191', '江阴市西石桥海迅玻璃制品厂', '梅雅清', '13812155513', '江阴市临江街道西石桥社区三宝中路284号', '孟建林'),
(5070, '32020219680329001X', '320200100091355', '江阴市利港凡艺广告材料商行', '吴洪', '', '江阴市临港新城利港兴港路95号', '孟建林'),
(5071, '32021919680612003X', '320200005194368', '江阴市西石桥匡英不锈钢经营部', '匡建贤', '86608170', '江阴市西石桥镇澄路221号', '孟建林'),
(5072, '320219196006040816', '320200005228418', '江阴市隆超机械厂', '吴亚平', '', '江阴市临港新城利港利中街268号', '孟建林'),
(5073, '320219197201210774', '320200100044698', '江阴市西石桥鸿润机械厂', '陈振鸿', '', '江阴市临港新城利港西石桥邮电路61号', '孟建林'),
(5074, '32021919640808078101', '320200100085543', '江阴市利港鑫瑞建材商行', '单南琴', '', '江阴市临港新城兴港路43号', '孟建林'),
(5075, '32021919780309077304', '320200100077131', '江阴市奕盛车业服务部', '夏小龙', '', '江阴市临港新城利港陈墅村小朱家丹35号', '孟建林'),
(5076, '32021919570304077X01', '320200100077286', '江阴市利港伟杰金属制品厂', '张小平', '', '江阴市临港新城利港兴港新村', '孟建林'),
(5077, '320219670521051', '320200005125384', '江阴市东支拆旧厂', '周椅明', '6608895', '江阴市利港镇东支村', '孟建林'),
(5078, '32028119880505076X01', '320200100099755', '江阴市利港楠楠空调设备厂', '殷楠', '', '江阴市临港新城利港兴港新村55幢旁', '孟建林'),
(5079, '320219197209200765', '320200100028443', '江阴市利港利之泉纯净水经营部', '耿学琴', '', '江阴市临港新城利港兴利一村52号', '孟建林'),
(5080, '320219197906030802', '320200100056754', '江阴市利港鑫涛电器修理部', '赵金花', '', '江阴市临港新城利港利康街23号', '孟建林'),
(5081, '320219198101020783', '320200100112515', '江阴市利港杰盈机械厂', '俞丽华', '', '江阴市临港新城利港陈墅村新街', '孟建林'),
(5082, '32021919851210051801', '320200100090457', '江阴市西石桥飞鹏五金经营部', '胡强', '', '江阴市临港新声码利港江市村江市路15号', '孟建林'),
(5083, '32021919710209031601', '320200100087054', '江阴市利港春润机械厂', '徐建春', '', '江阴市临港新城利港华兴路7号', '孟建林'),
(5084, '32021919690125077201', '320200100060967', '江阴市利港浩凯机械厂', '徐国大', '', '江阴市临港新城利港镇利港村', '孟建林'),
(5085, '320219196805070798', '320200008602146', '江阴市利港通江线切割加工场', '叶庆', '', '江阴市利港镇', '孟建林'),
(5086, '320219197108210534', '320200005223055', '江阴市利港门圣门窗厂', '盛建才', '13912456095', '江阴市临港新城利港三宝村三宝村150号', '孟建林'),
(5087, '320219194908120795', '320200008601471', '江阴市利港商业批发部', '李忠', '', '利港镇', '孟建林'),
(5088, '320219196202090773', '320200100051510', '江阴市利港谢加福水产商行', '谢加福', '', '江阴市临港新城利港利康路172号', '孟建林'),
(5089, '320281199108210775', '320200100053616', '江阴市利港迅康机械厂', '田迅', '', '江阴市临港新城利港巨轮村朱庄', '孟建林'),
(5090, '320421196909116925', '320200100070383', '江阴市利港吉伟机械厂', '刘黎红', '', '江阴市临港新城利港利中街367号', '孟建林'),
(5091, '32021919710401026001', '320200230018905', '江阴市西石桥亚伟机械厂', '何亚明', '13057298576', '江阴市临港街道镇澄路2280号', '孟建林'),
(5092, '320219194912240773', '320200230013400', '江阴市利港彩毅五金商行', '朱继业', '86631876', '江阴市临港街道利中街87号', '孟建林'),
(5093, '320281198902220791', '320200100056682', '江阴市利港赵振机械厂', '赵振', '13812173126', '江阴市临港新城利港西奚墅村西奚墅路71号', '孟建林'),
(5094, '320219197906210010', '320200100072124', '江阴市西石桥小潘电瓶车商店', '潘华福', '', '江阴市临港新城利港西石桥公平路30号', '孟建林'),
(5095, '32021919831001079201', '320200230021884', '江阴市利港小郭汽车修理部', '郭亮', '18915255760', '江阴市临港新城利港西安村西兴圩1号', '孟建林'),
(5096, '32021919770527051901', '320200230021290', '江阴市利港华烨冷冻食品经营部', '刘华峰', '13506166526', '江阴市临港新城利港西石桥后梅村前横村175号', '孟建林'),
(5097, '320219196510250820', '320200100067988', '江阴市利港小露建材商行', '孙凤娣', '', '江阴市临港新城利港兴利三村161号', '孟建林'),
(5098, '342626196710174931', '320200100112770', '江阴市利港四合一百货超市', '徐青云', '', '江阴市临港新城利港兴港路139号', '孟建林'),
(5099, '32021919830617076901', '320200230024318', '江阴市利港高格机械厂', '徐娅香', '13961663410', '江阴市利港镇陈墅村陈墅67号', '孟建林'),
(5100, '32062219720710116506', '', '江阴市利港好德蛋糕店', '隋红星', '18961216058', '江阴市临港街道利南街130号', '孟建林'),
(5101, '320219197010220777', '320200100053620', '江阴市利港飞腾机械厂', '徐玉明', '15961511899', '江阴市临港新城利港贵宾路22号', '孟建林'),
(5102, '32021919731108076301', '320200100090275', '江阴市利港永明机械厂', '黄咏琴', '13222898885', '江阴市临港新城利港贵宾路22号', '孟建林'),
(5103, '32021919751022076501', '320200100087638', '江阴市利港锦安机械厂', '张亚', '86639058', '江阴市临港新城利港轮村西野塘20号', '孟建林'),
(5104, '320219195610090778', '320200005114629', '江阴市利港朱庄电器配件厂', '周云', '6631795', '利港镇巨轮村', '孟建林'),
(5105, '32040419610529101903', '320200230022000', '江阴市利港吉圣机械厂', '孙兴明', '13515256138', '江阴市临港街道西利路213号', '孟建林'),
(5106, '51090219910615845901', '320200100055756', '江阴市利港顶立服装经营部', '丁力', '', '江阴市临港新城利港兴利居委长征路66号', '孟建林'),
(5107, '320281198901030793', '320200230013795', '江阴市利港启铭机械厂', '倪鹏飞', '13585050349', '江阴市临港街道滨江西路939号', '孟建林'),
(5108, '32021919760521029501', '320200100086461', '江阴市利港龙英机械厂', '王成龙', '', '江阴市临港新城利港滨江西路818号', '孟建林'),
(5109, '32021919780205101901', '320200100051516', '江阴市华豪施工设备服务部', '华良', '', '江阴市临港新城利港维常村西维常1号', '孟建林'),
(5110, '32021919770308076201', '320200100077127', '江阴市利港优驰汽车服务部', '张卫利', '', '江阴市临港新利港兴港路273号', '孟建林'),
(5111, '342523198407113719', '320200100090749', '江阴市利港燎琳机械厂', '陈双阳', '', '江阴市临港新城利港华兴路7号', '孟建林'),
(5112, '320219195208040780', '320200005184539', '江阴市利港平安机械厂', '焦亚芳', '', '江阴市临港新城利港利康西路188号', '孟建林'),
(5113, '32102419780615422701', '', '江阴市利港小贾汽车修理部', '朱萍', '13812598689', '江阴市临港街道兴港路68号', '孟建林'),
(5114, '320219198612130773', '320200100055740', '江阴市利港地长机械厂', '黄鑫', '15995309101', '江阴市临港新城利港黄丹村闸东村18号', '孟建林'),
(5115, '320219198102240518', '320200100041120', '江阴市西石桥晨祥机械厂', '郭伟力', '', '江阴市临港新城利港镇澄路2580号', '孟建林'),
(5116, '320219196501010534', '320200100056827', '江阴市裕新空调技术服务部', '沈建兴', '', '江阴市临港新城利港西石桥北街43号', '孟建林'),
(5117, '320219196908260770', '320200008602145', '江阴市利港利峰电动门窗厂', '王建峰', '6639208', '利港镇陈市村陈市1号', '孟建林'),
(5118, '32021919690916076301', '320200100091354', '江阴市利港恒飞机械厂', '方素琴', '', '江阴市临港新城利港滨江西方路1088号', '孟建林'),
(5119, '32021919810108076X', '320200100064444', '江阴市利港烨鑫五金商行', '陈晓烨', '', '江阴市临港新城利港社区严家丹29号', '孟建林'),
(5120, '320219196409180776', '320200100021696', '江阴市昊明机械厂', '王耀兴', '13812585521', '江阴市临港新城利港西奚墅村薛家丹62号', '孟建林'),
(5121, '32021919740127077101', '320200230024686', '江阴市利港润锦机械厂', '何金平', '13961602119', '江阴市临港街道华兴路5号', '孟建林'),
(5122, '32021919790130054301', '', '江阴市西石桥芬纳机械厂', '江海英', '13806168400', '江阴市临港街道幸福庄88号', '孟建林'),
(5123, '320219197206030764', '320200100041329', '江阴市利港茂国机械厂', '奚新华', '', '江阴市临港新城利港西街115号', '孟建林'),
(5124, '320219195705220774', '320200008602281', '江阴市利港明达五金钣焊厂', '何志明', '6634692', '利港镇刘墅村西刘市', '孟建林'),
(5125, '320219196011160521', '320200100068776', '江阴市利港顺妹机械厂', '张顺妹', '86630660', '江阴市临港新城利港黄丹村西陇圩6号', '孟建林'),
(5126, '320219197904060792', '320200005213521', '江阴市得风汽车维修服务部', '张志刚', '13921200554', '江阴市临港新城利港利港社区高家丹32号', '孟建林'),
(5127, '32021919710518029601', '320200100089717', '江阴市利港高明机械厂', '高金明', '13914271911', '江阴市临港新城利港华兴路3号', '孟建林'),
(5128, '41130219800102314401', '320200100087430', '江阴市利港益禄机械厂', '金冬月', '', '江阴市临港新城利港西利路187号', '孟建林'),
(5129, '32021919721227078001', '320200230016840', '江阴市利港康净净化设备厂', '林红霞', '13812121535', '江阴市临港街道巨轮村邹家丹2号', '孟建林'),
(5130, '320219196112110777', '320200100068779', '江阴市苏飞机械厂', '郑南平', '', '江阴市临港新城利港巨轮村沟湾里9号', '孟建林'),
(5131, '34212419720910332501', '320200100103598', '江阴市利港王敏机械厂', '王敏', '', '江阴市临港新城利港华兴路9号', '孟建林'),
(5132, '320219197103140514', '320200100112551', '江阴市利港琴珍机械厂', '许岳良', '', '江阴市临港新城利港华兴路7号', '孟建林'),
(5133, '32021919480311001301', '320200230019962', '江阴市西石桥宏德玻璃经营部', '徐三贤', '15961511879', '江阴市临港街道西石桥南街48号', '孟建林'),
(5134, '32021919500924051X', '320200009215865', '苏果超市西石桥店', '周根大', '6601051', '西石桥人民路113号', '孟建林'),
(5135, '32021919610701077102', '320200100102879', '江阴市利港三清机械厂', '徐产良', '', '江阴市临港街道西利路161号', '孟建林'),
(5136, '320219197507110768', '320200230015456', '江阴市利港耀琴机械厂', '江琴凤', '15961515377', '江阴市临港街道西奚墅社区', '孟建林'),
(5137, '32028119890926079601', '320200230018600', '江阴市利港晓刚汽车维修部', '陈晓刚', '13812142909', '江阴市临港街道利港社区严家丹28号', '孟建林'),
(5138, '320219197608040519', '320200100045145', '江阴市西石桥建益机械厂', '夏建国', '86605761', '江阴市港新城利港镇澄路2355号', '孟建林'),
(5139, '320219194802150515', '320200100049024', '江阴市西石桥龚家粮油店', '徐金荣', '15061775250', '江阴市临港新城利港苍山村龚家1号', '孟建林'),
(5140, '32021919440906076701', '320200100026292', '江阴市利港鑫满物资经营部', '冯菊凤', '', '江阴市临港新城利港兴港路82号', '孟建林'),
(5141, '320219197111220557', '320200100060969', '江阴市西石桥兴普机械厂', '王惠民', '86600918', '江阴市临港新城利港维常村西维常1号', '孟建林'),
(5142, '320281198910100773', '320200100115414', '江阴市利港优德机械厂', '朱兵', '', '江阴市临港新城利港龙港路11号', '孟建林'),
(5143, '32021919601211077X', '320200100071441', '江阴市利港海华机械厂', '朱卫成', '', '江阴市临港新城利港贵宾路东侧', '孟建林'),
(5144, '32021919700929052401', '320200100039001', '江阴市西石桥好卖特百货超市', '陆惠英', '', '江阴市临港新城利港西石桥人民路95-28号', '孟建林'),
(5145, '320219197206280798', '320200005199956', '江阴市西石桥双誉空调服务部', '夏雷君', '', '江阴市临港新城利港镇澄路2363号', '孟建林'),
(5146, '32021919810806027801', '320200100101876', '江阴市利港贝宁机械厂', '吉建兴', '', '江阴市临港新城利港利中街387号', '孟建林'),
(5147, '320921197608105992', '320200100066568', '江阴市杰润机械设备经营部', '顾德兵', '', '江阴市临港新城利港西石桥公平路79号', '孟建林'),
(5148, '32021919760214152X01', '320200100101872', '江阴市利港鸿志机械厂', '蒋海英', '', '江阴市临港新城利港滨江西路812号', '孟建林'),
(5149, '32021919581011079601', '320200100092415', '江阴市利港美奇机械厂', '缪志强', '86092150', '江阴市临港新城利港利康东路15号', '孟建林'),
(5150, '32021919760308076501', '320200230024690', '江阴市利港润舟机械厂', '徐霞', '13812588437', '江阴市临港街道华兴路5号', '孟建林'),
(5151, '32021919781016076801', '320200100100051', '江阴市利港雅风阁喜事婚庆坊', '霍艰奋', '', '江阴市临港新城利港利康路194号', '孟建林'),
(5152, '320219196110150775', '320200005190146', '江阴市利港祥平机械厂', '黄明祥', '', '江阴市临港新城利港延安村龙圩97号', '孟建林'),
(5153, '32021919770624051401', '320200100085671', '江阴市佳伟机械厂', '蔡建伟', '', '江阴市临港新城利港江市村江市路15号', '孟建林'),
(5154, '320219196808290796', '320200100077141', '江阴市利港红岚机械厂', '徐军', '', '江阴市临港新城抻港滨江西路915号', '孟建林'),
(5155, '320219195410020513', '320200009213772', '江阴市西石桥天光玻璃仪器厂', '梅连方', '6605815', '西石桥中心小学', '孟建林'),
(5156, '320219196509170524', '320200100093445', '江阴市西石桥骏秀园林工艺品商行', '孙秀娣', '', '江阴市临港新城利港镇澄路路2250号', '孟建林'),
(5157, '320219197402170510', '320200009214069', '江阴市西石桥庆良五金机械厂', '梅庆良', '8660689', '江阴市西石桥寺背后11队14号', '孟建林'),
(5158, '32021919790411077X', '320200100112773', '江阴市利港文博百货店', '沈龙', '', '江阴市临港新城利港利南街176-4号', '孟建林'),
(5159, '32028119910718077201', '320200230017181', '江阴市利港佳奇机械厂', '钱佳强', '13921258184', '江阴市临港街道巨轮村西野塘20号', '孟建林'),
(5160, '320219195708110781', '320200100031865', '江阴市利港天磊机械厂', '朱婉英', '', '江阴市临港新城利港华兴路2号', '孟建林'),
(5161, '32021919541221053X', '320200005185596', '江阴市利港宏达服饰工艺厂', '孙华成', '6606158', '利港镇澄西私营工业园', '孟建林'),
(5162, '32021919520327051X', '320200100067278', '江阴市远天机械厂', '郭连兴', '', '江阴市临港新城利港镇澄路2580号', '孟建林'),
(5163, '32021919790511053601', '320200230022543', '江阴市西石桥刚志机械厂', '袁志刚', '15852656081', '江阴市临港街道江市社区江市路20号', '孟建林'),
(5164, '32021919630915077202', '320200100064251', '江阴市利港双陆水产商行', '陆道平', '', '江阴市临港新城利港利康路111号', '孟建林'),
(5165, '32021919740421053901', '', '江阴市西石桥郎福机械设备维修部', '王忠伟', '13701526700', '江阴市临港街道公平路38号', '孟建林'),
(5166, '32021919691016077901', '320200100079057', '江阴市利港宇腾机械厂', '李军', '', '江阴市临港新城利港陈墅村五寨沟68号', '孟建林'),
(5167, '32028119871010079501', '320200100102636', '江阴市利港长俊建材商行', '翟林华', '13771229775', '江阴市临港新城利港利康路179号', '孟建林'),
(5168, '32021919800319076201', '320200230020026', '江阴市利港文杉机械厂', '许珍勤', '15950115384', '江阴市临港街道利港社区刘墅路60号', '孟建林'),
(5169, '32021919560824079X', '320200008601440', '江阴市利港东方照相服务部', '谢纪平', '6631691', '江阴市利港镇', '孟建林');
INSERT INTO `tp_upload_people` (`id`, `shui_hao`, `management_num`, `shui_ming`, `name`, `phone`, `address`, `management`) VALUES
(5170, '32021919770706076901', '320200100102633', '江阴市利港浩瑞机械厂', '顾红妹', '', '江阴市临港新城利港利中街391号', '孟建林'),
(5171, '15210419711012411701', '320200100102890', '江阴市利港巨贸机械厂', '张俊', '', '江阴市临港新城利港贵宾路22号', '孟建林'),
(5172, '320219196411180521', '320200100026601', '江阴市西石桥创业玻璃仪器厂', '周娟', '', '江阴市临港新城利港西石桥社区三宝村284号', '孟建林'),
(5173, '44060219750407001001', '320200230020715', '江阴市利港旭智机械厂', '许汝清', '15852589438', '江阴市临港街道贵宾路58号', '孟建林'),
(5174, '32028119900417079001', '320200100098275', '江阴市利港周峰机械厂', '周峰', '', '江阴市临港新城利港滨江西路812号', '孟建林'),
(5175, '320219194909260511', '320200005106157', '江阴市西石桥实验玻璃仪器厂', '殷才荣', '6602162', '西石桥苍山村', '孟建林'),
(5176, '320219195110210534', '320200100098786', '江阴市利港欣利劳务服务部', '赵国兴', '', '江阴市临港新城利港西石桥南街166号', '孟建林'),
(5177, '320219196307020261', '320200100065308', '江阴市利港楚安机械厂', '时建亚', '', '江阴市临港新城利港贵宾路58号', '孟建林'),
(5178, '32028119920304077X', '320200100045486', '江阴市利港栋旭机械厂', '吴旭栋', '', '江阴市临港新城利港华兴路6号', '孟建林'),
(5179, '320219195305080776', '320200005106043', '江阴市利港浩定建筑门窗厂', '闵浩定', '13961699612', '利港镇南街35号', '孟建林'),
(5180, '32021919620309076701', '320200100092406', '江阴市利港奇顺机械厂', '徐华珍', '18915232609', '江阴市临港新城利港严家丹30号', '孟建林'),
(5181, '32021919820719077201', '320200230019501', '江阴市利港广金机械厂', '施正祥', '13812579083', '江阴市临港街道龙港路11号', '孟建林'),
(5182, '32021919800719079401', '320200230019269', '江阴市利港乔庆机械厂', '乔庆', '13771615526', '江阴市临港街道滨江西路1089号', '孟建林'),
(5183, '32021919710308004803', '320200100100266', '江阴市大明制刷厂', '刘春英', '', '江阴市临港新城璜土镇璜土村西方贯庄74号', '孟建林'),
(5184, '34082719790529002701', '320200230018907', '江阴市利港明娟钢结构件厂', '李明娟', '18861626185', '江阴市临港街道镇澄路2789号', '孟建林'),
(5185, '32021919651219077X', '320200100060135', '江阴市利港利瑞机械厂', '施键', '86639835', '江阴市临港新城利港龙港8号', '孟建林'),
(5186, '32021919811228027301', '320200100078638', '江阴市西石桥春潮宏博家具店', '许晓冬', '', '江阴市临港新城利港镇澄路2537号', '孟建林'),
(5187, '51090219751201820901', '320200100053671', '江阴市利港君禾劳保用品经营部', '丁利君', '', '江阴市临港新城利港镇澄路298号', '孟建林'),
(5188, '320219197110090295', '320200100065425', '江阴市利港文君机械厂', '梁建文', '', '江阴市临港新城利港巨轮村戴家丹', '孟建林'),
(5189, '32021919590209076101', '320200100090839', '江阴市利港贝佳电子商行', '刘琴婉', '', '江阴市临港新城利港利康东路9号', '孟建林'),
(5190, '320219196212100787', '320200100057090', '江阴市利港锋博五金电器厂', '杨冬妹', '', '江阴市临港新城利港利康东路9号', '孟建林'),
(5191, '320219195304100528', '', '江阴市浩欣汽车服务部', '黄理花', '', '江阴市临港新城利港镇澄路2368号', '孟建林'),
(5192, '32021919740910076901', '320200100098278', '江阴市利港永杰汽车服务部', '陆凤娣', '', '江阴市临港新城利港滨江西路990号', '孟建林'),
(5193, '32021919490805077401', '320200100090276', '江阴市利港明金机械厂', '周焕根', '', '江阴市临港新城利港贵宾路22号', '孟建林'),
(5194, '320219195309300537', '320200005206082', '江阴市西石桥东剑机械厂', '王兆进', '86605561', '江阴市临港新城利港维常村水产场1号', '孟建林'),
(5195, '32021919780228076X', '320200009215779', '江阴市永瑞机械厂', '周亚萍', '86639299', '江阴市利港镇巨轮村朱庄8组62号', '孟建林'),
(5196, '320219197811260779', '320200005185152', '江阴市利港俊宇机械厂', '王俊', '13912456853', '利港陈墅村陈墅67号', '孟建林'),
(5197, '320219196903070767', '320200100100365', '江阴市利港文菲机械厂', '徐文娅', '', '江阴市临港新城利港利港社区东倪家丹58号', '孟建林'),
(5198, '320219197511120512', '320200100020853', '江阴市西石桥宏健机械厂', '曹如松', '', '江阴市临港新城利港苍山村洗菜沟39号', '孟建林'),
(5199, '32021919741007029601', '320200100089433', '江阴市利港湖光机械厂', '刘建荣', '', '江阴市临港新城利港西奚墅71号', '孟建林'),
(5200, '32021919810915051501', '320200100100799', '江阴市利港耀博机械厂', '吴国伟', '', '江阴市临港新城利港陈墅村五寨沟68号', '孟建林'),
(5201, '32021919800821052301', '320200230018810', '江阴协业空调技术服务部', '刘琼', '18915227506', '江阴市临港街道西利路157-1号', '孟建林'),
(5202, '32021919700802077601', '320200230027072', '江阴市利港仁利机械厂', '冯国平', '15960125126', '江阴市临港街道滨江西路1150号', '孟建林'),
(5203, '32021919650905078403', '', '江阴市利港常翔机械厂', '盛爱萍', '18121501790', '江阴市临港街道利港西街35号', '孟建林'),
(5204, '32021919781008055701', '', '江阴市利港晟郡电气经营部', '施湘军', '13812163529', '江阴市临港街道利港农贸市场66号', '孟建林'),
(5205, '320281000000502', '320200100095531', '江阴市利港镇委托代征工作站', '利港镇', '', '江阴市利港镇委托代征工作站', '孟建林'),
(5206, '32021919560823103301', '320200230027299', '江阴市申港白鹿电气设备厂', '龚兴云', '13771615680', '江阴市申港街道申新路22号', '许荣忠'),
(5207, '32132319840623531301', '320200230028029', '江阴市申港思维金属制品经营部', '赵各', '13218766662', '江阴市申港街道申南村张家村57号', '许荣忠'),
(5208, '32128119910821697701', '320200230028228', '江阴市申港霖丰润滑油经营部', '', '', '', ''),
(5209, '32128119910821697701', '320200230028228', '江阴市申港霖丰润滑油经营部', '王秀山', '13306191071', '江阴市临港街道申南村前河142号', '许荣忠'),
(5210, '51293019670725527401', '320200230027943', '江阴市申港元华石材加工部', '王在元', '13151953088', '江阴市临港新城申港镇澄路1475号', '许荣忠');

-- --------------------------------------------------------

--
-- 表的结构 `tp_upload_shop`
--

CREATE TABLE IF NOT EXISTS `tp_upload_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `sui_hao` varchar(50) NOT NULL,
  `sui_ming` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `money` decimal(50,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=259 ;

--
-- 转存表中的数据 `tp_upload_shop`
--

INSERT INTO `tp_upload_shop` (`id`, `uid`, `sui_hao`, `sui_ming`, `name`, `phone`, `money`) VALUES
(251, 19, '320219196102181010', '江阴市申港西达文具经营部', '陈新国', '13806163785', '600.000'),
(252, 19, '320219198211201024', '江阴市申港丰旗机械厂', '缪丹萍', '13301528555', '772.000'),
(253, 19, '511024660817325000', '江阴市申港钢丝网络厂', '倪念良', '13506166109', '600.000'),
(254, 19, '320219197403191014', '江阴市申港镇广源喷塑厂', '黄勇权', '13921211757', '772.000'),
(255, 19, '362330197101091758', '江阴市申港伟平家具商行', '周正春', '13093025189', '810.600'),
(256, 19, '32028119880309102301', '江阴市晟伟建筑机械经营部', '徐晶', '13901524830', '672.000'),
(258, 19, '32021919780401103701', '江阴市临港制盖厂', '张伟', '13812115056', '965.000');

-- --------------------------------------------------------

--
-- 表的结构 `tp_upyun_attachement`
--

CREATE TABLE IF NOT EXISTS `tp_upyun_attachement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `url` varchar(160) NOT NULL,
  `code` varchar(10) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_user`
--

CREATE TABLE IF NOT EXISTS `tp_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `role` smallint(6) unsigned NOT NULL COMMENT '组ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1:启用 0:禁止',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `last_login_time` int(11) unsigned NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `last_location` varchar(100) DEFAULT NULL COMMENT '最后登录位置',
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(90) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `tp_user`
--

INSERT INTO `tp_user` (`id`, `username`, `password`, `role`, `status`, `remark`, `last_login_time`, `last_login_ip`, `last_location`, `phone`, `email`) VALUES
(1, 'admin', 'b80c4de605487af2bf83a7cbd1d68025', 5, 1, '', 1415864253, '127.0.0.1', '', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_userinfo`
--

CREATE TABLE IF NOT EXISTS `tp_userinfo` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_users`
--

CREATE TABLE IF NOT EXISTS `tp_users` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `tp_users`
--

INSERT INTO `tp_users` (`id`, `gid`, `username`, `password`, `email`, `createtime`, `lasttime`, `status`, `createip`, `lastip`, `diynum`, `activitynum`, `card_num`, `card_create_status`, `wechat_card_num`, `money`, `viptime`, `connectnum`, `lastloginmonth`, `belonguser`, `headerpic`, `contact`, `phone`, `address`) VALUES
(6, 2, 'user', 'e10adc3949ba59abbe56e057f20f883e', '111', '1402728056', '1416273591', '1', '58.246.228.194', '127.0.0.1', 0, 0, 0, 0, 1, 0, '1434211200', 0, 11, 1, '', '临港经济开发区', '0510—86868123', '江阴临港经济开发区中央商务区珠江路198号'),
(17, 2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', '', '1411541153', '1', '', '10.20.10.180', 0, 0, 0, 0, 0, 0, '1436457600', 0, 9, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_user_address`
--

CREATE TABLE IF NOT EXISTS `tp_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `sheng` varchar(50) DEFAULT NULL,
  `shi` varchar(50) DEFAULT NULL,
  `qu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tp_user_address`
--

INSERT INTO `tp_user_address` (`id`, `uid`, `consignee`, `address`, `mobile`, `sheng`, `shi`, `qu`) VALUES
(1, 27, '去去去', '我问问', '1234567890', '北京市', '市辖区', '东城区'),
(2, 1, 'asdf', 'sdfsdf', '15358568456', '天津市', '市辖区', '和平区');

-- --------------------------------------------------------

--
-- 表的结构 `tp_user_bind`
--

CREATE TABLE IF NOT EXISTS `tp_user_bind` (
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(60) NOT NULL,
  `keyid` varchar(100) NOT NULL,
  `info` text NOT NULL,
  KEY `uid` (`uid`),
  KEY `uid_type` (`uid`,`type`),
  KEY `type_keyid` (`type`,`keyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_user_follow`
--

CREATE TABLE IF NOT EXISTS `tp_user_follow` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `follow_uid` int(10) unsigned NOT NULL COMMENT '被关注者ID',
  `add_time` int(10) unsigned NOT NULL,
  `mutually` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`follow_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_user_group`
--

CREATE TABLE IF NOT EXISTS `tp_user_group` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `tp_user_group`
--

INSERT INTO `tp_user_group` (`id`, `name`, `diynum`, `connectnum`, `iscopyright`, `activitynum`, `price`, `statistics_user`, `create_card_num`, `wechat_card_num`, `status`) VALUES
(2, '前台用户', 10000, 10000, 1, 1000, 150, 0, 10000, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_user_msgtip`
--

CREATE TABLE IF NOT EXISTS `tp_user_msgtip` (
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:关注，2:提到，3:私信，4:通知',
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_user_request`
--

CREATE TABLE IF NOT EXISTS `tp_user_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(30) NOT NULL,
  `uid` varchar(32) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `msgtype` varchar(15) NOT NULL DEFAULT 'text',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msgtype` (`msgtype`),
  KEY `token` (`token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_user_request`
--

INSERT INTO `tp_user_request` (`id`, `token`, `uid`, `keyword`, `msgtype`, `time`) VALUES
(1, 'kaybwr1401157066', 'o0l1jt4acdGn3fJf8YQFE-iw70rg', '121.599998,31.254700', 'location', 1401353615);

-- --------------------------------------------------------

--
-- 表的结构 `tp_user_stat`
--

CREATE TABLE IF NOT EXISTS `tp_user_stat` (
  `uid` int(10) unsigned NOT NULL,
  `action` varchar(20) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  UNIQUE KEY `uid_type` (`uid`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tp_user_wetall`
--

CREATE TABLE IF NOT EXISTS `tp_user_wetall` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_voiceresponse`
--

CREATE TABLE IF NOT EXISTS `tp_voiceresponse` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_weather`
--

CREATE TABLE IF NOT EXISTS `tp_weather` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `code` char(9) NOT NULL,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2502 ;

--
-- 转存表中的数据 `tp_weather`
--

INSERT INTO `tp_weather` (`id`, `code`, `name`) VALUES
(1, '101010100', '北京');

-- --------------------------------------------------------

--
-- 表的结构 `tp_wechawall_api`
--

CREATE TABLE IF NOT EXISTS `tp_wechawall_api` (
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

--
-- 转存表中的数据 `tp_wechawall_api`
--

INSERT INTO `tp_wechawall_api` (`token`, `email`, `url`, `password`, `descr`, `imgurl`, `tdcode`) VALUES
('labnkv1398317973', '', '', '', '', '', 'http://www.slweinxin.com/Uploads/image/20140514/53737957f2104.jpg'),
('kwgucc1400132373', '', '', '', '', '', 'http://www.slweinxin.com/Uploads/image/20140515/537461d5ef474.jpg'),
('eylytk1400162961', '', '', '', '', 'http://www.slweinxin.com/Uploads/image/20140515/5374e03a56bcb.jpg', 'http://www.slweinxin.com/Uploads/image/20140515/5374ced804ca9.jpg'),
('kaybwr1401157066', '000', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_wecha_shop`
--

CREATE TABLE IF NOT EXISTS `tp_wecha_shop` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `tp_wecha_shop`
--

INSERT INTO `tp_wecha_shop` (`id`, `name`, `tokenTall`, `weName`, `credit`, `headurl`, `HaveReal`, `title`, `keywords`, `descr`, `twodcode`, `status`, `closeReason`, `licence`, `address`, `phone`, `logo`) VALUES
(1, '小助手', 'labnkv1398317973', '小助手', 1, './tpl/User/default/common/images/portrait.jpg', 0, '', '', '', '/wxshoppingmall/SRC/Uploads/image/20140503/536473f738ccd.png', 1, '', NULL, NULL, '021-1234567', '/wxshoppingmall/SRC/Uploads/image/20140503/536473efe6e3e.png'),
(2, '86男装街', '', NULL, 0, '__PARENTURL__/tpl/User/default/common/images/portrait.jpg', 0, '微信商城店铺', '微信商城店铺', '微信商城店铺', '/Uploads/image/20140510/536e2c570e7cb.jpg', 1, NULL, NULL, NULL, '0571-879010', '/Uploads/image/20140510/536e2c30e7beb.jpg'),
(3, '86男装街', 'rmzthc1399729257', '86男装街', 0, './tpl/User/default/common/images/portrait.jpg', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(4, '微电影推广发行', 'tejdsg1399856577', '微电影推广发行', 0, './tpl/User/default/common/images/portrait.jpg', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(5, '青岛松日', 'kwgucc1400132373', '青岛松日', 0, './tpl/User/default/common/images/portrait.jpg', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(6, '青岛圣豪', 'eylytk1400162961', '青岛圣豪', 0, './tpl/User/default/common/images/portrait.jpg', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(7, '彩虹色', 'kaybwr1401157066', '彩虹色', 0, './tpl/User/default/common/images/portrait.jpg', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(8, '江阴临港协税护税', 'pjeupf1402729544', '江阴临港协税护税', 0, './tpl/User/default/common/images/portrait.jpg', 0, NULL, NULL, NULL, '/Uploads/image/20140614/539c0ea13294b.jpg', 1, NULL, NULL, NULL, '0510—868681', '/Uploads/image/20140614/539c0e96736e4.png');

-- --------------------------------------------------------

--
-- 表的结构 `tp_wecha_user`
--

CREATE TABLE IF NOT EXISTS `tp_wecha_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(60) NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  PRIMARY KEY (`token`,`wecha_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_wecha_wall_xunlie`
--

CREATE TABLE IF NOT EXISTS `tp_wecha_wall_xunlie` (
  `id` varchar(29) NOT NULL,
  `token` varchar(20) DEFAULT NULL,
  `right` char(1) DEFAULT 'X'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `tp_weixin_vote`
--

CREATE TABLE IF NOT EXISTS `tp_weixin_vote` (
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

--
-- 转存表中的数据 `tp_weixin_vote`
--

INSERT INTO `tp_weixin_vote` (`token`, `name`, `res`, `gameOverFlag`, `heardUrl`, `tokenTall`, `tel`) VALUES
('o3IQEuLF6g9MJmW2Kwnau5ACjNdw', '欢迎您', 0, 'Y', 'hi', 'eeiyik1395720221', NULL),
('o3IQEuM4iJ7D_hebANOQ9ubUG-8g', '到', 0, 'Y', 'hi', 'eeiyik1395720221', '来'),
('oGLUPt0xSLmdrpACFma23XbX4YIg', '吕先生', 0, 'Y', 'hi', 'kwgucc1400132373', '18661618725');

-- --------------------------------------------------------

--
-- 表的结构 `tp_wxpay`
--

CREATE TABLE IF NOT EXISTS `tp_wxpay` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `tp_wxpay`
--

INSERT INTO `tp_wxpay` (`id`, `tokenTall`, `wxname`, `appId`, `paySignKey`, `appSecret`, `partnerId`, `partnerKey`, `notify_url`, `success_url`, `fail_url`, `cancel_url`) VALUES
(3, 'labnkv1398317973', '淘天天', '', '', '', '', '', 'http://www.ttiangou.com/weTall/wxpay/notify_url.php', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_wxpay_alarm`
--

CREATE TABLE IF NOT EXISTS `tp_wxpay_alarm` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_wxpay_alarm`
--

INSERT INTO `tp_wxpay_alarm` (`id`, `appid`, `errortype`, `description`, `alarmcontent`, `timestamp`, `appsignature`, `signmethod`, `status`) VALUES
(1, '1', '1', '1', '1', '1', '1', '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_wxpay_history`
--

CREATE TABLE IF NOT EXISTS `tp_wxpay_history` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_wxpay_rights`
--

CREATE TABLE IF NOT EXISTS `tp_wxpay_rights` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_wxpay_rights`
--

INSERT INTO `tp_wxpay_rights` (`id`, `openid`, `appid`, `timestamp`, `msgtype`, `feedbackid`, `transid`, `reason`, `solution`, `extinfo`, `appsignature`, `signmethod`, `picurl`, `status`) VALUES
(1, '11', '1', '1', 'request', '1', '1', '1', '1', '1', '1', '1', '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_wxuser`
--

CREATE TABLE IF NOT EXISTS `tp_wxuser` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `tp_wxuser`
--

INSERT INTO `tp_wxuser` (`id`, `uid`, `wxname`, `wxid`, `weixin`, `headerpic`, `token`, `province`, `city`, `qq`, `wxfans`, `typeid`, `typename`, `tongji`, `allcardnum`, `cardisok`, `yetcardnum`, `totalcardnum`, `createtime`, `tpltypeid`, `updatetime`, `tpltypename`, `tpllistid`, `tpllistname`, `tplcontentid`, `tplcontentname`, `color_id`) VALUES
(8, 6, '江阴临港协税护税', 'gh_67ac5743339f', 'jylgxieshuihushui', '/Uploads/image/20140909/540ec00a8d24e.jpg', 'pjeupf1402729544', '江苏', '江阴', '2992492630@qq.com', 0, 8, '服务', '', 0, 0, 0, 0, '1402729589', '1', '1410252811', 'ty_index', '1', 'yl_list', '1', 'ktv_content', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_xitie`
--

CREATE TABLE IF NOT EXISTS `tp_xitie` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_yuyue`
--

CREATE TABLE IF NOT EXISTS `tp_yuyue` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_yuyue_order`
--

CREATE TABLE IF NOT EXISTS `tp_yuyue_order` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_zhufu`
--

CREATE TABLE IF NOT EXISTS `tp_zhufu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xid` int(11) NOT NULL,
  `wecha_id` varchar(60) NOT NULL,
  `token` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `phone` varchar(30) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
