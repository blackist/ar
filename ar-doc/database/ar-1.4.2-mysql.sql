/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50173
Source Host           : 127.0.0.1:3306
Source Database       : ar

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-02-05 14:08:51
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
INSERT INTO `address` VALUES ('1', '江苏', '徐州', '云龙', '徐州市云徐州工程学院中心校区', '221000', '2015-12-22 00:04:40', 'a', '2015-12-22 00:04:50');

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
  `atta_parent_id` int(11) NOT NULL COMMENT '附主信息标识',
  `info_type` varchar(20) NOT NULL COMMENT '附主信息类型',
  KEY `FK_ATTACHMENT_ATTA_ATTACHMENTID` (`attachment_id`),
  CONSTRAINT `FK_ATTACHMENT_ATTA_ATTACHMENTID` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`atta_id`)
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
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`comment_id`),
  KEY `FK_COMMENT_USERID` (`user_id`),
  KEY `FK_COMMENT_INFOID` (`info_id`),
  CONSTRAINT `FK_COMMENT_INFOID` FOREIGN KEY (`info_id`) REFERENCES `information` (`info_id`),
  CONSTRAINT `FK_COMMENT_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

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
INSERT INTO `dictionary` VALUES ('g', '游戏', 'game');
INSERT INTO `dictionary` VALUES ('in', '信息类型', 'information的类型，新闻/班级动态/帖子/校友动态/捐赠信息');
INSERT INTO `dictionary` VALUES ('ind', '招聘公司所属行业', 'industry 行业, 招聘公司所属行业');
INSERT INTO `dictionary` VALUES ('it', '图片类型', '');
INSERT INTO `dictionary` VALUES ('mpi', '公告信息', 'public info(公告信息)，后台或门户网站的公告，管理员可添加公告信息，滚动播放');
INSERT INTO `dictionary` VALUES ('ny', '[是]/[否] 字段填写', '根据字典值 dictdata 显示 是/否');
INSERT INTO `dictionary` VALUES ('ot', '组织类型', '班级/校友组织  等团体的类型');
INSERT INTO `dictionary` VALUES ('p', '专业类型', 'profession, 专业类型， 校友/班级所属专业，以及个人简历上的专业名称');
INSERT INTO `dictionary` VALUES ('pro', '公司属性', 'property 公司属性, 共有/私营...');
INSERT INTO `dictionary` VALUES ('r', '角色定义', 'role definition, 定义站内各个用户的角色');
INSERT INTO `dictionary` VALUES ('s', '资源', '网站资源');
INSERT INTO `dictionary` VALUES ('sca', '公司规模', 'scale 规模, 1-49/50-99/...');
INSERT INTO `dictionary` VALUES ('sl', '薪资水平', 'salary level, 薪资水平');
INSERT INTO `dictionary` VALUES ('state', '数据表的记录的状态', null);
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片标识',
  `image_name` varchar(32) NOT NULL COMMENT '图片名称',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息标识',
  `info_title` varchar(20) NOT NULL COMMENT '信息标题',
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
  CONSTRAINT `FK_INFORMATION_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of origin
-- ----------------------------

