with dim_payout as (
    select * from {{ ref('stg_payout')}}
)

select * from dim_payout