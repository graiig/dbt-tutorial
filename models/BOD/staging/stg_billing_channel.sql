with billing_channel as (
  
  select
        *

    from {{ source('bod','DIMBILLINGCHANNEL')}}

)
select * from billing_channel