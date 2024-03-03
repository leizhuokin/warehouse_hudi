create database if not exists hudi_dim;
use hudi_dim;
-- 1、dim_sku 商品维度表
CREATE TABLE dim_sku
(
    `id`                   BIGINT,
    `price`                DECIMAL(10, 0),
    `sku_name`             VARCHAR(200),
    `sku_desc`             VARCHAR(2000),
    `weight`               DECIMAL(10,2),
    `is_sale`              BOOLEAN,
    `spu_id`               BIGINT,
    `spu_name`             VARCHAR(200),
    `category3_id`         BIGINT,
    `category3_name`       VARCHAR(200),
    `category2_id`         BIGINT,
    `category2_name`       VARCHAR(200),
    `category1_id`         BIGINT,
    `category1_name`       VARCHAR(10),
    `tm_id`                BIGINT,
    `tm_name`              VARCHAR(100),
    `sku_attr_values`      MULTISET<string>,
    `sku_sale_attr_values` MULTISET<string>,
    `create_time`          TIMESTAMP(0),
    `ts` timestamp(3),
    `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dim/dim_sku',
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
    'changelog.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_dim',
    'hive_sync.table'='dim_sku');

    
--2、dim_coupon 优惠券维度表
CREATE TABLE dim_coupon
(
    `id`               BIGINT,
    `coupon_name`      VARCHAR(100),
    `coupon_type_code` VARCHAR(10),
    `coupon_type_name` VARCHAR(100),
    `condition_amount` DECIMAL(10, 2),
    `condition_num`    BIGINT,
    `activity_id`      BIGINT,
    `benefit_amount`   DECIMAL(16, 2),
    `benefit_discount` DECIMAL(10, 2),
    `benefit_rule`     STRING,
    `create_time`      TIMESTAMP(0),
    `range_type_code`  VARCHAR(10),
    `range_type_name`  VARCHAR(100),
    `limit_num`        INT,
    `taken_count`      INT,
    `start_time`       TIMESTAMP(0),
    `end_time`         TIMESTAMP(0),
    `operate_time`     TIMESTAMP(0),
    `expire_time`      TIMESTAMP(0),
    `ts` timestamp(3),
    `dt` string
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dim/dim_coupon',
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
    'changelog.enabled' = 'true',
	'read.streaming.skip_compaction' = 'true',
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_dim',
    'hive_sync.table'='dim_coupon');
    
    
--3、dim_activity 活动维度表
CREATE TABLE hudi_dim.dim_activity
(
    `activity_rule_id`   int,
    `activity_id`        bigint,
    `activity_name`      varchar(200),
    `activity_type_code` varchar(20),
    `activity_type_name` varchar(100),
    `activity_desc`      varchar(2000),
    `start_time`         timestamp(0),
    `end_time`           timestamp(0),
    `create_time`        timestamp(0),
    `condition_amount`   DECIMAL(16, 2),
    `condition_num`      BIGINT,
    `benefit_amount`     DECIMAL(16, 2),
    `benefit_discount`   DECIMAL(10, 2),
    `benefit_rule`       STRING,
    `benefit_level`      bigint,
    `ts` timestamp(3),
    `dt` string             
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dim/dim_activity',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'activity_rule_id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_seconds' = '259200',
    'read.streaming.enabled' = 'true',
    'changelog.enabled' = 'true',
	'read.streaming.skip_compaction' = 'true',
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_dim',
    'hive_sync.table'='dim_activity');

    
--4、dim_province 地区维度表 (无分区)
CREATE TABLE hudi_dim.dim_province
(
    `id`            bigint,
    `province_name` varchar(20),
    `area_code`     varchar(20),
    `iso_code`      varchar(20),
    `iso_3166_2`    varchar(20),
    `region_id`     varchar(20),
    `region_name`   varchar(20),
    `ts` timestamp(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dim/dim_province',
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
    'changelog.enabled' = 'true',
	'read.streaming.skip_compaction' = 'true',
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_dim',
    'hive_sync.table'='dim_province');
    
    
-- 5、dim_date 时间维度表
CREATE TABLE hudi_dim.dim_date
(
    `date_id`    STRING,
    `week_id`    STRING,
    `week_day`   STRING,
    `day`        STRING,
    `month`      STRING,
    `quarter`    STRING,
    `year`       STRING,
    `is_workday` STRING,
    `holiday_id` STRING,
    `ts`         TIMESTAMP(3)
) WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dim/dim_date',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'date_id',
    'hoodie.datasource.write.precombine.field' = 'ts', 
    'write.bucket_assign.tasks'='1',
    'write.tasks' = '1', 
    'compaction.tasks' = '1',
    'compaction.async.enabled' = 'true',
    'compaction.schedule.enabled' = 'true',
    'compaction.trigger.strategy' = 'time_elapsed',
    'compaction.delta_commits' = '1',
    'read.streaming.enabled' = 'true',
    'changelog.enabled' = 'true',
    'read.streaming.skip_compaction' = 'true',
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_dim',
    'hive_sync.table'='dim_date');
    
    
-- 6、dim_user_info 用户维度表
CREATE TABLE hudi_dim.dim_user_info
(
  `id` bigint,
  `login_name` varchar(200),
  `nick_name` varchar(200),
  `name` varchar(200),
  `phone_num` varchar(200),
  `email` varchar(200),
  `user_level` varchar(200),
  `birthday` date,
  `gender` varchar(1),
  `create_time` timestamp(0),
  `operate_time` timestamp(0),
  `start_time` timestamp(0),
  `ts` timestamp(3),
  `dt` string             
)
PARTITIONED BY (`dt`)
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dim/dim_user_info',
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
    'changelog.enabled' = 'true',
	'read.streaming.skip_compaction' = 'true',
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_dim',
    'hive_sync.table'='dim_user_info');
