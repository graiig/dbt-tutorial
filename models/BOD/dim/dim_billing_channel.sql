with dim_billing_channel as (
    select * from {{ ref('stg_billing_channel')}}
)

select * from dim_billing_channel