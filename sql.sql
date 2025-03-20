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

CREATE TABLE `auth` (
                        `auth_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
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
                        PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';

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

CREATE TABLE `notice` (
                          `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
                          `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
                          `content` longtext COMMENT '正文：',
                          `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                          `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                          PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';

CREATE TABLE `sensitive_vocabulary` (
                                        `sensitive_vocabulary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '敏感词汇ID',
                                        `sensitive_vocabulary` varchar(64) DEFAULT NULL COMMENT '敏感词汇',
                                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        PRIMARY KEY (`sensitive_vocabulary_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='敏感词汇';

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

CREATE TABLE `praise` (
                          `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
                          `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
                          `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                          `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                          `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
                          `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
                          `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
                          `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1点赞，0已取消',
                          PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';

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

CREATE TABLE `regular_users` (
                                 `regular_users_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '普通用户ID',
                                 `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
                                 `user_gender` varchar(64) DEFAULT NULL COMMENT '用户性别',
                                 `contact_number` varchar(64) DEFAULT NULL COMMENT '联系电话',
                                 `examine_state` varchar(16) NOT NULL DEFAULT '已通过' COMMENT '审核状态',
                                 `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 PRIMARY KEY (`regular_users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='普通用户';

CREATE TABLE `petbacker_staff` (
                                   `petbacker_staff_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '家政员工ID',
                                   `staff_name` varchar(64) DEFAULT NULL COMMENT '员工姓名',
                                   `staff_gender` varchar(64) DEFAULT NULL COMMENT '员工性别',
                                   `contact_phone_number` varchar(64) DEFAULT NULL COMMENT '联系电话',
                                   `examine_state` varchar(16) NOT NULL DEFAULT '未审核' COMMENT '审核状态',
                                   `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   PRIMARY KEY (`petbacker_staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家政员工';

CREATE TABLE `pet_services` (
                                `pet_services_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '家政服务ID',
                                `pet_service_users` int(11) DEFAULT '0' COMMENT '家政用户',
                                `staff_name` varchar(64) DEFAULT NULL COMMENT '员工名称',
                                `petbacker_name` varchar(64) DEFAULT NULL COMMENT '家政名称',
                                `petbacker_photos` varchar(255) DEFAULT NULL COMMENT '家政照片',
                                `pet_type` varchar(64) DEFAULT NULL COMMENT '宠物类型',
                                `service_scope` varchar(64) DEFAULT NULL COMMENT '服务范围',
                                `service_time` date DEFAULT NULL COMMENT '服务时间',
                                `service_fees` int(11) DEFAULT '0' COMMENT '服务费用',
                                `personal_profile` text COMMENT '个人简介',
                                `introduction_to_pet_economics` text COMMENT '家政介绍',
                                `contact_information` varchar(64) DEFAULT NULL COMMENT '联系方式',
                                `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
                                `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                PRIMARY KEY (`pet_services_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家政服务';

CREATE TABLE `appointment` (
                               `appointment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约家政ID',
                               `appointment_users` int(11) DEFAULT '0' COMMENT '预约用户',
                               `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
                               `pet_service_users` int(11) DEFAULT '0' COMMENT '家政用户',
                               `staff_name` varchar(64) DEFAULT NULL COMMENT '员工名称',
                               `petbacker_name` varchar(64) DEFAULT NULL COMMENT '家政名称',
                               `pet_type` varchar(64) DEFAULT NULL COMMENT '宠物类型',
                               `service_fees` varchar(64) DEFAULT NULL COMMENT '服务费用',
                               `home_visit_time` datetime DEFAULT NULL COMMENT '上门时间',
                               `matters_needing_attention` text COMMENT '注意事项',
                               `examine_state` varchar(16) NOT NULL DEFAULT '未审核' COMMENT '审核状态',
                               `pay_state` varchar(16) NOT NULL DEFAULT '未支付' COMMENT '支付状态',
                               `pay_type` varchar(16) DEFAULT '' COMMENT '支付类型: 微信、支付宝、网银',
                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                               PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约家政';

CREATE TABLE `customization` (
                                 `customization_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '家政定制ID',
                                 `customized_users` int(11) DEFAULT '0' COMMENT '定制用户',
                                 `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
                                 `petbacker_name` varchar(64) DEFAULT NULL COMMENT '家政名称',
                                 `petbacker_photos` varchar(255) DEFAULT NULL COMMENT '家政照片',
                                 `petbacker_address` varchar(64) DEFAULT NULL COMMENT '家政地址',
                                 `service_fees` int(11) DEFAULT '0' COMMENT '服务费用',
                                 `home_visit_time` date DEFAULT NULL COMMENT '上门时间',
                                 `pet_economics_content` text COMMENT '家政内容',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 PRIMARY KEY (`customization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家政定制';

CREATE TABLE `orders` (
                          `orders_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '家政接单ID',
                          `pet_service_users` int(11) DEFAULT '0' COMMENT '家政用户',
                          `staff_name` varchar(64) DEFAULT NULL COMMENT '员工名称',
                          `customized_users` int(11) DEFAULT '0' COMMENT '定制用户',
                          `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
                          `petbacker_name` varchar(64) DEFAULT NULL COMMENT '家政名称',
                          `petbacker_address` varchar(64) DEFAULT NULL COMMENT '家政地址',
                          `service_fees` varchar(64) DEFAULT NULL COMMENT '服务费用',
                          `home_visit_time` varchar(64) DEFAULT NULL COMMENT '上门时间',
                          `pet_economics_content` varchar(64) DEFAULT NULL COMMENT '家政内容',
                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                          `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                          PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家政接单';

CREATE TABLE `evaluation` (
                              `evaluation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '售后评价ID',
                              `appointment_users` int(11) DEFAULT '0' COMMENT '预约用户',
                              `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
                              `pet_service_users` int(11) DEFAULT '0' COMMENT '家政用户',
                              `staff_name` varchar(64) DEFAULT NULL COMMENT '员工姓名',
                              `petbacker_name` varchar(64) DEFAULT NULL COMMENT '家政名称',
                              `pet_economics_pictures` varchar(255) DEFAULT NULL COMMENT '家政图片',
                              `pet_type` varchar(64) DEFAULT NULL COMMENT '宠物类型',
                              `service_attitude` varchar(64) DEFAULT NULL COMMENT '服务态度',
                              `service_achievements` text COMMENT '服务成果',
                              `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
                              `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                              PRIMARY KEY (`evaluation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='售后评价';

CREATE TABLE `comment_reply` (
                                 `comment_reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复ID',
                                 `pet_service_users` int(11) DEFAULT '0' COMMENT '家政用户',
                                 `staff_name` varchar(64) DEFAULT NULL COMMENT '员工姓名',
                                 `appointment_users` int(11) DEFAULT '0' COMMENT '预约用户',
                                 `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
                                 `reply_content` text COMMENT '回复内容',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 PRIMARY KEY (`comment_reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论回复';

CREATE TABLE `withdrawal` (
                              `withdrawal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现申请ID',
                              `petbacker_staff` int(11) DEFAULT '0' COMMENT '家政员工',
                              `staff_name` varchar(64) DEFAULT NULL COMMENT '员工姓名',
                              `withdrawal_amount` int(11) DEFAULT '0' COMMENT '提现金额',
                              `withdrawal_method` varchar(64) DEFAULT NULL COMMENT '提现方式',
                              `withdrawal_time` date DEFAULT NULL COMMENT '提现时间',
                              `examine_state` varchar(16) NOT NULL DEFAULT '未审核' COMMENT '审核状态',
                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                              PRIMARY KEY (`withdrawal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现申请';

CREATE TABLE `pet_type` (
                            `pet_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物类型ID',
                            `pet_type` varchar(64) DEFAULT NULL COMMENT '宠物类型',
                            `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                            PRIMARY KEY (`pet_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宠物类型';