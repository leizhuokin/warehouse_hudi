-- 创建mysql-cdc表，34张
create database if not exists hudi_cdc;
use hudi_cdc;
CREATE TABLE if not exists `activity_info_cdc`  (
  `id` bigint,
  `activity_name` varchar(200),
  `activity_type` varchar(10),
  `activity_desc` varchar(2000),
  `start_time` timestamp(0),
  `end_time` timestamp(0),
  `create_time` timestamp(0),
  PRIMARY KEY(id) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'activity_info');
    
CREATE TABLE if not exists `activity_rule_cdc`  (
  `id` int,
  `activity_id` int,
  `activity_type` varchar(20),
  `condition_amount` decimal(16, 2),
  `condition_num` bigint,
  `benefit_amount` decimal(16, 2),
  `benefit_discount` decimal(10, 2),
  `benefit_level` bigint,
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'activity_rule');
    
    
CREATE TABLE if not exists `activity_sku_cdc`  (
  `id` bigint,
  `activity_id` bigint,
  `sku_id` bigint,
  `create_time` timestamp(0),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'activity_sku');
    
CREATE TABLE if not exists `base_attr_info_cdc`  (
  `id` bigint,
  `attr_name` varchar(100),
  `category_id` bigint,
  `category_level` int,
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'base_attr_info');
    
CREATE TABLE if not exists `base_attr_value_cdc`  (
  `id` bigint,
  `value_name` varchar(100),
  `attr_id` bigint,
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'base_attr_value');
    
CREATE TABLE if not exists `base_category1_cdc`  (
  `id` bigint,
  `name` varchar(10),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'base_category1');
    
CREATE TABLE if not exists `base_category2_cdc`  (
  `id` bigint,
  `name` varchar(200),
  `category1_id` bigint,
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'base_category2');
    
