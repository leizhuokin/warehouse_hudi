-- ods_activity_info 插入数据
INSERT INTO hudi_ods.ods_activity_info
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(start_time,'yyyy-MM-dd') as dt
from hudi_cdc.activity_info_cdc;
-- select * from hudi_ods.ods_activity_info;


-- ods_activity_rule 插入数据
INSERT INTO hudi_ods.ods_activity_rule
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.activity_rule_cdc;
-- select * from hudi_ods.ods_activity_rule;


-- ods_base_category1 插入数据
INSERT INTO hudi_ods.ods_base_category1
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.base_category1_cdc;
-- select * from hudi_ods.ods_base_category1;


-- ods_base_category2 插入数据
INSERT INTO hudi_ods.ods_base_category2
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.base_category2_cdc;
-- select * from hudi_ods.ods_base_category2;


-- ods_base_category3 插入数据
INSERT INTO hudi_ods.ods_base_category3
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.base_category3_cdc;
-- select * from hudi_ods.ods_base_category3;


-- ods_base_dic 插入数据
INSERT INTO hudi_ods.ods_base_dic
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.base_dic_cdc;
-- select * from hudi_ods.ods_base_dic;


-- ods_base_province 插入数据
INSERT INTO hudi_ods.ods_base_province
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.base_province_cdc;
-- select * from hudi_ods.ods_base_province;


-- ods_base_region 插入数据
INSERT INTO hudi_ods.ods_base_region
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.base_region_cdc;
-- select * from hudi_ods.ods_base_region;


-- ods_base_trademark 插入数据
INSERT INTO hudi_ods.ods_base_trademark
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.base_trademark_cdc;
-- select * from hudi_ods.ods_base_trademark;


-- ods_cart_info 插入数据
INSERT INTO hudi_ods.ods_cart_info
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.cart_info_cdc;
-- select * from hudi_ods.ods_cart_info;


-- ods_comment_info 插入数据
INSERT INTO hudi_ods.ods_comment_info
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.comment_info_cdc;
-- select * from hudi_ods.ods_comment_info;


-- ods_coupon_info 插入数据
INSERT INTO hudi_ods.ods_coupon_info
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.coupon_info_cdc;
-- select * from hudi_ods.ods_coupon_info;


-- ods_coupon_use 插入数据
INSERT INTO hudi_ods.ods_coupon_use
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(get_time,'yyyy-MM-dd') as dt
from hudi_cdc.coupon_use_cdc;
-- select * from hudi_ods.ods_coupon_use;


-- ods_favor_info 插入数据
INSERT INTO hudi_ods.ods_favor_info
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.favor_info_cdc;
-- select * from hudi_ods.ods_favor_info;


-- ods_order_detail 插入数据
INSERT INTO hudi_ods.ods_order_detail
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.order_detail_cdc;
-- select * from hudi_ods.ods_order_detail;


-- ods_order_detail_activity 插入数据
INSERT INTO hudi_ods.ods_order_detail_activity
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.order_detail_activity_cdc;
-- select * from hudi_ods.ods_order_detail_activity;


-- ods_order_detail_coupon 插入数据
INSERT INTO hudi_ods.ods_order_detail_coupon
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.order_detail_coupon_cdc;
-- select * from hudi_ods.ods_order_detail_coupon;


-- ods_order_info 插入数据
INSERT INTO hudi_ods.ods_order_info
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.order_info_cdc;
-- select * from hudi_ods.ods_order_info;


-- ods_order_refund_info 插入数据
INSERT INTO hudi_ods.ods_order_refund_info
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.order_refund_info_cdc;
-- select * from hudi_ods.ods_order_refund_info;


-- ods_order_status_log 插入数据
INSERT INTO hudi_ods.ods_order_status_log
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(operate_time,'yyyy-MM-dd') as dt
from hudi_cdc.order_status_log_cdc;
-- select * from hudi_ods.ods_order_status_log;


-- ods_payment_info 插入数据
INSERT INTO hudi_ods.ods_payment_info
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.payment_info_cdc;
-- select * from hudi_ods.ods_payment_info;


-- ods_refund_payment 插入数据
INSERT INTO hudi_ods.ods_refund_payment
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(callback_time,'yyyy-MM-dd') as dt
from hudi_cdc.refund_payment_cdc;
-- select * from hudi_ods.ods_refund_payment;


-- ods_sku_attr_value 插入数据
INSERT INTO hudi_ods.ods_sku_attr_value
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.sku_attr_value_cdc;
-- select * from hudi_ods.ods_sku_attr_value;


-- ods_sku_info 插入数据
INSERT INTO hudi_ods.ods_sku_info
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.sku_info_cdc;
-- select * from hudi_ods.ods_sku_info;


-- ods_sku_sale_attr_value 插入数据
INSERT INTO hudi_ods.ods_sku_sale_attr_value
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.sku_sale_attr_value_cdc;
-- select * from hudi_ods.ods_sku_sale_attr_value;


-- ods_spu_info 插入数据
INSERT INTO hudi_ods.ods_spu_info
select *
       ,LOCALTIMESTAMP as ts
from hudi_cdc.spu_info_cdc;
-- select * from hudi_ods.ods_spu_info;


-- ods_user_info 插入数据
INSERT INTO hudi_ods.ods_user_info
select *
       ,LOCALTIMESTAMP as ts
       ,DATE_FORMAT(create_time,'yyyy-MM-dd') as dt
from hudi_cdc.user_info_cdc;
-- select * from hudi_ods.ods_user_info;


