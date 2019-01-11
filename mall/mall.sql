/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-01-07 16:35:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mall_activity
-- ----------------------------
DROP TABLE IF EXISTS `mall_activity`;
CREATE TABLE `mall_activity` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `activity_img` varchar(255) DEFAULT '' COMMENT '活动首页图标',
  `activity_banner` varchar(255) DEFAULT '' COMMENT '链接',
  `activity_content` text COMMENT '活动规则说明',
  `activity_chance` float(3,2) DEFAULT NULL COMMENT '中奖概率',
  `activity_status` tinyint(2) DEFAULT '1' COMMENT '活动状态',
  `activity_create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_activity
-- ----------------------------
INSERT INTO `mall_activity` VALUES ('1', '砸金蛋赢优惠券', 'http://static.mall.bangwoya.com/20181224_d5d934f6b6d2945f088c0632fb1737a3.png', 'http://static.mall.bangwoya.com/20181224_4cd2e60f91089c7a1ccae8f64d8ac711.png', '<p>1、没人每天可砸蛋三次</p><p>2、中奖几率100%，奖品仅限当天使用</p><p><br></p>', '1.00', '1', '1545640752');

-- ----------------------------
-- Table structure for mall_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `mall_admin_auth`;
CREATE TABLE `mall_admin_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `auth_pid` int(11) DEFAULT '0' COMMENT '上级权限id',
  `auth_name` varchar(20) NOT NULL DEFAULT '' COMMENT '权限名称',
  `auth_url` varchar(255) DEFAULT NULL COMMENT '权限地址',
  `auth_icon` varchar(50) DEFAULT NULL COMMENT '权限图标',
  `auth_sort` smallint(2) DEFAULT '99' COMMENT '排序',
  `auth_menu_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单状态 1 显示 0 隐藏',
  `auth_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限状态 1 整除 0 禁用',
  `auth_create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`auth_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='管理权限节点表';