-- ----------------------------
-- Table structure for recruit
-- ----------------------------
DROP TABLE IF EXISTS `recruit`;
CREATE TABLE `recruit` (
  `recruit_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '招聘信息标识',
  `title` varchar(20) CHARACTER SET ucs2 NOT NULL COMMENT '招聘标题',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `members` int(4) NOT NULL COMMENT '招聘人数',
  `resumes` int(4) DEFAULT NULL COMMENT '简历投递数',
  `leader_name` varchar(20) NOT NULL COMMENT '负责人姓名',
  `leader_phone` varchar(30) NOT NULL COMMENT '负责人联系方式',
  `is_top` char(1) NOT NULL COMMENT '是否置顶 1/0',
  `pos_name` varchar(20) NOT NULL COMMENT '职位名称',
  `pos_desc` varchar(200) NOT NULL COMMENT '职位描述',
  `salary` varchar(50) NOT NULL COMMENT '工资',
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
  KEY `FK_RECRUIT_USERID` (`user_id`),
  KEY `FK_RECRUIT_UNITID` (`unit_id`),
  CONSTRAINT `FK_RECRUIT_UNITID` FOREIGN KEY (`unit_id`) REFERENCES `recruit_unit` (`unit_id`),
  CONSTRAINT `FK_RECRUIT_USERID` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruit
-- ----------------------------
INSERT INTO `recruit` VALUES ('1', '诚聘打字员一名', '2016-01-30 13:14:46', '1', '3', '李先生', '18796662324', '0', '打字员', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '2000', null, '老北京德贤街', '1', '2', '2016-01-24 13:15:52', 'A', '2016-01-27 18:05:09', '', '');
INSERT INTO `recruit` VALUES ('2', '开发项目，需美工一枚', '2016-01-28 22:59:52', '1', '4', 'Mr.Black', '15162044824', '1', '美工', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '3000', null, '老北京德贤街老北京德贤街', '2', '3', '2016-01-24 23:00:05', 'A', '2016-01-26 23:43:22', '', '');
INSERT INTO `recruit` VALUES ('3', '国际贸易，急需翻译两人', '2016-01-26 23:01:31', '2', '5', '张飞', '13375167059', '1', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '2000', null, '老北京德贤街', '3', '3', '2016-01-24 23:02:19', 'A', '2016-01-24 23:02:42', '', '');
INSERT INTO `recruit` VALUES ('4', '诚聘打字员一名', '2016-01-30 13:14:46', '1', '6', '李先生', '18796662324', '0', '打字员', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '4000', null, '北京德贤街老北', '6', '3', '2016-01-24 13:15:52', 'A', '2016-01-27 18:05:09', '', '');
INSERT INTO `recruit` VALUES ('5', '诚聘打字员一名', '2016-01-30 13:14:46', '1', '6', '李先生', '18796662324', '0', '打字员', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '3000', null, '老北京德贤街', '7', '3', '2016-01-24 13:15:52', 'A', '2015-12-06 18:05:09', '', '');
INSERT INTO `recruit` VALUES ('6', '开发项目，需美工一枚', '2016-01-28 22:59:52', '1', '21', 'Mr.Black', '15162044824', '1', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '3000', null, '老北京德贤街老北京德贤街', '8', '3', '2016-01-24 23:00:05', 'X', '2016-01-26 23:43:22', '', '');
INSERT INTO `recruit` VALUES ('7', '国际贸易，急需翻译两人', '2016-01-26 23:01:31', '2', '3', '张飞', '13375167059', '1', '', 'vvv1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '4000', null, '老北京德贤街', '9', '3', '2016-01-24 23:02:19', 'X', '2016-01-24 23:02:42', '', '');
INSERT INTO `recruit` VALUES ('8', '小学生暑假辅导，数学教师', '2016-01-27 22:54:35', '1', '23', '李女士', '18790002110', '0', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '2000', null, '老北京德贤街', '10', '3', '2016-01-25 22:53:51', 'A', '2016-01-25 22:54:14', '', '');
INSERT INTO `recruit` VALUES ('9', '诚聘打字员一名', '2016-01-30 13:14:46', '1', '43', '李先生', '18796662324', '0', '打字员', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '3000', null, '北京德贤街老北', '11', '3', '2016-01-24 13:15:52', 'A', '2016-01-27 18:05:09', '', '');
INSERT INTO `recruit` VALUES ('12', '开发项目，需美工一枚', '2016-01-28 22:59:52', '1', '2', 'Mr.Black', '15162044824', '1', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '2000', null, '北京德贤街老北', '12', '3', '2016-01-24 23:00:05', 'X', '2016-01-26 23:43:22', '', '');
INSERT INTO `recruit` VALUES ('13', '国际贸易，急需翻译两人', '2016-01-26 23:01:31', '2', '4', '张飞', '13375167059', '1', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '5000', null, '老北京德贤街', '13', '3', '2016-01-24 23:02:19', 'X', '2016-01-24 23:02:42', '', '');
INSERT INTO `recruit` VALUES ('14', '小学生暑假辅导，数学教师', '2016-01-27 22:54:35', '1', '4', '李女士', '18790002110', '0', '打字员', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '4000', null, '北京德贤街老北', '14', '3', '2016-01-25 22:53:51', 'A', '2016-01-25 22:54:14', '', '');
INSERT INTO `recruit` VALUES ('15', '诚聘打字员一名', '2016-01-30 13:14:46', '1', '6', '李先生', '18796662324', '0', '打字员', 'v1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '2000', null, '老北京德贤街', '15', '3', '2016-01-24 13:15:52', 'A', '2016-01-27 18:05:09', '', '');
INSERT INTO `recruit` VALUES ('16', '开发项目，需美工一枚', '2016-01-28 22:59:52', '1', '2', 'Mr.Black', '15162044824', '1', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '3000', null, '老北京德贤街', '16', '3', '2016-01-24 23:00:05', 'X', '2016-01-26 23:43:22', '', '');
INSERT INTO `recruit` VALUES ('17', '国际贸易，急需翻译两人', '2016-01-26 23:01:31', '2', '8', '张飞', '13375167059', '1', '打字员', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '4000', null, '北京德贤街老北', '17', '3', '2016-01-24 23:02:19', 'X', '2016-01-24 23:02:42', '', '');
INSERT INTO `recruit` VALUES ('18', '诚聘打字员一名', '2016-01-30 13:14:46', '1', '5', '李先生', '18796662324', '0', '打字员', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '3000', null, '北京德贤街老北', '1', '3', '2016-01-24 13:15:52', 'A', '2016-11-07 18:05:09', '', '');
INSERT INTO `recruit` VALUES ('19', '诚聘打字员一名', '2016-01-30 13:14:46', '1', '7', '李先生', '18796662324', '0', '打字员', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '2000', null, '老北京德贤街', '2', '3', '2016-01-24 13:15:52', 'A', '2016-01-27 18:05:09', '', '');
INSERT INTO `recruit` VALUES ('20', '开发项目，需美工一枚', '2016-01-28 22:59:52', '1', '67', 'Mr.Black', '15162044824', '1', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '5000', null, '北京德贤街老北', '3', '3', '2016-01-24 23:00:05', 'X', '2016-01-26 23:43:22', '', '');
INSERT INTO `recruit` VALUES ('21', '国际贸易，急需翻译两人', '2016-01-26 23:01:31', '2', '5', '张飞', '13375167059', '1', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '3000', null, '老北京德贤街', '4', '3', '2016-01-24 23:02:19', 'A', '2016-01-24 23:02:42', '', '');
INSERT INTO `recruit` VALUES ('22', '小学生暑假辅导，数学教师', '2016-01-27 22:54:35', '1', '2', '李女士', '18790002110', '0', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '4000', null, '北京德贤街老北', '5', '3', '2016-01-25 22:53:51', 'A', '2016-01-25 22:54:14', '', '');
INSERT INTO `recruit` VALUES ('23', '诚聘打字员一名', '2016-01-30 13:14:46', '1', '1', '李先生', '18796662324', '0', '打字员', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '3000', null, '老北京德贤街', '6', '3', '2016-01-24 13:15:52', 'A', '2016-01-27 18:05:09', '', '');
INSERT INTO `recruit` VALUES ('24', '开发项目，需美工一枚', '2016-01-28 22:59:52', '1', '23', 'Mr.Black', '15162044824', '1', '美工', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '2000', null, '北京德贤街老北', '7', '3', '2016-01-24 23:00:05', 'A', '2016-01-26 23:43:22', '', '');
INSERT INTO `recruit` VALUES ('25', '国际贸易，急需翻译两人', '2016-01-26 23:01:31', '2', '23', '张飞', '13375167059', '1', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '3000', null, '北京德贤街老北', '8', '3', '2016-01-24 23:02:19', 'A', '2016-01-24 23:02:42', '', '');
INSERT INTO `recruit` VALUES ('26', '小学生暑假辅导，数学教师', '2016-01-27 22:54:35', '1', '23', '李女士', '18790002110', '0', '', '1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。级交给的其他任务。级交给的其他任务。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。1、负责办公室日常事务，收集各类工作信息、方案，并做好存档等工作。\r\n\r\n2、配合部门做好来宾接待、陪同、参观、讲解等工作。\r\n\r\n3、协助部门工作，完成上级交给的其他任务。', '4000', null, '北京德贤街老北', '9', '3', '2016-01-25 22:53:51', 'A', '2016-01-25 22:54:14', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruit_unit
-- ----------------------------
INSERT INTO `recruit_unit` VALUES ('1', '大屯煤电公司', '电力工业', '国企', '1000人', '徐州沛龙网络有限公司是一家以互动营销为主要业务的新媒体公司，现办公地在沛县，是沛县规模最大的本地互联网专业服务机构。 旗下沛龙网、沛龙网微信公众平台，沛龙腾讯微博、沛龙新浪微博都是沛县地区最具影响力的网络服务品牌，为100多万沛县人提供生活信息、消费指导、电子商务等实用服务，网站自成立以来一直以促进城市信息交流，提高社会效率为己任，同时也为品牌提供精准目标用户的互动营销和活动策划执行。 截止目前，沛龙网拥有注册用户4万。\r\n\r\n沛龙网于2015年开发了客户端及无线网站，让网友可以通过手机和平板电脑24小时随时随地访问沛龙网，活跃人群浏览网站超过6小时，相比平均覆盖用户2小时的电视和收听时间1小时的广播，具有“全天”覆盖的优势。\r\n\r\n沛县人生活中遇到的困难不平，小到问路，大到委屈不平，沛龙网友都会予以热情的解答和帮助。相信在不久的将来沛龙网会成为沛县城市主流媒体，在民生消费领域极具影响力，综合流量奖力争第一！', 'www.meidian.com', '2', 'A', '2016-01-30 11:07:21');
INSERT INTO `recruit_unit` VALUES ('2', '西树泡芙', '电力工业', '国企', '1000人', '徐州沛龙网络有限公司是一家以互动营销为主要业务的新媒体公司，现办公地在沛县，是沛县规模最大的本地互联网专业服务机构。 旗下沛龙网、沛龙网微信公众平台，沛龙腾讯微博、沛龙新浪微博都是沛县地区最具影响力的网络服务品牌，为100多万沛县人提供生活信息、消费指导、电子商务等实用服务，网站自成立以来一直以促进城市信息交流，提高社会效率为己任，同时也为品牌提供精准目标用户的互动营销和活动策划执行。 截止目前，沛龙网拥有注册用户4万。\r\n\r\n沛龙网于2015年开发了客户端及无线网站，让网友可以通过手机和平板电脑24小时随时随地访问沛龙网，活跃人群浏览网站超过6小时，相比平均覆盖用户2小时的电视和收听时间1小时的广播，具有“全天”覆盖的优势。\r\n\r\n沛县人生活中遇到的困难不平，小到问路，大到委屈不平，沛龙网友都会予以热情的解答和帮助。相信在不久的将来沛龙网会成为沛县城市主流媒体，在民生消费领域极具影响力，综合流量奖力争第一！', 'www.meidian.com', '2', 'A', '2016-01-30 11:06:39');
INSERT INTO `recruit_unit` VALUES ('3', '大屯煤电公司', '电力工业', '国企', '1000人', '徐州沛龙网络有限公司是一家以互动营销为主要业务的新媒体公司，现办公地在沛县，是沛县规模最大的本地互联网专业服务机构。 旗下沛龙网、沛龙网微信公众平台，沛龙腾讯微博、沛龙新浪微博都是沛县地区最具影响力的网络服务品牌，为100多万沛县人提供生活信息、消费指导、电子商务等实用服务，网站自成立以来一直以促进城市信息交流，提高社会效率为己任，同时也为品牌提供精准目标用户的互动营销和活动策划执行。 截止目前，沛龙网拥有注册用户4万。\r\n\r\n沛龙网于2015年开发了客户端及无线网站，让网友可以通过手机和平板电脑24小时随时随地访问沛龙网，活跃人群浏览网站超过6小时，相比平均覆盖用户2小时的电视和收听时间1小时的广播，具有“全天”覆盖的优势。\r\n\r\n沛县人生活中遇到的困难不平，小到问路，大到委屈不平，沛龙网友都会予以热情的解答和帮助。相信在不久的将来沛龙网会成为沛县城市主流媒体，在民生消费领域极具影响力，综合流量奖力争第一！', 'www.meidian.com', '3', 'A', '2016-01-30 11:07:12');
INSERT INTO `recruit_unit` VALUES ('4', '大屯煤电公司', '电力工业', '国企', '1000人', '徐州沛龙网络有限公司是一家以互动营销为主要业务的新媒体公司，现办公地在沛县，是沛县规模最大的本地互联网专业服务机构。 旗下沛龙网、沛龙网微信公众平台，沛龙腾讯微博、沛龙新浪微博都是沛县地区最具影响力的网络服务品牌，为100多万沛县人提供生活信息、消费指导、电子商务等实用服务，网站自成立以来一直以促进城市信息交流，提高社会效率为己任，同时也为品牌提供精准目标用户的互动营销和活动策划执行。 截止目前，沛龙网拥有注册用户4万。\r\n\r\n沛龙网于2015年开发了客户端及无线网站，让网友可以通过手机和平板电脑24小时随时随地访问沛龙网，活跃人群浏览网站超过6小时，相比平均覆盖用户2小时的电视和收听时间1小时的广播，具有“全天”覆盖的优势。\r\n\r\n沛县人生活中遇到的困难不平，小到问路，大到委屈不平，沛龙网友都会予以热情的解答和帮助。相信在不久的将来沛龙网会成为沛县城市主流媒体，在民生消费领域极具影响力，综合流量奖力争第一！', 'www.meidian.com', '3', 'A', '2016-01-30 11:06:39');
INSERT INTO `recruit_unit` VALUES ('5', '大屯煤电公司', '电力工业', '国企', '1000人', '本公司属于电力行业，对员工提供良好的工作岗位，工作环境，', 'www.meidian.com', '3', 'A', '2016-01-30 11:07:21');
INSERT INTO `recruit_unit` VALUES ('6', '大屯煤电公司', '电力工业', '国企', '1000人', '本公司属于电力行业，对员工提供良好的工作岗位，工作环境，', 'www.meidian.com', '3', 'A', '2016-01-30 11:06:39');
INSERT INTO `recruit_unit` VALUES ('7', '大屯煤电公司', '电力工业', '国企', '1000人', '本公司属于电力行业，对员工提供良好的工作岗位，工作环境，', 'www.meidian.com', '3', 'A', '2016-01-30 11:07:12');
INSERT INTO `recruit_unit` VALUES ('8', '大屯煤电公司', '电力工业', '国企', '1000人', '本公司属于电力行业，对员工提供良好的工作岗位，工作环境，', 'www.meidian.com', '3', 'A', '2016-01-30 11:06:39');
INSERT INTO `recruit_unit` VALUES ('9', '大屯煤电公司', '电力工业', '国企', '1000人', '本公司属于电力行业，对员工提供良好的工作岗位，工作环境，', 'www.meidian.com', '3', 'A', '2016-01-30 11:07:12');
INSERT INTO `recruit_unit` VALUES ('10', '大屯煤电公司', '电力工业', '国企', '1000人', '本公司属于电力行业，对员工提供良好的工作岗位，工作环境，', 'www.meidian.com', '3', 'A', '2016-01-30 11:06:39');
INSERT INTO `recruit_unit` VALUES ('11', '大屯煤电公司', '电力工业', '国企', '1000人', '本公司属于电力行业，对员工提供良好的工作岗位，工作环境，', 'www.meidian.com', '3', 'A', '2016-01-30 11:07:21');
INSERT INTO `recruit_unit` VALUES ('12', '大屯煤电公司', '电力工业', '国企', '1000人', '本公司属于电力行业，对员工提供良好的工作岗位，工作环境，', 'www.meidian.com', '3', 'A', '2016-01-30 11:06:39');
INSERT INTO `recruit_unit` VALUES ('13', '大屯煤电公司', '电力工业', '国企', '1000人', '本公司属于电力行业，对员工提供良好的工作岗位，工作环境，', 'www.meidian.com', '3', 'A', '2016-01-30 11:07:12');
INSERT INTO `recruit_unit` VALUES ('14', '大屯煤电公司', '电力工业', '国企', '1000人', '本公司属于电力行业，对员工提供良好的工作岗位，工作环境，', 'www.meidian.com', '3', 'A', '2016-01-30 11:06:39');
INSERT INTO `recruit_unit` VALUES ('15', '哈哈电力', 'ggsc', null, null, null, null, '2', 'A', null);
INSERT INTO `recruit_unit` VALUES ('16', '哈哈电力', 'ggsc', null, null, null, null, '3', 'A', null);
INSERT INTO `recruit_unit` VALUES ('17', '哈哈电力', 'ggsc', null, null, null, null, '3', 'A', null);
INSERT INTO `recruit_unit` VALUES ('25', 'ASFQWR', 'hlwjsj', 'sy', 's1', 'å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼\r\nå¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼', '', '2', 'A', '2016-02-05 13:59:47');
INSERT INTO `recruit_unit` VALUES ('26', 'ASFQWR', 'hlwjsj', 'sy', 's1', 'å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼\r\nå¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼å¸åä½ å¤©ç­æçé£æ ¼', '', '2', 'A', '2016-02-05 14:00:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right
-- ----------------------------
INSERT INTO `right` VALUES ('90', '删除字典项', '0', '1', '/dict/deleteDict', '0', 'A', '2016-01-14 00:04:14');
INSERT INTO `right` VALUES ('91', '更新字典', '0', '2', '/dict/updateDict', '0', 'A', '2016-01-14 00:04:14');
INSERT INTO `right` VALUES ('92', '获取所有字典项', '0', '4', '/dict/getAllDicts', '0', 'A', '2016-01-14 00:04:14');
INSERT INTO `right` VALUES ('93', '查询字典项_', '0', '8', '/dict/queryDicts', '1', 'A', '2016-01-14 00:04:14');
INSERT INTO `right` VALUES ('94', '添加字典', '0', '16', '/dict/addDict', '0', 'A', '2016-01-14 00:04:14');
INSERT INTO `right` VALUES ('95', '未命名', '0', '32', '/dict/indexDict', '1', 'A', '2016-01-14 00:04:14');
INSERT INTO `right` VALUES ('96', '字典管理', '0', '64', '/dict/updateDictSubmit', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('97', '字典管理', '0', '128', '/dict/addDictSubmit', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('98', '字典数据管理', '0', '256', '/dictData/addDictData', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('99', '字典数据', '0', '512', '/dictData/queryDictData', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('100', '未命名', '0', '1024', '/dictData/indexDictData', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('101', '未命名', '0', '2048', '/dictData/addDictDataSubmit', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('102', '未命名', '0', '4096', '/login/logout', '1', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('103', '未命名', '0', '8192', '/login', '1', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('104', '未命名', '0', '16384', '/login/loginValidate', '1', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('105', '未命名', '0', '32768', '/indexManage', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('106', '未命名', '0', '65536', '/error/{errCode}', '1', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('107', '未命名', '0', '131072', '/welcomeManage', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('108', '未命名', '0', '262144', '/right/indexRight', '1', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('109', '未命名', '0', '524288', '/right/updateRight', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('110', '未命名', '0', '1048576', '/right/queryRights', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('111', '未命名', '0', '2097152', '/right/addRight', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('112', '扫描添加权限', '0', '4194304', '/right/scanAddRights', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('113', '更新权限', '0', '8388608', '/right/updateRightSubmit', '0', 'A', '2016-01-14 00:04:15');
INSERT INTO `right` VALUES ('114', '未命名', '0', '16777216', '//index', '1', 'A', '2016-01-14 19:41:00');
INSERT INTO `right` VALUES ('115', '未命名', '0', '33554432', '/index', '1', 'A', '2016-01-14 19:44:34');
INSERT INTO `right` VALUES ('116', '未命名', '0', '67108864', '/', '1', 'A', '2016-01-14 19:48:04');
INSERT INTO `right` VALUES ('117', '未命名', '0', '134217728', '/login/login', '1', 'A', '2016-01-15 23:02:02');
INSERT INTO `right` VALUES ('118', '未命名', '0', '268435456', '/login/manage', '1', 'A', '2016-01-15 23:53:19');
INSERT INTO `right` VALUES ('119', '前台招聘索引界面', '0', '536870912', '/recruit', '1', 'A', '2016-01-17 14:21:37');
INSERT INTO `right` VALUES ('120', '未命名', '0', '1073741824', '/message/contactUs', '1', 'A', '2016-01-17 15:11:28');
INSERT INTO `right` VALUES ('121', '招聘查询', '0', '2147483648', '/recruit/queryRecruits', '1', 'A', '2016-01-18 20:06:04');
INSERT INTO `right` VALUES ('122', '未命名', '0', '4294967296', '/my/profile', '0', 'A', '2016-01-30 14:58:05');
INSERT INTO `right` VALUES ('123', '未命名', '0', '8589934592', '/my', '0', 'A', '2016-01-30 14:58:05');
INSERT INTO `right` VALUES ('124', '未命名', '0', '17179869184', '/recruit/detailRecruit', '1', 'A', '2016-01-30 14:58:06');

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
  `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分享标识',
  `create_time` datetime NOT NULL COMMENT '分享时间',
  `user_id` int(8) NOT NULL COMMENT '分享者标识',
  `info_id` int(11) NOT NULL COMMENT '信息标识',
  PRIMARY KEY (`share_id`),
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
  `head_image_id` int(8) DEFAULT NULL COMMENT '头像图片标识',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'sa', '202CB962AC59075B964B07152D234B70', '1', null, '2016-01-02 15:01:42', 'A', null);
