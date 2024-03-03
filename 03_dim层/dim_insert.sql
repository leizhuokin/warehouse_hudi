
-- 1、dim_sku
insert into hudi_dim.dim_sku
select
    sku.id,
    sku.price,
    sku.sku_name,
    sku.sku_desc,
    sku.weight,
    sku.is_sale,
    sku.spu_id,
    spu.spu_name,
    sku.category3_id,
    c3.name,
    c3.category2_id,
    c2.name,
    c2.category1_id,
    c1.name,
    sku.tm_id,
    tm.tm_name,
    attr.attrs,
    sale_attr.sale_attrs,
    sku.create_time,
    LOCALTIMESTAMP as ts,
    sku.dt dt
from hudi_ods.ods_sku_info /*+ OPTIONS('read.tasks'='1')*/ sku
left join hudi_ods.ods_spu_info /*+ OPTIONS('read.tasks'='1')*/ spu on sku.spu_id=spu.id
left join hudi_ods.ods_base_category3 /*+ OPTIONS('read.tasks'='1')*/ c3 on sku.category3_id=c3.id
left join hudi_ods.ods_base_category2 /*+ OPTIONS('read.tasks'='1')*/ c2 on c3.category2_id=c2.id
left join hudi_ods.ods_base_category1 /*+ OPTIONS('read.tasks'='1')*/ c1 on c2.category1_id=c1.id
left join hudi_ods.ods_base_trademark /*+ OPTIONS('read.tasks'='1')*/ tm on sku.tm_id=tm.id
left join 
(
    select
        sku_id,
        collect(concat_ws('|',cast(attr_id as string),cast(value_id as string),attr_name,value_name)) attrs
    from hudi_ods.ods_sku_attr_value/*+ OPTIONS('read.tasks'='1')*/
    group by sku_id
) attr on sku.id=attr.sku_id
left join 
(
    select
        sku_id,
        collect(concat_ws('|',cast(sale_attr_id as string),cast(sale_attr_value_id as string),sale_attr_name,sale_attr_value_name)) sale_attrs
    from hudi_ods.ods_sku_sale_attr_value/*+ OPTIONS('read.tasks'='1')*/
    group by sku_id
) sale_attr on sku.id=sale_attr.sku_id;


-- 2、dim-coupon
insert into hudi_dim.dim_coupon
select
    id,
    coupon_name,
    coupon_type,
    coupon_dic.dic_name,
    condition_amount,
    condition_num,
    activity_id,
    benefit_amount,
    benefit_discount,
    case coupon_type
        when '3201' then concat('满',cast(condition_amount as string),'元减',cast(benefit_amount as string),'元')
        when '3202' then concat('满',cast(condition_num as string),'件打',cast(10*(1-benefit_discount) as string),'折')
        when '3203' then concat('减',cast(benefit_amount as string),'元')
    end benefit_rule,
    create_time,
    range_type,
    range_dic.dic_name,
    limit_num,
    taken_count,
    start_time,
    end_time,
    operate_time,
    expire_time,
    LOCALTIMESTAMP as ts,
    ci.dt as dt
from
(
    select
        id,
        coupon_name,
        coupon_type,
        condition_amount,
        condition_num,
        activity_id,
        benefit_amount,
        benefit_discount,
        create_time,
        range_type,
        limit_num,
        taken_count,
        start_time,
        end_time,
        operate_time,
        expire_time,
        dt
    from hudi_ods.ods_coupon_info/*+ OPTIONS('read.tasks'='1')*/
)ci
left join
(
    select
        dic_code,
        dic_name
    from hudi_ods.ods_base_dic/*+ OPTIONS('read.tasks'='1')*/
    where parent_code='32'
)coupon_dic
on ci.coupon_type=coupon_dic.dic_code
left join
(
    select
        dic_code,
        dic_name
    from hudi_ods.ods_base_dic/*+ OPTIONS('read.tasks'='1')*/
    where parent_code='33'
)range_dic
on ci.range_type=range_dic.dic_code;


-- 3、dim_activity
insert into hudi_dim.dim_activity
select
    rule.id,
    info.id,
    activity_name,
    rule.activity_type,
    dic.dic_name,
    activity_desc,
    start_time,
    end_time,
    create_time,
    condition_amount,
    condition_num,
    benefit_amount,
    benefit_discount,
    case rule.activity_type
        when '3101' then concat('满',cast(condition_amount as string),'元减',cast(benefit_amount as string),'元')
        when '3102' then concat('满',cast(condition_amount as string),'件打',cast(10*(1-benefit_discount) as string),'折')
        when '3103' then concat('打',cast(10*(1-benefit_discount) as string),'折')
    end benefit_rule,
    benefit_level,
    LOCALTIMESTAMP as ts,
    info.dt
from hudi_ods.ods_activity_rule /*+ OPTIONS('read.tasks'='1')*/ rule
left join hudi_ods.ods_activity_info /*+ OPTIONS('read.tasks'='1')*/ info
on rule.activity_id=info.id
left join
(
    select
        dic_code,
        dic_name
    from hudi_ods.ods_base_dic/*+ OPTIONS('read.tasks'='1')*/
    where parent_code='31'
)dic
on rule.activity_type=dic.dic_code;


-- 4、dim_province
insert into hudi_dim.dim_province
select
    province.id,
    province.name,
    province.area_code,
    province.iso_code,
    province.iso_3166_2,
    region_id,
    region_name,
    LOCALTIMESTAMP as ts
from hudi_ods.ods_base_province /*+ OPTIONS('read.tasks'='1')*/ province
left join hudi_ods.ods_base_region /*+ OPTIONS('read.tasks'='1')*/  region
on province.region_id=region.id;


-- 5、dim_date:只需要初始化一次，写在dim_date.sql

-- 6、dim_user_info
insert into hudi_dim.dim_user_info
select
    id,
    login_name,
    nick_name,
    md5(name) name,
    md5(if(regexp(phone_num,'^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\\\d{8}$'),phone_num,CAST(NULL AS STRING))) phone_num,
    md5(if(regexp(email,'^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\\.[a-zA-Z0-9_-]+)+$'),email,CAST(NULL AS STRING))) email,
    user_level,
    birthday,
    gender,
    create_time,
    operate_time,
    nvl(operate_time,create_time) as start_time,
    LOCALTIMESTAMP as ts,
    date_format(create_time,'yyyy-MM-dd') as dt
from hudi_ods.ods_user_info/*+ OPTIONS('read.tasks'='1')*/;

