
-- dwd_trade_cart_add
insert into hudi_dwd.dwd_trade_cart_add
select
    cart.id,
    cart.user_id,
    cart.sku_id,
    cart.dt date_id,
    cart.create_time,
    cart.source_id,
    cart.source_type,
    dic.source_type_name,
    cart.sku_num,
    cart.ts,
    cart.dt
from hudi_ods.ods_cart_info /*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/ cart
join
(
    select
        dic_code,
        dic_name source_type_name
    from hudi_ods.ods_base_dic/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
    where parent_code='24'
)dic
on cart.source_type=dic.dic_code;


-- dwd_trade_order_detail
insert into hudi_dwd.dwd_trade_order_detail
select
    od.id,
    od.order_id,
    oi.user_id,
    od.sku_id,
    oi.province_id,
    od.dt date_id,
    od.create_time,
    od.source_id,
    od.source_type,
    dic.dic_name,
    od.sku_num,
    od.sku_num * od.order_price split_original_amount,
    nvl(od.split_activity_amount,0.0) split_activity_amount,
    nvl(od.split_coupon_amount,0.0) split_coupon_amount,
    od.split_total_amount,
    od.ts,
    od.dt
from hudi_ods.ods_order_detail /*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/ od
join
(
    select
        id,
        user_id,
        province_id
    from hudi_ods.ods_order_info/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
) oi
on od.order_id = oi.id
join
(
    select
        dic_code,
        dic_name
    from hudi_ods.ods_base_dic/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
    where parent_code='24'
)dic
on od.source_type=dic.dic_code;


-- dwd_trade_pay_detail_suc
insert into hudi_dwd.dwd_trade_pay_detail_suc
select
    od.id,
    od.order_id,
    pi.user_id,
    od.sku_id,
    oi.province_id,
    pi.payment_type,
    pay_dic.dic_name,
    date_format(pi.callback_time,'yyyy-MM-dd') date_id,
    pi.callback_time,
    od.source_id,
    od.source_type,
    src_dic.dic_name,
    od.sku_num,
    od.sku_num * od.order_price split_original_amount,
    nvl(od.split_activity_amount,0.0) split_activity_amount,
    nvl(od.split_coupon_amount,0.0) split_coupon_amount,
    od.split_total_amount,
    od.ts,
    od.dt
from hudi_ods.ods_order_detail /*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/ od
join
(
    select
        user_id,
        order_id,
        payment_type,
        callback_time
    from hudi_ods.ods_payment_info/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
    where payment_status='1602'
) pi
on od.order_id=pi.order_id
left join
(
    select
        id,
        province_id
    from hudi_ods.ods_order_info/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
	where order_status='1002'
) oi
on od.order_id = oi.id
left join
(
    select
        dic_code,
        dic_name
    from hudi_ods.ods_base_dic/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
    where parent_code='11'
) pay_dic
on pi.payment_type=pay_dic.dic_code
left join
(
    select
        dic_code,
        dic_name
    from hudi_ods.ods_base_dic/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
    where parent_code='24'
)src_dic
on od.source_type=src_dic.dic_code;


-- dwd_trade_trade_flow_acc
insert into hudi_dwd.dwd_trade_trade_flow_acc
select
    oi.id,
    oi.user_id,
    oi.province_id,
    date_format(oi.create_time,'yyyy-MM-dd'),
    oi.create_time,
    date_format(pi.callback_time,'yyyy-MM-dd'),
    pi.callback_time,
    date_format(log.operate_time,'yyyy-MM-dd'),
    log.operate_time,
    oi.original_total_amount,
    oi.activity_reduce_amount,
    oi.coupon_reduce_amount,
    oi.total_amount,
    nvl(pi.payment_amount,0.0),
    oi.ts,
    oi.dt
from hudi_ods.ods_order_info /*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/ oi
left join
(
    select
        order_id,
        callback_time,
        total_amount payment_amount
    from hudi_ods.ods_payment_info/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
    where payment_status='1602'
)pi
on oi.id=pi.order_id
left join
(
    select
        order_id,
        operate_time
    from hudi_ods.ods_order_status_log/*+ OPTIONS('read.tasks'='1','read.start-commit'='earliest')*/
    where order_status='1004'
)log
on oi.id=log.order_id;




