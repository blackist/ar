/*
Navicat MySQL Data Transfer

Source Server         : Black-Ubuntu
Source Server Version : 50721
Source Host           : 120.78.202.215:3306
Source Database       : ar

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-03-12 20:01:32
*/

CREATE DATABASE IF NOT EXISTS  ar character set UTF8mb4 collate utf8mb4_bin;

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
  KEY `FK_ACTIVITY_ORIGINID` (`origin_id`),
  CONSTRAINT `FK_ACTIVITY_ORIGINID` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ACTIVITY_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `cover_image` varchar(255) NOT NULL COMMENT '相册封面图片路径',
  `interests` int(4) DEFAULT '0' COMMENT '感兴趣数',
  `origin_id` int(8) NOT NULL COMMENT '相册所属组织标识',
  `user_id` int(8) NOT NULL COMMENT '相册创建者标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL DEFAULT 'A' COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`album_id`),
  KEY `FK_ALBUM_USERID` (`user_id`),
  KEY `FK_ALBUM_ORIGINID` (`origin_id`),
  CONSTRAINT `FK_ALBUM_ORIGINID` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`),
  CONSTRAINT `FK_ALBUM_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('1', '第十届飞思卡尔', '一起参加比赛的日子', 'assets/images/photos/media2.png', '0', '8', '2', '2017-04-29 13:46:24', 'A', '2017-04-29 13:48:03', '', null);
