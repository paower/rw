/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mshop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-07-06 12:07:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `shop_address`
-- ----------------------------
DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE `shop_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL COMMENT '地址',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `country_id` int(11) NOT NULL DEFAULT '0' COMMENT '县乡',
  `province_id` int(11) DEFAULT '0' COMMENT '省',
  `default` varchar(20) DEFAULT NULL COMMENT '1=>不默认，2=>默认',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户收货地址';

-- ----------------------------
-- Records of shop_address
-- ----------------------------
INSERT INTO `shop_address` VALUES ('1', '6', '测试', '13800138000', '测试', '90', '1355', '4', '2');
INSERT INTO `shop_address` VALUES ('2', '6', '开发测试', '13800138000', '石井国际', '289', '3043', '19', '1');
INSERT INTO `shop_address` VALUES ('7', '7', '测试', '12345678910', '测试', '138', '1775', '8', '1');
INSERT INTO `shop_address` VALUES ('8', '7', '测试2', '12345678910', '测试', '136', '1761', '8', '2');
INSERT INTO `shop_address` VALUES ('9', '4', '开发测试', '13800138000', '石井国际', '289', '3043', '19', '2');
INSERT INTO `shop_address` VALUES ('12', '10', '测试100', '10010010010', '测试100', '36', '37', '1', '2');
INSERT INTO `shop_address` VALUES ('13', '11', '测试1', '13211111111', '测试地址', '36', '37', '1', '2');

-- ----------------------------
-- Table structure for `shop_admin`
-- ----------------------------
DROP TABLE IF EXISTS `shop_admin`;
CREATE TABLE `shop_admin` (
  `admin_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `passwd` varchar(128) DEFAULT NULL,
  `true_name` varchar(20) DEFAULT NULL COMMENT '真名',
  `telephone` varchar(40) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `login_count` mediumint(8) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_login_ip` varchar(40) DEFAULT NULL COMMENT '最后登录ip',
  `last_ip_region` varchar(40) DEFAULT NULL,
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `last_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `group_id` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- ----------------------------
-- Records of shop_admin
-- ----------------------------
INSERT INTO `shop_admin` VALUES ('1', 'admin', 'MDAwMDAwMDAwMLO6e6+AebiU', '', '', 'admin@admin.com', '35', '121.32.176.241', '', '1505270345', '0', '1594008390', '1', '0');
INSERT INTO `shop_admin` VALUES ('3', '管理员', 'MDAwMDAwMDAwMLO6e6+AebiU', '123', '12345678910', null, '0', null, null, '1562150362', '1563025059', '0', '1', '2');

