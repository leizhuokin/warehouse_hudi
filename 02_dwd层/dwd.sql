create database if not exists hudi_dwd;
use hudi_dwd;
-- dwd_trade_cart_add 交易域加购事务事实表
CREATE TABLE hudi_dwd.dwd_trade_cart_add
(
    `id`               BIGINT,
    `user_id`          VARCHAR(200),
    `sku_id`           BIGINT,
    `date_id`          STRING,
    `create_time`      TIMESTAMP(0),
    `source_id`        BIGINT,
    `source_type_code` VARCHAR(20),
    `source_type_name` varchar(100),
    `sku_num`          INT,
    `ts`               TIMESTAMP(3),
    `dt`               STRING
) 
PARTITIONED BY (`dt`) 
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dwd/dwd_trade_cart_add',
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
    'hive_sync.db'='hive_dwd',
    'hive_sync.table'='dwd_trade_cart_add'
);


-- dwd_trade_order_detail 交易域下单事务事实表
CREATE TABLE hudi_dwd.dwd_trade_order_detail
(
    `id`                    BIGINT,
    `order_id`              BIGINT,
    `user_id`               BIGINT,
    `sku_id`                BIGINT,
    `province_id`           INT,
    `date_id`               STRING,
    `create_time`           TIMESTAMP(0),
    `source_id`             BIGINT,
    `source_type_code`      VARCHAR(20),
    `source_type_name`      VARCHAR(100),
    `sku_num`               BIGINT,
    `split_original_amount` DECIMAL(16, 2),
    `split_activity_amount` DECIMAL(16, 2),
    `split_coupon_amount`   DECIMAL(16, 2),
    `split_total_amount`    DECIMAL(16, 2),
    `ts`                    TIMESTAMP(3),
    `dt`                    STRING
) 
PARTITIONED BY (`dt`) 
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dwd/dwd_trade_order_detail',
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
    'hive_sync.db'='hive_dwd',
    'hive_sync.table'='dwd_trade_order_detail'
);


-- dwd_trade_pay_detail_suc 交易域支付成功事务事实表
CREATE TABLE hudi_dwd.dwd_trade_pay_detail_suc
(
    `id`                    BIGINT,
    `order_id`              BIGINT,
    `user_id`               BIGINT,
    `sku_id`                BIGINT,
    `province_id`           INT,
    `payment_type_code`     VARCHAR(20),
    `payment_type_name`     VARCHAR(100),
    `date_id`               STRING,
    `callback_time`         TIMESTAMP(0),
    `source_id`             BIGINT,
    `source_type_code`      VARCHAR(20),
    `source_type_name`      VARCHAR(100),
    `sku_num`               BIGINT,
    `split_original_amount` DECIMAL(16, 2),
    `split_activity_amount` DECIMAL(16, 2),
    `split_coupon_amount`   DECIMAL(16, 2),
    `split_payment_amount`  DECIMAL(16, 2),
    `ts`                    TIMESTAMP(3),
    `dt`                    STRING
) 
PARTITIONED BY (`dt`) 
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dwd/dwd_trade_pay_detail_suc',
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
    'hive_sync.db'='hive_dwd',
    'hive_sync.table'='dwd_trade_pay_detail_suc'
);


-- dwd_trade_trade_flow_acc 交易域交易流程累积快照事实表
CREATE TABLE hudi_dwd.dwd_trade_trade_flow_acc
(
    `order_id`              BIGINT,
    `user_id`               BIGINT,
    `province_id`           INT,
    `order_date_id`         STRING,
    `order_time`            TIMESTAMP(0),
    `payment_date_id`       STRING,
    `payment_time`          TIMESTAMP(0),
    `finish_date_id`        STRING,
    `finish_time`           TIMESTAMP(0),
    `order_original_amount` DECIMAL(16, 2),
    `order_activity_amount` DECIMAL(16, 2),
    `order_coupon_amount`   DECIMAL(16, 2),
    `order_total_amount`    DECIMAL(10, 2),
    `payment_amount`        DECIMAL(10, 2),
    `ts`                    TIMESTAMP(3),
    `dt`                    STRING
) 
PARTITIONED BY (`dt`) 
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_dwd/dwd_trade_trade_flow_acc',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'order_id',
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
    'hive_sync.db'='hive_dwd',
    'hive_sync.table'='dwd_trade_trade_flow_acc'
);    