-- ----------------------------
-- Records of mall_admin_auth
-- ----------------------------
INSERT INTO `mall_admin_auth` VALUES ('1', '0', '权限管理', '', 'layui-icon-template-1', '1', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('2', '1', '管理员列表', 'admin/adminuser/index', '', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('3', '1', '用户组列表', 'admin/adminrole/index', '', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('4', '1', '权限列表', 'admin/adminauth/index', '', '99', '0', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('5', '6', '媒体管理', 'media/media/index', '', '1', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('6', '0', '媒体中心', '', 'layui-icon-app', '2', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('7', '6', '栏目管理', 'media/column/index', '', '2', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('8', '0', '功能模块管理', '', 'layui-icon-template-1', '3', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('9', '8', '热搜词管理', 'hotword/hot/index', '', '1', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('10', '8', '广告管理', 'banner/banner/index', '', '2', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('11', '0', '商品管理', '', 'layui-icon-form', '4', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('12', '11', '商品列表', 'goods/goods/index', '', '1', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('13', '0', 'icon管理', '', 'layui-icon-set-sm', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('14', '13', 'icon列表', 'icon/icon/index', '', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('15', '8', '淘客分类', 'media/column/taoColumn', '', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('16', '0', '活动奖励管理', '', 'layui-icon-chart-screen', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('17', '16', '活动列表', 'activity/activity/index', '', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('18', '16', '福利礼包列表', 'reward/reward/index', '', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('19', '0', '电商资源管理', '', 'layui-icon-tabs', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('20', '19', '资源中心', 'online/online/index', '', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('21', '19', '品牌馆', 'brand/brand/index', '', '99', '1', '1', '0');
INSERT INTO `mall_admin_auth` VALUES ('22', '11', 'top精选', 'goods/Topgoods/topGoods', '', '99', '1', '1', '0');

-- ----------------------------
-- Table structure for mall_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `mall_admin_role`;
CREATE TABLE `mall_admin_role` (
  `role_id` tinyint(3) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `role_describe` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `role_auth` varchar(255) DEFAULT NULL COMMENT '权限列表',
  `role_create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员角色表';

-- ----------------------------
-- Records of mall_admin_role
-- ----------------------------
INSERT INTO `mall_admin_role` VALUES ('1', '超级管理员', '超级管理员', null, '1539072772');

-- ----------------------------
-- Table structure for mall_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_admin_user`;
CREATE TABLE `mall_admin_user` (
  `user_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_password` varchar(50) NOT NULL DEFAULT '' COMMENT '用户密码',
  `user_nickname` varchar(20) DEFAULT '' COMMENT '用户昵称',
  `user_group` varchar(20) DEFAULT NULL COMMENT '用户分组',
  `user_create_time` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_login_ip` varchar(20) DEFAULT NULL COMMENT '最后一次登录ip',
  `user_login_time` int(10) DEFAULT NULL COMMENT '最后一次登录时间',
  `user_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '用户状态',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of mall_admin_user
-- ----------------------------
INSERT INTO `mall_admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '天芒云', '1', '1539070264', '127.0.0.1', '1546831034', '1');

-- ----------------------------
-- Table structure for mall_banner
-- ----------------------------
DROP TABLE IF EXISTS `mall_banner`;
CREATE TABLE `mall_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banner_media_id` int(10) unsigned DEFAULT '0' COMMENT '媒体id',
  `banner_title` varchar(255) DEFAULT '' COMMENT '广告位标题',
  `banner_img` varchar(255) DEFAULT '' COMMENT '图片地址',
  `banner_url` varchar(255) DEFAULT '' COMMENT '图片链接',
  `banner_sort` tinyint(2) unsigned DEFAULT '99' COMMENT '排序',
  `banner_sex` tinyint(1) unsigned DEFAULT '0' COMMENT '默认全部  1-男 2-女',
  `banner_create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `banner_status` tinyint(2) DEFAULT '1' COMMENT '广告状态',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_banner
-- ----------------------------
INSERT INTO `mall_banner` VALUES ('1', '2', '首页活动', 'http://static.mall.bangwoya.com/20181220_fa21eae491e6ea89adb8c54537806f4a.png', 'http://www.baidu.com', '1', '2', '1545298643', '1');
INSERT INTO `mall_banner` VALUES ('2', '1', 'assa', 'http://static.mall.bangwoya.com/20181227_638002057782f4539e874ba97fa09bf3.png', 'http://www.baidu.com', '99', '0', '1545893045', '1');

-- ----------------------------
-- Table structure for mall_bind_brand_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_bind_brand_goods`;
CREATE TABLE `mall_bind_brand_goods` (
  `bind_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bind_column_id` int(10) unsigned NOT NULL COMMENT '栏目id',
  `bind_goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `bind_create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`bind_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for mall_bind_column_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_bind_column_goods`;
CREATE TABLE `mall_bind_column_goods` (
  `bind_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bind_column_id` int(10) unsigned NOT NULL COMMENT '栏目id',
  `bind_goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `bind_create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`bind_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for mall_bind_user_reward
-- ----------------------------
DROP TABLE IF EXISTS `mall_bind_user_reward`;
CREATE TABLE `mall_bind_user_reward` (
  `bind_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bind_uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `bind_reward` text COMMENT '奖励信息',
  `bind_type` tinyint(1) unsigned DEFAULT '1' COMMENT '1-优惠券   2-第三方礼包',
  `bind_create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`bind_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_bind_user_reward
-- ----------------------------

-- ----------------------------
-- Table structure for mall_brand
-- ----------------------------
DROP TABLE IF EXISTS `mall_brand`;
CREATE TABLE `mall_brand` (
  `brand_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `brand_column_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `brand_title` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌名',
  `brand_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌图片地址',
  `brand_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='品牌';


-- ----------------------------
-- Table structure for mall_column
-- ----------------------------
DROP TABLE IF EXISTS `mall_column`;
CREATE TABLE `mall_column` (
  `column_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `column_title` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `column_media_id` tinyint(3) unsigned DEFAULT '0' COMMENT '媒体id',
  `column_thumb` varchar(255) DEFAULT NULL COMMENT '栏目缩略图',
  `column_image` varchar(255) DEFAULT '' COMMENT '列表图',
  `column_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `column_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '栏目类型   0-普通  1-专场',
  `column_sex` tinyint(1) unsigned DEFAULT '2' COMMENT '性别   1-男  2-女',
  `column_status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `column_sort` tinyint(2) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  PRIMARY KEY (`column_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='媒体栏目表';

-- ----------------------------
-- Records of mall_column
-- ----------------------------
INSERT INTO `mall_column` VALUES ('1', '女装', '0', 'http://static.mall.bangwoya.com/20181226_d1cc83d7e6b2d2cfb21385c9235aa603.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('2', '母婴', '0', 'http://static.mall.bangwoya.com/20181227_9427b98403e00af422144915bfc77d17.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('3', '美妆', '0', 'http://static.mall.bangwoya.com/20181227_60789e064b327bb74f8f163559de3090.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('4', '居家日用', '0', 'http://static.mall.bangwoya.com/20181227_8b1b0dc8f889fb4391bf4e8d7adbdc33.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('5', '鞋品', '0', 'http://static.mall.bangwoya.com/20181227_54b96dd0ead38b4845b3a56eacf5ef95.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('6', '美食', '0', 'http://static.mall.bangwoya.com/20181227_9a02afdc033f88e9232eecf103f155f1.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('7', '文娱车品', '0', 'http://static.mall.bangwoya.com/20181227_2fd44b6f24580973fe3faae1037851c5.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('8', '数码家电', '0', 'http://static.mall.bangwoya.com/20181227_42ee5150cbe438c095ae6eb7fddc5896.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('9', '男装', '0', 'http://static.mall.bangwoya.com/20181227_8dc32160608344d1682731a4224de2b5.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('10', '内衣', '0', 'http://static.mall.bangwoya.com/20181227_1367f0c5c3e9d2305c411d29f96ffd0c.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('11', '箱包', '0', 'http://static.mall.bangwoya.com/20181227_e1faf0db21386232b528ece06ef488d1.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('12', '配饰', '0', 'http://static.mall.bangwoya.com/20181227_53c72a3ff45642b2e6e5589de1ffcb4b.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('13', '户外运动', '0', 'http://static.mall.bangwoya.com/20181227_b5f7746777aee23e3b51fbdbe2c9e79a.png', '', '1544839424', '0', '2', '1', '99');
INSERT INTO `mall_column` VALUES ('14', '家装家纺', '0', 'http://static.mall.bangwoya.com/20181227_99f40e8c12749800c57d77765f0dc711.png', '', '1544839424', '0', '2', '1', '99');

-- ----------------------------
-- Table structure for mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_goods`;
CREATE TABLE `mall_goods` (
  `goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `id` varchar(20) NOT NULL COMMENT '大淘客商品id',
  `cid` tinyint(2) NOT NULL,
  `goodsid` varchar(20) NOT NULL COMMENT '商品淘宝id',
  `title` varchar(255) NOT NULL COMMENT '商品标题',
  `d_title` varchar(100) NOT NULL COMMENT '商品短标题',
  `pic` varchar(255) NOT NULL COMMENT '商品主图',
  `org_price` float(10,2) DEFAULT NULL COMMENT '正常售价',
  `price` float(10,2) NOT NULL COMMENT '券后价',
  `istmall` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否天猫',
  `sales_num` int(10) unsigned NOT NULL COMMENT '商品销量',
  `sellerid` varchar(20) NOT NULL DEFAULT '0' COMMENT '卖家id',
  `commission_jihua` float(10,2) NOT NULL COMMENT '计划(通用)佣金比例',
  `commission_queqiao` float(10,2) NOT NULL COMMENT '高佣鹊桥佣金比例',
  `jihua_link` varchar(255) NOT NULL COMMENT '计划链接',
  `jihua_shenhe` tinyint(1) NOT NULL COMMENT '计划审核状态',
  `introduce` varchar(255) NOT NULL COMMENT '商品文案',
  `quan_id` varchar(32) NOT NULL COMMENT '优惠券ID',
  `quan_price` float(10,2) NOT NULL COMMENT '优惠券金额',
  `quan_time` varchar(20) NOT NULL COMMENT '优惠券结束时间',
  `quan_surplus` int(10) NOT NULL COMMENT '优惠券剩余数量',
  `quan_receive` int(10) NOT NULL COMMENT '已领券数量',
  `quan_condition` varchar(255) NOT NULL COMMENT '优惠券使用条件',
  `quan_link` varchar(255) NOT NULL COMMENT '手机券链接',
  `create_time` int(10) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1' COMMENT '状态  -1 删除',
  PRIMARY KEY (`goods_id`),
  KEY `istmall` (`istmall`),
  KEY `price` (`price`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';


-- ----------------------------
-- Table structure for mall_hot_word
-- ----------------------------
DROP TABLE IF EXISTS `mall_hot_word`;
CREATE TABLE `mall_hot_word` (
  `hot_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hot_title` varchar(50) NOT NULL DEFAULT '' COMMENT '热搜词',
  `hot_url` varchar(255) NOT NULL DEFAULT '' COMMENT '词链接',
  `hot_sort` tinyint(2) NOT NULL DEFAULT '99' COMMENT '排序',
  `hot_media_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '媒体id',
  `hot_create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`hot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for mall_icon
-- ----------------------------
DROP TABLE IF EXISTS `mall_icon`;
CREATE TABLE `mall_icon` (
  `icon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `icon_title` varchar(255) DEFAULT '' COMMENT '标题',
  `icon_img` varchar(255) DEFAULT '' COMMENT '图片',
  `icon_sort` tinyint(2) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `icon_create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `icon_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`icon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_icon
-- ----------------------------
INSERT INTO `mall_icon` VALUES ('1', '天猫国际', 'http://static.mall.bangwoya.com/20181227_686d31806443d5adf93b2b9ddbfabee3.png', '1', '1545619595', '1');
INSERT INTO `mall_icon` VALUES ('2', '品牌馆', 'http://static.mall.bangwoya.com/20181227_11c46c908bc9ae06d05c762ac3ce723b.png', '2', '1545620402', '1');
INSERT INTO `mall_icon` VALUES ('3', '聚划算', 'http://static.mall.bangwoya.com/20181227_1f78d531d2cbcfe1a1fd3ed5e295e3fe.png', '99', '1545899270', '1');
INSERT INTO `mall_icon` VALUES ('4', '9.9包邮', 'http://static.mall.bangwoya.com/20181227_c2d72651bfc98342d3aee0b67f3f47ee.png', '99', '1545899285', '1');

-- ----------------------------
-- Table structure for mall_media
-- ----------------------------
DROP TABLE IF EXISTS `mall_media`;
CREATE TABLE `mall_media` (
  `media_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '媒体id',
  `media_title` varchar(100) NOT NULL DEFAULT '' COMMENT '媒体名称',
  `media_ident` varchar(10) NOT NULL DEFAULT '' COMMENT '媒体标识',
  `media_pid` varchar(50) NOT NULL DEFAULT '' COMMENT '媒体淘宝联盟推广位PID',
  `media_divided_into` float(5,2) DEFAULT '0.00' COMMENT '媒体分成比率',
  `media_service_fee` float(5,2) DEFAULT '0.00' COMMENT '技术服务费比率',
  `media_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `media_status` tinyint(2) DEFAULT '1' COMMENT '媒体状态',
  PRIMARY KEY (`media_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='媒体表';


-- ----------------------------
-- Table structure for mall_reward
-- ----------------------------
DROP TABLE IF EXISTS `mall_reward`;
CREATE TABLE `mall_reward` (
  `reward_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reward_media_id` int(10) unsigned NOT NULL COMMENT '来源媒体',
  `reward_title` varchar(255) DEFAULT '' COMMENT '奖品名称',
  `reward_url` varchar(255) DEFAULT '' COMMENT '跳转链接',
  `reward_img` varchar(255) DEFAULT '' COMMENT '礼包静态图',
  `reward_create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `reward_status` tinyint(2) unsigned DEFAULT '1' COMMENT '状态 ',
  PRIMARY KEY (`reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_reward
-- ----------------------------
INSERT INTO `mall_reward` VALUES ('1', '2', '抢金券', 'http://www.baidu.com', 'http://static.mall.bangwoya.com/20181225_542e643e35580e654910bd0404eea952.png', '1545707422', '1');
INSERT INTO `mall_reward` VALUES ('2', '1', '下单送好礼', 'http://www.baidu.com', 'http://static.mall.bangwoya.com/20190104_f18490cd72020a724fb8358d4f79f40a.jpg', '0', '1');

-- ----------------------------
-- Table structure for mall_top_bind_goods
-- ----------------------------
DROP TABLE IF EXISTS `mall_top_bind_goods`;
CREATE TABLE `mall_top_bind_goods` (
  `top_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `top_goodsid` char(30) DEFAULT NULL COMMENT '商品goodsid',
  `top_sex` tinyint(1) unsigned DEFAULT '2' COMMENT '1-男  2-女',
  `top_status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `top_is_show` tinyint(1) unsigned DEFAULT '1' COMMENT '是否显示  1显示 2不显示',
  `top_create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`top_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for mall_user
-- ----------------------------
DROP TABLE IF EXISTS `mall_user`;
CREATE TABLE `mall_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cookie` varchar(255) DEFAULT NULL,
  `user_ident` char(50) DEFAULT NULL,
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mall_user
-- ----------------------------