INSERT INTO `album` VALUES ('2', '信电学院单片机设计大赛', '51单片机好有意思', 'assets/images/photos/media6.png', '0', '8', '3', '2017-04-29 14:57:10', 'A', '2017-04-29 14:57:17', null, null);
INSERT INTO `album` VALUES ('3', '院校联赛', '走出校门，比试比试', 'assets/images/photos/media4.png', '0', '8', '4', '2017-04-29 14:57:51', 'A', '2017-04-29 14:58:01', null, null);
INSERT INTO `album` VALUES ('4', '南昌之旅', '国赛', 'assets/images/example/ablum-cover/media-audio.png', '0', '8', '5', '2017-04-29 14:58:40', 'A', '2017-04-29 14:58:44', null, null);
INSERT INTO `album` VALUES ('5', '全国大学生电子设计大赛', '省赛', 'assets/images/example/ablum-cover/media-audio.png', '0', '8', '34', '2017-04-29 15:33:04', 'A', '2017-04-29 15:33:15', null, null);
INSERT INTO `album` VALUES ('15', 'adsf', '', '/ar/pic/upload//2017/05/10/73723bd1-9892-49ce-9388-0a8c16b4017c.png', '0', '14', '2', '2017-05-10 16:57:08', 'A', '2017-05-10 16:57:08', null, null);
INSERT INTO `album` VALUES ('16', '毕业典礼', '', '/ar/pic/upload//2017/05/11/cd8a188d-1eea-4386-9859-2e74e7402f1e.png', '0', '14', '5', '2017-05-11 20:04:28', 'A', '2017-05-11 20:04:28', null, null);
INSERT INTO `album` VALUES ('17', '出游', '', '/ar/pic/upload//2017/05/12/d9985656-128e-4321-b887-d4c6b7827688.jpg', '0', '14', '5', '2017-05-12 14:07:37', 'A', '2017-05-12 14:07:37', null, null);

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
  CONSTRAINT `FK_ALBUM_IMAGE_ALBUMID` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ALBUM_IMAGE_IMAGEID` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album_image
-- ----------------------------
INSERT INTO `album_image` VALUES ('15', '51', '2017-05-10 16:59:02');
INSERT INTO `album_image` VALUES ('15', '52', '2017-05-10 16:59:02');
INSERT INTO `album_image` VALUES ('16', '53', '2017-05-11 20:09:08');
INSERT INTO `album_image` VALUES ('16', '54', '2017-05-11 20:10:33');
INSERT INTO `album_image` VALUES ('16', '55', '2017-05-11 20:11:59');
INSERT INTO `album_image` VALUES ('16', '56', '2017-05-11 20:11:59');
INSERT INTO `album_image` VALUES ('16', '57', '2017-05-11 20:11:59');
INSERT INTO `album_image` VALUES ('16', '58', '2017-05-11 20:11:59');
INSERT INTO `album_image` VALUES ('16', '59', '2017-05-11 20:11:59');
INSERT INTO `album_image` VALUES ('16', '60', '2017-05-11 20:11:59');
INSERT INTO `album_image` VALUES ('17', '61', '2017-05-12 14:07:49');
INSERT INTO `album_image` VALUES ('17', '62', '2017-05-12 14:07:49');
INSERT INTO `album_image` VALUES ('17', '63', '2017-05-12 14:07:49');
INSERT INTO `album_image` VALUES ('17', '64', '2017-05-12 14:07:49');
INSERT INTO `album_image` VALUES ('17', '65', '2017-05-12 14:07:49');
INSERT INTO `album_image` VALUES ('17', '66', '2017-05-12 14:07:49');
INSERT INTO `album_image` VALUES ('16', '67', '2017-05-12 14:08:07');
INSERT INTO `album_image` VALUES ('16', '68', '2017-05-12 14:08:14');
INSERT INTO `album_image` VALUES ('17', '83', '2017-05-17 11:54:42');
INSERT INTO `album_image` VALUES ('17', '84', '2017-05-17 11:54:42');
INSERT INTO `album_image` VALUES ('17', '85', '2017-05-17 11:54:42');
INSERT INTO `album_image` VALUES ('17', '86', '2017-05-17 11:54:42');
INSERT INTO `album_image` VALUES ('17', '87', '2017-05-17 11:54:42');
INSERT INTO `album_image` VALUES ('17', '88', '2017-05-17 11:54:42');
INSERT INTO `album_image` VALUES ('17', '89', '2017-05-17 11:54:42');
INSERT INTO `album_image` VALUES ('17', '90', '2017-05-17 11:54:42');
INSERT INTO `album_image` VALUES ('15', '91', '2017-05-17 13:30:08');
INSERT INTO `album_image` VALUES ('15', '92', '2017-05-17 13:30:08');
INSERT INTO `album_image` VALUES ('15', '93', '2017-05-17 13:30:08');
INSERT INTO `album_image` VALUES ('15', '94', '2017-05-17 13:30:08');
INSERT INTO `album_image` VALUES ('15', '95', '2017-05-18 13:32:24');

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `atta_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件标识',
  `atta_type` varchar(20) NOT NULL COMMENT '附件类型',
  `atta_name` varchar(32) NOT NULL COMMENT '附件名称',
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

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
INSERT INTO `comment` VALUES ('34', '1楼', '2017-04-10 20:12:37', '3', '29');
INSERT INTO `comment` VALUES ('36', '3楼', '2017-04-10 20:13:21', '3', '29');
INSERT INTO `comment` VALUES ('37', '4楼', '2017-04-10 21:10:39', '4', '29');
INSERT INTO `comment` VALUES ('38', '5楼', '2017-04-10 21:10:57', '5', '29');
INSERT INTO `comment` VALUES ('39', '6楼', '2017-04-10 21:11:11', '6', '29');
INSERT INTO `comment` VALUES ('40', '7楼', '2017-04-10 21:11:27', '4', '29');
INSERT INTO `comment` VALUES ('42', '9楼', '2017-04-10 21:11:53', '3', '29');
INSERT INTO `comment` VALUES ('43', '10楼', '2017-04-10 21:12:05', '4', '29');
INSERT INTO `comment` VALUES ('44', '11楼', '2017-04-10 21:12:19', '5', '29');
INSERT INTO `comment` VALUES ('45', '12楼', '2017-04-10 21:12:29', '6', '29');
INSERT INTO `comment` VALUES ('46', '13楼', '2017-04-10 21:12:41', '3', '29');
INSERT INTO `comment` VALUES ('47', '14楼', '2017-04-10 21:12:54', '2', '29');
INSERT INTO `comment` VALUES ('48', '15楼', '2017-04-10 21:13:10', '4', '29');
INSERT INTO `comment` VALUES ('49', '16楼', '2017-04-10 21:13:23', '5', '29');
INSERT INTO `comment` VALUES ('50', '17楼', '2017-04-10 21:13:37', '6', '29');
INSERT INTO `comment` VALUES ('51', '18楼', '2017-04-10 21:13:51', '2', '29');
INSERT INTO `comment` VALUES ('52', '19楼', '2017-04-10 21:14:09', '3', '29');
INSERT INTO `comment` VALUES ('53', '20楼', '2017-04-10 21:14:23', '4', '29');
INSERT INTO `comment` VALUES ('54', '21楼', '2017-04-10 21:14:35', '5', '29');
INSERT INTO `comment` VALUES ('55', '22楼', '2017-04-10 21:14:46', '6', '29');
INSERT INTO `comment` VALUES ('57', '作为自发、非盈利性活动平台，羽毛球俱乐部活动收取的相关费用只用于支付场租、购羽毛球、交流赛等各项支出。作为自发集体活动，组织方只负责召集、联络工作。凡参加活动的人员，均视为具有完全独立民事行为能力人，须对自身的安全及健康状况负责。活动中所发生的意外，俱乐部不承担任何法律连带责任。以任何形式参加本俱乐部为主体召集的活动，都将被视为同意以上免责声明，如有异议切勿参加，以免造成不必要的法律纠纷。俱乐部成员间私下发起、开展相关活动所产生的一切后果，亦与俱乐部无关。', '2017-04-10 23:19:55', '2', '29');
INSERT INTO `comment` VALUES ('58', '抢一楼', '2017-04-10 23:24:05', '2', '28');
INSERT INTO `comment` VALUES ('59', '回复 #9 珍妮：回复一下试试', '2017-04-10 23:38:43', '2', '29');
INSERT INTO `comment` VALUES ('60', '2楼也是我的', '2017-04-11 10:00:12', '2', '28');
INSERT INTO `comment` VALUES ('61', '再盖一楼', '2017-04-12 19:25:59', '4', '29');
INSERT INTO `comment` VALUES ('62', '盖一楼', '2017-04-23 14:40:03', '2', '34');
INSERT INTO `comment` VALUES ('63', '再来一楼', '2017-04-23 14:40:25', '2', '34');
INSERT INTO `comment` VALUES ('64', '三楼来了', '2017-04-23 15:44:08', '2', '34');
INSERT INTO `comment` VALUES ('65', 'hehe', '2017-04-25 14:30:16', '2', '33');
INSERT INTO `comment` VALUES ('66', '爱上的风格', '2017-04-25 16:22:53', '2', '34');
INSERT INTO `comment` VALUES ('67', 'zailiyilou', '2017-04-25 16:43:42', '2', '34');
INSERT INTO `comment` VALUES ('68', '呵呵', '2017-04-25 16:44:31', '2', '15');
INSERT INTO `comment` VALUES ('69', '第二楼', '2017-04-25 16:47:53', '2', '15');
INSERT INTO `comment` VALUES ('70', '评论一下', '2017-04-28 14:17:51', '262', '29');
INSERT INTO `comment` VALUES ('71', '来一发', '2017-04-29 12:19:18', '309', '28');
INSERT INTO `comment` VALUES ('72', '冒泡', '2017-04-29 14:33:29', '119', '29');
INSERT INTO `comment` VALUES ('73', '抢楼了', '2017-05-03 21:51:24', '125', '58');
INSERT INTO `comment` VALUES ('74', '回复 #2 布莱克：', '2017-05-05 17:53:23', '5', '34');
INSERT INTO `comment` VALUES ('75', '很不錯的帖子', '2017-05-08 16:22:18', '5', '29');
INSERT INTO `comment` VALUES ('76', 'uds', '2017-05-11 23:58:23', '304', '77');
INSERT INTO `comment` VALUES ('77', '回复 #1 陈雷雷：的液体v', '2017-05-11 23:58:34', '304', '77');
INSERT INTO `comment` VALUES ('78', 'sdsg', '2017-05-17 15:33:55', '2', '84');
INSERT INTO `comment` VALUES ('79', '盖楼了', '2017-05-17 15:39:27', '2', '93');
INSERT INTO `comment` VALUES ('80', '盖楼了', '2017-05-17 15:42:09', '2', '93');
INSERT INTO `comment` VALUES ('81', '盖楼了', '2017-05-17 15:42:45', '2', '85');
INSERT INTO `comment` VALUES ('82', '再来一层', '2017-05-17 15:53:05', '2', '85');
INSERT INTO `comment` VALUES ('83', '再来一发', '2017-05-18 08:41:52', '2', '93');
INSERT INTO `comment` VALUES ('84', '抢沙发', '2017-05-18 08:43:30', '2', '67');
INSERT INTO `comment` VALUES ('85', '要工作了', '2017-05-18 13:48:52', '154', '94');
INSERT INTO `comment` VALUES ('87', '盖楼了', '2017-05-18 14:31:43', '4', '91');
INSERT INTO `comment` VALUES ('89', '二楼抢沙发', '2017-05-19 17:26:25', '271', '91');
INSERT INTO `comment` VALUES ('90', '思念是一种毒药', '2017-05-19 17:29:25', '271', '78');
INSERT INTO `comment` VALUES ('91', '蹭热度', '2017-05-19 17:35:07', '271', '23');
INSERT INTO `comment` VALUES ('92', '系统不错', '2017-05-19 23:08:51', '268', '97');
INSERT INTO `comment` VALUES ('93', '值得表扬', '2017-05-19 23:08:58', '268', '97');
INSERT INTO `comment` VALUES ('94', '克隆空间', '2017-05-19 23:14:27', '268', '106');
INSERT INTO `comment` VALUES ('95', '测试评论', '2019-03-09 20:53:23', '2', '76');
INSERT INTO `comment` VALUES ('96', '测试评论', '2019-03-09 21:13:18', '2', '93');

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `dict_value` varchar(20) NOT NULL COMMENT '字典值，固定，不可变',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名',
  `remark` varchar(200) DEFAULT NULL COMMENT '字典备注',
  PRIMARY KEY (`dict_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('at', '相册类型', 'album type, 相册的分类， 班级相册，校友组织分类');
INSERT INTO `dictionary` VALUES ('be', '职位福利', 'benifit  职位福利');
INSERT INTO `dictionary` VALUES ('g', '游戏', 'game');
INSERT INTO `dictionary` VALUES ('in', '消息类型', 'information的类型，新闻/班级动态/帖子/校友动态/捐赠信息/系统留言');
INSERT INTO `dictionary` VALUES ('ind', '招聘公司所属行业', 'industry 行业, 招聘公司所属行业');
INSERT INTO `dictionary` VALUES ('it', '图片类型', '');
INSERT INTO `dictionary` VALUES ('ny', '[是]/[否] 字段填写', '根据字典值 dictdata 显示 是/否');
INSERT INTO `dictionary` VALUES ('ot', '组织类型', '班级/校友组织  等团体的类型');
INSERT INTO `dictionary` VALUES ('p', '专业类型', 'profession, 专业类型， 校友/班级所属专业，以及个人简历上的专业名称');
INSERT INTO `dictionary` VALUES ('pro', '公司属性', 'property 公司属性, 共有/私营...');
INSERT INTO `dictionary` VALUES ('prof', '学历', 'profession, 学历选项');
INSERT INTO `dictionary` VALUES ('r', '角色定义', 'role definition, 定义站内各个用户的角色');
INSERT INTO `dictionary` VALUES ('s', '资源', '网站资源');
INSERT INTO `dictionary` VALUES ('sca', '公司规模', 'scale 规模, 1-49/50-99/...');
INSERT INTO `dictionary` VALUES ('sex', '性别', '性别属性，1：男；0：女。');
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
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `dict_value` varchar(20) NOT NULL,
  `dictdata_name` varchar(50) NOT NULL,
  `dictdata_value` varchar(20) NOT NULL,
  `is_fixed` char(1) NOT NULL COMMENT ' 0不固定，1固定；固定就不能再去修改了',
  `is_cancel` char(1) DEFAULT NULL COMMENT '取消标识',
  `parent_id` int(8) DEFAULT NULL COMMENT '父节点，作为简单的树形结构',
  PRIMARY KEY (`id`),
  KEY `FK_DICTIONARYDATA_DICTVALUE` (`dict_value`),
  CONSTRAINT `FK_DICTIONARYDATA_DICTVALUE` FOREIGN KEY (`dict_value`) REFERENCES `dictionary` (`dict_value`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

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
INSERT INTO `dictionary_data` VALUES ('94', 'sex', '男', '1', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('95', 'sex', '女', '0', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('96', 'in', '校园服务', 'SS', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('97', 'ot', '学院', 'INS', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('99', 'in', '论坛帖子', 'BBS', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('100', 'be', '', 'slmy', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('101', 'ot', '校友总会', 'org', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('102', 'ot', '院系分会', 'orgi', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('103', 'ot', '社团分会', 'orgm', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('104', 'ot', '学生协会', 'orgu', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('105', 'ot', '校友组织', 'OI', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('106', 'in', '班级留言', 'CM', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('107', 'in', '校友组织留言', 'OM', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('108', 'it', '相册图片', 'AI', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('109', 'it', '头像', 'PI', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('110', 'it', '信息图片', 'II', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('111', 'in', '校友新闻', 'AN', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('112', 't', '毕业', 'gra', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('113', 't', '工作', 'job', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('114', 't', '校友', 'an', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('115', 'state', '冻结', 'E', '1', null, null);

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
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '2012', '0', '2016-02-16 16:40:53', 'A', '2016-02-16 16:41:28');
INSERT INTO `grade` VALUES ('2', '2013', '2', '2016-02-16 16:41:18', 'A', '2016-02-16 16:41:25');
INSERT INTO `grade` VALUES ('3', '2014', '1', '2016-02-16 16:41:40', 'A', '2016-02-18 13:11:43');
INSERT INTO `grade` VALUES ('4', '2015', '1', '2016-02-16 16:41:50', 'A', '2016-02-16 16:41:54');
INSERT INTO `grade` VALUES ('5', '2016', '1', '2017-05-04 13:40:12', 'A', '2017-05-04 13:52:18');
INSERT INTO `grade` VALUES ('6', '2011', '0', '2017-05-04 13:40:33', 'A', '2017-05-04 13:52:21');
INSERT INTO `grade` VALUES ('7', '2010', '0', '2017-05-04 13:40:59', 'A', '2017-05-04 13:52:23');
INSERT INTO `grade` VALUES ('8', '2009', '0', '2017-05-04 13:41:13', 'A', '2017-05-04 13:52:27');
INSERT INTO `grade` VALUES ('9', '2008', '0', '2017-05-04 13:41:35', 'A', '2017-05-04 13:52:29');
INSERT INTO `grade` VALUES ('10', '2007', '0', '2017-05-04 13:55:00', 'A', '2017-05-04 13:55:09');
INSERT INTO `grade` VALUES ('11', '2006', '0', '2017-05-04 13:55:22', 'A', '2017-05-04 13:55:25');
INSERT INTO `grade` VALUES ('12', '2017', '2', '2017-05-18 23:53:25', 'A', '2017-05-18 23:53:29');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片标识',
  `image_name` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `is_remote` char(1) DEFAULT NULL COMMENT '是否远程文件',
  `image_size` varchar(5) DEFAULT NULL COMMENT '图片大小',
  `image_path` varchar(255) NOT NULL COMMENT '图片路径',
  `image_type` varchar(20) DEFAULT NULL COMMENT '图片类型，图文信息的图片/头像/相册图片',
  `is_thumb` char(1) DEFAULT NULL COMMENT '是否生成缩略图',
  `thumb_path` varchar(255) DEFAULT NULL COMMENT '缩略图路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL DEFAULT 'A' COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`image_id`),
  KEY `image_id` (`image_id`,`image_name`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', 'xzit.png', null, null, 'assets/images/logo/xzit.png', null, null, null, null, 'A', null);
INSERT INTO `image` VALUES ('2', 'user2.png', null, null, '/ar-res/pic/portrait/user2.png', null, null, null, null, 'A', null);
INSERT INTO `image` VALUES ('3', null, null, null, '/ar-res/pic/info/blog1.png', null, null, null, null, 'A', null);
INSERT INTO `image` VALUES ('4', null, null, null, '/ar-res/pic/portrait/user6.png', null, null, null, null, 'A', null);
INSERT INTO `image` VALUES ('5', '01.jpg', '0', '0M', '/ar/pic/upload//2017/05/10/8789dbf8-568f-4759-9e5c-7c032dd44a0d.jpg', null, '0', null, '2017-05-10 01:57:03', 'A', '2017-05-10 01:57:03');
INSERT INTO `image` VALUES ('6', '01.jpg', '0', '0M', '/ar/pic/upload//2017/05/10/85e40bba-a92e-45d6-9fbb-462e6301cf79.jpg', null, '0', null, '2017-05-10 02:14:13', 'A', '2017-05-10 02:14:13');
INSERT INTO `image` VALUES ('7', '08.jpg', '0', '0M', '/ar/pic/upload//2017/05/10/074b213e-960d-4da5-b78d-0f3946a9e22c.jpg', 'AI', '0', null, '2017-05-10 02:19:58', 'A', '2017-05-10 02:19:58');
INSERT INTO `image` VALUES ('8', '01.jpg', '0', '0M', '/ar/pic/upload//2017/05/10/82fdb5fa-95d4-44c5-b1a3-f5c859f49366.jpg', 'AI', '0', null, '2017-05-10 02:20:57', 'A', '2017-05-10 02:20:58');
INSERT INTO `image` VALUES ('9', '09 (2).jpg', '0', '0M', '/ar/pic/upload//2017/05/10/d55b03b6-def3-4ef3-ae99-e1e65a044eaf.jpg', 'AI', '0', null, '2017-05-10 02:24:21', 'A', '2017-05-10 02:24:21');
INSERT INTO `image` VALUES ('10', '01.jpg', '0', '0M', '/ar/pic/upload//2017/05/10/a29bdc0e-7c71-4468-a867-15805a05f5dd.jpg', 'AI', '0', null, '2017-05-10 02:26:45', 'A', '2017-05-10 02:26:45');
INSERT INTO `image` VALUES ('11', '11.jpg', '0', '1499M', '/ar/pic/upload//2017/05/10/1380180d-002d-4a06-8f8b-e13412a7ded0.jpg', 'AI', '0', '', '2017-05-10 02:41:18', 'A', '2017-05-10 02:41:18');
INSERT INTO `image` VALUES ('12', '10.jpg', '0', '158M', '/ar/pic/upload//2017/05/10/4bbe30c1-3f9f-4080-a870-558cbacd8e13.jpg', 'AI', '0', '', '2017-05-10 02:47:32', 'A', '2017-05-10 02:47:32');
INSERT INTO `image` VALUES ('13', '10.jpg', '0', '158M', '/ar/pic/upload//2017/05/10/35e6b210-68ad-4894-9ca5-8f4813b1509f.jpg', 'AI', '0', '', '2017-05-10 02:57:11', 'A', '2017-05-10 02:57:11');
INSERT INTO `image` VALUES ('14', '11.jpg', '0', '1499M', '/ar/pic/upload//2017/05/10/9220105f-7165-4aa0-96f5-d644f83079e8.jpg', 'AI', '0', '', '2017-05-10 02:57:11', 'A', '2017-05-10 02:57:11');
INSERT INTO `image` VALUES ('15', '01.jpg', '0', '179M', '/ar/pic/upload//2017/05/10/c41dc755-fa5d-47ad-9258-5e579a5bf1cf.jpg', 'AI', '0', '', '2017-05-10 03:00:00', 'A', '2017-05-10 03:00:00');
INSERT INTO `image` VALUES ('16', '02.jpg', '0', '419M', '/ar/pic/upload//2017/05/10/bd04ab98-b010-4119-9055-097ad2dfab6c.jpg', 'AI', '0', '', '2017-05-10 03:00:00', 'A', '2017-05-10 03:00:00');
INSERT INTO `image` VALUES ('17', '03.jpg', '0', '102M', '/ar/pic/upload//2017/05/10/048023ba-c345-4f96-a5bd-501ed1827204.jpg', 'AI', '0', '', '2017-05-10 03:00:00', 'A', '2017-05-10 03:00:00');
INSERT INTO `image` VALUES ('18', '04.jpg', '0', '353M', '/ar/pic/upload//2017/05/10/ffccc981-4fa6-4915-9d9a-a17cc82df773.jpg', 'AI', '0', '', '2017-05-10 03:00:00', 'A', '2017-05-10 03:00:00');
INSERT INTO `image` VALUES ('19', '05.jpg', '0', '492M', '/ar/pic/upload//2017/05/10/1ec9a157-580b-414e-a9d6-5e5cd49e354d.jpg', 'AI', '0', '', '2017-05-10 03:00:00', 'A', '2017-05-10 03:00:00');
INSERT INTO `image` VALUES ('20', '06.jpg', '0', '391M', '/ar/pic/upload//2017/05/10/fe8cbe04-d8c0-479d-b342-d53faf590580.jpg', 'AI', '0', '', '2017-05-10 03:00:00', 'A', '2017-05-10 03:00:00');
INSERT INTO `image` VALUES ('21', '07.jpg', '0', '176M', '/ar/pic/upload//2017/05/10/01b8e342-38d6-4924-b9aa-28fd950aa68b.jpg', 'AI', '0', '', '2017-05-10 03:00:00', 'A', '2017-05-10 03:00:00');
INSERT INTO `image` VALUES ('22', '08.jpg', '0', '98M', '/ar/pic/upload//2017/05/10/8ac9dc6f-39c3-4a86-afd2-2e1d81932386.jpg', 'AI', '0', '', '2017-05-10 03:00:00', 'A', '2017-05-10 03:00:00');
INSERT INTO `image` VALUES ('23', '09 (2).jpg', '0', '665M', '/ar/pic/upload//2017/05/10/68bf178b-b401-4010-aa64-6ce43df8b1d8.jpg', 'AI', '0', '', '2017-05-10 03:00:00', 'A', '2017-05-10 03:00:00');
INSERT INTO `image` VALUES ('24', '09.jpg', '0', '413M', '/ar/pic/upload//2017/05/10/25d94b8d-eb8b-4f90-afa5-8e323a970550.jpg', 'AI', '0', '', '2017-05-10 03:00:00', 'A', '2017-05-10 03:00:00');
INSERT INTO `image` VALUES ('25', '01.jpg', '0', '179M', '/ar/pic/upload//2017/05/10/9cf36056-088c-41c9-a20c-34367a14108d.jpg', 'AI', '0', '', '2017-05-10 10:57:28', 'A', '2017-05-10 10:57:28');
INSERT INTO `image` VALUES ('26', '02.jpg', '0', '419M', '/ar/pic/upload//2017/05/10/654859ba-30dd-4cba-a747-fc0443df8cc9.jpg', 'AI', '0', '', '2017-05-10 10:57:28', 'A', '2017-05-10 10:57:28');
INSERT INTO `image` VALUES ('27', '03.jpg', '0', '102M', '/ar/pic/upload//2017/05/10/b2e6e7be-e53c-44d2-a3c1-773c4604f6f8.jpg', 'AI', '0', '', '2017-05-10 10:57:28', 'A', '2017-05-10 10:57:28');
INSERT INTO `image` VALUES ('28', '04.jpg', '0', '353M', '/ar/pic/upload//2017/05/10/69c41e1d-4a3b-4095-a3cb-73f9527ce2e0.jpg', 'AI', '0', '', '2017-05-10 10:57:28', 'A', '2017-05-10 10:57:28');
INSERT INTO `image` VALUES ('29', '05.jpg', '0', '492M', '/ar/pic/upload//2017/05/10/d8218519-d983-4024-8c72-631ddf91e73e.jpg', 'AI', '0', '', '2017-05-10 10:57:28', 'A', '2017-05-10 10:57:28');
INSERT INTO `image` VALUES ('30', '06.jpg', '0', '391M', '/ar/pic/upload//2017/05/10/7dfcce55-8adf-47b7-bf99-eb767e0a2797.jpg', 'AI', '0', '', '2017-05-10 10:57:28', 'A', '2017-05-10 10:57:28');
INSERT INTO `image` VALUES ('31', '07.jpg', '0', '176M', '/ar/pic/upload//2017/05/10/c3592ed2-2001-4a23-a89e-66c9a665939d.jpg', 'AI', '0', '', '2017-05-10 10:57:28', 'A', '2017-05-10 10:57:28');
INSERT INTO `image` VALUES ('32', 'Cg-4V1IUNNuIBNNaAAlK2OQMbo4AAK6', '0', '159M', '/ar/pic/upload//2017/05/10/4a0da00d-f080-4a4f-bc7f-63db298fddd0.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/4a0da00d-f080-4a4f-bc7f-63db298fddd0.jpg', '2017-05-10 11:32:49', 'A', '2017-05-10 11:32:49');
INSERT INTO `image` VALUES ('33', 'Cg-4WFILK76IDNarAAXNsO3SQ9MAAKz', '0', '94M', '/ar/pic/upload//2017/05/10/69ade361-fbf4-4e5d-9201-10c7523d7b1a.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/69ade361-fbf4-4e5d-9201-10c7523d7b1a.jpg', '2017-05-10 11:33:32', 'A', '2017-05-10 11:33:32');
INSERT INTO `image` VALUES ('34', '', '0', '877M', '/ar/pic/upload//2017/05/10/11890ceb-e52f-4cb5-8413-b23989608214.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/11890ceb-e52f-4cb5-8413-b23989608214.jpg', '2017-05-10 14:27:01', 'A', '2017-05-10 14:27:01');
INSERT INTO `image` VALUES ('35', '', '0', '357M', '/ar/pic/upload//2017/05/10/59d4b032-542f-4b75-af6f-b4013c3b2660.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/59d4b032-542f-4b75-af6f-b4013c3b2660.jpg', '2017-05-10 14:27:02', 'A', '2017-05-10 14:27:02');
INSERT INTO `image` VALUES ('36', '', '0', '676M', '/ar/pic/upload//2017/05/10/4b1f8d8c-eb08-40b7-a5a1-f5e5797af3f8.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/4b1f8d8c-eb08-40b7-a5a1-f5e5797af3f8.jpg', '2017-05-10 14:27:02', 'A', '2017-05-10 14:27:02');
INSERT INTO `image` VALUES ('37', '', '0', '173M', '/ar/pic/upload//2017/05/10/2dd329dd-f082-4203-90f9-ce2d38315671.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/2dd329dd-f082-4203-90f9-ce2d38315671.jpg', '2017-05-10 14:27:02', 'A', '2017-05-10 14:27:02');
INSERT INTO `image` VALUES ('38', '', '0', '662M', '/ar/pic/upload//2017/05/10/ee3e8420-416c-4b36-bb41-1102aeee3c5f.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/ee3e8420-416c-4b36-bb41-1102aeee3c5f.jpg', '2017-05-10 14:27:02', 'A', '2017-05-10 14:27:02');
INSERT INTO `image` VALUES ('39', '', '0', '704M', '/ar/pic/upload//2017/05/10/93f8d926-629c-48d4-91bd-ee3e10661c2a.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/93f8d926-629c-48d4-91bd-ee3e10661c2a.jpg', '2017-05-10 14:27:02', 'A', '2017-05-10 14:27:02');
INSERT INTO `image` VALUES ('40', '', '0', '289M', '/ar/pic/upload//2017/05/10/cd6f41cb-8df1-4938-bfaf-3d8200bdc6c5.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/cd6f41cb-8df1-4938-bfaf-3d8200bdc6c5.jpg', '2017-05-10 14:27:02', 'A', '2017-05-10 14:27:02');
INSERT INTO `image` VALUES ('41', '01.jpg', '0', '179M', '/ar/pic/upload//2017/05/10/8af6f66d-e4c2-4cec-ad43-40d272f5e196.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/8af6f66d-e4c2-4cec-ad43-40d272f5e196.jpg', '2017-05-10 15:24:53', 'A', '2017-05-10 15:24:53');
INSERT INTO `image` VALUES ('42', '02.jpg', '0', '419M', '/ar/pic/upload//2017/05/10/ee74e2fa-c9a8-4a70-98e5-175d387a4732.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/ee74e2fa-c9a8-4a70-98e5-175d387a4732.jpg', '2017-05-10 15:24:53', 'A', '2017-05-10 15:24:53');
INSERT INTO `image` VALUES ('43', '03.jpg', '0', '102M', '/ar/pic/upload//2017/05/10/6b58ca3d-57bc-480c-b4b5-f774c8afb091.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/6b58ca3d-57bc-480c-b4b5-f774c8afb091.jpg', '2017-05-10 15:24:53', 'A', '2017-05-10 15:24:53');
INSERT INTO `image` VALUES ('44', '04.jpg', '0', '353M', '/ar/pic/upload//2017/05/10/fd77f4a3-3b11-4c05-aa36-bdddb76fb583.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/fd77f4a3-3b11-4c05-aa36-bdddb76fb583.jpg', '2017-05-10 15:24:53', 'A', '2017-05-10 15:24:53');
INSERT INTO `image` VALUES ('45', '05.jpg', '0', '492M', '/ar/pic/upload//2017/05/10/7df1e622-1fb5-4578-98a2-760580a8d646.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/7df1e622-1fb5-4578-98a2-760580a8d646.jpg', '2017-05-10 15:24:54', 'A', '2017-05-10 15:24:54');
INSERT INTO `image` VALUES ('46', '06.jpg', '0', '391M', '/ar/pic/upload//2017/05/10/efe6f563-6078-4481-8870-243eb4f9997b.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/efe6f563-6078-4481-8870-243eb4f9997b.jpg', '2017-05-10 15:24:54', 'A', '2017-05-10 15:24:54');
INSERT INTO `image` VALUES ('47', '07.jpg', '0', '176M', '/ar/pic/upload//2017/05/10/ecabe37b-f0e7-4266-97e5-3a85d6f68784.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/ecabe37b-f0e7-4266-97e5-3a85d6f68784.jpg', '2017-05-10 15:24:54', 'A', '2017-05-10 15:24:54');
INSERT INTO `image` VALUES ('49', '相册.png', '0', '94M', '/ar/pic/upload//2017/05/10/a2fd9798-cbe5-47af-a7c6-c702641587f6.png', 'AI', '0', '/ar/pic/upload//2017/05/10/a2fd9798-cbe5-47af-a7c6-c702641587f6.png', '2017-05-10 16:29:06', 'A', '2017-05-10 16:29:06');
INSERT INTO `image` VALUES ('51', '05.jpg', '0', '492M', '/ar/pic/upload//2017/05/10/dbbb464b-d8ae-455b-9474-13a9afd0148e.jpg', 'AI', '0', '/ar/pic/upload//2017/05/10/dbbb464b-d8ae-455b-9474-13a9afd0148e.jpg', '2017-05-10 16:59:02', 'A', '2017-05-10 16:59:02');
INSERT INTO `image` VALUES ('52', '相册.png', '0', '94M', '/ar/pic/upload//2017/05/10/73723bd1-9892-49ce-9388-0a8c16b4017c.png', 'AI', '0', '/ar/pic/upload//2017/05/10/73723bd1-9892-49ce-9388-0a8c16b4017c.png', '2017-05-10 16:59:02', 'A', '2017-05-10 16:59:02');
INSERT INTO `image` VALUES ('53', 'blackist.png', '0', '84M', '/ar/pic/upload//2017/05/11/ebf0ae53-e4a5-4525-8cc1-08ef98ade1ae.png', 'AI', '0', '/ar/pic/upload//2017/05/11/ebf0ae53-e4a5-4525-8cc1-08ef98ade1ae.png', '2017-05-11 20:09:08', 'A', '2017-05-11 20:09:08');
INSERT INTO `image` VALUES ('54', 'blackist.png', '0', '84M', '/ar/pic/upload//2017/05/11/f15817aa-57ac-422b-b57e-9150daf63b56.png', 'AI', '0', '/ar/pic/upload//2017/05/11/f15817aa-57ac-422b-b57e-9150daf63b56.png', '2017-05-11 20:10:33', 'A', '2017-05-11 20:10:33');
INSERT INTO `image` VALUES ('55', 'coding.net.亮爷也风流.png', '0', '4M', '/ar/pic/upload//2017/05/11/76401881-2f6f-45fd-b7f1-7fe19ce0af19.png', 'AI', '0', '/ar/pic/upload//2017/05/11/76401881-2f6f-45fd-b7f1-7fe19ce0af19.png', '2017-05-11 20:11:59', 'A', '2017-05-11 20:11:59');
INSERT INTO `image` VALUES ('56', 'CSDN.dong161114.png', '0', '4M', '/ar/pic/upload//2017/05/11/cd8a188d-1eea-4386-9859-2e74e7402f1e.png', 'AI', '0', '/ar/pic/upload//2017/05/11/cd8a188d-1eea-4386-9859-2e74e7402f1e.png', '2017-05-11 20:11:59', 'A', '2017-05-11 20:11:59');
INSERT INTO `image` VALUES ('57', 'github.com.亮爷也风流.png', '0', '4M', '/ar/pic/upload//2017/05/11/fa78bb72-aea9-444b-bf22-d45bf1604967.png', 'AI', '0', '/ar/pic/upload//2017/05/11/fa78bb72-aea9-444b-bf22-d45bf1604967.png', '2017-05-11 20:11:59', 'A', '2017-05-11 20:11:59');
INSERT INTO `image` VALUES ('58', 'segmentfault.blackist.png', '0', '5M', '/ar/pic/upload//2017/05/11/06f00581-9f64-4462-94ef-169daa4ea4d4.png', 'AI', '0', '/ar/pic/upload//2017/05/11/06f00581-9f64-4462-94ef-169daa4ea4d4.png', '2017-05-11 20:11:59', 'A', '2017-05-11 20:11:59');
INSERT INTO `image` VALUES ('59', 'wechat.董亮亮.png', '0', '155M', '/ar/pic/upload//2017/05/11/6d4c5be2-f33b-4256-8ad4-f2135b4f4eb3.png', 'AI', '0', '/ar/pic/upload//2017/05/11/6d4c5be2-f33b-4256-8ad4-f2135b4f4eb3.png', '2017-05-11 20:11:59', 'A', '2017-05-11 20:11:59');
INSERT INTO `image` VALUES ('60', 'weibo.亮爷也风流.png', '0', '6M', '/ar/pic/upload//2017/05/11/af895a97-4d1b-459e-ab98-03389717d6c8.png', 'AI', '0', '/ar/pic/upload//2017/05/11/af895a97-4d1b-459e-ab98-03389717d6c8.png', '2017-05-11 20:11:59', 'A', '2017-05-11 20:11:59');
INSERT INTO `image` VALUES ('61', '0V3SA81R1ZJY.jpg', '0', '877M', '/ar/pic/upload//2017/05/12/8fbd0ef9-b00c-4ba4-ba32-0ea73e88b560.jpg', 'AI', '0', '/ar/pic/upload//2017/05/12/8fbd0ef9-b00c-4ba4-ba32-0ea73e88b560.jpg', '2017-05-12 14:07:49', 'A', '2017-05-12 14:07:49');
INSERT INTO `image` VALUES ('62', '5UL77A0Y7SB7.jpg', '0', '357M', '/ar/pic/upload//2017/05/12/d9985656-128e-4321-b887-d4c6b7827688.jpg', 'AI', '0', '/ar/pic/upload//2017/05/12/d9985656-128e-4321-b887-d4c6b7827688.jpg', '2017-05-12 14:07:49', 'A', '2017-05-12 14:07:49');
INSERT INTO `image` VALUES ('63', '9M1A0O5Q67G4.jpg', '0', '676M', '/ar/pic/upload//2017/05/12/285f65a5-d01d-4d7e-89a3-eab8987866ad.jpg', 'AI', '0', '/ar/pic/upload//2017/05/12/285f65a5-d01d-4d7e-89a3-eab8987866ad.jpg', '2017-05-12 14:07:49', 'A', '2017-05-12 14:07:49');
INSERT INTO `image` VALUES ('64', '62D7OT4RBV6L_1000x500.jpg', '0', '173M', '/ar/pic/upload//2017/05/12/40a51a6e-cb5a-42d8-9e31-7d51ab32fe49.jpg', 'AI', '0', '/ar/pic/upload//2017/05/12/40a51a6e-cb5a-42d8-9e31-7d51ab32fe49.jpg', '2017-05-12 14:07:49', 'A', '2017-05-12 14:07:49');
INSERT INTO `image` VALUES ('65', 'X0JP22L6B8XM.jpg', '0', '704M', '/ar/pic/upload//2017/05/12/79962d63-8d0e-4e96-9ec6-5449e6411162.jpg', 'AI', '0', '/ar/pic/upload//2017/05/12/79962d63-8d0e-4e96-9ec6-5449e6411162.jpg', '2017-05-12 14:07:49', 'A', '2017-05-12 14:07:49');
INSERT INTO `image` VALUES ('66', 'Y2YPTBF568S4_1000x500.jpg', '0', '289M', '/ar/pic/upload//2017/05/12/29091d3c-033c-430e-83f2-98a3a5ba3abd.jpg', 'AI', '0', '/ar/pic/upload//2017/05/12/29091d3c-033c-430e-83f2-98a3a5ba3abd.jpg', '2017-05-12 14:07:49', 'A', '2017-05-12 14:07:49');
INSERT INTO `image` VALUES ('67', '5UL77A0Y7SB7.jpg', '0', '357M', '/ar/pic/upload//2017/05/12/a250297e-adf4-4650-be85-03560ec045de.jpg', 'AI', '0', '/ar/pic/upload//2017/05/12/a250297e-adf4-4650-be85-03560ec045de.jpg', '2017-05-12 14:08:07', 'A', '2017-05-12 14:08:07');
INSERT INTO `image` VALUES ('68', '62D7OT4RBV6L_1000x500.jpg', '0', '173M', '/ar/pic/upload//2017/05/12/68f47309-20b7-44b1-9250-6792cbc7c660.jpg', 'AI', '0', '/ar/pic/upload/2017/05/12/68f47309-20b7-44b1-9250-6792cbc7c660.jpg', '2017-05-12 14:08:14', 'A', '2017-05-12 14:08:14');
INSERT INTO `image` VALUES ('77', 'sina.jpg', '0', null, '/ar/pic/upload//2017/05/16f3bc0824-20a5-4aae-b3ea-7c719e85537f.jpg', '', null, '/ar/pic/upload/2017/05/16/f3bc0824-20a5-4aae-b3ea-7c719e85537f.jpg', '2017-05-16 13:02:05', 'A', '2017-05-16 13:02:05');
INSERT INTO `image` VALUES ('78', 'sina.jpg', '0', null, '/ar/pic/upload/2017/05/16/ab98ab79-1ae4-4fe2-83ff-013ed67b14d7.jpg', '', null, '/ar/pic/upload/2017/05/16/ab98ab79-1ae4-4fe2-83ff-013ed67b14d7.jpg', '2017-05-16 13:06:56', 'A', '2017-05-16 13:06:56');
INSERT INTO `image` VALUES ('79', 'github.png', '0', null, '/ar/pic/upload/2017/05/16/6ff16a46-849a-4cd1-b580-220851f9a23f.png', '', null, '/ar/pic/upload/2017/05/16/6ff16a46-849a-4cd1-b580-220851f9a23f.png', '2017-05-16 13:07:00', 'A', '2017-05-16 13:07:00');
INSERT INTO `image` VALUES ('80', 'CSDN.png', '0', null, '/ar/pic/upload/2017/05/17/542fef37-98c5-4534-9222-420859200c26.png', '', null, '/ar/pic/upload/2017/05/17/542fef37-98c5-4534-9222-420859200c26.png', '2017-05-17 10:06:06', 'A', '2017-05-17 10:06:06');
INSERT INTO `image` VALUES ('81', 'gangnamtocat.png', '0', null, '/ar/pic/upload/2017/05/17/2e5a60b8-1af0-4bdc-b93b-fef7dcbaa5cd.png', '', null, '/ar/pic/upload/2017/05/17/2e5a60b8-1af0-4bdc-b93b-fef7dcbaa5cd.png', '2017-05-17 10:07:40', 'A', '2017-05-17 10:07:40');
INSERT INTO `image` VALUES ('82', 'aidorucat.png', '0', null, '/ar/pic/upload/2017/05/17/48174cd2-7923-4a80-8d85-f7f4f38fb09f.png', '', null, '/ar/pic/upload/2017/05/17/48174cd2-7923-4a80-8d85-f7f4f38fb09f.png', '2017-05-17 10:08:53', 'A', '2017-05-17 10:08:53');
INSERT INTO `image` VALUES ('83', '1126.sdt-github.png', '0', '164M', '/ar/pic/upload/2017/05/17/cc313efe-0116-43b9-8bdd-b07eaca6f812.png', 'AI', '0', '/ar/pic/upload/2017/05/17/cc313efe-0116-43b9-8bdd-b07eaca6f812.png', '2017-05-17 11:54:42', 'A', '2017-05-17 11:54:42');
INSERT INTO `image` VALUES ('84', 'aidorucat.png', '0', '79M', '/ar/pic/upload/2017/05/17/2c684460-8706-49c3-9263-bd9299ab2f40.png', 'AI', '0', '/ar/pic/upload/2017/05/17/2c684460-8706-49c3-9263-bd9299ab2f40.png', '2017-05-17 11:54:42', 'A', '2017-05-17 11:54:42');
INSERT INTO `image` VALUES ('85', 'codercat.jpg', '0', '61M', '/ar/pic/upload/2017/05/17/88df43bf-4408-4eea-a8b4-48ce915722a6.jpg', 'AI', '0', '/ar/pic/upload/2017/05/17/88df43bf-4408-4eea-a8b4-48ce915722a6.jpg', '2017-05-17 11:54:42', 'A', '2017-05-17 11:54:42');
INSERT INTO `image` VALUES ('86', 'dojocat.jpg', '0', '66M', '/ar/pic/upload/2017/05/17/94ecfe90-aa6c-4023-b59e-154c7af18d2e.jpg', 'AI', '0', '/ar/pic/upload/2017/05/17/94ecfe90-aa6c-4023-b59e-154c7af18d2e.jpg', '2017-05-17 11:54:42', 'A', '2017-05-17 11:54:42');
INSERT INTO `image` VALUES ('87', 'femalecodertocat.png', '0', '103M', '/ar/pic/upload/2017/05/17/59195bb6-408e-4201-94bb-d3f9482a49fa.png', 'AI', '0', '/ar/pic/upload/2017/05/17/59195bb6-408e-4201-94bb-d3f9482a49fa.png', '2017-05-17 11:54:42', 'A', '2017-05-17 11:54:42');
INSERT INTO `image` VALUES ('88', 'forktocat.jpg', '0', '79M', '/ar/pic/upload/2017/05/17/5b8e12e7-7ce4-4d7d-a5dd-0862cce20d8f.jpg', 'AI', '0', '/ar/pic/upload/2017/05/17/5b8e12e7-7ce4-4d7d-a5dd-0862cce20d8f.jpg', '2017-05-17 11:54:42', 'A', '2017-05-17 11:54:42');
INSERT INTO `image` VALUES ('89', 'founding-father.jpg', '0', '84M', '/ar/pic/upload/2017/05/17/a4b9e4a6-6b85-4ec0-b333-4370f1df9a21.jpg', 'AI', '0', '/ar/pic/upload/2017/05/17/a4b9e4a6-6b85-4ec0-b333-4370f1df9a21.jpg', '2017-05-17 11:54:42', 'A', '2017-05-17 11:54:42');
INSERT INTO `image` VALUES ('90', 'foundingfather_v2.png', '0', '109M', '/ar/pic/upload/2017/05/17/8f08e4b3-b236-49ab-9b2a-17b0ce9ed22e.png', 'AI', '0', '/ar/pic/upload/2017/05/17/8f08e4b3-b236-49ab-9b2a-17b0ce9ed22e.png', '2017-05-17 11:54:42', 'A', '2017-05-17 11:54:42');
INSERT INTO `image` VALUES ('91', '5.jpg.680.510.jpg', '0', '209M', '/ar/pic/upload/2017/05/17/b97e1b7d-14a4-4a53-9f93-554ab3589936.jpg', 'AI', '0', '/ar/pic/upload/2017/05/17/b97e1b7d-14a4-4a53-9f93-554ab3589936.jpg', '2017-05-17 13:30:08', 'A', '2017-05-17 13:30:08');
INSERT INTO `image` VALUES ('92', '0429mlsx27.jpg', '0', '57M', '/ar/pic/upload/2017/05/17/a2cdb021-42fc-4cea-a118-edfe2e6d0af9.jpg', 'AI', '0', '/ar/pic/upload/2017/05/17/a2cdb021-42fc-4cea-a118-edfe2e6d0af9.jpg', '2017-05-17 13:30:08', 'A', '2017-05-17 13:30:08');
INSERT INTO `image` VALUES ('93', '1463553_184407021275_2.jpg', '0', '245M', '/ar/pic/upload/2017/05/17/8c1d1fd5-7007-49e8-9f8f-42b313892b30.jpg', 'AI', '0', '/ar/pic/upload/2017/05/17/8c1d1fd5-7007-49e8-9f8f-42b313892b30.jpg', '2017-05-17 13:30:08', 'A', '2017-05-17 13:30:08');
INSERT INTO `image` VALUES ('94', '2008121122440860_2.jpg', '0', '182M', '/ar/pic/upload/2017/05/17/bc5de3a4-7165-4fd5-a6f4-cae98e92b895.jpg', 'AI', '0', '/ar/pic/upload/2017/05/17/bc5de3a4-7165-4fd5-a6f4-cae98e92b895.jpg', '2017-05-17 13:30:08', 'A', '2017-05-17 13:30:08');
INSERT INTO `image` VALUES ('95', 'xzit-front.jpg', '0', '115M', '/ar/pic/upload/2017/05/18/ac4f40f3-d68c-49ea-a8d2-b56a7ff328d4.jpg', 'AI', '0', '/ar/pic/upload/2017/05/18/ac4f40f3-d68c-49ea-a8d2-b56a7ff328d4.jpg', '2017-05-18 13:32:24', 'A', '2017-05-18 13:32:24');
INSERT INTO `image` VALUES ('96', '2.jpg', '0', null, '/ar/pic/upload/2017/05/19/f8a695ed-ba8d-42e5-bd73-f3d30b5ebb30.jpg', '', null, '/ar/pic/upload/2017/05/19/f8a695ed-ba8d-42e5-bd73-f3d30b5ebb30.jpg', '2017-05-19 23:13:46', 'A', '2017-05-19 23:13:46');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息标识',
  `info_title` varchar(50) DEFAULT '' COMMENT '信息标题',
  `content` text NOT NULL COMMENT '内容',
  `theme` varchar(20) DEFAULT '' COMMENT '主题',
  `thumb_image` varchar(255) DEFAULT '' COMMENT '图文信息缩略图',
  `views` int(4) DEFAULT '0' COMMENT '浏览量',
  `comments` int(4) DEFAULT '0' COMMENT '评论数',
  `loves` int(4) DEFAULT '0' COMMENT '分享次数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_top` char(1) NOT NULL DEFAULT '0' COMMENT '指定标志位',
  `info_type` varchar(20) NOT NULL COMMENT '信息类型',
  `user_id` int(8) NOT NULL COMMENT '信息发布者标识',
  `origin_id` int(8) DEFAULT NULL COMMENT '发布信息的组织',
  `state` char(2) NOT NULL DEFAULT 'A' COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`info_id`),
  KEY `FK_INFORMATION_USERID` (`user_id`),
  KEY `FK_INFORMATION_ORIGINID` (`origin_id`),
  CONSTRAINT `FK_INFORMATION_ORIGINID` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_INFORMATION_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

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
INSERT INTO `information` VALUES ('15', '谔谔同花顺俄而是是忽', '谔谔同花顺俄而是是忽然怀念和健康　看空间就', null, null, '0', '2', '0', '2016-03-01 12:31:26', '0', 'CI', '4', '2', 'A', '2016-03-01 12:31:26');
INSERT INTO `information` VALUES ('16', 'iwoqujsqAK;L', 'iwoqujsqAK;L', null, null, '0', '1', '0', '2016-03-01 12:40:36', '0', 'CI', '4', '1', 'A', '2016-03-01 12:40:36');
INSERT INTO `information` VALUES ('17', '爱克发haskfhds.j快来', '爱克发haskfhds.j快来', null, null, '0', '0', '0', '2016-03-01 15:59:00', '0', 'CI', '4', '1', 'A', '2016-03-01 15:59:00');
INSERT INTO `information` VALUES ('18', '恶搞无法打败你后悔', '恶搞无法打败你后悔', null, null, '0', '0', '0', '2016-03-01 16:28:04', '0', 'CI', '4', '1', 'A', '2016-03-01 16:28:04');
INSERT INTO `information` VALUES ('19', '快点放假萨拉丁福利激发机卡分离', '快点放假萨拉丁福利激发机卡分离', null, null, '0', '0', '0', '2016-03-01 16:29:02', '0', 'CI', '4', '1', 'A', '2016-03-01 16:29:02');
INSERT INTO `information` VALUES ('20', 'uyjumntbsrvsc', 'uyjumntbsrvsc', null, '/img/info/c09cf1d4-37a0-427f-8c9c-bd2d28c0f2f8.jpg', '0', '4', '0', '2016-03-01 16:29:36', '0', 'CI', '4', '1', 'A', '2016-03-01 16:29:36');
INSERT INTO `information` VALUES ('21', null, 'black在这留言', null, null, '0', '0', '0', '2017-02-27 23:18:18', '0', 'CM', '2', '3', 'A', '2017-02-27 23:18:18');
INSERT INTO `information` VALUES ('22', null, '留言测试', null, null, '0', '0', '0', '2017-03-28 15:37:40', '0', 'CM', '2', '3', 'A', '2017-03-28 15:37:40');
INSERT INTO `information` VALUES ('23', '厉害了我的哥', '厉害了我的哥', null, null, '2', '1', '0', '2017-03-28 15:39:01', '0', 'CI', '2', '4', 'A', '2017-03-28 15:39:01');
INSERT INTO `information` VALUES ('24', '我是一个梦想家', '我是一个梦想家', null, null, '0', '0', '0', '2017-03-28 18:31:10', '0', 'CI', '2', '3', 'A', '2017-03-28 18:31:10');
INSERT INTO `information` VALUES ('25', null, '我来了，让我听到你们的声音', null, null, '0', '0', '0', '2017-04-07 10:55:49', '0', 'CM', '2', '4', 'A', '2017-04-07 10:55:49');
INSERT INTO `information` VALUES ('26', '校园行指南', '    玉泉校区位于西湖西北角，紧邻玉泉植物园。校区占地总面积1700多亩，校舍建筑总面积70万平方米。玉泉校区是原浙江大学所在地，现浙江大学党政机关办公所在地。\r\n    目前浙江大学理学院、电气工程学院、机械与能源工程学院、材料与化学工程学院、计算机科学与技术学院、信息科学与工程学院、建筑工程学院、生物医学工程与仪器科学学院、经济学院、管理学院、软件学院11个学院党政机关设在该校区。\r\n\r\n    公交线路：K89、K228(夜)、 K16、82/K82、 815、81/K81、527 、15/K15、21/K21、28/k28\r\n\r\n    旅馆：紫兰酒店、玉泉饭店、西子饭店、灵峰山庄、杭州金乐饭店、百合花饭店、浙江大学竺可桢国际教育大楼、浙江大学招待所、玉泉饭店、西子饭店、灵峰山庄、杭州金乐饭店、杭州百合花饭店。', null, null, '2', '9', '0', '2017-04-07 15:48:55', '0', 'SS', '1', '1', 'A', '2017-04-09 18:58:25');
INSERT INTO `information` VALUES ('27', '走进校园', '徐州工程学院是2002年6月经教育部批准，由始建于1983年的彭城职业大学和始建于1985年的徐州经济管理干部学院合并组建的一所全日制普通本科院校。2006年6月，学校获得学士学位授予权。2007年6月，始建于1959年的徐州教育学院整建制并入。\r\n学校坚持地方性、应用型的办学定位，坚持“立足徐州、面向苏北、服务江苏”的服务定位和为区域经济社会发展培养高素质应用型人才的办学目标，实施“错位发展战略”，大力推进教育教学改革和人才培养模式改革，经过多年的建设和发展，已成为一所主干专业学科对应地方支柱产业，具有一定区位优势的地方高校。目前，学校获批为教育部“卓越工程师教育培养计划”实施高校、江苏省大学生创业教育示范校，被授予江苏省高等学校和谐校园、江苏省文明单位、江苏省五一劳动奖状、江苏省科技富民突出贡献单位等荣誉。\r\n学校现有3个校区，占地面积1990.5亩，校舍面积57.39万平方米，固定资产14.78亿元，教学仪器设备值1.50亿元，设有14个二级学院、1个思想政治理论课教研部和1个成人教育学院，开设49个本科专业，全日制在校生21376人。\r\n学校牢固树立人才资源是第一资源和“办学以教师为本”的理念，大力实施师资队伍建设“五大工程”和“卓越计划”，不断提高师资队伍水平。学校现有教职工1279人，其中具有正高职称98人、副高职称335人；具有博士学位140人、硕士学位664人；有1人被遴选为国家科学技术奖评委，2人享受国务院政府特殊津贴，3人被评为二级教授；有全国模范教师和全国优秀教育工作者2人，“江苏省有突出贡献的中青年专家”3人，省“六大人才高峰”培养对象14人，省“333工程”培养对象28人，省“青蓝工程”中青年学术带头人12人和优秀青年骨干教师35人，徐州市优秀专家、拔尖人才63人。\r\n学校紧密结合区域经济社会发展需求，扎实推进专业学科一体化建设。现有2个国家级特色专业，3个教育部“卓越工程师计划”实施专业，1个国家级“专业综合改革试点”项目，3个国家级工程实践教育中心，1个国家级大学生校外实践教育基地，2个国家级国际合作办学项目，6个省级特色专业，5个省级重点专业（类）；获批省级精品课程10门、省级精品教材13部，省级重点教材3部，获省级优秀教学成果奖13项；拥有3个省级一级重点建设学科。\r\n学校坚持以贡献求支持，以贡献求发展，加强产教融合，努力提升科技服务能力，科学研究和平台建设不断取得新进展。09年以来，承担和完成省部级以上科研项目199项、横向课题381项，科研成果获省部级奖励37项。学校现拥有2个省级重点建设实验室，2个省级工程实验室，9个省级工程技术研究中心，8个省级实验教学示范中心；获批省级工业设计中心、省级校外人文社科研究基地、省级人才培养模式创新实验基地、省级优秀教学团队各1个，省级科技创新团队2个，1项成果入选2012年《国家哲学社会科学成果文库》。\r\n学校秉承“格物致知，敬业乐群”的校训精神，积极推进人才培养模式改革，着重培养学生的社会责任感、创新精神和实践动手能力，人才培养质量稳步提升。近三年，我校学生共获得国际竞赛奖项12项，国家级竞赛奖项469项，省部级竞赛奖项492项，其中包括国际数学建模竞赛一等奖、全国大学生数学建模竞赛一等奖、“挑战杯”中国大学生创业计划竞赛银奖、全国普通高等院校算量大赛总冠军、全国大学生英语竞赛特等奖、全国大学生桥牌锦标赛亚军等高级别奖项；获批国家级大学生创新创业训练计划项目71项。人才培养质量的不断提高和毕业生“下得去、留得住、上手快、能力强”的特点受到社会广泛认可，毕业生就业率保持在98%以上。\r\n学校深入推进国际化战略。近年来，学校先后与美国、法国、俄罗斯等12个国家的17所高校和机构建立了稳定的合作关系。举办合作办学项目10个，联合培养学生1470人。着力推进“中青年骨干教师海外培训工程”，派出教师和管理干部393人次到境外培训、访学和攻读学位；留学生工作、中外合作科研和汉语国际推广不断取得新成效。学校是“茉莉花留学江苏政府奖学金”资助高校；有3位外籍教师荣获“江苏省五一劳动荣誉奖章”。教育部简报2012年第212期以《徐州工程学院大力推进国际化发展战略，着力提高师资队伍国际化水平》为题，报道了我校师资国际化的探索和实践。\r\n学校注重结合区域文化特征，努力发挥文化传承功能。学校以非物质文化遗产的研究与传承作为高校发挥文化传承与创新功能的突破口，积极推进“非遗”进校园、进课堂、进教材、进科研工作。举办了两届中国非物质文化遗产高层论坛，“淮海地区非物质文化遗产研究中心”获批江苏省普通高等学校人文社会科学校外研究基地，相关建设成果获得教育部“高校校园文化建设”优秀奖。\r\n展望未来，学校将深入贯彻落实科学发展观，不断加强内涵建设，大力提高教育教学质量和人才培养质量，以改革创新为动力，努力发展成为一所特色鲜明的高水平地方本科院校。', null, null, '1', '8', '0', '2017-04-07 16:13:24', '0', 'SS', '1', '1', 'A', '2017-05-17 20:56:41');
INSERT INTO `information` VALUES ('28', '校友论坛规章制度', '严格遵守', 'AZ', null, '30', '3', '1', '2017-04-09 14:03:41', '0', 'BBS', '1', null, 'A', '2017-04-09 14:05:42');
INSERT INTO `information` VALUES ('29', '欢天喜地的校庆', '5月10日下午，我校隆重举行“五四”表彰大会暨纪念建团95周年文艺演出。全体校领导出席表彰大会，并为受到表彰的先进集体代表和先进个人代表颁奖。学校有关单位负责同志，学校共青团系统干部及学生代表参加活动。校团委书记王东主持大会。\r\n\r\n学校党委高度重视共青团工作，学校认真学习贯彻习近平总书记关于青年工作的重要论述。2016年，我校各级团学组织在校党委领导和上级团组织的指导下，认真学习全国高校思想政治工作会议及《共青团中央改革方案》精神，深入贯彻群团工作会议精神，以“四大观”为统领，以思想引领为导向，扎实开展“五个一工程”专题活动，着力聚焦思想建设、组织建设和队伍建设，学校共青团工作姹紫嫣红、活力迸发、成果丰硕。\r\n\r\n活动开始前，校领导，相关单位负责人以及学生代表参观了“校园先锋”“活力团支部”展示海报、“五四”文化衫、主题征文、团务知识等“五四”期间校团委组织活动的精彩展示。\r\n\r\n伴随着嘹亮的《光荣啊中国共青团》的团歌声响，表彰大会正式开始！刘洋副校长宣读了《关于表彰徐州工程学院2016年度共青团先进集体和先进个人的决定》文件，随后，校领导为受到表彰的先进集体和个人代表颁奖并赠送《苍茫大地》书籍。\r\n\r\n精彩的纪念建团95周年文艺演出正式开始！到场嘉宾、师生们共同观看了精彩演出。首先是校管乐团演奏《歌唱祖国》和《校歌》，歌曲串烧《我的大学+最初的梦想+红旗飘飘》、小合唱《Memory》，悦耳动听、青春洋溢，舞蹈《茉莉花开》、《碧波孔雀》美奂美仑、韵味十足，萨克斯重奏《轻骑兵序曲》、长笛重奏《四季 The changing seasona》婉转悠扬、细腻绵长，朗诵《史中的徐州》、《鸿雁》朗诵铿锵有力、情真意切。整场晚会主题突出、形式新颖，内容丰富、高潮迭起，充分展现了全校团干部和团员青年拼搏进取、积极向上、奋发有为的精神风貌。\r\n\r\n百舸争流，扬帆远航，百尺竿头，更进一步！全校各级团学组织和全体团员青年，将深入学习贯彻党的十八届六中全会精神和习近平总书记系列重要讲话精神，认真践行“一学一做”，奋勇争先，开拓创新，充分发挥团组织的生力军和突击队作用，发挥团干部和广大团员的先锋模范作用，在学校建设区域性综合大学的征程中贡献青春力量，以昂扬的精神面貌迎接党的十九大的胜利召开！', 'ZA', '/ar/pic/upload/2017/05/18/ac4f40f3-d68c-49ea-a8d2-b56a7ff328d4.jpg', '313', '29', '29', '2017-04-09 14:10:49', '0', 'BBS', '2', null, 'A', '2017-04-09 14:11:01');
INSERT INTO `information` VALUES ('32', '', 'DEBUG测试', '', '', '0', '0', '0', '2017-04-15 19:49:06', '0', 'CM', '2', '3', 'A', '2017-04-15 19:49:06');
INSERT INTO `information` VALUES ('33', '出现BUG了，好烦啊', '出现BUG了，好烦啊', '', '', '0', '1', '0', '2017-04-15 20:15:09', '0', 'CI', '2', '3', 'A', '2017-04-15 20:15:09');
INSERT INTO `information` VALUES ('34', '智能车协会公告', '不能闷骚', '', '', '73', '6', '2', '2017-04-19 00:14:35', '1', 'OI', '2', '8', 'A', '2017-04-19 00:15:05');
INSERT INTO `information` VALUES ('41', 'Come On Baby Go', 'Let me hear you say', '', '', '10', '0', '0', '2017-04-23 17:02:41', '0', 'OI', '2', '8', 'A', '2017-04-23 17:02:41');
INSERT INTO `information` VALUES ('42', '', '留言测试', '', '', '0', '0', '0', '2017-04-23 23:18:07', '0', 'OM', '2', '8', 'A', '2017-04-23 23:18:26');
INSERT INTO `information` VALUES ('43', '', 'ceshi2', '', '', '0', '0', '0', '2017-04-25 14:11:00', '0', 'OM', '2', '8', 'A', '2017-04-25 14:11:00');
INSERT INTO `information` VALUES ('44', '', '第一个留言 ----black', '', '', '0', '0', '0', '2017-04-25 16:52:06', '0', 'CM', '2', '2', 'A', '2017-04-25 16:52:06');
INSERT INTO `information` VALUES ('45', '', '自动糊班级是一个神奇的存在', '', '', '0', '0', '0', '2017-04-25 16:54:14', '0', 'CM', '4', '4', 'A', '2017-04-25 16:54:14');
INSERT INTO `information` VALUES ('46', '周一下午班级聚会', '周一下午班级聚会', '', '', '0', '0', '0', '2017-04-25 17:03:13', '0', 'CI', '4', '2', 'A', '2017-04-25 17:03:13');
INSERT INTO `information` VALUES ('47', '班级严禁打群架，不过', '班级严禁打群架，不过偶尔可以打一打', '', '', '0', '0', '0', '2017-04-25 17:15:26', '0', 'CI', '4', '2', 'A', '2017-04-25 17:15:26');
INSERT INTO `information` VALUES ('48', '我是逗逼', '呵呵呵', '', '', '0', '0', '0', '2017-04-25 17:25:12', '0', 'CI', '5', '3', 'A', '2017-04-25 17:25:12');
INSERT INTO `information` VALUES ('49', '', '董亮亮回班级来看看了', '', '', '0', '0', '0', '2017-04-28 13:25:43', '0', 'CM', '4', '3', 'A', '2017-04-28 13:25:43');
INSERT INTO `information` VALUES ('50', '贺一飞前来报到', '我是一个大太阳，浑身充满正能量', '', '', '0', '0', '0', '2017-04-28 14:16:19', '0', 'CI', '262', '2', 'A', '2017-04-28 14:16:19');
INSERT INTO `information` VALUES ('51', '班级聚会', '不V鼓鼓囊囊 vc大发慈悲不vs的是谁发的号码你不单纯I度噢迪接啊爱看哦我剖大家来看但判断是否刚才V会比较', '', '', '0', '0', '0', '2017-04-28 14:18:55', '0', 'OI', '262', '8', 'A', '2017-04-28 14:18:55');
INSERT INTO `information` VALUES ('52', '', '官方公会很高  对方vc是的浮现出V没机会故事大全二手房的规划和郭德纲方便改变中断过ds fg', '', '', '0', '0', '0', '2017-04-28 14:19:14', '0', 'OM', '262', '8', 'A', '2017-04-28 14:19:14');
INSERT INTO `information` VALUES ('53', '我的学院我做主', '还记得在信电学院的青葱岁月。', '', '', '0', '0', '0', '2017-04-28 22:18:21', '0', 'OI', '122', '7', 'A', '2017-04-28 22:18:21');
INSERT INTO `information` VALUES ('54', '哈哈，开心的大学生活', '开心的不要不要的', '', '', '3', '0', '0', '2017-04-28 22:18:45', '1', 'OI', '122', '7', 'A', '2017-04-28 22:18:45');
INSERT INTO `information` VALUES ('55', '', '我来也', '', '', '0', '0', '0', '2017-04-28 22:18:54', '0', 'OM', '122', '7', 'A', '2017-04-28 22:18:54');
INSERT INTO `information` VALUES ('56', '', '小杰来报道', '', '', '0', '0', '0', '2017-04-29 00:41:34', '0', 'OM', '125', '7', 'A', '2017-04-29 00:41:34');
INSERT INTO `information` VALUES ('57', '', '哈哈', '', '', '0', '0', '0', '2017-04-29 12:22:32', '0', 'OM', '6', '8', 'A', '2017-04-29 12:22:40');
INSERT INTO `information` VALUES ('58', '新帖子，冒个泡', '猫跑了，冒泡了', '', '', '6', '1', '1', '2017-04-29 14:33:19', '1', 'BBS', '119', null, 'A', '2017-04-29 14:33:19');
INSERT INTO `information` VALUES ('59', '爱玩了', '的说法不V你那边', '', '', '0', '0', '0', '2017-04-29 14:33:56', '0', 'OI', '119', '8', 'A', '2017-04-29 14:33:56');
INSERT INTO `information` VALUES ('60', '呵呵', '地超看到法国不能发生的', '', '', '0', '0', '0', '2017-04-29 14:35:20', '0', 'OI', '119', '8', 'A', '2017-04-29 14:35:20');
INSERT INTO `information` VALUES ('61', '啊师傅规范化', '阿尔法狗好呢', '', '', '1', '0', '0', '2017-04-29 14:37:40', '0', 'OI', '119', '8', 'A', '2017-04-29 14:37:50');
INSERT INTO `information` VALUES ('62', '', '哈啊哈', '', '', '0', '0', '0', '2017-05-03 20:26:44', '0', 'CM', '122', '2', 'A', '2017-05-03 20:26:44');
INSERT INTO `information` VALUES ('63', '快乐的日子', '哥好久没跟你告白', '', '/ar/pic/info/1ebe4dbe-1eff-4176-861c-ca4ff746cfbb.png', '0', '0', '1', '2017-05-03 20:27:22', '0', 'CI', '122', '2', 'A', '2017-05-03 20:27:22');
INSERT INTO `information` VALUES ('64', '', '留言了', '', '', '0', '0', '0', '2017-05-03 21:20:06', '0', 'CM', '122', '4', 'A', '2017-05-03 21:20:06');
INSERT INTO `information` VALUES ('65', '到此一游', '我来了', '', '', '0', '0', '0', '2017-05-03 21:20:26', '0', 'CI', '122', '4', 'A', '2017-05-03 21:20:26');
INSERT INTO `information` VALUES ('66', '', '我是逗逼', '', '', '0', '0', '0', '2017-05-03 21:37:37', '0', 'OM', '5', '8', 'A', '2017-05-03 21:37:37');
INSERT INTO `information` VALUES ('67', '新帖发一枚', '喜欢上了工作', '', '', '4', '1', '1', '2017-05-03 21:51:11', '0', 'BBS', '125', null, 'A', '2017-05-03 21:51:11');
INSERT INTO `information` VALUES ('68', '第一发', '第一条动态消息', '', '', '0', '0', '0', '2017-05-03 23:55:03', '0', 'CI', '5', '14', 'A', '2017-05-03 23:55:03');
INSERT INTO `information` VALUES ('69', '', '逗逼到此一游', '', '', '0', '0', '0', '2017-05-03 23:55:15', '0', 'CM', '5', '14', 'A', '2017-05-03 23:55:15');
INSERT INTO `information` VALUES ('70', 'Come On Baby Go', '一起嗨过的日子', '', '', '0', '0', '0', '2017-05-05 13:32:21', '1', 'CI', '5', '2', 'A', '2017-05-05 13:32:21');
INSERT INTO `information` VALUES ('71', '士大夫', '士大夫但是个', '', '', '0', '0', '0', '2017-05-09 00:11:23', '0', 'CI', '2', '14', 'A', '2017-05-09 00:11:23');
INSERT INTO `information` VALUES ('72', '春游', '开心的不要不要的！', '', '/ar/pic/upload//2017/05/09/882269c8-8897-46d7-83ca-a1377ba74845.jpg', '0', '0', '0', '2017-05-09 23:59:12', '0', 'CI', '5', '14', 'A', '2017-05-09 23:59:12');
INSERT INTO `information` VALUES ('73', '秋游了', '开心的不行啊', '', '/ar/pic/upload//2017/05/10/3c45fc59-2257-4227-9843-c08d1b16be19.jpg', '0', '0', '0', '2017-05-10 00:00:25', '0', 'CI', '5', '14', 'A', '2017-05-10 00:00:25');
INSERT INTO `information` VALUES ('74', '夏令营了', '水水的，开开心心！', '', '/ar/pic/upload//2017/05/10/ca2bebf0-ed27-4b5c-81dd-fa19dc5db16d.jpg', '1', '0', '0', '2017-05-10 00:00:51', '0', 'CI', '5', '14', 'A', '2017-05-10 00:00:51');
INSERT INTO `information` VALUES ('75', '毕业了', '毕业好开心', '', '/ar/pic/upload//2017/05/11/bd1a8b98-a18c-4be4-8c55-58d5389c74f2.jpg', '6', '0', '5', '2017-05-11 21:53:13', '0', 'CI', '35', '14', 'A', '2017-05-11 21:53:13');
INSERT INTO `information` VALUES ('76', '毕设答辩', '答辩好激动啊', '', '/ar/pic/upload//2017/05/11/0b1918fd-5ffe-40c2-aa21-1f8413031144.jpg', '20', '1', '6', '2017-05-11 21:53:37', '1', 'CI', '35', '14', 'A', '2017-05-11 21:53:37');
INSERT INTO `information` VALUES ('77', '工作好累', '毕业之后即将参加工作，好累啊', '', '/ar/pic/upload//2017/05/11/04a403ad-a722-407e-b712-a507549afa9e.jpg', '9', '2', '1', '2017-05-11 22:21:57', '0', 'CI', '304', '14', 'A', '2017-05-11 22:21:57');
INSERT INTO `information` VALUES ('78', '毕业季，回忆我们一起走过的大学四年', '风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁	风格发挥工会积极， 奥尔特加 哇塞的个回复你为人所知都会有展示填入简洁', '', '/ar/pic/upload//2017/05/09/882269c8-8897-46d7-83ca-a1377ba74845.jpg', '38', '26', '23', '2017-05-16 19:49:45', '0', 'BBS', '2', null, 'A', '2017-05-16 19:49:45');
INSERT INTO `information` VALUES ('81', '住建部工程管理类专业评估（认证）委员会专家组莅临我校考查指导工作', '2017年5月16日上午，住建部工程管理类专业评估（认证）委员会专家组一行莅临我校检查指导工作。专家组成员包括深圳地铁集团有限公司刘卡丁教授，武汉理工大学方俊教授，兰州交通大学王恩茂教授，西安高科（集团）公司李军利高级工程师。校党委书记王超，校长张新科，副校长王冬冬、刘洋出席汇报会。学校专业认证工作领导小组成员、相关职能部门负责同志以及土木工程学院工程管理类专业骨干教师参加了会议。王冬冬主持会议。\r\n\r\n16日上午8时许，专家组一行抵达中心校区，受到了王超、张新科等校领导的欢迎，张新科校长介绍了学校中心校区特色建筑和校容校貌。\r\n\r\n上午8：30分，徐州工程学院工程管理类专业评估（认证）汇报会在中心校区行政楼B101会议室举行。张新科校长介绍学校办学情况，土木工程学院院长姜慧汇报专业建设情况，专家组就专业建设提出问题。\r\n\r\n张新科在讲话中代表校党委校行政和全校师生对住建部工程管理类专业评估（认证）委员会专家组莅临我校检查指导工作表示欢迎和感谢。张新科从学校基本慨况、办学理念、办学成效、发展愿景四个方面全面介绍了学校办学情况。张新科指出，近年来学校贯彻落实科学发展观，注重顶层设计，在国内首次全方位系统性设计应用技术型高校人才培养理念；同时，在全国应用技术型高校率先构建具有引领性、支撑性、示范性作用的“四大观”应用型人才培养新理念。学校紧贴地方支柱产业构建特色专业，强化产教融合，提升人才实践能力，创新推行大学生素养提升“五个一”工程，矢志服务地方，多措并举提高人才培养质量，学校办学质量不断提升。未来，学校将按照“两步走”的发展战略，坚定不移，团结奋斗，为建成高水平的综合类应用型大学而努力奋斗。张新科希望各位专家多提宝贵意见，帮助学校查找短板、诊断问题，进一步提高应用型人才培养水平。\r\n\r\n住建部工程管理类专业评估（认证）委员会专家组组长刘卡丁宣布了《关于徐州工程学院工程管理专业入校考察安排的通知》文件。刘卡丁指出，专家组此次考查旨在以评促建、以评促改，力求通过三天的工作，促进徐州工程学院工程管理类专业建设，更加规范、更加有效，更加契合行业需求和区域经济建设对人才的需求。\r\n\r\n姜慧作徐州工程学院工程管理类专业教育情况汇报。在汇报中，她从学院概况、学生发展、专业目标、教学过程、师资队伍、教学资源、质量评价、自评总结等方面全面汇报了工程管理类专业教育情况。\r\n\r\n会上，住建部工程管理类专业评估（认证）委员会专家组成员王恩茂、李军利对我校工程管理专业建设有关情况进行了提问。\r\n\r\n随后，住建部工程管理类专业评估（认证）委员会专家组考察了我校逸夫图书馆；对《工程项目管理》、《工程造价管理》两门课程进行了随机听课，并考查了徐州工程学院体育设施和体育课程的教学情况，与师生进行了交流。\r\n\r\n随后三天，住建部工程管理类专业评估（认证）委员会专家组将根据住建部《高等学校工程管理类专业评估认证文件》相关考查指标，继续在我校的检查指导工作。', '', '/ar/pic/upload/2017/05/17/a2cdb021-42fc-4cea-a118-edfe2e6d0af9.jpg', '45', '3245', '23', '2017-05-17 14:01:28', '0', 'AN', '1', null, 'A', '2017-05-17 14:01:49');
INSERT INTO `information` VALUES ('82', '我校成功举办“文昭讲坛”首场学术活动', '5月12日下午，国家清史编撰委员会常务副主任卜键先生来我校逸夫图书馆开展“文昭讲坛”首讲学术活动。校党委书记王超，副校长宋农村、殷惠光、徐州社科联副主席曲涛久及在徐文史专家参加学术活动。宋农村副校长主持了题为《大清盛世下的红楼梦：以“奴才”一词为例》学术讲座，张仲谋教授主持了卜键主任新作《天有二日？：禅让时期的大清朝政》研讨会。\r\n\r\n王超在致辞中代表徐州工程学院师生向“文昭讲坛”开讲专家卜键表示感谢，向莅临学校指导的专家学者表示欢迎。王超指出，自古以来，讲坛是大师传道、授业、解惑的场所。当今，文化繁荣，讲坛兴盛，讲坛对于普及传统文化、传授科学知识等方面作用重要。我校历来重视开展学术活动和学术交流，矢志营造浓郁学术氛围。举办“文昭讲坛”是学校培养学生人文素养的探索，高水平讲坛可以让我校学生的人文素养、人文情怀、理论水平得到持续升华。王超要求学校各单位要精心组织，周密安排，做好宣传，打造品牌，不断扩大“文昭讲坛”的影响力，不断扩大学生的参与面与受益面，力争把“文昭讲坛”打造成淮海经济区乃至国内文史研究和学术交流的品牌。\r\n\r\n卜键在学术讲座中，首先讲述了《红楼梦》的创作背景——康乾盛世的三个历史节点，并通过丰富翔实的史料和鞭辟入里的灼见，全面解析了《红楼梦》的写作意旨，用风趣幽默的语言介绍了《红楼梦》中的主奴关系，对“奴才”多重角色关系进行了解读。卜键讲座史料翔实，真知灼见，妙趣横生，充分展现了他的学术魅力和深厚学养，在座师生受益匪浅。\r\n\r\n在卜键新作《天有二日？：禅让时期的大清朝政》研讨会上，宋农村指出该书展示出卜键学风严谨和对历史的敬畏，强调该书文风扎实，让读者感觉到语言、叙述之美，引导读者去思考。该书不但是清史研究的重要成果，而且体现担当意识，对当今社会具有现实意义。张仲谋介绍了该书写作情况和重要意义。赵兴勤指出了该书在时间切入、人物选择、可读性上的三点启示。与会人员从清史研究选题、内容选择、历史考证、写作手法等方面都对该书进行了深入探讨。\r\n\r\n在听取了与会专家学者的发言后，卜键主任对与会专家学者长期以来对其创作的关注和支持表示感谢，他介绍了《天有二日？：禅让时期的大清朝政》的创作情况，与专家学者和读者们分享了该书的创作经验。\r\n\r\n本次“文昭讲坛”首讲是我校组织开展的高水平、高层次哲学社会科学系列讲座，“文昭讲坛”的启动为不仅我校搭建了高水平的学术交流平台，更为我校打造高水平学术论坛，提高我校学术交流层次，提升校园学术文化品位提供了重要平台。', '', '/ar/pic/upload//2017/05/11/0b1918fd-5ffe-40c2-aa21-1f8413031144.jpg', '223', '2349', '124', '2017-05-17 14:02:45', '0', 'AN', '1', null, 'A', '2017-05-17 14:02:48');
INSERT INTO `information` VALUES ('83', '我校成功承办《江苏高教》2017年高层论坛', '5月13日至14日，主题为“大学人与大学发展：教师•学术•组织”的《江苏高教》2017年高层论坛由中国矿业大学与徐州工程学院联合承办。我校于13日下午主办了专家讲坛。校长张新科，副校长宋农村、王冬冬出席论坛活动。\r\n\r\n张新科校长在会上作了题为《应用型本科院校“四大观”办学理念与实践》的报告。张新科校长的报告分析了困扰应用技术型高校人才培养的囿制因素，指出我校在国内首次全方位系统性设计应用技术型高校人才培养理念：以大应用观指导人才培养模式重构；以大工程观指导学科专业一体化建设；以大生活观指导学生全面协调发展；以大文化观指导大学文化建设。\r\n\r\n张新科校长详细阐释了我校实施“四大观”办学理念的具体举措，他强调，“四大观”办学理念突显了应用型人才学以致用的本质，突显了应用型人才培养与产业需求的契合度。张新科校长指出，在近三届全国新建本科院校联席会议上，我校均作为大会执行主席主持全体会议并交流推介“四大观”人才改革成功经验。我校“四大观”办学理念受到教育部网站、《中国教育报》等媒体广泛关注。\r\n\r\n论坛期间，国内五位教授作了交流发言。南京师范大学胡建华教授作了《师资队伍建设与任用制度改革》的报告；苏州大学周川教授作了《胡适的教授生涯及其启示》的报告；云南大学董云川教授作了《大学江湖：学人生态的另一种解析》的报告；南京师范大学王建华教授作了《学术管理资本主义与大学教师流动》的报告；厦门大学吴薇教授作了《荷兰研究型大学教师管理现状探析》的报告。', '', '/ar/pic/upload//2017/05/11/04a403ad-a722-407e-b712-a507549afa9e.jpg', '12', '2345', '123', '2017-05-17 14:03:51', '0', 'AN', '1', null, 'A', '2017-05-17 14:03:59');
INSERT INTO `information` VALUES ('84', '爱国者集团董事长冯军来我校作创业专题报告', '4月27日下午，全国政协委员、民建中央委员、爱国者集团董事长、爱国者欧途欧（北京）网络科技有限公司董事长冯军应邀来我校作创新创业专题报告，为我校青年学生创业者提供新思路。刘洋副校长主持报告会。CCTV文化中国执行主席张建民、爱国者集团副总裁吴超龙等嘉宾出席活动。徐州创新创业教育学院、环境工程学院、机电工程学院、土木工程学院负责人与我校师生代表400余人聆听了报告会。\r\n\r\n刘洋副校长为冯军董事长授予我校金牌创业导师聘书。\r\n\r\n报告会上，冯军董事长以自己的创业经历为例，讲述了自己是如何从最初的骑自行车在中关村卖键盘到把爱国者做成让国人骄傲的民族品牌，以此来激励大学生们要有坚忍不拔的精神和排除万难的干劲。他还针对构建互联网时代的诚信环境，分享了爱国者诚信联盟是如何利用“竞质排名”帮助中国的中小企业实现优质库存的大逆转。冯军董事长鼓励大学生要敢于创业、勇于创新，走向成功。\r\n\r\n冯军董事长的讲座充满激情，震撼人心。对提高我校学子的创业意识，了解行业政策，掌握就业行情，提升专业技能具有重要的借鉴意义。', '', '/ar/pic/upload/2017/05/17/94ecfe90-aa6c-4023-b59e-154c7af18d2e.jpg', '235', '248', '124', '2017-05-17 14:10:11', '0', 'AN', '1', null, 'A', '2017-05-17 14:10:27');
INSERT INTO `information` VALUES ('85', '我校举办统战委员培训班', '4月27日、5月2日，我校举办统战委员培训班。此举旨在为深入学习领会习近平总书记关于统战工作的重要讲话精神和中央统战工作会议精神，推动学校大统战工作格局建设。副校长刘洋出席并讲话，各党委（总支、直属支部）书记、统战委员参加会议，校党委统战部部长房建州主持开班仪式。\r\n\r\n刘洋在讲话中强调要深入学习贯彻习近平总书记关于统一战线重要思想的论述，准确把握学校统战工作面临的新形势新特点新目标新任务，认真贯彻落实中央和省委、市委要求，积极推进校统战工作会议部署的各项工作任务，为学校改革发展凝聚人心、汇聚力量。刘洋对参训的同志们提出了三点要求：一是凝聚共识，扎实做好学校统战工作；二是认清形势，充分认识统战工作的重要性；三是提升素质，不断增强统战工作本领。\r\n\r\n市委统战部研究室主任蒋鑫应邀作了题为《统战理论政策知识介绍》专题报告。报告从新形势下统一战线工作的地位和作用、统一战线工作的根本职能和基本任务、做好统战工作的原则和方法、统战工作的主体责任等四个方面对统战理论政策作了深刻解析，报告深入浅出、旁征博引，既富于理论性，又富有实践性，对新形势下如何做好基层统战工作具有积极的指导作用。\r\n\r\n5月2日下午，参训的统战委员集体学习了习近平总书记关于知识分子工作的重要讲话精神和《中国共产党统一战线工作条例（试行）》、中央统战部、教育部党组《关于加强新形势下高校统一战线工作的意见》，会议传达了校党委统战工作会议精神和《关于进一步加强统一战线工作的意见》。马克思主义学院张格军副教授作了题为《高校党外青年知识分子统战工作的思考》研究成果交流。\r\n\r\n本次培训，统战委员们结合本单位实际，交流了统战工作经验，研讨统战工作新思路。他们纷纷表示，此次培训内容丰富，收获很大，切实增强了做好新形势下高校统战工作的责任感和使命感，为今后做好统战工作打下了坚实的政策理论基础。', '', '/ar/pic/upload/2017/05/17/bc5de3a4-7165-4fd5-a6f4-cae98e92b895.jpg', '23433', '2367', '25', '2017-05-17 14:11:01', '0', 'AN', '1', null, 'A', '2017-05-17 14:11:08');
INSERT INTO `information` VALUES ('86', '我校举行“五四”升旗仪式', '我校举行“五四”升旗仪式', '', '/ar/pic/upload/2017/05/17/8c1d1fd5-7007-49e8-9f8f-42b313892b30.jpg', '234', '49', '24', '2017-05-17 14:11:36', '0', 'AN', '1', null, 'A', '2017-05-17 14:11:43');
INSERT INTO `information` VALUES ('87', '泰国博仁大学代表团来我校访问', '泰国博仁大学代表团来我校访问', '', '', '0', '9', '6', '2017-05-17 15:07:32', '0', 'AN', '1', null, 'A', '2017-05-17 15:07:39');
INSERT INTO `information` VALUES ('88', '我校“百、千、万”集中走访帮扶工作取得阶段性成效', '徐州工程学院“百、千、万”集中走访活动开展以来，15个工作小组认真贯彻校党委工作要求，紧密联系走访帮扶镇——贾汪青山泉镇实际，采取进村（社）入户、座谈访谈、问卷调查等多种形式，全面摸清村（社）情、民情、企情，深入了解基层所需、群众所急、企业所困，详细记录走访调研日记，建立完善工作台账。工作有落实、有亮点，走访工作取得了阶段性成绩。\r\n\r\n青山泉镇房上村工作小组由机电工程学院党委和图书馆直属党支部组成。该工作小组根据“百、千、万”集中走访帮扶工作要求，主动发挥专业优势，助力房上村企业和文化建设。工作小组在走访调研中发现，列入调研对象的五家企业中虽有两家企业被徐州市科技局授予工程研究中心，但整体技术实力仍然较为薄弱，技术能力不足成为制约企业发展的主要瓶颈之一。机电工程学院充分发挥学院的人才优势，主动与徐州市恒长粉磨有限公司等企业对接，开展绿色环保新型混凝土生产工艺的关键技术研究等工作，助推企业发展。\r\n\r\n房上村目前全村人口达2358人，村民有着较为强烈的文化需求。该村虽已建成图书室，但图书的品种、数量、类型尚不能满足村民需求。图书馆根据村图书室现状及村民需求，积极开展图书捐赠活动，向房上村捐赠养殖、种植、文学、保健等类图书500册，价值13351.20元。这批图书的捐赠，不仅有效提高了房上村图书室建设质量，进一步满足村民的文化需求，同时对提高村民的生产能力，提升经济效益也将产生积极的促进作用。\r\n\r\n徐州工程学院的集中走访活动，依托专业优势，助力乡村建设，取得了较好的效果，下一步学校15个工作小组将百尺竿头，更进一步，不断推进集中走访活动再上新台阶。', '', '', '0', '0', '0', '2017-05-17 15:08:18', '0', 'AN', '1', null, 'A', '2017-05-17 15:08:24');
INSERT INTO `information` VALUES ('89', '我校召开新校区建设总结会', '扎实肯干的精神，激发教职工敢于担当、主动作为，为学校建设再创新业、再立新功，推动学校事业又好又快发展。张新科校长发表讲话，殷惠光副校长主持会议。新校区建设指挥部成员和相关单位负责人参会。\r\n\r\n张新科指出，十年来，新校区建设工作得到了市委市政府及市有关单位的关心支持，倾注了校党委校行政三届领导班子和全校师生的心血。新校区建设指挥部同志顾全大局，服从分配，为新校区建设作出了贡献，不仅为学校留下了宝贵的物质财富，也为学校留下了可贵的精神财富。学校有关单位要按照“规范化、精细化、效益化”的要求，做好顶层设计工作，科学总结新校区建设的管理理念、管理经验、管理模式；要加强基建管理制度规范化建设，做到以制度管人，以制度管事，保证各项工作高效有序开展。\r\n\r\n张新科指出，即将开始的东校区建设，不仅是学校推进高水平大学建设、提高办学水平的现实需要，更是一次学校资源整合和学校长久发展的根本需要。学校各单位要认真学习总结新校区建设的工作经验，进一步强化使命意识、大局意识和主人翁意识，继续发扬众志成城、不怕吃苦精神，积极为学校东校区建设发展献计献策、贡献力量，为把我校建设成为综合性大学而努力奋斗。\r\n\r\n张新科强调，基建工作要严守廉洁底线，在工程管理、招投标工作、材料采供等方面严格纪律，绝不以权谋私，确保干成事，能成事，不出事，做到大楼建起来，干部站起来。\r\n\r\n殷惠光就会议筹备情况进行了说明，并对学习落实张校长讲话精神进行了部署。\r\n\r\n基建处处长石月荣对新校区建设工作进行了总结汇报。参建人员代表张林军作了大会交流发言。  ', '', '', '0', '0', '0', '2017-05-17 15:08:49', '0', 'AN', '1', null, 'A', '2017-05-17 15:08:56');
INSERT INTO `information` VALUES ('90', '我校举行“十佳班级”和“十大学习标兵”评选展示会', '为充分展示我校大学生奋发向上的精神风貌，发挥先进典型的示范引领作用，2017年4月7日下午，“传播青春正能量-2015-2016学年“十佳班级”和“十大学习标兵”评选展示会在中心校区举行。副校长刘洋出席活动。各二级学院学生科科长、辅导员老师和学生代表参加此次会议，并担任大众评委。\r\n\r\n通过个人申请、学院推荐、学工处审核、微信投票等环节，共有15个候选班级和13名学习标兵进入到评选展示环节。展示过程中，选手们通过慷慨激昂的演讲以及生动形象的PPT，展示了自己所在班级或个人在过去一年取得的成绩、丰富多彩的社会实践活动和显著的科技创新成果，充分展示了我校大学生刻苦学习的奋斗精神以及积极向上的青春风采。\r\n\r\n最终，经过激烈的角逐，来自外国语学院的14朝鲜2班等10个班级荣获校“十佳班级”荣誉称号；来自信电学院的刘枫等10名同学荣获校2015-2016学年校“十大学习标兵”荣誉称号。\r\n\r\n此次评选展示会，为我校优秀学子搭建了一个自我展示和相互交流的平台，通过这个平台，不仅达到了优秀学生之间互相学习、博采众长的目的，更重要的是通过先进、典型的树立，激励和引导更多的同学学习先进、赶超先进，把先进班级和优秀标兵的精神转化为行动的力量，展示会促进了我校优良学风校风的养成，是加强学风建设的一项有力举措。', '', '', '1', '1', '0', '2017-05-17 15:09:22', '0', 'AN', '1', null, 'A', '2017-05-17 15:09:24');
INSERT INTO `information` VALUES ('91', '第十三届徐州读书节在我校开幕', '4月21日下午，由徐州市全民阅读活动领导小组主办，市委宣传部、市文广新局、徐州工程学院联合承办的第十三届徐州读书节开幕式在徐州工程学院逸夫图书馆开幕。徐州市副市长李燕，我校党委书记王超、校长张新科、副校长殷惠光，市文广新局局长高成富、副局长艾新建，徐州市全民阅读活动领导小组成员单位负责同志，鼓楼区、云龙区、泉山区文化旅游局及徐州经济开发区负责同志，徐州市作家协会、徐州工程学院图书馆、博库书城徐州有限公司及社会各界代表，驻徐高校优秀读者代表和学生代表，全民阅读志愿者代表和汇报演出学生、家长代表共约400多人参加活动。\r\n\r\n李燕在讲话中说，徐州自古就是书香之城，这里一直延续着勤学好学的书香文脉，传承着生生不息的文化力量。近年来，市委、市政府高度重视书香城市建设，组织社会各界力量，举办丰富多彩的全民阅读活动，推进全民阅读向下扎根，社会文化程度向上攀升。满眼绿色，满城书香，已经成为徐州新的城市形象。新形势、新任务对我们做好全民阅读工作、提高全民文化素质提出了更高要求，各地各单位都要把全民阅读工作与全市文明城市创建工作紧密结合起来，健全党政推动、部门协作、专家指导、阵地支持、全民参与的工作机制。广大市民特别是在校大学生要结合自身实际，积极参与全民阅读工作，为推进中心城市建设提供强大的精神动力和智力支持。\r\n\r\n王超在讲话中说，徐州工程学院高度重视书香校园建设，积极开展读讲一本书活动。学校倡导把读书与生活相结合，把读书作为一种生活习惯；学校倡导把读书与治学相结合，在读书过程中掌握正确学习方法；学校倡导把读书与做人相结合，在读书过程中不断完善人格和品德。他希望全校师生携手共同营造浓厚的读书氛围，把阅读融入日常生活当中，让书籍成为师生的精神食粮，让读书占领业余文化阵地，让书香浸润着大学校园。\r\n\r\n李燕副市长、王超书记、张新科校长共同启动灯光水晶球，宣布第十三届徐州读书节正式启动。\r\n\r\n开幕式由场外活动和场内活动两个部分组成，场外活动共进行了为博库书城徐工院店揭牌、《图说汉朝》', '', '', '10', '2', '0', '2017-05-17 15:10:12', '0', 'AN', '1', null, 'A', '2017-05-17 15:10:19');
INSERT INTO `information` VALUES ('92', '我校举行第十届体育文化节启动仪式', '3月29日下午，徐州工程学院第十届体育文化节启动仪式在城南校区体育馆举行，副校长王冬冬出席启动仪式并致开幕辞。校体委委员及学生代表参加了启动仪式。体育学院院长李平主持启动仪式。\r\n\r\n王冬冬指出，体育文化节是我校体育爱好者的盛会，是全校师生展现自我的平台，也是展示学院风采，增强团队凝聚力、激发同学们的集体荣誉感的有效载体。她呼吁同学们积极参与“体育文化节”各项活动，主动“走向操场、走进大自然、走到阳光下”，并祝愿本次活动取得圆满成功。\r\n\r\n据悉，本次体育文化节历时一个月，既有体育征文、体育摄影比赛，也有各单项体育竞赛、趣味比赛等等，项目设置丰富，形式多样，覆盖面广，尽可能让每位同学都参与其中，在体育的盛会上充分展现我校学子的活力与激情，营造浓郁的校园体育文化氛围。\r\n\r\n启动仪式后，我校师生带来了精彩的文体表演。', '', '', '0', '0', '0', '2017-05-17 15:10:49', '0', 'AN', '1', null, 'A', '2017-05-17 15:10:57');
INSERT INTO `information` VALUES ('93', '科摩罗艾克勒高等科技学院代表团访问我校', '3月15日-17日，科摩罗艾克勒高等科技学院校长阿布达拉率代表团访问我校。张新科校长、沈超副书记、刘洋副校长会见代表团成员。\r\n\r\n在会谈中，张新科代表全校师生员工对访问团表示欢迎。他说，中非友谊源远流长，双方一直是好兄弟、好伙伴。双方在长期合作中，坚持相互理解、坦诚相见、肝胆相照。在世界多极化、经济全球化的今天，中非之间更需要互相帮助、合作共赢。张新科说，我校重视同非洲国家高校之间的联系，学校坚持开放办学、积极推进国际化战略，先后同非洲科摩罗、加纳、坦桑尼亚等多个国家的高校建立了友好合作关系。近几年来，我校留学生教育取得了较快发展，学校招收了来自东亚、中亚、西亚和非洲等多个国家和地区的学生来校学习，共培养了五十余名非洲籍学生，我校留学生教育质量得到了国际学生和社会的广泛认可。张新科说，我校将继续扩大同科摩罗艾克勒高等科技学院的合作，为两国友好交流做出贡献。\r\n\r\n阿布达拉非常赞赏张校长的讲话。他说，非中关系亲如兄弟。长期以来，中国对非洲经济和社会发展的促进功不可没。科摩罗独立建国伊始，中国政府就开始帮助其经济和社会发展。阿布达拉希望两校合作结出丰硕果实，祝愿科中两国的友谊之树长青。\r\n\r\n会后，两校校长共同签署了合作办学协议。', '', '', '9', '10', '6', '2017-05-17 15:11:57', '0', 'AN', '1', null, 'A', '2017-05-17 15:12:03');
INSERT INTO `information` VALUES ('94', '信电学院送老生晚会将于本月26日举办', '毕业了，好开心啊																毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊毕业了，好开心啊', '', '', '3', '1', '0', '2017-05-18 13:47:43', '0', 'BBS', '154', null, 'A', '2017-05-18 13:47:43');
INSERT INTO `information` VALUES ('97', '管理员测试发布', '管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布管理员测试发布v', '', '', '8', '2', '2', '2017-05-18 20:40:00', '0', 'AN', '1', null, 'A', '2017-05-18 20:40:00');
INSERT INTO `information` VALUES ('98', '毕业旅行', '二辩结束出去浪', '', '/ar/pic/upload/2017/05/19/079cc4fc-8b25-48d2-87e4-29f74b911941.jpg', '0', '0', '0', '2017-05-19 17:24:39', '0', 'CI', '271', '14', 'A', '2017-05-19 17:24:39');
INSERT INTO `information` VALUES ('99', '', '梅朔大傻逼', '', '', '0', '0', '0', '2017-05-19 17:25:21', '0', 'CM', '271', '14', 'A', '2017-05-19 17:25:21');
INSERT INTO `information` VALUES ('100', '', '万哥来也', '', '', '0', '0', '0', '2017-05-19 17:31:45', '0', 'OM', '271', '7', 'A', '2017-05-19 17:31:45');
INSERT INTO `information` VALUES ('101', '', '万哥来也', '', '', '0', '0', '0', '2017-05-19 17:31:55', '0', 'OM', '271', '7', 'A', '2017-05-19 17:31:55');
INSERT INTO `information` VALUES ('102', '', '万哥来也', '', '', '0', '0', '0', '2017-05-19 17:32:11', '0', 'OM', '271', '7', 'A', '2017-05-19 17:32:11');
INSERT INTO `information` VALUES ('103', '', '来玩玩', '', '', '0', '0', '0', '2017-05-19 17:41:51', '0', 'CM', '271', '2', 'A', '2017-05-19 17:41:51');
INSERT INTO `information` VALUES ('104', '毕设答辩', '明天答辩', '', '', '0', '0', '0', '2017-05-19 23:07:45', '0', 'CI', '268', '14', 'A', '2017-05-19 23:07:45');
INSERT INTO `information` VALUES ('105', '', '都比到此一游', '', '', '0', '0', '0', '2017-05-19 23:08:19', '0', 'CM', '268', '14', 'A', '2017-05-19 23:08:19');
INSERT INTO `information` VALUES ('106', '答辩', '明天答辩求过', '', '', '2', '1', '1', '2017-05-19 23:10:03', '0', 'BBS', '268', null, 'A', '2017-05-19 23:10:03');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志标识',
  `operator` varchar(100) DEFAULT NULL COMMENT '操作员:id+account+email',
  `oper_name` varchar(100) DEFAULT NULL COMMENT '操作名称',
  `oper_params` varchar(255) DEFAULT NULL COMMENT '操作参数',
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
  `origin_type` varchar(20) NOT NULL COMMENT '组织类型',
  `origin_desc` varchar(500) DEFAULT NULL COMMENT '组织描述',
  `origin_grade` char(4) DEFAULT NULL,
  `members` int(4) NOT NULL DEFAULT '0' COMMENT '成员数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `mgr_id` int(8) NOT NULL,
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`origin_id`),
  KEY `FK_ORIGIN_MGRID` (`mgr_id`),
  CONSTRAINT `FK_ORIGIN_MGRID` FOREIGN KEY (`mgr_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of origin
-- ----------------------------
INSERT INTO `origin` VALUES ('1', '徐州工程学院', 'INS', '', '', '0', '2016-02-16 23:21:47', '1', 'A', '2016-02-16 23:22:02', null, null);
INSERT INTO `origin` VALUES ('2', '13软嵌1班', 'C', null, '2013', '5', '2016-02-17 15:38:12', '3', 'A', '2016-02-17 15:38:25', null, null);
INSERT INTO `origin` VALUES ('3', '14计嵌1', 'C', '14计嵌1班欢迎你的加入', '2014', '4', '2016-02-18 19:45:09', '4', 'A', '2016-02-18 19:45:21', null, null);
INSERT INTO `origin` VALUES ('4', '15自动化', 'C', null, '2015', '39', '2016-02-18 19:46:04', '3', 'A', '2016-02-18 19:46:12', null, null);
INSERT INTO `origin` VALUES ('5', '信电工程学院', 'INS', null, null, '0', '2017-04-07 15:54:11', '1', 'A', '2017-04-07 15:54:24', null, null);
INSERT INTO `origin` VALUES ('6', '校友总会', 'org', '信电学院校友总会', null, '1', '2017-04-16 21:54:52', '1', 'A', '2017-04-16 21:55:05', null, null);
INSERT INTO `origin` VALUES ('7', '信电工程学院分会', 'orgi', '信电工程学院分会', null, '6', '2017-04-16 21:56:03', '1', 'A', '2017-05-19 17:32:11', null, null);
INSERT INTO `origin` VALUES ('8', '智能车与机器人协会', 'orgm', '科技引领时代', null, '8', '2017-04-16 21:57:35', '1', 'A', '2017-05-03 21:37:37', null, null);
INSERT INTO `origin` VALUES ('9', '跆拳道协会', 'orgm', '不得不承认，有时候肌肉比头脑更管用，所以我们要强身健体', null, '1', '2017-04-16 21:58:48', '1', 'A', '2017-04-16 21:58:55', null, null);
INSERT INTO `origin` VALUES ('10', '三早晨读社', 'orgm', '早睡，早起，早读书', null, '1', '2017-04-16 21:59:40', '1', 'A', '2017-04-16 21:59:45', null, null);
INSERT INTO `origin` VALUES ('11', '轮滑社', 'orgm', '在这光滑的地面上摩擦', null, '1', '2017-04-16 22:00:26', '1', 'A', '2017-04-16 22:00:32', null, null);
INSERT INTO `origin` VALUES ('12', '手机开发协会', 'orgm', '移动端时代已经到来，我们就是引领时代的先行者', null, '2', '2017-04-16 22:01:16', '1', 'A', '2017-04-16 22:01:22', null, null);
INSERT INTO `origin` VALUES ('13', '学习部', 'orgu', '督促松弛的同学学习，是我们的目的', null, '2', '2017-04-16 22:02:17', '1', 'A', '2017-04-16 22:02:22', null, null);
INSERT INTO `origin` VALUES ('14', '13软嵌2', 'C', '活力四射的班级吗', '2013', '7', '2017-05-03 23:30:07', '4', 'A', '2017-05-03 23:30:17', null, null);
INSERT INTO `origin` VALUES ('15', '土木工程学院分会', 'orgi', null, null, '1', '2017-05-08 17:15:45', '1', 'A', '2017-05-08 17:16:04', null, null);
INSERT INTO `origin` VALUES ('16', '环境工程学院分会', 'orgi', null, null, '0', '2017-05-08 17:18:51', '1', 'A', '2017-05-08 17:19:02', null, null);
INSERT INTO `origin` VALUES ('17', '外国语学院分会', 'orgi', null, null, '0', '2017-05-08 17:19:32', '1', 'A', '2017-05-08 17:19:39', null, null);
INSERT INTO `origin` VALUES ('18', '化学化工学院', 'orgi', null, null, '0', '2017-05-08 18:33:48', '1', 'A', '2017-05-08 18:33:54', null, null);
INSERT INTO `origin` VALUES ('19', '经济学院', 'orgi', null, null, '0', '2017-05-08 18:37:45', '1', 'A', '2017-05-08 18:37:42', null, null);
INSERT INTO `origin` VALUES ('20', '教育科学学院', 'orgi', null, null, '0', '2017-05-08 18:38:25', '1', 'A', '2017-05-08 18:38:32', null, null);
INSERT INTO `origin` VALUES ('21', '体育学院', 'orgi', null, null, '0', '2017-05-08 18:38:57', '1', 'A', '2017-05-08 18:39:04', null, null);
INSERT INTO `origin` VALUES ('22', '人文学院', 'orgi', null, null, '0', '2017-05-08 18:39:28', '1', 'A', '2017-05-08 18:39:39', null, null);
INSERT INTO `origin` VALUES ('23', '外国语学院', 'orgi', null, null, '0', '2017-05-08 18:39:56', '1', 'A', '2017-05-08 18:40:02', null, null);
INSERT INTO `origin` VALUES ('24', '艺术学院', 'orgi', null, null, '0', '2017-05-08 18:40:23', '1', 'A', '2017-05-08 18:40:36', null, null);
INSERT INTO `origin` VALUES ('25', '数学与物理科学学院', 'orgi', null, null, '0', '2017-05-08 18:41:09', '1', 'A', '2017-05-08 18:41:17', null, null);
INSERT INTO `origin` VALUES ('26', '机电工程学院', 'orgi', null, null, '0', '2017-05-08 18:41:54', '1', 'A', '2017-05-08 18:42:00', null, null);
INSERT INTO `origin` VALUES ('27', '食品工程学院', 'orgi', null, null, '0', '2017-05-08 18:42:26', '1', 'A', '2017-05-08 18:42:31', null, null);
INSERT INTO `origin` VALUES ('28', '管理学院', 'orgi', null, null, '0', '2017-05-08 18:42:49', '1', 'A', '2017-05-08 18:42:55', null, null);
INSERT INTO `origin` VALUES ('29', '马克思主义学院', 'orgi', null, null, '0', '2017-05-08 18:43:16', '1', 'A', '2017-05-08 18:43:22', null, null);
INSERT INTO `origin` VALUES ('30', '13通信', 'C', '', '2013', '0', '2017-05-19 09:52:00', '1', 'A', '2017-05-19 09:52:00', null, null);
INSERT INTO `origin` VALUES ('31', '14通信', 'C', '', '2013', '0', '2017-05-19 10:06:10', '1', 'A', '2017-05-19 10:06:10', null, null);
INSERT INTO `origin` VALUES ('32', '14计算机', 'C', '', '2014', '0', '2017-05-19 10:09:07', '1', 'A', '2017-05-19 10:09:07', null, null);
INSERT INTO `origin` VALUES ('33', '15通信', 'C', '', '2015', '0', '2017-05-19 10:24:07', '1', 'A', '2017-05-19 10:24:07', null, null);
INSERT INTO `origin` VALUES ('34', '16通信', 'C', '', '2016', '0', '2017-05-19 10:27:04', '1', 'A', '2017-05-19 10:27:04', null, null);
INSERT INTO `origin` VALUES ('35', '17通信', 'C', '', '2017', '0', '2017-05-19 10:32:48', '1', 'A', '2017-05-19 10:32:48', null, null);
INSERT INTO `origin` VALUES ('36', '17计算机', 'C', '', '2017', '0', '2017-05-19 10:33:04', '1', 'A', '2017-05-19 10:33:04', null, null);

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
  `leader_name` varchar(10) NOT NULL COMMENT '负责人姓名',
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruit
-- ----------------------------
INSERT INTO `recruit` VALUES ('27', '西树泡芙开业大吉，招服务员10名', 'sl4', '10', 'profall', '1', null, '李先生', '13412514543', '0', '服务员', '工作时间:afbsbdzxcxvdsxz送饭的vsdsdf诗圣杜甫斯蒂芬斯蒂芬广东东莞贵妇狗', 'be1,be4,be7,be8', '呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵', '38', '2', '2016-02-06 14:38:25', 'A', '2016-02-06 14:38:25', null, null);
INSERT INTO `recruit` VALUES ('38', '羊肉馆缺的就是 经理', 'sl4', '1', 'bk', '0', null, '张全蛋', '3838438', '0', '大堂经理', '工作时间:，大堂经理最潇洒，大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒', 'be1,be2,be3,be4', '徐州市沛县龙固时尚街区', '38', '2', '2016-02-06 16:38:34', 'A', '2016-02-06 16:38:34', null, null);
INSERT INTO `recruit` VALUES ('53', '朱氏土灶台', 'sl2', '2', 'profall', '0', null, '朱正玉', '19873661127', '0', '洗碗工', '工作时间:呵呵额呵呵我试试看，呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看', 'be1,be4,be8', '苏州科技园小吃一条街', '38', '2', '2016-02-06 20:23:12', 'A', '2016-02-10 23:03:08', null, null);
INSERT INTO `recruit` VALUES ('54', '长城4S店', 'sl4', '3', 'profall', '3', null, '刘金宝', '13322529090', '0', '4S专业维修人员', '工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点', 'be1,be2,be3,be4', '徐州市竹林寺对面，长城4S店', '38', '2', '2016-02-06 21:15:01', 'A', '2017-05-14 20:45:34', null, null);
INSERT INTO `recruit` VALUES ('56', '重工之路，怎能少了机械师的指点', 'sl5', '3', 'bk', '1', null, '刘经理', '13452328979', '0', '中型机械师', '岗位职责:研究以及实践新时代下重型器械的发展方向，为我公司做强有力的发展导师；\r\n\r\n任职资格:本科及以上学历，有三年以上工作经验；\r\n\r\n工作时间:三班倒', 'be1,be2,be3,be4,be5,be6,be7,be8,be10', '徐州工业集团总部厂房', '39', '3', '2016-02-06 22:52:15', 'A', '2017-05-14 20:45:33', null, null);
INSERT INTO `recruit` VALUES ('57', '招聘A级摄影师一名', 'sl4', '1', 'profall', '0', null, '吴经理', '15567984543', '0', '摄影室', '岗位职责:国庆将至，本店迎来大批顾客，拍摄写真、全家福等照片，业务较多，特聘摄影师负责部分 工作，包括摄影、场景布置、业务接待；\r\n\r\n任职资格:有两年以上工作经验\r\n\r\n工作时间:早九晚五', 'be1,be6,be7,be10', '徐州古彭大厦A座8楼', '44', '4', '2016-02-09 14:20:52', 'A', '2017-05-19 16:40:17', null, null);
INSERT INTO `recruit` VALUES ('59', '证券交易所急招网络安全人员', 'sl5', '2', 'bk', '0', null, '王经理', '15569098900', '0', '网络交易安全', '岗位职责: 维护交易所网站信息安全、交易安全，为证券交易避免网络攻击，保证公司信息安全；\r\n任职资格: 有两年以上工作经验；\r\n工作时间: 早九晚五‘；', 'be3,be4,be6,be7,be10', '上海虹桥机场南广场办公楼1002', '34', '1', '2016-02-10 22:13:06', 'X', '2016-02-10 23:03:08', null, null);
INSERT INTO `recruit` VALUES ('60', '特聘汽车美容师', 'sl4', '5', 'profall', '2', null, '王金山', '89922512/18796553231', '0', '汽车美容师', '岗位职责: 负责返厂汽车的美容保养工作\r\n任职资格: 有一年以上工作经验；\r\n工作时间: 早上8：00-晚上9：00', 'be1,be2,be3,be4,be6,be7', '金山桥一汽大众工作室', '43', '1', '2016-02-10 22:22:57', 'A', '2016-02-10 22:22:57', null, null);
INSERT INTO `recruit` VALUES ('62', '电力维护人员', 'sl5', '2', 'bk', '2', null, '吴天旺', '89923232/18976882212', '0', '电力维护人员', '岗位职责: 保障电力稳定传输；\r\n任职资格: 有3年以上工作经验；\r\n工作时间: 早九晚五；', null, '华北电力公司', '36', '1', '2016-02-10 22:34:23', 'A', '2016-02-10 23:03:07', null, null);
INSERT INTO `recruit` VALUES ('65', '证券交易所急招网络安全人员', 'sl6', '123', 'bk', '1', null, '刘一道', '15569098900', '0', '网络交易安全', '岗位职责: 网络交易安全\r\n任职资格: 网络交易安全\r\n工作时间: 早九晚五', null, '上海虹桥机场南广场办公楼1002', '34', '1', '2016-02-10 23:42:08', 'A', '2016-02-11 22:45:50', null, null);
INSERT INTO `recruit` VALUES ('66', '西树泡芙开业大吉，招服务员10名', 'sl4', '10', 'profall', '0', '2016-02-11 17:15:49', '李先生', '13412514543', '0', '服务员', '工作时间:afbsbdzxcxvdsxz送饭的vsdsdf诗圣杜甫斯蒂芬斯蒂芬广东东莞贵妇狗', 'be1,be4,be7,be8', '呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵', '38', '2', '2016-02-06 14:38:25', 'A', '2016-02-06 14:38:25', '', '');
INSERT INTO `recruit` VALUES ('67', '羊肉馆缺的就是 经理', 'sl4', '1', 'bk', '0', '2016-02-11 17:15:52', '张全蛋', '3838438', '0', '大堂经理', '工作时间:，大堂经理最潇洒，大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒', 'be1,be2,be3,be4', '徐州市沛县龙固时尚街区', '38', '2', '2016-02-06 16:38:34', 'A', '2016-02-06 16:38:34', '', '');
INSERT INTO `recruit` VALUES ('68', '朱氏土灶台', 'sl2', '2', 'profall', '0', '2016-02-11 17:15:55', '朱正玉', '19873661127', '0', '洗碗工', '工作时间:呵呵额呵呵我试试看，呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看', 'be1,be4,be8', '苏州科技园小吃一条街', '38', '2', '2016-02-06 20:23:12', 'A', '2017-05-14 20:45:35', '', '');
INSERT INTO `recruit` VALUES ('69', '聘请秘书一名', 'sl4', '1', 'yjs', '3', null, '刘局长', '89970796', '0', '专职秘书', '岗位职责: 专职秘书专职秘书专职秘书专职秘书专职秘书专职秘书\r\n任职资格: 专职秘书专职秘书专职秘书\r\n工作时间:', 'be3,be4,be5,be6,be7,be8,be10,be9', '徐州市工商管理局', '34', '1', '2016-02-11 22:03:30', 'A', '2016-02-11 22:03:30', null, null);
INSERT INTO `recruit` VALUES ('70', '照烧鸡排饭厨师', 'sl4', '1', 'bk', '4', null, '董经理', '18796221162', '0', '主厨', '岗位职责: 烧饭\r\n任职资格: 要求两年以上工作经验\r\n工作时间: 早九晚五\r\n岗位职责: 烧饭\r\n任职资格: 要求两年以上工作经验\r\n工作时间: 早九晚五', 'be1,be2,be3', '新世纪大道', '45', '2', '2017-03-28 23:04:02', 'X', '2017-05-19 16:40:19', null, null);
INSERT INTO `recruit` VALUES ('71', '哈哈以哈哈', 'sl3', '45', 'bk', '0', null, '宿舍的', '1234554657', '0', '搞笑专家', '岗位职责: 但是V的股份你好久没看，里的反对过分和你见面后\r\n任职资格: 是V的股份你好久没看，里的反对过分和你见面后\r\n工作时间: 是V的股份你好久没看，里的反对过分和你见面后', 'be1,be2', '谁的风格回家帮你是的过得更好', '45', '2', '2017-03-30 22:11:46', 'A', '2017-03-30 22:11:46', null, null);
INSERT INTO `recruit` VALUES ('73', '服务器维护', 'sl4', '1', 'bk', '0', null, '李经理', '17661252354', '1', '运维人员', '岗位职责: 维护服务器\r\n任职资格: 三年工作经验\r\n工作时间: 朝九晚五\r\n岗位职责: 维护服务器\r\n任职资格: 三年工作经验\r\n工作时间: 朝九晚五岗位职责: 维护服务器\r\n任职资格: 三年工作经验\r\n工作时间: 朝九晚五', 'be1,be2', '江苏省徐州沛县', '45', '2', '2017-05-16 22:59:11', 'A', '2017-05-17 16:53:14', null, null);
INSERT INTO `recruit` VALUES ('74', '开发银行客户端项目业务人员', 'sl5', '3', 'bk', '0', null, '蒋俊杰', '15665166787', '1', '业务人员', '岗位职责: 和银行沟通，了解银行业务\r\n任职资格: 有3年以上工作经验\r\n工作时间: 早九晚五\r\n\r\n\r\n\r\n\r\n岗位职责: 和银行沟通，了解银行业务\r\n任职资格: 有3年以上工作经验\r\n工作时间: 早九晚五', 'be4,be5,be6', '南京软件大道', '48', '1', '2017-05-19 16:38:04', 'A', '2017-05-19 16:40:14', null, null);

-- ----------------------------
-- Table structure for recruit_unit
-- ----------------------------
DROP TABLE IF EXISTS `recruit_unit`;
CREATE TABLE `recruit_unit` (
  `unit_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '招聘单位标识',
  `unit_name` varchar(30) NOT NULL COMMENT '单位名称',
  `industry` varchar(20) NOT NULL COMMENT '所属行业',
  `property` varchar(20) DEFAULT NULL COMMENT '单位性质',
  `scale` varchar(20) DEFAULT NULL COMMENT '单位规模',
  `unit_desc` text COMMENT '单位简介',
  `unit_web` varchar(30) DEFAULT NULL COMMENT '单位网站',
  `user_id` int(8) NOT NULL COMMENT '该公司创建者标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`unit_id`),
  KEY `FK_RECRUIT_UNIT_USERID` (`user_id`),
  CONSTRAINT `FK_RECRUIT_UNIT_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

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
INSERT INTO `recruit_unit` VALUES ('46', '镇江动漫设计工作室', 'hlwjsj', 'sy', 's1', '动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江动漫设计来镇江', '', '125', 'A', '2017-05-03 22:37:13');
INSERT INTO `recruit_unit` VALUES ('47', '东芝', 'txdx', 'sy', 's3', '东芝公司是一家很强大的互联网公司，东芝公司是一家很强大的互联网公司东芝公司是一家很强大的，互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司，东芝公司是一家很强大的互联网公司，东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司，东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司，东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司东芝公司是一家很强大的互联网公司', '', '304', 'A', '2017-05-12 14:26:43');
INSERT INTO `recruit_unit` VALUES ('48', '凌志', 'hlwjsj', 'sy', 's4', '小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司小型软件公司', '', '1', 'A', '2017-05-19 16:31:24');

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
INSERT INTO `resume_post` VALUES ('54', '3', '2017-05-03 20:00:48', 'A', '2017-05-03 20:00:48');
INSERT INTO `resume_post` VALUES ('70', '3', '2017-05-03 20:24:12', 'A', '2017-05-03 20:24:12');
INSERT INTO `resume_post` VALUES ('62', '3', '2017-05-03 20:24:40', 'A', '2017-05-03 20:24:40');
INSERT INTO `resume_post` VALUES ('69', '4', '2017-05-03 21:50:08', 'A', '2017-05-03 21:50:08');
INSERT INTO `resume_post` VALUES ('54', '5', '2017-05-04 13:38:29', 'A', '2017-05-04 13:38:29');
INSERT INTO `resume_post` VALUES ('65', '5', '2017-05-04 13:58:32', 'A', '2017-05-04 13:58:32');
INSERT INTO `resume_post` VALUES ('70', '5', '2017-05-04 13:59:28', 'A', '2017-05-04 13:59:28');
INSERT INTO `resume_post` VALUES ('70', '2', '2017-05-16 23:30:00', 'A', '2017-05-16 23:30:00');
INSERT INTO `resume_post` VALUES ('69', '2', '2017-05-16 23:35:35', 'A', '2017-05-16 23:35:35');
INSERT INTO `resume_post` VALUES ('54', '2', '2017-05-16 23:57:28', 'A', '2017-05-16 23:57:28');
INSERT INTO `resume_post` VALUES ('27', '2', '2017-05-17 00:06:52', 'A', '2017-05-17 00:06:52');
INSERT INTO `resume_post` VALUES ('60', '6', '2017-05-19 17:44:52', 'A', '2017-05-19 17:44:52');
INSERT INTO `resume_post` VALUES ('60', '7', '2017-05-19 23:12:35', 'A', '2017-05-19 23:12:35');

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
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right
-- ----------------------------
INSERT INTO `right` VALUES ('1', '未命名', '0', '1', '/cm', '0', 'A', '2017-05-14 20:44:33');
INSERT INTO `right` VALUES ('2', '未命名', '0', '2', '/cm/deleteClass', '0', 'A', '2017-05-14 20:44:33');
INSERT INTO `right` VALUES ('3', '未命名', '0', '4', '/cm/queryClass', '0', 'A', '2017-05-14 20:44:33');
INSERT INTO `right` VALUES ('4', '未命名', '0', '8', '/cm/excepClass', '0', 'A', '2017-05-14 20:44:33');
INSERT INTO `right` VALUES ('5', '未命名', '0', '16', '/cm/recoverClass', '0', 'A', '2017-05-14 20:44:33');
INSERT INTO `right` VALUES ('6', '未命名', '0', '32', '/cm/removeClass', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('7', '未命名', '0', '64', '/crm', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('8', '未命名', '0', '128', '/dict/getAllDicts', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('9', '未命名', '0', '256', '/dict/updateDict', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('10', '未命名', '0', '512', '/dict/deleteDict', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('11', '未命名', '0', '1024', '/dict/queryDicts', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('12', '未命名', '0', '2048', '/dict/indexDict', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('13', '未命名', '0', '4096', '/dict/addDict', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('14', '未命名', '0', '8192', '/dict/addDictSubmit', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('15', '未命名', '0', '16384', '/dict/updateDictSubmit', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('16', '未命名', '0', '32768', '/dictData/queryDictData', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('17', '未命名', '0', '65536', '/dictData/indexDictData', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('18', '未命名', '0', '131072', '/dictData/addDictData', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('19', '未命名', '0', '262144', '/dictData/addDictDataSubmit', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('20', '未命名', '0', '524288', '/flat/createFlat', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('21', '未命名', '0', '1048576', '/flat/createFlatSubmit', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('22', '未命名', '0', '2097152', '/job/recoverJob', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('23', '未命名', '0', '4194304', '/job/createJob', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('24', '未命名', '0', '8388608', '/job/deleteJob', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('25', '未命名', '0', '16777216', '/job/setTopJob', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('26', '未命名', '0', '33554432', '/job/auditJobs', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('27', '未命名', '0', '67108864', '/job/auditJob', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('28', '未命名', '0', '134217728', '/job/queryJobs', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('29', '未命名', '0', '268435456', '/job/removeJobs', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('30', '未命名', '0', '536870912', '/job/deleteJobs', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('31', '未命名', '0', '1073741824', '/job/cancelTopJob', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('32', '未命名', '0', '2147483648', '/job/removeJob', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('33', '未命名', '0', '4294967296', '/job/recoverJobs', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('34', '未命名', '0', '8589934592', '/job/detailJob', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('35', '未命名', '0', '17179869184', '/job', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('36', '未命名', '0', '34359738368', '/job/createJobSubmit', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('37', '未命名', '0', '68719476736', '/manage', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('38', '未命名', '0', '137438953472', '/error/{errCode}', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('39', '未命名', '0', '274877906944', '/manage/welcome', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('40', '未命名', '0', '549755813888', '/right/queryRights', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('41', '未命名', '0', '1099511627776', '/right/updateRight', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('42', '未命名', '0', '2199023255552', '/right/addRight', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('43', '未命名', '0', '4398046511104', '/right/indexRight', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('44', '未命名', '0', '8796093022208', '/right/scanAddRights', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('45', '未命名', '0', '17592186044416', '/right/updateRightSubmit', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('46', '班级录', '0', '35184372088832', '/class', '1', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('47', '班级录-查询班级', '0', '70368744177664', '/class/queryClasses', '1', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('48', '班级录', '0', '140737488355328', '/class/outlineClass', '1', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('49', '未命名', '0', '281474976710656', '/classroom/member', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('50', '未命名', '0', '562949953421312', '/classroom/message', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('51', '班级录-班级主页', '0', '1125899906842624', '/classroom', '1', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('52', '未命名', '0', '2251799813685248', '/classroom/directory', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('53', '未命名', '0', '4503599627370496', '/classroom/info', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('54', '未命名', '0', '9007199254740992', '/classroom/description', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('55', '未命名', '0', '18014398509481984', '/classroom/setDescription', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('56', '未命名', '0', '36028797018963968', '/classroom/album/update', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('57', '未命名', '0', '72057594037927936', '/classroom/album/delete', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('58', '未命名', '0', '144115188075855872', '/classroom/album/image', '0', 'A', '2017-05-14 20:44:34');
INSERT INTO `right` VALUES ('59', '未命名', '0', '288230376151711744', '/classroom/album', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('60', '未命名', '0', '576460752303423488', '/classroom/album/save', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('61', '未命名', '0', '1152921504606846976', '/classroom/joinClass', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('62', '未命名', '1', '1', '/classroom/album/add', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('63', '未命名', '1', '2', '/classroom/infoSide', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('64', '未命名', '1', '4', '/classroom/album/edit', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('65', '未命名', '1', '8', '/classroom/commentInfo', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('66', '未命名', '1', '16', '/classroom/infoDetail', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('67', '未命名', '1', '32', '/classroom/album/image/upload', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('68', '未命名', '1', '64', '/classroom/album/cover', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('69', '未命名', '1', '128', '/classroom/album/upload', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('70', '未命名', '1', '256', '/classroom/album/image/delete', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('71', '未命名', '1', '512', '/classroom/publishClassInfo', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('72', '未命名', '1', '1024', '/classroom/publishClassMessage', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('73', '未命名', '1', '2048', '/classroom/infoCommentList', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('74', '未命名', '1', '4096', '/forum', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('75', '未命名', '1', '8192', '/post/add', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('76', '未命名', '1', '16384', '/post/save', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('77', '未命名', '1', '32768', '/post/delete', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('78', '未命名', '1', '65536', '/post/comment', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('79', '未命名', '1', '131072', '/post/detail', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('80', '未命名', '1', '262144', '/post/deleteComment', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('81', '未命名', '1', '524288', '/post/commentList', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('82', '未命名', '1', '1048576', '/post/love', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('83', '未命名', '1', '2097152', '/login/val', '1', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('84', '未命名', '1', '4194304', '/login/validate', '1', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('85', '未命名', '1', '8388608', '/login/logout', '1', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('86', '未命名', '1', '16777216', '/login', '1', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('87', '未命名', '1', '33554432', '/index', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('88', '未命名', '1', '67108864', '/download', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('89', '未命名', '1', '134217728', '/my/account', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('90', '未命名', '1', '268435456', '/my/class', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('91', '未命名', '1', '536870912', '/my', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('92', '未命名', '1', '1073741824', '/my/forum', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('93', '未命名', '1', '2147483648', '/my/recruit', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('94', '未命名', '1', '4294967296', '/my/resume', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('95', '未命名', '1', '8589934592', '/my/resume/delete', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('96', '未命名', '1', '17179869184', '/my/resume/update', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('97', '未命名', '1', '34359738368', '/my/resume/detail', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('98', '未命名', '1', '68719476736', '/my/resume/postResume', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('99', '未命名', '1', '137438953472', '/my/resume/edit', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('100', '未命名', '1', '274877906944', '/my/resume/addResume', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('101', '未命名', '1', '549755813888', '/my/resume/addResumeSubmit', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('102', '未命名', '1', '1099511627776', '/my/profile/basic', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('103', '未命名', '1', '2199023255552', '/my/profile/detail', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('104', '未命名', '1', '4398046511104', '/my/profile/portrait', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('105', '未命名', '1', '8796093022208', '/my/profile/job', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('106', '未命名', '1', '17592186044416', '/ta/show', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('107', '未命名', '1', '35184372088832', '/news', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('108', '未命名', '1', '70368744177664', '/org', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('109', '未命名', '1', '140737488355328', '/org/union', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('110', '未命名', '1', '281474976710656', '/org/mass', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('111', '未命名', '1', '562949953421312', '/org/outline', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('112', '未命名', '1', '1125899906842624', '/org/institute', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('113', '未命名', '1', '2251799813685248', '/orgroom/member', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('114', '未命名', '1', '4503599627370496', '/orgroom/message', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('115', '未命名', '1', '9007199254740992', '/orgroom', '0', 'A', '2017-05-14 20:44:35');
INSERT INTO `right` VALUES ('116', '未命名', '1', '18014398509481984', '/orgroom/directory', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('117', '未命名', '1', '36028797018963968', '/orgroom/info', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('118', '未命名', '1', '72057594037927936', '/orgroom/deleteInfo', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('119', '未命名', '1', '144115188075855872', '/orgroom/album/image', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('120', '未命名', '1', '288230376151711744', '/orgroom/album', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('121', '未命名', '1', '576460752303423488', '/orgroom/loveInfo', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('122', '未命名', '1', '1152921504606846976', '/orgroom/joinOrigin', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('123', '未命名', '2', '1', '/orgroom/infoSide', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('124', '未命名', '2', '2', '/orgroom/commentInfo', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('125', '未命名', '2', '4', '/orgroom/infoDetail', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('126', '未命名', '2', '8', '/orgroom/publishInfo', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('127', '未命名', '2', '16', '/orgroom/infoCommentList', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('128', '未命名', '2', '32', '/orgroom/publishMessage', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('129', '未命名', '2', '64', '/recruit', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('130', '未命名', '2', '128', '/recruit/addRecruit', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('131', '未命名', '2', '256', '/recruit/detailRecruit', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('132', '未命名', '2', '512', '/recruit/addRecruitSubmit', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('133', '未命名', '2', '1024', '/recruit/recruitSuccess', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('134', '未命名', '2', '2048', '/unit/selectUnit', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('135', '未命名', '2', '4096', '/unit/addUnit', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('136', '未命名', '2', '8192', '/unit/addUnitSubmit', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('137', '未命名', '2', '16384', '/service', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('138', '未命名', '2', '32768', '/service/school', '0', 'A', '2017-05-14 20:44:36');
INSERT INTO `right` VALUES ('139', '未命名', '2', '65536', '/info/add', '0', 'A', '2017-05-18 21:33:06');
INSERT INTO `right` VALUES ('140', '未命名', '2', '131072', '/info/save', '0', 'A', '2017-05-18 21:33:06');
INSERT INTO `right` VALUES ('141', '未命名', '2', '262144', '/info', '0', 'A', '2017-05-18 21:33:06');
INSERT INTO `right` VALUES ('142', '未命名', '2', '524288', '/info/update', '0', 'A', '2017-05-18 21:33:06');
INSERT INTO `right` VALUES ('143', '未命名', '2', '1048576', '/info/queryInfo', '0', 'A', '2017-05-18 21:33:06');
INSERT INTO `right` VALUES ('144', '未命名', '2', '2097152', '/my/account/password/update', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('145', '未命名', '2', '4194304', '/my/account/password', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('146', '未命名', '2', '8388608', '/my/account/email', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('147', '未命名', '2', '16777216', '/my/account/email/update', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('148', '未命名', '2', '33554432', '/my/forum/delete', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('149', '未命名', '2', '67108864', '/my/recruit/delete', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('150', '未命名', '2', '134217728', '/my/resume/cancel', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('151', '未命名', '2', '268435456', '/my/resume/posted', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('152', '未命名', '2', '536870912', '/my/profile/job/add', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('153', '未命名', '2', '1073741824', '/my/profile/job/delete.action', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('154', '未命名', '2', '2147483648', '/my/profile/portrait/upload.action', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('155', '未命名', '2', '4294967296', '/my/profile/basic/update', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('156', '未命名', '2', '8589934592', '/news/comment', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('157', '未命名', '2', '17179869184', '/news/detail', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('158', '未命名', '2', '34359738368', '/news/commentList', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('159', '未命名', '2', '68719476736', '/news/outline', '0', 'A', '2017-05-18 21:33:07');
INSERT INTO `right` VALUES ('160', '未命名', '2', '137438953472', '/info/delete', '0', 'A', '2017-05-19 16:52:07');
INSERT INTO `right` VALUES ('161', '未命名', '2', '274877906944', '/origin/add', '0', 'A', '2017-05-19 16:52:07');
INSERT INTO `right` VALUES ('162', '未命名', '2', '549755813888', '/origin/member', '0', 'A', '2017-05-19 16:52:07');
INSERT INTO `right` VALUES ('163', '未命名', '2', '1099511627776', '/origin/save', '0', 'A', '2017-05-19 16:52:07');
INSERT INTO `right` VALUES ('164', '未命名', '2', '2199023255552', '/origin', '0', 'A', '2017-05-19 16:52:08');
INSERT INTO `right` VALUES ('165', '未命名', '2', '4398046511104', '/origin/update', '0', 'A', '2017-05-19 16:52:08');
INSERT INTO `right` VALUES ('166', '未命名', '2', '8796093022208', '/origin/home', '0', 'A', '2017-05-19 16:52:08');
INSERT INTO `right` VALUES ('167', '未命名', '2', '17592186044416', '/origin/queryOrigin', '0', 'A', '2017-05-19 16:52:08');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', 'GA', '2017-05-19 22:39:45', 'A', '2017-05-19 22:39:51');
INSERT INTO `role` VALUES ('2', '普通用户', 'CU', '2017-05-19 22:40:25', 'A', '2017-05-19 22:40:30');
INSERT INTO `role` VALUES ('3', '组织管理员', 'OA', '2017-05-19 22:40:54', 'A', '2017-05-19 22:40:58');
INSERT INTO `role` VALUES ('4', '班级管理员', 'CA', '2017-05-19 22:41:13', 'A', '2017-05-19 22:41:16');

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
  `password` varchar(32) NOT NULL DEFAULT '25D55AD283AA400AF464C76D713C07AD' COMMENT '用户密码',
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `true_name` varchar(10) NOT NULL COMMENT '校友姓名',
  `introduce` varchar(255) NOT NULL DEFAULT '--这个人很懒，什么也没留下' COMMENT '个人简介',
  `image_id` int(8) NOT NULL DEFAULT '1' COMMENT '头像图片标识',
  `is_admin` char(1) NOT NULL DEFAULT '0' COMMENT '管理员标识',
  `state` char(2) NOT NULL DEFAULT 'A' COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `FK_USER_IMAGEID` (`image_id`),
  CONSTRAINT `FK_USER_IMAGEID` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'sa', '25D55AD283AA400AF464C76D713C07AD', null, '管理员', '--这人很懒，什么也没留下', '1', '1', 'A', '2017-04-09 15:40:29', '2016-01-02 15:01:42');
INSERT INTO `user` VALUES ('2', 'black', '25D55AD283AA400AF464C76D713C07AD', '1075512174@qq.com', '布莱克', '这人很懒，什么也没留下', '79', '0', 'A', '2017-04-09 15:40:31', '2016-01-15 22:53:27');
INSERT INTO `user` VALUES ('3', 'jenny', '202CB962AC59075B964B07152D234B70', null, '珍妮', '这人很懒，什么也没留下', '82', '0', 'A', '2017-04-09 15:40:34', '2016-01-24 13:17:33');
INSERT INTO `user` VALUES ('4', '20130505238', '25D55AD283AA400AF464C76D713C07AD', null, '董亮亮', '这人很懒，什么也没留下', '81', '0', 'A', '2017-04-09 15:40:38', '2016-02-05 15:09:15');
INSERT INTO `user` VALUES ('5', '20130505240', '25D55AD283AA400AF464C76D713C07AD', null, '梅朔', '这人很懒，什么也没留下', '1', '0', 'A', '2017-04-09 15:40:40', '2016-02-05 15:38:48');
INSERT INTO `user` VALUES ('6', '20130505241', '25D55AD283AA400AF464C76D713C07AD', null, '沈亚东', '这人很懒，什么也没留下', '80', '0', 'A', '2016-02-05 17:24:50', '2016-02-05 15:38:48');
INSERT INTO `user` VALUES ('7', 'blackist', '202CB962AC59075B964B07152D234B70', null, 'Black先生', '这人很懒，什么也没留下', '1', '0', 'A', '2017-04-02 22:35:38', '2017-04-02 22:35:28');
INSERT INTO `user` VALUES ('8', '20130503202', '25D55AD283AA400AF464C76D713C07AD', null, '颜健', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('9', '20130503203', '25D55AD283AA400AF464C76D713C07AD', null, '张娜', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('10', '20130503204', '25D55AD283AA400AF464C76D713C07AD', null, '杨燕', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('11', '20130503205', '25D55AD283AA400AF464C76D713C07AD', null, '张艳', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('12', '20130503206', '25D55AD283AA400AF464C76D713C07AD', null, '何泽慧', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('13', '20130503207', '25D55AD283AA400AF464C76D713C07AD', null, '祁凯', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('14', '20130503208', '25D55AD283AA400AF464C76D713C07AD', null, '于成东', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('15', '20130503209', '25D55AD283AA400AF464C76D713C07AD', null, '潘峰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('16', '20130503210', '25D55AD283AA400AF464C76D713C07AD', null, '韦杰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('17', '20130503212', '25D55AD283AA400AF464C76D713C07AD', null, '范亚雷', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('18', '20130503213', '25D55AD283AA400AF464C76D713C07AD', null, '王杰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('19', '20130503214', '25D55AD283AA400AF464C76D713C07AD', null, '杜昊鸿', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('20', '20130503215', '25D55AD283AA400AF464C76D713C07AD', null, '林山河', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('21', '20130503216', '25D55AD283AA400AF464C76D713C07AD', null, '李波', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('22', '20130503217', '25D55AD283AA400AF464C76D713C07AD', null, '颜嘉欣', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('23', '20130503218', '25D55AD283AA400AF464C76D713C07AD', null, '刘跃波', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('24', '20130503220', '25D55AD283AA400AF464C76D713C07AD', null, '肖飞', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('25', '20130503221', '25D55AD283AA400AF464C76D713C07AD', null, '刘强', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('26', '20130503223', '25D55AD283AA400AF464C76D713C07AD', null, '赵东栋', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('27', '20130503225', '25D55AD283AA400AF464C76D713C07AD', null, '郑文传', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('28', '20130503226', '25D55AD283AA400AF464C76D713C07AD', null, '石进远', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('29', '20130503227', '25D55AD283AA400AF464C76D713C07AD', null, '戴永政', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('30', '20130503228', '25D55AD283AA400AF464C76D713C07AD', null, '陈冲', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('31', '20130503229', '25D55AD283AA400AF464C76D713C07AD', null, '左文滔', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('32', '20130503230', '25D55AD283AA400AF464C76D713C07AD', null, '司兴健', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('33', '20130503231', '25D55AD283AA400AF464C76D713C07AD', null, '张泽燚', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('34', '20130503232', '25D55AD283AA400AF464C76D713C07AD', null, '吉波', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:41');
INSERT INTO `user` VALUES ('35', '20130503233', '25D55AD283AA400AF464C76D713C07AD', null, '王明轩', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('36', '20130503234', '25D55AD283AA400AF464C76D713C07AD', null, '张彪', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('37', '20130503235', '25D55AD283AA400AF464C76D713C07AD', null, '许恒', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('38', '20130503236', '25D55AD283AA400AF464C76D713C07AD', null, '李琪', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('39', '20130503237', '25D55AD283AA400AF464C76D713C07AD', null, '严志麟', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('40', '20130503238', '25D55AD283AA400AF464C76D713C07AD', null, '徐澔', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('41', '20130503239', '25D55AD283AA400AF464C76D713C07AD', null, '沙淘金', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('42', '20130503240', '25D55AD283AA400AF464C76D713C07AD', null, '滕珂', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('43', '20130503241', '25D55AD283AA400AF464C76D713C07AD', null, '计宗佑', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('44', '20130503242', '25D55AD283AA400AF464C76D713C07AD', null, '谢海庆', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('45', '20130503243', '25D55AD283AA400AF464C76D713C07AD', null, '凌立章', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('46', '20130503244', '25D55AD283AA400AF464C76D713C07AD', null, '张加涛', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('47', '20130503245', '25D55AD283AA400AF464C76D713C07AD', null, '张杰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('48', '20130503246', '25D55AD283AA400AF464C76D713C07AD', null, '陆亚洲', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('49', '20130503247', '25D55AD283AA400AF464C76D713C07AD', null, '李凌飞', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('50', '20130503248', '25D55AD283AA400AF464C76D713C07AD', null, '周亮亮', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('51', '20130503249', '25D55AD283AA400AF464C76D713C07AD', null, '吴庆业', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('52', '20130503250', '25D55AD283AA400AF464C76D713C07AD', null, '刘明明', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('53', '20130503251', '25D55AD283AA400AF464C76D713C07AD', null, '李帅', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('54', '20130503252', '25D55AD283AA400AF464C76D713C07AD', null, '周东东', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('55', '20130503253', '25D55AD283AA400AF464C76D713C07AD', null, '魏庭胜', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('56', '20130503254', '25D55AD283AA400AF464C76D713C07AD', null, '蔡志鹏', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('57', '20130503255', '25D55AD283AA400AF464C76D713C07AD', null, '吴小康', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('58', '20130503256', '25D55AD283AA400AF464C76D713C07AD', null, '孟永乐', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('59', '20130503257', '25D55AD283AA400AF464C76D713C07AD', null, '田小彤', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('60', '20130503258', '25D55AD283AA400AF464C76D713C07AD', null, '汪保旭', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('61', '20130503259', '25D55AD283AA400AF464C76D713C07AD', null, '臧家宾', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('62', '20130503260', '25D55AD283AA400AF464C76D713C07AD', null, '洪伟韬', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:00:42');
INSERT INTO `user` VALUES ('118', '20130502201', '25D55AD283AA400AF464C76D713C07AD', null, '宋雪莹', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('119', '20130502202', '25D55AD283AA400AF464C76D713C07AD', null, '刘敏', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('120', '20130502203', '25D55AD283AA400AF464C76D713C07AD', null, '徐香', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('121', '20130502204', '25D55AD283AA400AF464C76D713C07AD', null, '冯敏', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('122', '20130502205', '25D55AD283AA400AF464C76D713C07AD', null, '陈琦', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('123', '20130502206', '25D55AD283AA400AF464C76D713C07AD', null, '倪宇惠', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('124', '20130502207', '25D55AD283AA400AF464C76D713C07AD', null, '沈咪', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('125', '20130502208', '25D55AD283AA400AF464C76D713C07AD', null, '夏杰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('126', '20130502209', '25D55AD283AA400AF464C76D713C07AD', null, '张艺馨', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('127', '20130502210', '25D55AD283AA400AF464C76D713C07AD', null, '姜娟', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('128', '20130502211', '25D55AD283AA400AF464C76D713C07AD', null, '崔政霞', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('129', '20130502212', '25D55AD283AA400AF464C76D713C07AD', null, '周梦莹', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('130', '20130502213', '25D55AD283AA400AF464C76D713C07AD', null, '丁甜甜', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('131', '20130502214', '25D55AD283AA400AF464C76D713C07AD', null, '黄虚虚', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('132', '20130502215', '25D55AD283AA400AF464C76D713C07AD', null, '杨孟婧', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('133', '20130502216', '25D55AD283AA400AF464C76D713C07AD', null, '冯曦瑾', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('134', '20130502217', '25D55AD283AA400AF464C76D713C07AD', null, '时贝贝', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('135', '20130502218', '25D55AD283AA400AF464C76D713C07AD', null, '胡璐', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('136', '20130502219', '25D55AD283AA400AF464C76D713C07AD', null, '孟颖', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('137', '20130502220', '25D55AD283AA400AF464C76D713C07AD', null, '钟清华', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('138', '20130502221', '25D55AD283AA400AF464C76D713C07AD', null, '周永鹏', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('139', '20130502222', '25D55AD283AA400AF464C76D713C07AD', null, '彭涛', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('140', '20130502223', '25D55AD283AA400AF464C76D713C07AD', null, '孙俊', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('141', '20130502224', '25D55AD283AA400AF464C76D713C07AD', null, '朱家熠', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('142', '20130502225', '25D55AD283AA400AF464C76D713C07AD', null, '张春昊', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('143', '20130502226', '25D55AD283AA400AF464C76D713C07AD', null, '陈键', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('144', '20130502227', '25D55AD283AA400AF464C76D713C07AD', null, '谈子杰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('145', '20130502228', '25D55AD283AA400AF464C76D713C07AD', null, '陆元凯', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('146', '20130502229', '25D55AD283AA400AF464C76D713C07AD', null, '曹彦文', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('147', '20130502231', '25D55AD283AA400AF464C76D713C07AD', null, '钱东培', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('148', '20130502232', '25D55AD283AA400AF464C76D713C07AD', null, '章豪杰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('149', '20130502233', '25D55AD283AA400AF464C76D713C07AD', null, '王安户', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('150', '20130502234', '25D55AD283AA400AF464C76D713C07AD', null, '于孝文', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('151', '20130502235', '25D55AD283AA400AF464C76D713C07AD', null, '孔冰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('152', '20130502236', '25D55AD283AA400AF464C76D713C07AD', null, '沈成', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('153', '20130502237', '25D55AD283AA400AF464C76D713C07AD', null, '吴智超', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('154', '20130502238', '25D55AD283AA400AF464C76D713C07AD', null, '王杰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('155', '20130502239', '25D55AD283AA400AF464C76D713C07AD', null, '唐旺', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('156', '20130502240', '25D55AD283AA400AF464C76D713C07AD', null, '王项韬', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('157', '20130502241', '25D55AD283AA400AF464C76D713C07AD', null, '毛稳', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('158', '20130502242', '25D55AD283AA400AF464C76D713C07AD', null, '胡大伟', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('159', '20130502243', '25D55AD283AA400AF464C76D713C07AD', null, '张青', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('160', '20130502244', '25D55AD283AA400AF464C76D713C07AD', null, '周仁朋', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('161', '20130502246', '25D55AD283AA400AF464C76D713C07AD', null, '赵玉吉', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('162', '20130502247', '25D55AD283AA400AF464C76D713C07AD', null, '薛凤凯', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('163', '20130502248', '25D55AD283AA400AF464C76D713C07AD', null, '李彬', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('164', '20130502249', '25D55AD283AA400AF464C76D713C07AD', null, '王见远', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('165', '20130502250', '25D55AD283AA400AF464C76D713C07AD', null, '张萌萌', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('166', '20130502251', '25D55AD283AA400AF464C76D713C07AD', null, '周宇超', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('167', '20130502252', '25D55AD283AA400AF464C76D713C07AD', null, '郭啸', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('168', '20130502253', '25D55AD283AA400AF464C76D713C07AD', null, '陈凯顺', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('169', '20130502254', '25D55AD283AA400AF464C76D713C07AD', null, '孟珂', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('170', '20130502255', '25D55AD283AA400AF464C76D713C07AD', null, '廖凯', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('171', '20130502256', '25D55AD283AA400AF464C76D713C07AD', null, '樊佳卫', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('172', '20130502257', '25D55AD283AA400AF464C76D713C07AD', null, '姜鹏程', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('173', '20130502258', '25D55AD283AA400AF464C76D713C07AD', null, '陈中康', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('174', '20130502259', '25D55AD283AA400AF464C76D713C07AD', null, '刘磊', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('175', '20130502260', '25D55AD283AA400AF464C76D713C07AD', null, '李壮', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:04:38');
INSERT INTO `user` VALUES ('231', '20130505201', '25D55AD283AA400AF464C76D713C07AD', null, '陈傲娟', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('232', '20130505202', '25D55AD283AA400AF464C76D713C07AD', null, '袁路路', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('233', '20130505203', '25D55AD283AA400AF464C76D713C07AD', null, '闫雨', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('234', '20130505204', '25D55AD283AA400AF464C76D713C07AD', null, '赵莉', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('235', '20130505205', '25D55AD283AA400AF464C76D713C07AD', null, '谢佳慧', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('236', '20130505206', '25D55AD283AA400AF464C76D713C07AD', null, '董倩', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('237', '20130505207', '25D55AD283AA400AF464C76D713C07AD', null, '赵缘', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('238', '20130505208', '25D55AD283AA400AF464C76D713C07AD', null, '吴楠', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('239', '20130505209', '25D55AD283AA400AF464C76D713C07AD', null, '张叶', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('240', '20130505210', '25D55AD283AA400AF464C76D713C07AD', null, '薛玉淋', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('241', '20130505211', '25D55AD283AA400AF464C76D713C07AD', null, '周颖', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('242', '20130505212', '25D55AD283AA400AF464C76D713C07AD', null, '侯文静', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('243', '20130505213', '25D55AD283AA400AF464C76D713C07AD', null, '郝天威', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('244', '20130505214', '25D55AD283AA400AF464C76D713C07AD', null, '戴运来', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('245', '20130505215', '25D55AD283AA400AF464C76D713C07AD', null, '赵一沣', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('246', '20130505216', '25D55AD283AA400AF464C76D713C07AD', null, '刘杰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('247', '20130505217', '25D55AD283AA400AF464C76D713C07AD', null, '是旸明', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('248', '20130505218', '25D55AD283AA400AF464C76D713C07AD', null, '施圣洁', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('249', '20130505219', '25D55AD283AA400AF464C76D713C07AD', null, '王凯', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('250', '20130505220', '25D55AD283AA400AF464C76D713C07AD', null, '姜可', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('251', '20130505221', '25D55AD283AA400AF464C76D713C07AD', null, '杨健', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('252', '20130505222', '25D55AD283AA400AF464C76D713C07AD', null, '夏辉', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('253', '20130505223', '25D55AD283AA400AF464C76D713C07AD', null, '徐洋洋', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('254', '20130505224', '25D55AD283AA400AF464C76D713C07AD', null, '王维', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('255', '20130505225', '25D55AD283AA400AF464C76D713C07AD', null, '赵江麟', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('256', '20130505226', '25D55AD283AA400AF464C76D713C07AD', null, '吴健', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('257', '20130505227', '25D55AD283AA400AF464C76D713C07AD', null, '吴焰峰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('258', '20130505228', '25D55AD283AA400AF464C76D713C07AD', null, '姜凌峰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('259', '20130505229', '25D55AD283AA400AF464C76D713C07AD', null, '任越', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('260', '20130505230', '25D55AD283AA400AF464C76D713C07AD', null, '顾余祥', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('261', '20130505231', '25D55AD283AA400AF464C76D713C07AD', null, '张兴刚', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('262', '20130505233', '25D55AD283AA400AF464C76D713C07AD', null, '贺一飞', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('263', '20130505234', '25D55AD283AA400AF464C76D713C07AD', null, '徐盼', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('264', '20130505235', '25D55AD283AA400AF464C76D713C07AD', null, '叶浪', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('265', '20130505236', '25D55AD283AA400AF464C76D713C07AD', null, '尤煜明', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('266', '20130505237', '25D55AD283AA400AF464C76D713C07AD', null, '邵熙', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('268', '20130505239', '25D55AD283AA400AF464C76D713C07AD', null, '秦冲', '--这个人很懒，什么也没留下', '96', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('271', '20130505242', '25D55AD283AA400AF464C76D713C07AD', null, '姜俊杰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('272', '20130505243', '25D55AD283AA400AF464C76D713C07AD', null, '顾朋朋', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('273', '20130505244', '25D55AD283AA400AF464C76D713C07AD', null, '陈天瑶', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('274', '20130505246', '25D55AD283AA400AF464C76D713C07AD', null, '沈东扬', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('275', '20130505247', '25D55AD283AA400AF464C76D713C07AD', null, '陈超', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('276', '20130505249', '25D55AD283AA400AF464C76D713C07AD', null, '时波', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
INSERT INTO `user` VALUES ('277', '20130505101', '25D55AD283AA400AF464C76D713C07AD', null, '杨诚', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('278', '20130505102', '25D55AD283AA400AF464C76D713C07AD', null, '潘佳玲', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('279', '20130505103', '25D55AD283AA400AF464C76D713C07AD', null, '钱冬芳', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('280', '20130505104', '25D55AD283AA400AF464C76D713C07AD', null, '周洁', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('281', '20130505105', '25D55AD283AA400AF464C76D713C07AD', null, '徐洁', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('282', '20130505106', '25D55AD283AA400AF464C76D713C07AD', null, '花梦晴', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('283', '20130505107', '25D55AD283AA400AF464C76D713C07AD', null, '李倩倩', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('284', '20130505108', '25D55AD283AA400AF464C76D713C07AD', null, '张叶强', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('285', '20130505109', '25D55AD283AA400AF464C76D713C07AD', null, '许雪', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('286', '20130505110', '25D55AD283AA400AF464C76D713C07AD', null, '徐瑶', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('287', '20130505111', '25D55AD283AA400AF464C76D713C07AD', null, '李桂馨', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('288', '20130505112', '25D55AD283AA400AF464C76D713C07AD', null, '田威威', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('289', '20130505113', '25D55AD283AA400AF464C76D713C07AD', null, '张金闯', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('290', '20130505114', '25D55AD283AA400AF464C76D713C07AD', null, '郭泽权', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('291', '20130505115', '25D55AD283AA400AF464C76D713C07AD', null, '高慎佳', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('292', '20130505116', '25D55AD283AA400AF464C76D713C07AD', null, '陈路路', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('293', '20130505117', '25D55AD283AA400AF464C76D713C07AD', null, '郭旭', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('294', '20130505118', '25D55AD283AA400AF464C76D713C07AD', null, '董自信', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('295', '20130505119', '25D55AD283AA400AF464C76D713C07AD', null, '陈维炜', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('296', '20130505120', '25D55AD283AA400AF464C76D713C07AD', null, '魏星亮', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('297', '20130505121', '25D55AD283AA400AF464C76D713C07AD', null, '陈万生', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('298', '20130505122', '25D55AD283AA400AF464C76D713C07AD', null, '孟晨宇', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('299', '20130505123', '25D55AD283AA400AF464C76D713C07AD', null, '邢俊杰', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('300', '20130505124', '25D55AD283AA400AF464C76D713C07AD', null, '刘仁春', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('301', '20130505125', '25D55AD283AA400AF464C76D713C07AD', null, '蔡志丹', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('302', '20130505126', '25D55AD283AA400AF464C76D713C07AD', null, '郝志远', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('303', '20130505127', '25D55AD283AA400AF464C76D713C07AD', null, '宋文成', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('304', '20130505128', '25D55AD283AA400AF464C76D713C07AD', null, '陈雷雷', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('305', '20130505129', '25D55AD283AA400AF464C76D713C07AD', null, '汪龙波', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('306', '20130505130', '25D55AD283AA400AF464C76D713C07AD', null, '李溪海', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('307', '20130505131', '25D55AD283AA400AF464C76D713C07AD', null, '曹硕', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('308', '20130505132', '25D55AD283AA400AF464C76D713C07AD', null, '周文阳', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('309', '20130505133', '25D55AD283AA400AF464C76D713C07AD', null, '刘嘉', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('310', '20130505134', '25D55AD283AA400AF464C76D713C07AD', null, '王生辉', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('311', '20130505135', '25D55AD283AA400AF464C76D713C07AD', null, '卢嘉贵', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('312', '20130505136', '25D55AD283AA400AF464C76D713C07AD', null, '周文利', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('313', '20130505137', '25D55AD283AA400AF464C76D713C07AD', null, '倪钧', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('314', '20130505138', '25D55AD283AA400AF464C76D713C07AD', null, '周尚', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('315', '20130505139', '25D55AD283AA400AF464C76D713C07AD', null, '杜聪', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('316', '20130505140', '25D55AD283AA400AF464C76D713C07AD', null, '徐德立', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('317', '20130505141', '25D55AD283AA400AF464C76D713C07AD', null, '史锋', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('318', '20130505142', '25D55AD283AA400AF464C76D713C07AD', null, '王鸣一', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('319', '20130505143', '25D55AD283AA400AF464C76D713C07AD', null, '张仁伟', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('320', '20130505144', '25D55AD283AA400AF464C76D713C07AD', null, '姚焱舒', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('321', '20130505145', '25D55AD283AA400AF464C76D713C07AD', null, '黄河', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('322', '20130505146', '25D55AD283AA400AF464C76D713C07AD', null, '尹轩宇', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('323', '20130505147', '25D55AD283AA400AF464C76D713C07AD', null, '管庆刚', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('324', '20130505148', '25D55AD283AA400AF464C76D713C07AD', null, '贺山燕', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');
INSERT INTO `user` VALUES ('325', '20130505149', '25D55AD283AA400AF464C76D713C07AD', null, '梁尚', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-29 12:18:17');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_info_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户信息标识',
  `sex` char(1) DEFAULT NULL,
  `age` smallint(3) DEFAULT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '1', '22', '2016-02-19 08:51:31', '18796221162', '1075512174@qq.com', '1075512174', '家里有小杰', '家里有小杰', '徐州市沛县龙固镇龙东村', '4', 'A', '2016-02-19 08:52:56', null, null);
INSERT INTO `user_info` VALUES ('2', '1', '20', null, '15162044824', '3838438@190.com', '38384382', '香蕉人', '香蕉人', '江苏省南通市神鬼村', '2', 'A', '2016-02-27 20:19:13', null, null);
INSERT INTO `user_info` VALUES ('3', '1', '23', '2017-04-02 22:40:30', '18796257336', 'blackist@163.com', '1075512174', 'BIG BANG', 'blackbool', '浙江杭州下沙高教园区', '5', 'A', '2017-04-02 22:41:48', null, null);

-- ----------------------------
-- Table structure for user_job
-- ----------------------------
DROP TABLE IF EXISTS `user_job`;
CREATE TABLE `user_job` (
  `job_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户工作标识',
  `job_name` varchar(30) NOT NULL COMMENT '工作名称',
  `job_unit` varchar(30) NOT NULL COMMENT '工作单位',
  `start_time` datetime DEFAULT NULL COMMENT '就职时间',
  `end_time` datetime DEFAULT NULL COMMENT '离职时间',
  `job_date` varchar(30) NOT NULL COMMENT '工作时间',
  `job_desc` varchar(200) DEFAULT NULL COMMENT '工作描述',
  `isPublic` char(1) DEFAULT '0' COMMENT '工作信息是否公开',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  PRIMARY KEY (`job_id`),
  KEY `FK_USER_USERJOB` (`user_id`),
  CONSTRAINT `FK_USER_USERJOB` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_job
-- ----------------------------
INSERT INTO `user_job` VALUES ('1', 'HTML美工', '凌志公司', null, null, '2016.10 - 至今', null, '0', '2017-05-16 08:11:07', '2', 'A', '2017-05-16 08:11:57');
INSERT INTO `user_job` VALUES ('2', '服务器维护', '东软南京分公司', null, null, '2015.10 - 2016.10', null, '0', '2017-05-16 08:17:39', '2', 'A', '2017-05-16 08:17:43');

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
INSERT INTO `user_origin` VALUES ('2', '3', '2017-02-27 23:17:52', 'A', '2017-02-27 23:17:52');
INSERT INTO `user_origin` VALUES ('2', '2', '2017-02-28 00:30:45', 'A', '2017-02-28 00:30:45');
INSERT INTO `user_origin` VALUES ('2', '4', '2017-03-28 15:38:44', 'A', '2017-03-28 15:38:44');
INSERT INTO `user_origin` VALUES ('2', '8', '2017-04-17 15:47:57', 'A', '2017-04-17 15:48:02');
INSERT INTO `user_origin` VALUES ('2', '9', '2017-04-17 15:48:24', 'A', '2017-04-17 15:48:31');
INSERT INTO `user_origin` VALUES ('2', '10', '2017-04-17 15:48:49', 'A', '2017-04-17 15:48:51');
INSERT INTO `user_origin` VALUES ('2', '11', '2017-04-17 15:49:06', 'A', '2017-04-17 15:49:10');
INSERT INTO `user_origin` VALUES ('3', '8', '2017-04-17 15:49:38', 'A', '2017-04-17 15:49:46');
INSERT INTO `user_origin` VALUES ('4', '8', '2017-04-17 15:50:33', 'A', '2017-04-17 15:50:38');
INSERT INTO `user_origin` VALUES ('5', '6', '2017-04-17 15:51:33', 'A', '2017-04-17 15:51:39');
INSERT INTO `user_origin` VALUES ('6', '7', '2017-04-17 15:51:49', 'A', '2017-04-17 15:51:55');
INSERT INTO `user_origin` VALUES ('7', '12', '2017-04-17 15:52:10', 'A', '2017-04-17 15:52:15');
INSERT INTO `user_origin` VALUES ('3', '13', '2017-04-17 15:52:26', 'A', '2017-04-17 15:52:31');
INSERT INTO `user_origin` VALUES ('2', '7', '2017-04-18 21:17:50', 'A', '2017-04-18 21:17:50');
INSERT INTO `user_origin` VALUES ('4', '4', '2017-04-25 16:53:30', 'A', '2017-04-25 16:53:30');
INSERT INTO `user_origin` VALUES ('5', '3', '2017-04-25 17:24:55', 'A', '2017-04-25 17:24:55');
INSERT INTO `user_origin` VALUES ('4', '3', '2017-04-28 13:25:56', 'A', '2017-04-28 13:25:56');
INSERT INTO `user_origin` VALUES ('262', '2', '2017-04-28 14:15:31', 'A', '2017-04-28 14:15:31');
INSERT INTO `user_origin` VALUES ('122', '7', '2017-04-28 22:16:14', 'A', '2017-04-28 22:16:14');
INSERT INTO `user_origin` VALUES ('6', '8', '2017-04-29 12:19:59', 'A', '2017-04-29 12:19:59');
INSERT INTO `user_origin` VALUES ('119', '8', '2017-04-29 14:33:42', 'A', '2017-04-29 14:33:42');
INSERT INTO `user_origin` VALUES ('118', '8', '2017-04-29 17:10:11', 'A', '2017-04-29 17:10:11');
INSERT INTO `user_origin` VALUES ('122', '2', '2017-05-03 20:26:36', 'A', '2017-05-03 20:26:36');
INSERT INTO `user_origin` VALUES ('122', '12', '2017-05-03 21:04:18', 'A', '2017-05-03 21:04:18');
INSERT INTO `user_origin` VALUES ('122', '4', '2017-05-03 21:19:57', 'A', '2017-05-03 21:19:57');
INSERT INTO `user_origin` VALUES ('5', '8', '2017-05-03 21:37:24', 'A', '2017-05-03 21:37:24');
INSERT INTO `user_origin` VALUES ('125', '8', '2017-05-03 22:40:31', 'A', '2017-05-03 22:40:31');
INSERT INTO `user_origin` VALUES ('5', '14', '2017-05-03 23:54:42', 'A', '2017-05-03 23:54:42');
INSERT INTO `user_origin` VALUES ('5', '4', '2017-05-05 13:31:19', 'A', '2017-05-05 13:31:19');
INSERT INTO `user_origin` VALUES ('5', '2', '2017-05-05 13:31:56', 'A', '2017-05-05 13:31:56');
INSERT INTO `user_origin` VALUES ('2', '14', '2017-05-06 10:35:53', 'A', '2017-05-06 10:35:53');
INSERT INTO `user_origin` VALUES ('5', '13', '2017-05-11 20:03:42', 'A', '2017-05-11 20:03:42');
INSERT INTO `user_origin` VALUES ('5', '7', '2017-05-11 20:36:13', 'A', '2017-05-11 20:36:13');
INSERT INTO `user_origin` VALUES ('304', '14', '2017-05-11 22:19:44', 'A', '2017-05-11 22:19:44');
INSERT INTO `user_origin` VALUES ('4', '14', '2017-05-17 10:07:52', 'A', '2017-05-17 10:07:52');
INSERT INTO `user_origin` VALUES ('3', '14', '2017-05-17 10:09:21', 'A', '2017-05-17 10:09:21');
INSERT INTO `user_origin` VALUES ('6', '3', '2017-05-17 12:37:27', 'A', '2017-05-17 12:37:27');
INSERT INTO `user_origin` VALUES ('271', '14', '2017-05-19 17:22:47', 'A', '2017-05-19 17:22:47');
INSERT INTO `user_origin` VALUES ('271', '7', '2017-05-19 17:30:46', 'A', '2017-05-19 17:30:46');
INSERT INTO `user_origin` VALUES ('271', '4', '2017-05-19 17:34:42', 'A', '2017-05-19 17:34:42');
INSERT INTO `user_origin` VALUES ('271', '2', '2017-05-19 17:41:25', 'A', '2017-05-19 17:41:25');
INSERT INTO `user_origin` VALUES ('268', '14', '2017-05-19 23:06:54', 'A', '2017-05-19 23:06:54');
INSERT INTO `user_origin` VALUES ('268', '7', '2017-05-19 23:09:08', 'A', '2017-05-19 23:09:08');
INSERT INTO `user_origin` VALUES ('268', '4', '2017-05-19 23:13:04', 'A', '2017-05-19 23:13:04');
INSERT INTO `user_origin` VALUES ('2', '15', '2019-03-09 20:55:13', 'A', '2019-03-09 20:55:13');

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
  `contact` varchar(30) NOT NULL COMMENT '联系方式',
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_resume
-- ----------------------------
INSERT INTO `user_resume` VALUES ('1', '寻觅 程序员的工作', 'HEHE', 'sl5', 'Mr.Black', '1', '徐州沛县龙固', '18796221162', '我是一个牛逼的人', null, '2', 'X', '2016-02-07 23:11:49', null, null);
INSERT INTO `user_resume` VALUES ('2', '找一份程序员的工作，前端', 'IT，WEB前端，HTML', 'sl6', '梅朔', '1', '常州市北区', '15665167096', '我是一个小太阳，浑身充满正能量', null, '2', 'A', '2017-04-01 23:53:06', null, null);
INSERT INTO `user_resume` VALUES ('3', '打字员', '文职', 'sl3', '陈琦', '0', '江苏', '101010101010', '时代风格呵呵听歌是的vc发V点都不个非官方你滚蛋 巍峨方便 VV额去的V', null, '122', 'A', '2017-05-03 20:00:28', null, null);
INSERT INTO `user_resume` VALUES ('4', '动漫原型设计', '美工', 'sl5', '夏杰', '0', '徐州', '18796257336', '美女一枚', null, '125', 'A', '2017-05-03 21:49:27', null, null);
INSERT INTO `user_resume` VALUES ('5', '前端工程师', '美工', 'sl4', '梅朔', '1', '常州市北区', '15665167059', '我是一个乐观的人', null, '5', 'A', '2017-05-04 13:38:10', null, null);
INSERT INTO `user_resume` VALUES ('6', '车神', '职业车手', 'sl9', '姜俊杰', '1', '苏州关山', '15665167096', '车神无需废话', null, '271', 'A', '2017-05-19 17:44:10', null, null);
INSERT INTO `user_resume` VALUES ('7', '简历秦冲', '计算机', 'sl1', '秦冲', '1', '徐州工程学院', '15262060800', '优秀', null, '268', 'A', '2017-05-19 23:12:07', null, null);

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
