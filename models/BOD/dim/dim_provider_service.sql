with dim_provider_service as (
    select * from {{ ref('stg_provider_service')}}
)

select * from dim_provider_service