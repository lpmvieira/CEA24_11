with
    dim_reason as (
        select *
        from {{ ref('int_sales__prep_reason') }}
    )

select *
from dim_reason