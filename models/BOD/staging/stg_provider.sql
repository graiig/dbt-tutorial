with carrier as (
  
  select
        *

    from {{ source('bod','DIMPROVIDER')}}

)
select * from carrier