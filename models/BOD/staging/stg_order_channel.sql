with order_channel as (
  
  select
        *

    from {{ source('bod','DIMORDERCHANNEL')}}

)
select * from order_channel