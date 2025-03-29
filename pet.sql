SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
                              `admin_id` int NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
                              `admin_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员名称',
                              `admin_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员密码',
                              `admin_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理员描述',
                              `admin_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理员电话',
                              `admin_login_cnt` int NOT NULL DEFAULT 0 COMMENT '管理员登录次数',
                              `admin_type` int NOT NULL DEFAULT 0 COMMENT '管理员类型（0-普通管理员，1-超级管理员）',
                              `admin_status` int NOT NULL DEFAULT 1 COMMENT '管理员状态（0-禁用，1-启用）',
                              `admin_login_time` bigint NOT NULL DEFAULT 0 COMMENT '管理员最近登录时间',
                              `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                              `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                              PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

INSERT INTO `admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', NULL, 1, 1, 1, 1735302901541, 0, 1734786380484);

-- ----------------------------
-- Table structure for fav
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE favorite  (
                            `favorite_id` int NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
                            `favorite_user_id` int NOT NULL DEFAULT 0 COMMENT '用户ID',
                            `favorite_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏标题',
                            `favorite_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏类型（如服务、商品等）',
                            `favorite_oid` int NOT NULL DEFAULT 0 COMMENT '收藏对象ID',
                            `favorite_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏对象路径',
                            `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                            `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                            PRIMARY KEY (`favorite_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for reserve
-- ----------------------------
DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve`  (
                             `reserve_id` int NOT NULL AUTO_INCREMENT COMMENT '服务预约ID',
                             `reserve_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务标题',
                             `meet_cate_id` int NOT NULL DEFAULT 0 COMMENT '服务分类ID',
                             `reserve_cate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务分类名称',
                             `reserve_status` int NOT NULL DEFAULT 1 COMMENT '服务状态（0-关闭，1-开启）',
                             `reserve_order` int NOT NULL DEFAULT 9999 COMMENT '服务排序',
                             `reserve_vouch` int NOT NULL DEFAULT 0 COMMENT '服务推荐标识（0-不推荐，1-推荐）',
                             `reserve_days` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务可用日期',
                             `reserve_view_cnt` int NOT NULL DEFAULT 0 COMMENT '服务浏览次数',
                             `reserve_max_cnt` int NOT NULL DEFAULT 0 COMMENT '服务最大预约次数',
                             `reserve_forms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务表单配置',
                             `reserve_obj` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务扩展信息',
                             `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                             `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                             PRIMARY KEY (`reserve_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for reserve_join
-- ----------------------------
DROP TABLE IF EXISTS `reserve_join`;
CREATE TABLE `reserve_join`  (
                                  `reserve_join_id` int NOT NULL AUTO_INCREMENT COMMENT '服务预约ID',
                                  `reserve_join_user_id` int NOT NULL DEFAULT 0 COMMENT '用户ID',
                                  `reserve_join_reserve_id` int NOT NULL DEFAULT 0 COMMENT '服务预约ID',
                                  `reserve_join_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约码',
                                  `reserve_join_is_check` int NOT NULL DEFAULT 0 COMMENT '是否已核验（0-未核验，1-已核验）',
                                  `reserve_join_check_time` bigint NOT NULL DEFAULT 0 COMMENT '核验时间',
                                  `reserve_join_forms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约表单数据',
                                  `reserve_join_obj` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约扩展信息',
                                  `reserve_join_status` int NOT NULL DEFAULT 0 COMMENT '预约状态（0-待确认，1-已确认，2-已取消）',
                                  `reserve_join_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约时间',
                                  `reserve_join_day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约日期',
                                  `reserve_join_reserve_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务标题',
                                  `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                                  `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                                  PRIMARY KEY (`reserve_join_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
                             `news_id` int NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
                             `news_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '新闻标题',
                             `news_cate_id` int NOT NULL DEFAULT 0 COMMENT '新闻分类ID',
                             `news_cate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新闻分类名称',
                             `news_status` int NOT NULL DEFAULT 1 COMMENT '新闻状态（0-禁用，1-启用）',
                             `news_order` int NOT NULL DEFAULT 9999 COMMENT '新闻排序',
                             `news_vouch` int NOT NULL DEFAULT 0 COMMENT '新闻推荐标识（0-不推荐，1-推荐）',
                             `news_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '新闻内容',
                             `news_view_cnt` int NOT NULL DEFAULT 0 COMMENT '新闻浏览次数',
                             `news_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新闻图片',
                             `news_obj` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '新闻扩展信息',
                             `news_forms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '新闻表单配置',
                             `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                             `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                             PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for setup
-- ----------------------------
DROP TABLE IF EXISTS `setup`;
CREATE TABLE `setup`  (
                              `setup_id` int NOT NULL AUTO_INCREMENT COMMENT '系统配置ID',
                              `setup_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置类型',
                              `setup_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置键',
                              `setup_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置值',
                              `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                              `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                              PRIMARY KEY (`setup_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
                             `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                             `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名称',
                             `user_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
                             `user_status` int NOT NULL DEFAULT 1 COMMENT '用户状态（0-禁用，1-启用）',
                             `user_password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
                             `user_login_time` bigint NOT NULL DEFAULT 0 COMMENT '用户最近登录时间',
                             `user_login_cnt` int NOT NULL DEFAULT 0 COMMENT '用户登录次数',
                             `user_obj` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用户扩展信息',
                             `user_forms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用户表单配置',
                             `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                             `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                             PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;