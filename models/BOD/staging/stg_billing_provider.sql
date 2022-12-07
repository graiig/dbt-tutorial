with billing_provider as (
  
  select
        *

    from {{ source('bod','DIMBILLINGPROVIDER')}}

)
select * from billing_provider