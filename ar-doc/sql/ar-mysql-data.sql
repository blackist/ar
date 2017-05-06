/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : ar

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-06 14:24:50
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
  KEY `FK_ACTIVITY_ORIGINID` (`origin_id`),
  CONSTRAINT `FK_ACTIVITY_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ACTIVITY_ORIGINID` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('1', '第十届飞思卡尔', '一起参加比赛的日子', 'assets/images/photos/media2.png', '0', '8', '2', '2017-04-29 13:46:24', 'A', '2017-04-29 13:48:03', '', null);
INSERT INTO `album` VALUES ('2', '信电学院单片机设计大赛', '51单片机好有意思', 'assets/images/photos/media6.png', '0', '8', '3', '2017-04-29 14:57:10', 'A', '2017-04-29 14:57:17', null, null);
INSERT INTO `album` VALUES ('3', '院校联赛', '走出校门，比试比试', 'assets/images/photos/media4.png', '0', '8', '4', '2017-04-29 14:57:51', 'A', '2017-04-29 14:58:01', null, null);
INSERT INTO `album` VALUES ('4', '南昌之旅', '国赛', 'assets/images/example/ablum-cover/media-audio.png', '0', '8', '5', '2017-04-29 14:58:40', 'A', '2017-04-29 14:58:44', null, null);
INSERT INTO `album` VALUES ('5', '全国大学生电子设计大赛', '省赛', 'assets/images/example/ablum-cover/media-audio.png', '0', '8', '34', '2017-04-29 15:33:04', 'A', '2017-04-29 15:33:15', null, null);
INSERT INTO `album` VALUES ('6', '班级聚餐', '大龙湖聚餐时的留念', 'assets/images/example/ablum-cover/media-audio.png', '0', '14', '45', '2017-05-03 23:30:57', 'A', '2017-05-03 23:31:13', null, null);
INSERT INTO `album` VALUES ('7', '毕业典礼', '毕业典礼', 'assets/images/example/ablum-cover/media-audio.png', '0', '14', '2', '2017-05-06 14:08:31', 'A', '2017-05-06 14:08:31', null, null);
INSERT INTO `album` VALUES ('8', '大龙湖聚餐', '大龙湖聚餐', 'assets/images/example/ablum-cover/media-audio.png', '0', '14', '2', '2017-05-06 14:24:03', 'A', '2017-05-06 14:24:03', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

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
INSERT INTO `dictionary_data` VALUES ('96', 'in', '校园服务信息', 'SS', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('97', 'ot', '学院', 'INS', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('98', 'in', '招生就业', 'RR', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('99', 'in', '论坛帖子', 'BBS', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('100', 'be', '', 'slmy', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('101', 'ot', '校友总会', 'org', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('102', 'ot', '院系分会', 'orgi', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('103', 'ot', '社团分会', 'orgm', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('104', 'ot', '学生协会', 'orgu', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('105', 'ot', '校友组织', 'OI', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('106', 'in', '班级留言', 'CM', '1', null, null);
INSERT INTO `dictionary_data` VALUES ('107', 'in', '组织留言', 'OM', '1', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '2012', '0', '2016-02-16 16:40:53', 'A', '2016-02-16 16:41:28');
INSERT INTO `grade` VALUES ('2', '2013', '2', '2016-02-16 16:41:18', 'A', '2016-02-16 16:41:25');
INSERT INTO `grade` VALUES ('3', '2014', '1', '2016-02-16 16:41:40', 'A', '2016-02-18 13:11:43');
INSERT INTO `grade` VALUES ('4', '2015', '1', '2016-02-16 16:41:50', 'A', '2016-02-16 16:41:54');
INSERT INTO `grade` VALUES ('5', '2016', '0', '2017-05-04 13:40:12', 'A', '2017-05-04 13:52:18');
INSERT INTO `grade` VALUES ('6', '2011', '0', '2017-05-04 13:40:33', 'A', '2017-05-04 13:52:21');
INSERT INTO `grade` VALUES ('7', '2010', '0', '2017-05-04 13:40:59', 'A', '2017-05-04 13:52:23');
INSERT INTO `grade` VALUES ('8', '2009', '0', '2017-05-04 13:41:13', 'A', '2017-05-04 13:52:27');
INSERT INTO `grade` VALUES ('9', '2008', '0', '2017-05-04 13:41:35', 'A', '2017-05-04 13:52:29');
INSERT INTO `grade` VALUES ('10', '2007', '0', '2017-05-04 13:55:00', 'A', '2017-05-04 13:55:09');
INSERT INTO `grade` VALUES ('11', '2006', '0', '2017-05-04 13:55:22', 'A', '2017-05-04 13:55:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', 'xzit.png', null, null, 'assets/images/logo/xzit.png', null, null, null, null, 'A', null);
INSERT INTO `image` VALUES ('2', 'user2.png', null, null, '/ar-res/pic/portrait/user2.png', null, null, null, null, 'A', null);
INSERT INTO `image` VALUES ('3', null, null, null, '/ar-res/pic/info/blog1.png', null, null, null, null, 'A', null);
INSERT INTO `image` VALUES ('4', null, null, null, '/ar-res/pic/portrait/user6.png', null, null, null, null, 'A', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

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
INSERT INTO `information` VALUES ('23', '厉害了我的哥', '厉害了我的哥', null, null, '0', '0', '0', '2017-03-28 15:39:01', '0', 'CI', '2', '4', 'A', '2017-03-28 15:39:01');
INSERT INTO `information` VALUES ('24', '我是一个梦想家', '我是一个梦想家', null, null, '0', '0', '0', '2017-03-28 18:31:10', '0', 'CI', '2', '3', 'A', '2017-03-28 18:31:10');
INSERT INTO `information` VALUES ('25', null, '我来了，让我听到你们的声音', null, null, '0', '0', '0', '2017-04-07 10:55:49', '0', 'CM', '2', '4', 'A', '2017-04-07 10:55:49');
INSERT INTO `information` VALUES ('26', '校园行指南', '    玉泉校区位于西湖西北角，紧邻玉泉植物园。校区占地总面积1700多亩，校舍建筑总面积70万平方米。玉泉校区是原浙江大学所在地，现浙江大学党政机关办公所在地。\r\n    目前浙江大学理学院、电气工程学院、机械与能源工程学院、材料与化学工程学院、计算机科学与技术学院、信息科学与工程学院、建筑工程学院、生物医学工程与仪器科学学院、经济学院、管理学院、软件学院11个学院党政机关设在该校区。\r\n\r\n    公交线路：K89、K228(夜)、 K16、82/K82、 815、81/K81、527 、15/K15、21/K21、28/k28\r\n\r\n    旅馆：紫兰酒店、玉泉饭店、西子饭店、灵峰山庄、杭州金乐饭店、百合花饭店、浙江大学竺可桢国际教育大楼、浙江大学招待所、玉泉饭店、西子饭店、灵峰山庄、杭州金乐饭店、杭州百合花饭店。', null, null, '0', '5', '0', '2017-04-07 15:48:55', '0', 'SS', '1', '1', 'A', '2017-04-09 18:58:25');
INSERT INTO `information` VALUES ('27', '走进校园', '徐州工程学院是2002年6月经教育部批准，由始建于1983年的彭城职业大学和始建于1985年的徐州经济管理干部学院合并组建的一所全日制普通本科院校。2006年6月，学校获得学士学位授予权。2007年6月，始建于1959年的徐州教育学院整建制并入。\r\n学校坚持地方性、应用型的办学定位，坚持“立足徐州、面向苏北、服务江苏”的服务定位和为区域经济社会发展培养高素质应用型人才的办学目标，实施“错位发展战略”，大力推进教育教学改革和人才培养模式改革，经过多年的建设和发展，已成为一所主干专业学科对应地方支柱产业，具有一定区位优势的地方高校。目前，学校获批为教育部“卓越工程师教育培养计划”实施高校、江苏省大学生创业教育示范校，被授予江苏省高等学校和谐校园、江苏省文明单位、江苏省五一劳动奖状、江苏省科技富民突出贡献单位等荣誉。\r\n学校现有3个校区，占地面积1990.5亩，校舍面积57.39万平方米，固定资产14.78亿元，教学仪器设备值1.50亿元，设有14个二级学院、1个思想政治理论课教研部和1个成人教育学院，开设49个本科专业，全日制在校生21376人。\r\n学校牢固树立人才资源是第一资源和“办学以教师为本”的理念，大力实施师资队伍建设“五大工程”和“卓越计划”，不断提高师资队伍水平。学校现有教职工1279人，其中具有正高职称98人、副高职称335人；具有博士学位140人、硕士学位664人；有1人被遴选为国家科学技术奖评委，2人享受国务院政府特殊津贴，3人被评为二级教授；有全国模范教师和全国优秀教育工作者2人，“江苏省有突出贡献的中青年专家”3人，省“六大人才高峰”培养对象14人，省“333工程”培养对象28人，省“青蓝工程”中青年学术带头人12人和优秀青年骨干教师35人，徐州市优秀专家、拔尖人才63人。\r\n学校紧密结合区域经济社会发展需求，扎实推进专业学科一体化建设。现有2个国家级特色专业，3个教育部“卓越工程师计划”实施专业，1个国家级“专业综合改革试点”项目，3个国家级工程实践教育中心，1个国家级大学生校外实践教育基地，2个国家级国际合作办学项目，6个省级特色专业，5个省级重点专业（类）；获批省级精品课程10门、省级精品教材13部，省级重点教材3部，获省级优秀教学成果奖13项；拥有3个省级一级重点建设学科。\r\n学校坚持以贡献求支持，以贡献求发展，加强产教融合，努力提升科技服务能力，科学研究和平台建设不断取得新进展。09年以来，承担和完成省部级以上科研项目199项、横向课题381项，科研成果获省部级奖励37项。学校现拥有2个省级重点建设实验室，2个省级工程实验室，9个省级工程技术研究中心，8个省级实验教学示范中心；获批省级工业设计中心、省级校外人文社科研究基地、省级人才培养模式创新实验基地、省级优秀教学团队各1个，省级科技创新团队2个，1项成果入选2012年《国家哲学社会科学成果文库》。\r\n学校秉承“格物致知，敬业乐群”的校训精神，积极推进人才培养模式改革，着重培养学生的社会责任感、创新精神和实践动手能力，人才培养质量稳步提升。近三年，我校学生共获得国际竞赛奖项12项，国家级竞赛奖项469项，省部级竞赛奖项492项，其中包括国际数学建模竞赛一等奖、全国大学生数学建模竞赛一等奖、“挑战杯”中国大学生创业计划竞赛银奖、全国普通高等院校算量大赛总冠军、全国大学生英语竞赛特等奖、全国大学生桥牌锦标赛亚军等高级别奖项；获批国家级大学生创新创业训练计划项目71项。人才培养质量的不断提高和毕业生“下得去、留得住、上手快、能力强”的特点受到社会广泛认可，毕业生就业率保持在98%以上。\r\n学校深入推进国际化战略。近年来，学校先后与美国、法国、俄罗斯等12个国家的17所高校和机构建立了稳定的合作关系。举办合作办学项目10个，联合培养学生1470人。着力推进“中青年骨干教师海外培训工程”，派出教师和管理干部393人次到境外培训、访学和攻读学位；留学生工作、中外合作科研和汉语国际推广不断取得新成效。学校是“茉莉花留学江苏政府奖学金”资助高校；有3位外籍教师荣获“江苏省五一劳动荣誉奖章”。教育部简报2012年第212期以《徐州工程学院大力推进国际化发展战略，着力提高师资队伍国际化水平》为题，报道了我校师资国际化的探索和实践。\r\n学校注重结合区域文化特征，努力发挥文化传承功能。学校以非物质文化遗产的研究与传承作为高校发挥文化传承与创新功能的突破口，积极推进“非遗”进校园、进课堂、进教材、进科研工作。举办了两届中国非物质文化遗产高层论坛，“淮海地区非物质文化遗产研究中心”获批江苏省普通高等学校人文社会科学校外研究基地，相关建设成果获得教育部“高校校园文化建设”优秀奖。\r\n展望未来，学校将深入贯彻落实科学发展观，不断加强内涵建设，大力提高教育教学质量和人才培养质量，以改革创新为动力，努力发展成为一所特色鲜明的高水平地方本科院校。', null, null, '0', '4', '0', '2017-04-07 16:13:24', '0', 'SS', '1', '1', 'A', null);
INSERT INTO `information` VALUES ('28', '校友论坛规章制度', '严格遵守', 'AZ', null, '29', '3', '1', '2017-04-09 14:03:41', '0', 'BBS', '1', null, 'A', '2017-04-09 14:05:42');
INSERT INTO `information` VALUES ('29', '欢天喜地的校庆', '时间：2017年04月19日 20:00~22:00\r\n所属：杭州浙江大学校友会 \r\n地址：（东园街）东园巷379号东园小学东园校区（大门左手边体育馆2楼）\r\n人数：14人\r\n状态：距离开始还有1周\r\n\r\n1.费用：男生30元，女生20元，请自备零钱或者支付宝fugel@163.com。\r\n空降兵（没报名直接参加的）35元，现场支付（请不要空降，确保每个人一定的打球时间，谢谢）。<br>\r\n鸽子（报了名不参加的）事后追罚10元，同年三次以上追罚20元。（活动当日提前三小时以上取消报名的不算鸽子。）\r\n2.如报名后需取消报名，请在活动当天17点前取消报名。\r\n3.活动用球由俱乐部统一提供。\r\n4.羽毛球qq交流群79806050（入群申请务必写明姓名及教育信息，否则一概无视哟）。\r\n\r\n公交站点：体育场路口、 红会医院、建国路口、潮鸣寺巷、宝善桥建国路口、红会医院北站', 'ZA', null, '300', '28', '26', '2017-04-09 14:10:49', '0', 'BBS', '2', null, 'A', '2017-04-09 14:11:01');
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
INSERT INTO `information` VALUES ('54', '哈哈，开心的大学生活', '开心的不要不要的', '', '', '0', '0', '0', '2017-04-28 22:18:45', '0', 'OI', '122', '7', 'A', '2017-04-28 22:18:45');
INSERT INTO `information` VALUES ('55', '', '我来也', '', '', '0', '0', '0', '2017-04-28 22:18:54', '0', 'OM', '122', '7', 'A', '2017-04-28 22:18:54');
INSERT INTO `information` VALUES ('56', '', '小杰来报道', '', '', '0', '0', '0', '2017-04-29 00:41:34', '0', 'OM', '125', '7', 'A', '2017-04-29 00:41:34');
INSERT INTO `information` VALUES ('57', '', '哈哈', '', '', '0', '0', '0', '2017-04-29 12:22:32', '0', 'OM', '6', '8', 'A', '2017-04-29 12:22:40');
INSERT INTO `information` VALUES ('58', '新帖子，冒个泡', '猫跑了，冒泡了', '', '', '3', '1', '1', '2017-04-29 14:33:19', '0', 'BBS', '119', null, 'A', '2017-04-29 14:33:19');
INSERT INTO `information` VALUES ('59', '爱玩了', '的说法不V你那边', '', '', '0', '0', '0', '2017-04-29 14:33:56', '0', 'OI', '119', '8', 'A', '2017-04-29 14:33:56');
INSERT INTO `information` VALUES ('60', '呵呵', '地超看到法国不能发生的', '', '', '0', '0', '0', '2017-04-29 14:35:20', '0', 'OI', '119', '8', 'A', '2017-04-29 14:35:20');
INSERT INTO `information` VALUES ('61', '啊师傅规范化', '阿尔法狗好呢', '', '', '1', '0', '0', '2017-04-29 14:37:40', '0', 'OI', '119', '8', 'A', '2017-04-29 14:37:50');
INSERT INTO `information` VALUES ('62', '', '哈啊哈', '', '', '0', '0', '0', '2017-05-03 20:26:44', '0', 'CM', '122', '2', 'A', '2017-05-03 20:26:44');
INSERT INTO `information` VALUES ('63', '快乐的日子', '哥好久没跟你告白', '', '/ar/pic/info/1ebe4dbe-1eff-4176-861c-ca4ff746cfbb.png', '0', '0', '1', '2017-05-03 20:27:22', '0', 'CI', '122', '2', 'A', '2017-05-03 20:27:22');
INSERT INTO `information` VALUES ('64', '', '留言了', '', '', '0', '0', '0', '2017-05-03 21:20:06', '0', 'CM', '122', '4', 'A', '2017-05-03 21:20:06');
INSERT INTO `information` VALUES ('65', '到此一游', '我来了', '', '', '0', '0', '0', '2017-05-03 21:20:26', '0', 'CI', '122', '4', 'A', '2017-05-03 21:20:26');
INSERT INTO `information` VALUES ('66', '', '我是逗逼', '', '', '0', '0', '0', '2017-05-03 21:37:37', '0', 'OM', '5', '8', 'A', '2017-05-03 21:37:37');
INSERT INTO `information` VALUES ('67', '新帖发一枚', '喜欢上了工作', '', '', '0', '0', '0', '2017-05-03 21:51:11', '0', 'BBS', '125', null, 'A', '2017-05-03 21:51:11');
INSERT INTO `information` VALUES ('68', '第一发', '第一条动态消息', '', '', '0', '0', '0', '2017-05-03 23:55:03', '0', 'CI', '5', '14', 'A', '2017-05-03 23:55:03');
INSERT INTO `information` VALUES ('69', '', '逗逼到此一游', '', '', '0', '0', '0', '2017-05-03 23:55:15', '0', 'CM', '5', '14', 'A', '2017-05-03 23:55:15');
INSERT INTO `information` VALUES ('70', 'Come On Baby Go', '一起嗨过的日子', '', '', '0', '0', '0', '2017-05-05 13:32:21', '0', 'CI', '5', '2', 'A', '2017-05-05 13:32:21');

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
  `origin_no` varchar(20) DEFAULT NULL COMMENT '组织编号',
  `origin_type` varchar(20) NOT NULL COMMENT '组织类型',
  `origin_desc` varchar(500) DEFAULT NULL COMMENT '组织描述',
  `origin_grade` char(4) DEFAULT NULL,
  `members` int(4) NOT NULL DEFAULT '0' COMMENT '成员数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `mgr_id` int(8) DEFAULT NULL,
  `creator_id` int(8) NOT NULL COMMENT '创建者',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`origin_id`),
  KEY `FK_ORIGIN_CREATORID` (`creator_id`),
  KEY `FK_ORIGIN_MGRID` (`mgr_id`),
  CONSTRAINT `FK_ORIGIN_CREATORID` FOREIGN KEY (`creator_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_ORIGIN_MGRID` FOREIGN KEY (`mgr_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of origin
-- ----------------------------
INSERT INTO `origin` VALUES ('1', '徐州工程学院', '', 'INS', '', '', '0', '2016-02-16 23:21:47', '1', '1', 'A', '2016-02-16 23:22:02', null, null);
INSERT INTO `origin` VALUES ('2', '13软嵌1班', '201305051', 'C', null, '2013', '4', '2016-02-17 15:38:12', '3', '2', 'A', '2016-02-17 15:38:25', null, null);
INSERT INTO `origin` VALUES ('3', '14计嵌1', '201405051', 'C', '14计嵌1班欢迎你的加入', '2014', '3', '2016-02-18 19:45:09', '4', '2', 'A', '2016-02-18 19:45:21', null, null);
INSERT INTO `origin` VALUES ('4', '15自动化', '201505011', 'C', null, '2015', '37', '2016-02-18 19:46:04', '3', '2', 'A', '2016-02-18 19:46:12', null, null);
INSERT INTO `origin` VALUES ('5', '信电工程学院', null, 'INS', null, null, '0', '2017-04-07 15:54:11', '1', '1', 'A', '2017-04-07 15:54:24', null, null);
INSERT INTO `origin` VALUES ('6', '校友总会', null, 'org', '信电学院校友总会', null, '1', '2017-04-16 21:54:52', '1', '1', 'A', '2017-04-16 21:55:05', null, null);
INSERT INTO `origin` VALUES ('7', '信电工程学院分会', null, 'orgi', '信电工程学院分会', null, '3', '2017-04-16 21:56:03', '1', '1', 'A', '2017-04-29 00:41:34', null, null);
INSERT INTO `origin` VALUES ('8', '智能车与机器人协会', null, 'orgm', '科技引领时代', null, '8', '2017-04-16 21:57:35', '1', '1', 'A', '2017-05-03 21:37:37', null, null);
INSERT INTO `origin` VALUES ('9', '跆拳道协会', null, 'orgm', '不得不承认，有时候肌肉比头脑更管用，所以我们要强身健体', null, '1', '2017-04-16 21:58:48', '1', '1', 'A', '2017-04-16 21:58:55', null, null);
INSERT INTO `origin` VALUES ('10', '三早晨读社', null, 'orgm', '早睡，早起，早读书', null, '1', '2017-04-16 21:59:40', '1', '1', 'A', '2017-04-16 21:59:45', null, null);
INSERT INTO `origin` VALUES ('11', '轮滑社', null, 'orgm', '在这光滑的地面上摩擦', null, '1', '2017-04-16 22:00:26', '1', '1', 'A', '2017-04-16 22:00:32', null, null);
INSERT INTO `origin` VALUES ('12', '手机开发协会', null, 'orgm', '移动端时代已经到来，我们就是引领时代的先行者', null, '2', '2017-04-16 22:01:16', '1', '1', 'A', '2017-04-16 22:01:22', null, null);
INSERT INTO `origin` VALUES ('13', '学习部', null, 'orgu', '督促松弛的同学学习，是我们的目的', null, '1', '2017-04-16 22:02:17', '1', '1', 'A', '2017-04-16 22:02:22', null, null);
INSERT INTO `origin` VALUES ('14', '13软嵌2', '20130505', 'C', '活力四射的班级', '2013', '2', '2017-05-03 23:30:07', '1', '1', 'A', '2017-05-03 23:30:17', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruit
-- ----------------------------
INSERT INTO `recruit` VALUES ('27', '西树泡芙开业大吉，招服务员10名', 'sl4', '10', 'profall', '0', null, '李先生', '13412514543', '0', '服务员', '工作时间:afbsbdzxcxvdsxz送饭的vsdsdf诗圣杜甫斯蒂芬斯蒂芬广东东莞贵妇狗', 'be1,be4,be7,be8', '呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵', '38', '2', '2016-02-06 14:38:25', 'A', '2016-02-06 14:38:25', null, null);
INSERT INTO `recruit` VALUES ('38', '羊肉馆缺的就是 经理', 'sl4', '1', 'bk', '0', null, '张全蛋', '3838438', '0', '大堂经理', '工作时间:，大堂经理最潇洒，大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒', 'be1,be2,be3,be4', '徐州市沛县龙固时尚街区', '38', '2', '2016-02-06 16:38:34', 'A', '2016-02-06 16:38:34', null, null);
INSERT INTO `recruit` VALUES ('53', '朱氏土灶台', 'sl2', '2', 'profall', '0', null, '朱正玉', '19873661127', '0', '洗碗工', '工作时间:呵呵额呵呵我试试看，呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看', 'be1,be4,be8', '苏州科技园小吃一条街', '38', '2', '2016-02-06 20:23:12', 'A', '2016-02-10 23:03:08', null, null);
INSERT INTO `recruit` VALUES ('54', '长城4S店', 'sl4', '3', 'profall', '2', null, '刘金宝', '13322529090', '1', '4S专业维修人员', '工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点工作时间:早上9点-晚上5点', 'be1,be2,be3,be4', '徐州市竹林寺对面，长城4S店', '38', '2', '2016-02-06 21:15:01', 'A', '2016-02-11 22:45:47', null, null);
INSERT INTO `recruit` VALUES ('56', '重工之路，怎能少了机械师的指点', 'sl5', '3', 'bk', '1', null, '刘经理', '13452328979', '1', '中型机械师', '岗位职责:研究以及实践新时代下重型器械的发展方向，为我公司做强有力的发展导师；\r\n\r\n任职资格:本科及以上学历，有三年以上工作经验；\r\n\r\n工作时间:三班倒', 'be1,be2,be3,be4,be5,be6,be7,be8,be10', '徐州工业集团总部厂房', '39', '3', '2016-02-06 22:52:15', 'A', '2016-02-11 21:46:56', null, null);
INSERT INTO `recruit` VALUES ('57', '招聘A级摄影师一名', 'sl4', '1', 'profall', '0', null, '吴经理', '15567984543', '0', '摄影室', '岗位职责:国庆将至，本店迎来大批顾客，拍摄写真、全家福等照片，业务较多，特聘摄影师负责部分 工作，包括摄影、场景布置、业务接待；\r\n\r\n任职资格:有两年以上工作经验\r\n\r\n工作时间:早九晚五', 'be1,be6,be7,be10', '徐州古彭大厦A座8楼', '44', '4', '2016-02-09 14:20:52', 'A', '2016-02-10 23:03:07', null, null);
INSERT INTO `recruit` VALUES ('59', '证券交易所急招网络安全人员', 'sl5', '2', 'bk', '0', null, '王经理', '15569098900', '0', '网络交易安全', '岗位职责: 维护交易所网站信息安全、交易安全，为证券交易避免网络攻击，保证公司信息安全；\r\n任职资格: 有两年以上工作经验；\r\n工作时间: 早九晚五‘；', 'be3,be4,be6,be7,be10', '上海虹桥机场南广场办公楼1002', '34', '1', '2016-02-10 22:13:06', 'X', '2016-02-10 23:03:08', null, null);
INSERT INTO `recruit` VALUES ('60', '特聘汽车美容师', 'sl4', '5', 'profall', '0', null, '王金山', '89922512/18796553231', '0', '汽车美容师', '岗位职责: 负责返厂汽车的美容保养工作\r\n任职资格: 有一年以上工作经验；\r\n工作时间: 早上8：00-晚上9：00', 'be1,be2,be3,be4,be6,be7', '金山桥一汽大众工作室', '43', '1', '2016-02-10 22:22:57', 'A', '2016-02-10 22:22:57', null, null);
INSERT INTO `recruit` VALUES ('62', '电力维护人员', 'sl5', '2', 'bk', '2', null, '吴天旺', '89923232/18976882212', '0', '电力维护人员', '岗位职责: 保障电力稳定传输；\r\n任职资格: 有3年以上工作经验；\r\n工作时间: 早九晚五；', null, '华北电力公司', '36', '1', '2016-02-10 22:34:23', 'A', '2016-02-10 23:03:07', null, null);
INSERT INTO `recruit` VALUES ('65', '证券交易所急招网络安全人员', 'sl6', '123', 'bk', '1', null, '刘一道', '15569098900', '0', '网络交易安全', '岗位职责: 网络交易安全\r\n任职资格: 网络交易安全\r\n工作时间: 早九晚五', null, '上海虹桥机场南广场办公楼1002', '34', '1', '2016-02-10 23:42:08', 'A', '2016-02-11 22:45:50', null, null);
INSERT INTO `recruit` VALUES ('66', '西树泡芙开业大吉，招服务员10名', 'sl4', '10', 'profall', '0', '2016-02-11 17:15:49', '李先生', '13412514543', '0', '服务员', '工作时间:afbsbdzxcxvdsxz送饭的vsdsdf诗圣杜甫斯蒂芬斯蒂芬广东东莞贵妇狗', 'be1,be4,be7,be8', '呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵', '38', '2', '2016-02-06 14:38:25', 'A', '2016-02-06 14:38:25', '', '');
INSERT INTO `recruit` VALUES ('67', '羊肉馆缺的就是 经理', 'sl4', '1', 'bk', '0', '2016-02-11 17:15:52', '张全蛋', '3838438', '0', '大堂经理', '工作时间:，大堂经理最潇洒，大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒大堂经理最潇洒', 'be1,be2,be3,be4', '徐州市沛县龙固时尚街区', '38', '2', '2016-02-06 16:38:34', 'A', '2016-02-06 16:38:34', '', '');
INSERT INTO `recruit` VALUES ('68', '朱氏土灶台', 'sl2', '2', 'profall', '0', '2016-02-11 17:15:55', '朱正玉', '19873661127', '1', '洗碗工', '工作时间:呵呵额呵呵我试试看，呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看呵额呵呵我试试看', 'be1,be4,be8', '苏州科技园小吃一条街', '38', '2', '2016-02-06 20:23:12', 'A', '2016-02-11 20:45:34', '', '');
INSERT INTO `recruit` VALUES ('69', '聘请秘书一名', 'sl4', '1', 'yjs', '1', null, '刘局长', '89970796', '0', '专职秘书', '岗位职责: 专职秘书专职秘书专职秘书专职秘书专职秘书专职秘书\r\n任职资格: 专职秘书专职秘书专职秘书\r\n工作时间:', 'be3,be4,be5,be6,be7,be8,be10,be9', '徐州市工商管理局', '34', '1', '2016-02-11 22:03:30', 'A', '2016-02-11 22:03:30', null, null);
INSERT INTO `recruit` VALUES ('70', '照烧鸡排饭厨师', 'sl4', '1', 'bk', '2', null, '董经理', '18796221162', '0', '主厨', '岗位职责: 烧饭\r\n任职资格: 要求两年以上工作经验\r\n工作时间: 早九晚五\r\n岗位职责: 烧饭\r\n任职资格: 要求两年以上工作经验\r\n工作时间: 早九晚五', 'be1,be2,be3', '新世纪大道', '45', '2', '2017-03-28 23:04:02', 'A', '2017-03-28 23:04:02', null, null);
INSERT INTO `recruit` VALUES ('71', '哈哈以哈哈', 'sl3', '45', 'bk', '0', null, '宿舍的', '1234554657', '0', '搞笑专家', '岗位职责: 但是V的股份你好久没看，里的反对过分和你见面后\r\n任职资格: 是V的股份你好久没看，里的反对过分和你见面后\r\n工作时间: 是V的股份你好久没看，里的反对过分和你见面后', 'be1,be2', '谁的风格回家帮你是的过得更好', '45', '2', '2017-03-30 22:11:46', 'D', '2017-03-30 22:11:46', null, null);
INSERT INTO `recruit` VALUES ('72', '代练', 'sl4', '2', 'bk', '0', null, '董亮亮', '18796221162', '0', '代练王者荣耀', '岗位职责: 代练游戏，就是干\r\n任职资格: 不坑队友，有三年以上工作经验\r\n工作时间: 全天候，有需求我们就有服务', 'be1,be2', '南京软件大道', '45', '2', '2017-04-12 22:40:37', 'A', '2017-04-12 22:40:37', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

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
INSERT INTO `resume_post` VALUES ('62', '2', '2017-04-01 15:55:53', 'A', '2017-04-01 15:55:53');
INSERT INTO `resume_post` VALUES ('56', '2', '2017-04-25 11:14:18', 'A', '2017-04-25 11:14:18');
INSERT INTO `resume_post` VALUES ('54', '3', '2017-05-03 20:00:48', 'A', '2017-05-03 20:00:48');
INSERT INTO `resume_post` VALUES ('70', '3', '2017-05-03 20:24:12', 'A', '2017-05-03 20:24:12');
INSERT INTO `resume_post` VALUES ('62', '3', '2017-05-03 20:24:40', 'A', '2017-05-03 20:24:40');
INSERT INTO `resume_post` VALUES ('69', '4', '2017-05-03 21:50:08', 'A', '2017-05-03 21:50:08');
INSERT INTO `resume_post` VALUES ('54', '5', '2017-05-04 13:38:29', 'A', '2017-05-04 13:38:29');
INSERT INTO `resume_post` VALUES ('65', '5', '2017-05-04 13:58:32', 'A', '2017-05-04 13:58:32');
INSERT INTO `resume_post` VALUES ('70', '5', '2017-05-04 13:59:28', 'A', '2017-05-04 13:59:28');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right
-- ----------------------------

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
INSERT INTO `user` VALUES ('1', 'sa', '202CB962AC59075B964B07152D234B70', null, '管理员', '--这人很懒，什么也没留下', '1', '1', 'A', '2017-04-09 15:40:29', '2016-01-02 15:01:42');
INSERT INTO `user` VALUES ('2', 'black', '202CB962AC59075B964B07152D234B70', null, '布莱克', '这人很懒，什么也没留下', '1', '0', 'A', '2017-04-09 15:40:31', '2016-01-15 22:53:27');
INSERT INTO `user` VALUES ('3', 'jenny', '202CB962AC59075B964B07152D234B70', null, '珍妮', '这人很懒，什么也没留下', '4', '0', 'A', '2017-04-09 15:40:34', '2016-01-24 13:17:33');
INSERT INTO `user` VALUES ('4', '20130505238', '25D55AD283AA400AF464C76D713C07AD', null, '董亮亮', '这人很懒，什么也没留下', '2', '0', 'A', '2017-04-09 15:40:38', '2016-02-05 15:09:15');
INSERT INTO `user` VALUES ('5', '20130505240', '25D55AD283AA400AF464C76D713C07AD', null, '梅朔', '这人很懒，什么也没留下', '1', '0', 'A', '2017-04-09 15:40:40', '2016-02-05 15:38:48');
INSERT INTO `user` VALUES ('6', '20130505241', '25D55AD283AA400AF464C76D713C07AD', null, '沈亚东', '这人很懒，什么也没留下', '3', '0', 'A', '2016-02-05 17:24:50', '2016-02-05 15:38:48');
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
INSERT INTO `user` VALUES ('268', '20130505239', '25D55AD283AA400AF464C76D713C07AD', null, '秦冲', '--这个人很懒，什么也没留下', '1', '0', 'A', null, '2017-04-28 14:14:03');
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
INSERT INTO `user_info` VALUES ('1', '1', '22', '2016-02-19 08:51:31', '18796221162', '1075512174@qq.com', '1075512174', '家里有小杰', '董学长', '徐州市沛县龙固镇龙东村', '4', 'A', '2016-02-19 08:52:56', null, null);
INSERT INTO `user_info` VALUES ('2', '1', '20', null, '15162044824', '3838438@190.com', '3838438', '香蕉人', '海龟大人', '南通市神鬼村', '2', 'A', '2016-02-27 20:19:13', null, null);
INSERT INTO `user_info` VALUES ('3', '1', '23', '2017-04-02 22:40:30', '18796257336', 'blackist@163.com', '1075512174', null, 'blackbool', null, '7', 'A', '2017-04-02 22:41:48', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_resume
-- ----------------------------
INSERT INTO `user_resume` VALUES ('1', '寻觅 程序员的工作', 'HEHE', 'sl5', 'Mr.Black', '1', '徐州沛县龙固', '18796221162', '我是一个牛逼的人', null, '2', 'X', '2016-02-07 23:11:49', null, null);
INSERT INTO `user_resume` VALUES ('2', '找一份程序员的工作，前端', 'IT，WEB前端，HTML', 'sl6', '梅朔', '1', '常州市北区', '15665167096', '我是一个小太阳，浑身充满正能量', null, '2', 'A', '2017-04-01 23:53:06', null, null);
INSERT INTO `user_resume` VALUES ('3', '打字员', '文职', 'sl3', '陈琦', '0', '江苏', '101010101010', '时代风格呵呵听歌是的vc发V点都不个非官方你滚蛋 巍峨方便 VV额去的V', null, '122', 'A', '2017-05-03 20:00:28', null, null);
INSERT INTO `user_resume` VALUES ('4', '动漫原型设计', '美工', 'sl5', '夏杰', '0', '徐州', '18796257336', '美女一枚', null, '125', 'A', '2017-05-03 21:49:27', null, null);
INSERT INTO `user_resume` VALUES ('5', '前端工程师', '美工', 'sl4', '梅朔', '1', '常州市北区', '15665167059', '我是一个乐观的人', null, '5', 'A', '2017-05-04 13:38:10', null, null);

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
