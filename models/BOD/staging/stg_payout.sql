with payout as (
  
  select
        *

    from {{ source('bod','DIMPAYOUT')}}

)
select * from payout