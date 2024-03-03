
-- ads_order_stats_by_tm 商品主题：各品牌商品下单
CREATE TABLE hudi_ads.ads_order_stats_by_tm
(
    `dt`                      STRING,
    `tm_id`                   BIGINT,
    `tm_name`                 VARCHAR(100),
    `order_count_1d`             BIGINT,
    `order_count_7d`             BIGINT,
    `order_count_30d`             BIGINT,
    PRIMARY KEY (`dt`, `tm_id`) NOT ENFORCED
) WITH (
    'connector'='jdbc',
    'url' = 'jdbc:mysql://node03:3306/commerce_report?useUnicode=true&characterEncoding=UTF-8',
    'username' = 'root',
    'password' = '123456',
    'connection.max-retry-timeout' = '60s',
    'table-name' = 'ads_order_stats_by_tm',
    'sink.buffer-flush.max-rows' = '500',
    'sink.buffer-flush.interval' = '5s',
    'sink.max-retries' = '3',
    'sink.parallelism' = '1'
);  




