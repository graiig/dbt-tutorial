with dim_billing_provider as (
    select * from {{ ref('stg_billing_provider')}}
)

select * from dim_billing_provider