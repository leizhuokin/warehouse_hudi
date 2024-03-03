create database hudi_ods;
-- 1、ods_activity_info 活动信息表
CREATE TABLE `hudi_ods`.`ods_activity_info`  (
  `id` bigint,
  `activity_name` varchar(200),
  `activity_type` varchar(10),
  `activity_desc` varchar(2000),
  `start_time` timestamp(0),
  `end_time` timestamp(0),
  `create_time` timestamp(0),
  `ts` timestamp(3),
  `dt` string
) 
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_activity_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_activity_info');
    

-- 2、ods_activity_rule 活动规则表(无分区)
CREATE TABLE `hudi_ods`.`ods_activity_rule`  (
  `id` int,
  `activity_id` int,
  `activity_type` varchar(20),
  `condition_amount` decimal(16, 2),
  `condition_num` bigint,
  `benefit_amount` decimal(16, 2),
  `benefit_discount` decimal(10, 2),
  `benefit_level` bigint,
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_activity_rule',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_activity_rule');
    
    

-- 3、ods_base_category1  一级品类表（无分区）
CREATE TABLE `hudi_ods`.`ods_base_category1`  (
  `id` bigint,
  `name` varchar(10),
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_base_category1',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_base_category1');
    
    
-- 4、ods_base_category2  二级品类表（无分区）
CREATE TABLE `hudi_ods`.`ods_base_category2`  (
  `id` bigint,
  `name` varchar(200),
  `category1_id` bigint,
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_base_category2',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_base_category2');
    
    
-- 5、ods_base_category3 三级品类表（无分区）
CREATE TABLE `hudi_ods`.`ods_base_category3`  (
  `id` bigint,
  `name` varchar(200),
  `category2_id` bigint,
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_base_category3',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_base_category3');
    
    
-- 6、ods_base_dic 编码字典表（无分区）
CREATE TABLE `hudi_ods`.`ods_base_dic`  (
  `dic_code` varchar(10),
  `dic_name` varchar(100),
  `parent_code` varchar(10),
  `create_time` timestamp(0),
  `operate_time` timestamp(0),
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_base_dic',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'dic_code',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_base_dic');
    

-- 7、ods_base_province 省份表（无分区）    
CREATE TABLE `hudi_ods`.`ods_base_province`  (
  `id` bigint,
  `name` varchar(20),
  `region_id` varchar(20),
  `area_code` varchar(20),
  `iso_code` varchar(20),
  `iso_3166_2` varchar(20),
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_base_province',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_base_province');
    
    
-- 8、ods_base_region 地区表（无分区）    
CREATE TABLE `hudi_ods`.`ods_base_region`  (
  `id` varchar(20),
  `region_name` varchar(20),
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_base_region',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_base_region');
    
  
-- 9、ods_base_trademark  品牌表（无分区）    
CREATE TABLE `hudi_ods`.`ods_base_trademark`  (
  `id` bigint,
  `tm_name` varchar(100),
  `logo_url` varchar(200),
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_base_trademark',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_base_trademark');
    
    
-- 10、ods_cart_info 购物车表
CREATE TABLE `hudi_ods`.`ods_cart_info`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_cart_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_cart_info');
    
    
-- 11、ods_comment_info 评论表
CREATE TABLE `hudi_ods`.`ods_comment_info`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_comment_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_comment_info');
    
    
-- 12、ods_coupon_info 优惠券信息表
CREATE TABLE `hudi_ods`.`ods_coupon_info`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_coupon_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_coupon_info');
    
    
   
-- 13、ods_coupon_use 优惠券领用表
CREATE TABLE `hudi_ods`.`ods_coupon_use`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_coupon_use',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_coupon_use');
    
    
-- 14、ods_favor_info 收藏表
CREATE TABLE `hudi_ods`.`ods_favor_info`  (
  `id` bigint,
  `user_id` bigint,
  `sku_id` bigint,
  `spu_id` bigint,
  `is_cancel` varchar(1),
  `create_time` timestamp(0),
  `cancel_time` timestamp(0),
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_favor_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_favor_info');
    
    
-- 15、ods_order_detail 订单明细表
CREATE TABLE `hudi_ods`.`ods_order_detail`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_order_detail',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_order_detail');
    
    
-- 16、ods_order_detail_activity 订单明细活动关联表
CREATE TABLE `hudi_ods`.`ods_order_detail_activity`  (
  `id` bigint,
  `order_id` bigint,
  `order_detail_id` bigint,
  `activity_id` bigint,
  `activity_rule_id` bigint,
  `sku_id` bigint,
  `create_time` timestamp(0),
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_order_detail_activity',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_order_detail_activity');
    
    
-- 17、ods_order_detail_coupon 订单明细优惠券关联表
CREATE TABLE `hudi_ods`.`ods_order_detail_coupon`  (
  `id` bigint,
  `order_id` bigint,
  `order_detail_id` bigint,
  `coupon_id` bigint,
  `coupon_use_id` bigint,
  `sku_id` bigint,
  `create_time` timestamp(0),
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_order_detail_coupon',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_order_detail_coupon');
    

-- 18、ods_order_info 订单表
CREATE TABLE `hudi_ods`.`ods_order_info`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_order_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_order_info');
    
    
-- 19、ods_order_refund_info 退单表
CREATE TABLE `hudi_ods`.`ods_order_refund_info`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_order_refund_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_order_refund_info');
    
    
-- 20、ods_order_status_log 订单状态流水表
CREATE TABLE `hudi_ods`.`ods_order_status_log`  (
  `id` bigint,
  `order_id` bigint,
  `order_status` varchar(11),
  `operate_time` timestamp(0),
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_order_status_log',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_order_status_log');
    
    
-- 21、ods_payment_info 支付表
CREATE TABLE `hudi_ods`.`ods_payment_info`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_payment_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_payment_info');
    
   
-- 22、ods_refund_payment 退款表
CREATE TABLE `hudi_ods`.`ods_refund_payment`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_refund_payment',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_refund_payment');
    
    
-- 23、ods_sku_attr_value 商品平台属性表（无分区）
CREATE TABLE `hudi_ods`.`ods_sku_attr_value`  (
  `id` bigint,
  `attr_id` bigint,
  `value_id` bigint,
  `sku_id` bigint,
  `attr_name` varchar(30),
  `value_name` varchar(30),
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_sku_attr_value',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_sku_attr_value');
    
    
-- 24、ods_sku_info 商品表
CREATE TABLE `hudi_ods`.`ods_sku_info`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_sku_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_sku_info');
    
    
-- 25、ods_sku_sale_attr_value 商品销售属性值表（无分区）
CREATE TABLE `hudi_ods`.`ods_sku_sale_attr_value`  (
  `id` bigint,
  `sku_id` bigint,
  `spu_id` int,
  `sale_attr_value_id` bigint,
  `sale_attr_id` bigint,
  `sale_attr_name` varchar(30),
  `sale_attr_value_name` varchar(30),
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_sku_sale_attr_value',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_sku_sale_attr_value');
    
    
-- 26、ods_spu_info SPU表（无分区）
CREATE TABLE `hudi_ods`.`ods_spu_info`  (
  `id` bigint,
  `spu_name` varchar(200),
  `description` varchar(1000),
  `category3_id` bigint,
  `tm_id` bigint,
  `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_spu_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_spu_info');

  
-- 27、ods_user_info 用户表
CREATE TABLE `hudi_ods`.`ods_user_info`  (
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
  `ts` timestamp(3),
  `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_user_info',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'changelog.enabled' = 'true',    
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_user_info');
    
    