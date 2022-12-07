with billing_mode as (
  
  select
        *

    from {{ source('bod','DIMBILLINGMODE')}}

)
select * from billing_mode