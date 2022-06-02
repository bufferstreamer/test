/*
Navicat MySQL Data Transfer

Source Server         : ln
Source Server Version : 80027
Source Host           : localhost:3306
Source Database       : storage

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-06-02 14:55:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `province` varchar(100) DEFAULT NULL COMMENT '省\n',
  `city` varchar(100) DEFAULT NULL COMMENT '市',
  `county` varchar(100) DEFAULT NULL COMMENT '县',
  `detail` varchar(100) DEFAULT NULL COMMENT '具体地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='地址格式';

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for address_distance
-- ----------------------------
DROP TABLE IF EXISTS `address_distance`;
CREATE TABLE `address_distance` (
  `from_address` varchar(100) NOT NULL COMMENT '出发地点',
  `to_address` varchar(100) NOT NULL COMMENT '到达地点',
  `distance` double DEFAULT NULL COMMENT '两点间距离  不可到达设置为99999',
  PRIMARY KEY (`to_address`,`from_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='地址与距离邻接表';

-- ----------------------------
-- Records of address_distance
-- ----------------------------
INSERT INTO `address_distance` VALUES ('北京', '上海', '2');
INSERT INTO `address_distance` VALUES ('大连', '上海', '3');
INSERT INTO `address_distance` VALUES ('天津', '上海', '8');
INSERT INTO `address_distance` VALUES ('上海', '北京', '2');
INSERT INTO `address_distance` VALUES ('大连', '北京', '7');
INSERT INTO `address_distance` VALUES ('天津', '北京', '5');
INSERT INTO `address_distance` VALUES ('上海', '大连', '7');
INSERT INTO `address_distance` VALUES ('北京', '大连', '7');
INSERT INTO `address_distance` VALUES ('天津', '大连', '1');
INSERT INTO `address_distance` VALUES ('上海', '天津', '8');
INSERT INTO `address_distance` VALUES ('北京', '天津', '5');
INSERT INTO `address_distance` VALUES ('大连', '天津', '1');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `commodity_id` varchar(100) NOT NULL COMMENT '商品ID',
  `cate_id` varchar(64) DEFAULT NULL COMMENT '商品类型编号',
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '商品副标题',
  `main_image` varchar(100) NOT NULL COMMENT '商品主图',
  `sub_images` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `detail` text NOT NULL COMMENT '商品描述',
  `price` decimal(20,2) NOT NULL COMMENT '商品价格',
  `quantity` int NOT NULL COMMENT '商品数量',
  `location` varchar(100) NOT NULL COMMENT '商品位置',
  `status` int NOT NULL COMMENT '商品状态：1在售，2下架',
  `creat_time` datetime NOT NULL COMMENT '商品添加时间',
  `modify_time` datetime DEFAULT NULL COMMENT '商品最后修改时间',
  `store_id` varchar(100) DEFAULT NULL COMMENT '仓库id',
  PRIMARY KEY (`commodity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='创建时间';

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1646051298465814', '1', '矿泉水', '2', '2', '32', '23', '13.00', '111', 'A19', '4', '2022-02-28 20:27:46', '2022-03-28 11:07:41', '22');
INSERT INTO `commodity` VALUES ('1646051398578582', '21', '方糕', '2', '125', '2', '2', '211.00', '121', 'A1', '1', '2022-02-28 20:28:46', '2022-02-28 20:28:46', '223');
INSERT INTO `commodity` VALUES ('1646052399569188', '1', '天天向上', '12', '1', '1', '1', '131.00', '12312', 'C1', '1', '2022-02-28 20:46:20', '2022-03-09 21:50:04', '223');
INSERT INTO `commodity` VALUES ('1648040969170982', '21', 'dasfe', 'ewqf', 'wefq', 'wefqw', 'gwe', '2323.00', '232', 'A11', '1', '2022-03-23 21:09:04', '2022-03-23 21:09:04', '31');
INSERT INTO `commodity` VALUES ('1648448666261765', '21', '提提卡卡', 'ewqf', 'efqe', 'qfqe', 'qgwq', '11.00', '12', 'D55', '1', '2022-03-28 14:00:20', '2022-03-28 14:00:20', '31');
INSERT INTO `commodity` VALUES ('1648449688470739', '21', 'wangmumu1', '12', 'wef', '113', '很牛', '124124.00', '12123', 'D44', '2', '2022-03-28 14:41:12', '2022-03-28 14:41:12', '31');
INSERT INTO `commodity` VALUES ('1648450812522182', '21', '提提卡卡', 'sdfq', 'fqe', 'gqe', 'qrw', '1313.00', '13', 'D313', '1', '2022-03-28 14:59:54', '2022-03-28 14:59:54', '31');
INSERT INTO `commodity` VALUES ('1651209312260876', '21', 'asvgewga', 'bweabaw', 'bwaebweb', 'wbaebwa', 'bwebwe', '31.00', '313', 'AVAVAV', '1', '2022-04-29 13:14:42', '2022-04-29 13:14:42', '31');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` varchar(100) NOT NULL COMMENT '物流单号',
  `order_type` int NOT NULL COMMENT '1 代表进货 2 代表退货 ',
  `sent_location` varchar(100) NOT NULL COMMENT '发货地址',
  `receive_location` varchar(100) NOT NULL COMMENT '收货地址',
  `sent_phone_number` char(11) NOT NULL COMMENT '寄货方电话',
  `receive_phone_number` char(11) NOT NULL COMMENT '收货方电话',
  `creat_time` datetime NOT NULL COMMENT '订单创建时间\n',
  `order_price` double NOT NULL COMMENT '运费',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_order_id_uindex` (`order_id`),
  UNIQUE KEY `order_order_type_uindex` (`order_type`),
  UNIQUE KEY `order_receive_location_uindex` (`receive_location`),
  UNIQUE KEY `order_receive_phone_number_uindex` (`receive_phone_number`),
  UNIQUE KEY `order_sent_location_uindex` (`sent_location`),
  UNIQUE KEY `order_sent_phone_number_uindex` (`sent_phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='订单';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '1', '大连', '北京', '18842398849', '15566600327', '2021-11-26 20:16:57', '1');

-- ----------------------------
-- Table structure for order_commodity
-- ----------------------------
DROP TABLE IF EXISTS `order_commodity`;
CREATE TABLE `order_commodity` (
  `order_id` varchar(100) NOT NULL COMMENT '订单id',
  `commodity_id` varchar(100) NOT NULL COMMENT '商品id',
  UNIQUE KEY `order_commodity_commodity_id_fk` (`commodity_id`),
  KEY `order_commodity_order_order_id_fk` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='进货订单';

-- ----------------------------
-- Records of order_commodity
-- ----------------------------
INSERT INTO `order_commodity` VALUES ('1', '1646051298465814');

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `station_id` varchar(100) NOT NULL COMMENT '站点id\n',
  `station_name` varchar(100) NOT NULL COMMENT '站点名称',
  `station_location` varchar(100) NOT NULL COMMENT '站点位置',
  PRIMARY KEY (`station_id`),
  UNIQUE KEY `station_station_id_uindex` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='货运站点';

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES ('1', '大连站', '大连');
INSERT INTO `station` VALUES ('122', '天津仓库', '天津');
INSERT INTO `station` VALUES ('1509781375095107585', 'ln', 'dl');
INSERT INTO `station` VALUES ('1509781951124041730', 'ln', 'dl');
INSERT INTO `station` VALUES ('1509790011599036418', 'ln', 'dl');
INSERT INTO `station` VALUES ('1509792819341639681', 'null', 'beijing');
INSERT INTO `station` VALUES ('1509793082999820290', 'null', 'beijing');

-- ----------------------------
-- Table structure for store_house
-- ----------------------------
DROP TABLE IF EXISTS `store_house`;
CREATE TABLE `store_house` (
  `store_id` varchar(100) NOT NULL COMMENT '仓库id',
  `store_name` varchar(100) NOT NULL COMMENT '仓库名字',
  `store_location` varchar(100) NOT NULL COMMENT '仓库地址',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='仓库';

-- ----------------------------
-- Records of store_house
-- ----------------------------
INSERT INTO `store_house` VALUES ('1', '1', '1');
INSERT INTO `store_house` VALUES ('2', '1', '1');
INSERT INTO `store_house` VALUES ('22', '21', '213');
INSERT INTO `store_house` VALUES ('223', '1', '方便面');
INSERT INTO `store_house` VALUES ('444', '1', '1');
INSERT INTO `store_house` VALUES ('76762', '1', '1');

-- ----------------------------
-- Table structure for store_house_distance
-- ----------------------------
DROP TABLE IF EXISTS `store_house_distance`;
CREATE TABLE `store_house_distance` (
  `from_store` varchar(100) DEFAULT NULL,
  `tp_store` varchar(100) DEFAULT NULL,
  `disatance` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='仓库之间的距离';

-- ----------------------------
-- Records of store_house_distance
-- ----------------------------
