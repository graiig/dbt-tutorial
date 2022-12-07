with dim_frequency as (
    select * from {{ ref('stg_frequency')}}
)

select * from dim_frequency