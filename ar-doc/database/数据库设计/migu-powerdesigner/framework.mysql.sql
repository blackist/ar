/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/8/18 10:33:52                           */
/*==============================================================*/


/*==============================================================*/
/* Table: ACCOUNT                                               */
/*==============================================================*/
create table ACCOUNT
(
   ACCOUNT_ID           integer(8) not null auto_increment comment '账号标识',
   ACCOUNT_VALUE        varchar(120) not null comment '账号值',
   ACCOUNT_TYPE         varchar(2) not null comment '账号类型',
   OPERATOR_ID          integer(8) not null comment '操作员标识',
   CREATE_TIME          datetime not null comment '创建时间',
   STATE                char(1) not null comment '状态',
   STATE_TIME           datetime not null comment '状态更新时间',
   EXT1                 varchar(120) comment '扩展属性1',
   EXT2                 varchar(120) comment '扩展属性2',
   primary key (ACCOUNT_ID)
);

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN
(
   ADMIN_ID             integer(6) not null auto_increment comment '管理员标识',
   ADMIN_NAME           varchar(60) not null comment '管理员名称',
   HEAD_IMG             bigint(10),
   GENER                char(1),
   CREATED_TIME         datetime not null comment '创建日期',
   STATE                char(1) not null comment '状态',
   STATE_DATE           datetime not null comment '状态日期',
   EMAIL                varchar(120) comment '电子邮件',
   PHONE                varchar(20) comment '电话',
   OPERATOR_ID          integer(8) comment '操作员标识',
   ADDRESS              varchar(255) comment '地址',
   primary key (ADMIN_ID)
);

/*==============================================================*/
/* Table: ADMIN_ATTR                                            */
/*==============================================================*/
create table ADMIN_ATTR
(
   ADMIN_ID             integer(8) not null comment '管理员标识',
   ATTR_ID              integer(4) not null comment '属性标识',
   VALUE                varchar(120) comment '属性值',
   CREATE_TIME          datetime not null comment '创建时间',
   primary key (ADMIN_ID, ATTR_ID)
);

/*==============================================================*/
/* Table: ADMIN_ATTR_HISTORY                                    */
/*==============================================================*/
create table ADMIN_ATTR_HISTORY
(
   ADMIN_ID             integer(8) not null comment '管理员标识',
   ATTR_ID              integer(4) not null comment '属性标识',
   SEQ                  integer(4) not null comment '序列',
   VALUE                varchar(120) comment '属性值',
   CREATE_TIME          datetime not null comment '创建时间',
   UPDATE_TIME          datetime not null comment '修改时间',
   UPDATE_OPRATOR_ID    integer(8) comment '修改人标识',
   primary key (ADMIN_ID, ATTR_ID, SEQ)
);

/*==============================================================*/
/* Table: ADMIN_HISTORY                                         */
/*==============================================================*/
create table ADMIN_HISTORY
(
   ADMIN_ID             integer(6) not null comment '管理员标识',
   SEQ                  integer(4) not null comment '序列',
   ADMIN_NAME           varchar(60) not null comment '管理员名称',
   CREATED_TIME         datetime not null comment '创建日期',
   STATE                char(1) not null comment '状态',
   STATE_DATE           datetime not null comment '状态日期',
   EMAIL                varchar(120) comment '电子邮件',
   PHONE                varchar(20) comment '电话',
   ADDRESS              varchar(255) comment '地址',
   UPDATE_TIME          datetime not null comment '修改时间',
   UPDATE_OPERATOR_ID   integer(8) comment '修改人标识',
   primary key (ADMIN_ID, SEQ)
);

/*==============================================================*/
/* Table: AREA                                                  */
/*==============================================================*/
create table AREA
(
   AREA_ID              bigint(10) not null auto_increment comment '区域标识',
   PARENT_AREA_ID       bigint(10) comment '父区域标识',
   AREA_TYPE            char(1) not null comment '区域类型',
   AREA_NAME            varchar(20) not null comment '区域名称',
   AREA_CODE            varchar(10) comment '区域编码',
   REMARK               varchar(120) comment '备注',
   primary key (AREA_ID)
);

/*==============================================================*/
/* Table: AREA_RANGE                                            */
/*==============================================================*/
create table AREA_RANGE
(
   AREA_ID              bigint(10) not null comment '区域标识',
   SEQ                  int(6) not null comment '序列',
   LONGITUDE            varchar(20) not null comment '经度',
   LATITUDE             varchar(20) not null comment '纬度',
   primary key (AREA_ID, SEQ)
);

/*==============================================================*/
/* Table: ATTACHMENTS                                           */
/*==============================================================*/
create table ATTACHMENTS
(
   ATTACHMENTS_ID       integer(6) not null auto_increment comment '附件标识',
   ATTACHMENTS_TYPE     varchar(20) not null comment '附件类型',
   ATTACHMENTS_NAME     varchar(60) not null comment '附件文件名',
   IS_REMOTE            char(1) not null comment '是否为远程文件',
   FILE_SIZE            bigint(10) comment '文件大小',
   FILE_PATH            varchar(255) not null comment '文件路径',
   DOWNLOADS_NUM        integer(8) not null comment '下载次数',
   IS_PICTURE           char(1) not null comment '是否是图片',
   IS_THUMB             char(1) not null comment '是否生成缩略图',
   THUMB_PATH           varchar(255) comment '缩略图地址',
   CREATE_TIME          datetime not null comment '创建时间',
   EXP_TIME             datetime comment '失效时间',
   primary key (ATTACHMENTS_ID)
);

/*==============================================================*/
/* Table: ATTR                                                  */
/*==============================================================*/
create table ATTR
(
   ATTR_ID              integer(6) not null auto_increment comment '属性标识',
   ATTR_NAME            varchar(60) not null comment '名称',
   ATTR_TYPE            char(1) not null comment '属性类型',
   PARENT_ATTR_ID       integer(4) comment '父属性标识',
   ATTR_CODE            varchar(120) not null comment '属性代码',
   VISIBLE              char(1) not null comment '是否可见',
   INSTANTIATABLE       char(1) not null comment '是否可实例化',
   DEFAULT_VALUE        varchar(120) comment '缺省值',
   INPUT_TYPE           char(1) not null comment '输入方式',
   DATA_TYPE            char(1) not null comment '数据类型',
   VALUE_SCRIPT         varchar(2000) comment '取值校验规则',
   primary key (ATTR_ID)
);

/*==============================================================*/
/* Table: ATTR_VALUE                                            */
/*==============================================================*/
create table ATTR_VALUE
(
   ATTR_ID              integer(6) not null auto_increment comment '属性标识',
   ATTR_VALUE_ID        integer(6) not null comment '属性值标识',
   VALUE_MARK           varchar(60) not null comment '取值说明',
   VALUE                varchar(120) comment '取值',
   LINK_ATTR_ID         integer(6) comment '联动属性标识',
   primary key (ATTR_ID, ATTR_VALUE_ID)
);

/*==============================================================*/
/* Table: CHANGE_NOTIF_REDIS                                    */
/*==============================================================*/
create table CHANGE_NOTIF_REDIS
(
   change_notif_id      bigint(12) not null auto_increment comment '主键',
   table_name           varchar(60) not null comment '更新记录表名称',
   key_value            varchar(60) not null comment '更新记录主键',
   created_date         datetime not null comment '创建时间',
   action_type          char(1) comment '操作类型',
   primary key (change_notif_id)
);

