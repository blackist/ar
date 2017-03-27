/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50173
Source Host           : 127.0.0.1:3306
Source Database       : ar

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-03-01 22:56:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `act_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '活动标识',
  `act_name` varchar(20) NOT NULL COMMENT '活动名称',
  `act_place` varchar(50) NOT NULL COMMENT '活动地点',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `act_desc` text NOT NULL COMMENT '活动描述',
  `act_num` int(4) NOT NULL COMMENT '活动人数',
  `sign_num` int(4) DEFAULT NULL COMMENT '报名人数',
  `interests` int(4) DEFAULT NULL COMMENT '感兴趣数',
  `leader_name` varchar(10) NOT NULL COMMENT '负责人姓名',
  `leader_phone` varchar(30) NOT NULL COMMENT '负责人联系方式',
  `origin_id` int(8) NOT NULL COMMENT '活动所属组织标识',
  `user_id` int(8) NOT NULL COMMENT '活动创建者标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`act_id`),
  KEY `FK_ACTIVITY_USERID` (`user_id`),
  KEY `FK_ACTIVITY_ORIGINID` (`origin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addr_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '地址标识',
  `province` varchar(10) NOT NULL COMMENT '省份',
  `city` varchar(10) NOT NULL COMMENT '城市',
  `district` varchar(10) NOT NULL COMMENT '区域',
  `detail` varchar(50) NOT NULL COMMENT '详细地址',
  `zip_code` char(6) DEFAULT NULL COMMENT '邮编',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  PRIMARY KEY (`addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '江苏', '徐州', '云龙', '徐州市云徐州工程学院中心校区', '221000', '2015-12-22 00:04:40', 'A', '2015-12-22 00:04:50');

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `album_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '相册标识',
  `album_name` varchar(20) NOT NULL COMMENT '相册名称',
  `album_desc` varchar(200) DEFAULT NULL COMMENT '相册描述，少于200字符',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `interests` int(4) DEFAULT NULL COMMENT '感兴趣数',
  `cover_image` int(11) DEFAULT NULL COMMENT '相册封面标识',
  `origin_id` int(8) NOT NULL COMMENT '相册所属组织标识',
  `user_id` int(8) NOT NULL COMMENT '相册创建者标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------

-- ----------------------------
-- Table structure for album_image
-- ----------------------------
DROP TABLE IF EXISTS `album_image`;
CREATE TABLE `album_image` (
  `album_id` int(8) NOT NULL,
  `image_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  KEY `FK_ALBUM_IMAGE_ALBUMID` (`album_id`),
  KEY `FK_ALBUM_IMAGE_IMAGEID` (`image_id`),
  CONSTRAINT `FK_ALBUM_IMAGE_ALBUMID` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `FK_ALBUM_IMAGE_IMAGEID` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album_image
-- ----------------------------

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `atta_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件标识',
  `atta_type` varchar(20) NOT NULL COMMENT '附件类型',
  `atta_name` varchar(50) NOT NULL COMMENT '附件名称',
  `is_remote` char(1) NOT NULL COMMENT '是否远程文件',
  `file_size` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `file_path` varchar(255) NOT NULL COMMENT '文件路径',
  `downloads` int(4) NOT NULL COMMENT '下载次数',
  `create_time` datetime NOT NULL COMMENT '上传时间',
  `exp_time` datetime DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`atta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachment
-- ----------------------------

-- ----------------------------
-- Table structure for attachment_info
-- ----------------------------
DROP TABLE IF EXISTS `attachment_info`;
CREATE TABLE `attachment_info` (
  `attachment_id` int(11) NOT NULL COMMENT '附件标识',
  `info_id` int(11) NOT NULL COMMENT '附主信息标识',
  KEY `FK_ATTACHMENT_ATTA_ATTACHMENTID` (`attachment_id`),
  KEY `FK_ATTACHMENT_INFO_INFOID` (`info_id`),
  CONSTRAINT `FK_ATTACHMENT_ATTA_ATTACHMENTID` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`atta_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ATTACHMENT_INFO_INFOID` FOREIGN KEY (`info_id`) REFERENCES `information` (`info_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachment_info
-- ----------------------------

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏标识',
  `create_time` datetime NOT NULL,
  `info_id` int(11) NOT NULL,
  `user_id` int(8) NOT NULL,
  `state` char(2) NOT NULL,
  `state_time` datetime DEFAULT NULL,
  PRIMARY KEY (`collect_id`),
  KEY `FK_COLLECT_USERID` (`user_id`),
  KEY `FK_COLLECT_INFOID` (`info_id`),
  CONSTRAINT `FK_COLLECT_INFOID` FOREIGN KEY (`info_id`) REFERENCES `information` (`info_id`),
  CONSTRAINT `FK_COLLECT_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论标识',
  `content` varchar(500) NOT NULL COMMENT '评论内容',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `user_id` int(8) NOT NULL COMMENT '评论人标识',
  `info_id` int(11) NOT NULL COMMENT '信息标识',
  PRIMARY KEY (`comment_id`),
  KEY `FK_COMMENT_USERID` (`user_id`),
  KEY `FK_COMMENT_INFOID` (`info_id`),
  CONSTRAINT `FK_COMMENT_INFOID` FOREIGN KEY (`info_id`) REFERENCES `information` (`info_id`),
  CONSTRAINT `FK_COMMENT_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('22', '抢沙发', '2016-03-01 11:49:24', '4', '12');
INSERT INTO `comment` VALUES ('23', '我来喽', '2016-03-01 11:55:58', '4', '8');
INSERT INTO `comment` VALUES ('24', '你的东西有点吊啊', '2016-03-01 15:25:52', '4', '14');
INSERT INTO `comment` VALUES ('25', '哈哈', '2016-03-01 15:29:12', '4', '14');
INSERT INTO `comment` VALUES ('26', '呵呵呵顿足捶胸你，们', '2016-03-01 15:32:27', '4', '14');
INSERT INTO `comment` VALUES ('27', '再来一次', '2016-03-01 15:48:56', '4', '14');
INSERT INTO `comment` VALUES ('28', '可以了吧', '2016-03-01 15:55:07', '4', '14');
INSERT INTO `comment` VALUES ('29', '阿桑福德恭喜发财', '2016-03-01 16:09:48', '4', '16');
INSERT INTO `comment` VALUES ('30', '考查课自行车vj', '2016-03-01 16:37:42', '4', '20');
INSERT INTO `comment` VALUES ('31', 'hehhe', '2016-03-01 17:40:58', '4', '20');
INSERT INTO `comment` VALUES ('32', '我来了', '2016-03-01 21:33:56', '2', '20');
INSERT INTO `comment` VALUES ('33', '回复 2楼  董亮亮：你说的不错哦', '2016-03-01 21:34:11', '2', '20');

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `dict_value` varchar(20) NOT NULL COMMENT '字典值，固定，不可变',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名',
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`dict_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('at', '相册类型', 'album type, 相册的分类， 班级相册，校友组织分类');
INSERT INTO `dictionary` VALUES ('be', '职位福利', 'benifit  职位福利');
INSERT INTO `dictionary` VALUES ('g', '游戏', 'game');
INSERT INTO `dictionary` VALUES ('in', '信息类型', 'information的类型，新闻/班级动态/帖子/校友动态/捐赠信息');
INSERT INTO `dictionary` VALUES ('ind', '招聘公司所属行业', 'industry 行业, 招聘公司所属行业');
INSERT INTO `dictionary` VALUES ('it', '图片类型', '');
INSERT INTO `dictionary` VALUES ('mpi', '公告信息', 'public info(公告信息)，后台或门户网站的公告，管理员可添加公告信息，滚动播放');
INSERT INTO `dictionary` VALUES ('ny', '[是]/[否] 字段填写', '根据字典值 dictdata 显示 是/否');
INSERT INTO `dictionary` VALUES ('ot', '组织类型', '班级/校友组织  等团体的类型');
INSERT INTO `dictionary` VALUES ('p', '专业类型', 'profession, 专业类型， 校友/班级所属专业，以及个人简历上的专业名称');
INSERT INTO `dictionary` VALUES ('pro', '公司属性', 'property 公司属性, 共有/私营...');
INSERT INTO `dictionary` VALUES ('prof', '学历', 'profession, 学历选项');
INSERT INTO `dictionary` VALUES ('r', '角色定义', 'role definition, 定义站内各个用户的角色');
INSERT INTO `dictionary` VALUES ('s', '资源', '网站资源');
INSERT INTO `dictionary` VALUES ('sca', '公司规模', 'scale 规模, 1-49/50-99/...');
INSERT INTO `dictionary` VALUES ('sl', '薪资水平', 'salary level, 薪资水平');
INSERT INTO `dictionary` VALUES ('state', '数据的状态', '');
INSERT INTO `dictionary` VALUES ('t', '消息主题', '帖子主题[主题帖、话题帖、IT]');
INSERT INTO `dictionary` VALUES ('tf', '置顶处理', 'top flag');
INSERT INTO `dictionary` VALUES ('zx', '直系', '1、hehe\r\n2、哈哈\r\n3、嘿嘿');

-- ----------------------------
-- Table structure for dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_data`;
CREATE TABLE `dictionary_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `dict_value` varchar(20) NOT NULL,
  `dictdata_name` varchar(50) NOT NULL,
  `dictdata_value` varchar(20) NOT NULL,
  `is_fixed` char(1) NOT NULL COMMENT ' 0不固定，1固定；固定就不能再去修改了',
  `is_cancel` char(1) DEFAULT NULL,
  `parent_id` char(1) DEFAULT NULL COMMENT '父节点，作为简单的树形结构',
  PRIMARY KEY (`id`),
  KEY `FK_DICTIONARYDATA_DICTVALUE` (`dict_value`),
  CONSTRAINT `FK_DICTIONARYDATA_DICTVALUE` FOREIGN KEY (`dict_value`) REFERENCES `dictionary` (`dict_value`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary_data
-- ----------------------------
INSERT INTO `dictionary_data` VALUES ('4', 'state', '正常', 'A', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('5', 'state', '删除', 'X', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('6', 'state', '异常', 'E', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('25', 'ny', '否', '0', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('26', 'ny', '是', '1', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('29', 'g', '贪吃蛇', 'es', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('30', 'p', '通信专业', 'co', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('31', 'tf', '置顶', '1', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('32', 'tf', '不置顶', '0', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('33', 'ind', '通信/电信', 'txdx', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('34', 'ind', '财务/金融/保险', 'cwjrbx', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('35', 'ind', '专业服务', 'zyfw', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('36', 'ind', '服务业', 'fwy', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('37', 'ind', '互联网/计算机', 'hlwjsj', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('38', 'ind', '零售/租赁', 'lszl', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('39', 'ind', '房产', 'fc', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('40', 'ind', '重工/制造业', 'zgzzy', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('41', 'ind', '通信/电子/电信', 'txdzdx', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('42', 'ind', '广告/市场', 'ggsc', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('43', 'ind', '能源/矿业/环保', 'nykchb', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('44', 'pro', '私营', 'sy', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('45', 'pro', '国有', 'gy', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('46', 'pro', '股份制', 'gfz', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('47', 'pro', '外商独资/办事处', 'wsdzbsc', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('48', 'pro', '中外合资/合作', 'zwhz', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('49', 'pro', '上市公司', 'ssgs', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('50', 'pro', '事业单位', 'sydw', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('51', 'pro', '政府机关', 'zfjg', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('52', 'pro', '非营利机构', 'fyljg', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('53', 'pro', '个人企业', 'grqy', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('54', 'sca', '1-49人', 's1', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('55', 'sca', '50-99人', 's2', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('56', 'sca', '100-499人', 's3', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('57', 'sca', '500-999人', 's4', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('58', 'sca', '1000人以上', 's5', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('59', 'sl', '1000元以下', 'sl1', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('60', 'sl', '1000-2000元', 'sl2', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('61', 'sl', '2000-3000元', 'sl3', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('62', 'sl', '3000-5000元', 'sl4', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('63', 'sl', '5000-8000元', 'sl5', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('64', 'sl', '8000-12000元', 'sl6', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('65', 'sl', '12000-20000元', 'sl7', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('66', 'sl', '20000-25000元', 'sl8', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('67', 'sl', '25000元以上', 'sl9', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('68', 'sl', '面议', 'slmy', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('69', 'be', '包吃', 'be1', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('70', 'be', '包住', 'be2', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('71', 'prof', '专科', 'zk', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('72', 'prof', '本科', 'bk', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('73', 'prof', '研究生', 'yjs', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('74', 'prof', '博士', 'bs', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('75', 'prof', '学历不限', 'profall', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('76', 'be', '五险一金', 'be3', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('77', 'be', '年底双薪', 'be4', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('78', 'be', '周末双休', 'be5', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('79', 'be', '交通补助', 'be6', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('80', 'be', '加班补助', 'be7', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('81', 'be', '饭补', 'be8', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('82', 'be', '话补', 'be10', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('83', 'be', '房补', 'be9', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('84', 'state', '未审核', 'D', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('85', 'state', '已审核', 'S', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('86', 'zx', '', 'asas', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('87', 'zx', '', 'zx', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('88', 'zx', '', 'aasas', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('89', 'ot', '班级', 'C', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('90', 't', '旅游', 't', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('91', 't', '就业', 'j', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('92', 't', '研讨', 'yt', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('93', 'in', '班级动态', 'CI', '1', null, null);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `grade_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '年级标识',
  `grade_value` char(4) NOT NULL COMMENT '年级值',
  `class_num` int(4) NOT NULL COMMENT '班级数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '状态日期',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '2012', '0', '2016-02-16 16:40:53', 'A', '2016-02-16 16:41:28');
INSERT INTO `grade` VALUES ('2', '2013', '2', '2016-02-16 16:41:18', 'A', '2016-02-16 16:41:25');
INSERT INTO `grade` VALUES ('3', '2014', '1', '2016-02-16 16:41:40', 'A', '2016-02-18 13:11:43');
INSERT INTO `grade` VALUES ('4', '2015', '1', '2016-02-16 16:41:50', 'A', '2016-02-16 16:41:54');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片标识',
  `image_name` varchar(32) DEFAULT NULL COMMENT '图片名称',
  `is_remote` char(1) DEFAULT NULL COMMENT '是否远程文件',
  `image_size` varchar(5) DEFAULT NULL COMMENT '图片大小',
  `image_path` varchar(255) NOT NULL COMMENT '图片路径',
  `image_type` varchar(20) DEFAULT NULL COMMENT '图片类型，图文信息的图片/头像/相册图片',
  `is_thumb` char(1) DEFAULT NULL COMMENT '是否生成缩略图',
  `thumb_path` varchar(255) DEFAULT NULL COMMENT '缩略图路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`image_id`),
  KEY `image_id` (`image_id`,`image_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', 'user1.png', null, null, '/img/portrait/user1.png', null, null, null, null, 'A', null);
INSERT INTO `image` VALUES ('2', 'user2.png', null, null, '/img/portrait/user2.png', null, null, null, null, 'A', null);
INSERT INTO `image` VALUES ('3', null, null, null, '/img/info/blog1.png', null, null, null, null, 'A', null);

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息标识',
  `info_title` varchar(50) DEFAULT NULL COMMENT '信息标题',
  `content` text NOT NULL COMMENT '内容',
  `theme` varchar(20) DEFAULT NULL COMMENT '主题',
  `thumb_image` varchar(255) DEFAULT NULL COMMENT '图文信息缩略图',
  `views` int(4) DEFAULT NULL COMMENT '浏览量',
  `comments` int(4) DEFAULT NULL COMMENT '评论数',
  `shares` int(4) DEFAULT NULL COMMENT '分享次数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_top` char(1) NOT NULL COMMENT '指定标志位',
  `info_type` varchar(20) NOT NULL COMMENT '信息类型',
  `user_id` int(8) NOT NULL COMMENT '信息发布者标识',
  `origin_id` int(8) NOT NULL COMMENT '发布信息的组织',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`info_id`),
  KEY `FK_INFORMATION_USERID` (`user_id`),
  KEY `FK_INFORMATION_ORIGINID` (`origin_id`),
  CONSTRAINT `FK_INFORMATION_ORIGINID` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_INFORMATION_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES ('1', '刚找到工作，不容易', '作为一名当代大学生，我十分骄傲地找到了一份门卫的工作，从此以后，我的人生也就扬帆起航了', 'tr', '/img/info/blog1.jpg', '0', '0', '0', '2016-02-26 21:00:27', '0', 'CI', '4', '1', 'A', '2016-02-25 01:18:31');
INSERT INTO `information` VALUES ('2', '我是个逗逼', '我是个逗逼', null, '/img/info/c245b47c-f52f-4337-86df-004f0e4a269a.jpg', '0', '0', '0', '2016-02-28 20:53:25', '0', 'CI', '4', '1', 'A', '2016-02-28 20:53:25');
INSERT INTO `information` VALUES ('3', '再试试吧', '再试试吧', null, '/img/info/2e6d2a47-da2c-4a82-8bfc-7b236d859b0c.jpg', '0', '0', '0', '2016-02-28 20:55:56', '0', 'CI', '4', '1', 'A', '2016-02-28 20:55:56');
INSERT INTO `information` VALUES ('5', '弧度高，准，还尼玛超', '弧度高，准，还尼玛超远我想知道他俩谁强…', null, '/img/info/19bad79c-2758-4f77-98ab-5962c2b5ed2c.jpg', '0', '0', '0', '2016-02-28 21:10:04', '0', 'CI', '4', '1', 'A', '2016-02-28 21:10:04');
INSERT INTO `information` VALUES ('6', '今天阳光明媚，带着媳', '今天阳光明媚，带着媳妇儿出去春游了，春风和煦，时光静好，生活难得的惬意', null, '/img/info/331580e0-71ca-4fe5-973e-4c5ca3c23d24.jpg', '0', '0', '0', '2016-02-28 21:15:39', '0', 'CI', '4', '1', 'A', '2016-02-28 21:15:39');
INSERT INTO `information` VALUES ('7', '哈哈', '哈哈', null, '', '0', '0', '0', '2016-02-28 22:18:45', '0', 'CI', '4', '1', 'A', '2016-02-28 22:18:45');
INSERT INTO `information` VALUES ('8', '多个方面呢，就好vjhbv', '多个方面呢，就好vjhbv', null, '/img/info/ce0f7497-cae2-472a-abba-f7a3c1727613.png', '0', '1', '0', '2016-02-28 23:40:43', '0', 'CI', '4', '1', 'A', '2016-02-28 23:40:43');
INSERT INTO `information` VALUES ('9', '哈哈，这就是帅气的我', '哈哈，这就是帅气的我', null, '/img/info/154e714d-ba5d-4d02-a158-a19d03eb9855.jpg', '0', '0', '0', '2016-02-29 20:11:50', '0', 'CI', '4', '1', 'A', '2016-02-29 20:11:50');
INSERT INTO `information` VALUES ('10', '呵呵呵', '呵呵呵', null, '/img/info/c15ddfde-ae9e-4fdc-93bc-616cb91dbfb0.jpg', '0', '0', '0', '2016-02-29 20:31:53', '0', 'CI', '4', '1', 'A', '2016-02-29 20:31:53');
INSERT INTO `information` VALUES ('11', '和S科学家离开vsk', '和S科学家离开vskcvcmkccb', null, '/img/info/c6cd32a4-e979-49a6-975e-ac3343637c91.jpg', '0', '0', '0', '2016-02-29 22:04:27', '0', 'CI', '4', '1', 'A', '2016-02-29 22:04:27');
INSERT INTO `information` VALUES ('12', '双方的股份回购名', '双方的股份回购名', null, null, '0', '1', '0', '2016-02-29 23:22:04', '0', 'CI', '4', '1', 'A', '2016-02-29 23:22:04');
INSERT INTO `information` VALUES ('13', '你说我人品怎么样\r\n还可以吧', '你说我人品怎么样\r\n还可以吧', null, '/img/info/e7f8430a-9973-4319-ad74-8efd30a6f1ac.jpg', '0', '0', '0', '2016-03-01 11:51:01', '0', 'CI', '4', '1', 'A', '2016-03-01 11:51:01');
INSERT INTO `information` VALUES ('14', '奥德赛vhasild', '奥德赛vhasildj oaiSJl c ASDlL  jlkzdj flkzj 就 ｌｊ　ｌｊ　ｓｄｌｊｆｚｓｌｊ　ｆｄｊ　ｆｌ　ｊ　ｌｊ　ｌｊｌ　ｉｌｕ　ｉｊｊｊｋｋＯＬ　ＪＯ　ｏ　ｋ就开始离开家阿隆索飞机乘客来说ｖｊｌ路径 SJDcLDS', null, null, '0', '5', '0', '2016-03-01 12:31:02', '0', 'CI', '4', '1', 'A', '2016-03-01 12:31:02');
INSERT INTO `information` VALUES ('15', '谔谔同花顺俄而是是忽', '谔谔同花顺俄而是是忽然怀念和健康　看空间就', null, null, '0', '0', '0', '2016-03-01 12:31:26', '0', 'CI', '4', '2', 'A', '2016-03-01 12:31:26');
INSERT INTO `information` VALUES ('16', 'iwoqujsqAK;L', 'iwoqujsqAK;L', null, null, '0', '1', '0', '2016-03-01 12:40:36', '0', 'CI', '4', '1', 'A', '2016-03-01 12:40:36');
INSERT INTO `information` VALUES ('17', '爱克发haskfhds.j快来', '爱克发haskfhds.j快来', null, null, '0', '0', '0', '2016-03-01 15:59:00', '0', 'CI', '4', '1', 'A', '2016-03-01 15:59:00');
INSERT INTO `information` VALUES ('18', '恶搞无法打败你后悔', '恶搞无法打败你后悔', null, null, '0', '0', '0', '2016-03-01 16:28:04', '0', 'CI', '4', '1', 'A', '2016-03-01 16:28:04');
INSERT INTO `information` VALUES ('19', '快点放假萨拉丁福利激发机卡分离', '快点放假萨拉丁福利激发机卡分离', null, null, '0', '0', '0', '2016-03-01 16:29:02', '0', 'CI', '4', '1', 'A', '2016-03-01 16:29:02');
INSERT INTO `information` VALUES ('20', 'uyjumntbsrvsc', 'uyjumntbsrvsc', null, '/img/info/c09cf1d4-37a0-427f-8c9c-bd2d28c0f2f8.jpg', '0', '4', '0', '2016-03-01 16:29:36', '0', 'CI', '4', '1', 'A', '2016-03-01 16:29:36');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志标识',
  `operator` varchar(100) DEFAULT NULL COMMENT '操作员',
  `oper_name` varchar(100) DEFAULT NULL COMMENT '操作名称',
  `oper_params` varchar(500) DEFAULT NULL COMMENT '操作参数',
  `oper_result` varchar(100) DEFAULT NULL COMMENT '操作结果',
  `result_msg` varchar(500) DEFAULT NULL COMMENT '结果信息',
  `oper_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言标识',
  `title` varchar(20) NOT NULL COMMENT '留言标题',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `sender_id` int(8) NOT NULL COMMENT '留言人标识',
  `receiver_id` int(8) NOT NULL COMMENT '留言接收人标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`msg_id`),
  KEY `FK_MESSAGE_SENDER` (`sender_id`),
  KEY `FK_MESSAGE_RECEIVER` (`receiver_id`),
  CONSTRAINT `FK_MESSAGE_RECEIVER` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_MESSAGE_SENDER` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for origin
-- ----------------------------
DROP TABLE IF EXISTS `origin`;
CREATE TABLE `origin` (
  `origin_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '组织标识',
  `origin_name` varchar(20) NOT NULL COMMENT '组织名称',
  `origin_no` varchar(20) DEFAULT NULL COMMENT '组织编号',
  `origin_type` varchar(20) NOT NULL COMMENT '组织类型',
  `origin_desc` text COMMENT '组织描述',
  `origin_grade` char(4) NOT NULL,
  `members` int(4) NOT NULL COMMENT '成员数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator_id` int(8) NOT NULL COMMENT '创建者',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`origin_id`),
  KEY `FK_ORIGIN_CREATORID` (`creator_id`),
  CONSTRAINT `FK_ORIGIN_CREATORID` FOREIGN KEY (`creator_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of origin
-- ----------------------------
INSERT INTO `origin` VALUES ('1', '13软嵌2班', '201305052', 'C', '这是一个很牛逼的班级', '2013', '45', '2016-02-16 23:21:47', '2', 'A', '2016-02-16 23:22:02', null, null);
INSERT INTO `origin` VALUES ('2', '13软嵌1班', '201305051', 'C', null, '2013', '46', '2016-02-17 15:38:12', '2', 'A', '2016-02-17 15:38:25', null, null);
INSERT INTO `origin` VALUES ('3', '14计嵌1', '201405051', 'C', null, '2014', '55', '2016-02-18 19:45:09', '2', 'A', '2016-02-18 19:45:21', null, null);
INSERT INTO `origin` VALUES ('4', '15自动化', '201505011', 'C', null, '2015', '33', '2016-02-18 19:46:04', '2', 'A', '2016-02-18 19:46:12', null, null);

-- ----------------------------
-- Table structure for recruit
-- ----------------------------
DROP TABLE IF EXISTS `recruit`;
CREATE TABLE `recruit` (
  `recruit_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '招聘信息标识',
  `title` varchar(20) CHARACTER SET ucs2 NOT NULL COMMENT '招聘标题',
  `salary` varchar(50) NOT NULL COMMENT '工资',
  `members` int(4) NOT NULL COMMENT '招聘人数',
  `prof` varchar(20) NOT NULL,
  `resumes` int(4) DEFAULT NULL COMMENT '简历投递数',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leader_name` varchar(20) NOT NULL COMMENT '负责人姓名',
  `leader_phone` varchar(30) NOT NULL COMMENT '负责人联系方式',
  `is_top` char(1) NOT NULL COMMENT '是否置顶 1/0',
  `pos_name` varchar(20) NOT NULL COMMENT '职位名称',
  `pos_desc` varchar(500) NOT NULL COMMENT '职位描述',
  `benefit` varchar(50) DEFAULT NULL COMMENT '福利',
  `work_place` varchar(50) NOT NULL COMMENT '工作地点',
  `unit_id` int(8) NOT NULL COMMENT '职位所属公司标识',
  `user_id` int(8) NOT NULL COMMENT '发布人标识',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态标识',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`recruit_id`),
  KEY `FK_RECRUIT_UNITID` (`unit_id`),
  KEY `FK_RECRUIT_USERID` (`user_id`),
  CONSTRAINT `FK_RECRUIT_UNITID` FOREIGN KEY (`unit_id`) REFERENCES `recruit_unit` (`unit_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_RECRUIT_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruit
-- ----------------------------
INSERT INTO `recruit` VALUES ('27', '西树泡芙开业大吉，招服务员10名', 'sl4', '10', 'profall', '0', null, '李先生', '13412514543', '0', '服务员', '工作时间:afbsbdzxcxvdsxz送饭的vsdsdf诗圣杜甫斯蒂芬斯蒂芬广东东莞贵妇狗', 'be1,be4,be7,be8', '呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵', '38', '2', '2016-02-06 14:38:25', 'A', '2016-02-06 14:38:25', null, null);
INSERT INTO `recruit` VALUES ('38', '羊肉馆缺的就是 经理', 'sl4', '1', 'bk', '0', null, '张全蛋', '3838438', '0', '大堂经理', '工作时间:，大堂经理最潇洒，大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒', 'be1,be2,be3,be4', '徐州市沛县龙固时尚街区', '38', '2', '2016-02-06 16:38:34', 'A', '2016-02-06 16:38:34', null, null);
INSERT INTO `recruit` VALUES ('53', '朱氏土灶台', 'sl2', '2', 'profall', '0', null, '朱正玉', '19873661127', '0', '洗碗工', '工作时间:呵呵额呵呵我试试看，呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看', 'be1,be4,be8', '苏州科技园小吃一条街', '38', '2', '2016-02-06 20:23:12', 'A', '2016-02-10 23:03:08', null, null);
INSERT INTO `recruit` VALUES ('54', '长城4S店', 'sl4', '3', 'profall', '0', null, '刘金宝', '13322529090', '1', '4S专业维修人员', '工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点', 'be1,be2,be3,be4', '徐州市竹林寺对面，长城4S店', '38', '2', '2016-02-06 21:15:01', 'A', '2016-02-11 22:45:47', null, null);
INSERT INTO `recruit` VALUES ('56', '重工之路，怎能少了机械师的指点', 'sl5', '3', 'bk', '0', null, '刘经理', '13452328979', '1', '中型机械师', '岗位职责:研究以及实践新时代下重型器械的发展方向，为我公司做强有力的发展导师；\r\n\r\n任职资格:本科及以上学历，有三年以上工作经验；\r\n\r\n工作时间:三班倒', 'be1,be2,be3,be4,be5,be6,be7,be8,be10', '徐州工业集团总部厂房', '39', '3', '2016-02-06 22:52:15', 'A', '2016-02-11 21:46:56', null, null);
INSERT INTO `recruit` VALUES ('57', '招聘A级摄影师一名', 'sl4', '1', 'profall', '0', null, '吴经理', '15567984543', '0', '摄影室', '岗位职责:国庆将至，本店迎来大批顾客，拍摄写真、全家福等照片，业务较多，特聘摄影师负责部分 工作，包括摄影、场景布置、业务接待；\r\n\r\n任职资格:有两年以上工作经验\r\n\r\n工作时间:早九晚五', 'be1,be6,be7,be10', '徐州古彭大厦A座8楼', '44', '4', '2016-02-09 14:20:52', 'A', '2016-02-10 23:03:07', null, null);
INSERT INTO `recruit` VALUES ('59', '证券交易所急招网络安全人员', 'sl5', '2', 'bk', '0', null, '王经理', '15569098900', '0', '网络交易安全', '岗位职责: 维护交易所网站信息安全、交易安全，为证券交易避免网络攻击，保证公司信息安全；\r\n任职资格: 有两年以上工作经验；\r\n工作时间: 早九晚五‘；', 'be3,be4,be6,be7,be10', '上海虹桥机场南广场办公楼1002', '34', '1', '2016-02-10 22:13:06', 'X', '2016-02-10 23:03:08', null, null);
INSERT INTO `recruit` VALUES ('60', '特聘汽车美容师', 'sl4', '5', 'profall', '0', null, '王金山', '89922512/18796553231', '0', '汽车美容师', '岗位职责: 负责返厂汽车的美容保养工作\r\n任职资格: 有一年以上工作经验；\r\n工作时间: 早上8：00-晚上9：00', 'be1,be2,be3,be4,be6,be7', '金山桥一汽大众工作室', '43', '1', '2016-02-10 22:22:57', 'A', '2016-02-10 22:22:57', null, null);
INSERT INTO `recruit` VALUES ('62', '电力维护人员', 'sl5', '2', 'bk', '0', null, '吴天旺', '89923232/18976882212', '0', '电力维护人员', '岗位职责: 保障电力稳定传输；\r\n任职资格: 有3年以上工作经验；\r\n工作时间: 早九晚五；', null, '华北电力公司', '36', '1', '2016-02-10 22:34:23', 'A', '2016-02-10 23:03:07', null, null);
INSERT INTO `recruit` VALUES ('65', '证券交易所急招网络安全人员', 'sl6', '123', 'bk', '0', null, '刘一道', '15569098900', '0', '网络交易安全', '岗位职责: 网络交易安全\r\n任职资格: 网络交易安全\r\n工作时间: 早九晚五', null, '上海虹桥机场南广场办公楼1002', '34', '1', '2016-02-10 23:42:08', 'A', '2016-02-11 22:45:50', null, null);
INSERT INTO `recruit` VALUES ('66', '西树泡芙开业大吉，招服务员10名', 'sl4', '10', 'profall', '0', '2016-02-11 17:15:49', '李先生', '13412514543', '0', '服务员', '工作时间:afbsbdzxcxvdsxz送饭的vsdsdf诗圣杜甫斯蒂芬斯蒂芬广东东莞贵妇狗', 'be1,be4,be7,be8', '呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵', '38', '2', '2016-02-06 14:38:25', 'D', '2016-02-06 14:38:25', '', '');
INSERT INTO `recruit` VALUES ('67', '羊肉馆缺的就是 经理', 'sl4', '1', 'bk', '0', '2016-02-11 17:15:52', '张全蛋', '3838438', '0', '大堂经理', '工作时间:，大堂经理最潇洒，大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒', 'be1,be2,be3,be4', '徐州市沛县龙固时尚街区', '38', '2', '2016-02-06 16:38:34', 'A', '2016-02-06 16:38:34', '', '');
INSERT INTO `recruit` VALUES ('68', '朱氏土灶台', 'sl2', '2', 'profall', '0', '2016-02-11 17:15:55', '朱正玉', '19873661127', '1', '洗碗工', '工作时间:呵呵额呵呵我试试看，呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看', 'be1,be4,be8', '苏州科技园小吃一条街', '38', '2', '2016-02-06 20:23:12', 'A', '2016-02-11 20:45:34', '', '');
INSERT INTO `recruit` VALUES ('69', '聘请秘书一名', 'sl4', '1', 'yjs', '0', null, '刘局长', '89970796', '0', '专职秘书', '岗位职责: 专职秘书专职秘书专职秘书专职秘书专职秘书专职秘书\r\n任职资格: 专职秘书专职秘书专职秘书\r\n工作时间:', 'be3,be4,be5,be6,be7,be8,be10,be9', '徐州市工商管理局', '34', '1', '2016-02-11 22:03:30', 'A', '2016-02-11 22:03:30', null, null);

-- ----------------------------
-- Table structure for recruit_unit
-- ----------------------------
DROP TABLE IF EXISTS `recruit_unit`;
CREATE TABLE `recruit_unit` (
  `unit_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '招聘单位标识',
  `unit_name` varchar(30) NOT NULL COMMENT '单位名称',
  `industry` varchar(30) NOT NULL COMMENT '所属行业',
  `property` varchar(30) DEFAULT NULL COMMENT '单位性质',
  `scale` varchar(30) DEFAULT NULL COMMENT '单位规模',
  `unit_desc` text COMMENT '单位简介',
  `unit_web` varchar(30) DEFAULT NULL COMMENT '单位网站',
  `user_id` int(8) NOT NULL COMMENT '该公司创建者标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`unit_id`),
  KEY `FK_RECRUIT_UNIT_USERID` (`user_id`),
  CONSTRAINT `FK_RECRUIT_UNIT_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruit_unit
-- ----------------------------
INSERT INTO `recruit_unit` VALUES ('34', '上海虹桥证券交易所', 'cwjrbx', 'gy', 's5', '本公司是上海市证券交易中心，绝大部分的证券交易由本公司审查，同时，我公司肩负实现中国伟大复兴的历史重任；\r\n\r\n本公司本着为人民服务的理念服务大众', 'www.shanghai.zhengquan.com', '1', 'A', '2016-02-05 15:16:14');
INSERT INTO `recruit_unit` VALUES ('36', '太平洋电力公司', 'txdx', 'gy', 's1', '双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划双方的购房贷款累计开户及规划', '', '1', 'A', '2016-02-05 15:46:06');
INSERT INTO `recruit_unit` VALUES ('37', '黄焖鸡徐州万达分店', 'fwy', 'sy', 's1', '黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香黄焖鸡，一品香', '', '5', 'A', '2016-02-05 15:52:40');
INSERT INTO `recruit_unit` VALUES ('38', '西树泡芙', 'fwy', 'sy', 's1', '泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，泡芙还是西树的好，', '', '1', 'A', '2016-02-05 15:56:15');
INSERT INTO `recruit_unit` VALUES ('39', '徐州重工', 'zgzzy', 'gy', 's4', '机械化进程是推动国家向发达国家发展的动力之一\r\n机械化进程是推动国家向发达国家发展的动力之一机械化进程是推动国家向发达国家发展的动力之一\r\n机械化进程是推动国家向发达国家发展的动力之一机械化进程是推动国家向发达国家发展的动力之一机械化进程是推动国家向发达国家发展的动力之一机械化进程是推动国家向发达国家发展的动力之一', '', '3', 'A', '2016-02-05 15:59:38');
INSERT INTO `recruit_unit` VALUES ('43', '一汽大众', 'zgzzy', 'ssgs', 's3', '一汽大众值得信赖，    一汽大众值得信赖，    一汽大众值得信赖，    一汽大众值得信赖，    一汽大众值得信赖；\r\n      一汽大众值得信赖，    一汽大众值得信赖，    一汽大众值得信赖，    一汽大众值得信赖，    一汽大众值得信赖，', 'www.yiqidazhong.com', '1', 'A', '2016-02-05 18:58:40');
INSERT INTO `recruit_unit` VALUES ('44', '薇拉摄影室', 'fwy', 'sy', 's1', '专业拍摄婚纱照，情侣写真；专业拍摄婚纱照，情侣写真；专业拍摄婚纱照，情侣写真；专业拍摄婚纱照，情侣写真；专业拍摄婚纱照，情侣写真；\r\n\r\n专业拍摄婚纱照，情侣写真；专业拍摄婚纱照，情侣写真；专业拍摄婚纱照，情侣写真；专业拍摄婚纱照，情侣写真；专业拍摄婚纱照，情侣写真；', '', '4', 'A', '2016-02-05 19:05:32');
INSERT INTO `recruit_unit` VALUES ('45', '徐州化工', 'nykchb', 'gy', 's4', '徐州化工徐州化工徐州化工徐州化工徐州化工徐州化工徐州化工徐州化工徐州化工徐州化工徐州化工徐州化工徐州化工徐州化工', '', '2', 'A', '2016-02-11 00:07:51');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复标识',
  `content` varchar(500) NOT NULL COMMENT '回复内容',
  `create_time` datetime NOT NULL COMMENT '回复时间',
  `user_id` int(8) NOT NULL COMMENT '回复人标识',
  `msg_id` int(11) NOT NULL COMMENT '留言标识',
  PRIMARY KEY (`reply_id`),
  KEY `FK_REPLY_USERID` (`user_id`),
  KEY `FK_REPLY_MSGID` (`msg_id`),
  CONSTRAINT `FK_REPLY_MSGID` FOREIGN KEY (`msg_id`) REFERENCES `message` (`msg_id`),
  CONSTRAINT `FK_REPLY_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for resume_post
-- ----------------------------
DROP TABLE IF EXISTS `resume_post`;
CREATE TABLE `resume_post` (
  `recruit_id` int(8) NOT NULL,
  `resume_id` int(8) NOT NULL,
  `create_time` datetime NOT NULL,
  `state` char(2) NOT NULL,
  `state_time` datetime DEFAULT NULL,
  KEY `FK_RESUME_POST_RESUMEID` (`resume_id`),
  KEY `FK_RESUME_POST_RECRUITID` (`recruit_id`),
  CONSTRAINT `FK_RESUME_POST_RECRUITID` FOREIGN KEY (`recruit_id`) REFERENCES `recruit` (`recruit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RESUME_POST_RESUMEID` FOREIGN KEY (`resume_id`) REFERENCES `user_resume` (`resume_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resume_post
-- ----------------------------
INSERT INTO `resume_post` VALUES ('56', '1', '2016-02-09 13:36:17', 'A', '2016-02-09 13:36:17');
INSERT INTO `resume_post` VALUES ('69', '1', '2016-02-15 22:40:58', 'A', '2016-02-15 22:40:58');
INSERT INTO `resume_post` VALUES ('65', '1', '2016-02-15 22:42:03', 'A', '2016-02-15 22:42:03');
INSERT INTO `resume_post` VALUES ('57', '1', '2016-02-15 22:50:26', 'A', '2016-02-15 22:50:26');
INSERT INTO `resume_post` VALUES ('68', '1', '2016-02-15 22:53:48', 'A', '2016-02-15 22:53:48');
INSERT INTO `resume_post` VALUES ('60', '1', '2016-02-15 23:02:05', 'A', '2016-02-15 23:02:05');
INSERT INTO `resume_post` VALUES ('27', '1', '2016-02-16 15:47:20', 'A', '2016-02-16 15:47:20');

-- ----------------------------
-- Table structure for right
-- ----------------------------
DROP TABLE IF EXISTS `right`;
CREATE TABLE `right` (
  `right_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '权限标识',
  `right_name` varchar(20) DEFAULT NULL COMMENT '权限名',
  `right_pos` int(4) NOT NULL COMMENT '权限位',
  `right_code` bigint(64) NOT NULL COMMENT '权限码',
  `right_URL` varchar(200) NOT NULL COMMENT '权限路径',
  `is_public` char(1) NOT NULL COMMENT '是否公共资源',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right
-- ----------------------------
INSERT INTO `right` VALUES ('151', '未命名', '0', '1', '/dict/deleteDict', '0', 'A', '2016-02-12 02:04:10');
INSERT INTO `right` VALUES ('152', '未命名', '0', '2', '/dict/queryDicts', '0', 'A', '2016-02-12 02:04:10');
INSERT INTO `right` VALUES ('153', '未命名', '0', '4', '/dict/updateDict', '0', 'A', '2016-02-12 02:04:10');
INSERT INTO `right` VALUES ('154', '未命名', '0', '8', '/dict/getAllDicts', '0', 'A', '2016-02-12 02:04:10');
INSERT INTO `right` VALUES ('155', '未命名', '0', '16', '/dict/addDict', '0', 'A', '2016-02-12 02:04:10');
INSERT INTO `right` VALUES ('156', '未命名', '0', '32', '/dict/indexDict', '0', 'A', '2016-02-12 02:04:10');
INSERT INTO `right` VALUES ('157', '未命名', '0', '64', '/dict/updateDictSubmit', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('158', '未命名', '0', '128', '/dict/addDictSubmit', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('159', '未命名', '0', '256', '/dictData/addDictData', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('160', '未命名', '0', '512', '/dictData/queryDictData', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('161', '未命名', '0', '1024', '/dictData/indexDictData', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('162', '未命名', '0', '2048', '/dictData/addDictDataSubmit', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('163', '未命名', '0', '4096', '/flat/createFlat', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('164', '未命名', '0', '8192', '/flat/createFlatSubmit', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('165', '未命名', '0', '16384', '/job/recoverJobs', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('166', '未命名', '0', '32768', '/job/auditJob', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('167', '未命名', '0', '65536', '/job/setTopJob', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('168', '未命名', '0', '131072', '/job/deleteJob', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('169', '未命名', '0', '262144', '/job/auditJobs', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('170', '未命名', '0', '524288', '/job/recoverJob', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('171', '未命名', '0', '1048576', '/job/removeJobs', '0', 'A', '2016-02-12 02:04:11');
INSERT INTO `right` VALUES ('172', '未命名', '0', '2097152', '/job/queryJobs', '0', 'A', '2016-02-12 02:04:12');
INSERT INTO `right` VALUES ('173', '未命名', '0', '4194304', '/job/removeJob', '0', 'A', '2016-02-12 02:04:12');
INSERT INTO `right` VALUES ('174', '未命名', '0', '8388608', '/job/cancelTopJob', '0', 'A', '2016-02-12 02:04:12');
INSERT INTO `right` VALUES ('175', '未命名', '0', '16777216', '/job/createJob', '0', 'A', '2016-02-12 02:04:12');
INSERT INTO `right` VALUES ('176', '未命名', '0', '33554432', '/job/deleteJobs', '0', 'A', '2016-02-12 02:04:12');
INSERT INTO `right` VALUES ('177', '未命名', '0', '67108864', '/job', '0', 'A', '2016-02-12 02:04:12');
INSERT INTO `right` VALUES ('178', '未命名', '0', '134217728', '/job/detailJob', '0', 'A', '2016-02-12 02:04:12');
INSERT INTO `right` VALUES ('179', '未命名', '0', '268435456', '/job/createJobSubmit', '0', 'A', '2016-02-12 02:04:12');
INSERT INTO `right` VALUES ('180', '未命名', '0', '536870912', '/login/manage', '1', 'A', '2016-02-12 02:04:12');
INSERT INTO `right` VALUES ('181', '未命名', '0', '1073741824', '/login/logout', '1', 'A', '2016-02-12 02:04:13');
INSERT INTO `right` VALUES ('182', '未命名', '0', '2147483648', '/login/loginValidate', '1', 'A', '2016-02-12 02:04:13');
INSERT INTO `right` VALUES ('183', '未命名', '0', '4294967296', '/manage', '0', 'A', '2016-02-12 02:04:13');
INSERT INTO `right` VALUES ('184', '页面错误处理', '0', '8589934592', '/error/{errCode}', '1', 'A', '2016-02-12 02:04:13');
INSERT INTO `right` VALUES ('185', '未命名', '0', '17179869184', '/manage/welcome', '0', 'A', '2016-02-12 02:04:13');
INSERT INTO `right` VALUES ('186', '未命名', '0', '34359738368', '/right/updateRight', '0', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('187', '未命名', '0', '68719476736', '/right/queryRights', '0', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('188', '未命名', '0', '137438953472', '/right/indexRight', '0', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('189', '未命名', '0', '274877906944', '/right/addRight', '0', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('190', '未命名', '0', '549755813888', '/right/updateRightSubmit', '0', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('191', '未命名', '0', '1099511627776', '/right/scanAddRights', '0', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('192', '系统留言', '0', '2199023255552', '/message/contactUs', '1', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('193', '未命名', '0', '4398046511104', '/my/profile', '0', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('194', '未命名', '0', '8796093022208', '/my', '0', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('195', '未命名', '0', '17592186044416', '/resume/postResume', '0', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('196', '未命名', '0', '35184372088832', '/login', '1', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('197', '前台首页', '0', '70368744177664', '/index', '1', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('198', '未命名', '0', '140737488355328', '/recruit/addRecruit', '0', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('199', '', '0', '281474976710656', '/recruit', '1', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('200', '查找招聘信息', '0', '562949953421312', '/recruit/queryRecruits', '1', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('201', '', '0', '1125899906842624', '/recruit/detailRecruit', '1', 'A', '2016-02-12 02:04:14');
INSERT INTO `right` VALUES ('202', '未命名', '0', '2251799813685248', '/recruit/addRecruitSubmit', '0', 'A', '2016-02-12 02:04:15');
INSERT INTO `right` VALUES ('203', '未命名', '0', '4503599627370496', '/recruit/recruitSuccess', '0', 'A', '2016-02-12 02:04:15');
INSERT INTO `right` VALUES ('204', '未命名', '0', '9007199254740992', '/unit/selectUnit', '0', 'A', '2016-02-12 02:04:15');
INSERT INTO `right` VALUES ('205', '未命名', '0', '18014398509481984', '/unit/addUnit', '0', 'A', '2016-02-12 02:04:15');
INSERT INTO `right` VALUES ('206', '未命名', '0', '36028797018963968', '/unit/addUnitSubmit', '0', 'A', '2016-02-12 02:04:15');
INSERT INTO `right` VALUES ('207', '班级录界面', '0', '72057594037927936', '/class', '1', 'A', '2016-02-17 21:25:21');
INSERT INTO `right` VALUES ('208', '未命名', '0', '144115188075855872', '/my/profile/basic', '0', 'A', '2016-02-17 21:25:21');
INSERT INTO `right` VALUES ('209', '未命名', '0', '288230376151711744', '/my/profile/job', '0', 'A', '2016-02-17 21:25:21');
INSERT INTO `right` VALUES ('210', '未命名', '0', '576460752303423488', '/my/profile/detail', '0', 'A', '2016-02-17 21:25:21');
INSERT INTO `right` VALUES ('211', '未命名', '0', '1152921504606846976', '/my/profile/portrait', '0', 'A', '2016-02-17 21:25:21');
INSERT INTO `right` VALUES ('212', '未命名', '1', '1', '/login/validate', '1', 'A', '2016-02-17 21:25:21');
INSERT INTO `right` VALUES ('213', '班级录概览', '1', '2', '/class/outlineClass', '1', 'A', '2016-02-18 11:22:05');
INSERT INTO `right` VALUES ('214', '查询班级', '1', '4', '/class/queryClasses', '1', 'A', '2016-02-18 14:33:53');
INSERT INTO `right` VALUES ('215', '未命名', '1', '8', '/classroom/directory', '0', 'A', '2016-02-21 19:34:02');
INSERT INTO `right` VALUES ('216', '班级主页', '1', '16', '/classroom', '1', 'A', '2016-02-21 19:34:03');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '角色标识',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `role_value` char(5) NOT NULL COMMENT '角色值',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for role_right
-- ----------------------------
DROP TABLE IF EXISTS `role_right`;
CREATE TABLE `role_right` (
  `role_id` int(8) NOT NULL COMMENT '角色标识',
  `right_id` int(8) NOT NULL COMMENT '权限标识',
  KEY `FK_ROLE_RIGHT_ROLEID` (`role_id`),
  KEY `FK_ROLE_RIGHT_RIGHTID` (`right_id`),
  CONSTRAINT `FK_ROLE_RIGHT_RIGHTID` FOREIGN KEY (`right_id`) REFERENCES `right` (`right_id`),
  CONSTRAINT `FK_ROLE_RIGHT_ROLEID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_right
-- ----------------------------

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `user_id` int(8) NOT NULL COMMENT '分享者标识',
  `info_id` int(11) NOT NULL COMMENT '信息标识',
  `create_time` datetime NOT NULL COMMENT '分享时间',
  `where` varchar(20) NOT NULL,
  KEY `FK_SHARE_USERID` (`user_id`),
  KEY `FK_SHARE_INFOID` (`info_id`),
  CONSTRAINT `FK_SHARE_INFOID` FOREIGN KEY (`info_id`) REFERENCES `information` (`info_id`),
  CONSTRAINT `FK_SHARE_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------

-- ----------------------------
-- Table structure for subscription
-- ----------------------------
DROP TABLE IF EXISTS `subscription`;
CREATE TABLE `subscription` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订阅标识',
  `create_time` datetime NOT NULL COMMENT '订阅时间',
  `info_type` varchar(20) NOT NULL COMMENT '订阅的信息类型',
  `is_email` char(1) NOT NULL COMMENT '是否邮箱订阅',
  `user_id` int(8) NOT NULL COMMENT '订阅者标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`sub_id`),
  KEY `FK_SUBSCRIPTION_USERID` (`user_id`),
  CONSTRAINT `FK_SUBSCRIPTION_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscription
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account` varchar(16) NOT NULL COMMENT '用户帐号',
  `password` varchar(32) NOT NULL COMMENT '用户密码',
  `is_admin` char(1) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `head_image_id` int(8) DEFAULT NULL COMMENT '头像图片标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'sa', '202CB962AC59075B964B07152D234B70', '1', null, null, '2016-01-02 15:01:42', 'A', null);
INSERT INTO `user` VALUES ('2', 'black', '202CB962AC59075B964B07152D234B70', '0', null, '1', '2016-01-15 22:53:27', 'A', null);
INSERT INTO `user` VALUES ('3', 'jenny', '202CB962AC59075B964B07152D234B70', '0', null, null, '2016-01-24 13:17:33', 'A', null);
INSERT INTO `user` VALUES ('4', '20130505238', '202CB962AC59075B964B07152D234B70', '0', null, '2', '2016-02-05 15:09:15', 'A', null);
INSERT INTO `user` VALUES ('5', '20130505240', '202CB962AC59075B964B07152D234B70', '0', null, null, '2016-02-05 15:38:48', 'A', null);
INSERT INTO `user` VALUES ('6', '20130505241', '202CB962AC59075B964B07152D234B70', '0', null, null, '2016-02-05 15:38:48', 'A', '2016-02-05 17:24:50');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_info_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户信息标识',
  `true_name` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `age` char(3) DEFAULT NULL COMMENT '年龄',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `introduce` varchar(200) DEFAULT NULL COMMENT '自我介绍',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq',
  `microblog` varchar(20) DEFAULT NULL COMMENT '微博',
  `wechat` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL COMMENT '住址',
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  `exp1` varchar(100) DEFAULT NULL COMMENT '扩展字段1',
  `exp2` varchar(100) DEFAULT NULL COMMENT '扩展字段2',
  PRIMARY KEY (`user_info_id`),
  KEY `FK_USER_USERINFO` (`user_id`),
  CONSTRAINT `FK_USER_USERINFO` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '董亮亮', '22', '1', '2016-02-19 08:51:31', '作为一个成熟的男人，渴望被爱！！！', '18796221162', '1075512174@qq.com', '1075512174', '家里有小杰', '董学长', '徐州市沛县龙固镇龙东村', '4', 'A', '2016-02-19 08:52:56', null, null);
INSERT INTO `user_info` VALUES ('2', '布朗克', '20', '1', null, '谢谢徐州工程学院的同学的照顾', '15162044824', '3838438@190.com', '3838438', '香蕉人', '海龟大人', '南通市神鬼村', '2', 'A', '2016-02-27 20:19:13', null, null);

-- ----------------------------
-- Table structure for user_job
-- ----------------------------
DROP TABLE IF EXISTS `user_job`;
CREATE TABLE `user_job` (
  `job_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户工作标识',
  `job_name` varchar(30) NOT NULL COMMENT '工作名称',
  `job_unit` varchar(30) NOT NULL COMMENT '工作单位',
  `date_start` date NOT NULL COMMENT '工作开始时间',
  `date_end` date DEFAULT NULL COMMENT '工作结束日期',
  `job_desc` varchar(200) DEFAULT NULL COMMENT '工作描述',
  `isPublic` char(1) DEFAULT NULL COMMENT '工作信息是否公开',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  PRIMARY KEY (`job_id`),
  KEY `FK_USER_USERJOB` (`user_id`),
  CONSTRAINT `FK_USER_USERJOB` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_job
-- ----------------------------

-- ----------------------------
-- Table structure for user_origin
-- ----------------------------
DROP TABLE IF EXISTS `user_origin`;
CREATE TABLE `user_origin` (
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `origin_id` int(8) NOT NULL COMMENT '组织标识',
  `create_time` datetime NOT NULL COMMENT '加入时间',
  `state` char(2) NOT NULL COMMENT '加入状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  KEY `FK_USER_ORIGIN_USERID` (`user_id`),
  KEY `FK_USER_ORIGIN_ORIGINID` (`origin_id`),
  CONSTRAINT `FK_USER_ORIGIN_ORIGINID` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USER_ORIGIN_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_origin
-- ----------------------------
INSERT INTO `user_origin` VALUES ('4', '1', '2016-02-18 22:51:36', 'A', '2016-02-18 22:51:45');
INSERT INTO `user_origin` VALUES ('2', '1', '2016-03-01 22:22:20', 'A', '2016-03-01 22:22:20');

-- ----------------------------
-- Table structure for user_resume
-- ----------------------------
DROP TABLE IF EXISTS `user_resume`;
CREATE TABLE `user_resume` (
  `resume_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户简历标识',
  `resume_title` varchar(20) NOT NULL COMMENT '简历标题，更容易让别人看到',
  `prof_type` varchar(20) NOT NULL COMMENT '职业类型',
  `exp_salary` varchar(10) NOT NULL COMMENT '期望工资',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `sex` char(1) NOT NULL COMMENT '性别',
  `domicile` varchar(50) NOT NULL DEFAULT '' COMMENT '现在居住地',
  `contact` varchar(20) NOT NULL COMMENT '联系方式',
  `introduce` varchar(500) DEFAULT NULL COMMENT '个人简介',
  `image_id` int(11) DEFAULT NULL COMMENT '证件照',
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`resume_id`),
  KEY `FK_USER_RESUME` (`user_id`),
  CONSTRAINT `FK_USER_RESUME` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_resume
-- ----------------------------
INSERT INTO `user_resume` VALUES ('1', '寻觅 程序员的工作', 'HEHE', '3000', 'Mr.Black', '1', '徐州沛县龙固', '18796221162', '我是一个牛逼的人', null, '2', 'A', '2016-02-07 23:11:49', null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `role_id` int(8) NOT NULL COMMENT '角色标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  KEY `FK_USER_ID` (`user_id`),
  KEY `FK_ROLE_ID` (`role_id`),
  CONSTRAINT `FK_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
