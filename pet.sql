SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pet_admin
-- ----------------------------
DROP TABLE IF EXISTS `pet_admin`;
CREATE TABLE `pet_admin`  (
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

INSERT INTO `pet_admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', NULL, 1, 1, 1, 1735302901541, 0, 1734786380484);

-- ----------------------------
-- Table structure for pet_fav
-- ----------------------------
DROP TABLE IF EXISTS `pet_fav`;
CREATE TABLE `pet_fav`  (
                            `fav_id` int NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
                            `fav_user_id` int NOT NULL DEFAULT 0 COMMENT '用户ID',
                            `fav_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏标题',
                            `fav_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏类型（如服务、商品等）',
                            `fav_oid` int NOT NULL DEFAULT 0 COMMENT '收藏对象ID',
                            `fav_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏对象路径',
                            `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                            `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                            PRIMARY KEY (`fav_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pet_meet
-- ----------------------------
DROP TABLE IF EXISTS `pet_meet`;
CREATE TABLE `pet_meet`  (
                             `meet_id` int NOT NULL AUTO_INCREMENT COMMENT '服务预约ID',
                             `meet_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务标题',
                             `meet_cate_id` int NOT NULL DEFAULT 0 COMMENT '服务分类ID',
                             `meet_cate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务分类名称',
                             `meet_status` int NOT NULL DEFAULT 1 COMMENT '服务状态（0-关闭，1-开启）',
                             `meet_order` int NOT NULL DEFAULT 9999 COMMENT '服务排序',
                             `meet_vouch` int NOT NULL DEFAULT 0 COMMENT '服务推荐标识（0-不推荐，1-推荐）',
                             `meet_days` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务可用日期',
                             `meet_view_cnt` int NOT NULL DEFAULT 0 COMMENT '服务浏览次数',
                             `meet_max_cnt` int NOT NULL DEFAULT 0 COMMENT '服务最大预约次数',
                             `meet_forms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务表单配置',
                             `meet_obj` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务扩展信息',
                             `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                             `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                             PRIMARY KEY (`meet_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pet_meet_join
-- ----------------------------
DROP TABLE IF EXISTS `pet_meet_join`;
CREATE TABLE `pet_meet_join`  (
                                  `meet_join_id` int NOT NULL AUTO_INCREMENT COMMENT '服务预约参与ID',
                                  `meet_join_user_id` int NOT NULL DEFAULT 0 COMMENT '用户ID',
                                  `meet_join_meet_id` int NOT NULL DEFAULT 0 COMMENT '服务预约ID',
                                  `meet_join_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约码',
                                  `meet_join_is_check` int NOT NULL DEFAULT 0 COMMENT '是否已核验（0-未核验，1-已核验）',
                                  `meet_join_check_time` bigint NOT NULL DEFAULT 0 COMMENT '核验时间',
                                  `meet_join_forms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约表单数据',
                                  `meet_join_obj` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约扩展信息',
                                  `meet_join_status` int NOT NULL DEFAULT 0 COMMENT '预约状态（0-待确认，1-已确认，2-已取消）',
                                  `meet_join_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约时间',
                                  `meet_join_day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约日期',
                                  `meet_join_meet_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '服务标题',
                                  `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                                  `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                                  PRIMARY KEY (`meet_join_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pet_news
-- ----------------------------
DROP TABLE IF EXISTS `pet_news`;
CREATE TABLE `pet_news`  (
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
-- Table structure for pet_setup
-- ----------------------------
DROP TABLE IF EXISTS `pet_setup`;
CREATE TABLE `pet_setup`  (
                              `setup_id` int NOT NULL AUTO_INCREMENT COMMENT '系统配置ID',
                              `setup_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置类型',
                              `setup_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置键',
                              `setup_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置值',
                              `add_time` bigint NOT NULL DEFAULT 0 COMMENT '添加时间',
                              `edit_time` bigint NOT NULL DEFAULT 0 COMMENT '编辑时间',
                              PRIMARY KEY (`setup_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for pet_user
-- ----------------------------
DROP TABLE IF EXISTS `pet_user`;
CREATE TABLE `pet_user`  (
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