/*==============================================================*/
/* Table: CONFIG_ITEM                                           */
/*==============================================================*/
create table CONFIG_ITEM
(
   CONFIG_ITEM_ID       integer(6) not null auto_increment comment '配置项标识',
   MODULE_CODE          varchar(10) not null comment '模块代码',
   DIRECTORY_CODE       varchar(20) not null comment '目录代码',
   CONFIG_ITEM_CODE     varchar(120) not null comment '配置项代码',
   CONFIG_ITEM_NAME     varchar(120) not null comment '配置项名称',
   IS_VISIABLE          char(1) not null comment '是否可见',
   UPDATE_TIME          datetime comment '更新时间',
   REMARK               varchar(255) comment '备注',
   primary key (CONFIG_ITEM_ID)
);

/*==============================================================*/
/* Table: CONFIG_ITEM_HISTORY                                   */
/*==============================================================*/
create table CONFIG_ITEM_HISTORY
(
   CONFIG_ITEM_ID       integer(6) not null comment '配置项标识',
   SEQ                  integer(4) not null comment '序列号',
   MODULE_CODE          varchar(10) not null comment '模块代码',
   DIRECTORY_CODE       varchar(10) not null comment '目录代码',
   CONFIG_ITEM_CODE     varchar(120) not null comment '配置项代码',
   CONFIG_ITEM_NAME     varchar(120) not null comment '配置项名称',
   IS_VISIABLE          char(1) not null comment '是否可见',
   UPDATE_TIME          datetime not null comment '更新时间',
   REMARK               varchar(255) comment '备注',
   OPERATOR_ID          integer(8) comment '操作员标识',
   CHANNEL_ID           smallint(2) comment '渠道标识',
   primary key (CONFIG_ITEM_ID, SEQ)
);

/*==============================================================*/
/* Table: CONFIG_ITEM_PARAM                                     */
/*==============================================================*/
create table CONFIG_ITEM_PARAM
(
   CONFIG_ITEM_ID       integer(6) not null comment '配置项标识',
   PARAM_CODE           varchar(120) not null comment '参数编码',
   PARAM_NAME           varchar(120) not null comment '参数名称',
   PARAM_VALUE          varchar(1000) comment '参数取值',
   DEFAULT_PARAM_VALUE  varchar(1000) comment '缺省值',
   DATA_TYPE            char(1) not null comment '数据类型',
   INPUT_TYPE           char(1) not null comment '输入方式',
   VALUE_SCRIPT         varchar(2000) comment '取值校验规则',
   UPDATE_TIME          datetime not null comment '更新时间',
   REMARK               varchar(255) comment '备注',
   primary key (CONFIG_ITEM_ID, PARAM_CODE)
);

/*==============================================================*/
/* Table: CONFIG_ITEM_PARAM_HISTORY                             */
/*==============================================================*/
create table CONFIG_ITEM_PARAM_HISTORY
(
   CONFIG_ITEM_ID       integer(6) not null comment '配置项标识',
   PARAM_CODE           varchar(120) not null comment '参数编码',
   SEQ                  integer(4) not null comment '序列号',
   PARAM_NAME           varchar(120) not null comment '参数名称',
   PARAM_VALUE          varchar(1000) comment '参数取值',
   DEFAULT_PARAM_VALUE  varchar(1000) comment '缺省值',
   DATA_TYPE            char(1) comment '数据类型',
   INPUT_TYPE           char(1) comment '输入方式',
   VALUE_SCRIPT         varchar(2000) comment '取值校验规则',
   UPDATE_TIME          datetime not null comment '更新时间',
   REMARK               varchar(255) comment '备注',
   OPERATOR_ID          integer(8) comment '操作员标识',
   CHANNEL_ID           smallint(2) comment '渠道标识',
   primary key (CONFIG_ITEM_ID, PARAM_CODE, SEQ)
);

/*==============================================================*/
/* Table: CONFIG_ITEM_PARAM_VALUE                               */
/*==============================================================*/
create table CONFIG_ITEM_PARAM_VALUE
(
   CONFIG_ITEM_ID       numeric(6,0) not null comment '配置项标识',
   PARAM_CODE           varchar(120) not null comment '参数编码',
   PARAM_VALUE_ID       numeric(4,0) not null comment '参数取值标识',
   VALUE_MARK           varchar(20) not null comment '取值说明',
   VALUE                varchar(60) comment '取值',
   REMARK               varchar(255) comment '备注',
   primary key (CONFIG_ITEM_ID, PARAM_CODE, PARAM_VALUE_ID)
);

/*==============================================================*/
/* Table: CONTACT_CHANNEL                                       */
/*==============================================================*/
create table CONTACT_CHANNEL
(
   CONTACT_CHANNEL_ID   smallint(2) not null comment '接触渠道',
   CHANNEL_TYPE         char(2) not null comment '渠道类型',
   CONTACT_CHANNEL_NAME varchar(20) not null comment '名称',
   REMARK               varchar(120) comment '说明',
   primary key (CONTACT_CHANNEL_ID)
);

/*==============================================================*/
/* Table: CRON_TRIGGER                                          */
/*==============================================================*/
create table CRON_TRIGGER
(
   TRIGGER_ID           integer(8) not null auto_increment comment '触发器标识',
   TRIGGER_NAME         varchar(60) not null comment '触发器名称',
   CRON_EXPRESSION      varchar(120) not null comment 'CRON表达式',
   CREATE_TIME          datetime not null comment '创建时间',
   OPERATOR_ID          integer(8) comment '创建人标识',
   primary key (TRIGGER_ID)
);

/*==============================================================*/
/* Table: CRON_TRIGGER_HISTORY                                  */
/*==============================================================*/
create table CRON_TRIGGER_HISTORY
(
   TRIGGER_ID           integer(8) not null comment '触发器标识',
   SEQ                  integer(4) not null comment '序列号',
   TRIGGER_NAME         varchar(60) not null comment '触发器名称',
   CRON_EXPRESSION      varchar(120) not null comment 'CRON表达式',
   CREATE_TIME          datetime not null comment '创建时间',
   OPERATOR_ID          integer(8) comment '创建人标识',
   UPDATE_TIME          datetime not null comment '修改时间',
   UPDATE_OPERATOR_ID   integer(8) comment '修改人标识',
   primary key (TRIGGER_ID, SEQ)
);

/*==============================================================*/
/* Table: DICTIONARY                                            */
/*==============================================================*/
create table DICTIONARY
(
   DICT_CODE            varchar(60) not null comment '字典代码',
   DICT_NAME            varchar(60) not null comment '字典名称',
   REMARK               varchar(120) comment '备注',
   primary key (DICT_CODE)
);

alter table DICTIONARY comment '数据字典表';

INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('CHANNEL_TYPE', '渠道类型', '渠道类型');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('AREA_TYPE', '区域类型', '区域类型');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('DATA_TYPE', '数据类型', '数据类型');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('INPUT_TYPE', '输入方式', '输入方式');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('ATTR_TYPE', '属性类型', '属性类型');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('TASK_STATE', '任务状态', '任务状态');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('TRIGGER_TYPE', '触发器类型', '触发器类型');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('MESSAGE_TYPE', '消息类型', '消息类型');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('OPERATOR_TYPE', '操作员类型', '操作员类型');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('ACCOUNT_TYPE', '账号类型', '账号类型');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('RESOURCE_TYPE', '资源类型', '资源类型');
INSERT INTO DICTIONARY (DICT_CODE, DICT_NAME, REMARK) VALUES ('EVENT_TYPE', '事件类型', '事件类型');





