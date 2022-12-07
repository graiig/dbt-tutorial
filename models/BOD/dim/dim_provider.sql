with dim_provider as (
    select * from {{ ref('stg_provider')}}
)

select * from dim_provider