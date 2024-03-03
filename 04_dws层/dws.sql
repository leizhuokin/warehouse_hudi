create database if not exists hudi_dws;
use hudi_dws;
-- dws_trade_user_sku_order_1d 交易域用户商品粒度订单最近1日汇总表
CREATE TABLE hudi_dws.dws_trade_user_sku_order_1d
(
    `user_id`                   BIGINT,
    `sku_id`                    BIGINT,
    `sku_name`                  VARCHAR(200),
    `category1_id`              BIGINT,
    `category1_name`            VARCHAR(10),
    `category2_id`              BIGINT,
    `category2_name`            VARCHAR(200),
    `category3_id`              BIGINT,
    `category3_name`            VARCHAR(200),
    `tm_id`                     BIGINT,
    `tm_name`                   VARCHAR(100),
    `order_count_1d`            BIGINT,
    `order_num_1d`              BIGINT,
    `order_original_amount_1d`  DECIMAL(16, 2),
    `activity_reduce_amount_1d` DECIMAL(16, 2),
    `coupon_reduce_amount_1d`   DECIMAL(16, 2),
    `order_total_amount_1d`     DECIMAL(16, 2),
    `ts`                        TIMESTAMP(3),
    `dt`                        STRING
) 
PARTITIONED BY (`dt`) 
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dws/dws_trade_user_sku_order_1d',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'user_id,sku_id',
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
    'hive_sync.db'='hive_dws',
    'hive_sync.table'='dws_trade_user_sku_order_1d'
);


-- dws_trade_user_order_1d 交易域用户粒度订单最近1日汇总表
CREATE TABLE hudi_dws.dws_trade_user_order_1d
(
    `user_id`                   BIGINT,
    `order_count_1d`            BIGINT,
    `order_num_1d`              BIGINT,
    `order_original_amount_1d`  DECIMAL(16, 2),
    `activity_reduce_amount_1d` DECIMAL(16, 2),
    `coupon_reduce_amount_1d`   DECIMAL(16, 2),
    `order_total_amount_1d`     DECIMAL(16, 2),
    `ts`                        TIMESTAMP(3),
    `dt`                        STRING
) 
PARTITIONED BY (`dt`) 
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dws/dws_trade_user_order_1d',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'user_id',
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
    'hive_sync.db'='hive_dws',
    'hive_sync.table'='dws_trade_user_order_1d'
);


-- dws_trade_user_cart_add_1d 交易域用户粒度加购最近1日汇总表
CREATE TABLE hudi_dws.dws_trade_user_cart_add_1d
(
    `user_id`           VARCHAR(200),
    `cart_add_count_1d` BIGINT,
    `cart_add_num_1d`   BIGINT,
    `ts`                TIMESTAMP(3),
    `dt`                STRING
) 
PARTITIONED BY (`dt`) 
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dws/dws_trade_user_cart_add_1d',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'user_id',
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
    'hive_sync.db'='hive_dws',
    'hive_sync.table'='dws_trade_user_cart_add_1d'
);


-- dws_trade_user_payment_1d 交易域用户粒度支付最近1日汇总表
CREATE TABLE hudi_dws.dws_trade_user_payment_1d
(
    `user_id`           BIGINT,
    `payment_count_1d`  BIGINT,
    `payment_num_1d`    BIGINT,
    `payment_amount_1d` DECIMAL(16, 2),
    `ts`                TIMESTAMP(3),
    `dt`                STRING
) 
PARTITIONED BY (`dt`) 
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dws/dws_trade_user_payment_1d',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'user_id',
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
    'hive_sync.db'='hive_dws',
    'hive_sync.table'='dws_trade_user_payment_1d'
);


-- dws_trade_province_order_1d 交易域省份粒度订单最近1日汇总表
CREATE TABLE hudi_dws.dws_trade_province_order_1d
(
    `province_id`               INT,
    `province_name`             varchar(20),
    `area_code`                 varchar(20),
    `iso_code`                  varchar(20),
    `iso_3166_2`                varchar(20),
    `order_count_1d`            BIGINT,
    `order_original_amount_1d`  DECIMAL(16, 2),
    `activity_reduce_amount_1d` DECIMAL(16, 2),
    `coupon_reduce_amount_1d`   DECIMAL(16, 2),
    `order_total_amount_1d`     DECIMAL(16, 2),
    `ts`                        TIMESTAMP(3),
    `dt`                        STRING
) 
PARTITIONED BY (`dt`) 
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dws/dws_trade_province_order_1d',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'province_id',
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
    'hive_sync.db'='hive_dws',
    'hive_sync.table'='dws_trade_province_order_1d'
);

