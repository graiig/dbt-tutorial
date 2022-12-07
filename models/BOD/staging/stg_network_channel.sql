with network_channel as (
  
  select
        *

    from {{ source('bod','DIMNETWORKCHANNEL')}}

)
select * from network_channel