INSERT INTO `user` VALUES ('2', 'black', '202CB962AC59075B964B07152D234B70', '0', null, '2016-01-15 22:53:27', 'A', null);
INSERT INTO `user` VALUES ('3', 'jenny', '202CB962AC59075B964B07152D234B70', '0', null, '2016-01-24 13:17:33', 'A', null);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_info_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户信息标识',
  `true_name` varchar(10) DEFAULT NULL COMMENT '用户姓名',
  `age` char(3) DEFAULT NULL COMMENT '年龄',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `introduce` varchar(200) DEFAULT NULL COMMENT '自我介绍',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq',
  `microblog` varchar(20) DEFAULT NULL COMMENT '微博',
  `address` varchar(50) DEFAULT NULL COMMENT '住址',
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态日期',
  `exp1` varchar(100) DEFAULT NULL COMMENT '扩展字段1',
  `exp2` varchar(100) DEFAULT NULL COMMENT '扩展字段2',
  PRIMARY KEY (`user_info_id`),
  KEY `FK_USER_USERINFO` (`user_id`),
  CONSTRAINT `FK_USER_USERINFO` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------

-- ----------------------------
-- Table structure for user_job
-- ----------------------------
DROP TABLE IF EXISTS `user_job`;
CREATE TABLE `user_job` (
  `job_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户工作标识',
  `job_name` varchar(30) NOT NULL COMMENT '工作名称',
  `job_unit` varchar(30) NOT NULL COMMENT '工作单位',
  `job_date` date NOT NULL COMMENT '工作开始时间',
  `salary` varchar(10) DEFAULT NULL COMMENT '工资',
  `benefit` varchar(50) DEFAULT NULL COMMENT '福利',
  `job_desc` varchar(200) DEFAULT NULL COMMENT '工作描述',
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
-- Table structure for user_resume
-- ----------------------------
DROP TABLE IF EXISTS `user_resume`;
CREATE TABLE `user_resume` (
  `resume_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户简历标识',
  `resume_titile` varchar(20) NOT NULL COMMENT '简历标题，更容易让别人看到',
  `prof_type` varchar(20) NOT NULL COMMENT '职业类型',
  `exp_salary` varchar(10) NOT NULL COMMENT '期望工资',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `sex` char(1) NOT NULL COMMENT '性别',
  `domicile` varchar(50) NOT NULL COMMENT '现在居住地',
  `contact` varchar(20) NOT NULL COMMENT '联系方式',
  `introduce` varchar(200) DEFAULT NULL COMMENT '个人简介',
  `image_id` int(11) DEFAULT NULL COMMENT '证件照',
  `user_id` int(8) NOT NULL COMMENT '用户标识',
  `state` char(2) NOT NULL COMMENT '状态',
  `state_time` datetime DEFAULT NULL COMMENT '状态时间',
  `exp1` varchar(100) DEFAULT NULL COMMENT '备用字段',
  `exp2` varchar(100) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`resume_id`),
  KEY `FK_USER_RESUME` (`user_id`),
  CONSTRAINT `FK_USER_RESUME` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_resume
-- ----------------------------

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
