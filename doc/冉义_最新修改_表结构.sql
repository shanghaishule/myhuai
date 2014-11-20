--2014.11.17--
ALTER TABLE  `tp_article_new` CHANGE  `add_time`  `add_time` INT( 10 ) NOT NULL ;

ALTER TABLE  `tp_function` CHANGE  `actname`  `actname` VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'index';

INSERT INTO `tp_function` (`id`, `gid`, `usenum`, `name`, `funname`, `actname`, `info`, `isserve`, `status`, `belonguser`, `funtype`, `funcolor`, `havenext`) VALUES
(577, 2, 0, '营业数据', 'Business_data', 'index', '营业数据', 1, 1, 1, '商家管理', '', '否');

---2014-11-19---

--删除订单类型字段--
ALTER TABLE `tp_item_order` DROP `orderType`;

--添加会员管理模块--
INSERT INTO `tp_function` ( `gid`, `usenum`, `name`, `funname`, `actname`, `info`, `isserve`, `status`, `belonguser`, `funtype`, `funcolor`, `havenext`) VALUES
( 2, 0, '会员管理', 'Member_user', 'index', '会员管理', 1, 1, 1, '会员管理', '', '否');

ALTER TABLE  `tp_user` CHANGE  `phone`  `phone` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ;

ALTER TABLE  `tp_user` CHANGE  `registerTime`  `registerTime` INT( 10 ) UNSIGNED NOT NULL COMMENT  '注册时间';


---2014-11-20---

--添加自助下单模块--
INSERT INTO `myhuai`.`tp_function` (`gid`, `usenum`, `name`, `funname`, `actname`, `info`, `isserve`, `status`, `belonguser`, `funtype`, `funcolor`, `havenext`) VALUES ('2', '0', '自助下单系统', 'Self_order', 'index', '自助下单系统', '1', '1', '1', '自助下单', '', '否');




