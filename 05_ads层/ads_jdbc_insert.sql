-- 使用flink的sum()函数才可以回撤更新
use modules core,hive;

-- ads_order_stats_by_tm
insert into hudi_ads.ads_order_stats_by_tm
select  cast(current_date as string) dt,
    tm_id,
    tm_name,
    sum(if(datediff(current_date,dt)=0,1,0)) order_count_1d,
    sum(if(datediff(current_date,dt)<7,1,0)) order_count_7d,
    sum(if(datediff(current_date,dt)<30,1,0)) order_count_30d
from hudi_dws.dws_trade_user_sku_order_1d uso
where tm_id is not null and tm_name is not null
group by tm_id,tm_name






