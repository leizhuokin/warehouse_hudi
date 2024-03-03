-- kafka source表
CREATE TABLE `kafka_log`.`kafka_topic_log`  (
  `common`   ROW<ar STRING,ba STRING,ch STRING,is_new STRING,md STRING,mid STRING,os STRING,uid STRING,vc STRING>,
  `page`     ROW<during_time STRING,item STRING,item_type STRING,last_page_id STRING,page_id STRING,source_type STRING> ,
  `actions`  ARRAY<ROW<action_id STRING,item STRING,item_type STRING,ts BIGINT>>,
  `displays` ARRAY<ROW<display_type STRING,item STRING,item_type STRING,`order` STRING,pos_id STRING>>,
  `start`    ROW<entry STRING,loading_time BIGINT,open_ad_id BIGINT,open_ad_ms BIGINT,open_ad_skip_ms BIGINT>,
  `err`      ROW<error_code BIGINT,msg STRING>,
  `ts`       BIGINT
) WITH (
    'connector' = 'kafka',
    'topic' = 'dw-mock-log',
    'properties.bootstrap.servers' = 'node01:9092,node02:9092,node03:9092',
    'properties.group.id' = 'hudi_source',
    'scan.startup.mode' = 'latest-offset',
    'format' = 'json',
    'json.fail-on-missing-field'='false',
    'json.ignore-parse-errors' = 'true'
);

-- ods_log 表
CREATE TABLE `hudi_ods`.`ods_log`  (
  `uuid`     STRING,
  `common`   ROW<ar STRING,ba STRING,ch STRING,is_new STRING,md STRING,mid STRING,os STRING,uid STRING,vc STRING>,
  `page`     ROW<during_time STRING,item STRING,item_type STRING,last_page_id STRING,page_id STRING,source_type STRING> ,
  `actions`  ARRAY<ROW<action_id STRING,item STRING,item_type STRING,ts BIGINT>>,
  `displays` ARRAY<ROW<display_type STRING,item STRING,item_type STRING,`order` STRING,pos_id STRING>>,
  `start`    ROW<entry STRING,loading_time BIGINT,open_ad_id BIGINT,open_ad_ms BIGINT,open_ad_skip_ms BIGINT>,
  `err`      ROW<error_code BIGINT,msg STRING>,
  `ts`       BIGINT,
  `dt`       STRING,
  `t` as TO_TIMESTAMP(FROM_UNIXTIME(ts/1000,'yyyy-MM-dd HH:mm:ss')),
  WATERMARK FOR `t` AS `t` - INTERVAL '5' SECOND
) 
PARTITIONED BY (`dt`) 
WITH (
    'connector'='hudi',
    'path' ='hdfs://node01:9000/hudi/warehouse/hudi_ods/ods_log',
    'table.type'='MERGE_ON_READ',
    'hoodie.datasource.write.recordkey.field' = 'uuid',
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
    'hive_sync.enable'='true',
    'hive_sync.mode' = 'hms',
    'hive_sync.metastore.uris' = 'thrift://node01:9083',
    'hive_sync.db'='hive_ods',
    'hive_sync.table'='ods_log' 
);


-- 插入ods_log
INSERT INTO hudi_ods.ods_log
select uuid() as uuid
       ,*
       ,date_format(from_utc_timestamp(ts,'GMT+8'),'yyyy-MM-dd') dt
from `kafka_log`.`kafka_topic_log`;