with frequency as (
  
  select
        *

    from {{ source('bod','DIMFREQUENCY')}}

)
select * from frequency