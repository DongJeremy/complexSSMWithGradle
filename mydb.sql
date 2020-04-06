/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.202
 Source Server Type    : MySQL
 Source Server Version : 50564
 Source Host           : 192.168.1.202:3306
 Source Schema         : mydb

 Target Server Type    : MySQL
 Target Server Version : 50564
 File Encoding         : 65001

 Date: 06/04/2020 20:42:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (1, '第一开发部', 'dept01');
INSERT INTO `t_dept` VALUES (2, '第二开发部', 'dept02');
INSERT INTO `t_dept` VALUES (3, '第三开发部', 'dept03');
INSERT INTO `t_dept` VALUES (4, '系统部', 'dept04');
INSERT INTO `t_dept` VALUES (5, '管理部', 'dept05');

-- ----------------------------
-- Table structure for t_emp
-- ----------------------------
DROP TABLE IF EXISTS `t_emp`;
CREATE TABLE `t_emp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `age` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `salary` int(11) NULL DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_emp_ibfk_1`(`department`) USING BTREE,
  CONSTRAINT `t_emp_ibfk_1` FOREIGN KEY (`department`) REFERENCES `t_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_emp
-- ----------------------------
INSERT INTO `t_emp` VALUES (1, '宋江', '吉林', 43, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (2, '卢俊义', '吉林', 42, 2, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (3, '吴用', '吉林', 41, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (4, '公孙胜', '北京', 40, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (5, '关胜', '北京', 39, 2, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (6, '林冲', '北京', 38, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (7, '秦明', '北京', 34, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (8, '呼延灼', '上海', 25, 2, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (9, '花荣', '上海', 24, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (10, '柴进', '上海', 27, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (11, '李应', '北京', 25, 2, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (12, '朱仝', '上海', 24, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (13, '鲁智深', '上海', 27, 5, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (14, '武松', '上海', 29, 4, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (15, '董平', '上海', 24, 4, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (16, '张清', '山东', 33, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (17, '杨志', '山东', 25, 5, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (18, '徐宁', '山东', 24, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (19, '索超', '山东', 26, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (20, '戴宗', '成都', 25, 2, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (21, '刘唐', '成都', 24, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (22, '李逵', '成都', 23, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (23, '史进', '成都', 25, 2, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (24, '穆弘', '成都', 24, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (25, '雷横', '大连', 23, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (26, '李俊', '成都', 25, 2, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (27, '阮小二', '大连', 24, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (28, '张横', '大连', 24, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (29, '阮小五', '大连', 23, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (30, '张顺', '成都', 25, 2, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (31, '阮小七', '成都', 24, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (32, '杨雄', '成都', 24, 3, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (33, '石秀', '大连', 23, 1, 4000, '13888883345');
INSERT INTO `t_emp` VALUES (34, '解珍', '大连', 25, 2, 2000, '13888883343');
INSERT INTO `t_emp` VALUES (35, '解宝', '大连', 24, 5, 3000, '13888883348');
INSERT INTO `t_emp` VALUES (36, '燕青', '大连', 24, 3, 3000, '13888883348');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES (1, 'zhangsan', 'jilin', 23);
INSERT INTO `t_employee` VALUES (2, 'lisi', 'beijing', 26);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '人事管理', '#', 'layui-icon-picker-securityscan', 1, 0);
INSERT INTO `t_menu` VALUES (2, '雇员管理', '/admin/empView', NULL, 1, 1);
INSERT INTO `t_menu` VALUES (3, '部门管理', '/admin/deptView', NULL, 1, 1);
INSERT INTO `t_menu` VALUES (4, '系统管理', '#', 'layui-icon-picker-control', 1, 0);
INSERT INTO `t_menu` VALUES (5, '系统信息', '/admin/systemInfo', 'null', 1, 4);
INSERT INTO `t_menu` VALUES (6, '在线用户', '/admin/userOnline', NULL, 1, 4);
INSERT INTO `t_menu` VALUES (7, '操作日志', '/admin/syslog', NULL, 1, 4);
INSERT INTO `t_menu` VALUES (8, '用户管理', '/admin/userView', NULL, 1, 4);

SET FOREIGN_KEY_CHECKS = 1;
