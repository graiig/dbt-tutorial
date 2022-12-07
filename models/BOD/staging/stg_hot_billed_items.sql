with hot_billed_items as (
  
  select
        *

    from {{ source('bod','DATARAW_BILLED_ITEM_ACTUAL')}}

)
select * from hot_billed_items