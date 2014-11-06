-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2014 年 11 月 06 日 11:39
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
  `arrchildid` text NOT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `outlinkurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `tp_category`
--

INSERT INTO `tp_category` (`id`, `catname`, `linkurl`, `level`, `parentid`, `arrparentid`, `arrchildid`, `picurl`, `outlinkurl`) VALUES
(1, '手机', ' www.shouji.com', 1, 0, '0', '1,3,5', 'aa', NULL),
(2, '蔬菜', 'www.shucai.com', 2, 0, '0', '2,4,6', 'bb', NULL),
(3, 'apple', 'www.linkurl.com', 1, 1, '0,1', '3', 'vv', NULL),
(4, '菠菜', 'www.bocai.com', 1, 2, '0,2', '4', 'cc', NULL),
(5, '三星', 'www.sanxing.com', 2, 1, '0,1', '5', 'dd', NULL),
(6, '空心菜', 'www.kongxin.com', 2, 2, '0,2', '6', 'ee', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
