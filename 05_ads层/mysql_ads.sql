CREATE DATABASE IF NOT EXISTS commerce_report DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
USE commerce_report;



DROP TABLE IF EXISTS `ads_order_stats_by_tm`;
CREATE TABLE `ads_order_stats_by_tm`  (
  `dt` date NOT NULL COMMENT '统计日期',
  `tm_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌ID',
  `tm_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `order_count_1d` bigint(20) NULL DEFAULT NULL COMMENT '最近1天订单数',
  `order_count_7d` bigint(20) NULL DEFAULT NULL COMMENT '最近7天订单数',
  `order_count_30d` bigint(20) NULL DEFAULT NULL COMMENT '最近30天订单数',
  PRIMARY KEY (`dt`,  `tm_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '各品牌商品交易统计' ROW_FORMAT = DYNAMIC;





