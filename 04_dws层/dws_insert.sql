-- 使用flink的sum()函数才可以回撤更新
use modules core,hive;

-- dws_trade_user_sku_order_1d
insert into hudi_dws.dws_trade_user_sku_order_1d
select
    user_id,
    id,
    sku_name,
    category1_id,
    category1_name,
    category2_id,
    category2_name,
    category3_id,
    category3_name,
    tm_id,
    tm_name,
    order_count_1d,
    order_num_1d,
    order_original_amount_1d,
    activity_reduce_amount_1d,
    coupon_reduce_amount_1d,
    order_total_amount_1d,
    LOCALTIMESTAMP as ts,
    dt
from
(
    select
        dt,
        user_id,
        sku_id,
        count(*) order_count_1d,
        sum(sku_num) order_num_1d,
        sum(split_original_amount) order_original_amount_1d,
        sum(nvl(split_activity_amount,0.0)) activity_reduce_amount_1d,
        sum(nvl(split_coupon_amount,0.0)) coupon_reduce_amount_1d,
        sum(split_total_amount) order_total_amount_1d
    from hudi_dwd.dwd_trade_order_detail/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
    where user_id is not null and sku_id is not null
    group by dt,user_id,sku_id
)od
join
(
    select
        id,
        sku_name,
        category1_id,
        category1_name,
        category2_id,
        category2_name,
        category3_id,
        category3_name,
        tm_id,
        tm_name
    from hudi_dim.dim_sku/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
)sku
on od.sku_id=sku.id;


-- dws_trade_user_order_1d
insert into hudi_dws.dws_trade_user_order_1d
select
    user_id,
    count(distinct(order_id)),
    sum(sku_num),
    sum(split_original_amount),
    sum(nvl(split_activity_amount,0)),
    sum(nvl(split_coupon_amount,0)),
    sum(split_total_amount),
    LOCALTIMESTAMP as ts,
    dt
from hudi_dwd.dwd_trade_order_detail/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
where user_id is not null 
group by user_id,dt;


-- dws_trade_user_cart_add_1d
insert into hudi_dws.dws_trade_user_cart_add_1d
select
    user_id,
    count(*),
    sum(sku_num),
    LOCALTIMESTAMP as ts,
    dt
from hudi_dwd.dwd_trade_cart_add/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
group by user_id,dt;


-- dws_trade_user_payment_1d
insert into hudi_dws.dws_trade_user_payment_1d
select
    user_id,
    count(distinct(order_id)),
    sum(sku_num),
    sum(split_payment_amount),
    LOCALTIMESTAMP as ts,
    dt
from hudi_dwd.dwd_trade_pay_detail_suc/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
group by user_id,dt;


-- dws_trade_province_order_1d
insert into hudi_dws.dws_trade_province_order_1d
select
    province_id,
    province_name,
    area_code,
    iso_code,
    iso_3166_2,
    order_count_1d,
    order_original_amount_1d,
    activity_reduce_amount_1d,
    coupon_reduce_amount_1d,
    order_total_amount_1d,
    LOCALTIMESTAMP as ts,
    dt
from
(
    select
        province_id,
        count(distinct(order_id)) order_count_1d,
        sum(split_original_amount) order_original_amount_1d,
        sum(nvl(split_activity_amount,0)) activity_reduce_amount_1d,
        sum(nvl(split_coupon_amount,0)) coupon_reduce_amount_1d,
        sum(split_total_amount) order_total_amount_1d,
        dt
    from hudi_dwd.dwd_trade_order_detail/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
	group by province_id,dt 
)o
join
(
    select
        id,
        province_name,
        area_code,
        iso_code,
        iso_3166_2
    from hudi_dim.dim_province/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
)p
on o.province_id=p.id;



