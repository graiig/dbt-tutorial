with dim_order_channel as (
    select * from {{ ref('stg_order_channel')}}
)

select * from dim_order_channel