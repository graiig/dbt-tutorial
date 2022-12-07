with dim_service as (
    select * from {{ ref('stg_service')}}
)

select * from dim_service