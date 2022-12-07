with provider_service as (
  
  select
        *

    from {{ source('bod','DIMPROVIDERSERVICE')}}

)
select * from provider_service