-- 创建 hdfs source 表
CREATE TABLE kafka_log.date_file_source (
    `date_id`    STRING,
    `week_id`    STRING,
    `week_day`   STRING,
    `day`        STRING,
    `month`      STRING,
    `quarter`    STRING,
    `year`       STRING,
    `is_workday` STRING,
    `holiday_id` STRING
) WITH (
  'connector' = 'filesystem',           
  'path' = 'hdfs://node01:9000/data/date_info.csv', 
  'format' = 'csv'
);

show databases;
show tables;
-- 插入 日期维度表
insert into hudi_dim.dim_date 
select 
    *,
    LOCALTIMESTAMP as ts
from kafka_log.date_file_source