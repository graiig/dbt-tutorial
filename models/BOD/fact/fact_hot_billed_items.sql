with fact_hot_billed_items as (
    select BILIT_ID,
	BILIT_OPERA_ID  as opera_id,
	BILIT_END_USER_PRICE as billing_amount,
	BILIT_GENER_CURCY_ID as curcy_id
     from {{ ref('stg_hot_billed_items')}}
)

select * from fact_hot_billed_items