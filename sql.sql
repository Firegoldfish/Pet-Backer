DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';

DROP TABLE IF EXISTS 'auth';
CREATE TABLE 'auth' (
  'auth_id' int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';

DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');

DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2025-03-17 18:21:49.0','2025-03-17 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2025-03-17 18:21:49.0','2025-03-17 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：Firegoldfish@outlook.com</p><h3>商务合作</h3><p>电话：(313)403-8545)</p><p>Email：Firegoldfish@outlook.com</p><h3><br></h3><h3><br></h3><p><br></p>','2025-03-17 18:21:49.0','2025-03-17 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2025-03-17 18:21:49.0','2025-03-17 18:21:49.0');

DROP TABLE IF EXISTS `sensitive_vocabulary`;
CREATE TABLE `sensitive_vocabulary` (
  `sensitive_vocabulary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '敏感词汇ID',
  `sensitive_vocabulary` varchar(64) DEFAULT NULL COMMENT '敏感词汇',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`sensitive_vocabulary_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='敏感词汇';
DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章分类';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2025-12-31 18:21:49.0','2025-12-31 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2025-12-03 15:05:17.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2025-12-31 17:35:13.0');
DROP TABLE IF EXISTS `regular_users`;
CREATE TABLE `regular_users`(regular_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '普通用户ID',
`user_name` varchar(64) comment '用户名称',
`user_gender` varchar(64) comment '用户性别',
`contact_number` varchar(64) comment '联系电话',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (regular_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '普通用户';

DROP TABLE IF EXISTS `housekeeping_staff`;
CREATE TABLE `housekeeping_staff`(housekeeping_staff_id int(11) NOT NULL AUTO_INCREMENT COMMENT '家政员工ID',
`employee_name` varchar(64) comment '员工姓名',
`employee_gender` varchar(64) comment '员工性别',
`contact_phone_number` varchar(64) comment '联系电话',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (housekeeping_staff_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '家政员工';

DROP TABLE IF EXISTS `home_services`;
CREATE TABLE `home_services`(home_services_id int(11) NOT NULL AUTO_INCREMENT COMMENT '家政服务ID',
`home_service_users` int(11) DEFAULT 0 comment '家政用户',
`employee_name` varchar(64) comment '员工名称',
`housekeeping_name` varchar(64) comment '家政名称',
`household_photos` varchar(255) comment '家政照片',
`housekeeping_type` varchar(64) comment '宠物类型',
`service_scope` varchar(64) comment '服务范围',
`service_time` date comment '服务时间',
`service_fees` int(11) DEFAULT 0 comment '服务费用',
`personal_profile` text comment '个人简介',
`introduction_to_home_economics` text comment '家政介绍',
`contact_information` varchar(64) comment '联系方式',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (home_services_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '家政服务';
insert into `home_services` values (1,0,'员工名称1','家政名称1','/api/upload/1610083157200076800.jpg','宠物类型1','服务范围1','2025-12-20',1,'个人简介1','家政介绍1','联系方式1',359,285,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (2,0,'员工名称2','家政名称2','/api/upload/1732674358024863745.jpg','宠物类型2','服务范围2','2025-12-20',2,'个人简介2','家政介绍2','联系方式2',550,859,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (3,0,'员工名称3','家政名称3','/api/upload/1610083066926071809.jpg','宠物类型3','服务范围3','2025-12-20',3,'个人简介3','家政介绍3','联系方式3',523,974,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (4,0,'员工名称4','家政名称4','/api/upload/1610083113071804417.jpg','宠物类型4','服务范围4','2025-12-20',4,'个人简介4','家政介绍4','联系方式4',184,478,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (5,0,'员工名称5','家政名称5','/api/upload/1732674422466150401.jpg','宠物类型5','服务范围5','2025-12-20',5,'个人简介5','家政介绍5','联系方式5',73,245,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (6,0,'员工名称6','家政名称6','/api/upload/1610083241472032769.jpg','宠物类型6','服务范围6','2025-12-20',6,'个人简介6','家政介绍6','联系方式6',884,961,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (7,0,'员工名称7','家政名称7','/api/upload/1610083288796364800.jpg','宠物类型7','服务范围7','2025-12-20',7,'个人简介7','家政介绍7','联系方式7',784,953,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (8,0,'员工名称8','家政名称8','/api/upload/1610083203240951809.jpg','宠物类型8','服务范围8','2025-12-20',8,'个人简介8','家政介绍8','联系方式8',57,432,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (9,0,'员工名称9','家政名称9','/api/upload/1732674246389268481.jpg','宠物类型9','服务范围9','2025-12-20',9,'个人简介9','家政介绍9','联系方式9',242,250,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (10,0,'员工名称10','家政名称10','/api/upload/1610083338297540609.jpg','宠物类型10','服务范围10','2025-12-20',10,'个人简介10','家政介绍10','联系方式10',141,331,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (11,0,'员工名称11','家政名称11','/api/upload/1732674298914537473.jpg','宠物类型11','服务范围11','2025-12-20',11,'个人简介11','家政介绍11','联系方式11',163,853,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_services` values (12,0,'员工名称12','家政名称12','/api/upload/1610083026442649600.jpg','宠物类型12','服务范围12','2025-12-20',12,'个人简介12','家政介绍12','联系方式12',27,907,'2025-12-20 17:52:51','2025-12-20 17:52:51');

DROP TABLE IF EXISTS `appointment_for_housekeeping`;
CREATE TABLE `appointment_for_housekeeping`(appointment_for_housekeeping_id int(11) NOT NULL AUTO_INCREMENT COMMENT '预约家政ID',
`appointment_users` int(11) DEFAULT 0 comment '预约用户',
`user_name` varchar(64) comment '用户名称',
`home_service_users` int(11) DEFAULT 0 comment '家政用户',
`employee_name` varchar(64) comment '员工名称',
`housekeeping_name` varchar(64) comment '家政名称',
`housekeeping_type` varchar(64) comment '宠物类型',
`service_fees` varchar(64) comment '服务费用',
`home_visit_time` datetime comment '上门时间',
`matters_needing_attention` text comment '注意事项',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`pay_state` varchar(16) DEFAULT '未支付' NOT NULL comment '支付状态',
`pay_type` varchar(16) DEFAULT '' comment '支付类型: 微信、支付宝、网银',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (appointment_for_housekeeping_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '预约家政';
insert into `appointment_for_housekeeping` values (1,0,'用户名称1',0,'员工名称1','家政名称1','宠物类型1','服务费用1','2025-12-20 17:52:51','注意事项1','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (2,0,'用户名称2',0,'员工名称2','家政名称2','宠物类型2','服务费用2','2025-12-20 17:52:51','注意事项2','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (3,0,'用户名称3',0,'员工名称3','家政名称3','宠物类型3','服务费用3','2025-12-20 17:52:51','注意事项3','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (4,0,'用户名称4',0,'员工名称4','家政名称4','宠物类型4','服务费用4','2025-12-20 17:52:51','注意事项4','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (5,0,'用户名称5',0,'员工名称5','家政名称5','宠物类型5','服务费用5','2025-12-20 17:52:51','注意事项5','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (6,0,'用户名称6',0,'员工名称6','家政名称6','宠物类型6','服务费用6','2025-12-20 17:52:51','注意事项6','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (7,0,'用户名称7',0,'员工名称7','家政名称7','宠物类型7','服务费用7','2025-12-20 17:52:51','注意事项7','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (8,0,'用户名称8',0,'员工名称8','家政名称8','宠物类型8','服务费用8','2025-12-20 17:52:51','注意事项8','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (9,0,'用户名称9',0,'员工名称9','家政名称9','宠物类型9','服务费用9','2025-12-20 17:52:51','注意事项9','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (10,0,'用户名称10',0,'员工名称10','家政名称10','宠物类型10','服务费用10','2025-12-20 17:52:51','注意事项10','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (11,0,'用户名称11',0,'员工名称11','家政名称11','宠物类型11','服务费用11','2025-12-20 17:52:51','注意事项11','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `appointment_for_housekeeping` values (12,0,'用户名称12',0,'员工名称12','家政名称12','宠物类型12','服务费用12','2025-12-20 17:52:51','注意事项12','未审核','未支付','支付宝','2025-12-20 17:52:51','2025-12-20 17:52:51');

DROP TABLE IF EXISTS `home_economics_customization`;
CREATE TABLE `home_economics_customization`(home_economics_customization_id int(11) NOT NULL AUTO_INCREMENT COMMENT '家政定制ID',
`customized_users` int(11) DEFAULT 0 comment '定制用户',
`user_name` varchar(64) comment '用户名称',
`housekeeping_name` varchar(64) comment '家政名称',
`household_photos` varchar(255) comment '家政照片',
`domestic_address` varchar(64) comment '家政地址',
`service_fees` int(11) DEFAULT 0 comment '服务费用',
`home_visit_time` date comment '上门时间',
`home_economics_content` text comment '家政内容',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (home_economics_customization_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '家政定制';
insert into `home_economics_customization` values (1,0,'用户名称1','家政名称1','/api/upload/1732674358024863745.jpg','家政地址1',1,'2025-12-20','家政内容1','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (2,0,'用户名称2','家政名称2','/api/upload/1610083113071804417.jpg','家政地址2',2,'2025-12-20','家政内容2','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (3,0,'用户名称3','家政名称3','/api/upload/1610083288796364800.jpg','家政地址3',3,'2025-12-20','家政内容3','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (4,0,'用户名称4','家政名称4','/api/upload/1610083066926071809.jpg','家政地址4',4,'2025-12-20','家政内容4','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (5,0,'用户名称5','家政名称5','/api/upload/1610083203240951809.jpg','家政地址5',5,'2025-12-20','家政内容5','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (6,0,'用户名称6','家政名称6','/api/upload/1610083338297540609.jpg','家政地址6',6,'2025-12-20','家政内容6','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (7,0,'用户名称7','家政名称7','/api/upload/1732674246389268481.jpg','家政地址7',7,'2025-12-20','家政内容7','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (8,0,'用户名称8','家政名称8','/api/upload/1610083241472032769.jpg','家政地址8',8,'2025-12-20','家政内容8','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (9,0,'用户名称9','家政名称9','/api/upload/1610083157200076800.jpg','家政地址9',9,'2025-12-20','家政内容9','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (10,0,'用户名称10','家政名称10','/api/upload/1732674422466150401.jpg','家政地址10',10,'2025-12-20','家政内容10','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (11,0,'用户名称11','家政名称11','/api/upload/1732674298914537473.jpg','家政地址11',11,'2025-12-20','家政内容11','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `home_economics_customization` values (12,0,'用户名称12','家政名称12','/api/upload/1610083026442649600.jpg','家政地址12',12,'2025-12-20','家政内容12','2025-12-20 17:52:51','2025-12-20 17:52:51');

DROP TABLE IF EXISTS `housekeeping_orders`;
CREATE TABLE `housekeeping_orders`(housekeeping_orders_id int(11) NOT NULL AUTO_INCREMENT COMMENT '家政接单ID',
`home_service_users` int(11) DEFAULT 0 comment '家政用户',
`employee_name` varchar(64) comment '员工名称',
`customized_users` int(11) DEFAULT 0 comment '定制用户',
`user_name` varchar(64) comment '用户名称',
`housekeeping_name` varchar(64) comment '家政名称',
`domestic_address` varchar(64) comment '家政地址',
`service_fees` varchar(64) comment '服务费用',
`home_visit_time` varchar(64) comment '上门时间',
`home_economics_content` varchar(64) comment '家政内容',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (housekeeping_orders_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '家政接单';
insert into `housekeeping_orders` values (1,0,'员工名称1',0,'用户名称1','家政名称1','家政地址1','服务费用1','上门时间1','家政内容1','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (2,0,'员工名称2',0,'用户名称2','家政名称2','家政地址2','服务费用2','上门时间2','家政内容2','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (3,0,'员工名称3',0,'用户名称3','家政名称3','家政地址3','服务费用3','上门时间3','家政内容3','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (4,0,'员工名称4',0,'用户名称4','家政名称4','家政地址4','服务费用4','上门时间4','家政内容4','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (5,0,'员工名称5',0,'用户名称5','家政名称5','家政地址5','服务费用5','上门时间5','家政内容5','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (6,0,'员工名称6',0,'用户名称6','家政名称6','家政地址6','服务费用6','上门时间6','家政内容6','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (7,0,'员工名称7',0,'用户名称7','家政名称7','家政地址7','服务费用7','上门时间7','家政内容7','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (8,0,'员工名称8',0,'用户名称8','家政名称8','家政地址8','服务费用8','上门时间8','家政内容8','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (9,0,'员工名称9',0,'用户名称9','家政名称9','家政地址9','服务费用9','上门时间9','家政内容9','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (10,0,'员工名称10',0,'用户名称10','家政名称10','家政地址10','服务费用10','上门时间10','家政内容10','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (11,0,'员工名称11',0,'用户名称11','家政名称11','家政地址11','服务费用11','上门时间11','家政内容11','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_orders` values (12,0,'员工名称12',0,'用户名称12','家政名称12','家政地址12','服务费用12','上门时间12','家政内容12','2025-12-20 17:52:51','2025-12-20 17:52:51');

DROP TABLE IF EXISTS `after_sales_evaluation`;
CREATE TABLE `after_sales_evaluation`(after_sales_evaluation_id int(11) NOT NULL AUTO_INCREMENT COMMENT '售后评价ID',
`appointment_users` int(11) DEFAULT 0 comment '预约用户',
`user_name` varchar(64) comment '用户名称',
`home_service_users` int(11) DEFAULT 0 comment '家政用户',
`employee_name` varchar(64) comment '员工姓名',
`housekeeping_name` varchar(64) comment '家政名称',
`home_economics_pictures` varchar(255) comment '家政图片',
`housekeeping_type` varchar(64) comment '宠物类型',
`service_attitude` varchar(64) comment '服务态度',
`service_achievements` text comment '服务成果',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (after_sales_evaluation_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '售后评价';
insert into `after_sales_evaluation` values (1,0,'用户名称1',0,'员工姓名1','家政名称1','/api/upload/1610083066926071809.jpg','宠物类型1','服务态度1','服务成果1',611,35,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (2,0,'用户名称2',0,'员工姓名2','家政名称2','/api/upload/1732674246389268481.jpg','宠物类型2','服务态度2','服务成果2',56,452,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (3,0,'用户名称3',0,'员工姓名3','家政名称3','/api/upload/1610083113071804417.jpg','宠物类型3','服务态度3','服务成果3',586,216,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (4,0,'用户名称4',0,'员工姓名4','家政名称4','/api/upload/1610083241472032769.jpg','宠物类型4','服务态度4','服务成果4',560,428,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (5,0,'用户名称5',0,'员工姓名5','家政名称5','/api/upload/1732674358024863745.jpg','宠物类型5','服务态度5','服务成果5',698,581,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (6,0,'用户名称6',0,'员工姓名6','家政名称6','/api/upload/1610083157200076800.jpg','宠物类型6','服务态度6','服务成果6',696,703,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (7,0,'用户名称7',0,'员工姓名7','家政名称7','/api/upload/1610083288796364800.jpg','宠物类型7','服务态度7','服务成果7',333,648,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (8,0,'用户名称8',0,'员工姓名8','家政名称8','/api/upload/1732674422466150401.jpg','宠物类型8','服务态度8','服务成果8',211,323,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (9,0,'用户名称9',0,'员工姓名9','家政名称9','/api/upload/1610083203240951809.jpg','宠物类型9','服务态度9','服务成果9',36,498,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (10,0,'用户名称10',0,'员工姓名10','家政名称10','/api/upload/1732674298914537473.jpg','宠物类型10','服务态度10','服务成果10',278,558,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (11,0,'用户名称11',0,'员工姓名11','家政名称11','/api/upload/1610083338297540609.jpg','宠物类型11','服务态度11','服务成果11',407,320,'2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `after_sales_evaluation` values (12,0,'用户名称12',0,'员工姓名12','家政名称12','/api/upload/1610083026442649600.jpg','宠物类型12','服务态度12','服务成果12',366,458,'2025-12-20 17:52:51','2025-12-20 17:52:51');

DROP TABLE IF EXISTS `comment_reply`;
CREATE TABLE `comment_reply`(comment_reply_id int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复ID',
`home_service_users` int(11) DEFAULT 0 comment '家政用户',
`employee_name` varchar(64) comment '员工姓名',
`appointment_users` int(11) DEFAULT 0 comment '预约用户',
`user_name` varchar(64) comment '用户名称',
`reply_content` text comment '回复内容',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (comment_reply_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '评论回复';
insert into `comment_reply` values (1,0,'员工姓名1',0,'用户名称1','回复内容1','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (2,0,'员工姓名2',0,'用户名称2','回复内容2','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (3,0,'员工姓名3',0,'用户名称3','回复内容3','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (4,0,'员工姓名4',0,'用户名称4','回复内容4','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (5,0,'员工姓名5',0,'用户名称5','回复内容5','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (6,0,'员工姓名6',0,'用户名称6','回复内容6','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (7,0,'员工姓名7',0,'用户名称7','回复内容7','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (8,0,'员工姓名8',0,'用户名称8','回复内容8','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (9,0,'员工姓名9',0,'用户名称9','回复内容9','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (10,0,'员工姓名10',0,'用户名称10','回复内容10','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (11,0,'员工姓名11',0,'用户名称11','回复内容11','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `comment_reply` values (12,0,'员工姓名12',0,'用户名称12','回复内容12','2025-12-20 17:52:51','2025-12-20 17:52:51');

DROP TABLE IF EXISTS `withdrawal_application`;
CREATE TABLE `withdrawal_application`(withdrawal_application_id int(11) NOT NULL AUTO_INCREMENT COMMENT '提现申请ID',
`housekeeping_staff` int(11) DEFAULT 0 comment '家政员工',
`employee_name` varchar(64) comment '员工姓名',
`withdrawal_amount` int(11) DEFAULT 0 comment '提现金额',
`withdrawal_method` varchar(64) comment '提现方式',
`withdrawal_time` date comment '提现时间',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (withdrawal_application_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '提现申请';
insert into `withdrawal_application` values (1,0,'员工姓名1',1,'提现方式1','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (2,0,'员工姓名2',2,'提现方式2','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (3,0,'员工姓名3',3,'提现方式3','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (4,0,'员工姓名4',4,'提现方式4','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (5,0,'员工姓名5',5,'提现方式5','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (6,0,'员工姓名6',6,'提现方式6','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (7,0,'员工姓名7',7,'提现方式7','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (8,0,'员工姓名8',8,'提现方式8','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (9,0,'员工姓名9',9,'提现方式9','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (10,0,'员工姓名10',10,'提现方式10','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (11,0,'员工姓名11',11,'提现方式11','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `withdrawal_application` values (12,0,'员工姓名12',12,'提现方式12','2025-12-20','未审核','2025-12-20 17:52:51','2025-12-20 17:52:51');

DROP TABLE IF EXISTS `housekeeping_type`;
CREATE TABLE `housekeeping_type`(housekeeping_type_id int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物类型ID',
`housekeeping_type` varchar(64) comment '宠物类型',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (housekeeping_type_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '宠物类型';
insert into `housekeeping_type` values (1,'宠物类型1','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (2,'宠物类型2','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (3,'宠物类型3','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (4,'宠物类型4','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (5,'宠物类型5','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (6,'宠物类型6','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (7,'宠物类型7','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (8,'宠物类型8','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (9,'宠物类型9','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (10,'宠物类型10','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (11,'宠物类型11','2025-12-20 17:52:51','2025-12-20 17:52:51');
insert into `housekeeping_type` values (12,'宠物类型12','2025-12-20 17:52:51','2025-12-20 17:52:51');


insert into `user_group` values ('1','100','管理员',null,'','','0','0','2025-12-20 17:52:51.0','2025-12-20 17:52:51.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2025-12-20 17:52:52.0','2025-12-20 17:52:52.0');
insert into `user_group` values ('3','100','普通用户',null,'regular_users','regular_users_id','0','3','2025-12-20 17:52:52.0','2025-12-20 17:52:52.0');
insert into `user_group` values ('4','100','家政员工',null,'housekeeping_staff','housekeeping_staff_id','0','3','2025-12-20 17:52:52.0','2025-12-20 17:52:52.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1610082106875052032.jpg','913','2025-12-20 17:52:52.0','2025-12-20 17:52:52.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1610082171656077312.jpg','27','2025-12-20 17:52:52.0','2025-12-20 17:52:52.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1610082232452513792.jpg','544','2025-12-20 17:52:52.0','2025-12-20 17:52:52.0');
insert into `article` values ('1','免费小家政 解决大难题','家政','591','0','2025-12-20 17:52:52.0','2025-12-20 17:52:52.0',null,null,null,'<p>“您好爷爷，我是上门给您家免费清洗油烟机的。”下午两点，58同城的全职家电师傅宁洪刚准时到达西城区广内街道感化胡同3号院6号楼的一户人家。</p><p>这是一户独居老人家庭。老人韦有祥今年82岁了，老伴儿马俊艳也83岁了。老两口虽然身体还算硬朗，但清洗油烟机这种比较复杂的家务活儿，老人确实是干不了了。韦有祥仔细回忆了一下，家里的油烟机已经七八年没彻底清洗过了，“平时我只能用抹布擦擦表面。”</p><p>久未清洗的油烟机，已经布满了厚厚的油垢。宁洪刚戴好围裙和手套，先启动油烟机做基础检查，看看油烟机是否有问题，心里大致有数后，开始拆下油烟机的面板。“清洗油烟机也是有口诀的：一铲二刷三泡，得一步一步来，是个细致活儿。”他一边用清洗剂浸泡油烟机的面板，一边用工具铲掉一些油垢。</p><p>“一看就是专业的，我以前也是干维修的，看他这手艺非常好。”韦有祥一直站在旁边观摩，看到宁洪刚专业的手法不禁称赞起来。原来，他以前也曾叫过油烟机厂家的上门清洗服务，花了一二百元的服务费不说，清洗人员的技术也令人担心，洗完以后油烟机的螺丝都少了两颗。从那以后，老爷子就没再叫人来清洗过油烟机。</p><p>清洗油烟机这样的小家政，在韦有祥老人眼里就是一个大难题。2022年冬天，韦有祥听说街道统计独居老人需要的家政服务，看到还有免费上门清洗油烟机这一项，就赶紧报了名想着体验一回。</p><p>这样的上门服务体验，源于58同城本地生活服务免费进社区活动。</p><p>办实事、解难题，积极贯彻落实党的二十大精神与为民办实事结合，作为非公有制经济的企业平台也不能掉队。58同城将保障老百姓生活服务、解决生活问题作为指引，基于平台服务能力，以实际行动解决用户生活中的困难和问题，更好地为群众排忧解难。58同城为此成立了专项小组，发起“服务不间断、温暖送到家”活动，将爱心服务送进社区。</p><p>“居民对我们还比较陌生，所以我们和街道、物业联系，让他们帮忙在中间搭桥。”58同城本地社区服务负责人侯建华说，爱心服务注重线下社区和老人关怀，为社区内的独居老人、低保户等特殊群体提供生活基础保障。小家政服务主动走进社区关心困难群众，免费提供家电清洗、家电维修等，帮助孤寡残困人员解决急难问题。</p><p>爱心服务开展以来，58同城专项小组已经与50多个街道、物业建立了合作，至今已经上门服务500余次，切实解决了一批居民的急难愁盼问题。</p><p><strong>手记</strong></p><p>家电清洗、家电维修，事儿虽不大，对于一些老百姓而言，却是真正的急难愁盼。积极将贯彻落实党的二十大精神与为民办实事相结合，除了办大事，也需要小处着眼，办实事、解难题。</p><p>主要面对年轻受众的互联网企业，将服务的触角延伸到线下社区，尤其是针对老年人等特殊困难群体，提供服务解决急难愁盼的“小事”。这一举措，值得点赞！服务的手法也很巧妙，让街道、物业在中间牵线搭桥，既让老百姓放心，也让服务更顺畅。</p>','/api/upload/1610081988302077953.jpg',null);
insert into `article` values ('2','推进家政服务业“提质扩容”','家政','301','0','2025-12-20 17:52:52.0','2025-12-20 17:52:52.0',null,null,null,'<p class="ql-align-center"><img src="http://ah.anhuinews.com/mssh/202501/W020250103187050488108.jpg" alt="0820250103C_Print-4.jpg"></p><p>1月1日，在安徽皖嫂家政集团，培训老师在线直播教授初级母婴护理的抚触实操课。放心家政行动实施以来，我省各地各部门多措并举持续推进家政服务业“提质扩容”，培训家政服务人员提档升级。</p>','/api/upload/1610081093564760065.jpg',null);
insert into `article` values ('3','怎样能选到靠谱好月嫂？家政中心给出标准','家政','774','0','2025-12-20 17:52:52.0','2025-12-20 17:52:52.0',null,null,null,'<p>月子期间，宝宝的照顾和产后妈妈的照顾尤为重要，需要注意的事项有很多。</p><p>新手爸妈在照料宝宝上，是没有经验的，不能面面俱到，很多家境不错的，会考虑找月嫂来专业照料。</p><p>作为月嫂，是需要具备专业的技能，如医学护理、新生儿知识、常规急救、营养学等培训才能上岗。</p><p>具备这类技能的月嫂，能够科学喂养和照料新生儿，同时还可以为产后妈妈搭配月子餐，帮助产后妈妈更好地恢复身体。</p><p>找一个好月嫂并不容易，在找月嫂时，重点参考以下几点要求：</p><p>1、选择正规、名誉好的家政公司</p><p>这类公司他们对月嫂会进行严格的培训，并要求持证上岗。月嫂工作是需要具备专业性的，没有经过培训的月嫂，是绝对不能胜任的。</p><p>正规名誉好的家政公司有严格的审查流程，每一位月嫂都有身份信息档案，包括身份证、健康证、从业经验、上岗资格证、照片、体检证明等，这些是必要查看的。</p><p>2、多途径了解月嫂背景信息</p><p>除了专业技能上，也要对月嫂的家庭情况有所了解，以及月嫂的性格、工作经验、上份工作的评价等，最好通过其它途径了解这些背景信息，更全面地对月嫂有认识。</p><p><br></p><p>3、提前了解月嫂工作内容</p><p>对月嫂的具体工作内容要提前了解，月嫂能够做哪些事情，也好知道月嫂的价值所在，在面试月嫂时，就能做到心中有数。</p><p>4、签订合同</p><p>签订合同时一定要有的，不要因为是熟人或是朋友介绍，就觉得签不签无所谓了。</p><p>要确约定好工作范围和时间，以免发生纠纷时造成不必要的麻烦，签合同时，要多看条款内容，确认没有问题后再签订。</p><p><br></p><p>5、对月嫂考核</p><p>在雇佣月嫂的过程中，要积极配合家政公司，对月嫂进行评价考核，如果对月嫂的服务不满意，可以对家政公司提出要求进行协商。</p><p>6、善于沟通</p><p>要求月嫂善于沟，这能一定程度上缓解产妇的心理压力，及时发现产妇和宝宝的问题，这都需要月嫂不仅具备好的知识技能，也要具备良好的沟通能力，能及时用语言进行交流。</p><p>已经雇佣的月嫂，如何让自己安心呢？</p><p>1、安装摄像头</p><p>已经在雇佣的月嫂，可以在家安装隐形摄像头，一来可以记录生活，而来可以观察自己看不到的一面，如发现问题，能及时的出面进行处理。</p><p>2、和月嫂建立感情</p><p>在跟月嫂相处的过程中，建议做到跟月嫂愉快相处，不要出现拖欠工资情况，节假日给予小礼物关怀，这能拉近彼此的距离，月嫂也心存感激，能更好的照顾宝宝和妈妈。</p><p>3、发现月嫂消极情绪</p><p>人都会有情绪，要及时发现月嫂情绪不好的状态，进行交涉沟通，问清楚发生了什么，或有什么需要帮助的，月嫂如果在情绪不好的情况下照顾宝宝和妈妈，谁都不敢保证一个人的情绪能做出什么事来，避免一些隐患。</p><p>很多新手父母对于产后护理完全不懂，这就不能很好地照料宝宝了。</p><p>因此，挑选一个专业且负责人的月嫂很重要，她能够照顾宝宝和产后妈妈，能让产后生活更安心。</p><p><br></p>','/api/upload/1610081722039271425.jpg',null);
insert into `article` values ('4','春节临近，家政市场情况如何？来看→','家政','527','0','2025-12-20 17:52:52.0','2025-12-20 17:52:52.0',null,null,null,'<p class="ql-align-justify">眼下，随着春节的临近，家政市场也开启了“春节模式”。以往紧俏的保洁、保姆、老人护理等服务，今年情况如何？一起来看。</p><p class="ql-align-justify">家政员吴阿姨是江苏人，考虑到节前有需求的雇主较多，她打算留沪过年：“客户对我也挺好的，所以我春节继续在这里干。”</p><p class="ql-align-center"><img src="https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2025%2F0101%2F734606e5j00rntbvf000uc000hs00bvg.jpg&amp;thumbnail=660x2147483647&amp;quality=80&amp;type=jpg"></p><p class="ql-align-center">而家政员张师傅则打算过年回安徽老家。“两年没回去过年了，今年想回去看看90多岁的母亲和一些要好的朋友，大家聚一聚。”张师傅说，公司已为他安排好顶替的同事，尽量满足雇主的需求。镇云屏路某家政公司负责人李爱芹表示，针对春节期间的上门服务需求，已提前储备人力，通过“顶岗服务”确保家政服务不停歇：“我们门店有1000多个家政员，80%来自外地，目前30%的客户需要替工阿姨，我们都能安排到位。”</p><p class="ql-align-center">记者从温宿路某家政公司了解到，员工留沪率约30%，负责人提前排摸春节用工需求，根据订单情况合理调配家政人员。<img src="https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2025%2F0101%2F06483b9ej00rntbvf0015c000hs00bvg.jpg&amp;thumbnail=660x2147483647&amp;quality=80&amp;type=jpg"></p><p class="ql-align-center">据了解，受疫情影响，今年春节前钟点工需求量有所下降，月嫂、育儿嫂、住家保姆仍是刚需，整体用工市场较为平稳。</p><p class="ql-align-justify">来源：上海嘉定</p>','/api/upload/1610081435337621504.jpg',null);
insert into `article_type` values ('1','100','家政','0',null,null,null,'2025-12-20 17:52:52.0','2025-12-20 17:52:52.0');
