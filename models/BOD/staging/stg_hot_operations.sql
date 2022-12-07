with hot_operations as (
  
  select
        *

    from {{ source('bod','DATARAW_OPERATIONS_ACTUAL')}}

)
select * from hot_operations