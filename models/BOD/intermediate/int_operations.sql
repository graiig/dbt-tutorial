with operations as (

  select *
  from {{ ref('fact_hot_operations') }}

), billed_items as (

  select *
  from {{ ref('fact_hot_billed_items') }}

), instances as (

  select *
  from {{ ref('dim_instance') }}

)

select
1 as nb_operations,
 o.opera_id,
 o.clsrv_id,
 o.bpsrv_id,
 o.opsta_id,
 o.optyp_id,
 billing_amount,
 o.operation_date_tz,
 o.operation_date,
 o.provider_id,
 o.billing_provider_id,
 o.country_id,
 o.blcha_id,
 o.odcha_id,
 o.netch_id,
 curcy_id,
 o.bpcsl_id,
 o.insta_id,
 sub_date,
 o.user_identifier,
 uncha_id,
 i.sub_date_tz
 from operations o
 left join billed_items b on b.opera_id = o.opera_id
 left join instances i on i.insta_id = o.insta_id
