with instances as (
  
  select
        *

    from {{ source('bod','DATARAW_INSTANCE')}}

)
select * from instances