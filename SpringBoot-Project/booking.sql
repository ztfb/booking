/*
 Navicat Premium Data Transfer

 Source Server         : try
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : booking

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 25/05/2023 10:57:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int NOT NULL COMMENT '评价所关联的订单的id',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交用户的手机号',
  `hotel_id` int NOT NULL COMMENT '评论所关联的酒店的id',
  `level` int NULL DEFAULT NULL COMMENT '用户对本次订单的评价分数（分数为1-10）',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户对本次订单的详细评价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, '17835601277', 3, 5, '近海别墅，风景优美，体感良好');
INSERT INTO `comment` VALUES (2, 0, '17835601277', 0, 5, '11111111111111111');
INSERT INTO `comment` VALUES (3, 0, '17835601277', 3, 4, '11111222222');
INSERT INTO `comment` VALUES (4, 0, '17835601277', 3, 7, '333');
INSERT INTO `comment` VALUES (5, 0, '17835601277', 1, 6, '交通便利，地段优渥');
INSERT INTO `comment` VALUES (6, 0, '1234567', 1, 8, '房间面积很大，服务很好，设备齐全');
INSERT INTO `comment` VALUES (7, 0, '1234567777', 1, 5, '配套餐厅别有风味');
INSERT INTO `comment` VALUES (8, 0, '123', 0, 4, '12344444');
INSERT INTO `comment` VALUES (9, 0, '111', 0, 5, '金鹰大酒店');
INSERT INTO `comment` VALUES (10, 0, '17835601277', 3, 8, 'plplppl');
INSERT INTO `comment` VALUES (11, 0, '111', 0, 4, '金鹰大酒店');
INSERT INTO `comment` VALUES (12, 0, '111', 0, 4, '金鹰大酒店');
INSERT INTO `comment` VALUES (13, 0, '111', 0, 5, '金鹰大酒店');
INSERT INTO `comment` VALUES (14, 0, '111', 9, 10, '金鹰大酒店');
INSERT INTO `comment` VALUES (15, 0, '17835601277', 9, 6, '交通便利，地段优渥');
INSERT INTO `comment` VALUES (16, 0, '1234567', 9, 8, '房间面积很大，服务很好，设备齐全');
INSERT INTO `comment` VALUES (17, 0, '1234567777', 9, 5, '配套餐厅别有风味');
INSERT INTO `comment` VALUES (18, 0, '17835601277', 2, 6, '交通便利，地段优渥');
INSERT INTO `comment` VALUES (19, 0, '1234567', 2, 8, '房间面积很大，服务很好，设备齐全');
INSERT INTO `comment` VALUES (20, 0, '1234567777', 2, 5, '配套餐厅别有风味');
INSERT INTO `comment` VALUES (21, 0, '17835601277', 4, 6, '交通便利，地段优渥');
INSERT INTO `comment` VALUES (22, 0, '1234567', 4, 8, '房间面积很大，服务很好，设备齐全');
INSERT INTO `comment` VALUES (23, 0, '1234567777', 4, 5, '配套餐厅别有风味');
INSERT INTO `comment` VALUES (24, 0, '17835601277', 5, 6, '交通便利，地段优渥');
INSERT INTO `comment` VALUES (25, 0, '1234567', 5, 8, '房间面积很大，服务很好，设备齐全');
INSERT INTO `comment` VALUES (26, 0, '1234567777', 5, 5, '配套餐厅别有风味');
INSERT INTO `comment` VALUES (27, 0, '17835601277', 6, 6, '交通便利，地段优渥');
INSERT INTO `comment` VALUES (28, 0, '1234567', 6, 8, '房间面积很大，服务很好，设备齐全');
INSERT INTO `comment` VALUES (29, 0, '1234567777', 6, 5, '配套餐厅别有风味');
INSERT INTO `comment` VALUES (30, 0, '17835601277', 7, 6, '交通便利，地段优渥');
INSERT INTO `comment` VALUES (31, 0, '1234567', 7, 8, '房间面积很大，服务很好，设备齐全');
INSERT INTO `comment` VALUES (32, 0, '1234567777', 7, 5, '配套餐厅别有风味');
INSERT INTO `comment` VALUES (33, 0, '17835601277', 8, 6, '交通便利，地段优渥');
INSERT INTO `comment` VALUES (34, 0, '1234567', 8, 8, '房间面积很大，服务很好，设备齐全');
INSERT INTO `comment` VALUES (35, 0, '1234567777', 8, 5, '配套餐厅别有风味');
INSERT INTO `comment` VALUES (39, 2, '111', 10, 10, '世纪大酒店yyds');
INSERT INTO `comment` VALUES (40, 0, '17835601277', 10, 6, '交通便利，地段优渥');
INSERT INTO `comment` VALUES (41, 0, '1234567', 10, 8, '房间面积很大，服务很好，设备齐全');
INSERT INTO `comment` VALUES (42, 0, '1234567777', 10, 5, '配套餐厅别有风味');
INSERT INTO `comment` VALUES (43, 0, '17835601277', 11, 9, '风景优美');
INSERT INTO `comment` VALUES (44, 0, '1234567', 11, 5, '离旅游区和主干道过近，夜里比较吵闹');
INSERT INTO `comment` VALUES (45, 0, '1234567777', 11, 8, '很有情调');
INSERT INTO `comment` VALUES (46, 0, '233', 1, 9, '味道好极了');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所在地（国家-省份/州-城市）',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国家',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细地址（区-街道-门牌号）',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '酒店名',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '酒店简介',
  `pictures` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '酒店图片（这里存储的是图片路径）',
  `price` double NULL DEFAULT NULL COMMENT '起价（最低价格）',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '酒店类型（民宿/酒店/公寓等）',
  `level` double NULL DEFAULT NULL COMMENT '酒店评分',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'bool数组（0表示不满足，1表示不满足）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (1, '中国-江苏-南京', '中国', '江宁区', '九龙湖宾馆', '低价格高品质', 'https://img2.baidu.com/it/u=3023315476,2636682000&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500;http://t15.baidu.com/it/u=2105943836,1130994114&fm=224&app=112&f=JPEG?w=500&h=351', 120.5, '酒店', 9.8, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (2, '中国-江苏-南京', '中国', '玄武区', '帝豪大酒店', '低价格高品质', 'https://img1.baidu.com/it/u=1667782141,2895461099&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=739;https://img0.baidu.com/it/u=2534126795,695005418&fm=253&fmt=auto&app=138&f=JPEG?w=751&h=500', 120.5, '酒店', 9.8, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (3, '中国-江苏-南京', '中国', '鼓楼区', '金士顿大酒店', '低价格高品质', 'https://img0.baidu.com/it/u=1426937558,3267127347&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=719;https://bkimg.cdn.bcebos.com/pic/342ac65c103853437083642b9213b07eca808868', 120.5, '酒店', 9.8, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (4, '中国-上海', '中国', '黄浦区', '明珠大酒店', '低价格高品质', 'https://img2.baidu.com/it/u=3597284081,2742755643&fm=253&fmt=auto&app=138&f=JPEG?w=751&h=500;https://img1.baidu.com/it/u=3534173301,424748250&fm=253&fmt=auto&app=138&f=JPEG?w=1087&h=500', 120.5, '酒店', 9.8, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (5, '中国-上海', '中国', '徐汇区', '东方大酒店', '低价格高品质', 'https://img2.baidu.com/it/u=2642919068,3786778268&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500;https://img2.baidu.com/it/u=3749421679,3537737434&fm=253&fmt=auto&app=138&f=JPEG?w=666&h=500', 120.5, '酒店', 9.8, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (6, '中国-上海', '中国', '长宁区', '好梦大酒店', '低价格高品质', 'https://img0.baidu.com/it/u=1588648918,3145418101&fm=253&fmt=auto&app=120&f=JPEG?w=747&h=500;https://img2.baidu.com/it/u=3749421679,3537737434&fm=253&fmt=auto&app=138&f=JPEG?w=666&h=500', 120.5, '酒店', 9.8, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (7, '中国-上海', '中国', '静安区', '帝豪大酒店', '低价格高品质', 'https://img2.baidu.com/it/u=368243884,403746902&fm=253&fmt=auto&app=138&f=JPEG?w=728&h=500;https://img0.baidu.com/it/u=2534126795,695005418&fm=253&fmt=auto&app=138&f=JPEG?w=751&h=500', 120.5, '酒店', 9.8, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (8, '法国-巴黎', '法国', '小巴黎区', '劳特大酒店', '低价格高品质', 'https://img2.baidu.com/it/u=2758351702,3228013543&fm=253&fmt=auto&app=138&f=JPEG?w=525&h=350;https://img1.baidu.com/it/u=1383224871,1396082416&fm=253&fmt=auto&app=120&f=JPEG?w=525&h=350', 120.5, '酒店', 9.8, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (9, '中国-江苏-南京', '中国', '江宁区', '金鹰大酒店', '低价格高品质', 'https://img1.baidu.com/it/u=1606284755,638863653&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750;https://img0.baidu.com/it/u=653273968,2002432371&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 120.5, '酒店', 9.8, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (10, '中国-江苏-南京', '中国', '江宁区', '世纪大酒店', '低价格高品质', 'https://img0.baidu.com/it/u=2244503568,2363470320&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=375;https://img1.baidu.com/it/u=3752253727,2200202987&fm=253&fmt=auto&app=138&f=JPEG?w=668&h=500', 120.5, '酒店', 9.8, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (11, '中国-江苏-南京', '中国', '栖霞区', '锦绣山居', '瑰丽风光，舒适体验', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F2ca8c5a4-8498-4034-a5f5-397d8dc52a71%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1687574229&t=abf21d542e1b7de3b4a93c1399b28dd5;https://img2.baidu.com/it/u=3997793973,1057249499&fm=253&fmt=auto&app=138&f=JPEG?w=771&h=500', 150, '民宿', 9.3, '1-1-0-0-1');
INSERT INTO `hotel` VALUES (12, '日本-东京', '日本', '足立区', '居酒屋', '有樱花', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F2ca8c5a4-8498-4034-a5f5-397d8dc52a71%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1687574229&t=abf21d542e1b7de3b4a93c1399b28dd5;https://img2.baidu.com/it/u=3997793973,1057249499&fm=253&fmt=auto&app=138&f=JPEG?w=771&h=500', 250, '酒店', 8.6, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (13, '日本-东京', '日本', '文京区', '艾森大酒店', '有樱花', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F2ca8c5a4-8498-4034-a5f5-397d8dc52a71%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1687574229&t=abf21d542e1b7de3b4a93c1399b28dd5;https://img2.baidu.com/it/u=3997793973,1057249499&fm=253&fmt=auto&app=138&f=JPEG?w=771&h=500', 250, '酒店', 8.6, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (14, '日本-东京', '日本', '江户川区', '樱田代', '有樱花', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F88a03b9a-6be4-4da5-bbf5-6e455a38e45f%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1687574980&t=7bf78568b128e69b4bc655e91a1c84cd;https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F2ca8c5a4-8498-4034-a5f5-397d8dc52a71%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1687574229&t=abf21d542e1b7de3b4a93c1399b28dd5', 250, '民宿', 8.6, '0-1-0-1-0');
INSERT INTO `hotel` VALUES (15, '日本-东京', '日本', '千代田区', '富士山居', '有樱花', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F7264701a-798c-4a76-a97c-14ec129bb57b%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1687574619&t=798a02bd26ef66ccfe0abda6b1152bfa;https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F18e31a77-b479-4a18-8649-5b1a990da0f3%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1687574638&t=c4f9518559b82767309f75c6d1fa6b98', 2450, '民宿', 8.6, '0-1-0-1-0');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '创建订单的用户的id',
  `hotel_id` int NOT NULL COMMENT '订单关联的酒店的id',
  `room_id` int NOT NULL COMMENT '订单关联的房间id',
  `creation_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `amount` double NULL DEFAULT NULL COMMENT '订单交易额',
  `number` int NULL DEFAULT NULL COMMENT '住店人数',
  `start_time` datetime NULL DEFAULT NULL COMMENT '预定的房间生效时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '预定的房间结束时间',
  `has_comment` int NOT NULL COMMENT '是否有评论',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `special_ask` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '特殊要求',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 5, 3, 10, '2023-05-13 21:06:25', 360, 3, '2023-05-14 21:06:35', '2023-05-16 21:06:41', 0, NULL, NULL);
INSERT INTO `order` VALUES (2, 5, 7, 24, '2023-05-19 20:18:27', 720, 5, '2023-05-20 20:18:39', '2023-05-21 20:18:45', 0, NULL, NULL);
INSERT INTO `order` VALUES (3, 3, 1, 4, '2023-05-24 23:08:05', 300.5, 2, '2023-05-24 20:00:00', '2023-05-25 20:00:00', 0, NULL, NULL);
INSERT INTO `order` VALUES (4, 3, 1, 4, '2023-05-24 23:08:05', 300.5, 2, '2023-05-24 20:00:00', '2023-05-25 20:00:00', 0, NULL, NULL);
INSERT INTO `order` VALUES (5, 5, 1, 4, '2023-05-23 20:24:36', 120, 1, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, 'ml_luo@yeah.net', '');
INSERT INTO `order` VALUES (7, 5, 1, 4, '2023-05-23 20:33:43', 120, 1, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, 'eschen@126.com', '');
INSERT INTO `order` VALUES (8, 3, 1, 4, '2023-05-23 20:42:13', 360, 3, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '2720611814@qq.com', '');
INSERT INTO `order` VALUES (9, 3, 1, 5, '2023-05-23 20:42:13', 360, 3, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '2720611814@qq.com', '');
INSERT INTO `order` VALUES (10, 3, 1, 5, '2023-05-23 20:43:32', 360, 3, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '2720611814@qq.com', '');
INSERT INTO `order` VALUES (11, 3, 1, 4, '2023-05-23 20:43:32', 360, 3, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '2720611814@qq.com', '');
INSERT INTO `order` VALUES (12, 3, 1, 5, '2023-05-23 20:43:50', 360, 3, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (13, 3, 1, 4, '2023-05-23 20:43:50', 360, 3, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (14, 3, 1, 4, '2023-05-23 20:44:09', 360, 3, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (15, 3, 1, 5, '2023-05-23 20:44:09', 360, 3, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (16, 3, 1, 4, '2023-05-23 20:46:23', 120, 1, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (17, 3, 1, 5, '2023-05-23 20:46:23', 120, 1, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (18, 3, 1, 5, '2023-05-23 20:50:40', 240, 2, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (19, 3, 1, 4, '2023-05-23 20:50:40', 240, 2, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (20, 3, 1, 4, '2023-05-23 20:53:47', 240, 2, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (21, 3, 1, 5, '2023-05-23 20:53:47', 240, 2, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (22, 3, 1, 5, '2023-05-23 20:58:03', 240, 2, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (23, 3, 1, 4, '2023-05-23 20:58:03', 240, 2, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (24, 3, 1, 4, '2023-05-23 21:00:18', 240, 2, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (25, 3, 1, 5, '2023-05-23 21:00:18', 240, 2, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (26, 3, 1, 4, '2023-05-23 21:07:43', 120, 1, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (27, 3, 1, 4, '2023-05-23 21:08:24', 120, 1, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (28, 3, 1, 4, '2023-05-23 21:10:25', 120, 1, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (29, 5, 1, 4, '2023-05-23 21:50:37', 120, 1, '2023-05-23 20:00:00', '2023-05-23 20:00:00', 0, '1357738012@qq.com', '');
INSERT INTO `order` VALUES (30, 5, 3, 11, '2023-05-25 17:06:48', 120, 1, '2023-05-25 20:00:00', '2023-05-25 20:00:00', 0, '1357738012@qq.com', '');
INSERT INTO `order` VALUES (31, 3, 1, 4, '2023-05-25 17:45:21', 120, 1, '2023-05-25 20:00:00', '2023-05-25 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (32, 3, 1, 5, '2023-05-25 17:45:21', 120, 1, '2023-05-25 20:00:00', '2023-05-25 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (33, 3, 1, 4, '2023-05-25 18:18:23', 240, 2, '2023-05-25 20:00:00', '2023-05-25 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (34, 3, 1, 5, '2023-05-25 18:18:23', 240, 2, '2023-05-25 20:00:00', '2023-05-25 20:00:00', 0, '1111@123.com', '');
INSERT INTO `order` VALUES (35, 12, 9, 29, '2023-05-25 18:22:41', 120, 1, '2023-05-25 20:00:00', '2023-05-25 20:00:00', 0, '2720611814@qq.com', '');
INSERT INTO `order` VALUES (36, 12, 9, 28, '2023-05-25 18:22:41', 120, 1, '2023-05-25 20:00:00', '2023-05-25 20:00:00', 0, '2720611814@qq.com', '');
INSERT INTO `order` VALUES (37, 12, 10, 31, '2023-05-25 18:33:21', 120, 1, '2023-05-25 20:00:00', '2023-05-25 20:00:00', 0, '2720611814@qq.com', '');
INSERT INTO `order` VALUES (38, 13, 1, 5, '2023-05-25 18:40:44', 120, 1, '2023-05-25 20:00:00', '2023-05-25 20:00:00', 0, '1357738012@qq.com', '');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `hotel_id` int NOT NULL COMMENT '所属酒店的id',
  `price` double NULL DEFAULT NULL COMMENT '房间价格',
  `room_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '房间类型（单人间，双人间等）',
  `bed_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '床型（大床，双人床等）',
  `max_capacity` int NULL DEFAULT NULL COMMENT '每日最大预定量',
  `number` int NULL DEFAULT NULL COMMENT '房间可住人数',
  `available` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '房间剩余量（数组，以逗号分割）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (4, 1, 120, '双人间', '大床', 3, 2, '3-4-3');
INSERT INTO `room` VALUES (5, 1, 120, '双人间', '双床', 2, 2, '2-4-3');
INSERT INTO `room` VALUES (6, 1, 120, '单人间', '大床', 5, 1, '1-0-3');
INSERT INTO `room` VALUES (7, 2, 120, '双人间', '大床', 3, 2, '1-2-0');
INSERT INTO `room` VALUES (8, 2, 120, '双人间', '双床', 2, 2, '1-2-1');
INSERT INTO `room` VALUES (9, 2, 120, '单人间', '大床', 5, 1, '1-0-3');
INSERT INTO `room` VALUES (10, 3, 120, '双人间', '大床', 3, 2, '1-2-0');
INSERT INTO `room` VALUES (11, 3, 120, '双人间', '双床', 2, 2, '1-2-1');
INSERT INTO `room` VALUES (12, 3, 120, '单人间', '大床', 5, 1, '1-0-3');
INSERT INTO `room` VALUES (13, 4, 120, '双人间', '大床', 3, 2, '1-2-0');
INSERT INTO `room` VALUES (14, 4, 120, '双人间', '双床', 2, 2, '1-2-1');
INSERT INTO `room` VALUES (15, 4, 120, '单人间', '大床', 5, 1, '1-0-3');
INSERT INTO `room` VALUES (16, 5, 120, '双人间', '大床', 3, 2, '1-2-0');
INSERT INTO `room` VALUES (17, 5, 120, '双人间', '双床', 2, 2, '1-2-1');
INSERT INTO `room` VALUES (18, 5, 120, '单人间', '大床', 5, 1, '1-0-3');
INSERT INTO `room` VALUES (19, 6, 120, '双人间', '大床', 3, 2, '1-2-0');
INSERT INTO `room` VALUES (20, 6, 120, '双人间', '双床', 2, 2, '1-2-1');
INSERT INTO `room` VALUES (21, 6, 120, '单人间', '大床', 5, 1, '1-0-3');
INSERT INTO `room` VALUES (22, 7, 120, '双人间', '大床', 3, 2, '1-2-0');
INSERT INTO `room` VALUES (23, 7, 120, '双人间', '双床', 2, 2, '1-2-1');
INSERT INTO `room` VALUES (24, 7, 120, '单人间', '大床', 5, 1, '1-0-3');
INSERT INTO `room` VALUES (25, 8, 120, '双人间', '大床', 3, 2, '1-2-0');
INSERT INTO `room` VALUES (26, 8, 120, '双人间', '双床', 2, 2, '1-2-1');
INSERT INTO `room` VALUES (27, 8, 120, '单人间', '大床', 5, 1, '1-0-3');
INSERT INTO `room` VALUES (28, 9, 120, '双人间', '大床', 3, 2, '0-2-0');
INSERT INTO `room` VALUES (29, 9, 120, '双人间', '双床', 2, 2, '0-2-1');
INSERT INTO `room` VALUES (30, 9, 120, '单人间', '大床', 5, 1, '1-0-3');
INSERT INTO `room` VALUES (31, 10, 120, '双人间', '大床', 3, 2, '0-2-0');
INSERT INTO `room` VALUES (32, 10, 120, '双人间', '双床', 2, 2, '1-2-1');
INSERT INTO `room` VALUES (33, 10, 120, '单人间', '大床', 5, 1, '1-0-3');
INSERT INTO `room` VALUES (34, 15, 300.5, '双人间', '大床', 5, 2, '3-4-2');
INSERT INTO `room` VALUES (35, 15, 300.5, '双人间', '双人床', 5, 2, '3-4-2');
INSERT INTO `room` VALUES (36, 15, 300.5, '单人间', '大床', 5, 2, '3-4-2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户手机号（同时用来登录）',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123456789', '$2a$10$L6o.2kBvtxeFsLP6mdcmLe.9XQsNtahtrTmQNEC73ubE.ZcYIoyMG');
INSERT INTO `user` VALUES (2, '1234567890', '$2a$10$7QSlPwFch0.9sMR2Bgs9/uy4rxu.27T4s4GQP9qIO7wyrhYs9miAm');
INSERT INTO `user` VALUES (3, '123', '$2a$10$hgJLwPUDdRKJK1mmkcYE9uB1iqIkbLBD0xPCwEM3LVYSmLnSdOfaG');
INSERT INTO `user` VALUES (5, '17835601277', '$2a$10$QMPacoAjMe/CXKJEH9C3SOiwxNY8pex/v1fEPHMfC3KbOVOS44Dgm');
INSERT INTO `user` VALUES (6, '1234567', '$2a$10$vGLzJCgapXgxcTQqoR5Haefi/looIiKNPZVbtg59LNmp/ahgPsrwi');
INSERT INTO `user` VALUES (7, '1234567777', '$2a$10$IcTcEVdWSreu8jbTSRWSRuyYKn9VETX0Cbxosc4K7sj7UjCRCdnkC');
INSERT INTO `user` VALUES (8, '1234', '$2a$10$1tPZ/IHTYYndi7qBdDuZG.SEERVRoVRk6Emf9hJtRctDPuumjyC5q');
INSERT INTO `user` VALUES (9, '12345', '$2a$10$u7bWEe88WU4Dszqrruc6me3mg9J274bzty/oREsR5Kk8Hc1A/GqSC');
INSERT INTO `user` VALUES (10, '123456', '$2a$10$3nAJ9n9fOgjdwduRuUEGcOCe1eWm.em4aw.vwgD801PYG8Nst93su');
INSERT INTO `user` VALUES (11, '111111', '$2a$10$ZxdLkixm09z7RFPgBsB6xOJnmxKKBrP2tq6NDsHqii6k42BSgx9XK');
INSERT INTO `user` VALUES (12, '111', '$2a$10$k9LJ/VRzaq7RMBHiAJVsge5UtrwTc/G5wu5GKSpoXE6VP2mygbkmm');
INSERT INTO `user` VALUES (13, '233', '$2a$10$sidtDMyCu7.q0JmpfYy/K.kMkoNuAwwHh5gwC1uUsX4aHA.rZzuUu');

SET FOREIGN_KEY_CHECKS = 1;
