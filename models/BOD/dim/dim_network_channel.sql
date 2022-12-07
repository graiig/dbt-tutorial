with dim_network_channel as (
    select * from {{ ref('stg_network_channel')}}
)

select * from dim_network_channel