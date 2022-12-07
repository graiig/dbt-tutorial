with services as (
  
  select
        *

    from {{ source('bod','DIMSERVICE')}}

)
select * from services