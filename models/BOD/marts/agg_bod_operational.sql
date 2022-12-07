with operations as 
(
    select * 
    from  {{ ref('int_operations') }} 
),
billing_channel as (
    select * 
    from  {{ ref('dim_billing_channel') }} 
),
order_channel as (
    select * 
    from  {{ ref('dim_order_channel') }} 
),
carrier as (
    
    select * 
    from  {{ ref('dim_provider') }} 
),
services as (
    
    select * 
    from  {{ ref('dim_service') }} 
), 
network_channel as (
    
    select * 
    from  {{ ref('dim_network_channel') }} 
),
provider_service as (
    
    select * 
    from  {{ ref('dim_provider_service') }} 
),
frequency as (
    
    select * 
    from  {{ ref('dim_frequency') }} 
),
billing_mode as (
    
    select * 
    from  {{ ref('dim_billing_mode') }} 
),
billing_provider as (
    
    select * 
    from  {{ ref('dim_billing_provider') }} 
),
payout  as (
    
    select * 
    from  {{ ref('dim_payout') }} 
)




select SUM(case when optyp_id = 2 then nb_operations else 0 end) as sales,
SUM(case when optyp_id = 3 then nb_operations else 0 end) as unsubscriptions,
SUM(case when optyp_id = 6 then nb_operations else 0 end) as billing_succes,
SUM(case when optyp_id = 7 then nb_operations else 0 end) as refunds,
SUM(case when optyp_id = 7 then ((billing_amount*nb_operations)) else 0 end) + SUM(case when optyp_id = 6 then ((billing_amount*nb_operations)) else 0 end) as vat_included_refunds_local,
SUM(case when optyp_id = 7 then ((billing_amount*nb_operations)/(1+0.2)) else 0 end) + SUM(case when optyp_id = 6 then ((billing_amount*nb_operations)/(1+0.2)) else 0 end) as vat_excluded_refunds_local,
SUM(case when optyp_id = 7 then ((billing_amount*nb_operations)/(1+0.2)*coalesce(payou_payout_rate,0)/100) else 0 end) + SUM(case when optyp_id = 6 then ((billing_amount*nb_operations)/(1+0.2)*coalesce(payou_payout_rate,0)/100) else 0 end) as net_refunds_local,
SUM(case when optyp_id = 6 then ((billing_amount*nb_operations)) else 0 end) as vat_included_income_local,
SUM(case when optyp_id = 6 then ((billing_amount*nb_operations)/(1+0.2)) else 0 end) as vat_excluded_income_local,
SUM(case when optyp_id = 6 then ((billing_amount*nb_operations)/(1+0.2)*coalesce(payou_payout_rate,0)/100) else 0 end) as net_income_local,
operation_date,
country_id as country,
lb_blcha as billing_channel,
odcha_label,
pr.firm_name,
se.currency,
netch_label as network_channel,
service_name,
FREQY_LABEL,
BMODE_LABEL,
PROMO,
se.END_USER_PRICE,
billing_amount,
LB_CLSRV
,external_id 
, external_id_promo
,merchantid Merchant_id
,cloff_id
,sub_service_name 
,payou_payout_rate
,se.clsrv_id
,bpr.firm_name as billing_provider
,client_id


from operations ope
LEFT JOIN billing_channel bl on bl.blcha_id = ope.blcha_id
LEFT JOIN order_channel od on od.odcha_id = ope.odcha_id 
LEFT JOIN carrier pr on pr.provider_id = ope.provider_id
LEFT JOIN services se on se.clsrv_id = ope.clsrv_id
LEFT JOIN network_channel ch on ch.netch_id = ope.netch_id
LEFT JOIN provider_service bp on bp.bpsrv_id = ope.bpsrv_id
LEFT JOIN frequency  frq on se.freqy_id = frq.freqy_id 
LEFT JOIN billing_mode bm on bm.bmode_id = se.bmode_id
LEFT JOIN billing_provider bpr on ope.billing_provider_id = bpr.billing_provider_id
LEFT JOIN  payout pa on  bp.bpoff_id = pa.bpoff_id
    and pa.provider_id = ope.provider_id
    and ope.blcha_id = pa.blcha_id
    and se.end_user_price = pa.end_user_price_vat_included
    and ope.odcha_id = pa.odcha_id
    and bp.bmode_id = pa.bmode_id
    and pa.netch_id = ope.netch_id
    and ope.operation_date between coalesce(start_date,'2019-01-01') and coalesce(end_date,dateadd(day,1,current_date))

group by operation_date,
operation_date,
country_id ,
lb_blcha ,
odcha_label,
pr.firm_name,
se.currency,
netch_label ,
service_name,
FREQY_LABEL,
BMODE_LABEL,
PROMO,
se.END_USER_PRICE,
billing_amount,
LB_CLSRV
,external_id 
, external_id_promo
,merchantid 
,cloff_id
,sub_service_name 
,payou_payout_rate
,se.clsrv_id
,bpr.firm_name 
,client_id
