with
    dim_calendar as (
        select *
        from {{ ref('stg_erp__calendar') }}
    )

select *
from dim_calendar