-- ----------------------------
-- Table structure for `shop_area`
-- ----------------------------
DROP TABLE IF EXISTS `shop_area`;
CREATE TABLE `shop_area` (
  `area_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区父ID',
  `area_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `area_deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '地区深度，从1开始',
  PRIMARY KEY (`area_id`),
  KEY `area_parent_id` (`area_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45056 DEFAULT CHARSET=utf8 COMMENT='地区表';

-- ----------------------------
-- Records of shop_area
-- ----------------------------
INSERT INTO `shop_area` VALUES ('1', '北京', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('2', '天津', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('3', '河北省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('4', '山西省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('5', '内蒙古自治区', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('6', '辽宁省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('7', '吉林省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('8', '黑龙江省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('9', '上海', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('10', '江苏省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('11', '浙江省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('12', '安徽省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('13', '福建省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('14', '江西省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('15', '山东省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('16', '河南省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('17', '湖北省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('18', '湖南省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('19', '广东省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('20', '广西壮族自治区', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('21', '海南省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('22', '重庆', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('23', '四川省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('24', '贵州省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('25', '云南省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('26', '西藏自治区', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('27', '陕西省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('28', '甘肃省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('29', '青海省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('30', '宁夏回族自治区', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('31', '新疆维吾尔自治区', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('32', '台湾省', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('33', '香港特别行政区', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('34', '澳门特别行政区', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('35', '海外', '0', '0', '1');
INSERT INTO `shop_area` VALUES ('36', '北京市', '1', '0', '2');
INSERT INTO `shop_area` VALUES ('37', '东城区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('38', '西城区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('39', '上海市', '9', '0', '2');
INSERT INTO `shop_area` VALUES ('40', '天津市', '2', '0', '2');
INSERT INTO `shop_area` VALUES ('41', '朝阳区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('42', '丰台区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('43', '石景山区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('44', '海淀区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('45', '门头沟区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('46', '房山区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('47', '通州区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('48', '顺义区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('49', '昌平区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('50', '大兴区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('51', '怀柔区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('52', '平谷区', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('53', '密云县', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('54', '延庆县', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('55', '和平区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('56', '河东区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('57', '河西区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('58', '南开区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('59', '河北区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('60', '红桥区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('61', '塘沽区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('62', '重庆市', '22', '0', '2');
INSERT INTO `shop_area` VALUES ('64', '东丽区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('65', '西青区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('66', '津南区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('67', '北辰区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('68', '武清区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('69', '宝坻区', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('70', '宁河县', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('71', '静海县', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('72', '蓟县', '40', '0', '3');
INSERT INTO `shop_area` VALUES ('73', '石家庄市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('74', '唐山市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('75', '秦皇岛市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('76', '邯郸市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('77', '邢台市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('78', '保定市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('79', '张家口市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('80', '承德市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('81', '衡水市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('82', '廊坊市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('83', '沧州市', '3', '0', '2');
INSERT INTO `shop_area` VALUES ('84', '太原市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('85', '大同市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('86', '阳泉市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('87', '长治市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('88', '晋城市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('89', '朔州市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('90', '晋中市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('91', '运城市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('92', '忻州市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('93', '临汾市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('94', '吕梁市', '4', '0', '2');
INSERT INTO `shop_area` VALUES ('95', '呼和浩特市', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('96', '包头市', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('97', '乌海市', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('98', '赤峰市', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('99', '通辽市', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('100', '鄂尔多斯市', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('101', '呼伦贝尔市', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('102', '巴彦淖尔市', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('103', '乌兰察布市', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('104', '兴安盟', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('105', '锡林郭勒盟', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('106', '阿拉善盟', '5', '0', '2');
INSERT INTO `shop_area` VALUES ('107', '沈阳市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('108', '大连市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('109', '鞍山市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('110', '抚顺市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('111', '本溪市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('112', '丹东市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('113', '锦州市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('114', '营口市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('115', '阜新市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('116', '辽阳市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('117', '盘锦市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('118', '铁岭市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('119', '朝阳市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('120', '葫芦岛市', '6', '0', '2');
INSERT INTO `shop_area` VALUES ('121', '长春市', '7', '0', '2');
INSERT INTO `shop_area` VALUES ('122', '吉林市', '7', '0', '2');
INSERT INTO `shop_area` VALUES ('123', '四平市', '7', '0', '2');
INSERT INTO `shop_area` VALUES ('124', '辽源市', '7', '0', '2');
INSERT INTO `shop_area` VALUES ('125', '通化市', '7', '0', '2');
INSERT INTO `shop_area` VALUES ('126', '白山市', '7', '0', '2');
INSERT INTO `shop_area` VALUES ('127', '松原市', '7', '0', '2');
INSERT INTO `shop_area` VALUES ('128', '白城市', '7', '0', '2');
INSERT INTO `shop_area` VALUES ('129', '延边朝鲜族自治州', '7', '0', '2');
INSERT INTO `shop_area` VALUES ('130', '哈尔滨市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('131', '齐齐哈尔市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('132', '鸡西市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('133', '鹤岗市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('134', '双鸭山市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('135', '大庆市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('136', '伊春市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('137', '佳木斯市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('138', '七台河市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('139', '牡丹江市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('140', '黑河市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('141', '绥化市', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('142', '大兴安岭地区', '8', '0', '2');
INSERT INTO `shop_area` VALUES ('143', '黄浦区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('144', '卢湾区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('145', '徐汇区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('146', '长宁区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('147', '静安区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('148', '普陀区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('149', '闸北区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('150', '虹口区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('151', '杨浦区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('152', '闵行区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('153', '宝山区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('154', '嘉定区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('155', '浦东新区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('156', '金山区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('157', '松江区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('158', '青浦区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('159', '南汇区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('160', '奉贤区', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('161', '崇明县', '39', '0', '3');
INSERT INTO `shop_area` VALUES ('162', '南京市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('163', '无锡市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('164', '徐州市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('165', '常州市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('166', '苏州市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('167', '南通市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('168', '连云港市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('169', '淮安市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('170', '盐城市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('171', '扬州市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('172', '镇江市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('173', '泰州市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('174', '宿迁市', '10', '0', '2');
INSERT INTO `shop_area` VALUES ('175', '杭州市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('176', '宁波市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('177', '温州市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('178', '嘉兴市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('179', '湖州市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('180', '绍兴市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('181', '舟山市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('182', '衢州市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('183', '金华市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('184', '台州市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('185', '丽水市', '11', '0', '2');
INSERT INTO `shop_area` VALUES ('186', '合肥市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('187', '芜湖市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('188', '蚌埠市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('189', '淮南市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('190', '马鞍山市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('191', '淮北市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('192', '铜陵市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('193', '安庆市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('194', '黄山市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('195', '滁州市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('196', '阜阳市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('197', '宿州市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('198', '巢湖市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('199', '六安市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('200', '亳州市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('201', '池州市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('202', '宣城市', '12', '0', '2');
INSERT INTO `shop_area` VALUES ('203', '福州市', '13', '0', '2');
INSERT INTO `shop_area` VALUES ('204', '厦门市', '13', '0', '2');
INSERT INTO `shop_area` VALUES ('205', '莆田市', '13', '0', '2');
INSERT INTO `shop_area` VALUES ('206', '三明市', '13', '0', '2');
INSERT INTO `shop_area` VALUES ('207', '泉州市', '13', '0', '2');
INSERT INTO `shop_area` VALUES ('208', '漳州市', '13', '0', '2');
INSERT INTO `shop_area` VALUES ('209', '南平市', '13', '0', '2');
INSERT INTO `shop_area` VALUES ('210', '龙岩市', '13', '0', '2');
INSERT INTO `shop_area` VALUES ('211', '宁德市', '13', '0', '2');
INSERT INTO `shop_area` VALUES ('212', '南昌市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('213', '景德镇市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('214', '萍乡市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('215', '九江市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('216', '新余市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('217', '鹰潭市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('218', '赣州市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('219', '吉安市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('220', '宜春市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('221', '抚州市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('222', '上饶市', '14', '0', '2');
INSERT INTO `shop_area` VALUES ('223', '济南市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('224', '青岛市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('225', '淄博市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('226', '枣庄市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('227', '东营市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('228', '烟台市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('229', '潍坊市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('230', '济宁市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('231', '泰安市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('232', '威海市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('233', '日照市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('234', '莱芜市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('235', '临沂市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('236', '德州市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('237', '聊城市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('238', '滨州市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('239', '菏泽市', '15', '0', '2');
INSERT INTO `shop_area` VALUES ('240', '郑州市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('241', '开封市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('242', '洛阳市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('243', '平顶山市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('244', '安阳市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('245', '鹤壁市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('246', '新乡市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('247', '焦作市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('248', '濮阳市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('249', '许昌市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('250', '漯河市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('251', '三门峡市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('252', '南阳市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('253', '商丘市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('254', '信阳市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('255', '周口市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('256', '驻马店市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('257', '济源市', '16', '0', '2');
INSERT INTO `shop_area` VALUES ('258', '武汉市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('259', '黄石市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('260', '十堰市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('261', '宜昌市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('262', '襄樊市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('263', '鄂州市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('264', '荆门市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('265', '孝感市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('266', '荆州市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('267', '黄冈市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('268', '咸宁市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('269', '随州市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('270', '恩施土家族苗族自治州', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('271', '仙桃市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('272', '潜江市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('273', '天门市', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('274', '神农架林区', '17', '0', '2');
INSERT INTO `shop_area` VALUES ('275', '长沙市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('276', '株洲市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('277', '湘潭市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('278', '衡阳市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('279', '邵阳市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('280', '岳阳市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('281', '常德市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('282', '张家界市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('283', '益阳市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('284', '郴州市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('285', '永州市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('286', '怀化市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('287', '娄底市', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('288', '湘西土家族苗族自治州', '18', '0', '2');
INSERT INTO `shop_area` VALUES ('289', '广州市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('290', '韶关市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('291', '深圳市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('292', '珠海市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('293', '汕头市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('294', '佛山市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('295', '江门市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('296', '湛江市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('297', '茂名市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('298', '肇庆市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('299', '惠州市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('300', '梅州市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('301', '汕尾市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('302', '河源市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('303', '阳江市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('304', '清远市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('305', '东莞市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('306', '中山市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('307', '潮州市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('308', '揭阳市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('309', '云浮市', '19', '0', '2');
INSERT INTO `shop_area` VALUES ('310', '南宁市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('311', '柳州市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('312', '桂林市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('313', '梧州市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('314', '北海市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('315', '防城港市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('316', '钦州市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('317', '贵港市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('318', '玉林市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('319', '百色市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('320', '贺州市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('321', '河池市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('322', '来宾市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('323', '崇左市', '20', '0', '2');
INSERT INTO `shop_area` VALUES ('324', '海口市', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('325', '三亚市', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('326', '五指山市', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('327', '琼海市', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('328', '儋州市', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('329', '文昌市', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('330', '万宁市', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('331', '东方市', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('332', '定安县', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('333', '屯昌县', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('334', '澄迈县', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('335', '临高县', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('336', '白沙黎族自治县', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('337', '昌江黎族自治县', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('338', '乐东黎族自治县', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('339', '陵水黎族自治县', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('340', '保亭黎族苗族自治县', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('341', '琼中黎族苗族自治县', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('342', '西沙群岛', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('343', '南沙群岛', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('344', '中沙群岛的岛礁及其海域', '21', '0', '2');
INSERT INTO `shop_area` VALUES ('345', '万州区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('346', '涪陵区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('347', '渝中区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('348', '大渡口区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('349', '江北区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('350', '沙坪坝区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('351', '九龙坡区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('352', '南岸区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('353', '北碚区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('354', '双桥区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('355', '万盛区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('356', '渝北区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('357', '巴南区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('358', '黔江区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('359', '长寿区', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('360', '綦江县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('361', '潼南县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('362', '铜梁县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('363', '大足县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('364', '荣昌县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('365', '璧山县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('366', '梁平县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('367', '城口县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('368', '丰都县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('369', '垫江县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('370', '武隆县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('371', '忠县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('372', '开县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('373', '云阳县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('374', '奉节县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('375', '巫山县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('376', '巫溪县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('377', '石柱土家族自治县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('378', '秀山土家族苗族自治县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('379', '酉阳土家族苗族自治县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('380', '彭水苗族土家族自治县', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('381', '江津市', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('382', '合川市', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('383', '永川市', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('384', '南川市', '62', '0', '3');
INSERT INTO `shop_area` VALUES ('385', '成都市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('386', '自贡市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('387', '攀枝花市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('388', '泸州市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('389', '德阳市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('390', '绵阳市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('391', '广元市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('392', '遂宁市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('393', '内江市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('394', '乐山市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('395', '南充市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('396', '眉山市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('397', '宜宾市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('398', '广安市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('399', '达州市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('400', '雅安市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('401', '巴中市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('402', '资阳市', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('403', '阿坝藏族羌族自治州', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('404', '甘孜藏族自治州', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('405', '凉山彝族自治州', '23', '0', '2');
INSERT INTO `shop_area` VALUES ('406', '贵阳市', '24', '0', '2');
INSERT INTO `shop_area` VALUES ('407', '六盘水市', '24', '0', '2');
INSERT INTO `shop_area` VALUES ('408', '遵义市', '24', '0', '2');
INSERT INTO `shop_area` VALUES ('409', '安顺市', '24', '0', '2');
INSERT INTO `shop_area` VALUES ('410', '铜仁地区', '24', '0', '2');
INSERT INTO `shop_area` VALUES ('411', '黔西南布依族苗族自治州', '24', '0', '2');
INSERT INTO `shop_area` VALUES ('412', '毕节地区', '24', '0', '2');
INSERT INTO `shop_area` VALUES ('413', '黔东南苗族侗族自治州', '24', '0', '2');
INSERT INTO `shop_area` VALUES ('414', '黔南布依族苗族自治州', '24', '0', '2');
INSERT INTO `shop_area` VALUES ('415', '昆明市', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('416', '曲靖市', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('417', '玉溪市', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('418', '保山市', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('419', '昭通市', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('420', '丽江市', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('421', '思茅市', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('422', '临沧市', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('423', '楚雄彝族自治州', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('424', '红河哈尼族彝族自治州', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('425', '文山壮族苗族自治州', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('426', '西双版纳傣族自治州', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('427', '大理白族自治州', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('428', '德宏傣族景颇族自治州', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('429', '怒江傈僳族自治州', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('430', '迪庆藏族自治州', '25', '0', '2');
INSERT INTO `shop_area` VALUES ('431', '拉萨市', '26', '0', '2');
INSERT INTO `shop_area` VALUES ('432', '昌都地区', '26', '0', '2');
INSERT INTO `shop_area` VALUES ('433', '山南地区', '26', '0', '2');
INSERT INTO `shop_area` VALUES ('434', '日喀则地区', '26', '0', '2');
INSERT INTO `shop_area` VALUES ('435', '那曲地区', '26', '0', '2');
INSERT INTO `shop_area` VALUES ('436', '阿里地区', '26', '0', '2');
INSERT INTO `shop_area` VALUES ('437', '林芝地区', '26', '0', '2');
INSERT INTO `shop_area` VALUES ('438', '西安市', '27', '0', '2');
INSERT INTO `shop_area` VALUES ('439', '铜川市', '27', '0', '2');
INSERT INTO `shop_area` VALUES ('440', '宝鸡市', '27', '0', '2');
INSERT INTO `shop_area` VALUES ('441', '咸阳市', '27', '0', '2');
INSERT INTO `shop_area` VALUES ('442', '渭南市', '27', '0', '2');
INSERT INTO `shop_area` VALUES ('443', '延安市', '27', '0', '2');
INSERT INTO `shop_area` VALUES ('444', '汉中市', '27', '0', '2');
INSERT INTO `shop_area` VALUES ('445', '榆林市', '27', '0', '2');
INSERT INTO `shop_area` VALUES ('446', '安康市', '27', '0', '2');
INSERT INTO `shop_area` VALUES ('447', '商洛市', '27', '0', '2');
INSERT INTO `shop_area` VALUES ('448', '兰州市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('449', '嘉峪关市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('450', '金昌市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('451', '白银市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('452', '天水市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('453', '武威市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('454', '张掖市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('455', '平凉市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('456', '酒泉市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('457', '庆阳市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('458', '定西市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('459', '陇南市', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('460', '临夏回族自治州', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('461', '甘南藏族自治州', '28', '0', '2');
INSERT INTO `shop_area` VALUES ('462', '西宁市', '29', '0', '2');
INSERT INTO `shop_area` VALUES ('463', '海东地区', '29', '0', '2');
INSERT INTO `shop_area` VALUES ('464', '海北藏族自治州', '29', '0', '2');
INSERT INTO `shop_area` VALUES ('465', '黄南藏族自治州', '29', '0', '2');
INSERT INTO `shop_area` VALUES ('466', '海南藏族自治州', '29', '0', '2');
INSERT INTO `shop_area` VALUES ('467', '果洛藏族自治州', '29', '0', '2');
INSERT INTO `shop_area` VALUES ('468', '玉树藏族自治州', '29', '0', '2');
INSERT INTO `shop_area` VALUES ('469', '海西蒙古族藏族自治州', '29', '0', '2');
INSERT INTO `shop_area` VALUES ('470', '银川市', '30', '0', '2');
INSERT INTO `shop_area` VALUES ('471', '石嘴山市', '30', '0', '2');
INSERT INTO `shop_area` VALUES ('472', '吴忠市', '30', '0', '2');
INSERT INTO `shop_area` VALUES ('473', '固原市', '30', '0', '2');
INSERT INTO `shop_area` VALUES ('474', '中卫市', '30', '0', '2');
INSERT INTO `shop_area` VALUES ('475', '乌鲁木齐市', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('476', '克拉玛依市', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('477', '吐鲁番地区', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('478', '哈密地区', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('479', '昌吉回族自治州', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('480', '博尔塔拉蒙古自治州', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('481', '巴音郭楞蒙古自治州', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('482', '阿克苏地区', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('483', '克孜勒苏柯尔克孜自治州', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('484', '喀什地区', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('485', '和田地区', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('486', '伊犁哈萨克自治州', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('487', '塔城地区', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('488', '阿勒泰地区', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('489', '石河子市', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('490', '阿拉尔市', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('491', '图木舒克市', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('492', '五家渠市', '31', '0', '2');
INSERT INTO `shop_area` VALUES ('493', '台北市', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('494', '高雄市', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('495', '基隆市', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('496', '台中市', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('497', '台南市', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('498', '新竹市', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('499', '嘉义市', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('500', '台北县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('501', '宜兰县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('502', '桃园县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('503', '新竹县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('504', '苗栗县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('505', '台中县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('506', '彰化县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('507', '南投县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('508', '云林县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('509', '嘉义县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('510', '台南县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('511', '高雄县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('512', '屏东县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('513', '澎湖县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('514', '台东县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('515', '花莲县', '32', '0', '2');
INSERT INTO `shop_area` VALUES ('516', '中西区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('517', '东区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('518', '九龙城区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('519', '观塘区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('520', '南区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('521', '深水埗区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('522', '黄大仙区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('523', '湾仔区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('524', '油尖旺区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('525', '离岛区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('526', '葵青区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('527', '北区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('528', '西贡区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('529', '沙田区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('530', '屯门区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('531', '大埔区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('532', '荃湾区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('533', '元朗区', '33', '0', '2');
INSERT INTO `shop_area` VALUES ('534', '澳门特别行政区', '34', '0', '2');
INSERT INTO `shop_area` VALUES ('535', '美国', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('536', '加拿大', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('537', '澳大利亚', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('538', '新西兰', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('539', '英国', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('540', '法国', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('541', '德国', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('542', '捷克', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('543', '荷兰', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('544', '瑞士', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('545', '希腊', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('546', '挪威', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('547', '瑞典', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('548', '丹麦', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('549', '芬兰', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('550', '爱尔兰', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('551', '奥地利', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('552', '意大利', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('553', '乌克兰', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('554', '俄罗斯', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('555', '西班牙', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('556', '韩国', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('557', '新加坡', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('558', '马来西亚', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('559', '印度', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('560', '泰国', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('561', '日本', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('562', '巴西', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('563', '阿根廷', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('564', '南非', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('565', '埃及', '45055', '0', '3');
INSERT INTO `shop_area` VALUES ('566', '其他', '36', '0', '3');
INSERT INTO `shop_area` VALUES ('1126', '井陉县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1127', '井陉矿区', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1128', '元氏县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1129', '平山县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1130', '新乐市', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1131', '新华区', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1132', '无极县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1133', '晋州市', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1134', '栾城县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1135', '桥东区', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1136', '桥西区', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1137', '正定县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1138', '深泽县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1139', '灵寿县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1140', '藁城市', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1141', '行唐县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1142', '裕华区', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1143', '赞皇县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1144', '赵县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1145', '辛集市', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1146', '长安区', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1147', '高邑县', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1148', '鹿泉市', '73', '0', '3');
INSERT INTO `shop_area` VALUES ('1149', '丰南区', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1150', '丰润区', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1151', '乐亭县', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1152', '古冶区', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1153', '唐海县', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1154', '开平区', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1155', '滦南县', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1156', '滦县', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1157', '玉田县', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1158', '路北区', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1159', '路南区', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1160', '迁安市', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1161', '迁西县', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1162', '遵化市', '74', '0', '3');
INSERT INTO `shop_area` VALUES ('1163', '北戴河区', '75', '0', '3');
INSERT INTO `shop_area` VALUES ('1164', '卢龙县', '75', '0', '3');
INSERT INTO `shop_area` VALUES ('1165', '山海关区', '75', '0', '3');
INSERT INTO `shop_area` VALUES ('1166', '抚宁县', '75', '0', '3');
INSERT INTO `shop_area` VALUES ('1167', '昌黎县', '75', '0', '3');
INSERT INTO `shop_area` VALUES ('1168', '海港区', '75', '0', '3');
INSERT INTO `shop_area` VALUES ('1169', '青龙满族自治县', '75', '0', '3');
INSERT INTO `shop_area` VALUES ('1170', '丛台区', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1171', '临漳县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1172', '复兴区', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1173', '大名县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1174', '峰峰矿区', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1175', '广平县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1176', '成安县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1177', '曲周县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1178', '武安市', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1179', '永年县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1180', '涉县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1181', '磁县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1182', '肥乡县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1183', '邯山区', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1184', '邯郸县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1185', '邱县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1186', '馆陶县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1187', '魏县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1188', '鸡泽县', '76', '0', '3');
INSERT INTO `shop_area` VALUES ('1189', '临城县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1190', '临西县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1191', '任县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1192', '内丘县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1193', '南和县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1194', '南宫市', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1195', '威县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1196', '宁晋县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1197', '巨鹿县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1198', '平乡县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1199', '广宗县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1200', '新河县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1201', '柏乡县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1202', '桥东区', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1203', '桥西区', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1204', '沙河市', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1205', '清河县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1206', '邢台县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1207', '隆尧县', '77', '0', '3');
INSERT INTO `shop_area` VALUES ('1208', '北市区', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1209', '南市区', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1210', '博野县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1211', '唐县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1212', '安国市', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1213', '安新县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1214', '定兴县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1215', '定州市', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1216', '容城县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1217', '徐水县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1218', '新市区', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1219', '易县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1220', '曲阳县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1221', '望都县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1222', '涞水县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1223', '涞源县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1224', '涿州市', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1225', '清苑县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1226', '满城县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1227', '蠡县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1228', '阜平县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1229', '雄县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1230', '顺平县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1231', '高碑店市', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1232', '高阳县', '78', '0', '3');
INSERT INTO `shop_area` VALUES ('1233', '万全县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1234', '下花园区', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1235', '宣化区', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1236', '宣化县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1237', '尚义县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1238', '崇礼县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1239', '康保县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1240', '张北县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1241', '怀安县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1242', '怀来县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1243', '桥东区', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1244', '桥西区', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1245', '沽源县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1246', '涿鹿县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1247', '蔚县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1248', '赤城县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1249', '阳原县', '79', '0', '3');
INSERT INTO `shop_area` VALUES ('1250', '丰宁满族自治县', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1251', '兴隆县', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1252', '双桥区', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1253', '双滦区', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1254', '围场满族蒙古族自治县', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1255', '宽城满族自治县', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1256', '平泉县', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1257', '承德县', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1258', '滦平县', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1259', '隆化县', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1260', '鹰手营子矿区', '80', '0', '3');
INSERT INTO `shop_area` VALUES ('1261', '冀州市', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1262', '安平县', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1263', '故城县', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1264', '景县', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1265', '枣强县', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1266', '桃城区', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1267', '武强县', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1268', '武邑县', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1269', '深州市', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1270', '阜城县', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1271', '饶阳县', '81', '0', '3');
INSERT INTO `shop_area` VALUES ('1272', '三河市', '82', '0', '3');
INSERT INTO `shop_area` VALUES ('1273', '固安县', '82', '0', '3');
INSERT INTO `shop_area` VALUES ('1274', '大厂回族自治县', '82', '0', '3');
INSERT INTO `shop_area` VALUES ('1275', '大城县', '82', '0', '3');
INSERT INTO `shop_area` VALUES ('1276', '安次区', '82', '0', '3');
INSERT INTO `shop_area` VALUES ('1277', '广阳区', '82', '0', '3');
INSERT INTO `shop_area` VALUES ('1278', '文安县', '82', '0', '3');
INSERT INTO `shop_area` VALUES ('1279', '永清县', '82', '0', '3');
INSERT INTO `shop_area` VALUES ('1280', '霸州市', '82', '0', '3');
INSERT INTO `shop_area` VALUES ('1281', '香河县', '82', '0', '3');
INSERT INTO `shop_area` VALUES ('1282', '东光县', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1283', '任丘市', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1284', '南皮县', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1285', '吴桥县', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1286', '孟村回族自治县', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1287', '新华区', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1288', '沧县', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1289', '河间市', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1290', '泊头市', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1291', '海兴县', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1292', '献县', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1293', '盐山县', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1294', '肃宁县', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1295', '运河区', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1296', '青县', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1297', '黄骅市', '83', '0', '3');
INSERT INTO `shop_area` VALUES ('1298', '万柏林区', '84', '0', '3');
INSERT INTO `shop_area` VALUES ('1299', '古交市', '84', '0', '3');
INSERT INTO `shop_area` VALUES ('1300', '娄烦县', '84', '0', '3');
INSERT INTO `shop_area` VALUES ('1301', '小店区', '84', '0', '3');
INSERT INTO `shop_area` VALUES ('1302', '尖草坪区', '84', '0', '3');
INSERT INTO `shop_area` VALUES ('1303', '晋源区', '84', '0', '3');
INSERT INTO `shop_area` VALUES ('1304', '杏花岭区', '84', '0', '3');
INSERT INTO `shop_area` VALUES ('1305', '清徐县', '84', '0', '3');
INSERT INTO `shop_area` VALUES ('1306', '迎泽区', '84', '0', '3');
INSERT INTO `shop_area` VALUES ('1307', '阳曲县', '84', '0', '3');
INSERT INTO `shop_area` VALUES ('1308', '南郊区', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1309', '城区', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1310', '大同县', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1311', '天镇县', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1312', '左云县', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1313', '广灵县', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1314', '新荣区', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1315', '浑源县', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1316', '灵丘县', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1317', '矿区', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1318', '阳高县', '85', '0', '3');
INSERT INTO `shop_area` VALUES ('1319', '城区', '86', '0', '3');
INSERT INTO `shop_area` VALUES ('1320', '平定县', '86', '0', '3');
INSERT INTO `shop_area` VALUES ('1321', '盂县', '86', '0', '3');
INSERT INTO `shop_area` VALUES ('1322', '矿区', '86', '0', '3');
INSERT INTO `shop_area` VALUES ('1323', '郊区', '86', '0', '3');
INSERT INTO `shop_area` VALUES ('1324', '城区', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1325', '壶关县', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1326', '屯留县', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1327', '平顺县', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1328', '武乡县', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1329', '沁县', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1330', '沁源县', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1331', '潞城市', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1332', '襄垣县', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1333', '郊区', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1334', '长子县', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1335', '长治县', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1336', '黎城县', '87', '0', '3');
INSERT INTO `shop_area` VALUES ('1337', '城区', '88', '0', '3');
INSERT INTO `shop_area` VALUES ('1338', '沁水县', '88', '0', '3');
INSERT INTO `shop_area` VALUES ('1339', '泽州县', '88', '0', '3');
INSERT INTO `shop_area` VALUES ('1340', '阳城县', '88', '0', '3');
INSERT INTO `shop_area` VALUES ('1341', '陵川县', '88', '0', '3');
INSERT INTO `shop_area` VALUES ('1342', '高平市', '88', '0', '3');
INSERT INTO `shop_area` VALUES ('1343', '右玉县', '89', '0', '3');
INSERT INTO `shop_area` VALUES ('1344', '山阴县', '89', '0', '3');
INSERT INTO `shop_area` VALUES ('1345', '平鲁区', '89', '0', '3');
INSERT INTO `shop_area` VALUES ('1346', '应县', '89', '0', '3');
INSERT INTO `shop_area` VALUES ('1347', '怀仁县', '89', '0', '3');
INSERT INTO `shop_area` VALUES ('1348', '朔城区', '89', '0', '3');
INSERT INTO `shop_area` VALUES ('1349', '介休市', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1350', '和顺县', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1351', '太谷县', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1352', '寿阳县', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1353', '左权县', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1354', '平遥县', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1355', '昔阳县', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1356', '榆次区', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1357', '榆社县', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1358', '灵石县', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1359', '祁县', '90', '0', '3');
INSERT INTO `shop_area` VALUES ('1360', '万荣县', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1361', '临猗县', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1362', '垣曲县', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1363', '夏县', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1364', '平陆县', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1365', '新绛县', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1366', '永济市', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1367', '河津市', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1368', '盐湖区', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1369', '稷山县', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1370', '绛县', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1371', '芮城县', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1372', '闻喜县', '91', '0', '3');
INSERT INTO `shop_area` VALUES ('1373', '五台县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1374', '五寨县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1375', '代县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1376', '保德县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1377', '偏关县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1378', '原平市', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1379', '宁武县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1380', '定襄县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1381', '岢岚县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1382', '忻府区', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1383', '河曲县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1384', '神池县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1385', '繁峙县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1386', '静乐县', '92', '0', '3');
INSERT INTO `shop_area` VALUES ('1387', '乡宁县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1388', '侯马市', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1389', '古县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1390', '吉县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1391', '大宁县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1392', '安泽县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1393', '尧都区', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1394', '曲沃县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1395', '永和县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1396', '汾西县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1397', '洪洞县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1398', '浮山县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1399', '翼城县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1400', '蒲县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1401', '襄汾县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1402', '隰县', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1403', '霍州市', '93', '0', '3');
INSERT INTO `shop_area` VALUES ('1404', '中阳县', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1405', '临县', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1406', '交口县', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1407', '交城县', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1408', '兴县', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1409', '孝义市', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1410', '岚县', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1411', '文水县', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1412', '方山县', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1413', '柳林县', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1414', '汾阳市', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1415', '石楼县', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1416', '离石区', '94', '0', '3');
INSERT INTO `shop_area` VALUES ('1417', '和林格尔县', '95', '0', '3');
INSERT INTO `shop_area` VALUES ('1418', '回民区', '95', '0', '3');
INSERT INTO `shop_area` VALUES ('1419', '土默特左旗', '95', '0', '3');
INSERT INTO `shop_area` VALUES ('1420', '托克托县', '95', '0', '3');
INSERT INTO `shop_area` VALUES ('1421', '新城区', '95', '0', '3');
INSERT INTO `shop_area` VALUES ('1422', '武川县', '95', '0', '3');
INSERT INTO `shop_area` VALUES ('1423', '清水河县', '95', '0', '3');
INSERT INTO `shop_area` VALUES ('1424', '玉泉区', '95', '0', '3');
INSERT INTO `shop_area` VALUES ('1425', '赛罕区', '95', '0', '3');
INSERT INTO `shop_area` VALUES ('1426', '东河区', '96', '0', '3');
INSERT INTO `shop_area` VALUES ('1427', '九原区', '96', '0', '3');
INSERT INTO `shop_area` VALUES ('1428', '固阳县', '96', '0', '3');
INSERT INTO `shop_area` VALUES ('1429', '土默特右旗', '96', '0', '3');
INSERT INTO `shop_area` VALUES ('1430', '昆都仑区', '96', '0', '3');
INSERT INTO `shop_area` VALUES ('1431', '白云矿区', '96', '0', '3');
INSERT INTO `shop_area` VALUES ('1432', '石拐区', '96', '0', '3');
INSERT INTO `shop_area` VALUES ('1433', '达尔罕茂明安联合旗', '96', '0', '3');
INSERT INTO `shop_area` VALUES ('1434', '青山区', '96', '0', '3');
INSERT INTO `shop_area` VALUES ('1435', '乌达区', '97', '0', '3');
INSERT INTO `shop_area` VALUES ('1436', '海勃湾区', '97', '0', '3');
INSERT INTO `shop_area` VALUES ('1437', '海南区', '97', '0', '3');
INSERT INTO `shop_area` VALUES ('1438', '元宝山区', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1439', '克什克腾旗', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1440', '喀喇沁旗', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1441', '宁城县', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1442', '巴林右旗', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1443', '巴林左旗', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1444', '敖汉旗', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1445', '松山区', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1446', '林西县', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1447', '红山区', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1448', '翁牛特旗', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1449', '阿鲁科尔沁旗', '98', '0', '3');
INSERT INTO `shop_area` VALUES ('1450', '奈曼旗', '99', '0', '3');
INSERT INTO `shop_area` VALUES ('1451', '库伦旗', '99', '0', '3');
INSERT INTO `shop_area` VALUES ('1452', '开鲁县', '99', '0', '3');
INSERT INTO `shop_area` VALUES ('1453', '扎鲁特旗', '99', '0', '3');
INSERT INTO `shop_area` VALUES ('1454', '科尔沁区', '99', '0', '3');
INSERT INTO `shop_area` VALUES ('1455', '科尔沁左翼中旗', '99', '0', '3');
INSERT INTO `shop_area` VALUES ('1456', '科尔沁左翼后旗', '99', '0', '3');
INSERT INTO `shop_area` VALUES ('1457', '霍林郭勒市', '99', '0', '3');
INSERT INTO `shop_area` VALUES ('1458', '东胜区', '100', '0', '3');
INSERT INTO `shop_area` VALUES ('1459', '乌审旗', '100', '0', '3');
INSERT INTO `shop_area` VALUES ('1460', '伊金霍洛旗', '100', '0', '3');
INSERT INTO `shop_area` VALUES ('1461', '准格尔旗', '100', '0', '3');
INSERT INTO `shop_area` VALUES ('1462', '杭锦旗', '100', '0', '3');
INSERT INTO `shop_area` VALUES ('1463', '达拉特旗', '100', '0', '3');
INSERT INTO `shop_area` VALUES ('1464', '鄂东胜区', '100', '0', '3');
INSERT INTO `shop_area` VALUES ('1465', '鄂托克前旗', '100', '0', '3');
INSERT INTO `shop_area` VALUES ('1466', '鄂托克旗', '100', '0', '3');
INSERT INTO `shop_area` VALUES ('1467', '扎兰屯市', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1468', '新巴尔虎右旗', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1469', '新巴尔虎左旗', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1470', '根河市', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1471', '海拉尔区', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1472', '满洲里市', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1473', '牙克石市', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1474', '莫力达瓦达斡尔族自治旗', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1475', '鄂伦春自治旗', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1476', '鄂温克族自治旗', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1477', '阿荣旗', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1478', '陈巴尔虎旗', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1479', '额尔古纳市', '101', '0', '3');
INSERT INTO `shop_area` VALUES ('1480', '临河区', '102', '0', '3');
INSERT INTO `shop_area` VALUES ('1481', '乌拉特中旗', '102', '0', '3');
INSERT INTO `shop_area` VALUES ('1482', '乌拉特前旗', '102', '0', '3');
INSERT INTO `shop_area` VALUES ('1483', '乌拉特后旗', '102', '0', '3');
INSERT INTO `shop_area` VALUES ('1484', '五原县', '102', '0', '3');
INSERT INTO `shop_area` VALUES ('1485', '杭锦后旗', '102', '0', '3');
INSERT INTO `shop_area` VALUES ('1486', '磴口县', '102', '0', '3');
INSERT INTO `shop_area` VALUES ('1487', '丰镇市', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1488', '兴和县', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1489', '凉城县', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1490', '化德县', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1491', '卓资县', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1492', '商都县', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1493', '四子王旗', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1494', '察哈尔右翼中旗', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1495', '察哈尔右翼前旗', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1496', '察哈尔右翼后旗', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1497', '集宁区', '103', '0', '3');
INSERT INTO `shop_area` VALUES ('1498', '乌兰浩特市', '104', '0', '3');
INSERT INTO `shop_area` VALUES ('1499', '扎赉特旗', '104', '0', '3');
INSERT INTO `shop_area` VALUES ('1500', '科尔沁右翼中旗', '104', '0', '3');
INSERT INTO `shop_area` VALUES ('1501', '科尔沁右翼前旗', '104', '0', '3');
INSERT INTO `shop_area` VALUES ('1502', '突泉县', '104', '0', '3');
INSERT INTO `shop_area` VALUES ('1503', '阿尔山市', '104', '0', '3');
INSERT INTO `shop_area` VALUES ('1504', '东乌珠穆沁旗', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1505', '二连浩特市', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1506', '多伦县', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1507', '太仆寺旗', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1508', '正蓝旗', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1509', '正镶白旗', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1510', '苏尼特右旗', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1511', '苏尼特左旗', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1512', '西乌珠穆沁旗', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1513', '锡林浩特市', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1514', '镶黄旗', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1515', '阿巴嘎旗', '105', '0', '3');
INSERT INTO `shop_area` VALUES ('1516', '阿拉善右旗', '106', '0', '3');
INSERT INTO `shop_area` VALUES ('1517', '阿拉善左旗', '106', '0', '3');
INSERT INTO `shop_area` VALUES ('1518', '额济纳旗', '106', '0', '3');
INSERT INTO `shop_area` VALUES ('1519', '东陵区', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1520', '于洪区', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1521', '和平区', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1522', '大东区', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1523', '康平县', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1524', '新民市', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1525', '沈北新区', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1526', '沈河区', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1527', '法库县', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1528', '皇姑区', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1529', '苏家屯区', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1530', '辽中县', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1531', '铁西区', '107', '0', '3');
INSERT INTO `shop_area` VALUES ('1532', '中山区', '108', '0', '3');
INSERT INTO `shop_area` VALUES ('1533', '庄河市', '108', '0', '3');
INSERT INTO `shop_area` VALUES ('1534', '旅顺口区', '108', '0', '3');
INSERT INTO `shop_area` VALUES ('1535', '普兰店市', '108', '0', '3');
INSERT INTO `shop_area` VALUES ('1536', '沙河口区', '108', '0', '3');
INSERT INTO `shop_area` VALUES ('1537', '瓦房店市', '108', '0', '3');
INSERT INTO `shop_area` VALUES ('1538', '甘井子区', '108', '0', '3');
INSERT INTO `shop_area` VALUES ('1539', '西岗区', '108', '0', '3');
INSERT INTO `shop_area` VALUES ('1540', '金州区', '108', '0', '3');
INSERT INTO `shop_area` VALUES ('1541', '长海县', '108', '0', '3');
INSERT INTO `shop_area` VALUES ('1542', '千山区', '109', '0', '3');
INSERT INTO `shop_area` VALUES ('1543', '台安县', '109', '0', '3');
INSERT INTO `shop_area` VALUES ('1544', '岫岩满族自治县', '109', '0', '3');
INSERT INTO `shop_area` VALUES ('1545', '海城市', '109', '0', '3');
INSERT INTO `shop_area` VALUES ('1546', '立山区', '109', '0', '3');
INSERT INTO `shop_area` VALUES ('1547', '铁东区', '109', '0', '3');
INSERT INTO `shop_area` VALUES ('1548', '铁西区', '109', '0', '3');
INSERT INTO `shop_area` VALUES ('1549', '东洲区', '110', '0', '3');
INSERT INTO `shop_area` VALUES ('1550', '抚顺县', '110', '0', '3');
INSERT INTO `shop_area` VALUES ('1551', '新宾满族自治县', '110', '0', '3');
INSERT INTO `shop_area` VALUES ('1552', '新抚区', '110', '0', '3');
INSERT INTO `shop_area` VALUES ('1553', '望花区', '110', '0', '3');
INSERT INTO `shop_area` VALUES ('1554', '清原满族自治县', '110', '0', '3');
INSERT INTO `shop_area` VALUES ('1555', '顺城区', '110', '0', '3');
INSERT INTO `shop_area` VALUES ('1556', '南芬区', '111', '0', '3');
INSERT INTO `shop_area` VALUES ('1557', '平山区', '111', '0', '3');
INSERT INTO `shop_area` VALUES ('1558', '明山区', '111', '0', '3');
INSERT INTO `shop_area` VALUES ('1559', '本溪满族自治县', '111', '0', '3');
INSERT INTO `shop_area` VALUES ('1560', '桓仁满族自治县', '111', '0', '3');
INSERT INTO `shop_area` VALUES ('1561', '溪湖区', '111', '0', '3');
INSERT INTO `shop_area` VALUES ('1562', '东港市', '112', '0', '3');
INSERT INTO `shop_area` VALUES ('1563', '元宝区', '112', '0', '3');
INSERT INTO `shop_area` VALUES ('1564', '凤城市', '112', '0', '3');
INSERT INTO `shop_area` VALUES ('1565', '宽甸满族自治县', '112', '0', '3');
INSERT INTO `shop_area` VALUES ('1566', '振兴区', '112', '0', '3');
INSERT INTO `shop_area` VALUES ('1567', '振安区', '112', '0', '3');
INSERT INTO `shop_area` VALUES ('1568', '义县', '113', '0', '3');
INSERT INTO `shop_area` VALUES ('1569', '凌河区', '113', '0', '3');
INSERT INTO `shop_area` VALUES ('1570', '凌海市', '113', '0', '3');
INSERT INTO `shop_area` VALUES ('1571', '北镇市', '113', '0', '3');
INSERT INTO `shop_area` VALUES ('1572', '古塔区', '113', '0', '3');
INSERT INTO `shop_area` VALUES ('1573', '太和区', '113', '0', '3');
INSERT INTO `shop_area` VALUES ('1574', '黑山县', '113', '0', '3');
INSERT INTO `shop_area` VALUES ('1575', '大石桥市', '114', '0', '3');
INSERT INTO `shop_area` VALUES ('1576', '盖州市', '114', '0', '3');
INSERT INTO `shop_area` VALUES ('1577', '站前区', '114', '0', '3');
INSERT INTO `shop_area` VALUES ('1578', '老边区', '114', '0', '3');
INSERT INTO `shop_area` VALUES ('1579', '西市区', '114', '0', '3');
INSERT INTO `shop_area` VALUES ('1580', '鲅鱼圈区', '114', '0', '3');
INSERT INTO `shop_area` VALUES ('1581', '太平区', '115', '0', '3');
INSERT INTO `shop_area` VALUES ('1582', '彰武县', '115', '0', '3');
INSERT INTO `shop_area` VALUES ('1583', '新邱区', '115', '0', '3');
INSERT INTO `shop_area` VALUES ('1584', '海州区', '115', '0', '3');
INSERT INTO `shop_area` VALUES ('1585', '清河门区', '115', '0', '3');
INSERT INTO `shop_area` VALUES ('1586', '细河区', '115', '0', '3');
INSERT INTO `shop_area` VALUES ('1587', '蒙古族自治县', '115', '0', '3');
INSERT INTO `shop_area` VALUES ('1588', '太子河区', '116', '0', '3');
INSERT INTO `shop_area` VALUES ('1589', '宏伟区', '116', '0', '3');
INSERT INTO `shop_area` VALUES ('1590', '弓长岭区', '116', '0', '3');
INSERT INTO `shop_area` VALUES ('1591', '文圣区', '116', '0', '3');
INSERT INTO `shop_area` VALUES ('1592', '灯塔市', '116', '0', '3');
INSERT INTO `shop_area` VALUES ('1593', '白塔区', '116', '0', '3');
INSERT INTO `shop_area` VALUES ('1594', '辽阳县', '116', '0', '3');
INSERT INTO `shop_area` VALUES ('1595', '兴隆台区', '117', '0', '3');
INSERT INTO `shop_area` VALUES ('1596', '双台子区', '117', '0', '3');
INSERT INTO `shop_area` VALUES ('1597', '大洼县', '117', '0', '3');
INSERT INTO `shop_area` VALUES ('1598', '盘山县', '117', '0', '3');
INSERT INTO `shop_area` VALUES ('1599', '开原市', '118', '0', '3');
INSERT INTO `shop_area` VALUES ('1600', '昌图县', '118', '0', '3');
INSERT INTO `shop_area` VALUES ('1601', '清河区', '118', '0', '3');
INSERT INTO `shop_area` VALUES ('1602', '西丰县', '118', '0', '3');
INSERT INTO `shop_area` VALUES ('1603', '调兵山市', '118', '0', '3');
INSERT INTO `shop_area` VALUES ('1604', '铁岭县', '118', '0', '3');
INSERT INTO `shop_area` VALUES ('1605', '银州区', '118', '0', '3');
INSERT INTO `shop_area` VALUES ('1606', '凌源市', '119', '0', '3');
INSERT INTO `shop_area` VALUES ('1607', '北票市', '119', '0', '3');
INSERT INTO `shop_area` VALUES ('1608', '双塔区', '119', '0', '3');
INSERT INTO `shop_area` VALUES ('1609', '喀喇沁左翼蒙古族自治县', '119', '0', '3');
INSERT INTO `shop_area` VALUES ('1610', '建平县', '119', '0', '3');
INSERT INTO `shop_area` VALUES ('1611', '朝阳县', '119', '0', '3');
INSERT INTO `shop_area` VALUES ('1612', '龙城区', '119', '0', '3');
INSERT INTO `shop_area` VALUES ('1613', '兴城市', '120', '0', '3');
INSERT INTO `shop_area` VALUES ('1614', '南票区', '120', '0', '3');
INSERT INTO `shop_area` VALUES ('1615', '建昌县', '120', '0', '3');
INSERT INTO `shop_area` VALUES ('1616', '绥中县', '120', '0', '3');
INSERT INTO `shop_area` VALUES ('1617', '连山区', '120', '0', '3');
INSERT INTO `shop_area` VALUES ('1618', '龙港区', '120', '0', '3');
INSERT INTO `shop_area` VALUES ('1619', '九台市', '121', '0', '3');
INSERT INTO `shop_area` VALUES ('1620', '二道区', '121', '0', '3');
INSERT INTO `shop_area` VALUES ('1621', '农安县', '121', '0', '3');
INSERT INTO `shop_area` VALUES ('1622', '南关区', '121', '0', '3');
INSERT INTO `shop_area` VALUES ('1623', '双阳区', '121', '0', '3');
INSERT INTO `shop_area` VALUES ('1624', '宽城区', '121', '0', '3');
INSERT INTO `shop_area` VALUES ('1625', '德惠市', '121', '0', '3');
INSERT INTO `shop_area` VALUES ('1626', '朝阳区', '121', '0', '3');
INSERT INTO `shop_area` VALUES ('1627', '榆树市', '121', '0', '3');
INSERT INTO `shop_area` VALUES ('1628', '绿园区', '121', '0', '3');
INSERT INTO `shop_area` VALUES ('1629', '丰满区', '122', '0', '3');
INSERT INTO `shop_area` VALUES ('1630', '昌邑区', '122', '0', '3');
INSERT INTO `shop_area` VALUES ('1631', '桦甸市', '122', '0', '3');
INSERT INTO `shop_area` VALUES ('1632', '永吉县', '122', '0', '3');
INSERT INTO `shop_area` VALUES ('1633', '磐石市', '122', '0', '3');
INSERT INTO `shop_area` VALUES ('1634', '舒兰市', '122', '0', '3');
INSERT INTO `shop_area` VALUES ('1635', '船营区', '122', '0', '3');
INSERT INTO `shop_area` VALUES ('1636', '蛟河市', '122', '0', '3');
INSERT INTO `shop_area` VALUES ('1637', '龙潭区', '122', '0', '3');
INSERT INTO `shop_area` VALUES ('1638', '伊通满族自治县', '123', '0', '3');
INSERT INTO `shop_area` VALUES ('1639', '公主岭市', '123', '0', '3');
INSERT INTO `shop_area` VALUES ('1640', '双辽市', '123', '0', '3');
INSERT INTO `shop_area` VALUES ('1641', '梨树县', '123', '0', '3');
INSERT INTO `shop_area` VALUES ('1642', '铁东区', '123', '0', '3');
INSERT INTO `shop_area` VALUES ('1643', '铁西区', '123', '0', '3');
INSERT INTO `shop_area` VALUES ('1644', '东丰县', '124', '0', '3');
INSERT INTO `shop_area` VALUES ('1645', '东辽县', '124', '0', '3');
INSERT INTO `shop_area` VALUES ('1646', '西安区', '124', '0', '3');
INSERT INTO `shop_area` VALUES ('1647', '龙山区', '124', '0', '3');
INSERT INTO `shop_area` VALUES ('1648', '东昌区', '125', '0', '3');
INSERT INTO `shop_area` VALUES ('1649', '二道江区', '125', '0', '3');
INSERT INTO `shop_area` VALUES ('1650', '柳河县', '125', '0', '3');
INSERT INTO `shop_area` VALUES ('1651', '梅河口市', '125', '0', '3');
INSERT INTO `shop_area` VALUES ('1652', '辉南县', '125', '0', '3');
INSERT INTO `shop_area` VALUES ('1653', '通化县', '125', '0', '3');
INSERT INTO `shop_area` VALUES ('1654', '集安市', '125', '0', '3');
INSERT INTO `shop_area` VALUES ('1655', '临江市', '126', '0', '3');
INSERT INTO `shop_area` VALUES ('1656', '八道江区', '126', '0', '3');
INSERT INTO `shop_area` VALUES ('1657', '抚松县', '126', '0', '3');
INSERT INTO `shop_area` VALUES ('1658', '江源区', '126', '0', '3');
INSERT INTO `shop_area` VALUES ('1659', '长白朝鲜族自治县', '126', '0', '3');
INSERT INTO `shop_area` VALUES ('1660', '靖宇县', '126', '0', '3');
INSERT INTO `shop_area` VALUES ('1661', '干安县', '127', '0', '3');
INSERT INTO `shop_area` VALUES ('1662', '前郭尔罗斯蒙古族自治县', '127', '0', '3');
INSERT INTO `shop_area` VALUES ('1663', '宁江区', '127', '0', '3');
INSERT INTO `shop_area` VALUES ('1664', '扶余县', '127', '0', '3');
INSERT INTO `shop_area` VALUES ('1665', '长岭县', '127', '0', '3');
INSERT INTO `shop_area` VALUES ('1666', '大安市', '128', '0', '3');
INSERT INTO `shop_area` VALUES ('1667', '洮北区', '128', '0', '3');
INSERT INTO `shop_area` VALUES ('1668', '洮南市', '128', '0', '3');
INSERT INTO `shop_area` VALUES ('1669', '通榆县', '128', '0', '3');
INSERT INTO `shop_area` VALUES ('1670', '镇赉县', '128', '0', '3');
INSERT INTO `shop_area` VALUES ('1671', '和龙市', '129', '0', '3');
INSERT INTO `shop_area` VALUES ('1672', '图们市', '129', '0', '3');
INSERT INTO `shop_area` VALUES ('1673', '安图县', '129', '0', '3');
INSERT INTO `shop_area` VALUES ('1674', '延吉市', '129', '0', '3');
INSERT INTO `shop_area` VALUES ('1675', '敦化市', '129', '0', '3');
INSERT INTO `shop_area` VALUES ('1676', '汪清县', '129', '0', '3');
INSERT INTO `shop_area` VALUES ('1677', '珲春市', '129', '0', '3');
INSERT INTO `shop_area` VALUES ('1678', '龙井市', '129', '0', '3');
INSERT INTO `shop_area` VALUES ('1679', '五常市', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1680', '依兰县', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1681', '南岗区', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1682', '双城市', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1683', '呼兰区', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1684', '哈尔滨市道里区', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1685', '宾县', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1686', '尚志市', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1687', '巴彦县', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1688', '平房区', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1689', '延寿县', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1690', '方正县', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1691', '木兰县', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1692', '松北区', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1693', '通河县', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1694', '道外区', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1695', '阿城区', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1696', '香坊区', '130', '0', '3');
INSERT INTO `shop_area` VALUES ('1697', '依安县', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1698', '克东县', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1699', '克山县', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1700', '富拉尔基区', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1701', '富裕县', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1702', '建华区', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1703', '拜泉县', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1704', '昂昂溪区', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1705', '梅里斯达斡尔族区', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1706', '泰来县', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1707', '甘南县', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1708', '碾子山区', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1709', '讷河市', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1710', '铁锋区', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1711', '龙江县', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1712', '龙沙区', '131', '0', '3');
INSERT INTO `shop_area` VALUES ('1713', '城子河区', '132', '0', '3');
INSERT INTO `shop_area` VALUES ('1714', '密山市', '132', '0', '3');
INSERT INTO `shop_area` VALUES ('1715', '恒山区', '132', '0', '3');
INSERT INTO `shop_area` VALUES ('1716', '梨树区', '132', '0', '3');
INSERT INTO `shop_area` VALUES ('1717', '滴道区', '132', '0', '3');
INSERT INTO `shop_area` VALUES ('1718', '虎林市', '132', '0', '3');
INSERT INTO `shop_area` VALUES ('1719', '鸡东县', '132', '0', '3');
INSERT INTO `shop_area` VALUES ('1720', '鸡冠区', '132', '0', '3');
INSERT INTO `shop_area` VALUES ('1721', '麻山区', '132', '0', '3');
INSERT INTO `shop_area` VALUES ('1722', '东山区', '133', '0', '3');
INSERT INTO `shop_area` VALUES ('1723', '兴安区', '133', '0', '3');
INSERT INTO `shop_area` VALUES ('1724', '兴山区', '133', '0', '3');
INSERT INTO `shop_area` VALUES ('1725', '南山区', '133', '0', '3');
INSERT INTO `shop_area` VALUES ('1726', '向阳区', '133', '0', '3');
INSERT INTO `shop_area` VALUES ('1727', '工农区', '133', '0', '3');
INSERT INTO `shop_area` VALUES ('1728', '绥滨县', '133', '0', '3');
INSERT INTO `shop_area` VALUES ('1729', '萝北县', '133', '0', '3');
INSERT INTO `shop_area` VALUES ('1730', '友谊县', '134', '0', '3');
INSERT INTO `shop_area` VALUES ('1731', '四方台区', '134', '0', '3');
INSERT INTO `shop_area` VALUES ('1732', '宝山区', '134', '0', '3');
INSERT INTO `shop_area` VALUES ('1733', '宝清县', '134', '0', '3');
INSERT INTO `shop_area` VALUES ('1734', '尖山区', '134', '0', '3');
INSERT INTO `shop_area` VALUES ('1735', '岭东区', '134', '0', '3');
INSERT INTO `shop_area` VALUES ('1736', '集贤县', '134', '0', '3');
INSERT INTO `shop_area` VALUES ('1737', '饶河县', '134', '0', '3');
INSERT INTO `shop_area` VALUES ('1738', '大同区', '135', '0', '3');
INSERT INTO `shop_area` VALUES ('1739', '杜尔伯特蒙古族自治县', '135', '0', '3');
INSERT INTO `shop_area` VALUES ('1740', '林甸县', '135', '0', '3');
INSERT INTO `shop_area` VALUES ('1741', '红岗区', '135', '0', '3');
INSERT INTO `shop_area` VALUES ('1742', '肇州县', '135', '0', '3');
INSERT INTO `shop_area` VALUES ('1743', '肇源县', '135', '0', '3');
INSERT INTO `shop_area` VALUES ('1744', '胡路区', '135', '0', '3');
INSERT INTO `shop_area` VALUES ('1745', '萨尔图区', '135', '0', '3');
INSERT INTO `shop_area` VALUES ('1746', '龙凤区', '135', '0', '3');
INSERT INTO `shop_area` VALUES ('1747', '上甘岭区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1748', '乌伊岭区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1749', '乌马河区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1750', '五营区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1751', '伊春区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1752', '南岔区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1753', '友好区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1754', '嘉荫县', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1755', '带岭区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1756', '新青区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1757', '汤旺河区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1758', '红星区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1759', '美溪区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1760', '翠峦区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1761', '西林区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1762', '金山屯区', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1763', '铁力市', '136', '0', '3');
INSERT INTO `shop_area` VALUES ('1764', '东风区', '137', '0', '3');
INSERT INTO `shop_area` VALUES ('1765', '前进区', '137', '0', '3');
INSERT INTO `shop_area` VALUES ('1766', '同江市', '137', '0', '3');
INSERT INTO `shop_area` VALUES ('1767', '向阳区', '137', '0', '3');
INSERT INTO `shop_area` VALUES ('1768', '富锦市', '137', '0', '3');
INSERT INTO `shop_area` VALUES ('1769', '抚远县', '137', '0', '3');
INSERT INTO `shop_area` VALUES ('1770', '桦南县', '137', '0', '3');
INSERT INTO `shop_area` VALUES ('1771', '桦川县', '137', '0', '3');
INSERT INTO `shop_area` VALUES ('1772', '汤原县', '137', '0', '3');
INSERT INTO `shop_area` VALUES ('1773', '郊区', '137', '0', '3');
INSERT INTO `shop_area` VALUES ('1774', '勃利县', '138', '0', '3');
INSERT INTO `shop_area` VALUES ('1775', '新兴区', '138', '0', '3');
INSERT INTO `shop_area` VALUES ('1776', '桃山区', '138', '0', '3');
INSERT INTO `shop_area` VALUES ('1777', '茄子河区', '138', '0', '3');
INSERT INTO `shop_area` VALUES ('1778', '东宁县', '139', '0', '3');
INSERT INTO `shop_area` VALUES ('1779', '东安区', '139', '0', '3');
INSERT INTO `shop_area` VALUES ('1780', '宁安市', '139', '0', '3');
INSERT INTO `shop_area` VALUES ('1781', '林口县', '139', '0', '3');
INSERT INTO `shop_area` VALUES ('1782', '海林市', '139', '0', '3');
INSERT INTO `shop_area` VALUES ('1783', '爱民区', '139', '0', '3');
INSERT INTO `shop_area` VALUES ('1784', '穆棱市', '139', '0', '3');
INSERT INTO `shop_area` VALUES ('1785', '绥芬河市', '139', '0', '3');
INSERT INTO `shop_area` VALUES ('1786', '西安区', '139', '0', '3');
INSERT INTO `shop_area` VALUES ('1787', '阳明区', '139', '0', '3');
INSERT INTO `shop_area` VALUES ('1788', '五大连池市', '140', '0', '3');
INSERT INTO `shop_area` VALUES ('1789', '北安市', '140', '0', '3');
INSERT INTO `shop_area` VALUES ('1790', '嫩江县', '140', '0', '3');
INSERT INTO `shop_area` VALUES ('1791', '孙吴县', '140', '0', '3');
INSERT INTO `shop_area` VALUES ('1792', '爱辉区', '140', '0', '3');
INSERT INTO `shop_area` VALUES ('1793', '车逊克县', '140', '0', '3');
INSERT INTO `shop_area` VALUES ('1794', '逊克县', '140', '0', '3');
INSERT INTO `shop_area` VALUES ('1795', '兰西县', '141', '0', '3');
INSERT INTO `shop_area` VALUES ('1796', '安达市', '141', '0', '3');
INSERT INTO `shop_area` VALUES ('1797', '庆安县', '141', '0', '3');
INSERT INTO `shop_area` VALUES ('1798', '明水县', '141', '0', '3');
INSERT INTO `shop_area` VALUES ('1799', '望奎县', '141', '0', '3');
INSERT INTO `shop_area` VALUES ('1800', '海伦市', '141', '0', '3');
INSERT INTO `shop_area` VALUES ('1801', '绥化市北林区', '141', '0', '3');
INSERT INTO `shop_area` VALUES ('1802', '绥棱县', '141', '0', '3');
INSERT INTO `shop_area` VALUES ('1803', '肇东市', '141', '0', '3');
INSERT INTO `shop_area` VALUES ('1804', '青冈县', '141', '0', '3');
INSERT INTO `shop_area` VALUES ('1805', '呼玛县', '142', '0', '3');
INSERT INTO `shop_area` VALUES ('1806', '塔河县', '142', '0', '3');
INSERT INTO `shop_area` VALUES ('1807', '大兴安岭地区加格达奇区', '142', '0', '3');
INSERT INTO `shop_area` VALUES ('1808', '大兴安岭地区呼中区', '142', '0', '3');
INSERT INTO `shop_area` VALUES ('1809', '大兴安岭地区新林区', '142', '0', '3');
INSERT INTO `shop_area` VALUES ('1810', '大兴安岭地区松岭区', '142', '0', '3');
INSERT INTO `shop_area` VALUES ('1811', '漠河县', '142', '0', '3');
INSERT INTO `shop_area` VALUES ('2027', '下关区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2028', '六合区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2029', '建邺区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2030', '栖霞区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2031', '江宁区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2032', '浦口区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2033', '溧水县', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2034', '玄武区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2035', '白下区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2036', '秦淮区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2037', '雨花台区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2038', '高淳县', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2039', '鼓楼区', '162', '0', '3');
INSERT INTO `shop_area` VALUES ('2040', '北塘区', '163', '0', '3');
INSERT INTO `shop_area` VALUES ('2041', '南长区', '163', '0', '3');
INSERT INTO `shop_area` VALUES ('2042', '宜兴市', '163', '0', '3');
INSERT INTO `shop_area` VALUES ('2043', '崇安区', '163', '0', '3');
INSERT INTO `shop_area` VALUES ('2044', '惠山区', '163', '0', '3');
INSERT INTO `shop_area` VALUES ('2045', '江阴市', '163', '0', '3');
INSERT INTO `shop_area` VALUES ('2046', '滨湖区', '163', '0', '3');
INSERT INTO `shop_area` VALUES ('2047', '锡山区', '163', '0', '3');
INSERT INTO `shop_area` VALUES ('2048', '丰县', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2049', '九里区', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2050', '云龙区', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2051', '新沂市', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2052', '沛县', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2053', '泉山区', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2054', '睢宁县', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2055', '贾汪区', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2056', '邳州市', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2057', '铜山县', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2058', '鼓楼区', '164', '0', '3');
INSERT INTO `shop_area` VALUES ('2059', '天宁区', '165', '0', '3');
INSERT INTO `shop_area` VALUES ('2060', '戚墅堰区', '165', '0', '3');
INSERT INTO `shop_area` VALUES ('2061', '新北区', '165', '0', '3');
INSERT INTO `shop_area` VALUES ('2062', '武进区', '165', '0', '3');
INSERT INTO `shop_area` VALUES ('2063', '溧阳市', '165', '0', '3');
INSERT INTO `shop_area` VALUES ('2064', '金坛市', '165', '0', '3');
INSERT INTO `shop_area` VALUES ('2065', '钟楼区', '165', '0', '3');
INSERT INTO `shop_area` VALUES ('2066', '吴中区', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2067', '吴江市', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2068', '太仓市', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2069', '常熟市', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2070', '平江区', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2071', '张家港市', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2072', '昆山市', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2073', '沧浪区', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2074', '相城区', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2075', '苏州工业园区', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2076', '虎丘区', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2077', '金阊区', '166', '0', '3');
INSERT INTO `shop_area` VALUES ('2078', '启东市', '167', '0', '3');
INSERT INTO `shop_area` VALUES ('2079', '如东县', '167', '0', '3');
INSERT INTO `shop_area` VALUES ('2080', '如皋市', '167', '0', '3');
INSERT INTO `shop_area` VALUES ('2081', '崇川区', '167', '0', '3');
INSERT INTO `shop_area` VALUES ('2082', '海安县', '167', '0', '3');
INSERT INTO `shop_area` VALUES ('2083', '海门市', '167', '0', '3');
INSERT INTO `shop_area` VALUES ('2084', '港闸区', '167', '0', '3');
INSERT INTO `shop_area` VALUES ('2085', '通州市', '167', '0', '3');
INSERT INTO `shop_area` VALUES ('2086', '东海县', '168', '0', '3');
INSERT INTO `shop_area` VALUES ('2087', '新浦区', '168', '0', '3');
INSERT INTO `shop_area` VALUES ('2088', '海州区', '168', '0', '3');
INSERT INTO `shop_area` VALUES ('2089', '灌云县', '168', '0', '3');
INSERT INTO `shop_area` VALUES ('2090', '灌南县', '168', '0', '3');
INSERT INTO `shop_area` VALUES ('2091', '赣榆县', '168', '0', '3');
INSERT INTO `shop_area` VALUES ('2092', '连云区', '168', '0', '3');
INSERT INTO `shop_area` VALUES ('2093', '楚州区', '169', '0', '3');
INSERT INTO `shop_area` VALUES ('2094', '洪泽县', '169', '0', '3');
INSERT INTO `shop_area` VALUES ('2095', '涟水县', '169', '0', '3');
INSERT INTO `shop_area` VALUES ('2096', '淮阴区', '169', '0', '3');
INSERT INTO `shop_area` VALUES ('2097', '清河区', '169', '0', '3');
INSERT INTO `shop_area` VALUES ('2098', '清浦区', '169', '0', '3');
INSERT INTO `shop_area` VALUES ('2099', '盱眙县', '169', '0', '3');
INSERT INTO `shop_area` VALUES ('2100', '金湖县', '169', '0', '3');
INSERT INTO `shop_area` VALUES ('2101', '东台市', '170', '0', '3');
INSERT INTO `shop_area` VALUES ('2102', '亭湖区', '170', '0', '3');
INSERT INTO `shop_area` VALUES ('2103', '响水县', '170', '0', '3');
INSERT INTO `shop_area` VALUES ('2104', '大丰市', '170', '0', '3');
INSERT INTO `shop_area` VALUES ('2105', '射阳县', '170', '0', '3');
INSERT INTO `shop_area` VALUES ('2106', '建湖县', '170', '0', '3');
INSERT INTO `shop_area` VALUES ('2107', '滨海县', '170', '0', '3');
INSERT INTO `shop_area` VALUES ('2108', '盐都区', '170', '0', '3');
INSERT INTO `shop_area` VALUES ('2109', '阜宁县', '170', '0', '3');
INSERT INTO `shop_area` VALUES ('2110', '仪征市', '171', '0', '3');
INSERT INTO `shop_area` VALUES ('2111', '宝应县', '171', '0', '3');
INSERT INTO `shop_area` VALUES ('2112', '广陵区', '171', '0', '3');
INSERT INTO `shop_area` VALUES ('2113', '江都市', '171', '0', '3');
INSERT INTO `shop_area` VALUES ('2114', '维扬区', '171', '0', '3');
INSERT INTO `shop_area` VALUES ('2115', '邗江区', '171', '0', '3');
INSERT INTO `shop_area` VALUES ('2116', '高邮市', '171', '0', '3');
INSERT INTO `shop_area` VALUES ('2117', '丹徒区', '172', '0', '3');
INSERT INTO `shop_area` VALUES ('2118', '丹阳市', '172', '0', '3');
INSERT INTO `shop_area` VALUES ('2119', '京口区', '172', '0', '3');
INSERT INTO `shop_area` VALUES ('2120', '句容市', '172', '0', '3');
INSERT INTO `shop_area` VALUES ('2121', '扬中市', '172', '0', '3');
INSERT INTO `shop_area` VALUES ('2122', '润州区', '172', '0', '3');
INSERT INTO `shop_area` VALUES ('2123', '兴化市', '173', '0', '3');
INSERT INTO `shop_area` VALUES ('2124', '姜堰市', '173', '0', '3');
INSERT INTO `shop_area` VALUES ('2125', '泰兴市', '173', '0', '3');
INSERT INTO `shop_area` VALUES ('2126', '海陵区', '173', '0', '3');
INSERT INTO `shop_area` VALUES ('2127', '靖江市', '173', '0', '3');
INSERT INTO `shop_area` VALUES ('2128', '高港区', '173', '0', '3');
INSERT INTO `shop_area` VALUES ('2129', '宿城区', '174', '0', '3');
INSERT INTO `shop_area` VALUES ('2130', '宿豫区', '174', '0', '3');
INSERT INTO `shop_area` VALUES ('2131', '沭阳县', '174', '0', '3');
INSERT INTO `shop_area` VALUES ('2132', '泗洪县', '174', '0', '3');
INSERT INTO `shop_area` VALUES ('2133', '泗阳县', '174', '0', '3');
INSERT INTO `shop_area` VALUES ('2134', '上城区', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2135', '下城区', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2136', '临安市', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2137', '余杭区', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2138', '富阳市', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2139', '建德市', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2140', '拱墅区', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2141', '桐庐县', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2142', '江干区', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2143', '淳安县', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2144', '滨江区', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2145', '萧山区', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2146', '西湖区', '175', '0', '3');
INSERT INTO `shop_area` VALUES ('2147', '余姚市', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2148', '北仑区', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2149', '奉化市', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2150', '宁海县', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2151', '慈溪市', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2152', '江东区', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2153', '江北区', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2154', '海曙区', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2155', '象山县', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2156', '鄞州区', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2157', '镇海区', '176', '0', '3');
INSERT INTO `shop_area` VALUES ('2158', '乐清市', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2159', '平阳县', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2160', '文成县', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2161', '永嘉县', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2162', '泰顺县', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2163', '洞头县', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2164', '瑞安市', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2165', '瓯海区', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2166', '苍南县', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2167', '鹿城区', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2168', '龙湾区', '177', '0', '3');
INSERT INTO `shop_area` VALUES ('2169', '南湖区', '178', '0', '3');
INSERT INTO `shop_area` VALUES ('2170', '嘉善县', '178', '0', '3');
INSERT INTO `shop_area` VALUES ('2171', '平湖市', '178', '0', '3');
INSERT INTO `shop_area` VALUES ('2172', '桐乡市', '178', '0', '3');
INSERT INTO `shop_area` VALUES ('2173', '海宁市', '178', '0', '3');
INSERT INTO `shop_area` VALUES ('2174', '海盐县', '178', '0', '3');
INSERT INTO `shop_area` VALUES ('2175', '秀洲区', '178', '0', '3');
INSERT INTO `shop_area` VALUES ('2176', '南浔区', '179', '0', '3');
INSERT INTO `shop_area` VALUES ('2177', '吴兴区', '179', '0', '3');
INSERT INTO `shop_area` VALUES ('2178', '安吉县', '179', '0', '3');
INSERT INTO `shop_area` VALUES ('2179', '德清县', '179', '0', '3');
INSERT INTO `shop_area` VALUES ('2180', '长兴县', '179', '0', '3');
INSERT INTO `shop_area` VALUES ('2181', '上虞市', '180', '0', '3');
INSERT INTO `shop_area` VALUES ('2182', '嵊州市', '180', '0', '3');
INSERT INTO `shop_area` VALUES ('2183', '新昌县', '180', '0', '3');
INSERT INTO `shop_area` VALUES ('2184', '绍兴县', '180', '0', '3');
INSERT INTO `shop_area` VALUES ('2185', '诸暨市', '180', '0', '3');
INSERT INTO `shop_area` VALUES ('2186', '越城区', '180', '0', '3');
INSERT INTO `shop_area` VALUES ('2187', '定海区', '181', '0', '3');
INSERT INTO `shop_area` VALUES ('2188', '岱山县', '181', '0', '3');
INSERT INTO `shop_area` VALUES ('2189', '嵊泗县', '181', '0', '3');
INSERT INTO `shop_area` VALUES ('2190', '普陀区', '181', '0', '3');
INSERT INTO `shop_area` VALUES ('2191', '常山县', '182', '0', '3');
INSERT INTO `shop_area` VALUES ('2192', '开化县', '182', '0', '3');
INSERT INTO `shop_area` VALUES ('2193', '柯城区', '182', '0', '3');
INSERT INTO `shop_area` VALUES ('2194', '江山市', '182', '0', '3');
INSERT INTO `shop_area` VALUES ('2195', '衢江区', '182', '0', '3');
INSERT INTO `shop_area` VALUES ('2196', '龙游县', '182', '0', '3');
INSERT INTO `shop_area` VALUES ('2197', '东阳市', '183', '0', '3');
INSERT INTO `shop_area` VALUES ('2198', '义乌市', '183', '0', '3');
INSERT INTO `shop_area` VALUES ('2199', '兰溪市', '183', '0', '3');
INSERT INTO `shop_area` VALUES ('2200', '婺城区', '183', '0', '3');
INSERT INTO `shop_area` VALUES ('2201', '武义县', '183', '0', '3');
INSERT INTO `shop_area` VALUES ('2202', '永康市', '183', '0', '3');
INSERT INTO `shop_area` VALUES ('2203', '浦江县', '183', '0', '3');
INSERT INTO `shop_area` VALUES ('2204', '磐安县', '183', '0', '3');
INSERT INTO `shop_area` VALUES ('2205', '金东区', '183', '0', '3');
INSERT INTO `shop_area` VALUES ('2206', '三门县', '184', '0', '3');
INSERT INTO `shop_area` VALUES ('2207', '临海市', '184', '0', '3');
INSERT INTO `shop_area` VALUES ('2208', '仙居县', '184', '0', '3');
INSERT INTO `shop_area` VALUES ('2209', '天台县', '184', '0', '3');
INSERT INTO `shop_area` VALUES ('2210', '椒江区', '184', '0', '3');
INSERT INTO `shop_area` VALUES ('2211', '温岭市', '184', '0', '3');
INSERT INTO `shop_area` VALUES ('2212', '玉环县', '184', '0', '3');
INSERT INTO `shop_area` VALUES ('2213', '路桥区', '184', '0', '3');
INSERT INTO `shop_area` VALUES ('2214', '黄岩区', '184', '0', '3');
INSERT INTO `shop_area` VALUES ('2215', '云和县', '185', '0', '3');
INSERT INTO `shop_area` VALUES ('2216', '庆元县', '185', '0', '3');
INSERT INTO `shop_area` VALUES ('2217', '景宁畲族自治县', '185', '0', '3');
INSERT INTO `shop_area` VALUES ('2218', '松阳县', '185', '0', '3');
INSERT INTO `shop_area` VALUES ('2219', '缙云县', '185', '0', '3');
INSERT INTO `shop_area` VALUES ('2220', '莲都区', '185', '0', '3');
INSERT INTO `shop_area` VALUES ('2221', '遂昌县', '185', '0', '3');
INSERT INTO `shop_area` VALUES ('2222', '青田县', '185', '0', '3');
INSERT INTO `shop_area` VALUES ('2223', '龙泉市', '185', '0', '3');
INSERT INTO `shop_area` VALUES ('2224', '包河区', '186', '0', '3');
INSERT INTO `shop_area` VALUES ('2225', '庐阳区', '186', '0', '3');
INSERT INTO `shop_area` VALUES ('2226', '瑶海区', '186', '0', '3');
INSERT INTO `shop_area` VALUES ('2227', '肥东县', '186', '0', '3');
INSERT INTO `shop_area` VALUES ('2228', '肥西县', '186', '0', '3');
INSERT INTO `shop_area` VALUES ('2229', '蜀山区', '186', '0', '3');
INSERT INTO `shop_area` VALUES ('2230', '长丰县', '186', '0', '3');
INSERT INTO `shop_area` VALUES ('2231', '三山区', '187', '0', '3');
INSERT INTO `shop_area` VALUES ('2232', '南陵县', '187', '0', '3');
INSERT INTO `shop_area` VALUES ('2233', '弋江区', '187', '0', '3');
INSERT INTO `shop_area` VALUES ('2234', '繁昌县', '187', '0', '3');
INSERT INTO `shop_area` VALUES ('2235', '芜湖县', '187', '0', '3');
INSERT INTO `shop_area` VALUES ('2236', '镜湖区', '187', '0', '3');
INSERT INTO `shop_area` VALUES ('2237', '鸠江区', '187', '0', '3');
INSERT INTO `shop_area` VALUES ('2238', '五河县', '188', '0', '3');
INSERT INTO `shop_area` VALUES ('2239', '固镇县', '188', '0', '3');
INSERT INTO `shop_area` VALUES ('2240', '怀远县', '188', '0', '3');
INSERT INTO `shop_area` VALUES ('2241', '淮上区', '188', '0', '3');
INSERT INTO `shop_area` VALUES ('2242', '禹会区', '188', '0', '3');
INSERT INTO `shop_area` VALUES ('2243', '蚌山区', '188', '0', '3');
INSERT INTO `shop_area` VALUES ('2244', '龙子湖区', '188', '0', '3');
INSERT INTO `shop_area` VALUES ('2245', '八公山区', '189', '0', '3');
INSERT INTO `shop_area` VALUES ('2246', '凤台县', '189', '0', '3');
INSERT INTO `shop_area` VALUES ('2247', '大通区', '189', '0', '3');
INSERT INTO `shop_area` VALUES ('2248', '潘集区', '189', '0', '3');
INSERT INTO `shop_area` VALUES ('2249', '田家庵区', '189', '0', '3');
INSERT INTO `shop_area` VALUES ('2250', '谢家集区', '189', '0', '3');
INSERT INTO `shop_area` VALUES ('2251', '当涂县', '190', '0', '3');
INSERT INTO `shop_area` VALUES ('2252', '花山区', '190', '0', '3');
INSERT INTO `shop_area` VALUES ('2253', '金家庄区', '190', '0', '3');
INSERT INTO `shop_area` VALUES ('2254', '雨山区', '190', '0', '3');
INSERT INTO `shop_area` VALUES ('2255', '杜集区', '191', '0', '3');
INSERT INTO `shop_area` VALUES ('2256', '濉溪县', '191', '0', '3');
INSERT INTO `shop_area` VALUES ('2257', '烈山区', '191', '0', '3');
INSERT INTO `shop_area` VALUES ('2258', '相山区', '191', '0', '3');
INSERT INTO `shop_area` VALUES ('2259', '狮子山区', '192', '0', '3');
INSERT INTO `shop_area` VALUES ('2260', '郊区', '192', '0', '3');
INSERT INTO `shop_area` VALUES ('2261', '铜官山区', '192', '0', '3');
INSERT INTO `shop_area` VALUES ('2262', '铜陵县', '192', '0', '3');
INSERT INTO `shop_area` VALUES ('2263', '大观区', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2264', '太湖县', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2265', '宜秀区', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2266', '宿松县', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2267', '岳西县', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2268', '怀宁县', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2269', '望江县', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2270', '枞阳县', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2271', '桐城市', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2272', '潜山县', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2273', '迎江区', '193', '0', '3');
INSERT INTO `shop_area` VALUES ('2274', '休宁县', '194', '0', '3');
INSERT INTO `shop_area` VALUES ('2275', '屯溪区', '194', '0', '3');
INSERT INTO `shop_area` VALUES ('2276', '徽州区', '194', '0', '3');
INSERT INTO `shop_area` VALUES ('2277', '歙县', '194', '0', '3');
INSERT INTO `shop_area` VALUES ('2278', '祁门县', '194', '0', '3');
INSERT INTO `shop_area` VALUES ('2279', '黄山区', '194', '0', '3');
INSERT INTO `shop_area` VALUES ('2280', '黟县', '194', '0', '3');
INSERT INTO `shop_area` VALUES ('2281', '全椒县', '195', '0', '3');
INSERT INTO `shop_area` VALUES ('2282', '凤阳县', '195', '0', '3');
INSERT INTO `shop_area` VALUES ('2283', '南谯区', '195', '0', '3');
INSERT INTO `shop_area` VALUES ('2284', '天长市', '195', '0', '3');
INSERT INTO `shop_area` VALUES ('2285', '定远县', '195', '0', '3');
INSERT INTO `shop_area` VALUES ('2286', '明光市', '195', '0', '3');
INSERT INTO `shop_area` VALUES ('2287', '来安县', '195', '0', '3');
INSERT INTO `shop_area` VALUES ('2288', '琅玡区', '195', '0', '3');
INSERT INTO `shop_area` VALUES ('2289', '临泉县', '196', '0', '3');
INSERT INTO `shop_area` VALUES ('2290', '太和县', '196', '0', '3');
INSERT INTO `shop_area` VALUES ('2291', '界首市', '196', '0', '3');
INSERT INTO `shop_area` VALUES ('2292', '阜南县', '196', '0', '3');
INSERT INTO `shop_area` VALUES ('2293', '颍东区', '196', '0', '3');
INSERT INTO `shop_area` VALUES ('2294', '颍州区', '196', '0', '3');
INSERT INTO `shop_area` VALUES ('2295', '颍泉区', '196', '0', '3');
INSERT INTO `shop_area` VALUES ('2296', '颖上县', '196', '0', '3');
INSERT INTO `shop_area` VALUES ('2297', '埇桥区', '197', '0', '3');
INSERT INTO `shop_area` VALUES ('2298', '泗县辖', '197', '0', '3');
INSERT INTO `shop_area` VALUES ('2299', '灵璧县', '197', '0', '3');
INSERT INTO `shop_area` VALUES ('2300', '砀山县', '197', '0', '3');
INSERT INTO `shop_area` VALUES ('2301', '萧县', '197', '0', '3');
INSERT INTO `shop_area` VALUES ('2302', '含山县', '198', '0', '3');
INSERT INTO `shop_area` VALUES ('2303', '和县', '198', '0', '3');
INSERT INTO `shop_area` VALUES ('2304', '居巢区', '198', '0', '3');
INSERT INTO `shop_area` VALUES ('2305', '庐江县', '198', '0', '3');
INSERT INTO `shop_area` VALUES ('2306', '无为县', '198', '0', '3');
INSERT INTO `shop_area` VALUES ('2307', '寿县', '199', '0', '3');
INSERT INTO `shop_area` VALUES ('2308', '舒城县', '199', '0', '3');
INSERT INTO `shop_area` VALUES ('2309', '裕安区', '199', '0', '3');
INSERT INTO `shop_area` VALUES ('2310', '金安区', '199', '0', '3');
INSERT INTO `shop_area` VALUES ('2311', '金寨县', '199', '0', '3');
INSERT INTO `shop_area` VALUES ('2312', '霍山县', '199', '0', '3');
INSERT INTO `shop_area` VALUES ('2313', '霍邱县', '199', '0', '3');
INSERT INTO `shop_area` VALUES ('2314', '利辛县', '200', '0', '3');
INSERT INTO `shop_area` VALUES ('2315', '涡阳县', '200', '0', '3');
INSERT INTO `shop_area` VALUES ('2316', '蒙城县', '200', '0', '3');
INSERT INTO `shop_area` VALUES ('2317', '谯城区', '200', '0', '3');
INSERT INTO `shop_area` VALUES ('2318', '东至县', '201', '0', '3');
INSERT INTO `shop_area` VALUES ('2319', '石台县', '201', '0', '3');
INSERT INTO `shop_area` VALUES ('2320', '贵池区', '201', '0', '3');
INSERT INTO `shop_area` VALUES ('2321', '青阳县', '201', '0', '3');
INSERT INTO `shop_area` VALUES ('2322', '宁国市', '202', '0', '3');
INSERT INTO `shop_area` VALUES ('2323', '宣州区', '202', '0', '3');
INSERT INTO `shop_area` VALUES ('2324', '广德县', '202', '0', '3');
INSERT INTO `shop_area` VALUES ('2325', '旌德县', '202', '0', '3');
INSERT INTO `shop_area` VALUES ('2326', '泾县', '202', '0', '3');
INSERT INTO `shop_area` VALUES ('2327', '绩溪县', '202', '0', '3');
INSERT INTO `shop_area` VALUES ('2328', '郎溪县', '202', '0', '3');
INSERT INTO `shop_area` VALUES ('2329', '仓山区', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2330', '台江区', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2331', '平潭县', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2332', '晋安区', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2333', '永泰县', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2334', '福清市', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2335', '罗源县', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2336', '连江县', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2337', '长乐市', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2338', '闽侯县', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2339', '闽清县', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2340', '马尾区', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2341', '鼓楼区', '203', '0', '3');
INSERT INTO `shop_area` VALUES ('2342', '同安区', '204', '0', '3');
INSERT INTO `shop_area` VALUES ('2343', '思明区', '204', '0', '3');
INSERT INTO `shop_area` VALUES ('2344', '海沧区', '204', '0', '3');
INSERT INTO `shop_area` VALUES ('2345', '湖里区', '204', '0', '3');
INSERT INTO `shop_area` VALUES ('2346', '翔安区', '204', '0', '3');
INSERT INTO `shop_area` VALUES ('2347', '集美区', '204', '0', '3');
INSERT INTO `shop_area` VALUES ('2348', '仙游县', '205', '0', '3');
INSERT INTO `shop_area` VALUES ('2349', '城厢区', '205', '0', '3');
INSERT INTO `shop_area` VALUES ('2350', '涵江区', '205', '0', '3');
INSERT INTO `shop_area` VALUES ('2351', '秀屿区', '205', '0', '3');
INSERT INTO `shop_area` VALUES ('2352', '荔城区', '205', '0', '3');
INSERT INTO `shop_area` VALUES ('2353', '三元区', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2354', '大田县', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2355', '宁化县', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2356', '将乐县', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2357', '尤溪县', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2358', '建宁县', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2359', '明溪县', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2360', '梅列区', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2361', '永安市', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2362', '沙县', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2363', '泰宁县', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2364', '清流县', '206', '0', '3');
INSERT INTO `shop_area` VALUES ('2365', '丰泽区', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2366', '南安市', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2367', '安溪县', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2368', '德化县', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2369', '惠安县', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2370', '晋江市', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2371', '永春县', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2372', '泉港区', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2373', '洛江区', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2374', '石狮市', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2375', '金门县', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2376', '鲤城区', '207', '0', '3');
INSERT INTO `shop_area` VALUES ('2377', '东山县', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2378', '云霄县', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2379', '华安县', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2380', '南靖县', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2381', '平和县', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2382', '漳浦县', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2383', '芗城区', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2384', '诏安县', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2385', '长泰县', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2386', '龙文区', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2387', '龙海市', '208', '0', '3');
INSERT INTO `shop_area` VALUES ('2388', '光泽县', '209', '0', '3');
INSERT INTO `shop_area` VALUES ('2389', '延平区', '209', '0', '3');
INSERT INTO `shop_area` VALUES ('2390', '建瓯市', '209', '0', '3');
INSERT INTO `shop_area` VALUES ('2391', '建阳市', '209', '0', '3');
INSERT INTO `shop_area` VALUES ('2392', '政和县', '209', '0', '3');
INSERT INTO `shop_area` VALUES ('2393', '松溪县', '209', '0', '3');
INSERT INTO `shop_area` VALUES ('2394', '武夷山市', '209', '0', '3');
INSERT INTO `shop_area` VALUES ('2395', '浦城县', '209', '0', '3');
INSERT INTO `shop_area` VALUES ('2396', '邵武市', '209', '0', '3');
INSERT INTO `shop_area` VALUES ('2397', '顺昌县', '209', '0', '3');
INSERT INTO `shop_area` VALUES ('2398', '上杭县', '210', '0', '3');
INSERT INTO `shop_area` VALUES ('2399', '新罗区', '210', '0', '3');
INSERT INTO `shop_area` VALUES ('2400', '武平县', '210', '0', '3');
INSERT INTO `shop_area` VALUES ('2401', '永定县', '210', '0', '3');
INSERT INTO `shop_area` VALUES ('2402', '漳平市', '210', '0', '3');
INSERT INTO `shop_area` VALUES ('2403', '连城县', '210', '0', '3');
INSERT INTO `shop_area` VALUES ('2404', '长汀县', '210', '0', '3');
INSERT INTO `shop_area` VALUES ('2405', '古田县', '211', '0', '3');
INSERT INTO `shop_area` VALUES ('2406', '周宁县', '211', '0', '3');
INSERT INTO `shop_area` VALUES ('2407', '寿宁县', '211', '0', '3');
INSERT INTO `shop_area` VALUES ('2408', '屏南县', '211', '0', '3');
INSERT INTO `shop_area` VALUES ('2409', '柘荣县', '211', '0', '3');
INSERT INTO `shop_area` VALUES ('2410', '福安市', '211', '0', '3');
INSERT INTO `shop_area` VALUES ('2411', '福鼎市', '211', '0', '3');
INSERT INTO `shop_area` VALUES ('2412', '蕉城区', '211', '0', '3');
INSERT INTO `shop_area` VALUES ('2413', '霞浦县', '211', '0', '3');
INSERT INTO `shop_area` VALUES ('2414', '东湖区', '212', '0', '3');
INSERT INTO `shop_area` VALUES ('2415', '南昌县', '212', '0', '3');
INSERT INTO `shop_area` VALUES ('2416', '安义县', '212', '0', '3');
INSERT INTO `shop_area` VALUES ('2417', '新建县', '212', '0', '3');
INSERT INTO `shop_area` VALUES ('2418', '湾里区', '212', '0', '3');
INSERT INTO `shop_area` VALUES ('2419', '西湖区', '212', '0', '3');
INSERT INTO `shop_area` VALUES ('2420', '进贤县', '212', '0', '3');
INSERT INTO `shop_area` VALUES ('2421', '青云谱区', '212', '0', '3');
INSERT INTO `shop_area` VALUES ('2422', '青山湖区', '212', '0', '3');
INSERT INTO `shop_area` VALUES ('2423', '乐平市', '213', '0', '3');
INSERT INTO `shop_area` VALUES ('2424', '昌江区', '213', '0', '3');
INSERT INTO `shop_area` VALUES ('2425', '浮梁县', '213', '0', '3');
INSERT INTO `shop_area` VALUES ('2426', '珠山区', '213', '0', '3');
INSERT INTO `shop_area` VALUES ('2427', '上栗县', '214', '0', '3');
INSERT INTO `shop_area` VALUES ('2428', '安源区', '214', '0', '3');
INSERT INTO `shop_area` VALUES ('2429', '湘东区', '214', '0', '3');
INSERT INTO `shop_area` VALUES ('2430', '芦溪县', '214', '0', '3');
INSERT INTO `shop_area` VALUES ('2431', '莲花县', '214', '0', '3');
INSERT INTO `shop_area` VALUES ('2432', '九江县', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2433', '修水县', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2434', '庐山区', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2435', '彭泽县', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2436', '德安县', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2437', '星子县', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2438', '武宁县', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2439', '永修县', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2440', '浔阳区', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2441', '湖口县', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2442', '瑞昌市', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2443', '都昌县', '215', '0', '3');
INSERT INTO `shop_area` VALUES ('2444', '分宜县', '216', '0', '3');
INSERT INTO `shop_area` VALUES ('2445', '渝水区', '216', '0', '3');
INSERT INTO `shop_area` VALUES ('2446', '余江县', '217', '0', '3');
INSERT INTO `shop_area` VALUES ('2447', '月湖区', '217', '0', '3');
INSERT INTO `shop_area` VALUES ('2448', '贵溪市', '217', '0', '3');
INSERT INTO `shop_area` VALUES ('2449', '上犹县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2450', '于都县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2451', '会昌县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2452', '信丰县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2453', '全南县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2454', '兴国县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2455', '南康市', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2456', '大余县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2457', '宁都县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2458', '安远县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2459', '定南县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2460', '寻乌县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2461', '崇义县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2462', '瑞金市', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2463', '石城县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2464', '章贡区', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2465', '赣县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2466', '龙南县', '218', '0', '3');
INSERT INTO `shop_area` VALUES ('2467', '万安县', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2468', '井冈山市', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2469', '吉安县', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2470', '吉州区', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2471', '吉水县', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2472', '安福县', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2473', '峡江县', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2474', '新干县', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2475', '永丰县', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2476', '永新县', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2477', '泰和县', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2478', '遂川县', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2479', '青原区', '219', '0', '3');
INSERT INTO `shop_area` VALUES ('2480', '万载县', '220', '0', '3');
INSERT INTO `shop_area` VALUES ('2481', '上高县', '220', '0', '3');
INSERT INTO `shop_area` VALUES ('2482', '丰城市', '220', '0', '3');
INSERT INTO `shop_area` VALUES ('2483', '奉新县', '220', '0', '3');
INSERT INTO `shop_area` VALUES ('2484', '宜丰县', '220', '0', '3');
INSERT INTO `shop_area` VALUES ('2485', '樟树市', '220', '0', '3');
INSERT INTO `shop_area` VALUES ('2486', '袁州区', '220', '0', '3');
INSERT INTO `shop_area` VALUES ('2487', '铜鼓县', '220', '0', '3');
INSERT INTO `shop_area` VALUES ('2488', '靖安县', '220', '0', '3');
INSERT INTO `shop_area` VALUES ('2489', '高安市', '220', '0', '3');
INSERT INTO `shop_area` VALUES ('2490', '东乡县', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2491', '临川区', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2492', '乐安县', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2493', '南丰县', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2494', '南城县', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2495', '宜黄县', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2496', '崇仁县', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2497', '广昌县', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2498', '资溪县', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2499', '金溪县', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2500', '黎川县', '221', '0', '3');
INSERT INTO `shop_area` VALUES ('2501', '万年县', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2502', '上饶县', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2503', '余干县', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2504', '信州区', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2505', '婺源县', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2506', '广丰县', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2507', '弋阳县', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2508', '德兴市', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2509', '横峰县', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2510', '玉山县', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2511', '鄱阳县', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2512', '铅山县', '222', '0', '3');
INSERT INTO `shop_area` VALUES ('2513', '历下区', '223', '0', '3');
INSERT INTO `shop_area` VALUES ('2514', '历城区', '223', '0', '3');
INSERT INTO `shop_area` VALUES ('2515', '商河县', '223', '0', '3');
INSERT INTO `shop_area` VALUES ('2516', '天桥区', '223', '0', '3');
INSERT INTO `shop_area` VALUES ('2517', '市中区', '223', '0', '3');
INSERT INTO `shop_area` VALUES ('2518', '平阴县', '223', '0', '3');
INSERT INTO `shop_area` VALUES ('2519', '槐荫区', '223', '0', '3');
INSERT INTO `shop_area` VALUES ('2520', '济阳县', '223', '0', '3');
INSERT INTO `shop_area` VALUES ('2521', '章丘市', '223', '0', '3');
INSERT INTO `shop_area` VALUES ('2522', '长清区', '223', '0', '3');
INSERT INTO `shop_area` VALUES ('2523', '即墨市', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2524', '四方区', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2525', '城阳区', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2526', '崂山区', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2527', '市北区', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2528', '市南区', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2529', '平度市', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2530', '李沧区', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2531', '胶南市', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2532', '胶州市', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2533', '莱西市', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2534', '黄岛区', '224', '0', '3');
INSERT INTO `shop_area` VALUES ('2535', '临淄区', '225', '0', '3');
INSERT INTO `shop_area` VALUES ('2536', '博山区', '225', '0', '3');
INSERT INTO `shop_area` VALUES ('2537', '周村区', '225', '0', '3');
INSERT INTO `shop_area` VALUES ('2538', '张店区', '225', '0', '3');
INSERT INTO `shop_area` VALUES ('2539', '桓台县', '225', '0', '3');
INSERT INTO `shop_area` VALUES ('2540', '沂源县', '225', '0', '3');
INSERT INTO `shop_area` VALUES ('2541', '淄川区', '225', '0', '3');
INSERT INTO `shop_area` VALUES ('2542', '高青县', '225', '0', '3');
INSERT INTO `shop_area` VALUES ('2543', '台儿庄区', '226', '0', '3');
INSERT INTO `shop_area` VALUES ('2544', '山亭区', '226', '0', '3');
INSERT INTO `shop_area` VALUES ('2545', '峄城区', '226', '0', '3');
INSERT INTO `shop_area` VALUES ('2546', '市中区', '226', '0', '3');
INSERT INTO `shop_area` VALUES ('2547', '滕州市', '226', '0', '3');
INSERT INTO `shop_area` VALUES ('2548', '薛城区', '226', '0', '3');
INSERT INTO `shop_area` VALUES ('2549', '东营区', '227', '0', '3');
INSERT INTO `shop_area` VALUES ('2550', '利津县', '227', '0', '3');
INSERT INTO `shop_area` VALUES ('2551', '垦利县', '227', '0', '3');
INSERT INTO `shop_area` VALUES ('2552', '广饶县', '227', '0', '3');
INSERT INTO `shop_area` VALUES ('2553', '河口区', '227', '0', '3');
INSERT INTO `shop_area` VALUES ('2554', '招远市', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2555', '栖霞市', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2556', '海阳市', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2557', '牟平区', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2558', '福山区', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2559', '芝罘区', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2560', '莱山区', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2561', '莱州市', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2562', '莱阳市', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2563', '蓬莱市', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2564', '长岛县', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2565', '龙口市', '228', '0', '3');
INSERT INTO `shop_area` VALUES ('2566', '临朐县', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2567', '坊子区', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2568', '奎文区', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2569', '安丘市', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2570', '寒亭区', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2571', '寿光市', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2572', '昌乐县', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2573', '昌邑市', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2574', '潍城区', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2575', '诸城市', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2576', '青州市', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2577', '高密市', '229', '0', '3');
INSERT INTO `shop_area` VALUES ('2578', '任城区', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2579', '兖州市', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2580', '嘉祥县', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2581', '市中区', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2582', '微山县', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2583', '曲阜市', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2584', '梁山县', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2585', '汶上县', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2586', '泗水县', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2587', '邹城市', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2588', '金乡县', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2589', '鱼台县', '230', '0', '3');
INSERT INTO `shop_area` VALUES ('2590', '东平县', '231', '0', '3');
INSERT INTO `shop_area` VALUES ('2591', '宁阳县', '231', '0', '3');
INSERT INTO `shop_area` VALUES ('2592', '岱岳区', '231', '0', '3');
INSERT INTO `shop_area` VALUES ('2593', '新泰市', '231', '0', '3');
INSERT INTO `shop_area` VALUES ('2594', '泰山区', '231', '0', '3');
INSERT INTO `shop_area` VALUES ('2595', '肥城市', '231', '0', '3');
INSERT INTO `shop_area` VALUES ('2596', '乳山市', '232', '0', '3');
INSERT INTO `shop_area` VALUES ('2597', '文登市', '232', '0', '3');
INSERT INTO `shop_area` VALUES ('2598', '环翠区', '232', '0', '3');
INSERT INTO `shop_area` VALUES ('2599', '荣成市', '232', '0', '3');
INSERT INTO `shop_area` VALUES ('2600', '东港区', '233', '0', '3');
INSERT INTO `shop_area` VALUES ('2601', '五莲县', '233', '0', '3');
INSERT INTO `shop_area` VALUES ('2602', '岚山区', '233', '0', '3');
INSERT INTO `shop_area` VALUES ('2603', '莒县', '233', '0', '3');
INSERT INTO `shop_area` VALUES ('2604', '莱城区', '234', '0', '3');
INSERT INTO `shop_area` VALUES ('2605', '钢城区', '234', '0', '3');
INSERT INTO `shop_area` VALUES ('2606', '临沭县', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2607', '兰山区', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2608', '平邑县', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2609', '沂南县', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2610', '沂水县', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2611', '河东区', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2612', '罗庄区', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2613', '苍山县', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2614', '莒南县', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2615', '蒙阴县', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2616', '费县', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2617', '郯城县', '235', '0', '3');
INSERT INTO `shop_area` VALUES ('2618', '临邑县', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2619', '乐陵市', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2620', '夏津县', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2621', '宁津县', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2622', '平原县', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2623', '庆云县', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2624', '德城区', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2625', '武城县', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2626', '禹城市', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2627', '陵县', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2628', '齐河县', '236', '0', '3');
INSERT INTO `shop_area` VALUES ('2629', '东昌府区', '237', '0', '3');
INSERT INTO `shop_area` VALUES ('2630', '东阿县', '237', '0', '3');
INSERT INTO `shop_area` VALUES ('2631', '临清市', '237', '0', '3');
INSERT INTO `shop_area` VALUES ('2632', '冠县', '237', '0', '3');
INSERT INTO `shop_area` VALUES ('2633', '茌平县', '237', '0', '3');
INSERT INTO `shop_area` VALUES ('2634', '莘县', '237', '0', '3');
INSERT INTO `shop_area` VALUES ('2635', '阳谷县', '237', '0', '3');
INSERT INTO `shop_area` VALUES ('2636', '高唐县', '237', '0', '3');
INSERT INTO `shop_area` VALUES ('2637', '博兴县', '238', '0', '3');
INSERT INTO `shop_area` VALUES ('2638', '惠民县', '238', '0', '3');
INSERT INTO `shop_area` VALUES ('2639', '无棣县', '238', '0', '3');
INSERT INTO `shop_area` VALUES ('2640', '沾化县', '238', '0', '3');
INSERT INTO `shop_area` VALUES ('2641', '滨城区', '238', '0', '3');
INSERT INTO `shop_area` VALUES ('2642', '邹平县', '238', '0', '3');
INSERT INTO `shop_area` VALUES ('2643', '阳信县', '238', '0', '3');
INSERT INTO `shop_area` VALUES ('2644', '东明县', '239', '0', '3');
INSERT INTO `shop_area` VALUES ('2645', '单县', '239', '0', '3');
INSERT INTO `shop_area` VALUES ('2646', '定陶县', '239', '0', '3');
INSERT INTO `shop_area` VALUES ('2647', '巨野县', '239', '0', '3');
INSERT INTO `shop_area` VALUES ('2648', '成武县', '239', '0', '3');
INSERT INTO `shop_area` VALUES ('2649', '曹县', '239', '0', '3');
INSERT INTO `shop_area` VALUES ('2650', '牡丹区', '239', '0', '3');
INSERT INTO `shop_area` VALUES ('2651', '郓城县', '239', '0', '3');
INSERT INTO `shop_area` VALUES ('2652', '鄄城县', '239', '0', '3');
INSERT INTO `shop_area` VALUES ('2653', '上街区', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2654', '中原区', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2655', '中牟县', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2656', '二七区', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2657', '巩义市', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2658', '惠济区', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2659', '新密市', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2660', '新郑市', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2661', '登封市', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2662', '管城回族区', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2663', '荥阳市', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2664', '金水区', '240', '0', '3');
INSERT INTO `shop_area` VALUES ('2665', '兰考县', '241', '0', '3');
INSERT INTO `shop_area` VALUES ('2666', '尉氏县', '241', '0', '3');
INSERT INTO `shop_area` VALUES ('2667', '开封县', '241', '0', '3');
INSERT INTO `shop_area` VALUES ('2668', '杞县', '241', '0', '3');
INSERT INTO `shop_area` VALUES ('2669', '禹王台区', '241', '0', '3');
INSERT INTO `shop_area` VALUES ('2670', '通许县', '241', '0', '3');
INSERT INTO `shop_area` VALUES ('2671', '金明区', '241', '0', '3');
INSERT INTO `shop_area` VALUES ('2672', '顺河回族区', '241', '0', '3');
INSERT INTO `shop_area` VALUES ('2673', '鼓楼区', '241', '0', '3');
INSERT INTO `shop_area` VALUES ('2674', '龙亭区', '241', '0', '3');
INSERT INTO `shop_area` VALUES ('2675', '伊川县', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2676', '偃师市', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2677', '吉利区', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2678', '孟津县', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2679', '宜阳县', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2680', '嵩县', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2681', '新安县', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2682', '栾川县', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2683', '汝阳县', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2684', '洛宁县', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2685', '洛龙区', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2686', '涧西区', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2687', '瀍河回族区', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2688', '老城区', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2689', '西工区', '242', '0', '3');
INSERT INTO `shop_area` VALUES ('2690', '卫东区', '243', '0', '3');
INSERT INTO `shop_area` VALUES ('2691', '叶县', '243', '0', '3');
INSERT INTO `shop_area` VALUES ('2692', '宝丰县', '243', '0', '3');
INSERT INTO `shop_area` VALUES ('2693', '新华区', '243', '0', '3');
INSERT INTO `shop_area` VALUES ('2694', '汝州市', '243', '0', '3');
INSERT INTO `shop_area` VALUES ('2695', '湛河区', '243', '0', '3');
INSERT INTO `shop_area` VALUES ('2696', '石龙区', '243', '0', '3');
INSERT INTO `shop_area` VALUES ('2697', '舞钢市', '243', '0', '3');
INSERT INTO `shop_area` VALUES ('2698', '郏县', '243', '0', '3');
INSERT INTO `shop_area` VALUES ('2699', '鲁山县', '243', '0', '3');
INSERT INTO `shop_area` VALUES ('2700', '内黄县', '244', '0', '3');
INSERT INTO `shop_area` VALUES ('2701', '北关区', '244', '0', '3');
INSERT INTO `shop_area` VALUES ('2702', '安阳县', '244', '0', '3');
INSERT INTO `shop_area` VALUES ('2703', '文峰区', '244', '0', '3');
INSERT INTO `shop_area` VALUES ('2704', '林州市', '244', '0', '3');
INSERT INTO `shop_area` VALUES ('2705', '殷都区', '244', '0', '3');
INSERT INTO `shop_area` VALUES ('2706', '汤阴县', '244', '0', '3');
INSERT INTO `shop_area` VALUES ('2707', '滑县', '244', '0', '3');
INSERT INTO `shop_area` VALUES ('2708', '龙安区', '244', '0', '3');
INSERT INTO `shop_area` VALUES ('2709', '山城区', '245', '0', '3');
INSERT INTO `shop_area` VALUES ('2710', '浚县', '245', '0', '3');
INSERT INTO `shop_area` VALUES ('2711', '淇县', '245', '0', '3');
INSERT INTO `shop_area` VALUES ('2712', '淇滨区', '245', '0', '3');
INSERT INTO `shop_area` VALUES ('2713', '鹤山区', '245', '0', '3');
INSERT INTO `shop_area` VALUES ('2714', '凤泉区', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2715', '卫滨区', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2716', '卫辉市', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2717', '原阳县', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2718', '封丘县', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2719', '延津县', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2720', '新乡县', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2721', '牧野区', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2722', '红旗区', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2723', '获嘉县', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2724', '辉县市', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2725', '长垣县', '246', '0', '3');
INSERT INTO `shop_area` VALUES ('2726', '中站区', '247', '0', '3');
INSERT INTO `shop_area` VALUES ('2727', '修武县', '247', '0', '3');
INSERT INTO `shop_area` VALUES ('2728', '博爱县', '247', '0', '3');
INSERT INTO `shop_area` VALUES ('2729', '孟州市', '247', '0', '3');
INSERT INTO `shop_area` VALUES ('2730', '山阳区', '247', '0', '3');
INSERT INTO `shop_area` VALUES ('2731', '武陟县', '247', '0', '3');
INSERT INTO `shop_area` VALUES ('2732', '沁阳市', '247', '0', '3');
INSERT INTO `shop_area` VALUES ('2733', '温县', '247', '0', '3');
INSERT INTO `shop_area` VALUES ('2734', '解放区', '247', '0', '3');
INSERT INTO `shop_area` VALUES ('2735', '马村区', '247', '0', '3');
INSERT INTO `shop_area` VALUES ('2736', '华龙区', '248', '0', '3');
INSERT INTO `shop_area` VALUES ('2737', '南乐县', '248', '0', '3');
INSERT INTO `shop_area` VALUES ('2738', '台前县', '248', '0', '3');
INSERT INTO `shop_area` VALUES ('2739', '清丰县', '248', '0', '3');
INSERT INTO `shop_area` VALUES ('2740', '濮阳县', '248', '0', '3');
INSERT INTO `shop_area` VALUES ('2741', '范县', '248', '0', '3');
INSERT INTO `shop_area` VALUES ('2742', '禹州市', '249', '0', '3');
INSERT INTO `shop_area` VALUES ('2743', '襄城县', '249', '0', '3');
INSERT INTO `shop_area` VALUES ('2744', '许昌县', '249', '0', '3');
INSERT INTO `shop_area` VALUES ('2745', '鄢陵县', '249', '0', '3');
INSERT INTO `shop_area` VALUES ('2746', '长葛市', '249', '0', '3');
INSERT INTO `shop_area` VALUES ('2747', '魏都区', '249', '0', '3');
INSERT INTO `shop_area` VALUES ('2748', '临颍县', '250', '0', '3');
INSERT INTO `shop_area` VALUES ('2749', '召陵区', '250', '0', '3');
INSERT INTO `shop_area` VALUES ('2750', '源汇区', '250', '0', '3');
INSERT INTO `shop_area` VALUES ('2751', '舞阳县', '250', '0', '3');
INSERT INTO `shop_area` VALUES ('2752', '郾城区', '250', '0', '3');
INSERT INTO `shop_area` VALUES ('2753', '义马市', '251', '0', '3');
INSERT INTO `shop_area` VALUES ('2754', '卢氏县', '251', '0', '3');
INSERT INTO `shop_area` VALUES ('2755', '渑池县', '251', '0', '3');
INSERT INTO `shop_area` VALUES ('2756', '湖滨区', '251', '0', '3');
INSERT INTO `shop_area` VALUES ('2757', '灵宝市', '251', '0', '3');
INSERT INTO `shop_area` VALUES ('2758', '陕县', '251', '0', '3');
INSERT INTO `shop_area` VALUES ('2759', '内乡县', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2760', '南召县', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2761', '卧龙区', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2762', '唐河县', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2763', '宛城区', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2764', '新野县', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2765', '方城县', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2766', '桐柏县', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2767', '淅川县', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2768', '社旗县', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2769', '西峡县', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2770', '邓州市', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2771', '镇平县', '252', '0', '3');
INSERT INTO `shop_area` VALUES ('2772', '夏邑县', '253', '0', '3');
INSERT INTO `shop_area` VALUES ('2773', '宁陵县', '253', '0', '3');
INSERT INTO `shop_area` VALUES ('2774', '柘城县', '253', '0', '3');
INSERT INTO `shop_area` VALUES ('2775', '民权县', '253', '0', '3');
INSERT INTO `shop_area` VALUES ('2776', '永城市', '253', '0', '3');
INSERT INTO `shop_area` VALUES ('2777', '睢县', '253', '0', '3');
INSERT INTO `shop_area` VALUES ('2778', '睢阳区', '253', '0', '3');
INSERT INTO `shop_area` VALUES ('2779', '粱园区', '253', '0', '3');
INSERT INTO `shop_area` VALUES ('2780', '虞城县', '253', '0', '3');
INSERT INTO `shop_area` VALUES ('2781', '光山县', '254', '0', '3');
INSERT INTO `shop_area` VALUES ('2782', '商城县', '254', '0', '3');
INSERT INTO `shop_area` VALUES ('2783', '固始县', '254', '0', '3');
INSERT INTO `shop_area` VALUES ('2784', '平桥区', '254', '0', '3');
INSERT INTO `shop_area` VALUES ('2785', '息县', '254', '0', '3');
INSERT INTO `shop_area` VALUES ('2786', '新县', '254', '0', '3');
INSERT INTO `shop_area` VALUES ('2787', '浉河区', '254', '0', '3');
INSERT INTO `shop_area` VALUES ('2788', '淮滨县', '254', '0', '3');
INSERT INTO `shop_area` VALUES ('2789', '潢川县', '254', '0', '3');
INSERT INTO `shop_area` VALUES ('2790', '罗山县', '254', '0', '3');
INSERT INTO `shop_area` VALUES ('2791', '商水县', '255', '0', '3');
INSERT INTO `shop_area` VALUES ('2792', '太康县', '255', '0', '3');
INSERT INTO `shop_area` VALUES ('2793', '川汇区', '255', '0', '3');
INSERT INTO `shop_area` VALUES ('2794', '扶沟县', '255', '0', '3');
INSERT INTO `shop_area` VALUES ('2795', '沈丘县', '255', '0', '3');
INSERT INTO `shop_area` VALUES ('2796', '淮阳县', '255', '0', '3');
INSERT INTO `shop_area` VALUES ('2797', '西华县', '255', '0', '3');
INSERT INTO `shop_area` VALUES ('2798', '郸城县', '255', '0', '3');
INSERT INTO `shop_area` VALUES ('2799', '项城市', '255', '0', '3');
INSERT INTO `shop_area` VALUES ('2800', '鹿邑县', '255', '0', '3');
INSERT INTO `shop_area` VALUES ('2801', '上蔡县', '256', '0', '3');
INSERT INTO `shop_area` VALUES ('2802', '平舆县', '256', '0', '3');
INSERT INTO `shop_area` VALUES ('2803', '新蔡县', '256', '0', '3');
INSERT INTO `shop_area` VALUES ('2804', '正阳县', '256', '0', '3');
INSERT INTO `shop_area` VALUES ('2805', '汝南县', '256', '0', '3');
INSERT INTO `shop_area` VALUES ('2806', '泌阳县', '256', '0', '3');
INSERT INTO `shop_area` VALUES ('2807', '确山县', '256', '0', '3');
INSERT INTO `shop_area` VALUES ('2808', '西平县', '256', '0', '3');
INSERT INTO `shop_area` VALUES ('2809', '遂平县', '256', '0', '3');
INSERT INTO `shop_area` VALUES ('2810', '驿城区', '256', '0', '3');
INSERT INTO `shop_area` VALUES ('2811', '济源市', '257', '0', '3');
INSERT INTO `shop_area` VALUES ('2812', '东西湖区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2813', '新洲区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2814', '武昌区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2815', '汉南区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2816', '汉阳区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2817', '江夏区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2818', '江岸区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2819', '江汉区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2820', '洪山区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2821', '硚口区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2822', '蔡甸区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2823', '青山区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2824', '黄陂区', '258', '0', '3');
INSERT INTO `shop_area` VALUES ('2825', '下陆区', '259', '0', '3');
INSERT INTO `shop_area` VALUES ('2826', '大冶市', '259', '0', '3');
INSERT INTO `shop_area` VALUES ('2827', '西塞山区', '259', '0', '3');
INSERT INTO `shop_area` VALUES ('2828', '铁山区', '259', '0', '3');
INSERT INTO `shop_area` VALUES ('2829', '阳新县', '259', '0', '3');
INSERT INTO `shop_area` VALUES ('2830', '黄石港区', '259', '0', '3');
INSERT INTO `shop_area` VALUES ('2831', '丹江口市', '260', '0', '3');
INSERT INTO `shop_area` VALUES ('2832', '张湾区', '260', '0', '3');
INSERT INTO `shop_area` VALUES ('2833', '房县', '260', '0', '3');
INSERT INTO `shop_area` VALUES ('2834', '竹山县', '260', '0', '3');
INSERT INTO `shop_area` VALUES ('2835', '竹溪县', '260', '0', '3');
INSERT INTO `shop_area` VALUES ('2836', '茅箭区', '260', '0', '3');
INSERT INTO `shop_area` VALUES ('2837', '郧县', '260', '0', '3');
INSERT INTO `shop_area` VALUES ('2838', '郧西县', '260', '0', '3');
INSERT INTO `shop_area` VALUES ('2839', '五峰土家族自治县', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2840', '伍家岗区', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2841', '兴山县', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2842', '夷陵区', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2843', '宜都市', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2844', '当阳市', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2845', '枝江市', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2846', '点军区', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2847', '秭归县', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2848', '虢亭区', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2849', '西陵区', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2850', '远安县', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2851', '长阳土家族自治县', '261', '0', '3');
INSERT INTO `shop_area` VALUES ('2852', '保康县', '262', '0', '3');
INSERT INTO `shop_area` VALUES ('2853', '南漳县', '262', '0', '3');
INSERT INTO `shop_area` VALUES ('2854', '宜城市', '262', '0', '3');
INSERT INTO `shop_area` VALUES ('2855', '枣阳市', '262', '0', '3');
INSERT INTO `shop_area` VALUES ('2856', '樊城区', '262', '0', '3');
INSERT INTO `shop_area` VALUES ('2857', '老河口市', '262', '0', '3');
INSERT INTO `shop_area` VALUES ('2858', '襄城区', '262', '0', '3');
INSERT INTO `shop_area` VALUES ('2859', '襄阳区', '262', '0', '3');
INSERT INTO `shop_area` VALUES ('2860', '谷城县', '262', '0', '3');
INSERT INTO `shop_area` VALUES ('2861', '华容区', '263', '0', '3');
INSERT INTO `shop_area` VALUES ('2862', '粱子湖', '263', '0', '3');
INSERT INTO `shop_area` VALUES ('2863', '鄂城区', '263', '0', '3');
INSERT INTO `shop_area` VALUES ('2864', '东宝区', '264', '0', '3');
INSERT INTO `shop_area` VALUES ('2865', '京山县', '264', '0', '3');
INSERT INTO `shop_area` VALUES ('2866', '掇刀区', '264', '0', '3');
INSERT INTO `shop_area` VALUES ('2867', '沙洋县', '264', '0', '3');
INSERT INTO `shop_area` VALUES ('2868', '钟祥市', '264', '0', '3');
INSERT INTO `shop_area` VALUES ('2869', '云梦县', '265', '0', '3');
INSERT INTO `shop_area` VALUES ('2870', '大悟县', '265', '0', '3');
INSERT INTO `shop_area` VALUES ('2871', '孝南区', '265', '0', '3');
INSERT INTO `shop_area` VALUES ('2872', '孝昌县', '265', '0', '3');
INSERT INTO `shop_area` VALUES ('2873', '安陆市', '265', '0', '3');
INSERT INTO `shop_area` VALUES ('2874', '应城市', '265', '0', '3');
INSERT INTO `shop_area` VALUES ('2875', '汉川市', '265', '0', '3');
INSERT INTO `shop_area` VALUES ('2876', '公安县', '266', '0', '3');
INSERT INTO `shop_area` VALUES ('2877', '松滋市', '266', '0', '3');
INSERT INTO `shop_area` VALUES ('2878', '江陵县', '266', '0', '3');
INSERT INTO `shop_area` VALUES ('2879', '沙市区', '266', '0', '3');
INSERT INTO `shop_area` VALUES ('2880', '洪湖市', '266', '0', '3');
INSERT INTO `shop_area` VALUES ('2881', '监利县', '266', '0', '3');
INSERT INTO `shop_area` VALUES ('2882', '石首市', '266', '0', '3');
INSERT INTO `shop_area` VALUES ('2883', '荆州区', '266', '0', '3');
INSERT INTO `shop_area` VALUES ('2884', '团风县', '267', '0', '3');
INSERT INTO `shop_area` VALUES ('2885', '武穴市', '267', '0', '3');
INSERT INTO `shop_area` VALUES ('2886', '浠水县', '267', '0', '3');
INSERT INTO `shop_area` VALUES ('2887', '红安县', '267', '0', '3');
INSERT INTO `shop_area` VALUES ('2888', '罗田县', '267', '0', '3');
INSERT INTO `shop_area` VALUES ('2889', '英山县', '267', '0', '3');
INSERT INTO `shop_area` VALUES ('2890', '蕲春县', '267', '0', '3');
INSERT INTO `shop_area` VALUES ('2891', '麻城市', '267', '0', '3');
INSERT INTO `shop_area` VALUES ('2892', '黄州区', '267', '0', '3');
INSERT INTO `shop_area` VALUES ('2893', '黄梅县', '267', '0', '3');
INSERT INTO `shop_area` VALUES ('2894', '咸安区', '268', '0', '3');
INSERT INTO `shop_area` VALUES ('2895', '嘉鱼县', '268', '0', '3');
INSERT INTO `shop_area` VALUES ('2896', '崇阳县', '268', '0', '3');
INSERT INTO `shop_area` VALUES ('2897', '赤壁市', '268', '0', '3');
INSERT INTO `shop_area` VALUES ('2898', '通城县', '268', '0', '3');
INSERT INTO `shop_area` VALUES ('2899', '通山县', '268', '0', '3');
INSERT INTO `shop_area` VALUES ('2900', '广水市', '269', '0', '3');
INSERT INTO `shop_area` VALUES ('2901', '曾都区', '269', '0', '3');
INSERT INTO `shop_area` VALUES ('2902', '利川市', '270', '0', '3');
INSERT INTO `shop_area` VALUES ('2903', '咸丰县', '270', '0', '3');
INSERT INTO `shop_area` VALUES ('2904', '宣恩县', '270', '0', '3');
INSERT INTO `shop_area` VALUES ('2905', '巴东县', '270', '0', '3');
INSERT INTO `shop_area` VALUES ('2906', '建始县', '270', '0', '3');
INSERT INTO `shop_area` VALUES ('2907', '恩施市', '270', '0', '3');
INSERT INTO `shop_area` VALUES ('2908', '来凤县', '270', '0', '3');
INSERT INTO `shop_area` VALUES ('2909', '鹤峰县', '270', '0', '3');
INSERT INTO `shop_area` VALUES ('2910', '仙桃市', '271', '0', '3');
INSERT INTO `shop_area` VALUES ('2911', '潜江市', '272', '0', '3');
INSERT INTO `shop_area` VALUES ('2912', '天门市', '273', '0', '3');
INSERT INTO `shop_area` VALUES ('2913', '神农架林区', '274', '0', '3');
INSERT INTO `shop_area` VALUES ('2914', '天心区', '275', '0', '3');
INSERT INTO `shop_area` VALUES ('2915', '宁乡县', '275', '0', '3');
INSERT INTO `shop_area` VALUES ('2916', '岳麓区', '275', '0', '3');
INSERT INTO `shop_area` VALUES ('2917', '开福区', '275', '0', '3');
INSERT INTO `shop_area` VALUES ('2918', '望城县', '275', '0', '3');
INSERT INTO `shop_area` VALUES ('2919', '浏阳市', '275', '0', '3');
INSERT INTO `shop_area` VALUES ('2920', '芙蓉区', '275', '0', '3');
INSERT INTO `shop_area` VALUES ('2921', '长沙县', '275', '0', '3');
INSERT INTO `shop_area` VALUES ('2922', '雨花区', '275', '0', '3');
INSERT INTO `shop_area` VALUES ('2923', '天元区', '276', '0', '3');
INSERT INTO `shop_area` VALUES ('2924', '攸县', '276', '0', '3');
INSERT INTO `shop_area` VALUES ('2925', '株洲县', '276', '0', '3');
INSERT INTO `shop_area` VALUES ('2926', '炎陵县', '276', '0', '3');
INSERT INTO `shop_area` VALUES ('2927', '石峰区', '276', '0', '3');
INSERT INTO `shop_area` VALUES ('2928', '芦淞区', '276', '0', '3');
INSERT INTO `shop_area` VALUES ('2929', '茶陵县', '276', '0', '3');
INSERT INTO `shop_area` VALUES ('2930', '荷塘区', '276', '0', '3');
INSERT INTO `shop_area` VALUES ('2931', '醴陵市', '276', '0', '3');
INSERT INTO `shop_area` VALUES ('2932', '岳塘区', '277', '0', '3');
INSERT INTO `shop_area` VALUES ('2933', '湘乡市', '277', '0', '3');
INSERT INTO `shop_area` VALUES ('2934', '湘潭县', '277', '0', '3');
INSERT INTO `shop_area` VALUES ('2935', '雨湖区', '277', '0', '3');
INSERT INTO `shop_area` VALUES ('2936', '韶山市', '277', '0', '3');
INSERT INTO `shop_area` VALUES ('2937', '南岳区', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2938', '常宁市', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2939', '珠晖区', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2940', '石鼓区', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2941', '祁东县', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2942', '耒阳市', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2943', '蒸湘区', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2944', '衡东县', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2945', '衡南县', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2946', '衡山县', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2947', '衡阳县', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2948', '雁峰区', '278', '0', '3');
INSERT INTO `shop_area` VALUES ('2949', '北塔区', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2950', '双清区', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2951', '城步苗族自治县', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2952', '大祥区', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2953', '新宁县', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2954', '新邵县', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2955', '武冈市', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2956', '洞口县', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2957', '绥宁县', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2958', '邵东县', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2959', '邵阳县', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2960', '隆回县', '279', '0', '3');
INSERT INTO `shop_area` VALUES ('2961', '临湘市', '280', '0', '3');
INSERT INTO `shop_area` VALUES ('2962', '云溪区', '280', '0', '3');
INSERT INTO `shop_area` VALUES ('2963', '华容县', '280', '0', '3');
INSERT INTO `shop_area` VALUES ('2964', '君山区', '280', '0', '3');
INSERT INTO `shop_area` VALUES ('2965', '岳阳县', '280', '0', '3');
INSERT INTO `shop_area` VALUES ('2966', '岳阳楼区', '280', '0', '3');
INSERT INTO `shop_area` VALUES ('2967', '平江县', '280', '0', '3');
INSERT INTO `shop_area` VALUES ('2968', '汨罗市', '280', '0', '3');
INSERT INTO `shop_area` VALUES ('2969', '湘阴县', '280', '0', '3');
INSERT INTO `shop_area` VALUES ('2970', '临澧县', '281', '0', '3');
INSERT INTO `shop_area` VALUES ('2971', '安乡县', '281', '0', '3');
INSERT INTO `shop_area` VALUES ('2972', '桃源县', '281', '0', '3');
INSERT INTO `shop_area` VALUES ('2973', '武陵区', '281', '0', '3');
INSERT INTO `shop_area` VALUES ('2974', '汉寿县', '281', '0', '3');
INSERT INTO `shop_area` VALUES ('2975', '津市市', '281', '0', '3');
INSERT INTO `shop_area` VALUES ('2976', '澧县', '281', '0', '3');
INSERT INTO `shop_area` VALUES ('2977', '石门县', '281', '0', '3');
INSERT INTO `shop_area` VALUES ('2978', '鼎城区', '281', '0', '3');
INSERT INTO `shop_area` VALUES ('2979', '慈利县', '282', '0', '3');
INSERT INTO `shop_area` VALUES ('2980', '桑植县', '282', '0', '3');
INSERT INTO `shop_area` VALUES ('2981', '武陵源区', '282', '0', '3');
INSERT INTO `shop_area` VALUES ('2982', '永定区', '282', '0', '3');
INSERT INTO `shop_area` VALUES ('2983', '南县', '283', '0', '3');
INSERT INTO `shop_area` VALUES ('2984', '安化县', '283', '0', '3');
INSERT INTO `shop_area` VALUES ('2985', '桃江县', '283', '0', '3');
INSERT INTO `shop_area` VALUES ('2986', '沅江市', '283', '0', '3');
INSERT INTO `shop_area` VALUES ('2987', '资阳区', '283', '0', '3');
INSERT INTO `shop_area` VALUES ('2988', '赫山区', '283', '0', '3');
INSERT INTO `shop_area` VALUES ('2989', '临武县', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('2990', '北湖区', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('2991', '嘉禾县', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('2992', '安仁县', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('2993', '宜章县', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('2994', '桂东县', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('2995', '桂阳县', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('2996', '永兴县', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('2997', '汝城县', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('2998', '苏仙区', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('2999', '资兴市', '284', '0', '3');
INSERT INTO `shop_area` VALUES ('3000', '东安县', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3001', '冷水滩区', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3002', '双牌县', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3003', '宁远县', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3004', '新田县', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3005', '江华瑶族自治县', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3006', '江永县', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3007', '祁阳县', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3008', '蓝山县', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3009', '道县', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3010', '零陵区', '285', '0', '3');
INSERT INTO `shop_area` VALUES ('3011', '中方县', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3012', '会同县', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3013', '新晃侗族自治县', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3014', '沅陵县', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3015', '洪江市/洪江区', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3016', '溆浦县', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3017', '芷江侗族自治县', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3018', '辰溪县', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3019', '通道侗族自治县', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3020', '靖州苗族侗族自治县', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3021', '鹤城区', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3022', '麻阳苗族自治县', '286', '0', '3');
INSERT INTO `shop_area` VALUES ('3023', '冷水江市', '287', '0', '3');
INSERT INTO `shop_area` VALUES ('3024', '双峰县', '287', '0', '3');
INSERT INTO `shop_area` VALUES ('3025', '娄星区', '287', '0', '3');
INSERT INTO `shop_area` VALUES ('3026', '新化县', '287', '0', '3');
INSERT INTO `shop_area` VALUES ('3027', '涟源市', '287', '0', '3');
INSERT INTO `shop_area` VALUES ('3028', '保靖县', '288', '0', '3');
INSERT INTO `shop_area` VALUES ('3029', '凤凰县', '288', '0', '3');
INSERT INTO `shop_area` VALUES ('3030', '古丈县', '288', '0', '3');
INSERT INTO `shop_area` VALUES ('3031', '吉首市', '288', '0', '3');
INSERT INTO `shop_area` VALUES ('3032', '永顺县', '288', '0', '3');
INSERT INTO `shop_area` VALUES ('3033', '泸溪县', '288', '0', '3');
INSERT INTO `shop_area` VALUES ('3034', '花垣县', '288', '0', '3');
INSERT INTO `shop_area` VALUES ('3035', '龙山县', '288', '0', '3');
INSERT INTO `shop_area` VALUES ('3036', '萝岗区', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3037', '南沙区', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3038', '从化市', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3039', '增城市', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3040', '天河区', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3041', '海珠区', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3042', '番禺区', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3043', '白云区', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3044', '花都区', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3045', '荔湾区', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3046', '越秀区', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3047', '黄埔区', '289', '0', '3');
INSERT INTO `shop_area` VALUES ('3048', '乐昌市', '290', '0', '3');
INSERT INTO `shop_area` VALUES ('3049', '乳源瑶族自治县', '290', '0', '3');
INSERT INTO `shop_area` VALUES ('3050', '仁化县', '290', '0', '3');
INSERT INTO `shop_area` VALUES ('3051', '南雄市', '290', '0', '3');
INSERT INTO `shop_area` VALUES ('3052', '始兴县', '290', '0', '3');
INSERT INTO `shop_area` VALUES ('3053', '新丰县', '290', '0', '3');
INSERT INTO `shop_area` VALUES ('3054', '曲江区', '290', '0', '3');
INSERT INTO `shop_area` VALUES ('3055', '武江区', '290', '0', '3');
INSERT INTO `shop_area` VALUES ('3056', '浈江区', '290', '0', '3');
INSERT INTO `shop_area` VALUES ('3057', '翁源县', '290', '0', '3');
INSERT INTO `shop_area` VALUES ('3058', '南山区', '291', '0', '3');
INSERT INTO `shop_area` VALUES ('3059', '宝安区', '291', '0', '3');
INSERT INTO `shop_area` VALUES ('3060', '盐田区', '291', '0', '3');
INSERT INTO `shop_area` VALUES ('3061', '福田区', '291', '0', '3');
INSERT INTO `shop_area` VALUES ('3062', '罗湖区', '291', '0', '3');
INSERT INTO `shop_area` VALUES ('3063', '龙岗区', '291', '0', '3');
INSERT INTO `shop_area` VALUES ('3064', '斗门区', '292', '0', '3');
INSERT INTO `shop_area` VALUES ('3065', '金湾区', '292', '0', '3');
INSERT INTO `shop_area` VALUES ('3066', '香洲区', '292', '0', '3');
INSERT INTO `shop_area` VALUES ('3067', '南澳县', '293', '0', '3');
INSERT INTO `shop_area` VALUES ('3068', '潮南区', '293', '0', '3');
INSERT INTO `shop_area` VALUES ('3069', '潮阳区', '293', '0', '3');
INSERT INTO `shop_area` VALUES ('3070', '澄海区', '293', '0', '3');
INSERT INTO `shop_area` VALUES ('3071', '濠江区', '293', '0', '3');
INSERT INTO `shop_area` VALUES ('3072', '金平区', '293', '0', '3');
INSERT INTO `shop_area` VALUES ('3073', '龙湖区', '293', '0', '3');
INSERT INTO `shop_area` VALUES ('3074', '三水区', '294', '0', '3');
INSERT INTO `shop_area` VALUES ('3075', '南海区', '294', '0', '3');
INSERT INTO `shop_area` VALUES ('3076', '禅城区', '294', '0', '3');
INSERT INTO `shop_area` VALUES ('3077', '顺德区', '294', '0', '3');
INSERT INTO `shop_area` VALUES ('3078', '高明区', '294', '0', '3');
INSERT INTO `shop_area` VALUES ('3079', '台山市', '295', '0', '3');
INSERT INTO `shop_area` VALUES ('3080', '开平市', '295', '0', '3');
INSERT INTO `shop_area` VALUES ('3081', '恩平市', '295', '0', '3');
INSERT INTO `shop_area` VALUES ('3082', '新会区', '295', '0', '3');
INSERT INTO `shop_area` VALUES ('3083', '江海区', '295', '0', '3');
INSERT INTO `shop_area` VALUES ('3084', '蓬江区', '295', '0', '3');
INSERT INTO `shop_area` VALUES ('3085', '鹤山市', '295', '0', '3');
INSERT INTO `shop_area` VALUES ('3086', '吴川市', '296', '0', '3');
INSERT INTO `shop_area` VALUES ('3087', '坡头区', '296', '0', '3');
INSERT INTO `shop_area` VALUES ('3088', '廉江市', '296', '0', '3');
INSERT INTO `shop_area` VALUES ('3089', '徐闻县', '296', '0', '3');
INSERT INTO `shop_area` VALUES ('3090', '赤坎区', '296', '0', '3');
INSERT INTO `shop_area` VALUES ('3091', '遂溪县', '296', '0', '3');
INSERT INTO `shop_area` VALUES ('3092', '雷州市', '296', '0', '3');
INSERT INTO `shop_area` VALUES ('3093', '霞山区', '296', '0', '3');
INSERT INTO `shop_area` VALUES ('3094', '麻章区', '296', '0', '3');
INSERT INTO `shop_area` VALUES ('3095', '信宜市', '297', '0', '3');
INSERT INTO `shop_area` VALUES ('3096', '化州市', '297', '0', '3');
INSERT INTO `shop_area` VALUES ('3097', '电白县', '297', '0', '3');
INSERT INTO `shop_area` VALUES ('3098', '茂南区', '297', '0', '3');
INSERT INTO `shop_area` VALUES ('3099', '茂港区', '297', '0', '3');
INSERT INTO `shop_area` VALUES ('3100', '高州市', '297', '0', '3');
INSERT INTO `shop_area` VALUES ('3101', '四会市', '298', '0', '3');
INSERT INTO `shop_area` VALUES ('3102', '封开县', '298', '0', '3');
INSERT INTO `shop_area` VALUES ('3103', '广宁县', '298', '0', '3');
INSERT INTO `shop_area` VALUES ('3104', '德庆县', '298', '0', '3');
INSERT INTO `shop_area` VALUES ('3105', '怀集县', '298', '0', '3');
INSERT INTO `shop_area` VALUES ('3106', '端州区', '298', '0', '3');
INSERT INTO `shop_area` VALUES ('3107', '高要市', '298', '0', '3');
INSERT INTO `shop_area` VALUES ('3108', '鼎湖区', '298', '0', '3');
INSERT INTO `shop_area` VALUES ('3109', '博罗县', '299', '0', '3');
INSERT INTO `shop_area` VALUES ('3110', '惠东县', '299', '0', '3');
INSERT INTO `shop_area` VALUES ('3111', '惠城区', '299', '0', '3');
INSERT INTO `shop_area` VALUES ('3112', '惠阳区', '299', '0', '3');
INSERT INTO `shop_area` VALUES ('3113', '龙门县', '299', '0', '3');
INSERT INTO `shop_area` VALUES ('3114', '丰顺县', '300', '0', '3');
INSERT INTO `shop_area` VALUES ('3115', '五华县', '300', '0', '3');
INSERT INTO `shop_area` VALUES ('3116', '兴宁市', '300', '0', '3');
INSERT INTO `shop_area` VALUES ('3117', '大埔县', '300', '0', '3');
INSERT INTO `shop_area` VALUES ('3118', '平远县', '300', '0', '3');
INSERT INTO `shop_area` VALUES ('3119', '梅县', '300', '0', '3');
INSERT INTO `shop_area` VALUES ('3120', '梅江区', '300', '0', '3');
INSERT INTO `shop_area` VALUES ('3121', '蕉岭县', '300', '0', '3');
INSERT INTO `shop_area` VALUES ('3122', '城区', '301', '0', '3');
INSERT INTO `shop_area` VALUES ('3123', '海丰县', '301', '0', '3');
INSERT INTO `shop_area` VALUES ('3124', '陆丰市', '301', '0', '3');
INSERT INTO `shop_area` VALUES ('3125', '陆河县', '301', '0', '3');
INSERT INTO `shop_area` VALUES ('3126', '东源县', '302', '0', '3');
INSERT INTO `shop_area` VALUES ('3127', '和平县', '302', '0', '3');
INSERT INTO `shop_area` VALUES ('3128', '源城区', '302', '0', '3');
INSERT INTO `shop_area` VALUES ('3129', '紫金县', '302', '0', '3');
INSERT INTO `shop_area` VALUES ('3130', '连平县', '302', '0', '3');
INSERT INTO `shop_area` VALUES ('3131', '龙川县', '302', '0', '3');
INSERT INTO `shop_area` VALUES ('3132', '江城区', '303', '0', '3');
INSERT INTO `shop_area` VALUES ('3133', '阳东县', '303', '0', '3');
INSERT INTO `shop_area` VALUES ('3134', '阳春市', '303', '0', '3');
INSERT INTO `shop_area` VALUES ('3135', '阳西县', '303', '0', '3');
INSERT INTO `shop_area` VALUES ('3136', '佛冈县', '304', '0', '3');
INSERT INTO `shop_area` VALUES ('3137', '清城区', '304', '0', '3');
INSERT INTO `shop_area` VALUES ('3138', '清新县', '304', '0', '3');
INSERT INTO `shop_area` VALUES ('3139', '英德市', '304', '0', '3');
INSERT INTO `shop_area` VALUES ('3140', '连南瑶族自治县', '304', '0', '3');
INSERT INTO `shop_area` VALUES ('3141', '连山壮族瑶族自治县', '304', '0', '3');
INSERT INTO `shop_area` VALUES ('3142', '连州市', '304', '0', '3');
INSERT INTO `shop_area` VALUES ('3143', '阳山县', '304', '0', '3');
INSERT INTO `shop_area` VALUES ('3144', '东莞市', '305', '0', '3');
INSERT INTO `shop_area` VALUES ('3145', '中山市', '306', '0', '3');
INSERT INTO `shop_area` VALUES ('3146', '湘桥区', '307', '0', '3');
INSERT INTO `shop_area` VALUES ('3147', '潮安县', '307', '0', '3');
INSERT INTO `shop_area` VALUES ('3148', '饶平县', '307', '0', '3');
INSERT INTO `shop_area` VALUES ('3149', '惠来县', '308', '0', '3');
INSERT INTO `shop_area` VALUES ('3150', '揭东县', '308', '0', '3');
INSERT INTO `shop_area` VALUES ('3151', '揭西县', '308', '0', '3');
INSERT INTO `shop_area` VALUES ('3152', '普宁市', '308', '0', '3');
INSERT INTO `shop_area` VALUES ('3153', '榕城区', '308', '0', '3');
INSERT INTO `shop_area` VALUES ('3154', '云城区', '309', '0', '3');
INSERT INTO `shop_area` VALUES ('3155', '云安县', '309', '0', '3');
INSERT INTO `shop_area` VALUES ('3156', '新兴县', '309', '0', '3');
INSERT INTO `shop_area` VALUES ('3157', '罗定市', '309', '0', '3');
INSERT INTO `shop_area` VALUES ('3158', '郁南县', '309', '0', '3');
INSERT INTO `shop_area` VALUES ('3159', '上林县', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3160', '兴宁区', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3161', '宾阳县', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3162', '横县', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3163', '武鸣县', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3164', '江南区', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3165', '良庆区', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3166', '西乡塘区', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3167', '邕宁区', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3168', '隆安县', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3169', '青秀区', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3170', '马山县', '310', '0', '3');
INSERT INTO `shop_area` VALUES ('3171', '三江侗族自治县', '311', '0', '3');
INSERT INTO `shop_area` VALUES ('3172', '城中区', '311', '0', '3');
INSERT INTO `shop_area` VALUES ('3173', '柳北区', '311', '0', '3');
INSERT INTO `shop_area` VALUES ('3174', '柳南区', '311', '0', '3');
INSERT INTO `shop_area` VALUES ('3175', '柳城县', '311', '0', '3');
INSERT INTO `shop_area` VALUES ('3176', '柳江县', '311', '0', '3');
INSERT INTO `shop_area` VALUES ('3177', '融安县', '311', '0', '3');
INSERT INTO `shop_area` VALUES ('3178', '融水苗族自治县', '311', '0', '3');
INSERT INTO `shop_area` VALUES ('3179', '鱼峰区', '311', '0', '3');
INSERT INTO `shop_area` VALUES ('3180', '鹿寨县', '311', '0', '3');
INSERT INTO `shop_area` VALUES ('3181', '七星区', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3182', '临桂县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3183', '全州县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3184', '兴安县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3185', '叠彩区', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3186', '平乐县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3187', '恭城瑶族自治县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3188', '永福县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3189', '灌阳县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3190', '灵川县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3191', '秀峰区', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3192', '荔浦县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3193', '象山区', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3194', '资源县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3195', '阳朔县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3196', '雁山区', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3197', '龙胜各族自治县', '312', '0', '3');
INSERT INTO `shop_area` VALUES ('3198', '万秀区', '313', '0', '3');
INSERT INTO `shop_area` VALUES ('3199', '岑溪市', '313', '0', '3');
INSERT INTO `shop_area` VALUES ('3200', '苍梧县', '313', '0', '3');
INSERT INTO `shop_area` VALUES ('3201', '蒙山县', '313', '0', '3');
INSERT INTO `shop_area` VALUES ('3202', '藤县', '313', '0', '3');
INSERT INTO `shop_area` VALUES ('3203', '蝶山区', '313', '0', '3');
INSERT INTO `shop_area` VALUES ('3204', '长洲区', '313', '0', '3');
INSERT INTO `shop_area` VALUES ('3205', '合浦县', '314', '0', '3');
INSERT INTO `shop_area` VALUES ('3206', '海城区', '314', '0', '3');
INSERT INTO `shop_area` VALUES ('3207', '铁山港区', '314', '0', '3');
INSERT INTO `shop_area` VALUES ('3208', '银海区', '314', '0', '3');
INSERT INTO `shop_area` VALUES ('3209', '上思县', '315', '0', '3');
INSERT INTO `shop_area` VALUES ('3210', '东兴市', '315', '0', '3');
INSERT INTO `shop_area` VALUES ('3211', '港口区', '315', '0', '3');
INSERT INTO `shop_area` VALUES ('3212', '防城区', '315', '0', '3');
INSERT INTO `shop_area` VALUES ('3213', '浦北县', '316', '0', '3');
INSERT INTO `shop_area` VALUES ('3214', '灵山县', '316', '0', '3');
INSERT INTO `shop_area` VALUES ('3215', '钦北区', '316', '0', '3');
INSERT INTO `shop_area` VALUES ('3216', '钦南区', '316', '0', '3');
INSERT INTO `shop_area` VALUES ('3217', '平南县', '317', '0', '3');
INSERT INTO `shop_area` VALUES ('3218', '桂平市', '317', '0', '3');
INSERT INTO `shop_area` VALUES ('3219', '港北区', '317', '0', '3');
INSERT INTO `shop_area` VALUES ('3220', '港南区', '317', '0', '3');
INSERT INTO `shop_area` VALUES ('3221', '覃塘区', '317', '0', '3');
INSERT INTO `shop_area` VALUES ('3222', '兴业县', '318', '0', '3');
INSERT INTO `shop_area` VALUES ('3223', '北流市', '318', '0', '3');
INSERT INTO `shop_area` VALUES ('3224', '博白县', '318', '0', '3');
INSERT INTO `shop_area` VALUES ('3225', '容县', '318', '0', '3');
INSERT INTO `shop_area` VALUES ('3226', '玉州区', '318', '0', '3');
INSERT INTO `shop_area` VALUES ('3227', '陆川县', '318', '0', '3');
INSERT INTO `shop_area` VALUES ('3228', '乐业县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3229', '凌云县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3230', '右江区', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3231', '平果县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3232', '德保县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3233', '田东县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3234', '田林县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3235', '田阳县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3236', '西林县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3237', '那坡县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3238', '隆林各族自治县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3239', '靖西县', '319', '0', '3');
INSERT INTO `shop_area` VALUES ('3240', '八步区', '320', '0', '3');
INSERT INTO `shop_area` VALUES ('3241', '富川瑶族自治县', '320', '0', '3');
INSERT INTO `shop_area` VALUES ('3242', '昭平县', '320', '0', '3');
INSERT INTO `shop_area` VALUES ('3243', '钟山县', '320', '0', '3');
INSERT INTO `shop_area` VALUES ('3244', '东兰县', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3245', '凤山县', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3246', '南丹县', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3247', '大化瑶族自治县', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3248', '天峨县', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3249', '宜州市', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3250', '巴马瑶族自治县', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3251', '环江毛南族自治县', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3252', '罗城仫佬族自治县', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3253', '都安瑶族自治县', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3254', '金城江区', '321', '0', '3');
INSERT INTO `shop_area` VALUES ('3255', '兴宾区', '322', '0', '3');
INSERT INTO `shop_area` VALUES ('3256', '合山市', '322', '0', '3');
INSERT INTO `shop_area` VALUES ('3257', '忻城县', '322', '0', '3');
INSERT INTO `shop_area` VALUES ('3258', '武宣县', '322', '0', '3');
INSERT INTO `shop_area` VALUES ('3259', '象州县', '322', '0', '3');
INSERT INTO `shop_area` VALUES ('3260', '金秀瑶族自治县', '322', '0', '3');
INSERT INTO `shop_area` VALUES ('3261', '凭祥市', '323', '0', '3');
INSERT INTO `shop_area` VALUES ('3262', '大新县', '323', '0', '3');
INSERT INTO `shop_area` VALUES ('3263', '天等县', '323', '0', '3');
INSERT INTO `shop_area` VALUES ('3264', '宁明县', '323', '0', '3');
INSERT INTO `shop_area` VALUES ('3265', '扶绥县', '323', '0', '3');
INSERT INTO `shop_area` VALUES ('3266', '江州区', '323', '0', '3');
INSERT INTO `shop_area` VALUES ('3267', '龙州县', '323', '0', '3');
INSERT INTO `shop_area` VALUES ('3268', '琼山区', '324', '0', '3');
INSERT INTO `shop_area` VALUES ('3269', '秀英区', '324', '0', '3');
INSERT INTO `shop_area` VALUES ('3270', '美兰区', '324', '0', '3');
INSERT INTO `shop_area` VALUES ('3271', '龙华区', '324', '0', '3');
INSERT INTO `shop_area` VALUES ('3272', '三亚市', '325', '0', '3');
INSERT INTO `shop_area` VALUES ('3273', '五指山市', '326', '0', '3');
INSERT INTO `shop_area` VALUES ('3274', '琼海市', '327', '0', '3');
INSERT INTO `shop_area` VALUES ('3275', '儋州市', '328', '0', '3');
INSERT INTO `shop_area` VALUES ('3276', '文昌市', '329', '0', '3');
INSERT INTO `shop_area` VALUES ('3277', '万宁市', '330', '0', '3');
INSERT INTO `shop_area` VALUES ('3278', '东方市', '331', '0', '3');
INSERT INTO `shop_area` VALUES ('3279', '定安县', '332', '0', '3');
INSERT INTO `shop_area` VALUES ('3280', '屯昌县', '333', '0', '3');
INSERT INTO `shop_area` VALUES ('3281', '澄迈县', '334', '0', '3');
INSERT INTO `shop_area` VALUES ('3282', '临高县', '335', '0', '3');
INSERT INTO `shop_area` VALUES ('3283', '白沙黎族自治县', '336', '0', '3');
INSERT INTO `shop_area` VALUES ('3284', '昌江黎族自治县', '337', '0', '3');
INSERT INTO `shop_area` VALUES ('3285', '乐东黎族自治县', '338', '0', '3');
INSERT INTO `shop_area` VALUES ('3286', '陵水黎族自治县', '339', '0', '3');
INSERT INTO `shop_area` VALUES ('3287', '保亭黎族苗族自治县', '340', '0', '3');
INSERT INTO `shop_area` VALUES ('3288', '琼中黎族苗族自治县', '341', '0', '3');
INSERT INTO `shop_area` VALUES ('4209', '双流县', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4210', '大邑县', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4211', '崇州市', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4212', '彭州市', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4213', '成华区', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4214', '新津县', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4215', '新都区', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4216', '武侯区', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4217', '温江区', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4218', '蒲江县', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4219', '邛崃市', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4220', '郫县', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4221', '都江堰市', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4222', '金堂县', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4223', '金牛区', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4224', '锦江区', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4225', '青白江区', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4226', '青羊区', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4227', '龙泉驿区', '385', '0', '3');
INSERT INTO `shop_area` VALUES ('4228', '大安区', '386', '0', '3');
INSERT INTO `shop_area` VALUES ('4229', '富顺县', '386', '0', '3');
INSERT INTO `shop_area` VALUES ('4230', '沿滩区', '386', '0', '3');
INSERT INTO `shop_area` VALUES ('4231', '自流井区', '386', '0', '3');
INSERT INTO `shop_area` VALUES ('4232', '荣县', '386', '0', '3');
INSERT INTO `shop_area` VALUES ('4233', '贡井区', '386', '0', '3');
INSERT INTO `shop_area` VALUES ('4234', '东区', '387', '0', '3');
INSERT INTO `shop_area` VALUES ('4235', '仁和区', '387', '0', '3');
INSERT INTO `shop_area` VALUES ('4236', '盐边县', '387', '0', '3');
INSERT INTO `shop_area` VALUES ('4237', '米易县', '387', '0', '3');
INSERT INTO `shop_area` VALUES ('4238', '西区', '387', '0', '3');
INSERT INTO `shop_area` VALUES ('4239', '叙永县', '388', '0', '3');
INSERT INTO `shop_area` VALUES ('4240', '古蔺县', '388', '0', '3');
INSERT INTO `shop_area` VALUES ('4241', '合江县', '388', '0', '3');
INSERT INTO `shop_area` VALUES ('4242', '江阳区', '388', '0', '3');
INSERT INTO `shop_area` VALUES ('4243', '泸县', '388', '0', '3');
INSERT INTO `shop_area` VALUES ('4244', '纳溪区', '388', '0', '3');
INSERT INTO `shop_area` VALUES ('4245', '龙马潭区', '388', '0', '3');
INSERT INTO `shop_area` VALUES ('4246', '中江县', '389', '0', '3');
INSERT INTO `shop_area` VALUES ('4247', '什邡市', '389', '0', '3');
INSERT INTO `shop_area` VALUES ('4248', '广汉市', '389', '0', '3');
INSERT INTO `shop_area` VALUES ('4249', '旌阳区', '389', '0', '3');
INSERT INTO `shop_area` VALUES ('4250', '绵竹市', '389', '0', '3');
INSERT INTO `shop_area` VALUES ('4251', '罗江县', '389', '0', '3');
INSERT INTO `shop_area` VALUES ('4252', '三台县', '390', '0', '3');
INSERT INTO `shop_area` VALUES ('4253', '北川羌族自治县', '390', '0', '3');
INSERT INTO `shop_area` VALUES ('4254', '安县', '390', '0', '3');
INSERT INTO `shop_area` VALUES ('4255', '平武县', '390', '0', '3');
INSERT INTO `shop_area` VALUES ('4256', '梓潼县', '390', '0', '3');
INSERT INTO `shop_area` VALUES ('4257', '江油市', '390', '0', '3');
INSERT INTO `shop_area` VALUES ('4258', '涪城区', '390', '0', '3');
INSERT INTO `shop_area` VALUES ('4259', '游仙区', '390', '0', '3');
INSERT INTO `shop_area` VALUES ('4260', '盐亭县', '390', '0', '3');
INSERT INTO `shop_area` VALUES ('4261', '元坝区', '391', '0', '3');
INSERT INTO `shop_area` VALUES ('4262', '利州区', '391', '0', '3');
INSERT INTO `shop_area` VALUES ('4263', '剑阁县', '391', '0', '3');
INSERT INTO `shop_area` VALUES ('4264', '旺苍县', '391', '0', '3');
INSERT INTO `shop_area` VALUES ('4265', '朝天区', '391', '0', '3');
INSERT INTO `shop_area` VALUES ('4266', '苍溪县', '391', '0', '3');
INSERT INTO `shop_area` VALUES ('4267', '青川县', '391', '0', '3');
INSERT INTO `shop_area` VALUES ('4268', '大英县', '392', '0', '3');
INSERT INTO `shop_area` VALUES ('4269', '安居区', '392', '0', '3');
INSERT INTO `shop_area` VALUES ('4270', '射洪县', '392', '0', '3');
INSERT INTO `shop_area` VALUES ('4271', '船山区', '392', '0', '3');
INSERT INTO `shop_area` VALUES ('4272', '蓬溪县', '392', '0', '3');
INSERT INTO `shop_area` VALUES ('4273', '东兴区', '393', '0', '3');
INSERT INTO `shop_area` VALUES ('4274', '威远县', '393', '0', '3');
INSERT INTO `shop_area` VALUES ('4275', '市中区', '393', '0', '3');
INSERT INTO `shop_area` VALUES ('4276', '资中县', '393', '0', '3');
INSERT INTO `shop_area` VALUES ('4277', '隆昌县', '393', '0', '3');
INSERT INTO `shop_area` VALUES ('4278', '五通桥区', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4279', '井研县', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4280', '夹江县', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4281', '峨眉山市', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4282', '峨边彝族自治县', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4283', '市中区', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4284', '沐川县', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4285', '沙湾区', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4286', '犍为县', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4287', '金口河区', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4288', '马边彝族自治县', '394', '0', '3');
INSERT INTO `shop_area` VALUES ('4289', '仪陇县', '395', '0', '3');
INSERT INTO `shop_area` VALUES ('4290', '南充市嘉陵区', '395', '0', '3');
INSERT INTO `shop_area` VALUES ('4291', '南部县', '395', '0', '3');
INSERT INTO `shop_area` VALUES ('4292', '嘉陵区', '395', '0', '3');
INSERT INTO `shop_area` VALUES ('4293', '营山县', '395', '0', '3');
INSERT INTO `shop_area` VALUES ('4294', '蓬安县', '395', '0', '3');
INSERT INTO `shop_area` VALUES ('4295', '西充县', '395', '0', '3');
INSERT INTO `shop_area` VALUES ('4296', '阆中市', '395', '0', '3');
INSERT INTO `shop_area` VALUES ('4297', '顺庆区', '395', '0', '3');
INSERT INTO `shop_area` VALUES ('4298', '高坪区', '395', '0', '3');
INSERT INTO `shop_area` VALUES ('4299', '东坡区', '396', '0', '3');
INSERT INTO `shop_area` VALUES ('4300', '丹棱县', '396', '0', '3');
INSERT INTO `shop_area` VALUES ('4301', '仁寿县', '396', '0', '3');
INSERT INTO `shop_area` VALUES ('4302', '彭山县', '396', '0', '3');
INSERT INTO `shop_area` VALUES ('4303', '洪雅县', '396', '0', '3');
INSERT INTO `shop_area` VALUES ('4304', '青神县', '396', '0', '3');
INSERT INTO `shop_area` VALUES ('4305', '兴文县', '397', '0', '3');
INSERT INTO `shop_area` VALUES ('4306', '南溪县', '397', '0', '3');
INSERT INTO `shop_area` VALUES ('4307', '宜宾县', '397', '0', '3');
INSERT INTO `shop_area` VALUES ('4308', '屏山县', '397', '0', '3');
INSERT INTO `shop_area` VALUES ('4309', '江安县', '397', '0', '3');
INSERT INTO `shop_area` VALUES ('4310', '珙县', '397', '0', '3');
INSERT INTO `shop_area` VALUES ('4311', '筠连县', '397', '0', '3');
INSERT INTO `shop_area` VALUES ('4312', '翠屏区', '397', '0', '3');
INSERT INTO `shop_area` VALUES ('4313', '长宁县', '397', '0', '3');
INSERT INTO `shop_area` VALUES ('4314', '高县', '397', '0', '3');
INSERT INTO `shop_area` VALUES ('4315', '华蓥市', '398', '0', '3');
INSERT INTO `shop_area` VALUES ('4316', '岳池县', '398', '0', '3');
INSERT INTO `shop_area` VALUES ('4317', '广安区', '398', '0', '3');
INSERT INTO `shop_area` VALUES ('4318', '武胜县', '398', '0', '3');
INSERT INTO `shop_area` VALUES ('4319', '邻水县', '398', '0', '3');
INSERT INTO `shop_area` VALUES ('4320', '万源市', '399', '0', '3');
INSERT INTO `shop_area` VALUES ('4321', '大竹县', '399', '0', '3');
INSERT INTO `shop_area` VALUES ('4322', '宣汉县', '399', '0', '3');
INSERT INTO `shop_area` VALUES ('4323', '开江县', '399', '0', '3');
INSERT INTO `shop_area` VALUES ('4324', '渠县', '399', '0', '3');
INSERT INTO `shop_area` VALUES ('4325', '达县', '399', '0', '3');
INSERT INTO `shop_area` VALUES ('4326', '通川区', '399', '0', '3');
INSERT INTO `shop_area` VALUES ('4327', '名山县', '400', '0', '3');
INSERT INTO `shop_area` VALUES ('4328', '天全县', '400', '0', '3');
INSERT INTO `shop_area` VALUES ('4329', '宝兴县', '400', '0', '3');
INSERT INTO `shop_area` VALUES ('4330', '汉源县', '400', '0', '3');
INSERT INTO `shop_area` VALUES ('4331', '石棉县', '400', '0', '3');
INSERT INTO `shop_area` VALUES ('4332', '芦山县', '400', '0', '3');
INSERT INTO `shop_area` VALUES ('4333', '荥经县', '400', '0', '3');
INSERT INTO `shop_area` VALUES ('4334', '雨城区', '400', '0', '3');
INSERT INTO `shop_area` VALUES ('4335', '南江县', '401', '0', '3');
INSERT INTO `shop_area` VALUES ('4336', '巴州区', '401', '0', '3');
INSERT INTO `shop_area` VALUES ('4337', '平昌县', '401', '0', '3');
INSERT INTO `shop_area` VALUES ('4338', '通江县', '401', '0', '3');
INSERT INTO `shop_area` VALUES ('4339', '乐至县', '402', '0', '3');
INSERT INTO `shop_area` VALUES ('4340', '安岳县', '402', '0', '3');
INSERT INTO `shop_area` VALUES ('4341', '简阳市', '402', '0', '3');
INSERT INTO `shop_area` VALUES ('4342', '雁江区', '402', '0', '3');
INSERT INTO `shop_area` VALUES ('4343', '九寨沟县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4344', '壤塘县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4345', '小金县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4346', '松潘县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4347', '汶川县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4348', '理县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4349', '红原县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4350', '若尔盖县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4351', '茂县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4352', '金川县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4353', '阿坝县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4354', '马尔康县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4355', '黑水县', '403', '0', '3');
INSERT INTO `shop_area` VALUES ('4356', '丹巴县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4357', '乡城县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4358', '巴塘县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4359', '康定县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4360', '得荣县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4361', '德格县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4362', '新龙县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4363', '泸定县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4364', '炉霍县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4365', '理塘县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4366', '甘孜县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4367', '白玉县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4368', '石渠县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4369', '稻城县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4370', '色达县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4371', '道孚县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4372', '雅江县', '404', '0', '3');
INSERT INTO `shop_area` VALUES ('4373', '会东县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4374', '会理县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4375', '冕宁县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4376', '喜德县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4377', '宁南县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4378', '布拖县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4379', '德昌县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4380', '昭觉县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4381', '普格县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4382', '木里藏族自治县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4383', '甘洛县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4384', '盐源县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4385', '美姑县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4386', '西昌', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4387', '越西县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4388', '金阳县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4389', '雷波县', '405', '0', '3');
INSERT INTO `shop_area` VALUES ('4390', '乌当区', '406', '0', '3');
INSERT INTO `shop_area` VALUES ('4391', '云岩区', '406', '0', '3');
INSERT INTO `shop_area` VALUES ('4392', '修文县', '406', '0', '3');
INSERT INTO `shop_area` VALUES ('4393', '南明区', '406', '0', '3');
INSERT INTO `shop_area` VALUES ('4394', '小河区', '406', '0', '3');
INSERT INTO `shop_area` VALUES ('4395', '开阳县', '406', '0', '3');
INSERT INTO `shop_area` VALUES ('4396', '息烽县', '406', '0', '3');
INSERT INTO `shop_area` VALUES ('4397', '清镇市', '406', '0', '3');
INSERT INTO `shop_area` VALUES ('4398', '白云区', '406', '0', '3');
INSERT INTO `shop_area` VALUES ('4399', '花溪区', '406', '0', '3');
INSERT INTO `shop_area` VALUES ('4400', '六枝特区', '407', '0', '3');
INSERT INTO `shop_area` VALUES ('4401', '水城县', '407', '0', '3');
INSERT INTO `shop_area` VALUES ('4402', '盘县', '407', '0', '3');
INSERT INTO `shop_area` VALUES ('4403', '钟山区', '407', '0', '3');
INSERT INTO `shop_area` VALUES ('4404', '习水县', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4405', '仁怀市', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4406', '余庆县', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4407', '凤冈县', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4408', '务川仡佬族苗族自治县', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4409', '桐梓县', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4410', '正安县', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4411', '汇川区', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4412', '湄潭县', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4413', '红花岗区', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4414', '绥阳县', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4415', '赤水市', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4416', '道真仡佬族苗族自治县', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4417', '遵义县', '408', '0', '3');
INSERT INTO `shop_area` VALUES ('4418', '关岭布依族苗族自治县', '409', '0', '3');
INSERT INTO `shop_area` VALUES ('4419', '平坝县', '409', '0', '3');
INSERT INTO `shop_area` VALUES ('4420', '普定县', '409', '0', '3');
INSERT INTO `shop_area` VALUES ('4421', '紫云苗族布依族自治县', '409', '0', '3');
INSERT INTO `shop_area` VALUES ('4422', '西秀区', '409', '0', '3');
INSERT INTO `shop_area` VALUES ('4423', '镇宁布依族苗族自治县', '409', '0', '3');
INSERT INTO `shop_area` VALUES ('4424', '万山特区', '410', '0', '3');
INSERT INTO `shop_area` VALUES ('4425', '印江土家族苗族自治县', '410', '0', '3');
INSERT INTO `shop_area` VALUES ('4426', '德江县', '410', '0', '3');
INSERT INTO `shop_area` VALUES ('4427', '思南县', '410', '0', '3');
INSERT INTO `shop_area` VALUES ('4428', '松桃苗族自治县', '410', '0', '3');
INSERT INTO `shop_area` VALUES ('4429', '江口县', '410', '0', '3');
INSERT INTO `shop_area` VALUES ('4430', '沿河土家族自治县', '410', '0', '3');
INSERT INTO `shop_area` VALUES ('4431', '玉屏侗族自治县', '410', '0', '3');
INSERT INTO `shop_area` VALUES ('4432', '石阡县', '410', '0', '3');
INSERT INTO `shop_area` VALUES ('4433', '铜仁市', '410', '0', '3');
INSERT INTO `shop_area` VALUES ('4434', '兴义市', '411', '0', '3');
INSERT INTO `shop_area` VALUES ('4435', '兴仁县', '411', '0', '3');
INSERT INTO `shop_area` VALUES ('4436', '册亨县', '411', '0', '3');
INSERT INTO `shop_area` VALUES ('4437', '安龙县', '411', '0', '3');
INSERT INTO `shop_area` VALUES ('4438', '普安县', '411', '0', '3');
INSERT INTO `shop_area` VALUES ('4439', '晴隆县', '411', '0', '3');
INSERT INTO `shop_area` VALUES ('4440', '望谟县', '411', '0', '3');
INSERT INTO `shop_area` VALUES ('4441', '贞丰县', '411', '0', '3');
INSERT INTO `shop_area` VALUES ('4442', '大方县', '412', '0', '3');
INSERT INTO `shop_area` VALUES ('4443', '威宁彝族回族苗族自治县', '412', '0', '3');
INSERT INTO `shop_area` VALUES ('4444', '毕节市', '412', '0', '3');
INSERT INTO `shop_area` VALUES ('4445', '纳雍县', '412', '0', '3');
INSERT INTO `shop_area` VALUES ('4446', '织金县', '412', '0', '3');
INSERT INTO `shop_area` VALUES ('4447', '赫章县', '412', '0', '3');
INSERT INTO `shop_area` VALUES ('4448', '金沙县', '412', '0', '3');
INSERT INTO `shop_area` VALUES ('4449', '黔西县', '412', '0', '3');
INSERT INTO `shop_area` VALUES ('4450', '三穗县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4451', '丹寨县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4452', '从江县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4453', '凯里市', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4454', '剑河县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4455', '台江县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4456', '天柱县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4457', '岑巩县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4458', '施秉县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4459', '榕江县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4460', '锦屏县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4461', '镇远县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4462', '雷山县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4463', '麻江县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4464', '黄平县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4465', '黎平县', '413', '0', '3');
INSERT INTO `shop_area` VALUES ('4466', '三都水族自治县', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4467', '平塘县', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4468', '惠水县', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4469', '独山县', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4470', '瓮安县', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4471', '福泉市', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4472', '罗甸县', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4473', '荔波县', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4474', '贵定县', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4475', '都匀市', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4476', '长顺县', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4477', '龙里县', '414', '0', '3');
INSERT INTO `shop_area` VALUES ('4478', '东川区', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4479', '五华区', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4480', '呈贡县', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4481', '安宁市', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4482', '官渡区', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4483', '宜良县', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4484', '富民县', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4485', '寻甸回族彝族自治县', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4486', '嵩明县', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4487', '晋宁县', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4488', '盘龙区', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4489', '石林彝族自治县', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4490', '禄劝彝族苗族自治县', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4491', '西山区', '415', '0', '3');
INSERT INTO `shop_area` VALUES ('4492', '会泽县', '416', '0', '3');
INSERT INTO `shop_area` VALUES ('4493', '宣威市', '416', '0', '3');
INSERT INTO `shop_area` VALUES ('4494', '富源县', '416', '0', '3');
INSERT INTO `shop_area` VALUES ('4495', '师宗县', '416', '0', '3');
INSERT INTO `shop_area` VALUES ('4496', '沾益县', '416', '0', '3');
INSERT INTO `shop_area` VALUES ('4497', '罗平县', '416', '0', '3');
INSERT INTO `shop_area` VALUES ('4498', '陆良县', '416', '0', '3');
INSERT INTO `shop_area` VALUES ('4499', '马龙县', '416', '0', '3');
INSERT INTO `shop_area` VALUES ('4500', '麒麟区', '416', '0', '3');
INSERT INTO `shop_area` VALUES ('4501', '元江哈尼族彝族傣族自治县', '417', '0', '3');
INSERT INTO `shop_area` VALUES ('4502', '华宁县', '417', '0', '3');
INSERT INTO `shop_area` VALUES ('4503', '峨山彝族自治县', '417', '0', '3');
INSERT INTO `shop_area` VALUES ('4504', '新平彝族傣族自治县', '417', '0', '3');
INSERT INTO `shop_area` VALUES ('4505', '易门县', '417', '0', '3');
INSERT INTO `shop_area` VALUES ('4506', '江川县', '417', '0', '3');
INSERT INTO `shop_area` VALUES ('4507', '澄江县', '417', '0', '3');
INSERT INTO `shop_area` VALUES ('4508', '红塔区', '417', '0', '3');
INSERT INTO `shop_area` VALUES ('4509', '通海县', '417', '0', '3');
INSERT INTO `shop_area` VALUES ('4510', '施甸县', '418', '0', '3');
INSERT INTO `shop_area` VALUES ('4511', '昌宁县', '418', '0', '3');
INSERT INTO `shop_area` VALUES ('4512', '腾冲县', '418', '0', '3');
INSERT INTO `shop_area` VALUES ('4513', '隆阳区', '418', '0', '3');
INSERT INTO `shop_area` VALUES ('4514', '龙陵县', '418', '0', '3');
INSERT INTO `shop_area` VALUES ('4515', '大关县', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4516', '威信县', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4517', '巧家县', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4518', '彝良县', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4519', '昭阳区', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4520', '水富县', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4521', '永善县', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4522', '盐津县', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4523', '绥江县', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4524', '镇雄县', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4525', '鲁甸县', '419', '0', '3');
INSERT INTO `shop_area` VALUES ('4526', '华坪县', '420', '0', '3');
INSERT INTO `shop_area` VALUES ('4527', '古城区', '420', '0', '3');
INSERT INTO `shop_area` VALUES ('4528', '宁蒗彝族自治县', '420', '0', '3');
INSERT INTO `shop_area` VALUES ('4529', '永胜县', '420', '0', '3');
INSERT INTO `shop_area` VALUES ('4530', '玉龙纳西族自治县', '420', '0', '3');
INSERT INTO `shop_area` VALUES ('4531', '临翔区', '422', '0', '3');
INSERT INTO `shop_area` VALUES ('4532', '云县', '422', '0', '3');
INSERT INTO `shop_area` VALUES ('4533', '凤庆县', '422', '0', '3');
INSERT INTO `shop_area` VALUES ('4534', '双江拉祜族佤族布朗族傣族自治县', '422', '0', '3');
INSERT INTO `shop_area` VALUES ('4535', '永德县', '422', '0', '3');
INSERT INTO `shop_area` VALUES ('4536', '沧源佤族自治县', '422', '0', '3');
INSERT INTO `shop_area` VALUES ('4537', '耿马傣族佤族自治县', '422', '0', '3');
INSERT INTO `shop_area` VALUES ('4538', '镇康县', '422', '0', '3');
INSERT INTO `shop_area` VALUES ('4539', '元谋县', '423', '0', '3');
INSERT INTO `shop_area` VALUES ('4540', '南华县', '423', '0', '3');
INSERT INTO `shop_area` VALUES ('4541', '双柏县', '423', '0', '3');
INSERT INTO `shop_area` VALUES ('4542', '大姚县', '423', '0', '3');
INSERT INTO `shop_area` VALUES ('4543', '姚安县', '423', '0', '3');
INSERT INTO `shop_area` VALUES ('4544', '楚雄市', '423', '0', '3');
INSERT INTO `shop_area` VALUES ('4545', '武定县', '423', '0', '3');
INSERT INTO `shop_area` VALUES ('4546', '永仁县', '423', '0', '3');
INSERT INTO `shop_area` VALUES ('4547', '牟定县', '423', '0', '3');
INSERT INTO `shop_area` VALUES ('4548', '禄丰县', '423', '0', '3');
INSERT INTO `shop_area` VALUES ('4549', '个旧市', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4550', '元阳县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4551', '屏边苗族自治县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4552', '建水县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4553', '开远市', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4554', '弥勒县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4555', '河口瑶族自治县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4556', '泸西县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4557', '石屏县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4558', '红河县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4559', '绿春县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4560', '蒙自县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4561', '金平苗族瑶族傣族自治县', '424', '0', '3');
INSERT INTO `shop_area` VALUES ('4562', '丘北县', '425', '0', '3');
INSERT INTO `shop_area` VALUES ('4563', '富宁县', '425', '0', '3');
INSERT INTO `shop_area` VALUES ('4564', '广南县', '425', '0', '3');
INSERT INTO `shop_area` VALUES ('4565', '文山县', '425', '0', '3');
INSERT INTO `shop_area` VALUES ('4566', '砚山县', '425', '0', '3');
INSERT INTO `shop_area` VALUES ('4567', '西畴县', '425', '0', '3');
INSERT INTO `shop_area` VALUES ('4568', '马关县', '425', '0', '3');
INSERT INTO `shop_area` VALUES ('4569', '麻栗坡县', '425', '0', '3');
INSERT INTO `shop_area` VALUES ('4570', '勐海县', '426', '0', '3');
INSERT INTO `shop_area` VALUES ('4571', '勐腊县', '426', '0', '3');
INSERT INTO `shop_area` VALUES ('4572', '景洪市', '426', '0', '3');
INSERT INTO `shop_area` VALUES ('4573', '云龙县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4574', '剑川县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4575', '南涧彝族自治县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4576', '大理市', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4577', '宾川县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4578', '巍山彝族回族自治县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4579', '弥渡县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4580', '永平县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4581', '洱源县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4582', '漾濞彝族自治县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4583', '祥云县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4584', '鹤庆县', '427', '0', '3');
INSERT INTO `shop_area` VALUES ('4585', '梁河县', '428', '0', '3');
INSERT INTO `shop_area` VALUES ('4586', '潞西市', '428', '0', '3');
INSERT INTO `shop_area` VALUES ('4587', '瑞丽市', '428', '0', '3');
INSERT INTO `shop_area` VALUES ('4588', '盈江县', '428', '0', '3');
INSERT INTO `shop_area` VALUES ('4589', '陇川县', '428', '0', '3');
INSERT INTO `shop_area` VALUES ('4590', '德钦县', '430', '0', '3');
INSERT INTO `shop_area` VALUES ('4591', '维西傈僳族自治县', '430', '0', '3');
INSERT INTO `shop_area` VALUES ('4592', '香格里拉县', '430', '0', '3');
INSERT INTO `shop_area` VALUES ('4593', '城关区', '431', '0', '3');
INSERT INTO `shop_area` VALUES ('4594', '堆龙德庆县', '431', '0', '3');
INSERT INTO `shop_area` VALUES ('4595', '墨竹工卡县', '431', '0', '3');
INSERT INTO `shop_area` VALUES ('4596', '尼木县', '431', '0', '3');
INSERT INTO `shop_area` VALUES ('4597', '当雄县', '431', '0', '3');
INSERT INTO `shop_area` VALUES ('4598', '曲水县', '431', '0', '3');
INSERT INTO `shop_area` VALUES ('4599', '林周县', '431', '0', '3');
INSERT INTO `shop_area` VALUES ('4600', '达孜县', '431', '0', '3');
INSERT INTO `shop_area` VALUES ('4601', '丁青县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4602', '八宿县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4603', '察雅县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4604', '左贡县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4605', '昌都县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4606', '江达县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4607', '洛隆县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4608', '类乌齐县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4609', '芒康县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4610', '贡觉县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4611', '边坝县', '432', '0', '3');
INSERT INTO `shop_area` VALUES ('4612', '乃东县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4613', '加查县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4614', '扎囊县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4615', '措美县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4616', '曲松县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4617', '桑日县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4618', '洛扎县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4619', '浪卡子县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4620', '琼结县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4621', '贡嘎县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4622', '错那县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4623', '隆子县', '433', '0', '3');
INSERT INTO `shop_area` VALUES ('4624', '亚东县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4625', '仁布县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4626', '仲巴县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4627', '南木林县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4628', '吉隆县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4629', '定日县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4630', '定结县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4631', '岗巴县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4632', '康马县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4633', '拉孜县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4634', '日喀则市', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4635', '昂仁县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4636', '江孜县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4637', '白朗县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4638', '聂拉木县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4639', '萨嘎县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4640', '萨迦县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4641', '谢通门县', '434', '0', '3');
INSERT INTO `shop_area` VALUES ('4642', '嘉黎县', '435', '0', '3');
INSERT INTO `shop_area` VALUES ('4643', '安多县', '435', '0', '3');
INSERT INTO `shop_area` VALUES ('4644', '尼玛县', '435', '0', '3');
INSERT INTO `shop_area` VALUES ('4645', '巴青县', '435', '0', '3');
INSERT INTO `shop_area` VALUES ('4646', '比如县', '435', '0', '3');
INSERT INTO `shop_area` VALUES ('4647', '班戈县', '435', '0', '3');
INSERT INTO `shop_area` VALUES ('4648', '申扎县', '435', '0', '3');
INSERT INTO `shop_area` VALUES ('4649', '索县', '435', '0', '3');
INSERT INTO `shop_area` VALUES ('4650', '聂荣县', '435', '0', '3');
INSERT INTO `shop_area` VALUES ('4651', '那曲县', '435', '0', '3');
INSERT INTO `shop_area` VALUES ('4652', '噶尔县', '436', '0', '3');
INSERT INTO `shop_area` VALUES ('4653', '措勤县', '436', '0', '3');
INSERT INTO `shop_area` VALUES ('4654', '改则县', '436', '0', '3');
INSERT INTO `shop_area` VALUES ('4655', '日土县', '436', '0', '3');
INSERT INTO `shop_area` VALUES ('4656', '普兰县', '436', '0', '3');
INSERT INTO `shop_area` VALUES ('4657', '札达县', '436', '0', '3');
INSERT INTO `shop_area` VALUES ('4658', '革吉县', '436', '0', '3');
INSERT INTO `shop_area` VALUES ('4659', '墨脱县', '437', '0', '3');
INSERT INTO `shop_area` VALUES ('4660', '察隅县', '437', '0', '3');
INSERT INTO `shop_area` VALUES ('4661', '工布江达县', '437', '0', '3');
INSERT INTO `shop_area` VALUES ('4662', '朗县', '437', '0', '3');
INSERT INTO `shop_area` VALUES ('4663', '林芝县', '437', '0', '3');
INSERT INTO `shop_area` VALUES ('4664', '波密县', '437', '0', '3');
INSERT INTO `shop_area` VALUES ('4665', '米林县', '437', '0', '3');
INSERT INTO `shop_area` VALUES ('4666', '临潼区', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4667', '周至县', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4668', '户县', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4669', '新城区', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4670', '未央区', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4671', '灞桥区', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4672', '碑林区', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4673', '莲湖区', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4674', '蓝田县', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4675', '长安区', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4676', '阎良区', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4677', '雁塔区', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4678', '高陵县', '438', '0', '3');
INSERT INTO `shop_area` VALUES ('4679', '印台区', '439', '0', '3');
INSERT INTO `shop_area` VALUES ('4680', '宜君县', '439', '0', '3');
INSERT INTO `shop_area` VALUES ('4681', '王益区', '439', '0', '3');
INSERT INTO `shop_area` VALUES ('4682', '耀州区', '439', '0', '3');
INSERT INTO `shop_area` VALUES ('4683', '凤县', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4684', '凤翔县', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4685', '千阳县', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4686', '太白县', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4687', '岐山县', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4688', '扶风县', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4689', '渭滨区', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4690', '眉县', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4691', '金台区', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4692', '陇县', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4693', '陈仓区', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4694', '麟游县', '440', '0', '3');
INSERT INTO `shop_area` VALUES ('4695', '三原县', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4696', '干县', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4697', '兴平市', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4698', '彬县', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4699', '旬邑县', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4700', '杨陵区', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4701', '武功县', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4702', '永寿县', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4703', '泾阳县', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4704', '淳化县', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4705', '渭城区', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4706', '礼泉县', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4707', '秦都区', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4708', '长武县', '441', '0', '3');
INSERT INTO `shop_area` VALUES ('4709', '临渭区', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4710', '华县', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4711', '华阴市', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4712', '合阳县', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4713', '大荔县', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4714', '富平县', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4715', '潼关县', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4716', '澄城县', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4717', '白水县', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4718', '蒲城县', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4719', '韩城市', '442', '0', '3');
INSERT INTO `shop_area` VALUES ('4720', '吴起县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4721', '子长县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4722', '安塞县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4723', '宜川县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4724', '宝塔区', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4725', '富县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4726', '延川县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4727', '延长县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4728', '志丹县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4729', '洛川县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4730', '甘泉县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4731', '黄陵县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4732', '黄龙县', '443', '0', '3');
INSERT INTO `shop_area` VALUES ('4733', '佛坪县', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4734', '勉县', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4735', '南郑县', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4736', '城固县', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4737', '宁强县', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4738', '汉台区', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4739', '洋县', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4740', '留坝县', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4741', '略阳县', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4742', '西乡县', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4743', '镇巴县', '444', '0', '3');
INSERT INTO `shop_area` VALUES ('4744', '佳县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4745', '吴堡县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4746', '子洲县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4747', '定边县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4748', '府谷县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4749', '榆林市榆阳区', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4750', '横山县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4751', '清涧县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4752', '神木县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4753', '米脂县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4754', '绥德县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4755', '靖边县', '445', '0', '3');
INSERT INTO `shop_area` VALUES ('4756', '宁陕县', '446', '0', '3');
INSERT INTO `shop_area` VALUES ('4757', '岚皋县', '446', '0', '3');
INSERT INTO `shop_area` VALUES ('4758', '平利县', '446', '0', '3');
INSERT INTO `shop_area` VALUES ('4759', '旬阳县', '446', '0', '3');
INSERT INTO `shop_area` VALUES ('4760', '汉滨区', '446', '0', '3');
INSERT INTO `shop_area` VALUES ('4761', '汉阴县', '446', '0', '3');
INSERT INTO `shop_area` VALUES ('4762', '白河县', '446', '0', '3');
INSERT INTO `shop_area` VALUES ('4763', '石泉县', '446', '0', '3');
INSERT INTO `shop_area` VALUES ('4764', '紫阳县', '446', '0', '3');
INSERT INTO `shop_area` VALUES ('4765', '镇坪县', '446', '0', '3');
INSERT INTO `shop_area` VALUES ('4766', '丹凤县', '447', '0', '3');
INSERT INTO `shop_area` VALUES ('4767', '商南县', '447', '0', '3');
INSERT INTO `shop_area` VALUES ('4768', '商州区', '447', '0', '3');
INSERT INTO `shop_area` VALUES ('4769', '山阳县', '447', '0', '3');
INSERT INTO `shop_area` VALUES ('4770', '柞水县', '447', '0', '3');
INSERT INTO `shop_area` VALUES ('4771', '洛南县', '447', '0', '3');
INSERT INTO `shop_area` VALUES ('4772', '镇安县', '447', '0', '3');
INSERT INTO `shop_area` VALUES ('4773', '七里河区', '448', '0', '3');
INSERT INTO `shop_area` VALUES ('4774', '城关区', '448', '0', '3');
INSERT INTO `shop_area` VALUES ('4775', '安宁区', '448', '0', '3');
INSERT INTO `shop_area` VALUES ('4776', '榆中县', '448', '0', '3');
INSERT INTO `shop_area` VALUES ('4777', '永登县', '448', '0', '3');
INSERT INTO `shop_area` VALUES ('4778', '皋兰县', '448', '0', '3');
INSERT INTO `shop_area` VALUES ('4779', '红古区', '448', '0', '3');
INSERT INTO `shop_area` VALUES ('4780', '西固区', '448', '0', '3');
INSERT INTO `shop_area` VALUES ('4781', '嘉峪关市', '449', '0', '3');
INSERT INTO `shop_area` VALUES ('4782', '永昌县', '450', '0', '3');
INSERT INTO `shop_area` VALUES ('4783', '金川区', '450', '0', '3');
INSERT INTO `shop_area` VALUES ('4784', '会宁县', '451', '0', '3');
INSERT INTO `shop_area` VALUES ('4785', '平川区', '451', '0', '3');
INSERT INTO `shop_area` VALUES ('4786', '景泰县', '451', '0', '3');
INSERT INTO `shop_area` VALUES ('4787', '白银区', '451', '0', '3');
INSERT INTO `shop_area` VALUES ('4788', '靖远县', '451', '0', '3');
INSERT INTO `shop_area` VALUES ('4789', '张家川回族自治县', '452', '0', '3');
INSERT INTO `shop_area` VALUES ('4790', '武山县', '452', '0', '3');
INSERT INTO `shop_area` VALUES ('4791', '清水县', '452', '0', '3');
INSERT INTO `shop_area` VALUES ('4792', '甘谷县', '452', '0', '3');
INSERT INTO `shop_area` VALUES ('4793', '秦安县', '452', '0', '3');
INSERT INTO `shop_area` VALUES ('4794', '秦州区', '452', '0', '3');
INSERT INTO `shop_area` VALUES ('4795', '麦积区', '452', '0', '3');
INSERT INTO `shop_area` VALUES ('4796', '凉州区', '453', '0', '3');
INSERT INTO `shop_area` VALUES ('4797', '古浪县', '453', '0', '3');
INSERT INTO `shop_area` VALUES ('4798', '天祝藏族自治县', '453', '0', '3');
INSERT INTO `shop_area` VALUES ('4799', '民勤县', '453', '0', '3');
INSERT INTO `shop_area` VALUES ('4800', '临泽县', '454', '0', '3');
INSERT INTO `shop_area` VALUES ('4801', '山丹县', '454', '0', '3');
INSERT INTO `shop_area` VALUES ('4802', '民乐县', '454', '0', '3');
INSERT INTO `shop_area` VALUES ('4803', '甘州区', '454', '0', '3');
INSERT INTO `shop_area` VALUES ('4804', '肃南裕固族自治县', '454', '0', '3');
INSERT INTO `shop_area` VALUES ('4805', '高台县', '454', '0', '3');
INSERT INTO `shop_area` VALUES ('4806', '华亭县', '455', '0', '3');
INSERT INTO `shop_area` VALUES ('4807', '崆峒区', '455', '0', '3');
INSERT INTO `shop_area` VALUES ('4808', '崇信县', '455', '0', '3');
INSERT INTO `shop_area` VALUES ('4809', '庄浪县', '455', '0', '3');
INSERT INTO `shop_area` VALUES ('4810', '泾川县', '455', '0', '3');
INSERT INTO `shop_area` VALUES ('4811', '灵台县', '455', '0', '3');
INSERT INTO `shop_area` VALUES ('4812', '静宁县', '455', '0', '3');
INSERT INTO `shop_area` VALUES ('4813', '敦煌市', '456', '0', '3');
INSERT INTO `shop_area` VALUES ('4814', '玉门市', '456', '0', '3');
INSERT INTO `shop_area` VALUES ('4815', '瓜州县（原安西县）', '456', '0', '3');
INSERT INTO `shop_area` VALUES ('4816', '肃北蒙古族自治县', '456', '0', '3');
INSERT INTO `shop_area` VALUES ('4817', '肃州区', '456', '0', '3');
INSERT INTO `shop_area` VALUES ('4818', '金塔县', '456', '0', '3');
INSERT INTO `shop_area` VALUES ('4819', '阿克塞哈萨克族自治县', '456', '0', '3');
INSERT INTO `shop_area` VALUES ('4820', '华池县', '457', '0', '3');
INSERT INTO `shop_area` VALUES ('4821', '合水县', '457', '0', '3');
INSERT INTO `shop_area` VALUES ('4822', '宁县', '457', '0', '3');
INSERT INTO `shop_area` VALUES ('4823', '庆城县', '457', '0', '3');
INSERT INTO `shop_area` VALUES ('4824', '正宁县', '457', '0', '3');
INSERT INTO `shop_area` VALUES ('4825', '环县', '457', '0', '3');
INSERT INTO `shop_area` VALUES ('4826', '西峰区', '457', '0', '3');
INSERT INTO `shop_area` VALUES ('4827', '镇原县', '457', '0', '3');
INSERT INTO `shop_area` VALUES ('4828', '临洮县', '458', '0', '3');
INSERT INTO `shop_area` VALUES ('4829', '安定区', '458', '0', '3');
INSERT INTO `shop_area` VALUES ('4830', '岷县', '458', '0', '3');
INSERT INTO `shop_area` VALUES ('4831', '渭源县', '458', '0', '3');
INSERT INTO `shop_area` VALUES ('4832', '漳县', '458', '0', '3');
INSERT INTO `shop_area` VALUES ('4833', '通渭县', '458', '0', '3');
INSERT INTO `shop_area` VALUES ('4834', '陇西县', '458', '0', '3');
INSERT INTO `shop_area` VALUES ('4835', '两当县', '459', '0', '3');
INSERT INTO `shop_area` VALUES ('4836', '宕昌县', '459', '0', '3');
INSERT INTO `shop_area` VALUES ('4837', '康县', '459', '0', '3');
INSERT INTO `shop_area` VALUES ('4838', '徽县', '459', '0', '3');
INSERT INTO `shop_area` VALUES ('4839', '成县', '459', '0', '3');
INSERT INTO `shop_area` VALUES ('4840', '文县', '459', '0', '3');
INSERT INTO `shop_area` VALUES ('4841', '武都区', '459', '0', '3');
INSERT INTO `shop_area` VALUES ('4842', '礼县', '459', '0', '3');
INSERT INTO `shop_area` VALUES ('4843', '西和县', '459', '0', '3');
INSERT INTO `shop_area` VALUES ('4844', '东乡族自治县', '460', '0', '3');
INSERT INTO `shop_area` VALUES ('4845', '临夏县', '460', '0', '3');
INSERT INTO `shop_area` VALUES ('4846', '临夏市', '460', '0', '3');
INSERT INTO `shop_area` VALUES ('4847', '和政县', '460', '0', '3');
INSERT INTO `shop_area` VALUES ('4848', '广河县', '460', '0', '3');
INSERT INTO `shop_area` VALUES ('4849', '康乐县', '460', '0', '3');
INSERT INTO `shop_area` VALUES ('4850', '永靖县', '460', '0', '3');
INSERT INTO `shop_area` VALUES ('4851', '积石山保安族东乡族撒拉族自治县', '460', '0', '3');
INSERT INTO `shop_area` VALUES ('4852', '临潭县', '461', '0', '3');
INSERT INTO `shop_area` VALUES ('4853', '卓尼县', '461', '0', '3');
INSERT INTO `shop_area` VALUES ('4854', '合作市', '461', '0', '3');
INSERT INTO `shop_area` VALUES ('4855', '夏河县', '461', '0', '3');
INSERT INTO `shop_area` VALUES ('4856', '玛曲县', '461', '0', '3');
INSERT INTO `shop_area` VALUES ('4857', '碌曲县', '461', '0', '3');
INSERT INTO `shop_area` VALUES ('4858', '舟曲县', '461', '0', '3');
INSERT INTO `shop_area` VALUES ('4859', '迭部县', '461', '0', '3');
INSERT INTO `shop_area` VALUES ('4860', '城东区', '462', '0', '3');
INSERT INTO `shop_area` VALUES ('4861', '城中区', '462', '0', '3');
INSERT INTO `shop_area` VALUES ('4862', '城北区', '462', '0', '3');
INSERT INTO `shop_area` VALUES ('4863', '城西区', '462', '0', '3');
INSERT INTO `shop_area` VALUES ('4864', '大通回族土族自治县', '462', '0', '3');
INSERT INTO `shop_area` VALUES ('4865', '湟中县', '462', '0', '3');
INSERT INTO `shop_area` VALUES ('4866', '湟源县', '462', '0', '3');
INSERT INTO `shop_area` VALUES ('4867', '乐都县', '463', '0', '3');
INSERT INTO `shop_area` VALUES ('4868', '互助土族自治县', '463', '0', '3');
INSERT INTO `shop_area` VALUES ('4869', '化隆回族自治县', '463', '0', '3');
INSERT INTO `shop_area` VALUES ('4870', '平安县', '463', '0', '3');
INSERT INTO `shop_area` VALUES ('4871', '循化撒拉族自治县', '463', '0', '3');
INSERT INTO `shop_area` VALUES ('4872', '民和回族土族自治县', '463', '0', '3');
INSERT INTO `shop_area` VALUES ('4873', '刚察县', '464', '0', '3');
INSERT INTO `shop_area` VALUES ('4874', '海晏县', '464', '0', '3');
INSERT INTO `shop_area` VALUES ('4875', '祁连县', '464', '0', '3');
INSERT INTO `shop_area` VALUES ('4876', '门源回族自治县', '464', '0', '3');
INSERT INTO `shop_area` VALUES ('4877', '同仁县', '465', '0', '3');
INSERT INTO `shop_area` VALUES ('4878', '尖扎县', '465', '0', '3');
INSERT INTO `shop_area` VALUES ('4879', '河南蒙古族自治县', '465', '0', '3');
INSERT INTO `shop_area` VALUES ('4880', '泽库县', '465', '0', '3');
INSERT INTO `shop_area` VALUES ('4881', '共和县', '466', '0', '3');
INSERT INTO `shop_area` VALUES ('4882', '兴海县', '466', '0', '3');
INSERT INTO `shop_area` VALUES ('4883', '同德县', '466', '0', '3');
INSERT INTO `shop_area` VALUES ('4884', '贵南县', '466', '0', '3');
INSERT INTO `shop_area` VALUES ('4885', '贵德县', '466', '0', '3');
INSERT INTO `shop_area` VALUES ('4886', '久治县', '467', '0', '3');
INSERT INTO `shop_area` VALUES ('4887', '玛多县', '467', '0', '3');
INSERT INTO `shop_area` VALUES ('4888', '玛沁县', '467', '0', '3');
INSERT INTO `shop_area` VALUES ('4889', '班玛县', '467', '0', '3');
INSERT INTO `shop_area` VALUES ('4890', '甘德县', '467', '0', '3');
INSERT INTO `shop_area` VALUES ('4891', '达日县', '467', '0', '3');
INSERT INTO `shop_area` VALUES ('4892', '囊谦县', '468', '0', '3');
INSERT INTO `shop_area` VALUES ('4893', '曲麻莱县', '468', '0', '3');
INSERT INTO `shop_area` VALUES ('4894', '杂多县', '468', '0', '3');
INSERT INTO `shop_area` VALUES ('4895', '治多县', '468', '0', '3');
INSERT INTO `shop_area` VALUES ('4896', '玉树县', '468', '0', '3');
INSERT INTO `shop_area` VALUES ('4897', '称多县', '468', '0', '3');
INSERT INTO `shop_area` VALUES ('4898', '乌兰县', '469', '0', '3');
INSERT INTO `shop_area` VALUES ('4899', '冷湖行委', '469', '0', '3');
INSERT INTO `shop_area` VALUES ('4900', '大柴旦行委', '469', '0', '3');
INSERT INTO `shop_area` VALUES ('4901', '天峻县', '469', '0', '3');
INSERT INTO `shop_area` VALUES ('4902', '德令哈市', '469', '0', '3');
INSERT INTO `shop_area` VALUES ('4903', '格尔木市', '469', '0', '3');
INSERT INTO `shop_area` VALUES ('4904', '茫崖行委', '469', '0', '3');
INSERT INTO `shop_area` VALUES ('4905', '都兰县', '469', '0', '3');
INSERT INTO `shop_area` VALUES ('4906', '兴庆区', '470', '0', '3');
INSERT INTO `shop_area` VALUES ('4907', '永宁县', '470', '0', '3');
INSERT INTO `shop_area` VALUES ('4908', '灵武市', '470', '0', '3');
INSERT INTO `shop_area` VALUES ('4909', '西夏区', '470', '0', '3');
INSERT INTO `shop_area` VALUES ('4910', '贺兰县', '470', '0', '3');
INSERT INTO `shop_area` VALUES ('4911', '金凤区', '470', '0', '3');
INSERT INTO `shop_area` VALUES ('4912', '大武口区', '471', '0', '3');
INSERT INTO `shop_area` VALUES ('4913', '平罗县', '471', '0', '3');
INSERT INTO `shop_area` VALUES ('4914', '惠农区', '471', '0', '3');
INSERT INTO `shop_area` VALUES ('4915', '利通区', '472', '0', '3');
INSERT INTO `shop_area` VALUES ('4916', '同心县', '472', '0', '3');
INSERT INTO `shop_area` VALUES ('4917', '盐池县', '472', '0', '3');
INSERT INTO `shop_area` VALUES ('4918', '青铜峡市', '472', '0', '3');
INSERT INTO `shop_area` VALUES ('4919', '原州区', '473', '0', '3');
INSERT INTO `shop_area` VALUES ('4920', '彭阳县', '473', '0', '3');
INSERT INTO `shop_area` VALUES ('4921', '泾源县', '473', '0', '3');
INSERT INTO `shop_area` VALUES ('4922', '西吉县', '473', '0', '3');
INSERT INTO `shop_area` VALUES ('4923', '隆德县', '473', '0', '3');
INSERT INTO `shop_area` VALUES ('4924', '中宁县', '474', '0', '3');
INSERT INTO `shop_area` VALUES ('4925', '沙坡头区', '474', '0', '3');
INSERT INTO `shop_area` VALUES ('4926', '海原县', '474', '0', '3');
INSERT INTO `shop_area` VALUES ('4927', '东山区', '475', '0', '3');
INSERT INTO `shop_area` VALUES ('4928', '乌鲁木齐县', '475', '0', '3');
INSERT INTO `shop_area` VALUES ('4929', '天山区', '475', '0', '3');
INSERT INTO `shop_area` VALUES ('4930', '头屯河区', '475', '0', '3');
INSERT INTO `shop_area` VALUES ('4931', '新市区', '475', '0', '3');
INSERT INTO `shop_area` VALUES ('4932', '水磨沟区', '475', '0', '3');
INSERT INTO `shop_area` VALUES ('4933', '沙依巴克区', '475', '0', '3');
INSERT INTO `shop_area` VALUES ('4934', '达坂城区', '475', '0', '3');
INSERT INTO `shop_area` VALUES ('4935', '乌尔禾区', '476', '0', '3');
INSERT INTO `shop_area` VALUES ('4936', '克拉玛依区', '476', '0', '3');
INSERT INTO `shop_area` VALUES ('4937', '独山子区', '476', '0', '3');
INSERT INTO `shop_area` VALUES ('4938', '白碱滩区', '476', '0', '3');
INSERT INTO `shop_area` VALUES ('4939', '吐鲁番市', '477', '0', '3');
INSERT INTO `shop_area` VALUES ('4940', '托克逊县', '477', '0', '3');
INSERT INTO `shop_area` VALUES ('4941', '鄯善县', '477', '0', '3');
INSERT INTO `shop_area` VALUES ('4942', '伊吾县', '478', '0', '3');
INSERT INTO `shop_area` VALUES ('4943', '哈密市', '478', '0', '3');
INSERT INTO `shop_area` VALUES ('4944', '巴里坤哈萨克自治县', '478', '0', '3');
INSERT INTO `shop_area` VALUES ('4945', '吉木萨尔县', '479', '0', '3');
INSERT INTO `shop_area` VALUES ('4946', '呼图壁县', '479', '0', '3');
INSERT INTO `shop_area` VALUES ('4947', '奇台县', '479', '0', '3');
INSERT INTO `shop_area` VALUES ('4948', '昌吉市', '479', '0', '3');
INSERT INTO `shop_area` VALUES ('4949', '木垒哈萨克自治县', '479', '0', '3');
INSERT INTO `shop_area` VALUES ('4950', '玛纳斯县', '479', '0', '3');
INSERT INTO `shop_area` VALUES ('4951', '米泉市', '479', '0', '3');
INSERT INTO `shop_area` VALUES ('4952', '阜康市', '479', '0', '3');
INSERT INTO `shop_area` VALUES ('4953', '博乐市', '480', '0', '3');
INSERT INTO `shop_area` VALUES ('4954', '温泉县', '480', '0', '3');
INSERT INTO `shop_area` VALUES ('4955', '精河县', '480', '0', '3');
INSERT INTO `shop_area` VALUES ('4956', '博湖县', '481', '0', '3');
INSERT INTO `shop_area` VALUES ('4957', '和硕县', '481', '0', '3');
INSERT INTO `shop_area` VALUES ('4958', '和静县', '481', '0', '3');
INSERT INTO `shop_area` VALUES ('4959', '尉犁县', '481', '0', '3');
INSERT INTO `shop_area` VALUES ('4960', '库尔勒市', '481', '0', '3');
INSERT INTO `shop_area` VALUES ('4961', '焉耆回族自治县', '481', '0', '3');
INSERT INTO `shop_area` VALUES ('4962', '若羌县', '481', '0', '3');
INSERT INTO `shop_area` VALUES ('4963', '轮台县', '481', '0', '3');
INSERT INTO `shop_area` VALUES ('4964', '乌什县', '482', '0', '3');
INSERT INTO `shop_area` VALUES ('4965', '库车县', '482', '0', '3');
INSERT INTO `shop_area` VALUES ('4966', '拜城县', '482', '0', '3');
INSERT INTO `shop_area` VALUES ('4967', '新和县', '482', '0', '3');
INSERT INTO `shop_area` VALUES ('4968', '柯坪县', '482', '0', '3');
INSERT INTO `shop_area` VALUES ('4969', '沙雅县', '482', '0', '3');
INSERT INTO `shop_area` VALUES ('4970', '温宿县', '482', '0', '3');
INSERT INTO `shop_area` VALUES ('4971', '阿克苏市', '482', '0', '3');
INSERT INTO `shop_area` VALUES ('4972', '阿瓦提县', '482', '0', '3');
INSERT INTO `shop_area` VALUES ('4973', '乌恰县', '483', '0', '3');
INSERT INTO `shop_area` VALUES ('4974', '阿克陶县', '483', '0', '3');
INSERT INTO `shop_area` VALUES ('4975', '阿合奇县', '483', '0', '3');
INSERT INTO `shop_area` VALUES ('4976', '阿图什市', '483', '0', '3');
INSERT INTO `shop_area` VALUES ('4977', '伽师县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4978', '叶城县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4979', '喀什市', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4980', '塔什库尔干塔吉克自治县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4981', '岳普湖县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4982', '巴楚县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4983', '泽普县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4984', '疏勒县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4985', '疏附县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4986', '英吉沙县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4987', '莎车县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4988', '麦盖提县', '484', '0', '3');
INSERT INTO `shop_area` VALUES ('4989', '于田县', '485', '0', '3');
INSERT INTO `shop_area` VALUES ('4990', '和田县', '485', '0', '3');
INSERT INTO `shop_area` VALUES ('4991', '和田市', '485', '0', '3');
INSERT INTO `shop_area` VALUES ('4992', '墨玉县', '485', '0', '3');
INSERT INTO `shop_area` VALUES ('4993', '民丰县', '485', '0', '3');
INSERT INTO `shop_area` VALUES ('4994', '洛浦县', '485', '0', '3');
INSERT INTO `shop_area` VALUES ('4995', '皮山县', '485', '0', '3');
INSERT INTO `shop_area` VALUES ('4996', '策勒县', '485', '0', '3');
INSERT INTO `shop_area` VALUES ('4997', '伊宁县', '486', '0', '3');
INSERT INTO `shop_area` VALUES ('4998', '伊宁市', '486', '0', '3');
INSERT INTO `shop_area` VALUES ('4999', '奎屯市', '486', '0', '3');
INSERT INTO `shop_area` VALUES ('5000', '察布查尔锡伯自治县', '486', '0', '3');
INSERT INTO `shop_area` VALUES ('5001', '尼勒克县', '486', '0', '3');
INSERT INTO `shop_area` VALUES ('5002', '巩留县', '486', '0', '3');
INSERT INTO `shop_area` VALUES ('5003', '新源县', '486', '0', '3');
INSERT INTO `shop_area` VALUES ('5004', '昭苏县', '486', '0', '3');
INSERT INTO `shop_area` VALUES ('5005', '特克斯县', '486', '0', '3');
INSERT INTO `shop_area` VALUES ('5006', '霍城县', '486', '0', '3');
INSERT INTO `shop_area` VALUES ('5007', '乌苏市', '487', '0', '3');
INSERT INTO `shop_area` VALUES ('5008', '和布克赛尔蒙古自治县', '487', '0', '3');
INSERT INTO `shop_area` VALUES ('5009', '塔城市', '487', '0', '3');
INSERT INTO `shop_area` VALUES ('5010', '托里县', '487', '0', '3');
INSERT INTO `shop_area` VALUES ('5011', '沙湾县', '487', '0', '3');
INSERT INTO `shop_area` VALUES ('5012', '裕民县', '487', '0', '3');
INSERT INTO `shop_area` VALUES ('5013', '额敏县', '487', '0', '3');
INSERT INTO `shop_area` VALUES ('5014', '吉木乃县', '488', '0', '3');
INSERT INTO `shop_area` VALUES ('5015', '哈巴河县', '488', '0', '3');
INSERT INTO `shop_area` VALUES ('5016', '富蕴县', '488', '0', '3');
INSERT INTO `shop_area` VALUES ('5017', '布尔津县', '488', '0', '3');
INSERT INTO `shop_area` VALUES ('5018', '福海县', '488', '0', '3');
INSERT INTO `shop_area` VALUES ('5019', '阿勒泰市', '488', '0', '3');
INSERT INTO `shop_area` VALUES ('5020', '青河县', '488', '0', '3');
INSERT INTO `shop_area` VALUES ('5021', '石河子市', '489', '0', '3');
INSERT INTO `shop_area` VALUES ('5022', '阿拉尔市', '490', '0', '3');
INSERT INTO `shop_area` VALUES ('5023', '图木舒克市', '491', '0', '3');
INSERT INTO `shop_area` VALUES ('5024', '五家渠市', '492', '0', '3');
INSERT INTO `shop_area` VALUES ('45055', '海外', '35', '0', '2');

-- ----------------------------
-- Table structure for `shop_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `shop_attribute`;
CREATE TABLE `shop_attribute` (
  `attribute_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `value` text,
  `update_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_attribute
-- ----------------------------
INSERT INTO `shop_attribute` VALUES ('1', '颜色', '蓝色,红色', '1561533903');
INSERT INTO `shop_attribute` VALUES ('2', '码数', 'S码,M码,L码,XL码,XXL码', '1562208924');

-- ----------------------------
-- Table structure for `shop_attribute_value`
-- ----------------------------
DROP TABLE IF EXISTS `shop_attribute_value`;
CREATE TABLE `shop_attribute_value` (
  `attribute_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `attribute_id` int(11) NOT NULL DEFAULT '0',
  `value_name` varchar(128) DEFAULT NULL,
  `value_sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='选项值';

-- ----------------------------
-- Records of shop_attribute_value
-- ----------------------------
INSERT INTO `shop_attribute_value` VALUES ('1', '颜色', '1', '蓝色', '1');
INSERT INTO `shop_attribute_value` VALUES ('2', '颜色', '1', '红色', '2');
INSERT INTO `shop_attribute_value` VALUES ('3', '码数', '2', 'S码', '1');
INSERT INTO `shop_attribute_value` VALUES ('4', '码数', '2', 'M码', '2');
INSERT INTO `shop_attribute_value` VALUES ('5', '码数', '2', 'L码', '3');
INSERT INTO `shop_attribute_value` VALUES ('6', '码数', '2', 'XL码', '4');
INSERT INTO `shop_attribute_value` VALUES ('7', '码数', '2', 'XXL码', '5');

-- ----------------------------
-- Table structure for `shop_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_group`;
CREATE TABLE `shop_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `type` varchar(20) DEFAULT NULL,
  `title` char(20) DEFAULT NULL COMMENT '用户组中文名称',
  `description` varchar(80) DEFAULT NULL COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` text COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_auth_group
-- ----------------------------
INSERT INTO `shop_auth_group` VALUES ('2', 'admin', '超级管理员', '后台超级管理员', '1', '1,2,13,19,28,29,30,38,46,48,57,66,67,68,69,70,71,72,73,75,76,77,84,85,86,87,113,120,121,122,123,124,125,126,127,129,130,131,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223');
INSERT INTO `shop_auth_group` VALUES ('3', null, '商品管理员', '管理商品', '1', '19,28,29,30,48,57,66,67,68,69,70,71,72,73,75,76,77,84,85,86,87,134,135,136,140,141,142,143,144,145,146,147,148,149,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,290');

-- ----------------------------
-- Table structure for `shop_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_group_access`;
CREATE TABLE `shop_auth_group_access` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_auth_group_access
-- ----------------------------
INSERT INTO `shop_auth_group_access` VALUES ('3', '2');

-- ----------------------------
-- Table structure for `shop_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_rule`;
CREATE TABLE `shop_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_auth_rule
-- ----------------------------
INSERT INTO `shop_auth_rule` VALUES ('1', '3', '19', 'admin/category/index');
INSERT INTO `shop_auth_rule` VALUES ('2', '3', '28', 'admin/goods/index');
INSERT INTO `shop_auth_rule` VALUES ('3', '3', '29', 'admin/goods/index');
INSERT INTO `shop_auth_rule` VALUES ('4', '3', '30', 'admin/weight_class/index');
INSERT INTO `shop_auth_rule` VALUES ('5', '3', '48', 'admin/option/index');
INSERT INTO `shop_auth_rule` VALUES ('6', '3', '57', 'admin/index/index');
INSERT INTO `shop_auth_rule` VALUES ('7', '3', '66', 'admin/goods/add');
INSERT INTO `shop_auth_rule` VALUES ('8', '3', '67', 'admin/goods/copy_goods');
INSERT INTO `shop_auth_rule` VALUES ('9', '3', '68', 'admin/goods/edit');
INSERT INTO `shop_auth_rule` VALUES ('10', '3', '69', 'admin/goods/del');
INSERT INTO `shop_auth_rule` VALUES ('11', '3', '70', 'admin/category/add');
INSERT INTO `shop_auth_rule` VALUES ('12', '3', '71', 'admin/category/edit');
INSERT INTO `shop_auth_rule` VALUES ('13', '3', '72', 'admin/category/del');
INSERT INTO `shop_auth_rule` VALUES ('14', '3', '73', 'admin/category/autocomplete');
INSERT INTO `shop_auth_rule` VALUES ('15', '3', '75', 'admin/weight_class/add');
INSERT INTO `shop_auth_rule` VALUES ('16', '3', '76', 'admin/weight_class/edit');
INSERT INTO `shop_auth_rule` VALUES ('17', '3', '77', 'admin/weight_class/del');
INSERT INTO `shop_auth_rule` VALUES ('18', '3', '84', 'admin/option/add');
INSERT INTO `shop_auth_rule` VALUES ('19', '3', '85', 'admin/option/edit');
INSERT INTO `shop_auth_rule` VALUES ('20', '3', '86', 'admin/option/del');
INSERT INTO `shop_auth_rule` VALUES ('21', '3', '87', 'admin/option/autocomplete');
INSERT INTO `shop_auth_rule` VALUES ('22', '3', '134', 'admin/attribute/index');
INSERT INTO `shop_auth_rule` VALUES ('23', '3', '135', 'admin/length_class/index');
INSERT INTO `shop_auth_rule` VALUES ('24', '3', '136', 'admin/brand/index');
INSERT INTO `shop_auth_rule` VALUES ('25', '3', '140', 'admin/goods/set_status');
INSERT INTO `shop_auth_rule` VALUES ('26', '3', '141', 'admin/goods/update_price');
INSERT INTO `shop_auth_rule` VALUES ('27', '3', '142', 'admin/goods/update_quantity');
INSERT INTO `shop_auth_rule` VALUES ('28', '3', '143', 'admin/goods/update_sort');
INSERT INTO `shop_auth_rule` VALUES ('29', '3', '144', 'admin/goods/edit_general');
INSERT INTO `shop_auth_rule` VALUES ('30', '3', '145', 'admin/goods/edit_links');
INSERT INTO `shop_auth_rule` VALUES ('31', '3', '146', 'admin/goods/edit_option');
INSERT INTO `shop_auth_rule` VALUES ('32', '3', '147', 'admin/goods/edit_discount');
INSERT INTO `shop_auth_rule` VALUES ('33', '3', '148', 'admin/goods/edit_image');
INSERT INTO `shop_auth_rule` VALUES ('34', '3', '149', 'admin/goods/edit_mobile');
INSERT INTO `shop_auth_rule` VALUES ('35', '3', '151', 'admin/attribute/autocomplete');
INSERT INTO `shop_auth_rule` VALUES ('36', '3', '152', 'admin/brand/autocomplete');
INSERT INTO `shop_auth_rule` VALUES ('37', '3', '153', 'admin/category/update_sort');
INSERT INTO `shop_auth_rule` VALUES ('38', '3', '154', 'admin/attribute/get_attribute_group');
INSERT INTO `shop_auth_rule` VALUES ('39', '3', '155', 'admin/attribute/add');
INSERT INTO `shop_auth_rule` VALUES ('40', '3', '156', 'admin/attribute/edit');
INSERT INTO `shop_auth_rule` VALUES ('41', '3', '157', 'admin/attribute/del');
INSERT INTO `shop_auth_rule` VALUES ('42', '3', '158', 'admin/attribute/autocomplete');
INSERT INTO `shop_auth_rule` VALUES ('43', '3', '159', 'admin/length_class/add');
INSERT INTO `shop_auth_rule` VALUES ('44', '3', '160', 'admin/length_class/edit');
INSERT INTO `shop_auth_rule` VALUES ('45', '3', '161', 'admin/length_class/del');
INSERT INTO `shop_auth_rule` VALUES ('46', '3', '162', 'admin/brand/add');
INSERT INTO `shop_auth_rule` VALUES ('47', '3', '163', 'admin/brand/edit');
INSERT INTO `shop_auth_rule` VALUES ('48', '3', '164', 'admin/brand/del');
INSERT INTO `shop_auth_rule` VALUES ('49', '3', '165', 'admin/brand/autocomplete');
INSERT INTO `shop_auth_rule` VALUES ('50', '3', '290', 'admin/index/logout');

-- ----------------------------
-- Table structure for `shop_brand`
-- ----------------------------
DROP TABLE IF EXISTS `shop_brand`;
CREATE TABLE `shop_brand` (
  `brand_id` int(8) NOT NULL AUTO_INCREMENT,
  `image` varchar(40) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='品牌';

-- ----------------------------
-- Records of shop_brand
-- ----------------------------
INSERT INTO `shop_brand` VALUES ('2', 'images/osc1/icon/15150561539127516.jpg', '三星');
INSERT INTO `shop_brand` VALUES ('3', 'images/osc1/icon/15151421217019377.jpg', '华为');
INSERT INTO `shop_brand` VALUES ('4', 'images/osc1/icon/15151432285720792.jpg', '小米');
INSERT INTO `shop_brand` VALUES ('5', 'images/osc1/icon/15153026524406141.jpg', '魅族');
INSERT INTO `shop_brand` VALUES ('6', 'images/osc1/icon/15153035096646940.jpg', 'vivo');
INSERT INTO `shop_brand` VALUES ('7', 'images/osc1/icon/15153037753503477.jpg', 'oppo');
INSERT INTO `shop_brand` VALUES ('8', 'images/osc1/icon/15158283677962278.jpg', 'iPhone');

-- ----------------------------
-- Table structure for `shop_cart`
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'money',
  `uid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `goods_option` text,
  `quantity` int(5) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `attribute_value_id` varchar(255) DEFAULT NULL COMMENT '商品属性',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`uid`,`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of shop_cart
-- ----------------------------
INSERT INTO `shop_cart` VALUES ('4', 'money', '5', '15', null, '0', '1562548228', '1,3,', '1');
INSERT INTO `shop_cart` VALUES ('5', 'money', '5', '13', null, '0', '1562549542', '2,4,', '1');
INSERT INTO `shop_cart` VALUES ('6', 'money', '5', '14', null, '0', '1562549854', '2,', '1');
INSERT INTO `shop_cart` VALUES ('7', 'money', '4', '13', null, '0', '1563003357', '1,3,', '1');
INSERT INTO `shop_cart` VALUES ('9', 'money', '10', '15', null, '0', '1563009137', '1,3,', '1');
INSERT INTO `shop_cart` VALUES ('10', 'money', '4', '15', null, '0', '1563023413', '2,5,', '1');
INSERT INTO `shop_cart` VALUES ('11', 'money', '4', '14', null, '0', '1563023458', '1,', '1');
INSERT INTO `shop_cart` VALUES ('12', 'money', '11', '15', null, '0', '1564023096', '1,3,', '1');

-- ----------------------------
-- Table structure for `shop_category`
-- ----------------------------
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE `shop_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '标题',
  `image` varchar(64) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `update_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Records of shop_category
-- ----------------------------
INSERT INTO `shop_category` VALUES ('1', '0', '衣服', '', '衣服', '衣服', '1', '1469841858');
INSERT INTO `shop_category` VALUES ('2', '0', '鞋子', '', '鞋子', '鞋子', '2', '1469841883');
INSERT INTO `shop_category` VALUES ('3', '0', '陶瓷', '', '陶瓷', '陶瓷', '3', '1469868530');
INSERT INTO `shop_category` VALUES ('4', '0', '家电', '', '家电', '家电', '4', '1469841960');
INSERT INTO `shop_category` VALUES ('5', '0', '数码', '', '数码', '数码', '5', '1469841977');
INSERT INTO `shop_category` VALUES ('6', '0', '手机', '', '手机', '手机', '6', '1469841990');
INSERT INTO `shop_category` VALUES ('7', '0', '美妆', '', '美妆', '美妆', '7', '1469842040');
INSERT INTO `shop_category` VALUES ('8', '0', '洗护', '', '洗护', '洗护', '8', '1469842056');
INSERT INTO `shop_category` VALUES ('9', '0', '保健品', '', '保健品', '保健品', '9', '1469842069');
INSERT INTO `shop_category` VALUES ('10', '0', '美食', '', '美食', '美食', '10', '1469842102');
INSERT INTO `shop_category` VALUES ('11', '0', '生鲜', '', '生鲜', '生鲜', '11', '1469842118');
INSERT INTO `shop_category` VALUES ('12', '0', '零食', '', '零食', '零食', '12', '1469842139');
INSERT INTO `shop_category` VALUES ('13', '0', '鲜花', '', '鲜花', '鲜花', '13', '1469842165');
INSERT INTO `shop_category` VALUES ('14', '0', '宠物', '', '宠物', '宠物', '14', '1469842177');
INSERT INTO `shop_category` VALUES ('15', '0', '汽车', '', '汽车', '汽车', '15', '1469842190');
INSERT INTO `shop_category` VALUES ('16', '0', '二手', '', '二手', '二手', '16', '1469842225');
INSERT INTO `shop_category` VALUES ('18', '0', '建材', '', '建材', '建材', '17', '1469842264');
INSERT INTO `shop_category` VALUES ('19', '1', '女装', '', '女装', '女装', '0', '1469842334');
INSERT INTO `shop_category` VALUES ('20', '1', '男装', '', '男装', '男装', '0', '1469842353');
INSERT INTO `shop_category` VALUES ('21', '1', '内衣', '', '内衣', '内衣', '0', '1469842524');
INSERT INTO `shop_category` VALUES ('22', '2', '女鞋', '', '女鞋', '女鞋', '0', '1469842561');
INSERT INTO `shop_category` VALUES ('23', '2', '男鞋', '', '男鞋', '男鞋', '0', '1469842577');
INSERT INTO `shop_category` VALUES ('24', '3', '茶盘', '', '茶盘', '茶盘', '0', '1469842601');
INSERT INTO `shop_category` VALUES ('25', '3', '茶壶', '', '茶壶', '茶壶', '0', '1469842623');
INSERT INTO `shop_category` VALUES ('26', '3', '茶杯', '', '茶杯', '茶杯', '0', '1469842637');
INSERT INTO `shop_category` VALUES ('27', '6', '智能机', null, '智能机', '智能机', '0', '1469842637');

-- ----------------------------
-- Table structure for `shop_category_to_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `shop_category_to_attribute`;
CREATE TABLE `shop_category_to_attribute` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL DEFAULT '0',
  `attribute_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分类和属性关联';

-- ----------------------------
-- Records of shop_category_to_attribute
-- ----------------------------
INSERT INTO `shop_category_to_attribute` VALUES ('4', '3', '1');
INSERT INTO `shop_category_to_attribute` VALUES ('5', '3', '2');

-- ----------------------------
-- Table structure for `shop_category_to_brand`
-- ----------------------------
DROP TABLE IF EXISTS `shop_category_to_brand`;
CREATE TABLE `shop_category_to_brand` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL DEFAULT '0',
  `brand_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分类品牌关联';

-- ----------------------------
-- Records of shop_category_to_brand
-- ----------------------------
INSERT INTO `shop_category_to_brand` VALUES ('3', '3', '2');
INSERT INTO `shop_category_to_brand` VALUES ('4', '3', '3');

-- ----------------------------
-- Table structure for `shop_config`
-- ----------------------------
DROP TABLE IF EXISTS `shop_config`;
CREATE TABLE `shop_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) DEFAULT NULL COMMENT '配置名称',
  `value` text COMMENT '配置值',
  `info` varchar(255) DEFAULT NULL COMMENT '描述',
  `module` varchar(40) DEFAULT NULL COMMENT '所属模块',
  `module_name` varchar(40) DEFAULT NULL COMMENT '模块名称',
  `extend_value` varchar(255) DEFAULT NULL COMMENT '扩展值',
  `use_for` varchar(32) DEFAULT NULL COMMENT '用于',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态，1启用，0禁用',
  `sort_order` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_config
-- ----------------------------
INSERT INTO `shop_config` VALUES ('13', 'SITE_TITLE', '珃物', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('14', 'SITE_NAME', '珃物', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('15', 'SITE_DESCRIPTION', '珃物', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('16', 'SITE_KEYWORDS', '珃物', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('17', 'SITE_URL', 'http://mshop.demolink.top', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('19', 'SITE_ICP', '粤ICP备12345678号', 'ICP备案号', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('20', 'EMAIL', 'shop@123456789.com', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('21', 'TELEPHONE', '13800138000', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('22', 'WEB_SITE_CLOSE', '0', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('48', 'SITE_SLOGAN', '珃物', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('53', 'SITE_ICON', 'images/osc1/icon/shop.png', '网站图标', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('61', 'qq', '82944930', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('62', 'administrator', 'admin', '超级管理员账号', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('70', 'page_num', '10', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('71', 'SHORT_URL', 'www.shop.com', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('73', 'account', '', '支付宝账号', 'member', '会员', 'alipay', 'payment', '1', '1');
INSERT INTO `shop_config` VALUES ('74', 'key', '', '支付宝key', 'member', '会员', 'alipay', 'payment', '1', '2');
INSERT INTO `shop_config` VALUES ('75', 'partner', '', '合作者身份（partner ID）', 'member', '会员', 'alipay', 'payment', '1', '3');
INSERT INTO `shop_config` VALUES ('76', 'appid', '', 'appid', 'member', '会员', 'weixin', 'payment', '1', '1');
INSERT INTO `shop_config` VALUES ('77', 'token', '', 'token', 'member', '会员', 'weixin', 'payment', '1', '2');
INSERT INTO `shop_config` VALUES ('78', 'appsecret', '', 'appsecret', 'member', '会员', 'weixin', 'payment', '1', '3');
INSERT INTO `shop_config` VALUES ('79', 'encodingaeskey', '', 'encodingaeskey', 'member', '会员', 'weixin', 'payment', '1', '4');
INSERT INTO `shop_config` VALUES ('80', 'weixin_partner', '', 'partner（商户号）', 'member', '会员', 'weixin', 'payment', '1', '5');
INSERT INTO `shop_config` VALUES ('81', 'partnerkey', '', 'partnerkey', 'member', '会员', 'weixin', 'payment', '1', '6');
INSERT INTO `shop_config` VALUES ('82', 'storage_user_action', 'true', '保存用户行为', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('83', 'ck_image_width', '630', 'ck编辑器图片最大宽度', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('84', 'FRONTEND_USER', '网站会员', '前台用户', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('85', 'BACKEND_USER', '后台系统用户', '后台用户', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('86', 'member_login_type', 'cookie', '会员信息记录在(session/cookie)', 'member', '会员', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('87', 'default_group_id', '2', '默认会员组', 'member', '会员', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('88', 'reg_check', '0', '注册审核', 'member', '会员', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('89', 'weight_id', '1', '重量单位', 'member', '会员', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('90', 'length_id', '1', '长度单位', 'member', '会员', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('91', 'default_order_status_id', '3', '默认订单状态 ', 'member', '会员', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('92', 'paid_order_status_id', '1', '订单付款状态', 'member', '会员', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('93', 'complete_order_status_id', '4', '订单完成状态 ', 'member', '会员', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('94', 'cancel_order_status_id', '5', '订单取消状态 ', 'member', '会员', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('105', 'PWD_KEY', 'MF~V45|rI*7L]{SNtA?d:,j1w$<mJ(/f-0g\"83;&', '', '', '', '', '', '1', '0');
INSERT INTO `shop_config` VALUES ('106', 'bank_name', '中国银行', '平台开户银行', 'common', '网站公共配置', null, null, '1', '0');
INSERT INTO `shop_config` VALUES ('107', 'bank_name2', '广州支行', '平台开户支行', 'common', '网站公共配置', null, null, '1', '0');
INSERT INTO `shop_config` VALUES ('108', 'bank_user', '开发测试', '平台开户姓名', 'common', '网站公共配置', null, null, '1', '0');
INSERT INTO `shop_config` VALUES ('109', 'bank_num', '123456789012345678', '平台银行卡号', 'common', '网站公共配置', null, null, '1', '0');
INSERT INTO `shop_config` VALUES ('110', 'return_day', '1', '会员购物返现时间（天）', 'member', '会员', null, null, '1', '0');

-- ----------------------------
-- Table structure for `shop_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `shop_coupon`;
CREATE TABLE `shop_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `conpon_prefix` varchar(255) DEFAULT NULL COMMENT '前缀编号',
  `coupon_name` varchar(255) DEFAULT NULL COMMENT '优惠券名称',
  `coupon_type` int(11) DEFAULT NULL COMMENT '1->满减，2->折扣',
  `coupon_limit` decimal(15,2) DEFAULT NULL COMMENT '使用要求金额',
  `coupon_value` decimal(15,2) DEFAULT NULL COMMENT '值',
  `coupon_num` int(11) DEFAULT '0' COMMENT '数量',
  `coupon_surplus_num` int(11) NOT NULL DEFAULT '0' COMMENT '剩余数量',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `term` int(11) DEFAULT NULL COMMENT '期限（天）',
  `generate_time` varchar(255) DEFAULT NULL COMMENT '生成时间',
  `expire_time` varchar(255) DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_coupon
-- ----------------------------
INSERT INTO `shop_coupon` VALUES ('1', 'ceishi', '满100减20', '1', '100.00', '20.00', '100', '98', '购买商品价值达到100元，使用本券可减去20元', '7', '1562911060', '1563515860');
INSERT INTO `shop_coupon` VALUES ('2', 'zhekouceishi', '7折优惠券', '2', '0.00', '7.00', '100', '98', '使用本券可7折购买', '8', '1562911419', '1563602619');

-- ----------------------------
-- Table structure for `shop_evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `shop_evaluate`;
CREATE TABLE `shop_evaluate` (
  `evaluate_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `rate` int(5) DEFAULT NULL COMMENT '1,2,3,4,5星级',
  `content` text COMMENT '评价内容',
  `pj_image` varchar(255) DEFAULT NULL COMMENT '评价图片',
  `pj_state` int(5) DEFAULT NULL COMMENT '1,待评价 2,已评价',
  `generate_time` varchar(255) DEFAULT NULL COMMENT '生成时间',
  `pj_time` varchar(255) DEFAULT NULL COMMENT '评价时间',
  `is_anonymous` int(5) NOT NULL DEFAULT '1' COMMENT '1=>匿名 2=>不匿名',
  PRIMARY KEY (`evaluate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_evaluate
-- ----------------------------
INSERT INTO `shop_evaluate` VALUES ('5', '13', '13', '4', null, null, null, '1', '1562730406', null, '1');
INSERT INTO `shop_evaluate` VALUES ('6', '13', '14', '4', null, null, null, '1', '1562730406', null, '1');
INSERT INTO `shop_evaluate` VALUES ('7', '15', '13', '4', '3', '开发测试 T恤 发表评价内容', 'user/20190711\\9750e1d6e15130cc91487ed93169c5be.jpg', '2', '1562746224', '1562842920', '1');
INSERT INTO `shop_evaluate` VALUES ('8', '16', '14', '4', '5', '商品评价开发测试，评价测试id=8。', 'user/20190710\\10db90faca6b5b3df30b9d1304e7c788.jpg', '2', '1562746777', '1562749666', '2');
INSERT INTO `shop_evaluate` VALUES ('9', '20', '13', '10', null, null, null, '1', '1563003868', null, '1');
INSERT INTO `shop_evaluate` VALUES ('10', '20', '14', '10', null, null, null, '1', '1563003868', null, '1');

-- ----------------------------
-- Table structure for `shop_finance`
-- ----------------------------
DROP TABLE IF EXISTS `shop_finance`;
CREATE TABLE `shop_finance` (
  `finance_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `user_bank_id` int(11) DEFAULT NULL COMMENT '会员银行卡id',
  `type` int(5) DEFAULT NULL COMMENT '1=>充值，2=>提现，3=>购物，4=>退款，5=>返现',
  `price` decimal(20,2) DEFAULT NULL COMMENT '金额',
  `creation_time` varchar(255) DEFAULT NULL COMMENT '生成时间',
  `state` int(5) DEFAULT NULL COMMENT '1=>待审核 2=>已完成 3=>已取消',
  `complete_time` varchar(255) DEFAULT NULL COMMENT '完成时间',
  `voucher` varchar(255) DEFAULT NULL COMMENT '充值截图凭证',
  `reward_id` int(11) DEFAULT NULL COMMENT '返现对应奖励数据id',
  PRIMARY KEY (`finance_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_finance
-- ----------------------------
INSERT INTO `shop_finance` VALUES ('1', '4', '1', '1', '100.00', '1562575933', '2', '1562583073', null, null);
INSERT INTO `shop_finance` VALUES ('2', '4', '1', '1', '100.00', '1562642719', '1', null, 'user/20190709\\7bfca4bf1e1d8a47dcf9ce3290950f02.jpg', null);
INSERT INTO `shop_finance` VALUES ('3', '4', '1', '1', '100.00', '1562650823', '1', null, 'user/20190709\\c73209aa481b009d2280543608776b21.jpg', null);
INSERT INTO `shop_finance` VALUES ('4', '4', '1', '2', '100.00', '1562654289', '3', null, null, null);
INSERT INTO `shop_finance` VALUES ('5', '4', null, '3', '23.00', '1562751708', '2', '1562751708', null, null);
INSERT INTO `shop_finance` VALUES ('6', '4', null, '4', '23.00', '1562751767', '2', '1562751767', null, null);
INSERT INTO `shop_finance` VALUES ('7', '4', null, '3', '23.00', '1562843013', '2', '1562843013', null, null);
INSERT INTO `shop_finance` VALUES ('8', '10', '3', '1', '1000.00', '1562900407', '2', '1562900558', 'user/20190712\\9c317ce38666be46bba98e827470f776.jpg', null);
INSERT INTO `shop_finance` VALUES ('9', '10', null, '3', '71.00', '1562900603', '2', '1562900603', null, null);
INSERT INTO `shop_finance` VALUES ('10', '10', null, '5', '73.00', '1562900603', '2', '1563004379', null, '8');
INSERT INTO `shop_finance` VALUES ('11', '10', null, '3', '23.00', '1563009081', '2', '1563009081', null, null);
INSERT INTO `shop_finance` VALUES ('12', '10', null, '5', '23.00', '1563009081', '1', null, null, '9');
INSERT INTO `shop_finance` VALUES ('13', '4', null, '3', '48.00', '1563023511', '2', '1563023511', null, null);
INSERT INTO `shop_finance` VALUES ('14', '4', null, '5', '50.00', '1563023511', '1', null, null, '10');

-- ----------------------------
-- Table structure for `shop_frontend_images`
-- ----------------------------
DROP TABLE IF EXISTS `shop_frontend_images`;
CREATE TABLE `shop_frontend_images` (
  `frontend_images_id` int(11) NOT NULL AUTO_INCREMENT,
  `frontend_images_image` varchar(255) DEFAULT NULL,
  `frontend_images_weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`frontend_images_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_frontend_images
-- ----------------------------
INSERT INTO `shop_frontend_images` VALUES ('1', 'images/osc1/lunbo/banner-img2.jpg', '0');
INSERT INTO `shop_frontend_images` VALUES ('2', 'images/osc1/lunbo/banner-img3.jpg', '1');
INSERT INTO `shop_frontend_images` VALUES ('4', 'images/osc1/ytuu.jpg', '2');

-- ----------------------------
-- Table structure for `shop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `model` varchar(40) DEFAULT NULL COMMENT '商品型号',
  `sku` varchar(40) DEFAULT NULL COMMENT '库存单元',
  `location` varchar(20) DEFAULT NULL COMMENT '产品所在地',
  `quantity` int(4) NOT NULL DEFAULT '0' COMMENT '商品数目',
  `sale_count` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `stock_status_id` int(11) NOT NULL DEFAULT '0' COMMENT '库存状态编号（关联stock_status主键）',
  `image` varchar(64) DEFAULT NULL,
  `brand_id` int(11) NOT NULL DEFAULT '0' COMMENT '品牌编号（关联brand主键）',
  `shipping` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要运送',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `points` int(8) NOT NULL DEFAULT '0' COMMENT '积分',
  `pay_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换所需积分',
  `is_points_goods` int(5) NOT NULL DEFAULT '0' COMMENT '是否是积分兑换商品',
  `date_available` int(11) NOT NULL DEFAULT '0' COMMENT '供货日期',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '重量',
  `weight_class_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '重量编号（关联weight_class主键）',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` smallint(5) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否扣除库存',
  `minimum` int(11) NOT NULL DEFAULT '1' COMMENT '最小起订数目',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` varchar(40) DEFAULT NULL COMMENT '加入时间',
  `date_modified` varchar(40) DEFAULT NULL COMMENT '修改的时间',
  `viewed` int(5) NOT NULL DEFAULT '0' COMMENT '点击量',
  `popular` int(11) NOT NULL DEFAULT '0' COMMENT '是否热门 1->是 0->不是',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of shop_goods
-- ----------------------------
INSERT INTO `shop_goods` VALUES ('13', '开发测试 T恤', '', '件', '中国广东', '100', '0', '0', 'images/osc1/goods/020023153130.jpg', '0', '0', '23.00', '23', '0', '0', '0', '0.50000000', '2', '110.00000000', '70.00000000', '110.00000000', '1', '1', '1', '1', '1', '2019-07-04 10:51:53', null, '0', '0');
INSERT INTO `shop_goods` VALUES ('14', '开发测试', '开发测试', '件', '中国广东', '2', '0', '0', 'images/osc1/goods/ceshi.jpg', '0', '1', '50.00', '50', '0', '0', '0', '0.50000000', '1', '100.00000000', '100.00000000', '100.00000000', '1', '1', '1', '2', '1', '2019-07-04 13:42:51', null, '0', '0');
INSERT INTO `shop_goods` VALUES ('15', '开发测试15', '', '件', '中国广东广州', '101', '0', '0', 'images/osc1/goods/ceshi.jpg', '0', '1', '123.00', '123', '0', '0', '0', '123.00000000', '2', '200.00000000', '100.00000000', '100.00000000', '1', '1', '1', '3', '1', '2019-07-04 18:30:01', null, '0', '1');
INSERT INTO `shop_goods` VALUES ('16', 'ceshi11', '003', '10', '', '100', '0', '0', 'images/osc1/goods/020023153130.jpg', '0', '1', '100.00', '100', '0', '0', '0', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '100', '0', '1', '2019-07-26 11:49:03', null, '0', '0');

-- ----------------------------
-- Table structure for `shop_goods_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_attribute`;
CREATE TABLE `shop_goods_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `attribute_value_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商品属性(标签)';

-- ----------------------------
-- Records of shop_goods_attribute
-- ----------------------------
INSERT INTO `shop_goods_attribute` VALUES ('3', '13', '1');
INSERT INTO `shop_goods_attribute` VALUES ('4', '13', '2');
INSERT INTO `shop_goods_attribute` VALUES ('5', '13', '3');
INSERT INTO `shop_goods_attribute` VALUES ('6', '13', '4');
INSERT INTO `shop_goods_attribute` VALUES ('7', '13', '5');
INSERT INTO `shop_goods_attribute` VALUES ('8', '13', '6');
INSERT INTO `shop_goods_attribute` VALUES ('9', '13', '7');
INSERT INTO `shop_goods_attribute` VALUES ('12', '14', '1');
INSERT INTO `shop_goods_attribute` VALUES ('13', '14', '2');
INSERT INTO `shop_goods_attribute` VALUES ('19', '15', '1');
INSERT INTO `shop_goods_attribute` VALUES ('20', '15', '2');
INSERT INTO `shop_goods_attribute` VALUES ('21', '15', '3');
INSERT INTO `shop_goods_attribute` VALUES ('22', '15', '4');
INSERT INTO `shop_goods_attribute` VALUES ('23', '15', '5');
INSERT INTO `shop_goods_attribute` VALUES ('24', '16', '2');

-- ----------------------------
-- Table structure for `shop_goods_brand`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_brand`;
CREATE TABLE `shop_goods_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `brand_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品品牌';

-- ----------------------------
-- Records of shop_goods_brand
-- ----------------------------
INSERT INTO `shop_goods_brand` VALUES ('1', '13', '1');
INSERT INTO `shop_goods_brand` VALUES ('2', '14', '1');
INSERT INTO `shop_goods_brand` VALUES ('3', '15', '1');

-- ----------------------------
-- Table structure for `shop_goods_description`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_description`;
CREATE TABLE `shop_goods_description` (
  `goods_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `summary` varchar(255) DEFAULT NULL COMMENT '产品简介',
  `description` text COMMENT '商品详情',
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_description_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='产品信息描述表';

-- ----------------------------
-- Records of shop_goods_description
-- ----------------------------
INSERT INTO `shop_goods_description` VALUES ('13', '13', '开发测试', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.ceishi.com/public/static/image/020023153130.jpg&quot; /&gt;&lt;/p&gt;\r\n', '', '');
INSERT INTO `shop_goods_description` VALUES ('14', '14', '开发测试', '&lt;p&gt;开发测试&lt;/p&gt;\r\n', '', '');
INSERT INTO `shop_goods_description` VALUES ('15', '15', '开发测试15', '&lt;p&gt;&lt;strong&gt;开发测试15&lt;/strong&gt;&lt;/p&gt;\r\n', '', '');
INSERT INTO `shop_goods_description` VALUES ('16', '16', '123', '&lt;p&gt;123&lt;/p&gt;\r\n', '', '');

-- ----------------------------
-- Table structure for `shop_goods_discount`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_discount`;
CREATE TABLE `shop_goods_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(4) NOT NULL DEFAULT '0',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='数量折扣';

-- ----------------------------
-- Records of shop_goods_discount
-- ----------------------------
INSERT INTO `shop_goods_discount` VALUES ('2', '14', '20', '48.00');

-- ----------------------------
-- Table structure for `shop_goods_image`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_image`;
CREATE TABLE `shop_goods_image` (
  `goods_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- ----------------------------
-- Records of shop_goods_image
-- ----------------------------
INSERT INTO `shop_goods_image` VALUES ('54', '13', 'images/osc1/goods/ceshi.jpg', '0');
INSERT INTO `shop_goods_image` VALUES ('55', '13', 'images/osc1/goods/ceshi.jpg', '2');
INSERT INTO `shop_goods_image` VALUES ('56', '13', 'images/osc1/goods/ceshi.jpg', '1');
INSERT INTO `shop_goods_image` VALUES ('57', '14', 'images/osc1/goods/ceshi.jpg', '0');
INSERT INTO `shop_goods_image` VALUES ('58', '15', 'images/osc1/goods/ceshi.jpg', '0');

-- ----------------------------
-- Table structure for `shop_goods_mobile_description_image`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_mobile_description_image`;
CREATE TABLE `shop_goods_mobile_description_image` (
  `mdi_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL COMMENT '原图',
  `description` varchar(255) DEFAULT NULL,
  `sort_order` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mdi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机商品描述图片';

-- ----------------------------
-- Records of shop_goods_mobile_description_image
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_goods_option`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_option`;
CREATE TABLE `shop_goods_option` (
  `goods_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(64) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_option
-- ----------------------------
INSERT INTO `shop_goods_option` VALUES ('1', '4', '2', '款式', 'radio', '1');
INSERT INTO `shop_goods_option` VALUES ('2', '13', '1', '款式', 'radio', '1');

-- ----------------------------
-- Table structure for `shop_goods_option_value`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_option_value`;
CREATE TABLE `shop_goods_option_value` (
  `goods_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_option_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `option_value_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `quantity` int(3) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `price_prefix` varchar(1) DEFAULT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_prefix` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`goods_option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_goods_option_value
-- ----------------------------
INSERT INTO `shop_goods_option_value` VALUES ('1', '1', '4', '2', '3', 'images/osc1/4/2.jpg', '250', '1', '0.00', '+', '0.00000000', '+');
INSERT INTO `shop_goods_option_value` VALUES ('2', '1', '4', '2', '4', 'images/osc1/4/3.jpg', '250', '1', '0.00', '+', '0.00000000', '+');
INSERT INTO `shop_goods_option_value` VALUES ('3', '2', '13', '1', '5', 'images/osc1/goods/020023153130.jpg', '100', '1', '20.00', '+', '0.50000000', '+');

-- ----------------------------
-- Table structure for `shop_goods_to_category`
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_to_category`;
CREATE TABLE `shop_goods_to_category` (
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品对应分类表';

-- ----------------------------
-- Records of shop_goods_to_category
-- ----------------------------
INSERT INTO `shop_goods_to_category` VALUES ('13', '1');
INSERT INTO `shop_goods_to_category` VALUES ('13', '20');
INSERT INTO `shop_goods_to_category` VALUES ('14', '5');
INSERT INTO `shop_goods_to_category` VALUES ('15', '12');
INSERT INTO `shop_goods_to_category` VALUES ('16', '1');

-- ----------------------------
-- Table structure for `shop_length_class`
-- ----------------------------
DROP TABLE IF EXISTS `shop_length_class`;
CREATE TABLE `shop_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `title` varchar(32) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='长度单位';

-- ----------------------------
-- Records of shop_length_class
-- ----------------------------
INSERT INTO `shop_length_class` VALUES ('1', '100.00000000', '厘米', 'cm');
INSERT INTO `shop_length_class` VALUES ('2', '1000.00000000', '毫米', 'mm');
INSERT INTO `shop_length_class` VALUES ('3', '0.01100000', '千米', 'km');

-- ----------------------------
-- Table structure for `shop_member`
-- ----------------------------
DROP TABLE IF EXISTS `shop_member`;
CREATE TABLE `shop_member` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `reg_type` varchar(20) DEFAULT NULL,
  `wechat_openid` varchar(128) DEFAULT NULL,
  `username` char(20) DEFAULT NULL COMMENT '用户名',
  `password` char(128) DEFAULT NULL COMMENT '密码',
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `address_id` int(8) NOT NULL DEFAULT '0',
  `nickname` char(20) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) NOT NULL DEFAULT '0',
  `userpic` varchar(255) DEFAULT NULL COMMENT '会员头像',
  `is_agent` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否是代理商',
  `pid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '上级id',
  `agent_level` mediumint(8) NOT NULL DEFAULT '0' COMMENT '代理级别',
  `total_bonus` decimal(9,3) NOT NULL DEFAULT '0.000' COMMENT '代理商奖金',
  `points` mediumint(8) NOT NULL DEFAULT '0' COMMENT '积分',
  `cash_points` mediumint(8) NOT NULL DEFAULT '0' COMMENT '已经兑换积分',
  `wish` smallint(5) NOT NULL DEFAULT '0' COMMENT '收藏的数量',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `regip` char(15) DEFAULT NULL COMMENT '注册ip',
  `lastip` char(15) DEFAULT NULL COMMENT '上次登录ip',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `email` char(32) DEFAULT NULL COMMENT '电子邮箱',
  `telephone` varchar(20) DEFAULT NULL,
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '地区id',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有短消息',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of shop_member
-- ----------------------------
INSERT INTO `shop_member` VALUES ('1', 'pc', null, '测试', 'MDAwMDAwMDAwMLO6e6+AebiU', '0', '0', null, '0', null, '0', '0', '0', '0.000', '0', '0', '0', '1561702597', '0', null, null, '0', '123@qq.com', '123', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `shop_member_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `shop_member_auth_group`;
CREATE TABLE `shop_member_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `type` varchar(20) DEFAULT NULL,
  `title` char(20) DEFAULT NULL COMMENT '用户组中文名称',
  `description` varchar(80) DEFAULT NULL COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` text COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_member_auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_member_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `shop_member_auth_group_access`;
CREATE TABLE `shop_member_auth_group_access` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_member_auth_group_access
-- ----------------------------
INSERT INTO `shop_member_auth_group_access` VALUES ('1', '0');

-- ----------------------------
-- Table structure for `shop_member_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `shop_member_auth_rule`;
CREATE TABLE `shop_member_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_member_auth_rule
-- ----------------------------
INSERT INTO `shop_member_auth_rule` VALUES ('1', '2', '13', '');
INSERT INTO `shop_member_auth_rule` VALUES ('2', '2', '14', 'member/account/profile');
INSERT INTO `shop_member_auth_rule` VALUES ('3', '2', '15', 'member/account/password');
INSERT INTO `shop_member_auth_rule` VALUES ('4', '2', '19', '');
INSERT INTO `shop_member_auth_rule` VALUES ('5', '2', '20', 'member/account/address');
INSERT INTO `shop_member_auth_rule` VALUES ('6', '2', '21', 'member/order_member/index');
INSERT INTO `shop_member_auth_rule` VALUES ('7', '2', '22', 'member/order_member/show_order');
INSERT INTO `shop_member_auth_rule` VALUES ('8', '2', '23', 'member/order_member/history');
INSERT INTO `shop_member_auth_rule` VALUES ('9', '2', '25', 'member/account/add_address');
INSERT INTO `shop_member_auth_rule` VALUES ('10', '2', '26', 'member/account/edit_address');
INSERT INTO `shop_member_auth_rule` VALUES ('11', '2', '27', 'member/account/del_address');
INSERT INTO `shop_member_auth_rule` VALUES ('12', '2', '28', 'member/order_member/cancel');

-- ----------------------------
-- Table structure for `shop_member_menu`
-- ----------------------------
DROP TABLE IF EXISTS `shop_member_menu`;
CREATE TABLE `shop_member_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `module` varchar(20) DEFAULT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `url` char(255) DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(64) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `type` varchar(40) DEFAULT NULL COMMENT 'nav,auth',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台菜单';

-- ----------------------------
-- Records of shop_member_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_member_wishlist`
-- ----------------------------
DROP TABLE IF EXISTS `shop_member_wishlist`;
CREATE TABLE `shop_member_wishlist` (
  `uid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `date_added` varchar(40) DEFAULT NULL,
  KEY `uid` (`uid`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏的商品';

-- ----------------------------
-- Records of shop_member_wishlist
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_menu`
-- ----------------------------
DROP TABLE IF EXISTS `shop_menu`;
CREATE TABLE `shop_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `module` varchar(20) DEFAULT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(64) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `type` varchar(40) DEFAULT NULL COMMENT 'nav,auth',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 COMMENT='后台菜单';

-- ----------------------------
-- Records of shop_menu
-- ----------------------------
INSERT INTO `shop_menu` VALUES ('1', 'admin', '0', '系统', 'admin/settings/general', 'fa-cog fa-lg', '7', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('2', 'admin', '1', '后台菜单管理', 'admin/menu/index', '', '10', 'nav', '0');
INSERT INTO `shop_menu` VALUES ('19', 'admin', '28', '商品分类', 'admin/category/index', '', '2', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('28', 'admin', '0', '商品', 'admin/goods/index', 'fa-gift fa-lg', '2', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('29', 'admin', '28', '商品管理', 'admin/goods/index', '', '1', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('30', 'admin', '28', '重量单位', 'admin/weight_class/index', '', '5', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('38', 'admin', '1', '基本信息', 'admin/settings/general', '', '1', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('46', 'admin', '1', '配置管理', 'admin/config/index', '', '5', 'nav', '0');
INSERT INTO `shop_menu` VALUES ('57', 'admin', '0', '首页', 'admin/index/index', '', '8', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('66', 'admin', '29', '新增', 'admin/goods/add', '', '1', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('67', 'admin', '29', '复制', 'admin/goods/copy_goods', '', '2', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('68', 'admin', '29', '编辑', 'admin/goods/edit', '', '3', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('69', 'admin', '29', '删除', 'admin/goods/del', '', '4', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('70', 'admin', '19', '新增', 'admin/category/add', '', '1', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('71', 'admin', '19', '编辑', 'admin/category/edit', '', '2', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('72', 'admin', '19', '删除', 'admin/category/del', '', '3', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('73', 'admin', '19', '自动完成', 'admin/category/autocomplete', '', '4', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('75', 'admin', '30', '新增', 'admin/weight_class/add', '', '1', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('76', 'admin', '30', '编辑', 'admin/weight_class/edit', '', '2', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('77', 'admin', '30', '删除', 'admin/weight_class/del', '', '3', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('113', 'admin', '38', '保存配置', 'admin/settings/save', '', '8', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('120', 'admin', '2', '新增', 'admin/menu/add', '', '1', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('121', 'admin', '2', '编辑', 'admin/menu/edit', '', '2', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('122', 'admin', '2', '删除', 'admin/menu/del', '', '3', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('123', 'admin', '2', '获取信息', 'admin/menu/get_info', '', '4', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('125', 'admin', '1', '权限管理', 'admin/auth_manager/index', '', '2', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('126', 'admin', '1', '用户行为', 'admin/user_action/index', 'admin', '3', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('127', 'admin', '1', '系统用户', 'admin/user/index', '', '4', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('129', 'member', '0', '会员', '', 'fa-users fa-lg', '2', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('133', 'member', '129', '支付接口', 'member/payment/index', '', '8', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('134', 'admin', '28', '商品属性', 'admin/attribute/index', '', '4', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('135', 'admin', '28', '长度单位', 'admin/length_class/index', '', '6', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('136', 'admin', '28', '商品品牌', 'admin/brand/index', '', '7', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('137', 'member', '129', '运费模板', 'member/transport/index', '', '7', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('138', 'member', '129', '会员订单', 'member/order_backend/index', '', '3', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('139', 'member', '129', '会员管理', 'member/member_backend/index', '', '1', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('140', 'admin', '29', '设置商品状态', 'admin/goods/set_status', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('141', 'admin', '29', '修改商品价格', 'admin/goods/update_price', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('142', 'admin', '29', '修改商品数量', 'admin/goods/update_quantity', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('143', 'admin', '29', '修改商品排序', 'admin/goods/update_sort', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('144', 'admin', '29', '编辑基本信息', 'admin/goods/edit_general', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('145', 'admin', '29', '编辑关联', 'admin/goods/edit_links', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('146', 'admin', '29', '编辑选项', 'admin/goods/edit_option', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('147', 'admin', '29', '编辑折扣', 'admin/goods/edit_discount', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('148', 'admin', '29', '编辑相册', 'admin/goods/edit_image', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('149', 'admin', '29', '编辑手机端描述', 'admin/goods/edit_mobile', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('151', 'admin', '29', '取得商品属性', 'admin/attribute/autocomplete', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('152', 'admin', '29', '取得商品品牌', 'admin/brand/autocomplete', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('153', 'admin', '19', '更新排序', 'admin/category/update_sort', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('154', 'admin', '134', '取得关联属性', 'admin/attribute/get_attribute_group', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('155', 'admin', '134', '新增属性', 'admin/attribute/add', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('156', 'admin', '134', '编辑属性', 'admin/attribute/edit', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('157', 'admin', '134', '删除属性', 'admin/attribute/del', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('158', 'admin', '134', '自动完成', 'admin/attribute/autocomplete', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('159', 'admin', '135', '新增', 'admin/length_class/add', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('160', 'admin', '135', '编辑', 'admin/length_class/edit', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('161', 'admin', '135', '删除', 'admin/length_class/del', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('162', 'admin', '136', '新增', 'admin/brand/add', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('163', 'admin', '136', '编辑', 'admin/brand/edit', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('164', 'admin', '136', '删除', 'admin/brand/del', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('165', 'admin', '136', '自动完成', 'admin/brand/autocomplete', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('176', 'member', '138', '查看订单', 'member/order_backend/show_order', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('177', 'member', '138', '打印订单', 'member/order_backend/print_order', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('178', 'member', '138', '订单历史', 'member/order_backend/history', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('179', 'member', '138', '更新订单', 'member/order_backend/update_order', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('180', 'member', '138', '更新运费', 'member/order_backend/update_shipping', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('181', 'member', '139', '新增', 'member/member_backend/add', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('182', 'member', '139', '编辑', 'member/member_backend/edit', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('183', 'member', '133', '编辑支付接口', 'member/payment/edit', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('184', 'member', '133', '设置状态', 'member/payment/set_status', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('187', 'admin', '125', '新增用户组', 'admin/auth_manager/create_group', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('188', 'admin', '125', '编辑用户组', 'admin/auth_manager/edit_group', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('189', 'admin', '125', '删除用户组', 'admin/auth_manager/del_group', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('190', 'admin', '125', '查看权限', 'admin/auth_manager/access', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('191', 'admin', '125', '编辑权限', 'admin/auth_manager/write_group', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('192', 'admin', '125', '设置状态', 'admin/auth_manager/set_status', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('193', 'admin', '127', '新增', 'admin/user/add', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('194', 'admin', '127', '编辑', 'admin/user/edit', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('195', 'admin', '127', '删除', 'admin/user/del', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('196', 'admin', '127', '设置状态', 'admin/user/set_status', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('197', 'admin', '46', '新增', 'admin/config/add', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('198', 'admin', '46', '编辑', 'admin/config/edit', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('199', 'admin', '46', '删除', 'admin/config/del', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('200', 'admin', '137', '新增', 'admin/transport/add', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('201', 'admin', '137', '复制', 'admin/transport/clone_data', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('202', 'admin', '137', '编辑', 'admin/transport/edit', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('203', 'admin', '137', '保存', 'admin/transport/save', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('204', 'admin', '137', '删除', 'admin/transport/del', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('205', 'admin', '137', '获取地区', 'admin/transport/getCity', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('206', 'member', '129', '订单状态', 'member/order_status/index', '', '5', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('207', 'member', '206', '新增', 'member/order_status/add', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('208', 'member', '206', '编辑', 'member/order_status/edit', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('209', 'member', '206', '删除', 'member/order_status/del', '', '0', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('210', 'member', '1', '其他配置', 'admin/settings/other', '', '0', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('290', 'admin', '57', '退出系统', 'admin/index/logout', '', '1', 'auth', '1');
INSERT INTO `shop_menu` VALUES ('292', 'member', '129', '充值提现', 'member/finance/index', '', '2', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('293', 'admin', '28', '优惠券管理', 'admin/coupon/index', '', '8', 'nav', '1');
INSERT INTO `shop_menu` VALUES ('294', 'member', '1', '首页轮播图', 'admin/Settings/frontend', '', '10', 'nav', '1');

-- ----------------------------
-- Table structure for `shop_module`
-- ----------------------------
DROP TABLE IF EXISTS `shop_module`;
CREATE TABLE `shop_module` (
  `module` varchar(15) NOT NULL COMMENT '模块',
  `modulename` varchar(20) DEFAULT NULL COMMENT '模块名称',
  `base_module` varchar(64) DEFAULT NULL COMMENT '依赖的模块',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '内置模块',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用',
  `version` varchar(50) DEFAULT NULL COMMENT '版本',
  `author` varchar(40) DEFAULT NULL,
  `setting` mediumtext COMMENT '设置信息',
  `description` varchar(255) DEFAULT NULL COMMENT '模块描述',
  `installtime` varchar(20) DEFAULT NULL COMMENT '安装时间',
  `updatetime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`module`),
  KEY `sign` (`sign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已安装模块列表';

-- ----------------------------
-- Records of shop_module
-- ----------------------------
INSERT INTO `shop_module` VALUES ('index', '电脑端', '无', '', '0', '1', '1', '李梓钿', '', '包含商品分类，商品展示，商品详情', '2016-08-16', '2016-09-20', '0');
INSERT INTO `shop_module` VALUES ('member', '会员系统', '无', '', '0', '1', '1', '李梓钿', '', '包含会员，会员权限，收货地址，区域表，购物车，运费模板，结算，支付接口，订单系统', '2016-08-16', '2016-09-20', '0');
INSERT INTO `shop_module` VALUES ('mobile', '移动端', 'member', null, '0', '0', '1', '李梓钿', null, '手机微信二合一，包含商品展示，会员系统，支付，订单', '2017-09-13', '2017-09-13', '0');
INSERT INTO `shop_module` VALUES ('payment', '支付模块', 'member', '', '0', '1', '1', '李梓钿', '', '支付接口调用，回调处理', '2016-08-16', '2016-09-20', '0');

-- ----------------------------
-- Table structure for `shop_option`
-- ----------------------------
DROP TABLE IF EXISTS `shop_option`;
CREATE TABLE `shop_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `value` text,
  `update_time` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品选项';

-- ----------------------------
-- Records of shop_option
-- ----------------------------
INSERT INTO `shop_option` VALUES ('1', 'radio', '款式', '长袖款,短袖款', '2019-07-04 10:52:45');

-- ----------------------------
-- Table structure for `shop_option_value`
-- ----------------------------
DROP TABLE IF EXISTS `shop_option_value`;
CREATE TABLE `shop_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL DEFAULT '0',
  `value_name` varchar(128) DEFAULT NULL,
  `value_sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='选项值';

-- ----------------------------
-- Records of shop_option_value
-- ----------------------------
INSERT INTO `shop_option_value` VALUES ('5', '1', '长袖款', '1');
INSERT INTO `shop_option_value` VALUES ('6', '1', '短袖款', '2');

-- ----------------------------
-- Table structure for `shop_order`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num_alias` varchar(40) DEFAULT NULL COMMENT '订单编号',
  `pay_subject` varchar(255) DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `return_points` int(11) NOT NULL DEFAULT '0' COMMENT '可得积分',
  `pay_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换需要的积分',
  `points_order` int(11) NOT NULL DEFAULT '0' COMMENT '是否是积分兑换订单',
  `name` varchar(32) DEFAULT NULL COMMENT '购买的会员名字',
  `email` varchar(64) DEFAULT NULL,
  `tel` varchar(64) DEFAULT NULL,
  `shipping_name` varchar(32) DEFAULT NULL COMMENT '收货人姓名',
  `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '收货地址id',
  `shipping_tel` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `shipping_city_id` int(11) NOT NULL DEFAULT '0' COMMENT 'c',
  `shipping_country_id` int(11) NOT NULL DEFAULT '0',
  `shipping_province_id` int(11) NOT NULL DEFAULT '0',
  `shipping_method` varchar(128) DEFAULT NULL COMMENT '货运方式',
  `payment_code` varchar(128) DEFAULT NULL COMMENT '支付方式',
  `comment` text,
  `total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `order_status_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态id',
  `ip` varchar(40) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户系统信息',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `date_modified` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `creation_time` int(11) NOT NULL DEFAULT '0' COMMENT '订单创建时间',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `freight` decimal(15,2) DEFAULT NULL COMMENT '运费',
  `refund_content` varchar(255) DEFAULT NULL COMMENT '退款理由',
  `refund_image` varchar(255) DEFAULT NULL COMMENT '退款图片',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order
-- ----------------------------
INSERT INTO `shop_order` VALUES ('12', '156266539237504', null, '4', '123', '0', '0', '开发测试', null, '13800138000', '开发测试', '9', '13800138000', '289', '3043', '19', null, null, null, '0.00', '5', null, null, '0', '0', '0', '1562665392', '123.00', null, null, null);
INSERT INTO `shop_order` VALUES ('13', '156266558097184', null, '4', '73', '0', '0', '开发测试', null, '13800138000', '开发测试', '9', '13800138000', '289', '3043', '19', null, null, null, '0.00', '6', null, null, '0', '0', '0', '1562665580', '71.00', null, null, null);
INSERT INTO `shop_order` VALUES ('14', '156274072146870', null, '4', '69', '0', '0', '开发测试', null, '13800138000', '开发测试', '9', '13800138000', '289', '3043', '19', null, null, null, '0.00', '5', null, null, '0', '0', '0', '1562740721', '69.00', '0.00', '退款测试内容', 'user/20190710\\cbe1cef35711794b960fd13feb3e75e2.jpg');
INSERT INTO `shop_order` VALUES ('15', '156274519584223', null, '4', '23', '0', '0', '开发测试', null, '13800138000', '开发测试', '9', '13800138000', '289', '3043', '19', null, null, null, '0.00', '6', null, null, '0', '0', '0', '1562745195', '23.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('16', '156274669935249', null, '4', '50', '0', '0', '开发测试', null, '13800138000', '开发测试', '9', '13800138000', '289', '3043', '19', null, null, null, '0.00', '6', null, null, '0', '0', '0', '1562746699', '48.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('17', '156275167594677', null, '4', '23', '0', '0', '开发测试', null, '13800138000', '开发测试', '9', '13800138000', '289', '3043', '19', null, null, null, '0.00', '5', null, null, '0', '0', '0', '1562751675', '23.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('18', '156283007665093', null, '7', '23', '0', '0', '开发测试5', null, '12345678901', '测试2', '8', '12345678910', '136', '1761', '8', null, null, null, '0.00', '3', null, null, '0', '0', '0', '1562830076', '23.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('19', '156284300056936', null, '4', '23', '0', '0', '开发测试', null, '13800138000', '开发测试', '9', '13800138000', '289', '3043', '19', null, null, null, '0.00', '1', null, null, '0', '0', '0', '1562843000', '23.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('20', '156290004937416', null, '10', '73', '0', '0', '开发测试id10', null, '98765432100', '开发测试23', '10', '13321048460', '189', '2249', '12', null, null, null, '0.00', '6', null, null, '0', '0', '0', '1562900049', '71.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('21', '156300905366648', null, '10', '23', '0', '0', '开发测试id10', null, '98765432100', '测试100', '12', '10010010010', '36', '37', '1', null, null, null, '0.00', '1', null, null, '0', '0', '0', '1563009053', '23.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('22', '156301240092328', null, '10', '23', '0', '0', '开发测试id10', null, '98765432100', '测试100', '12', '10010010010', '36', '37', '1', null, null, null, '0.00', '3', null, null, '0', '0', '0', '1563012400', '23.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('23', '156302348710692', null, '4', '50', '0', '0', '开发测试', null, '13800138000', '开发测试', '9', '13800138000', '289', '3043', '19', null, null, null, '0.00', '3', null, null, '0', '0', '0', '1563023487', '48.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('24', '156302350232571', null, '4', '50', '0', '0', '开发测试', null, '13800138000', '开发测试', '9', '13800138000', '289', '3043', '19', null, null, null, '0.00', '1', null, null, '0', '0', '0', '1563023502', '48.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('25', '156318255841110', null, '11', '23', '0', '0', '', null, '13211111111', '测试1', '13', '13211111111', '36', '37', '1', null, null, null, '0.00', '3', null, null, '0', '0', '0', '1563182558', '23.00', '0.00', null, null);
INSERT INTO `shop_order` VALUES ('26', '156760383276456', null, '11', '123', '0', '0', '', null, '13211111111', '测试1', '13', '13211111111', '36', '37', '1', null, null, null, '0.00', '3', null, null, '0', '0', '0', '1567603832', '123.00', '0.00', null, null);

-- ----------------------------
-- Table structure for `shop_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_goods`;
CREATE TABLE `shop_order_goods` (
  `order_goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `name` varchar(255) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `reward` int(8) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `attribute_value_id` varchar(255) DEFAULT NULL COMMENT '商品属性',
  PRIMARY KEY (`order_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_goods
-- ----------------------------
INSERT INTO `shop_order_goods` VALUES ('14', '12', '15', null, null, '0', '0.00', '0.00', '0', '1', '2,5,');
INSERT INTO `shop_order_goods` VALUES ('15', '13', '13', null, null, '0', '100.00', '0.00', '0', '1', '2,4,');
INSERT INTO `shop_order_goods` VALUES ('16', '13', '14', null, null, '0', '0.00', '0.00', '0', '1', '1,');
INSERT INTO `shop_order_goods` VALUES ('17', '14', '13', null, null, '0', '0.00', '0.00', '0', '3', '2,5,');
INSERT INTO `shop_order_goods` VALUES ('18', '15', '13', null, null, '0', '0.00', '0.00', '0', '1', '2,7,');
INSERT INTO `shop_order_goods` VALUES ('19', '16', '14', null, null, '0', '0.00', '0.00', '0', '1', '1,');
INSERT INTO `shop_order_goods` VALUES ('20', '17', '13', null, null, '0', '0.00', '0.00', '0', '1', '2,5,');
INSERT INTO `shop_order_goods` VALUES ('21', '18', '13', null, null, '0', '0.00', '0.00', '0', '1', '1,3,');
INSERT INTO `shop_order_goods` VALUES ('22', '19', '13', null, null, '0', '0.00', '0.00', '0', '1', '2,4,');
INSERT INTO `shop_order_goods` VALUES ('23', '20', '13', null, null, '0', '0.00', '0.00', '0', '1', '2,5,');
INSERT INTO `shop_order_goods` VALUES ('24', '20', '14', null, null, '0', '0.00', '0.00', '0', '1', '2,');
INSERT INTO `shop_order_goods` VALUES ('25', '21', '13', null, null, '0', '0.00', '0.00', '0', '1', '1,3,');
INSERT INTO `shop_order_goods` VALUES ('26', '22', '13', null, null, '0', '0.00', '0.00', '0', '1', '1,3,');
INSERT INTO `shop_order_goods` VALUES ('27', '23', '14', null, null, '0', '0.00', '0.00', '0', '1', '1,');
INSERT INTO `shop_order_goods` VALUES ('28', '24', '14', null, null, '0', '0.00', '0.00', '0', '1', '1,');
INSERT INTO `shop_order_goods` VALUES ('29', '25', '13', null, null, '0', '0.00', '0.00', '0', '1', '1,3,');
INSERT INTO `shop_order_goods` VALUES ('30', '26', '15', null, null, '0', '0.00', '0.00', '0', '1', '1,3,');

-- ----------------------------
-- Table structure for `shop_order_history`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_history`;
CREATE TABLE `shop_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_status_id` int(5) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text,
  `date_added` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_history
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_order_option`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_option`;
CREATE TABLE `shop_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `order_goods_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_option
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_order_status`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_status`;
CREATE TABLE `shop_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='订单状态';

-- ----------------------------
-- Records of shop_order_status
-- ----------------------------
INSERT INTO `shop_order_status` VALUES ('1', '待发货');
INSERT INTO `shop_order_status` VALUES ('3', '待付款');
INSERT INTO `shop_order_status` VALUES ('4', '待收货');
INSERT INTO `shop_order_status` VALUES ('5', '已取消订单');
INSERT INTO `shop_order_status` VALUES ('6', '已完成');
INSERT INTO `shop_order_status` VALUES ('7', '待取消订单');

-- ----------------------------
-- Table structure for `shop_order_total`
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_total`;
CREATE TABLE `shop_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_total
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_points`
-- ----------------------------
DROP TABLE IF EXISTS `shop_points`;
CREATE TABLE `shop_points` (
  `points_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_num_alias` varchar(64) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `description` varchar(64) DEFAULT NULL,
  `prefix` int(5) NOT NULL DEFAULT '0' COMMENT '1增加，2减少',
  `creat_time` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.下单2.管理员操作',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`points_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分记录';

-- ----------------------------
-- Records of shop_points
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_reward`
-- ----------------------------
DROP TABLE IF EXISTS `shop_reward`;
CREATE TABLE `shop_reward` (
  `reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `interest` decimal(15,2) DEFAULT NULL COMMENT '返现积分',
  `generate_time` varchar(255) DEFAULT NULL COMMENT '生成时间',
  `status` int(5) DEFAULT NULL COMMENT '1->有效, 2->无效',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_reward
-- ----------------------------
INSERT INTO `shop_reward` VALUES ('7', '4', '23.00', '1562843013', '2', '19');
INSERT INTO `shop_reward` VALUES ('9', '10', '23.00', '1563009081', '2', '21');
INSERT INTO `shop_reward` VALUES ('10', '4', '50.00', '1563023511', '2', '24');

-- ----------------------------
-- Table structure for `shop_test`
-- ----------------------------
DROP TABLE IF EXISTS `shop_test`;
CREATE TABLE `shop_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` text,
  `create_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调试测试';

-- ----------------------------
-- Records of shop_test
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_transport`
-- ----------------------------
DROP TABLE IF EXISTS `shop_transport`;
CREATE TABLE `shop_transport` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `title` varchar(30) DEFAULT NULL COMMENT '运费模板名称',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='运费模板';

-- ----------------------------
-- Records of shop_transport
-- ----------------------------
INSERT INTO `shop_transport` VALUES ('1', '圆通', '1473319103');

-- ----------------------------
-- Table structure for `shop_transport_extend`
-- ----------------------------
DROP TABLE IF EXISTS `shop_transport_extend`;
CREATE TABLE `shop_transport_extend` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板扩展ID',
  `area_id` text COMMENT '市级地区ID组成的串，以，隔开，两端也有，',
  `top_area_id` text COMMENT '省级地区ID组成的串，以，隔开，两端也有，',
  `area_name` text COMMENT '地区name组成的串，以，隔开',
  `snum` mediumint(8) unsigned DEFAULT '1' COMMENT '首重',
  `sprice` decimal(10,2) DEFAULT '0.00' COMMENT '首重运费',
  `xnum` mediumint(8) unsigned DEFAULT '1' COMMENT '续重',
  `xprice` decimal(10,2) DEFAULT '0.00' COMMENT '续重运费',
  `is_default` enum('1','2') DEFAULT '2' COMMENT '是否默认运费1是2否',
  `transport_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `transport_title` varchar(60) DEFAULT NULL COMMENT '运费模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='运费模板扩展表';

-- ----------------------------
-- Records of shop_transport_extend
-- ----------------------------
INSERT INTO `shop_transport_extend` VALUES ('9', '', '', '全国', '1', '0.01', '1', '0.01', '1', '1', '圆通');
INSERT INTO `shop_transport_extend` VALUES ('10', ',11,180,181,182,183,184,185,179,178,177,175,176,14,212,213,214,215,216,217,218,219,220,221,222,12,186,187,188,189,190,191,202,192,193,194,195,196,197,198,199,200,201,10,162,163,164,165,166,167,168,169,170,171,172,173,174,9,39,15,231,232,233,234,235,236,237,238,239,230,229,228,223,224,225,226,227,5,95,106,96,97,98,99,100,101,102,103,104,105,4,84,85,86,87,88,89,90,91,92,93,94,1,36,3,83,82,81,80,73,74,75,76,77,78,79,2,40,', ',11,14,12,10,9,15,5,4,1,3,2,', '浙江,江西,安徽,江苏,上海,山东,内蒙古,山西,北京,河北,天津', '1', '0.01', '1', '0.01', '2', '1', '圆通');
INSERT INTO `shop_transport_extend` VALUES ('11', ',17,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,16,243,257,256,255,254,244,245,246,247,248,249,250,251,252,253,242,240,241,18,283,284,285,286,287,288,282,281,280,275,276,277,278,279,20,310,311,312,313,314,315,316,317,318,319,320,321,322,323,21,334,335,336,337,338,339,340,341,342,343,333,332,331,324,325,326,327,328,329,330,344,19,294,308,309,307,306,305,295,296,297,298,299,300,301,302,303,304,289,290,291,292,293,13,205,206,207,208,209,210,211,204,203,', ',17,16,18,20,21,19,13,', '湖北,河南,湖南,广西,海南,广东,福建', '1', '0.01', '1', '0.01', '2', '1', '圆通');
INSERT INTO `shop_transport_extend` VALUES ('12', ',30,474,470,471,472,473,31,489,490,491,492,488,477,478,479,480,481,482,483,484,485,486,476,475,487,29,462,463,464,465,466,467,468,469,28,451,452,453,454,455,456,457,458,459,460,450,449,448,461,27,438,439,440,441,442,443,444,445,446,447,24,406,407,408,409,410,411,412,413,414,26,431,432,433,434,435,436,437,25,426,427,428,429,430,425,424,423,415,416,417,418,419,420,421,422,23,399,400,401,402,403,404,405,398,397,386,387,388,389,390,391,392,393,394,395,396,385,22,62,', ',30,31,29,28,27,24,26,25,23,22,', '宁夏,新疆,青海,甘肃,陕西,贵州,西藏,云南,四川,重庆', '1', '0.01', '1', '0.01', '2', '1', '圆通');

-- ----------------------------
-- Table structure for `shop_user`
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(100) DEFAULT '' COMMENT '用户名',
  `user_phone` varchar(100) NOT NULL COMMENT '手机号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `pay_password` varchar(255) DEFAULT '' COMMENT '支付密码',
  `user_retime` varchar(255) NOT NULL COMMENT '注册时间',
  `user_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` varchar(20) DEFAULT '1' COMMENT '1=>激活，2=>冻结',
  `lastip` varchar(255) DEFAULT NULL COMMENT '登录ip地址',
  `invitation_id` int(11) DEFAULT NULL COMMENT '邀请人id',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_user
-- ----------------------------
INSERT INTO `shop_user` VALUES ('4', '开发测试', '13800138000', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '1561365072', 'images/osc1/goods/020023153130.jpg', '1', null, null);
INSERT INTO `shop_user` VALUES ('5', '开发测试2', '12345678910', 'e10adc3949ba59abbe56e057f20f883e', '14e1b600b1fd579f47433b88e8d85291', '1561711457', 'images/osc1/icon/shop.png', '1', null, null);
INSERT INTO `shop_user` VALUES ('6', '开发测试3', '13800001380', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '1561713473', 'images/osc1/portrait/usericon.png', '2', null, null);
INSERT INTO `shop_user` VALUES ('7', '开发测试5', '12345678901', 'e10adc3949ba59abbe56e057f20f883e', '14e1b600b1fd579f47433b88e8d85291', '1562143938', 'images/osc1/portrait/usericon.png', '1', null, null);
INSERT INTO `shop_user` VALUES ('8', '', '10987654321', 'e10adc3949ba59abbe56e057f20f883e', '', '1562836870', null, '1', null, '4');
INSERT INTO `shop_user` VALUES ('10', '开发测试id10', '98765432100', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '1562837392', '', '1', null, '4');
INSERT INTO `shop_user` VALUES ('11', '', '13211111111', '96e79218965eb72c92a549dd5a330112', '', '1563023683', null, '1', null, '0');
INSERT INTO `shop_user` VALUES ('12', '', '13048015563', 'e10adc3949ba59abbe56e057f20f883e', '', '1563368939', null, '1', null, '0');
INSERT INTO `shop_user` VALUES ('13', '', '13222222222', '96e79218965eb72c92a549dd5a330112', '', '1593575941', null, '1', null, '11');

-- ----------------------------
-- Table structure for `shop_user_action`
-- ----------------------------
DROP TABLE IF EXISTS `shop_user_action`;
CREATE TABLE `shop_user_action` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `uname` varchar(40) DEFAULT NULL COMMENT '用户名',
  `type` varchar(40) DEFAULT NULL COMMENT 'frontend,backend',
  `info` varchar(255) DEFAULT NULL COMMENT '行为描述',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '加入时间',
  PRIMARY KEY (`ua_id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 COMMENT='用户行为';

-- ----------------------------
-- Records of shop_user_action
-- ----------------------------
INSERT INTO `shop_user_action` VALUES ('1', '1', 'admin', '后台系统用户', '登录了后台系统', '1561097942');
INSERT INTO `shop_user_action` VALUES ('2', '1', 'admin', '后台系统用户', '登录了后台系统', '1561183807');
INSERT INTO `shop_user_action` VALUES ('3', '1', 'admin', '后台系统用户', '删除了mobile模块', '1561184145');
INSERT INTO `shop_user_action` VALUES ('4', '1', 'admin', '后台系统用户', '登录了后台系统', '1561532632');
INSERT INTO `shop_user_action` VALUES ('5', '1', 'admin', '后台系统用户', '新增了属性', '1561533903');
INSERT INTO `shop_user_action` VALUES ('6', '1', 'admin', '后台系统用户', '登录了后台系统', '1561691827');
INSERT INTO `shop_user_action` VALUES ('7', '1', 'admin', '后台系统用户', '修改了系统配置', '1561691901');
INSERT INTO `shop_user_action` VALUES ('8', '1', 'admin', '后台系统用户', '修改了系统配置', '1561691964');
INSERT INTO `shop_user_action` VALUES ('9', '1', 'admin', '后台系统用户', '退出了系统', '1561692039');
INSERT INTO `shop_user_action` VALUES ('10', '1', 'admin', '后台系统用户', '登录了后台系统', '1561694029');
INSERT INTO `shop_user_action` VALUES ('11', '1', 'admin', '后台系统用户', '更新系统基本配置', '1561694222');
INSERT INTO `shop_user_action` VALUES ('12', '1', 'admin', '后台系统用户', '添加了用户组', '1561694380');
INSERT INTO `shop_user_action` VALUES ('13', '1', 'admin', '后台系统用户', '编辑了用户权限', '1561694422');
INSERT INTO `shop_user_action` VALUES ('14', '1', 'admin', '后台系统用户', '新增了系统用户', '1561700036');
INSERT INTO `shop_user_action` VALUES ('15', '1', 'admin', '后台系统用户', '修改了系统用户状态', '1561700041');
INSERT INTO `shop_user_action` VALUES ('16', '1', 'admin', '后台系统用户', '修改了系统用户状态', '1561700042');
INSERT INTO `shop_user_action` VALUES ('17', '1', 'admin', '后台系统用户', '修改了后台菜单，扩展', '1561700155');
INSERT INTO `shop_user_action` VALUES ('18', '1', 'admin', '后台系统用户', '删除了后台菜单，id=186', '1561700266');
INSERT INTO `shop_user_action` VALUES ('19', '1', 'admin', '后台系统用户', '删除了后台菜单，id=124', '1561700269');
INSERT INTO `shop_user_action` VALUES ('20', '1', 'admin', '后台系统用户', '删除了后台菜单，id=13', '1561700272');
INSERT INTO `shop_user_action` VALUES ('21', '1', 'admin', '后台系统用户', '删除了用户菜单，id=22', '1561702373');
INSERT INTO `shop_user_action` VALUES ('22', '1', 'admin', '后台系统用户', '删除了用户菜单，id=23', '1561702376');
INSERT INTO `shop_user_action` VALUES ('23', '1', 'admin', '后台系统用户', '删除了用户菜单，id=28', '1561702378');
INSERT INTO `shop_user_action` VALUES ('24', '1', 'admin', '后台系统用户', '删除了用户菜单，id=21', '1561702380');
INSERT INTO `shop_user_action` VALUES ('25', '1', 'admin', '后台系统用户', '删除了用户菜单，id=19', '1561702382');
INSERT INTO `shop_user_action` VALUES ('26', '1', 'admin', '后台系统用户', '删除了用户菜单，id=25', '1561702390');
INSERT INTO `shop_user_action` VALUES ('27', '1', 'admin', '后台系统用户', '删除了用户菜单，id=26', '1561702394');
INSERT INTO `shop_user_action` VALUES ('28', '1', 'admin', '后台系统用户', '删除了用户菜单，id=27', '1561702397');
INSERT INTO `shop_user_action` VALUES ('29', '1', 'admin', '后台系统用户', '删除了用户菜单，id=20', '1561702399');
INSERT INTO `shop_user_action` VALUES ('30', '1', 'admin', '后台系统用户', '删除了用户菜单，id=15', '1561702403');
INSERT INTO `shop_user_action` VALUES ('31', '1', 'admin', '后台系统用户', '删除了用户菜单，id=14', '1561702405');
INSERT INTO `shop_user_action` VALUES ('32', '1', 'admin', '后台系统用户', '删除了用户菜单，id=13', '1561702408');
INSERT INTO `shop_user_action` VALUES ('33', '1', 'admin', '后台系统用户', '删除了会员用户组', '1561702432');
INSERT INTO `shop_user_action` VALUES ('34', '1', 'admin', '后台系统用户', '删除了后台菜单，id=168', '1561702457');
INSERT INTO `shop_user_action` VALUES ('35', '1', 'admin', '后台系统用户', '删除了后台菜单，id=166', '1561702460');
INSERT INTO `shop_user_action` VALUES ('36', '1', 'admin', '后台系统用户', '删除了后台菜单，id=169', '1561702462');
INSERT INTO `shop_user_action` VALUES ('37', '1', 'admin', '后台系统用户', '删除了后台菜单，id=167', '1561702467');
INSERT INTO `shop_user_action` VALUES ('38', '1', 'admin', '后台系统用户', '删除了后台菜单，id=130', '1561702469');
INSERT INTO `shop_user_action` VALUES ('39', '1', 'admin', '后台系统用户', '删除了后台菜单，id=170', '1561702473');
INSERT INTO `shop_user_action` VALUES ('40', '1', 'admin', '后台系统用户', '删除了后台菜单，id=171', '1561702475');
INSERT INTO `shop_user_action` VALUES ('41', '1', 'admin', '后台系统用户', '删除了后台菜单，id=172', '1561702477');
INSERT INTO `shop_user_action` VALUES ('42', '1', 'admin', '后台系统用户', '删除了后台菜单，id=173', '1561702480');
INSERT INTO `shop_user_action` VALUES ('43', '1', 'admin', '后台系统用户', '删除了后台菜单，id=174', '1561702482');
INSERT INTO `shop_user_action` VALUES ('44', '1', 'admin', '后台系统用户', '删除了后台菜单，id=175', '1561702484');
INSERT INTO `shop_user_action` VALUES ('45', '1', 'admin', '后台系统用户', '删除了后台菜单，id=131', '1561702487');
INSERT INTO `shop_user_action` VALUES ('46', '1', 'admin', '后台系统用户', '修改了后台菜单，会员管理', '1561702527');
INSERT INTO `shop_user_action` VALUES ('47', '1', 'admin', '后台系统用户', '新增了会员', '1561702597');
INSERT INTO `shop_user_action` VALUES ('48', '1', 'admin', '后台系统用户', '编辑了会员', '1561707104');
INSERT INTO `shop_user_action` VALUES ('49', '1', 'admin', '后台系统用户', '编辑了会员', '1561707136');
INSERT INTO `shop_user_action` VALUES ('50', '1', 'admin', '后台系统用户', '编辑了会员', '1561709261');
INSERT INTO `shop_user_action` VALUES ('51', '1', 'admin', '后台系统用户', '新增了会员', '1561711457');
INSERT INTO `shop_user_action` VALUES ('52', '1', 'admin', '后台系统用户', '编辑了会员', '1561711480');
INSERT INTO `shop_user_action` VALUES ('53', '1', 'admin', '后台系统用户', '新增了会员', '1561713473');
INSERT INTO `shop_user_action` VALUES ('54', '1', 'admin', '后台系统用户', '登录了后台系统', '1562116097');
INSERT INTO `shop_user_action` VALUES ('55', '1', 'admin', '后台系统用户', '添加了会员6的收货地址', '1562133484');
INSERT INTO `shop_user_action` VALUES ('56', '1', 'admin', '后台系统用户', '添加了会员的收货地址', '1562140189');
INSERT INTO `shop_user_action` VALUES ('57', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562140375');
INSERT INTO `shop_user_action` VALUES ('58', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562140420');
INSERT INTO `shop_user_action` VALUES ('59', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562140498');
INSERT INTO `shop_user_action` VALUES ('60', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562140505');
INSERT INTO `shop_user_action` VALUES ('61', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562140522');
INSERT INTO `shop_user_action` VALUES ('62', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562140603');
INSERT INTO `shop_user_action` VALUES ('63', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562140732');
INSERT INTO `shop_user_action` VALUES ('64', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562140898');
INSERT INTO `shop_user_action` VALUES ('65', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562140919');
INSERT INTO `shop_user_action` VALUES ('66', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562141208');
INSERT INTO `shop_user_action` VALUES ('67', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562141368');
INSERT INTO `shop_user_action` VALUES ('68', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562142635');
INSERT INTO `shop_user_action` VALUES ('69', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562142658');
INSERT INTO `shop_user_action` VALUES ('70', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562142710');
INSERT INTO `shop_user_action` VALUES ('71', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562142761');
INSERT INTO `shop_user_action` VALUES ('72', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562142775');
INSERT INTO `shop_user_action` VALUES ('73', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562142862');
INSERT INTO `shop_user_action` VALUES ('74', '1', 'admin', '后台系统用户', '编辑了会员', '1562143679');
INSERT INTO `shop_user_action` VALUES ('75', '1', 'admin', '后台系统用户', '编辑了会员', '1562143729');
INSERT INTO `shop_user_action` VALUES ('76', '1', 'admin', '后台系统用户', '新增了会员', '1562143938');
INSERT INTO `shop_user_action` VALUES ('77', '1', 'admin', '后台系统用户', '清除了缓存', '1562144708');
INSERT INTO `shop_user_action` VALUES ('78', '1', 'admin', '后台系统用户', '编辑了会员', '1562144740');
INSERT INTO `shop_user_action` VALUES ('79', '1', 'admin', '后台系统用户', '编辑了会员', '1562145715');
INSERT INTO `shop_user_action` VALUES ('80', '1', 'admin', '后台系统用户', '添加了会员的收货地址', '1562145868');
INSERT INTO `shop_user_action` VALUES ('81', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562145896');
INSERT INTO `shop_user_action` VALUES ('82', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562145946');
INSERT INTO `shop_user_action` VALUES ('83', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562146098');
INSERT INTO `shop_user_action` VALUES ('84', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562146109');
INSERT INTO `shop_user_action` VALUES ('85', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562146495');
INSERT INTO `shop_user_action` VALUES ('86', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562146581');
INSERT INTO `shop_user_action` VALUES ('87', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562146850');
INSERT INTO `shop_user_action` VALUES ('88', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562146871');
INSERT INTO `shop_user_action` VALUES ('89', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562146917');
INSERT INTO `shop_user_action` VALUES ('90', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562149399');
INSERT INTO `shop_user_action` VALUES ('91', '1', 'admin', '后台系统用户', '修改了会员的收货地址', '1562149427');
INSERT INTO `shop_user_action` VALUES ('92', '1', 'admin', '后台系统用户', '添加了会员的收货地址', '1562149496');
INSERT INTO `shop_user_action` VALUES ('93', '1', 'admin', '后台系统用户', '编辑了会员', '1562149918');
INSERT INTO `shop_user_action` VALUES ('94', '1', 'admin', '后台系统用户', '编辑了会员', '1562149946');
INSERT INTO `shop_user_action` VALUES ('95', '1', 'admin', '后台系统用户', '删除了系统用户', '1562150129');
INSERT INTO `shop_user_action` VALUES ('96', '1', 'admin', '后台系统用户', '新增了系统用户', '1562150362');
INSERT INTO `shop_user_action` VALUES ('97', '1', 'admin', '后台系统用户', '添加了会员的收货地址', '1562150437');
INSERT INTO `shop_user_action` VALUES ('98', '1', 'admin', '后台系统用户', '删除了会员收货地址', '1562150468');
INSERT INTO `shop_user_action` VALUES ('99', '1', 'admin', '后台系统用户', '添加了会员的收货地址', '1562150544');
INSERT INTO `shop_user_action` VALUES ('100', '1', 'admin', '后台系统用户', '添加了会员的收货地址', '1562150640');
INSERT INTO `shop_user_action` VALUES ('101', '1', 'admin', '后台系统用户', '登录了后台系统', '1562202805');
INSERT INTO `shop_user_action` VALUES ('102', '1', 'admin', '后台系统用户', '添加了会员的收货地址', '1562202894');
INSERT INTO `shop_user_action` VALUES ('103', '1', 'admin', '后台系统用户', '修改了会员的钱包资产', '1562206379');
INSERT INTO `shop_user_action` VALUES ('104', '1', 'admin', '后台系统用户', '修改了会员的钱包资产', '1562206405');
INSERT INTO `shop_user_action` VALUES ('105', '1', 'admin', '后台系统用户', '删除了选项', '1562207107');
INSERT INTO `shop_user_action` VALUES ('106', '1', 'admin', '后台系统用户', '新增了商品', '1562208713');
INSERT INTO `shop_user_action` VALUES ('107', '1', 'admin', '后台系统用户', '修改了选项', '1562208765');
INSERT INTO `shop_user_action` VALUES ('108', '1', 'admin', '后台系统用户', '新增了选项', '1562208831');
INSERT INTO `shop_user_action` VALUES ('109', '1', 'admin', '后台系统用户', '删除了选项', '1562208859');
INSERT INTO `shop_user_action` VALUES ('110', '1', 'admin', '后台系统用户', '新增了属性', '1562208924');
INSERT INTO `shop_user_action` VALUES ('111', '1', 'admin', '后台系统用户', '添加了品牌', '1562208959');
INSERT INTO `shop_user_action` VALUES ('112', '1', 'admin', '后台系统用户', '更新商品分类', '1562209024');
INSERT INTO `shop_user_action` VALUES ('113', '1', 'admin', '后台系统用户', '更新商品选项', '1562209115');
INSERT INTO `shop_user_action` VALUES ('114', '1', 'admin', '后台系统用户', '更新商品基本信息', '1562211184');
INSERT INTO `shop_user_action` VALUES ('115', '1', 'admin', '后台系统用户', '新增了商品', '1562218972');
INSERT INTO `shop_user_action` VALUES ('116', '1', 'admin', '后台系统用户', '更新商品13', '1562227145');
INSERT INTO `shop_user_action` VALUES ('117', '1', 'admin', '后台系统用户', '更新商品13', '1562227183');
INSERT INTO `shop_user_action` VALUES ('118', '1', 'admin', '后台系统用户', '更新商品13', '1562227184');
INSERT INTO `shop_user_action` VALUES ('119', '1', 'admin', '后台系统用户', '更新商品14', '1562227233');
INSERT INTO `shop_user_action` VALUES ('120', '1', 'admin', '后台系统用户', '更新商品54', '1562227271');
INSERT INTO `shop_user_action` VALUES ('121', '1', 'admin', '后台系统用户', '更新商品14', '1562227958');
INSERT INTO `shop_user_action` VALUES ('122', '1', 'admin', '后台系统用户', '更新商品14', '1562228110');
INSERT INTO `shop_user_action` VALUES ('123', '1', 'admin', '后台系统用户', '更新商品2', '1562228721');
INSERT INTO `shop_user_action` VALUES ('124', '1', 'admin', '后台系统用户', '更新商品分类', '1562235970');
INSERT INTO `shop_user_action` VALUES ('125', '1', 'admin', '后台系统用户', '新增了商品', '1562236201');
INSERT INTO `shop_user_action` VALUES ('126', '1', 'admin', '后台系统用户', '登录了后台系统', '1562288943');
INSERT INTO `shop_user_action` VALUES ('127', '1', 'admin', '后台系统用户', '更新商品基本信息', '1562290234');
INSERT INTO `shop_user_action` VALUES ('128', '1', 'admin', '后台系统用户', '更新商品数量', '1562290366');
INSERT INTO `shop_user_action` VALUES ('129', '1', 'admin', '后台系统用户', '修改了订单状态', '1562291245');
INSERT INTO `shop_user_action` VALUES ('130', '1', 'admin', '后台系统用户', '修改了订单状态', '1562291285');
INSERT INTO `shop_user_action` VALUES ('131', '1', 'admin', '后台系统用户', '添加了订单状态', '1562291316');
INSERT INTO `shop_user_action` VALUES ('132', '1', 'admin', '后台系统用户', '添加了订单状态', '1562314433');
INSERT INTO `shop_user_action` VALUES ('133', '1', 'admin', '后台系统用户', '登录了后台系统', '1562548060');
INSERT INTO `shop_user_action` VALUES ('134', '1', 'admin', '后台系统用户', '编辑了会员', '1562564794');
INSERT INTO `shop_user_action` VALUES ('135', '1', 'admin', '后台系统用户', '修改了会员的钱包资产', '1562564889');
INSERT INTO `shop_user_action` VALUES ('136', '1', 'admin', '后台系统用户', '添加系统配置', '1562567032');
INSERT INTO `shop_user_action` VALUES ('137', '1', 'admin', '后台系统用户', '添加系统配置', '1562567088');
INSERT INTO `shop_user_action` VALUES ('138', '1', 'admin', '后台系统用户', '添加系统配置', '1562567166');
INSERT INTO `shop_user_action` VALUES ('139', '1', 'admin', '后台系统用户', '添加系统配置', '1562567231');
INSERT INTO `shop_user_action` VALUES ('140', '1', 'admin', '后台系统用户', '添加系统配置', '1562567300');
INSERT INTO `shop_user_action` VALUES ('141', '1', 'admin', '后台系统用户', '更新系统基本配置', '1562569511');
INSERT INTO `shop_user_action` VALUES ('142', '1', 'admin', '后台系统用户', '更新系统基本配置', '1562569525');
INSERT INTO `shop_user_action` VALUES ('143', '1', 'admin', '后台系统用户', '修改了后台菜单，支付接口', '1562570029');
INSERT INTO `shop_user_action` VALUES ('144', '1', 'admin', '后台系统用户', '添加了后台菜单，充值提现', '1562570150');
INSERT INTO `shop_user_action` VALUES ('145', '1', 'admin', '后台系统用户', '删除了后台菜单，id=291', '1562570161');
INSERT INTO `shop_user_action` VALUES ('146', '1', 'admin', '后台系统用户', '添加了后台菜单，充值提现', '1562570189');
INSERT INTO `shop_user_action` VALUES ('147', '1', 'admin', '后台系统用户', '修改了后台菜单，充值提现', '1562570209');
INSERT INTO `shop_user_action` VALUES ('148', '1', 'admin', '后台系统用户', '修改了后台菜单，充值提现', '1562570342');
INSERT INTO `shop_user_action` VALUES ('149', '1', 'admin', '后台系统用户', '清除了缓存', '1562576982');
INSERT INTO `shop_user_action` VALUES ('150', '1', 'admin', '后台系统用户', '审核了会员充值id为1的订单', '1562583073');
INSERT INTO `shop_user_action` VALUES ('151', '1', 'admin', '后台系统用户', '登录了后台系统', '1562634485');
INSERT INTO `shop_user_action` VALUES ('152', '1', 'admin', '后台系统用户', '编辑了会员', '1562644387');
INSERT INTO `shop_user_action` VALUES ('153', '1', 'admin', '后台系统用户', '编辑了会员', '1562644823');
INSERT INTO `shop_user_action` VALUES ('154', '1', 'admin', '后台系统用户', '编辑了会员', '1562644976');
INSERT INTO `shop_user_action` VALUES ('155', '1', 'admin', '后台系统用户', '编辑了会员', '1562650758');
INSERT INTO `shop_user_action` VALUES ('156', '1', 'admin', '后台系统用户', '拒绝了会员提现id为4的订单', '1562654340');
INSERT INTO `shop_user_action` VALUES ('157', '1', 'admin', '后台系统用户', '删除了订单状态', '1562663111');
INSERT INTO `shop_user_action` VALUES ('158', '1', 'admin', '后台系统用户', '删除了订单状态', '1562663114');
INSERT INTO `shop_user_action` VALUES ('159', '1', 'admin', '后台系统用户', '登录了后台系统', '1562721528');
INSERT INTO `shop_user_action` VALUES ('160', '1', 'admin', '后台系统用户', '修改了会员订单13的状态', '1562728956');
INSERT INTO `shop_user_action` VALUES ('161', '1', 'admin', '后台系统用户', '修改了会员订单12的状态', '1562729237');
INSERT INTO `shop_user_action` VALUES ('162', '1', 'admin', '后台系统用户', '修改了会员订单12的状态', '1562729437');
INSERT INTO `shop_user_action` VALUES ('163', '1', 'admin', '后台系统用户', '修改了会员订单13的状态', '1562729684');
INSERT INTO `shop_user_action` VALUES ('164', '1', 'admin', '后台系统用户', '修改了会员订单12的状态', '1562730216');
INSERT INTO `shop_user_action` VALUES ('165', '1', 'admin', '后台系统用户', '修改了会员订单13的状态', '1562730406');
INSERT INTO `shop_user_action` VALUES ('166', '1', 'admin', '后台系统用户', '清除了缓存', '1562731184');
INSERT INTO `shop_user_action` VALUES ('167', '1', 'admin', '后台系统用户', '添加了订单状态', '1562741219');
INSERT INTO `shop_user_action` VALUES ('168', '1', 'admin', '后台系统用户', '修改了订单状态', '1562741228');
INSERT INTO `shop_user_action` VALUES ('169', '1', 'admin', '后台系统用户', '清除了缓存', '1562741233');
INSERT INTO `shop_user_action` VALUES ('170', '1', 'admin', '后台系统用户', '修改了会员订单14的状态', '1562745103');
INSERT INTO `shop_user_action` VALUES ('171', '1', 'admin', '后台系统用户', '修改了会员订单15的状态', '1562745275');
INSERT INTO `shop_user_action` VALUES ('172', '1', 'admin', '后台系统用户', '修改了会员订单16的状态', '1562746761');
INSERT INTO `shop_user_action` VALUES ('173', '1', 'admin', '后台系统用户', '修改了会员订单17的状态', '1562751767');
INSERT INTO `shop_user_action` VALUES ('174', '1', 'admin', '后台系统用户', '登录了后台系统', '1562807236');
INSERT INTO `shop_user_action` VALUES ('175', '1', 'admin', '后台系统用户', '登录了后台系统', '1562894146');
INSERT INTO `shop_user_action` VALUES ('176', '1', 'admin', '后台系统用户', '添加了会员的收货地址', '1562899874');
INSERT INTO `shop_user_action` VALUES ('177', '1', 'admin', '后台系统用户', '编辑了会员', '1562900033');
INSERT INTO `shop_user_action` VALUES ('178', '1', 'admin', '后台系统用户', '审核了会员充值id为8的订单', '1562900558');
INSERT INTO `shop_user_action` VALUES ('179', '1', 'admin', '后台系统用户', '更新系统基本配置', '1562901857');
INSERT INTO `shop_user_action` VALUES ('180', '1', 'admin', '后台系统用户', '添加了后台菜单，优惠券管理', '1562902192');
INSERT INTO `shop_user_action` VALUES ('181', '1', 'admin', '后台系统用户', '删除了后台菜单，id=87', '1562903496');
INSERT INTO `shop_user_action` VALUES ('182', '1', 'admin', '后台系统用户', '删除了后台菜单，id=86', '1562903498');
INSERT INTO `shop_user_action` VALUES ('183', '1', 'admin', '后台系统用户', '删除了后台菜单，id=85', '1562903501');
INSERT INTO `shop_user_action` VALUES ('184', '1', 'admin', '后台系统用户', '删除了后台菜单，id=84', '1562903504');
INSERT INTO `shop_user_action` VALUES ('185', '1', 'admin', '后台系统用户', '删除了后台菜单，id=48', '1562903507');
INSERT INTO `shop_user_action` VALUES ('186', '1', 'admin', '后台系统用户', '新增了优惠券', '1562911060');
INSERT INTO `shop_user_action` VALUES ('187', '1', 'admin', '后台系统用户', '新增了优惠券', '1562911419');
INSERT INTO `shop_user_action` VALUES ('188', '1', 'admin', '后台系统用户', '编辑了优惠券', '1562912612');
INSERT INTO `shop_user_action` VALUES ('189', '1', 'admin', '后台系统用户', '更新商品分类', '1562928252');
INSERT INTO `shop_user_action` VALUES ('190', '1', 'admin', '后台系统用户', '登录了后台系统', '1562928726');
INSERT INTO `shop_user_action` VALUES ('191', '1', 'admin', '后台系统用户', '登录了后台系统', '1562980845');
INSERT INTO `shop_user_action` VALUES ('192', '1', 'admin', '后台系统用户', '添加了品牌', '1562982474');
INSERT INTO `shop_user_action` VALUES ('193', '1', 'admin', '后台系统用户', '添加了品牌', '1562982488');
INSERT INTO `shop_user_action` VALUES ('194', '1', 'admin', '后台系统用户', '添加了品牌', '1562982499');
INSERT INTO `shop_user_action` VALUES ('195', '1', 'admin', '后台系统用户', '添加了品牌', '1562982510');
INSERT INTO `shop_user_action` VALUES ('196', '1', 'admin', '后台系统用户', '添加了品牌', '1562982530');
INSERT INTO `shop_user_action` VALUES ('197', '1', 'admin', '后台系统用户', '添加了品牌', '1562982550');
INSERT INTO `shop_user_action` VALUES ('198', '1', 'admin', '后台系统用户', '添加了品牌', '1562982571');
INSERT INTO `shop_user_action` VALUES ('199', '1', 'admin', '后台系统用户', '更新商品状态', '1562986839');
INSERT INTO `shop_user_action` VALUES ('200', '1', 'admin', '后台系统用户', '更新商品状态', '1562986852');
INSERT INTO `shop_user_action` VALUES ('201', '1', 'admin', '后台系统用户', '更新商品基本信息', '1562987768');
INSERT INTO `shop_user_action` VALUES ('202', '1', 'admin', '后台系统用户', '添加了后台菜单，前台配置', '1562997105');
INSERT INTO `shop_user_action` VALUES ('203', '1', 'admin', '后台系统用户', '添加了前台轮播图', '1563001450');
INSERT INTO `shop_user_action` VALUES ('204', '1', 'admin', '后台系统用户', '添加了前台轮播图', '1563001458');
INSERT INTO `shop_user_action` VALUES ('205', '1', 'admin', '后台系统用户', '更新了前台轮播图1', '1563001821');
INSERT INTO `shop_user_action` VALUES ('206', '1', 'admin', '后台系统用户', '更新了前台轮播图2', '1563001839');
INSERT INTO `shop_user_action` VALUES ('207', '1', 'admin', '后台系统用户', '修改了会员订单20的状态', '1563003773');
INSERT INTO `shop_user_action` VALUES ('208', '1', 'admin', '后台系统用户', '登录了后台系统', '1563020658');
INSERT INTO `shop_user_action` VALUES ('209', '1', 'admin', '后台系统用户', '删除了品牌', '1563020746');
INSERT INTO `shop_user_action` VALUES ('210', '1', 'admin', '后台系统用户', '删除了品牌', '1563020749');
INSERT INTO `shop_user_action` VALUES ('211', '1', 'admin', '后台系统用户', '复制了运费模板', '1563020920');
INSERT INTO `shop_user_action` VALUES ('212', '1', 'admin', '后台系统用户', '删除了运费模板', '1563020924');
INSERT INTO `shop_user_action` VALUES ('213', '1', 'admin', '后台系统用户', '更新系统基本配置', '1563021068');
INSERT INTO `shop_user_action` VALUES ('214', '1', 'admin', '后台系统用户', '修改了用户组状态', '1563021080');
INSERT INTO `shop_user_action` VALUES ('215', '1', 'admin', '后台系统用户', '修改了用户组状态', '1563021081');
INSERT INTO `shop_user_action` VALUES ('216', '1', 'admin', '后台系统用户', '编辑了会员', '1563023060');
INSERT INTO `shop_user_action` VALUES ('217', '1', 'admin', '后台系统用户', '清除了缓存', '1563024527');
INSERT INTO `shop_user_action` VALUES ('218', '1', 'admin', '后台系统用户', '退出了系统', '1563024556');
INSERT INTO `shop_user_action` VALUES ('219', '1', 'admin', '后台系统用户', '登录了后台系统', '1563024871');
INSERT INTO `shop_user_action` VALUES ('220', '1', 'admin', '后台系统用户', '修改了系统用户', '1563025006');
INSERT INTO `shop_user_action` VALUES ('221', '1', 'admin', '后台系统用户', '修改了系统用户', '1563025027');
INSERT INTO `shop_user_action` VALUES ('222', '1', 'admin', '后台系统用户', '退出了系统', '1563025029');
INSERT INTO `shop_user_action` VALUES ('223', '1', 'admin', '后台系统用户', '登录了后台系统', '1563025034');
INSERT INTO `shop_user_action` VALUES ('224', '1', 'admin', '后台系统用户', '修改了系统用户', '1563025059');
INSERT INTO `shop_user_action` VALUES ('225', '1', 'admin', '后台系统用户', '清除了缓存', '1563025119');
INSERT INTO `shop_user_action` VALUES ('226', '1', 'admin', '后台系统用户', '退出了系统', '1563025165');
INSERT INTO `shop_user_action` VALUES ('227', '1', 'admin', '后台系统用户', '登录了后台系统', '1563025192');
INSERT INTO `shop_user_action` VALUES ('228', '1', 'admin', '后台系统用户', '退出了系统', '1563025193');
INSERT INTO `shop_user_action` VALUES ('229', '1', 'admin', '后台系统用户', '登录了后台系统', '1563025385');
INSERT INTO `shop_user_action` VALUES ('230', '1', 'admin', '后台系统用户', '更新系统基本配置', '1563025419');
INSERT INTO `shop_user_action` VALUES ('231', '1', 'admin', '后台系统用户', '退出了系统', '1563025422');
INSERT INTO `shop_user_action` VALUES ('232', '1', 'admin', '后台系统用户', '登录了后台系统', '1563025513');
INSERT INTO `shop_user_action` VALUES ('233', '1', 'admin', '后台系统用户', '登录了后台系统', '1563367793');
INSERT INTO `shop_user_action` VALUES ('234', '1', 'admin', '后台系统用户', '登录了后台系统', '1564111613');
INSERT INTO `shop_user_action` VALUES ('235', '1', 'admin', '后台系统用户', '新增了商品', '1564112943');
INSERT INTO `shop_user_action` VALUES ('236', '1', 'admin', '后台系统用户', '更新商品基本信息', '1564112985');
INSERT INTO `shop_user_action` VALUES ('237', '1', 'admin', '后台系统用户', '登录了后台系统', '1564468958');
INSERT INTO `shop_user_action` VALUES ('238', '1', 'admin', '后台系统用户', '登录了后台系统', '1565003785');
INSERT INTO `shop_user_action` VALUES ('239', '1', 'admin', '后台系统用户', '登录了后台系统', '1567006492');
INSERT INTO `shop_user_action` VALUES ('240', '1', 'admin', '后台系统用户', '新增了商品', '1567006578');
INSERT INTO `shop_user_action` VALUES ('241', '1', 'admin', '后台系统用户', '删除商品', '1567006588');
INSERT INTO `shop_user_action` VALUES ('242', '1', 'admin', '后台系统用户', '登录了后台系统', '1568097054');
INSERT INTO `shop_user_action` VALUES ('243', '1', 'admin', '后台系统用户', '登录了后台系统', '1573184354');
INSERT INTO `shop_user_action` VALUES ('244', '1', 'admin', '后台系统用户', '登录了后台系统', '1573185428');
INSERT INTO `shop_user_action` VALUES ('245', '1', 'admin', '后台系统用户', '登录了后台系统', '1573186075');
INSERT INTO `shop_user_action` VALUES ('246', '1', 'admin', '后台系统用户', '添加了前台轮播图', '1573186133');
INSERT INTO `shop_user_action` VALUES ('247', '1', 'admin', '后台系统用户', '更新了前台轮播图4', '1573186853');
INSERT INTO `shop_user_action` VALUES ('248', '1', 'admin', '后台系统用户', '更新了前台轮播图4', '1573187025');
INSERT INTO `shop_user_action` VALUES ('249', '1', 'admin', '后台系统用户', '更新了前台轮播图4', '1573187057');
INSERT INTO `shop_user_action` VALUES ('250', '1', 'admin', '后台系统用户', '登录了后台系统', '1573876321');
INSERT INTO `shop_user_action` VALUES ('251', '1', 'admin', '后台系统用户', '登录了后台系统', '1589341398');
INSERT INTO `shop_user_action` VALUES ('252', '1', 'admin', '后台系统用户', '登录了后台系统', '1593484792');
INSERT INTO `shop_user_action` VALUES ('253', '1', 'admin', '后台系统用户', '登录了后台系统', '1594008390');
INSERT INTO `shop_user_action` VALUES ('254', '1', 'admin', '后台系统用户', '更新系统基本配置', '1594008434');

-- ----------------------------
-- Table structure for `shop_user_bank`
-- ----------------------------
DROP TABLE IF EXISTS `shop_user_bank`;
CREATE TABLE `shop_user_bank` (
  `user_bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '银行名字',
  `bank_name2` varchar(255) DEFAULT NULL COMMENT '银行支行名字',
  `bank_user` varchar(255) DEFAULT NULL COMMENT '开户人',
  `bank_num` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `default` int(5) DEFAULT NULL COMMENT '0=>不默认，1=>默认',
  PRIMARY KEY (`user_bank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_user_bank
-- ----------------------------
INSERT INTO `shop_user_bank` VALUES ('1', '4', '测试银行', '测试支行', '开发测试', '123456789012345678', '0');
INSERT INTO `shop_user_bank` VALUES ('2', '4', '测试银行2', '测试支行2', '开发测试2', '12345678909875432', '1');
INSERT INTO `shop_user_bank` VALUES ('3', '10', '中国银行', '广东支行', '开发测试id10', '36672348215502186', '1');

-- ----------------------------
-- Table structure for `shop_user_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `shop_user_coupon`;
CREATE TABLE `shop_user_coupon` (
  `user_coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券id',
  `coupon_number` varchar(255) DEFAULT NULL COMMENT '优惠券编号',
  `state` int(11) DEFAULT NULL COMMENT '1=>未使用，2=>已使用，3=>已过期',
  PRIMARY KEY (`user_coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_user_coupon
-- ----------------------------
INSERT INTO `shop_user_coupon` VALUES ('1', '10', '1', 'ceishi', '1');
INSERT INTO `shop_user_coupon` VALUES ('2', '10', '2', 'zhekouceishi', '1');
INSERT INTO `shop_user_coupon` VALUES ('3', '4', '1', 'ceishi108322', '1');
INSERT INTO `shop_user_coupon` VALUES ('4', '4', '2', 'zhekouceishi122741', '1');

-- ----------------------------
-- Table structure for `shop_wallet`
-- ----------------------------
DROP TABLE IF EXISTS `shop_wallet`;
CREATE TABLE `shop_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `principal` decimal(65,2) DEFAULT '0.00' COMMENT '可提现',
  `interest` decimal(65,2) DEFAULT '0.00' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_wallet
-- ----------------------------
INSERT INTO `shop_wallet` VALUES ('1', '4', '183.50', '204.50');
INSERT INTO `shop_wallet` VALUES ('2', '5', '0.00', '0.00');
INSERT INTO `shop_wallet` VALUES ('3', '6', '0.00', '0.00');
INSERT INTO `shop_wallet` VALUES ('4', '7', '0.00', '0.00');
INSERT INTO `shop_wallet` VALUES ('5', '8', '0.00', '0.00');
INSERT INTO `shop_wallet` VALUES ('6', '9', '0.00', '0.00');
INSERT INTO `shop_wallet` VALUES ('7', '10', '979.00', '23.00');
INSERT INTO `shop_wallet` VALUES ('8', '11', '0.00', '0.00');
INSERT INTO `shop_wallet` VALUES ('9', '12', '0.00', '0.00');
INSERT INTO `shop_wallet` VALUES ('10', '13', '0.00', '0.00');

-- ----------------------------
-- Table structure for `shop_weight_class`
-- ----------------------------
DROP TABLE IF EXISTS `shop_weight_class`;
CREATE TABLE `shop_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `title` varchar(32) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`weight_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='重量单位';

-- ----------------------------
-- Records of shop_weight_class
-- ----------------------------
INSERT INTO `shop_weight_class` VALUES ('1', '1.00000000', '千克', 'kg');
INSERT INTO `shop_weight_class` VALUES ('2', '1000.00000000', '克', 'g');
