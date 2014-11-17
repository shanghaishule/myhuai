--2014.11.17--
ALTER TABLE  `tp_article_new` CHANGE  `add_time`  `add_time` INT( 10 ) NOT NULL ;

ALTER TABLE  `tp_function` CHANGE  `actname`  `actname` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'index';

INSERT INTO `tp_function` (`id`, `gid`, `usenum`, `name`, `funname`, `actname`, `info`, `isserve`, `status`, `belonguser`, `funtype`, `funcolor`, `havenext`) VALUES
(577, 2, 0, '营业数据', 'Business_data', 'index', '营业数据', 1, 1, 1, '商家管理', '', '否');