CREATE TABLE if not exists `base_category3_cdc`  (
  `id` bigint,
  `name` varchar(200),
  `category2_id` bigint,
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'base_category3');
    
    
CREATE TABLE if not exists `base_dic_cdc`  (
  `dic_code` varchar(10),
  `dic_name` varchar(100),
  `parent_code` varchar(10),
  `create_time` timestamp(0),
  `operate_time` timestamp(0),
  PRIMARY KEY (`dic_code`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'base_dic');
    
    
CREATE TABLE if not exists `base_province_cdc`  (
  `id` bigint,
  `name` varchar(20),
  `region_id` varchar(20),
  `area_code` varchar(20),
  `iso_code` varchar(20),
  `iso_3166_2` varchar(20),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'base_province');
    
CREATE TABLE if not exists `base_region_cdc`  (
  `id` varchar(20),
  `region_name` varchar(20),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'base_region');
    
    
CREATE TABLE if not exists `base_trademark_cdc`  (
  `id` bigint,
  `tm_name` varchar(100),
  `logo_url` varchar(200),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'base_trademark');
    
    
CREATE TABLE if not exists `cart_info_cdc`  (
  `id` bigint,
  `user_id` varchar(200),
  `sku_id` bigint,
  `cart_price` decimal(10, 2),
  `sku_num` int,
  `img_url` varchar(200),
  `sku_name` varchar(200),
  `is_checked` int,
  `create_time` timestamp(0),
  `operate_time` timestamp(0),
  `is_ordered` bigint,
  `order_time` timestamp(0),
  `source_type` varchar(20),
  `source_id` bigint,
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'cart_info');
    
CREATE TABLE if not exists `comment_info_cdc`  (
  `id` bigint,
  `user_id` bigint,
  `nick_name` varchar(20),
  `head_img` varchar(200),
  `sku_id` bigint,
  `spu_id` bigint,
  `order_id` bigint,
  `appraise` varchar(10),
  `comment_txt` varchar(2000),
  `create_time` timestamp(0),
  `operate_time` timestamp(0),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'comment_info');
    
CREATE TABLE if not exists `coupon_info_cdc`  (
  `id` bigint,
  `coupon_name` varchar(100),
  `coupon_type` varchar(10),
  `condition_amount` decimal(10, 2),
  `condition_num` bigint,
  `activity_id` bigint,
  `benefit_amount` decimal(16, 2),
  `benefit_discount` decimal(10, 2),
  `create_time` timestamp(0),
  `range_type` varchar(10),
  `limit_num` int,
  `taken_count` int,
  `start_time` timestamp(0),
  `end_time` timestamp(0),
  `operate_time` timestamp(0),
  `expire_time` timestamp(0),
  `range_desc` varchar(500),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'coupon_info');
    
CREATE TABLE if not exists `coupon_range_cdc`  (
  `id` bigint,
  `coupon_id` bigint,
  `range_type` varchar(10),
  `range_id` bigint,
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'coupon_range');
    
CREATE TABLE if not exists `coupon_use_cdc`  (
  `id` bigint,
  `coupon_id` bigint,
  `user_id` bigint,
  `order_id` bigint,
  `coupon_status` varchar(10),
  `create_time` timestamp(0),
  `get_time` timestamp(0),
  `using_time` timestamp(0),
  `used_time` timestamp(0),
  `expire_time` timestamp(0),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'coupon_use');
    
CREATE TABLE if not exists `favor_info_cdc`  (
  `id` bigint,
  `user_id` bigint,
  `sku_id` bigint,
  `spu_id` bigint,
  `is_cancel` varchar(1),
  `create_time` timestamp(0),
  `cancel_time` timestamp(0),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'favor_info');
    
    
CREATE TABLE if not exists `order_detail_cdc`  (
  `id` bigint,
  `order_id` bigint,
  `sku_id` bigint,
  `sku_name` varchar(200),
  `img_url` varchar(200),
  `order_price` decimal(10, 2),
  `sku_num` bigint,
  `create_time` timestamp(0),
  `source_type` varchar(20),
  `source_id` bigint,
  `split_total_amount` decimal(16, 2),
  `split_activity_amount` decimal(16, 2),
  `split_coupon_amount` decimal(16, 2),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'order_detail');

CREATE TABLE if not exists `order_detail_activity_cdc`  (
  `id` bigint,
  `order_id` bigint,
  `order_detail_id` bigint,
  `activity_id` bigint,
  `activity_rule_id` bigint,
  `sku_id` bigint,
  `create_time` timestamp(0),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'order_detail_activity');
    
    
CREATE TABLE if not exists `order_detail_coupon_cdc`  (
  `id` bigint,
  `order_id` bigint,
  `order_detail_id` bigint,
  `coupon_id` bigint,
  `coupon_use_id` bigint,
  `sku_id` bigint,
  `create_time` timestamp(0),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'order_detail_coupon');
    

CREATE TABLE if not exists `order_info_cdc`  (
  `id` bigint,
  `consignee` varchar(100),
  `consignee_tel` varchar(20),
  `total_amount` decimal(10, 2),
  `order_status` varchar(20),
  `user_id` bigint,
  `payment_way` varchar(20),
  `delivery_address` varchar(1000),
  `order_comment` varchar(200),
  `out_trade_no` varchar(50),
  `trade_body` varchar(200),
  `create_time` timestamp(0),
  `operate_time` timestamp(0),
  `expire_time` timestamp(0),
  `process_status` varchar(20),
  `tracking_no` varchar(100),
  `parent_order_id` bigint,
  `img_url` varchar(200),
  `province_id` int,
  `activity_reduce_amount` decimal(16, 2),
  `coupon_reduce_amount` decimal(16, 2),
  `original_total_amount` decimal(16, 2),
  `feight_fee` decimal(16, 2),
  `feight_fee_reduce` decimal(16, 2),
  `refundable_time` timestamp(0),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'order_info');
    
    
CREATE TABLE if not exists `order_refund_info_cdc`  (
  `id` bigint,
  `user_id` bigint,
  `order_id` bigint,
  `sku_id` bigint,
  `refund_type` varchar(20),
  `refund_num` bigint,
  `refund_amount` decimal(16, 2),
  `refund_reason_type` varchar(200),
  `refund_reason_txt` varchar(20),
  `refund_status` varchar(10),
  `create_time` timestamp(0),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'order_refund_info');
    
CREATE TABLE if not exists `order_status_log_cdc`  (
  `id` bigint,
  `order_id` bigint,
  `order_status` varchar(11),
  `operate_time` timestamp(0),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'order_status_log');
    
    
CREATE TABLE if not exists `payment_info_cdc`  (
  `id` int,
  `out_trade_no` varchar(50),
  `order_id` bigint,
  `user_id` bigint,
  `payment_type` varchar(20),
  `trade_no` varchar(50),
  `total_amount` decimal(10, 2),
  `subject` varchar(200),
  `payment_status` varchar(20),
  `create_time` timestamp(0),
  `callback_time` timestamp(0),
  `callback_content` string,
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'payment_info');
    
    
CREATE TABLE if not exists `refund_payment_cdc`  (
  `id` int,
  `out_trade_no` varchar(50),
  `order_id` bigint,
  `sku_id` bigint,
  `payment_type` varchar(20),
  `trade_no` varchar(50),
  `total_amount` decimal(10, 2),
  `subject` varchar(200),
  `refund_status` varchar(30),
  `create_time` timestamp(0),
  `callback_time` timestamp(0),
  `callback_content` string,
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'refund_payment');
    
CREATE TABLE if not exists `sku_attr_value_cdc`  (
  `id` bigint,
  `attr_id` bigint,
  `value_id` bigint,
  `sku_id` bigint,
  `attr_name` varchar(30),
  `value_name` varchar(30),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'sku_attr_value');
    
CREATE TABLE if not exists `sku_info_cdc`  (
  `id` bigint,
  `spu_id` bigint,
  `price` decimal(10, 0),
  `sku_name` varchar(200),
  `sku_desc` varchar(2000),
  `weight` decimal(10, 2),
  `tm_id` bigint,
  `category3_id` bigint,
  `sku_default_img` varchar(300),
  `is_sale` boolean,
  `create_time` timestamp(0),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'sku_info');
    
    
CREATE TABLE if not exists `sku_sale_attr_value_cdc`  (
  `id` bigint,
  `sku_id` bigint,
  `spu_id` int,
  `sale_attr_value_id` bigint,
  `sale_attr_id` bigint,
  `sale_attr_name` varchar(30),
  `sale_attr_value_name` varchar(30),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'sku_sale_attr_value');
    
    
CREATE TABLE if not exists `spu_info_cdc`  (
  `id` bigint,
  `spu_name` varchar(200),
  `description` varchar(1000),
  `category3_id` bigint,
  `tm_id` bigint,
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'spu_info');
    
    
CREATE TABLE if not exists `spu_sale_attr_cdc`  (
  `id` bigint,
  `spu_id` bigint,
  `base_sale_attr_id` bigint,
  `sale_attr_name` varchar(20),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'spu_sale_attr');
    
    
CREATE TABLE if not exists `spu_sale_attr_value_cdc`  (
  `id` bigint,
  `spu_id` bigint,
  `base_sale_attr_id` bigint,
  `sale_attr_value_name` varchar(20),
  `sale_attr_name` varchar(20),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'spu_sale_attr_value');
    
    
CREATE TABLE if not exists `user_address_cdc`  (
  `id` bigint,
  `user_id` bigint,
  `province_id` bigint,
  `user_address` varchar(500),
  `consignee` varchar(40),
  `phone_num` varchar(40),
  `is_default` varchar(1),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'user_address');
    
    
CREATE TABLE if not exists `user_info_cdc`  (
  `id` bigint,
  `login_name` varchar(200),
  `nick_name` varchar(200),
  `passwd` varchar(200),
  `name` varchar(200),
  `phone_num` varchar(200),
  `email` varchar(200),
  `head_img` varchar(200),
  `user_level` varchar(200),
  `birthday` date,
  `gender` varchar(1),
  `create_time` timestamp(0),
  `operate_time` timestamp(0),
  `status` varchar(200),
  PRIMARY KEY (`id`) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname' = 'node03',
    'port' = '3306',
    'server-time-zone' = 'Asia/Shanghai',
    'username' = 'root',
    'password' = '123456',
    'database-name' = 'commerce',
    'table-name' = 'user_info');