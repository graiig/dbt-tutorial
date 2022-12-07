with dim_billing_mode as (
    select * from {{ ref('stg_billing_mode')}}
)

select * from dim_billing_mode