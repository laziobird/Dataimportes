/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.184
 Source Server Type    : MySQL
 Source Server Version : 50633
 Source Host           : 192.168.1.184
 Source Database       : irenshi

 Target Server Type    : MySQL
 Target Server Version : 50633
 File Encoding         : utf-8

 Date: 12/13/2019 15:28:44 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tab_staff_location`
-- ----------------------------
DROP TABLE IF EXISTS `tab_staff_location`;
CREATE TABLE `tab_staff_location` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  `companyId` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double DEFAULT NULL,
  `locationName` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locationTime` datetime NOT NULL,
  `longitude` double DEFAULT NULL,
  `radius` double DEFAULT NULL,
  `staffId` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staffName` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `altitude` double DEFAULT NULL,
  `direction` double DEFAULT NULL,
  `speed` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tab_staff_location_companyId_staffId_unique` (`companyId`,`staffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `tab_staff_location`
-- ----------------------------
BEGIN;
INSERT INTO `tab_staff_location` VALUES ('913e0261-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.760476', '\r\n塔城第四中学', '2017-08-31 06:26:05', '82.978521', '200', '6ff59640-ef2a-48ff-b883-a700af9ad811', '杜1泽兵', null, null, null), ('914462d1-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.759389', '\r\n塔城市第六中学', '2017-08-31 06:26:05', '82.974856', '200', '6ff59640-ef2a-48ff-b883-a700af9ad84', '杜泽3兵', null, null, null), ('914ac114-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.751931', '\r\n中等职业技术学校', '2017-08-31 06:26:05', '82.96422', '200', '6ff59640-ef2a-48ff-b883-a700af9ad85', '杜泽2兵', null, null, null), ('9151256a-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.749609', '\r\n花溪家园', '2017-08-31 06:26:05', '82.965298', '200', '6ff59640-ef2a-48ff-b883-a700af9ad83', '杜泽4兵', null, null, null), ('91578712-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.750301', '西部大厦', '2017-08-31 06:26:05', '82.96961', '200', '6ff59640-ef2a-48ff-b883-a700af9ad86', '杜泽5兵', null, null, null), ('915de969-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.753857', '塔城地区粮食局', '2017-08-31 06:26:05', '82.982186', '200', '6ff59640-ef2a-48ff-b883-a700af9ad82', '杜泽6兵', null, null, null), ('916aa71b-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.753907', '塔城市城乡建设局', '2017-08-31 06:26:05', '82.984342', '200', '6ff59640-ef2a-48ff-b883-a700af9ad845', '杜8泽兵', null, null, null), ('917107f6-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '31.221643', '上海市长宁区延安西路728号14B室', '2017-08-31 06:26:05', '121.440383', '40', '6ff59640-ef2a-48ff-b883-a700af9ad815', '杜泽兵', '5e-324', '-1', '0'), ('91776913-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.750745', '塔城市回族清真寺', '2017-08-31 06:26:05', '82.995194', '200', '6ff59640-ef2a-48ff-b883-a700af9ad832', '杜泽32兵', null, null, null), ('917dcada-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.753363', '塔城市妇幼保健院', '2017-08-31 06:26:05', '82.99735', '200', '6ff59640-ef2a-48ff-b883-a700af9ad843', '杜泽11兵', null, null, null), ('91842c78-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.745706', '黎明农贸市场', '2017-08-31 06:26:05', '82.987504', '200', '6ff59640-ef2a-48ff-b883-a700af9ad856', '杜泽42兵', null, null, null), ('918a8a8b-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:13', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.744471', '\r\n昆仑好客', '2017-08-31 06:26:05', '83.005327', '200', '6ff59640-ef2a-48ff-b883-a700af9ad824', '杜泽43兵', null, null, null), ('9190ef74-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:14', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.746349', '港务宾馆', '2017-08-31 06:26:05', '83.013879', '200', '6ff59640-ef2a-48ff-b883-a7003af9ad86', '杜泽45兵', null, null, null), ('91974e64-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:14', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.755537', '塔城地区老年公寓', '2017-08-31 06:26:05', '83.011148', '200', '6ff59640-ef2a-48ff-b883-a7300af9ad8', '杜泽12兵', null, null, null), ('919daf1b-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:14', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.761661', '\r\n塔城市第二小学', '2017-08-31 06:26:05', '83.005255', '200', '6ff59640-ef2a-48ff-b883-a70240af9ad8', '杜泽123兵', null, null, null), ('91a40fa2-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:14', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.742001', '\r\n塔城市职业高中', '2017-08-31 06:26:05', '82.997278', '200', '6ff59640-ef2a-48ff-b883-a2700af9ad8', '杜泽兵545', null, null, null), ('91a92b27-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:14', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.745805', '\r\n塔城市一中', '2017-08-31 06:26:05', '83.019197', '200', '6ff59640-ef2a-48ff-b88133-a700af9ad8', '杜泽兵56', null, null, null), ('91ae4382-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:14', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.748671', '\r\n塔城黎兴宾馆', '2017-08-31 06:26:05', '83.041331', '200', '6ff59640-ef2a-448ff-b883-a700af9ad8', '杜34泽兵', null, null, null), ('91b4a1df-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:14', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.735331', '绿色家园', '2017-08-31 06:26:05', '82.989588', '200', '6ff59640-ef2a-485ff-b883-a700af9ad8', '杜2泽兵', null, null, null), ('91b9bed6-6de0-11e7-bcff-0242ac110726', '2017-07-21 06:48:14', b'0', 'a25ed419-0762-48b9-b674-9c79f13de50c', '46.746645', '\r\n塔城海关', '2017-08-31 06:26:05', '82.94956', '200', '6ff59640-ef2a-48f6f-b883-a700af9ad8', '杜24泽兵', null, null, null), ('d21fc76b-c71b-43ff-aa3e-062136482e66', '2017-07-27 18:01:40', b'0', '7bb8c073-4ac7-40cd-a635-89b583c6df35', '31.221668', '上海市长宁区延安西路728号14B室', '2017-07-27 20:24:14', '121.440304', '40', 'cccd5ca1-e4b6-4105-8cf1-72131c0fff69', 'B002', '5e-324', '-1', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
