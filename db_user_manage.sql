/*
Navicat MySQL Data Transfer

Source Server         : ln
Source Server Version : 80027
Source Host           : localhost:3306
Source Database       : db_user_manage

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-06-02 14:56:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `uid` varchar(30) NOT NULL,
  `province` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `area` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `is_default` int DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for audit_page
-- ----------------------------
DROP TABLE IF EXISTS `audit_page`;
CREATE TABLE `audit_page` (
  `audit_page_id` varchar(23) NOT NULL,
  `uid` char(23) DEFAULT NULL,
  `state` tinyint DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `manager_id` char(23) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`audit_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of audit_page
-- ----------------------------

-- ----------------------------
-- Table structure for business_license_information
-- ----------------------------
DROP TABLE IF EXISTS `business_license_information`;
CREATE TABLE `business_license_information` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `audit_page_id` varchar(23) DEFAULT NULL,
  `corporate_name` varchar(255) DEFAULT NULL,
  `registration_number` char(18) DEFAULT NULL,
  `fr_name` varchar(20) DEFAULT NULL,
  `id_number` char(18) DEFAULT NULL,
  `front_of_id_card_photo` mediumblob,
  `back_of_id_card_photo` mediumblob,
  `location_of_business_license` varchar(100) DEFAULT NULL,
  `address_of_business_license` varchar(100) DEFAULT NULL,
  `date_of_incorporation` varchar(50) DEFAULT NULL,
  `registered_capital` int DEFAULT NULL,
  `business_scope` varchar(100) DEFAULT NULL,
  `business_license` mediumblob,
  `office_phone` varchar(30) DEFAULT NULL,
  `emergency_contact` varchar(30) DEFAULT NULL,
  `phone_of_emergency_contact` varchar(30) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of business_license_information
-- ----------------------------

-- ----------------------------
-- Table structure for business_scope
-- ----------------------------
DROP TABLE IF EXISTS `business_scope`;
CREATE TABLE `business_scope` (
  `businessScopeId` smallint NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`businessScopeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of business_scope
-- ----------------------------

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `uid` char(23) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `truename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone_only_one` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of client
-- ----------------------------

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `uid` char(23) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `manager_type` int DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for manager_type
-- ----------------------------
DROP TABLE IF EXISTS `manager_type`;
CREATE TABLE `manager_type` (
  `managerTypeId` smallint NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `authority` tinyint DEFAULT NULL,
  PRIMARY KEY (`managerTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of manager_type
-- ----------------------------

-- ----------------------------
-- Table structure for provider
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `uid` char(23) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `is_deposit` tinyint DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of provider
-- ----------------------------

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `uid` char(23) NOT NULL,
  `password` char(30) DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `audit_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_deposit` tinyint DEFAULT NULL,
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of store
-- ----------------------------