/*==============================================================*/
/* Table: DICTIONARY_DATA                                       */
/*==============================================================*/
create table DICTIONARY_DATA
(
   DICT_DATA_ID         integer(6) not null comment '字典数据表标识',
   DICT_CODE            varchar(60) not null comment '字典代码',
   DICT_DATA_NAME       varchar(60) not null comment '字典数据名',
   DICT_DATA_VALUE      varchar(8) not null comment '字典数据值',
   IS_FIXED             char(1) not null comment '是否固定',
   IS_CANCEL            char(1) comment '是否可以删除',
   primary key (DICT_DATA_ID)
);

alter table DICTIONARY_DATA comment '字典数据表';

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (1, 'CHANNEL_TYPE', 'Http消息', '01', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (2, 'CHANNEL_TYPE', 'WebSocket消息', '02', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (3, 'CHANNEL_TYPE', '短信信息', '03', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (4, 'CHANNEL_TYPE', '邮件', '04', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (5, 'CHANNEL_TYPE', 'dubbo协议', '05', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (6, 'CHANNEL_TYPE', 'WebService', '06', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (7, 'CHANNEL_TYPE', '站内消息', '07', 'N', 'N');

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (8, 'AREA_TYPE', '国家', 'A', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (9, 'AREA_TYPE', '省、直辖市', 'P', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (10, 'AREA_TYPE', '市', 'C', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (11, 'AREA_TYPE', '区,县', 'D', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (12, 'AREA_TYPE', '社区', 'O', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (13, 'AREA_TYPE', '小区', 'G', 'N', 'N');

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (14, 'DATA_TYPE', '字符Character', 'C', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (15, 'DATA_TYPE', '整数Number', 'N', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (16, 'DATA_TYPE', '密码Password', 'P', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (17, 'DATA_TYPE', '浮点数Float', 'F', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (18, 'DATA_TYPE', '对象类型', 'O', 'N', 'N');

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (19, 'INPUT_TYPE', '不可编辑', '1', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (20, 'INPUT_TYPE', '单选', '2', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (21, 'INPUT_TYPE', '多选', '3', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (22, 'INPUT_TYPE', '时间选择框', '4', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (23, 'INPUT_TYPE', '对象类型', '5', 'N', 'N');

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (24, 'ATTR_TYPE', '管理员属性', 'A', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (25, 'ATTR_TYPE', '会员属性', 'M', 'N', 'N');

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (26, 'TASK_STATE', '初始状态', 'I', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (27, 'TASK_STATE', '等待状态', 'W', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (28, 'TASK_STATE', '暂停状态', 'P', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (29, 'TASK_STATE', '正常执行', 'A', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (30, 'TASK_STATE', '阻塞状态', 'B', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (31, 'TASK_STATE', '错误状态', 'E', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (32, 'TASK_STATE', '完成状态', 'C', 'N', 'N');

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (33, 'TRIGGER_TYPE', '简单触发器类型', '1', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (34, 'TRIGGER_TYPE', '简单触发器类型', '2', 'N', 'N');

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (35, 'MESSAGE_TYPE', '文本消息', 'T', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (36, 'MESSAGE_TYPE', '图片消息', 'P', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (37, 'MESSAGE_TYPE', '语音消息', 'V', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (38, 'MESSAGE_TYPE', '多媒体消息', 'M', 'N', 'N');

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (39, 'OPERATOR_TYPE', '管理员', 'A', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (40, 'OPERATOR_TYPE', '会员', 'M', 'N', 'N');

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (41, 'ACCOUNT_TYPE', '平台账号', 'P', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (42, 'ACCOUNT_TYPE', '统一平台账号', 'U', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (43, 'ACCOUNT_TYPE', '统一平台邮箱账号', 'UE', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (44, 'ACCOUNT_TYPE', '统一平台手机账号', 'UM', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (45, 'ACCOUNT_TYPE', '腾讯QQ账号', 'TQ', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (46, 'ACCOUNT_TYPE', '腾讯微信账号', 'TW', 'N', 'N');

INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (47, 'EVENT_TYPE', '操作事件', 'O', 'N', 'N');
INSERT INTO DICTIONARY_DATA (DICT_DATA_ID, DICT_CODE, DICT_DATA_NAME, DICT_DATA_VALUE, IS_FIXED, IS_CANCEL) VALUES (48, 'EVENT_TYPE', '积分事件', 'I', 'N', 'N');

/*==============================================================*/
/* Table: DIRECTORY                                             */
/*==============================================================*/
create table DIRECTORY
(
   DIRECTORY_CODE       varchar(20) not null comment '目录代码',
   DIRECTORY_NAME       varchar(20) not null comment '目录名称',
   PARENT_DIRECTORY_CODE varchar(20) comment '父目录代码',
   REMARK               varchar(64) comment '说明',
   primary key (DIRECTORY_CODE)
);

/*==============================================================*/
/* Table: EVENT                                                 */
/*==============================================================*/
create table EVENT
(
   EVENT_ID             integer(4) not null comment '事件标识',
   EVENT_TYPE           char(1) not null comment '事件类型',
   PARAMS_NAME          varchar(120) comment '参数名',
   EVENT_NAME           varchar(20) not null comment '事件名称',
   REMARK               varchar(120) comment '备注',
   primary key (EVENT_ID)
);

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU
(
   RESOURCE_ID          integer(6) not null auto_increment comment '菜单标识',
   PARENT_RESOURCE_ID   integer(4) comment '父菜单标识',
   SEQ                  integer(4) not null comment '序列',
   MENU_NAME            varchar(20) not null comment '菜单名称',
   URL                  varchar(120) not null comment '访问地址',
   IS_LEAF              char(1) not null comment '是否为叶节点',
   ICON_URL             varchar(120) comment '图标URL',
   primary key (RESOURCE_ID)
);

/*==============================================================*/
/* Table: MENU_URL_RESOURCE                                     */
/*==============================================================*/
create table MENU_URL_RESOURCE
(
   RESOURCE_ID          integer(6) not null comment '菜单标识',
   URL_RESOURCE_ID      integer(6) not null comment 'URL_资源标识',
   ALLOW_SHOW           char(1) not null,
   IS_SELECT            char(1) not null,
   primary key (RESOURCE_ID, URL_RESOURCE_ID)
);

alter table MENU_URL_RESOURCE comment '菜单关联哪些权限';

/*==============================================================*/
/* Table: MESSAGE_ATTACHMENTS                                   */
/*==============================================================*/
create table MESSAGE_ATTACHMENTS
(
   ATTACHMENTS_ID       bigint(10) not null comment '附件标识',
   MESSAGE_ID           bigint(10) not null comment '消息标识',
   primary key (ATTACHMENTS_ID, MESSAGE_ID)
);

/*==============================================================*/
/* Table: MESSAGE_BOX                                           */
/*==============================================================*/
create table MESSAGE_BOX
(
   MESSAGE_ID           integer(6) not null auto_increment comment '消息标识',
   RECEIVERS            text not null comment '收件人',
   SENDER               varchar(120) comment '发件人',
   MESSAGE_TEMPLATE_ID  integer(4) not null comment '消息模板标识',
   SUBJECT              varchar(120) comment '标题',
   CONTENT              text comment '内容',
   ATTACHMENTS_NUM      smallint(3) not null comment '附件数量',
   CREATE_TIME          datetime not null comment '创建时间',
   SEND_TIME            datetime comment '最后一次发送时间',
   NEXT_SEND_TIME       datetime comment '下一次发送时间',
   SEND_TIMES           integer(4) not null comment '发送次数',
   EXTEND_ATTRS         text comment '扩展参数',
   primary key (MESSAGE_ID)
);

/*==============================================================*/
/* Table: MESSAGE_HISTORY                                       */
/*==============================================================*/
create table MESSAGE_HISTORY
(
   MESSAGE_ID           bigint(10) not null auto_increment comment '消息标识',
   RECEIVERS            text not null comment '收件人',
   SENDER               varchar(120) comment '发件人',
   MESSAGE_TYPE         char(1) not null comment '消息类型',
   MESSAGE_TEMPLATE_ID  integer(4) not null comment '消息模板标识',
   SUBJECT              varchar(120) comment '标题',
   CONTENT              text comment '内容',
   ATTACHMENTS_NUM      integer(4) not null comment '附件数量',
   CREATE_TIME          datetime not null comment '创建时间',
   SEND_TIME            datetime comment '最后一次发送时间',
   SEND_TIMES           integer(4) not null comment '发送次数',
   RESULT               varchar(255) not null comment '发送结果',
   EXP_DATE             datetime comment '失效时间',
   EXTEND_ATTRS         text comment '扩展参数',
   primary key (MESSAGE_ID)
);

/*==============================================================*/
/* Table: MESSAGE_TEMPLATE                                      */
/*==============================================================*/
create table MESSAGE_TEMPLATE
(
   MESSAGE_TEMPLATE_ID  integer(6) not null auto_increment comment '消息模板标识',
   MESSAGE_TEMPLATE_CODE varchar(20) not null comment '消息模板代码',
   DIRECTORY_CODE       varchar(20) not null comment '目录代码',
   NAME                 varchar(120) not null comment '名称',
   TEMPLATE             text comment '模板',
   STATE                char(1) not null comment '状态',
   CONTACT_CHANNEL_IDS  varchar(8) comment '接触渠到',
   STATE_TIME           datetime not null comment '状态时间',
   DELAY                integer(6) not null comment '延迟时间(秒)',
   RESEND_TIMES         integer(4) not null comment '失败重发次数',
   SAVE_HISTORY         char(1) not null comment '是否保留历史记录',
   SAVE_DAY             integer(4) not null comment '保留天数',
   CREATE_TIME          datetime comment '创建时间',
   primary key (MESSAGE_TEMPLATE_ID)
);

/*==============================================================*/
/* Table: MODULE                                                */
/*==============================================================*/
create table MODULE
(
   MODULE_CODE          varchar(10) not null comment '业务模块代码',
   PARENT_MODULE_CODE   varchar(10) comment '父业务模块编码',
   MODULE_NAME          varchar(20) not null comment '业务模块名称',
   primary key (MODULE_CODE)
);

INSERT INTO MODULE (MODULE_CODE,PARENT_MODULE_CODE,MODULE_NAME) VALUES ('COMMON',NULL,'公共模块');
INSERT INTO MODULE (MODULE_CODE,PARENT_MODULE_CODE,MODULE_NAME) VALUES ('PORTAL','COMMON','系统门户');
INSERT INTO MODULE (MODULE_CODE,PARENT_MODULE_CODE,MODULE_NAME) VALUES ('MONITOR','COMMON','系统监控模块');

/*==============================================================*/
/* Table: OPERATE_LOG                                           */
/*==============================================================*/
create table OPERATE_LOG
(
   OPERATE_LOG_ID       bigint(10) not null auto_increment comment '操作日志标识',
   EVENT_ID             integer(4) comment '事件标识',
   MODULE_CODE          varchar(10) comment '业务模块代码',
   IP                   varchar(15) comment 'IP地址',
   CREATE_TIME          datetime not null comment '创建时间',
   OPERATOR_ID          integer(8) comment '操作员标识',
   PARAMS_VALUE         varchar(255) comment '参数',
   primary key (OPERATE_LOG_ID)
);

alter table OPERATE_LOG comment '记录用户的操作';

/*==============================================================*/
/* Table: OPERATOR                                              */
/*==============================================================*/
create table OPERATOR
(
   OPERATOR_ID          integer(8) not null comment '操作员标识',
   OPERATOR_TYPE        char(1) not null comment '操作员类型',
   OPERATOR_CODE        integer(8) comment '操作员代码',
   USER_NAME            varchar(60) comment '登录名称',
   PASSWORD             varchar(60) comment '登录密码',
   CREATE_DATE          datetime not null comment '创建时间',
   STATE                char(1) not null comment '状态',
   STATE_DATE           datetime not null comment '状态日期',
   IS_LOCKED            char(1) not null comment '是否锁定',
   PWD_EXP_DATE         datetime comment '密码过期时间',
   REGIST_IP            varchar(16) comment '注册IP',
   LAST_IP              varchar(16) comment '最后访问IP',
   LAST_LOGIN_DATE      datetime comment '最后登录时间',
   ROLE_ID              integer(6),
   LOGIN_FAIL           integer(4) not null,
   primary key (OPERATOR_ID)
);

/*==============================================================*/
/* Table: OPERATOR_HISTORY                                      */
/*==============================================================*/
create table OPERATOR_HISTORY
(
   OPERATOR_ID          integer(8) not null comment '操作员标识',
   SEQ                  integer(8) not null comment '序列',
   OPERATOR_TYPE        char(1) not null comment '操作员类型',
   OPERATOR_CODE        varchar(10) not null comment '操作员代码',
   USER_NAME            varchar(60) comment '登录名称',
   PASSWORD             varchar(60) comment '登录密码',
   CREATE_DATE          datetime not null comment '创建时间',
   STATE                char(1) not null comment '状态',
   STATE_DATE           datetime not null comment '状态日期',
   IS_LOCKED            char(1) not null comment '是否锁定',
   PWD_EXP_DATE         datetime comment '密码过期时间',
   LOGIN_FAIL           integer(4) not null comment '登录失败次数',
   REGIST_IP            varchar(16) comment '注册IP',
   LAST_IP              varchar(16) comment '最后访问IP',
   LAST_LOGIN_DATE      datetime comment '最后登录时间',
   UPDATE_TIME          datetime not null comment '修改时间',
   UPDATE_OPERATOR_ID   integer(8) comment '修改操作员标识',
   primary key (OPERATOR_ID, SEQ)
);

/*==============================================================*/
/* Table: OPERATOR_RESOURCE                                     */
/*==============================================================*/
create table OPERATOR_RESOURCE
(
   OPERATOR_ID          integer(8) not null comment '操作员标识',
   RESOURCE_ID          integer(6) not null comment '资源标识',
   RESOURCE_TYPE        char(1) not null comment '资源类型',
   primary key (OPERATOR_ID, RESOURCE_ID, RESOURCE_TYPE)
);

/*==============================================================*/
/* Table: OPERATOR_ROLE                                         */
/*==============================================================*/
create table OPERATOR_ROLE
(
   ROLE_ID              integer(4) not null comment '角色标识',
   OPERATOR_ID          integer(8) not null comment '操作员标识',
   CREATE_TIME          datetime not null comment '创建时间',
   primary key (ROLE_ID, OPERATOR_ID)
);

/*==============================================================*/
/* Table: OPERATOR_ROLE_HISTORY                                 */
/*==============================================================*/
create table OPERATOR_ROLE_HISTORY
(
   OPERATOR_ID          integer(8) not null comment '操作员标识',
   ROLE_ID              integer(4) not null comment '角色标识',
   SEQ                  integer(4) not null comment '序列',
   CREATE_TIME          datetime not null comment '创建时间',
   UPDATE_TIME          datetime not null comment '修改时间',
   UPDATE_OPERATOR_ID   integer(8) comment '修改人标识',
   primary key (OPERATOR_ID, ROLE_ID, SEQ)
);

/*==============================================================*/
/* Table: QRTZ_BLOB_TRIGGERS                                    */
/*==============================================================*/
create table QRTZ_BLOB_TRIGGERS
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   TRIGGER_NAME         varchar(60) not null comment '触发器名称',
   TRIGGER_GROUP        varchar(60) not null comment '触发器组',
   BLOB_DATA            longblob comment 'BLOB_DATA',
   primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

alter table QRTZ_BLOB_TRIGGERS comment 'Trigger 作为 Blob 类型存储(用于 Quartz 用户用 JDBC 创建他们自己定制的 Trigger 类型';

/*==============================================================*/
/* Table: QRTZ_CALENDARS                                        */
/*==============================================================*/
create table QRTZ_CALENDARS
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   CALENDAR_NAME        varchar(60) not null comment '日历名称',
   CALENDAR             longblob not null comment 'CALENDAR',
   primary key (SCHED_NAME, CALENDAR_NAME)
);

alter table QRTZ_CALENDARS comment '以 Blob 类型存储 Quartz 的 Calendar 信息';

/*==============================================================*/
/* Table: QRTZ_CRON_TRIGGERS                                    */
/*==============================================================*/
create table QRTZ_CRON_TRIGGERS
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   TRIGGER_NAME         varchar(60) not null comment '触发器名称',
   TRIGGER_GROUP        varchar(60) not null comment '触发器组',
   CRON_EXPRESSION      varchar(120) not null comment '表达式',
   TIME_ZONE_ID         varchar(80) comment '时区Id',
   primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

alter table QRTZ_CRON_TRIGGERS comment '存储 Cron Trigger，包括 Cron 表达式和时区信息';

/*==============================================================*/
/* Table: QRTZ_FIRED_TRIGGERS                                   */
/*==============================================================*/
create table QRTZ_FIRED_TRIGGERS
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   ENTRY_ID             varchar(95) not null comment 'ENTRY_ID',
   TRIGGER_NAME         varchar(60) not null comment '触发器名称',
   TRIGGER_GROUP        varchar(60) not null comment '触发器组',
   INSTANCE_NAME        varchar(60) not null comment '实例名',
   FIRED_TIME           double(13,0) not null comment 'FIRED_TIME',
   SCHED_TIME           double(13,0) not null comment 'SCHED_TIME',
   PRIORITY             double(10,0) not null comment 'PRIORITY',
   STATE                varchar(16) not null comment 'STATE',
   JOB_NAME             varchar(200) comment 'JOB_NAME',
   JOB_GROUP            varchar(200) comment 'JOB_GROUP',
   IS_NONCONCURRENT     varchar(1) comment 'IS_NONCONCURRENT',
   REQUESTS_RECOVERY    varchar(1) comment 'REQUESTS_RECOVERY',
   primary key (SCHED_NAME, ENTRY_ID)
);

alter table QRTZ_FIRED_TRIGGERS comment '存储与已触发的 Trigger 相关的状态信息，以及相联 Job 的执行信息';

/*==============================================================*/
/* Table: QRTZ_JOB_DETAILS                                      */
/*==============================================================*/
create table QRTZ_JOB_DETAILS
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   JOB_NAME             varchar(60) not null comment '任务名称',
   JOB_GROUP            varchar(60) not null comment '任务组名称',
   DESCRIPTION          varchar(250) comment '描述',
   JOB_CLASS_NAME       varchar(250) not null comment 'JOB的类名',
   IS_DURABLE           char(1) not null comment 'IS_DURABLE',
   IS_NONCONCURRENT     char(1) not null comment 'IS_NONCONCURRENT',
   IS_UPDATE_DATA       char(1) not null comment '是否更新数据',
   REQUESTS_RECOVERY    char(1) not null comment '可恢复标记',
   JOB_DATA             longblob comment 'JOB_DATA',
   primary key (SCHED_NAME, JOB_NAME, JOB_GROUP)
);

alter table QRTZ_JOB_DETAILS comment '存储每一个已配置的 Job 的详细信息';

/*==============================================================*/
/* Table: QRTZ_LOCKS                                            */
/*==============================================================*/
create table QRTZ_LOCKS
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   LOCK_NAME            varchar(40) not null comment '锁名',
   primary key (SCHED_NAME, LOCK_NAME)
);

alter table QRTZ_LOCKS comment '存储程序的非观锁的信息(假如使用了悲观锁)';

/*==============================================================*/
/* Table: QRTZ_PAUSED_TRIGGER_GRPS                              */
/*==============================================================*/
create table QRTZ_PAUSED_TRIGGER_GRPS
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   TRIGGER_GROUP        varchar(60) not null comment '触发器组',
   primary key (SCHED_NAME, TRIGGER_GROUP)
);

alter table QRTZ_PAUSED_TRIGGER_GRPS comment '存储已暂停的 Trigger 组的信息';

/*==============================================================*/
/* Table: QRTZ_SCHEDULER_STATE                                  */
/*==============================================================*/
create table QRTZ_SCHEDULER_STATE
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   INSTANCE_NAME        varchar(60) not null comment '实例名称',
   LAST_CHECKIN_TIME    bigint(13) not null comment 'LAST_CHECKIN_TIME',
   CHECKIN_INTERVAL     bigint(13) not null comment 'CHECKIN_INTERVAL',
   primary key (SCHED_NAME, INSTANCE_NAME)
);

alter table QRTZ_SCHEDULER_STATE comment '存储少量的有关 Scheduler 的状态信息，和别的 Scheduler 实例(假如是用于一个集群中)';

/*==============================================================*/
/* Table: QRTZ_SIMPLE_TRIGGERS                                  */
/*==============================================================*/
create table QRTZ_SIMPLE_TRIGGERS
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   TRIGGER_NAME         varchar(60) not null comment '触发器名称',
   TRIGGER_GROUP        varchar(60) not null comment '触发器组',
   REPEAT_COUNT         integer(7) not null comment 'REPEAT_COUNT',
   REPEAT_INTERVAL      bigint(12) not null comment 'REPEAT_INTERVAL',
   TIMES_TRIGGERED      bigint(10) not null comment 'TIMES_TRIGGERED',
   primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

alter table QRTZ_SIMPLE_TRIGGERS comment ' 存储简单的 Trigger，包括重复次数，间隔，以及已触的次数';

/*==============================================================*/
/* Table: QRTZ_SIMPROP_TRIGGERS                                 */
/*==============================================================*/
create table QRTZ_SIMPROP_TRIGGERS
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   TRIGGER_NAME         varchar(60) not null comment '触发器名称',
   TRIGGER_GROUP        varchar(60) not null comment '触发器组',
   STR_PROP_1           varchar(512) comment 'STR_PROP_1',
   STR_PROP_2           varchar(512) comment 'STR_PROP_2',
   STR_PROP_3           varchar(512) comment 'STR_PROP_3',
   INT_PROP_1           bigint(10) comment 'INT_PROP_1',
   INT_PROP_2           bigint(10) comment 'INT_PROP_2',
   LONG_PROP_1          bigint(10) comment 'LONG_PROP_1',
   LONG_PROP_2          bigint(10) comment 'LONG_PROP_2',
   DEC_PROP_1           double(13,4) comment 'DEC_PROP_1',
   DEC_PROP_2           double(13,4) comment 'DEC_PROP_2',
   BOOL_PROP_1          char(1) comment 'BOOL_PROP_1',
   BOOL_PROP_2          char(1) comment 'BOOL_PROP_2',
   primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

/*==============================================================*/
/* Table: QRTZ_TRIGGERS                                         */
/*==============================================================*/
create table QRTZ_TRIGGERS
(
   SCHED_NAME           varchar(20) not null comment '调度名称',
   TRIGGER_NAME         varchar(60) not null comment '触发器名称',
   TRIGGER_GROUP        varchar(60) not null comment '触发器组',
   JOB_NAME             varchar(60) not null comment '任务名称',
   JOB_GROUP            varchar(60) not null comment '任务组',
   DESCRIPTION          varchar(250) comment '描述',
   NEXT_FIRE_TIME       bigint(13) comment 'NEXT_FIRE_TIME',
   PREV_FIRE_TIME       bigint(13) comment 'PREV_FIRE_TIME',
   PRIORITY             bigint(10) comment 'PRIORITY',
   TRIGGER_STATE        varchar(16) not null comment 'TRIGGER_STATE',
   TRIGGER_TYPE         varchar(8) not null comment 'TRIGGER_TYPE',
   START_TIME           bigint(13) not null comment 'START_TIME',
   END_TIME             bigint(10) comment 'END_TIME',
   CALENDAR_NAME        varchar(200) comment 'CALENDAR_NAME',
   MISFIRE_INSTR        smallint comment 'MISFIRE_INSTR',
   JOB_DATA             longblob comment 'JOB_DATA',
   primary key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

alter table QRTZ_TRIGGERS comment '存储已配置的 Trigger 的信息';

/*==============================================================*/
/* Table: RESOURCES                                             */
/*==============================================================*/
create table RESOURCES
(
   RESOURCE_ID          integer(6) not null comment '资源标识',
   MODULE_CODE          varchar(10) comment '业务模块代码',
   RESOURCE_TYPE        char(1) not null comment '资源类型',
   primary key (RESOURCE_ID)
);

alter table RESOURCES comment '资源表';

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE
(
   ROLE_ID              integer(6) not null auto_increment comment '角色标识',
   MODULE_CODE          varchar(10) comment '业务模块代码',
   ROLE_NAME            varchar(60) not null comment '角色名称',
   CREATE_TIME          datetime not null comment '创建时间',
   OPERATOR_ID          integer(8) comment '创建人标识',
   primary key (ROLE_ID)
);

/*==============================================================*/
/* Table: ROLE_HISTORY                                          */
/*==============================================================*/
create table ROLE_HISTORY
(
   ROLE_ID              integer(4) not null comment '角色标识',
   SEQ                  integer(4) not null comment '序列',
   ROLE_NAME            varchar(60) not null comment '角色名称',
   CREATE_TIME          datetime not null comment '创建时间',
   OPERATOR_ID          integer(8) comment '创建人标识',
   UPDATE_TIME          datetime not null comment '更新时间',
   UPDATE_OPERATOR_ID   integer(8) comment '更新人标识',
   primary key (ROLE_ID, SEQ)
);

/*==============================================================*/
/* Table: ROLE_RESOURCE                                         */
/*==============================================================*/
create table ROLE_RESOURCE
(
   ROLE_ID              integer(4) not null comment '角色标识',
   RESOURCE_ID          integer(8) not null comment '资源标识',
   RESOURCE_TYPE        CHAR(1) not null comment '资源类型',
   primary key (ROLE_ID, RESOURCE_ID, RESOURCE_TYPE)
);

/*==============================================================*/
/* Table: SEND_RECORD                                           */
/*==============================================================*/
create table SEND_RECORD
(
   SEND_RECORD_ID       bigint(10) not null auto_increment comment '发送记录标识',
   MESSAGE_ID           bigint(10) not null comment '消息标识',
   CONTACT_CHANNEL_ID   smallint(2) not null comment '接触渠到',
   SEND_TIME            datetime not null comment '发送时间',
   RESULT               varchar(255) not null comment '发送结果',
   primary key (SEND_RECORD_ID)
);

/*==============================================================*/
/* Table: SIMPLE_TRIGGER                                        */
/*==============================================================*/
create table SIMPLE_TRIGGER
(
   TRIGGER_ID           integer(8) not null auto_increment comment '触发器标识',
   TRIGGER_NAME         varchar(60) not null comment '触发器名称',
   BEGIN_TIME           datetime not null comment '开始时间',
   END_TIME             datetime comment '结束时间',
   TIMES                integer(4) comment '执行次数',
   EXECUTE_INTERVAL     integer(4) not null comment '执行间隔',
   INTERVAL_UNIT        char(1) not null comment '间隔单位',
   CREATE_TIME          datetime not null comment '创建时间',
   OPERATOR_ID          integer(4) comment '创建人标识',
   primary key (TRIGGER_ID)
);

/*==============================================================*/
/* Table: SIMPLE_TRIGGER_HISTORY                                */
/*==============================================================*/
create table SIMPLE_TRIGGER_HISTORY
(
   TRIGGER_ID           integer(8) not null comment '触发器标识',
   SEQ                  integer(4) not null comment '序列号',
   TRIGGER_NAME         varchar(60) not null comment '触发器名称',
   BEGIN_TIME           datetime not null comment '开始时间',
   END_TIME             datetime comment '结束时间',
   TIMES                integer(4) comment '执行次数',
   EXECUTE_INTERVAL     integer(4) not null comment '执行间隔',
   INTERVAL_UNIT        char(1) not null comment '间隔单位',
   CREATE_TIME          datetime not null comment '创建时间',
   OPERATOR_ID          integer(8) comment '创建人标识',
   UPDATE_TIME          datetime not null comment '修改时间',
   UPDATE_OPERATOR_ID   integer(8) comment '修改人标识',
   primary key (TRIGGER_ID, SEQ)
);

/*==============================================================*/
/* Table: TASK                                                  */
/*==============================================================*/
create table TASK
(
   TASK_ID              integer(8) not null auto_increment comment '任务标识',
   TASK_NAME            varchar(60) not null comment '任务名称',
   CLASS_NAME           varchar(60) not null comment '执行类名',
   METHOD               varchar(20) not null comment '方法名',
   MODULE_CODE          varchar(10) not null comment '业务模块代码',
   PRIORITY             smallint(1) not null comment '优先级',
   IS_CONCURRENT        char(1) comment '是否并发',
   TASK_STATE           char(1) not null comment '任务状态',
   LAST_EXECUTE_TIME    datetime comment '上次执行时间',
   NEXT_EXCUTE_DATE     datetime comment '下次执行时间',
   OPERATOR_ID          integer(8) comment '创建人标识',
   CREATE_TIME          datetime not null comment '创建时间',
   primary key (TASK_ID),
   key AK_Key_2 (TASK_NAME)
);

/*==============================================================*/
/* Table: TASK_HISTORY                                          */
/*==============================================================*/
create table TASK_HISTORY
(
   TASK_ID              integer(8) not null comment '任务标识',
   SEQ                  integer(8) not null comment '序列号',
   TASK_NAME            varchar(60) not null comment '任务名称',
   CLASS_NAME           varchar(60) not null comment '执行类名',
   METHOD               varchar(20) not null comment '方法名',
   MODULE_CODE          varchar(10) not null comment '业务模块代码',
   PRIORITY             smallint(1) not null comment '优先级',
   IS_CONCURRENT        char(1) comment '是否并发',
   TASK_STATE           char(1) not null comment '任务状态',
   LAST_EXECUTE_TIME    datetime comment '上次执行时间',
   NEXT_EXCUTE_DATE     datetime comment '下次执行时间',
   OPERATOR_ID          integer(8) comment '创建人标识',
   CREATE_TIME          datetime not null comment '创建时间',
   UPDATE_TIME          datetime not null comment '修改时间',
   UPDATE_OPERATOR_ID   integer(8) comment '修改人标识',
   primary key (TASK_ID, SEQ)
);

/*==============================================================*/
/* Table: TASK_TRIGGER                                          */
/*==============================================================*/
create table TASK_TRIGGER
(
   TASK_ID              integer(8) not null comment '任务标识',
   TRIGGER_TYPE         char(1) not null comment '触发器类型',
   TRIGGER_ID           integer(8) not null comment '触发器标识',
   primary key (TASK_ID, TRIGGER_TYPE, TRIGGER_ID)
);

/*==============================================================*/
/* Table: TRANS_LOG                                             */
/*==============================================================*/
create table TRANS_LOG
(
   TRANS_ID             varchar(36) not null comment '事务标识',
   MODULE_CODE          varchar(10) comment '业务模块标识',
   BEGIN_TIME           datetime not null comment '开始时间',
   END_TIME             datetime not null comment '结束时间',
   CONSUME_TIME         integer(8) not null comment '执行时间(毫秒)',
   INPUT_PARAM          text comment '入参',
   OUTPUT_PARAM         text comment '出参',
   SQL_LOG              text comment 'SQL日志',
   EXCEPTION_LOG        text comment '异常信息',
   CONTACT_CHANNEL_ID   smallint(2) comment '接触渠到',
   primary key (TRANS_ID)
);

/*==============================================================*/
/* Table: TRANS_LOG_STACK                                       */
/*==============================================================*/
create table TRANS_LOG_STACK
(
   STACK_ID             varchar(36) not null comment '栈标识',
   SEQ                  integer(4) not null comment '序列',
   TRANS_ID             varchar(36) not null comment '事务标识',
   PARENT_STACK_ID      varchar(36) comment '父栈标识',
   METHOD               text not null comment '方法标识',
   BEGIN_TIME           datetime not null comment '开始时间',
   END_TIME             datetime not null comment '结束时间',
   CONSUME_TIME         integer(8) not null comment '执行时间（毫秒）',
   INPUT_PARAM          text comment '入参',
   OUTPUT_PARAM         text comment '出参',
   IS_SUCCESS           char(1) not null comment '是否成功',
   primary key (STACK_ID)
);

/*==============================================================*/
/* Table: URL_RESOURCE                                          */
/*==============================================================*/
create table URL_RESOURCE
(
   RESOURCE_ID          integer(6) not null auto_increment comment '资源标识',
   DIRECTORY_CODE       varchar(20) not null comment '目录代码',
   RESOURCE_NAME        varchar(60) not null comment '资源名称',
   URL                  varchar(120) not null comment 'URL',
   METHOD               varchar(8),
   EVENT_ID             varchar(20) not null comment '触发事件',
   REMARK               varchar(255) comment '描述',
   primary key (RESOURCE_ID)
);

alter table ACCOUNT add constraint FK_OPERATOR_ID_OPERATOR_IDENTITY_OPERATOR_ID foreign key (OPERATOR_ID)
      references OPERATOR (OPERATOR_ID) on delete restrict on update restrict;

alter table ADMIN add constraint FK_OPERATOR_ID_ADMIN_OPERATOR_ID foreign key (OPERATOR_ID)
      references OPERATOR (OPERATOR_ID) on delete restrict on update restrict;

alter table ADMIN_ATTR add constraint FK_ADMIN_ID_ADMIN_ATTR_ADMIN_ID foreign key (ADMIN_ID)
      references ADMIN (ADMIN_ID) on delete restrict on update restrict;

alter table ADMIN_ATTR add constraint FK_ATTR_ID_ADMIN_ATTR_ATTR_ID foreign key (ATTR_ID)
      references ATTR (ATTR_ID) on delete restrict on update restrict;

alter table AREA add constraint FK_AREA_ID_AREA_PARENT_AREA_ID foreign key (PARENT_AREA_ID)
      references AREA (AREA_ID) on delete restrict on update restrict;

alter table AREA_RANGE add constraint FK_AREA_RAN_ARRE foreign key (AREA_ID)
      references AREA (AREA_ID) on delete restrict on update restrict;

alter table ATTR_VALUE add constraint FK_ATTR_ID_ATTR_VALUE_ATTR_ID foreign key (ATTR_ID)
      references ATTR (ATTR_ID) on delete restrict on update restrict;

alter table ATTR_VALUE add constraint FK_ATTR_VAL_ATTR_ID_A_LINK foreign key (LINK_ATTR_ID)
      references ATTR (ATTR_ID) on delete restrict on update restrict;

alter table CONFIG_ITEM add constraint FK_DIRECTORY_CODE_CONFIG_ITEM_DIRECTORY_CODE foreign key (DIRECTORY_CODE)
      references DIRECTORY (DIRECTORY_CODE) on delete restrict on update restrict;

alter table CONFIG_ITEM add constraint FK_MODULE_CODE_CONFIG_ITEM_MODULE_CODE foreign key (MODULE_CODE)
      references MODULE (MODULE_CODE) on delete restrict on update restrict;

alter table CONFIG_ITEM_PARAM add constraint FK_CONFIG_ITEM_ID_CONFIG_ITEM_PARAM_ITEM_ID foreign key (CONFIG_ITEM_ID)
      references CONFIG_ITEM (CONFIG_ITEM_ID) on delete restrict on update restrict;

alter table CONFIG_ITEM_PARAM_VALUE add constraint FK_CONFIG_I_CONFIG_IT_CONFIG_V foreign key (CONFIG_ITEM_ID, PARAM_CODE)
      references CONFIG_ITEM_PARAM (CONFIG_ITEM_ID, PARAM_CODE) on delete restrict on update restrict;

alter table DICTIONARY_DATA add constraint FK_FK_DICTIONARY_DICTIONARY_DATA foreign key (DICT_CODE)
      references DICTIONARY (DICT_CODE) on delete restrict on update restrict;

alter table DIRECTORY add constraint FK_DIRECTORY_CODE_PARENT_DIRECTORY_CODE foreign key (PARENT_DIRECTORY_CODE)
      references DIRECTORY (DIRECTORY_CODE);

alter table MENU add constraint FK_FK_MENU_RESOURCE foreign key (RESOURCE_ID)
      references RESOURCES (RESOURCE_ID) on delete restrict on update restrict;

alter table MENU add constraint FK_FK_RESOURCE_ID_PARENT_RESOURCE_ID foreign key (PARENT_RESOURCE_ID)
      references MENU (RESOURCE_ID) on delete restrict on update restrict;

alter table MENU_URL_RESOURCE add constraint FK_FK_MENU_URL_RESOURCE_MENU foreign key (RESOURCE_ID)
      references MENU (RESOURCE_ID) on delete restrict on update restrict;

alter table MENU_URL_RESOURCE add constraint FK_FK_MENU_URL_RESOURCE_URL_RESOURCE foreign key (URL_RESOURCE_ID)
      references URL_RESOURCE (RESOURCE_ID) on delete restrict on update restrict;

alter table MESSAGE_ATTACHMENTS add constraint FK_ATTACHMENTS_MESSAGE_ATTACHMENTS foreign key (ATTACHMENTS_ID)
      references ATTACHMENTS (ATTACHMENTS_ID) on delete restrict on update restrict;

alter table MESSAGE_BOX add constraint FK_MESSAGE_TEMPLATE_MESSAGE_BOX foreign key (MESSAGE_TEMPLATE_ID)
      references MESSAGE_TEMPLATE (MESSAGE_TEMPLATE_ID) on delete restrict on update restrict;

alter table MESSAGE_TEMPLATE add constraint FK_DIRECTORY_MESSAGE_TEMPLATE foreign key (DIRECTORY_CODE)
      references DIRECTORY (DIRECTORY_CODE) on delete restrict on update restrict;

alter table MODULE add constraint FK_MODULE_CODE_PARENT_MODULE_CODE foreign key (PARENT_MODULE_CODE)
      references MODULE (MODULE_CODE) on delete restrict on update restrict;

alter table OPERATE_LOG add constraint FK_FK_OPERATE_LOG_EVENT foreign key (EVENT_ID)
      references EVENT (EVENT_ID) on delete restrict on update restrict;

alter table OPERATE_LOG add constraint FK_FK_OPERATE_LOG_MODULE foreign key (MODULE_CODE)
      references MODULE (MODULE_CODE) on delete restrict on update restrict;

alter table OPERATOR add constraint FK_FK_OPERATOR_ROLE_ID foreign key (ROLE_ID)
      references ROLE (ROLE_ID) on delete restrict on update restrict;

alter table OPERATOR_RESOURCE add constraint FK_FK_OPERATOR_RESOURCE_RESOURCE foreign key (RESOURCE_ID)
      references RESOURCES (RESOURCE_ID) on delete restrict on update restrict;

alter table OPERATOR_RESOURCE add constraint FK_OPERATOR_ID_OPERATOR_RESOURCE_OPERATOR_ID foreign key (OPERATOR_ID)
      references OPERATOR (OPERATOR_ID) on delete restrict on update restrict;

alter table OPERATOR_ROLE add constraint FK_ADMIN_ID_ADMIN_ROLE_ADMIN_ID foreign key (OPERATOR_ID)
      references OPERATOR (OPERATOR_ID) on delete restrict on update restrict;

alter table OPERATOR_ROLE add constraint FK_ROLE_ID_ADMIN_ROLE_ROLE_ID foreign key (ROLE_ID)
      references ROLE (ROLE_ID) on delete restrict on update restrict;

alter table QRTZ_BLOB_TRIGGERS add constraint FK_QRTZ_BLO_QRTZ_TRI foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
      references QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

alter table QRTZ_CRON_TRIGGERS add constraint FK_QRTZ_CRO_QRTZ_TRI foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
      references QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

alter table QRTZ_SIMPLE_TRIGGERS add constraint FK_QRTZ_SIM_QRTZ_TRI foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
      references QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

alter table QRTZ_SIMPROP_TRIGGERS add constraint FK_Reference_4 foreign key (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
      references QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP);

alter table QRTZ_TRIGGERS add constraint FK_QRTZ_TRI_QRTZ_JOB foreign key (SCHED_NAME, JOB_NAME, JOB_GROUP)
      references QRTZ_JOB_DETAILS (SCHED_NAME, JOB_NAME, JOB_GROUP);

alter table RESOURCES add constraint FK_FK_RESOURCE_MODULE foreign key (MODULE_CODE)
      references MODULE (MODULE_CODE) on delete restrict on update restrict;

alter table ROLE add constraint FK_MODULE_CODE_ROLE_MODULE_CODE foreign key (MODULE_CODE)
      references MODULE (MODULE_CODE) on delete restrict on update restrict;

alter table ROLE_RESOURCE add constraint FK_FK_ROLE_RESOURCE_RESOURCE foreign key (RESOURCE_ID)
      references RESOURCES (RESOURCE_ID) on delete restrict on update restrict;

alter table ROLE_RESOURCE add constraint FK_ROLE_ID_ROLE_RESOURCE_ROLE_ID foreign key (ROLE_ID)
      references ROLE (ROLE_ID) on delete restrict on update restrict;

alter table SEND_RECORD add constraint FK_CONTACT_CHANNEL_SEND_RECORD foreign key (CONTACT_CHANNEL_ID)
      references CONTACT_CHANNEL (CONTACT_CHANNEL_ID) on delete restrict on update restrict;

alter table TASK add constraint FK_MODULE_CODE_TASK_MODULE_CODE foreign key (MODULE_CODE)
      references MODULE (MODULE_CODE) on delete restrict on update restrict;

alter table TASK_TRIGGER add constraint FK_TASK_ID_TASK_TRIGGER_TASK_ID foreign key (TASK_ID)
      references TASK (TASK_ID) on delete restrict on update restrict;

alter table TRANS_LOG add constraint FK_CONTACT_CHANNEL_ID_TRANS_LOG_CONTACT_CHANNEL_ID foreign key (CONTACT_CHANNEL_ID)
      references CONTACT_CHANNEL (CONTACT_CHANNEL_ID) on delete restrict on update restrict;

alter table TRANS_LOG add constraint FK_MODULE_CODE_TRANS_LOG_MODULE_CODE foreign key (MODULE_CODE)
      references MODULE (MODULE_CODE) on delete restrict on update restrict;

alter table TRANS_LOG_STACK add constraint FK_FK_TRANS_LOG_STACK_TRANS_LOG foreign key (TRANS_ID)
      references TRANS_LOG (TRANS_ID) on delete restrict on update restrict;

alter table URL_RESOURCE add constraint FK_DIRECTORY_CODE_URL_RESOURCE_DIRECTORY_CODE foreign key (DIRECTORY_CODE)
      references DIRECTORY (DIRECTORY_CODE) on delete restrict on update restrict;

alter table URL_RESOURCE add constraint FK_FK_URL_RESOURCE_RESOURCE foreign key (RESOURCE_ID)
      references RESOURCES (RESOURCE_ID) on delete restrict on update restrict;

