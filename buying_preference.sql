/*
Navicat MySQL Data Transfer

Source Server         : ln
Source Server Version : 80027
Source Host           : localhost:3306
Source Database       : buying_preference

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-06-02 14:56:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for preference_weight
-- ----------------------------
DROP TABLE IF EXISTS `preference_weight`;
CREATE TABLE `preference_weight` (
  `weight_id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `price100_weight` float DEFAULT NULL,
  `price300_weight` float DEFAULT NULL,
  `price600_weight` float DEFAULT NULL,
  `price1000_weight` float DEFAULT NULL,
  `price_more_weight` float DEFAULT NULL,
  `promote10_weight` float DEFAULT NULL,
  `promote30_weight` float DEFAULT NULL,
  `promote50_weight` float DEFAULT NULL,
  `promote_more_weight` float DEFAULT NULL,
  `60_weight` float DEFAULT NULL,
  `64_weight` float DEFAULT NULL,
  `68_weight` float DEFAULT NULL,
  `69_weight` float DEFAULT NULL,
  `71_weight` float DEFAULT NULL,
  `72_weight` float DEFAULT NULL,
  `73_weight` float DEFAULT NULL,
  `74_weight` float DEFAULT NULL,
  `75_weight` float DEFAULT NULL,
  `76_weight` float DEFAULT NULL,
  `77_weight` float DEFAULT NULL,
  `78_weight` float DEFAULT NULL,
  `79_weight` float DEFAULT NULL,
  `80_weight` float DEFAULT NULL,
  `81_weight` float DEFAULT NULL,
  `82_weight` float DEFAULT NULL,
  `83_weight` float DEFAULT NULL,
  `84_weight` float DEFAULT NULL,
  PRIMARY KEY (`weight_id`) USING BTREE,
  UNIQUE KEY `preference_weight_uid_uindex` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of preference_weight
-- ----------------------------
INSERT INTO `preference_weight` VALUES ('76', '5', '0', '0', '0', '0.166667', '0.166667', '0', '0', '0.333333', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.25', '0.0833333', '0', '0', '0');

-- ----------------------------
-- Table structure for user_preference
-- ----------------------------
DROP TABLE IF EXISTS `user_preference`;
CREATE TABLE `user_preference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `959_weight` float DEFAULT NULL,
  `958_weight` float DEFAULT NULL,
  `960_weight` float DEFAULT NULL,
  `961_weight` float DEFAULT NULL,
  `962_weight` float DEFAULT NULL,
  `899_weight` float DEFAULT NULL,
  `900_weight` float DEFAULT NULL,
  `901_weight` float DEFAULT NULL,
  `902_weight` float DEFAULT NULL,
  `903_weight` float DEFAULT NULL,
  `844_weight` float DEFAULT NULL,
  `845_weight` float DEFAULT NULL,
  `846_weight` float DEFAULT NULL,
  `847_weight` float DEFAULT NULL,
  `848_weight` float DEFAULT NULL,
  `784_weight` float DEFAULT NULL,
  `785_weight` float DEFAULT NULL,
  `786_weight` float DEFAULT NULL,
  `787_weight` float DEFAULT NULL,
  `788_weight` float DEFAULT NULL,
  `729_weight` float DEFAULT NULL,
  `730_weight` float DEFAULT NULL,
  `731_weight` float DEFAULT NULL,
  `732_weight` float DEFAULT NULL,
  `733_weight` float DEFAULT NULL,
  `673_weight` float DEFAULT NULL,
  `674_weight` float DEFAULT NULL,
  `675_weight` float DEFAULT NULL,
  `676_weight` float DEFAULT NULL,
  `677_weight` float DEFAULT NULL,
  `620_weight` float DEFAULT NULL,
  `621_weight` float DEFAULT NULL,
  `622_weight` float DEFAULT NULL,
  `623_weight` float DEFAULT NULL,
  `624_weight` float DEFAULT NULL,
  `565_weight` float DEFAULT NULL,
  `566_weight` float DEFAULT NULL,
  `567_weight` float DEFAULT NULL,
  `568_weight` float DEFAULT NULL,
  `569_weight` float DEFAULT NULL,
  `509_weight` float DEFAULT NULL,
  `510_weight` float DEFAULT NULL,
  `511_weight` float DEFAULT NULL,
  `512_weight` float DEFAULT NULL,
  `513_weight` float DEFAULT NULL,
  `449_weight` float DEFAULT NULL,
  `450_weight` float DEFAULT NULL,
  `451_weight` float DEFAULT NULL,
  `452_weight` float DEFAULT NULL,
  `453_weight` float DEFAULT NULL,
  `429_weight` float DEFAULT NULL,
  `430_weight` float DEFAULT NULL,
  `431_weight` float DEFAULT NULL,
  `432_weight` float DEFAULT NULL,
  `433_weight` float DEFAULT NULL,
  `373_weight` float DEFAULT NULL,
  `374_weight` float DEFAULT NULL,
  `375_weight` float DEFAULT NULL,
  `376_weight` float DEFAULT NULL,
  `377_weight` float DEFAULT NULL,
  `317_weight` float DEFAULT NULL,
  `318_weight` float DEFAULT NULL,
  `319_weight` float DEFAULT NULL,
  `320_weight` float DEFAULT NULL,
  `321_weight` float DEFAULT NULL,
  `262_weight` float DEFAULT NULL,
  `263_weight` float DEFAULT NULL,
  `264_weight` float DEFAULT NULL,
  `265_weight` float DEFAULT NULL,
  `266_weight` float DEFAULT NULL,
  `202_weight` float DEFAULT NULL,
  `203_weight` float DEFAULT NULL,
  `new_column` int DEFAULT NULL,
  `204_weight` float DEFAULT NULL,
  `205_weight` float DEFAULT NULL,
  `206_weight` float DEFAULT NULL,
  `147_weight` float DEFAULT NULL,
  `148_weight` float DEFAULT NULL,
  `149_weight` float DEFAULT NULL,
  `150_weight` float DEFAULT NULL,
  `151_weight` float DEFAULT NULL,
  `87_weight` float DEFAULT NULL,
  `88_weight` float DEFAULT NULL,
  `89_weight` float DEFAULT NULL,
  `90_weight` float DEFAULT NULL,
  `91_weight` float DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_preference_id_uindex` (`id`) USING BTREE,
  UNIQUE KEY `user_preference_uid_uindex` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_preference
-- ----------------------------
INSERT INTO `user_preference` VALUES ('2', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_preference` VALUES ('3', '5', '0.5', '0.5', '0.166667', '0.166667', '0.166667', '0', '0', '0.166667', '0.5', '0.333333', '0', '0', '0.166667', '0', '0', '0', '0', '0', '0.333333', '0', '0.166667', '0.5', '0.166667', '0.5', '0.5', '0', '0.333333', '0', '0', '0.166667', '0.166667', '0.166667', '0.5', '0.5', '0.5', '0.5', '0', '0.166667', '0.5', '0', '0.166667', '0.5', '0.5', '0.166667', '0.166667', '0.166667', '0.166667', '0.5', '0.166667', '0.166667', '0.5', '0.166667', '0.166667', '0.166667', '0.166667', '0.5', '0.166667', '0.166667', '0.166667', '0.166667', '0.166667', '0.166667', '0.166667', '0.5', '0.166667', '0.75', '0.75', '0.75', '0.75', '0.75', '0.583333', '0.583333', null, '0.583333', '0.583333', '0.583333', '0.166667', '0.166667', '0.166667', '0.166667', '0.166667', '0.5', '0.5', '0.5', '0.166667', '0.166667');
