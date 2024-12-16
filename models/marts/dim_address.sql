with
    dim_address as (
        select *
        from {{ ref('int_sales__prep_address') }}
    )

select *
from dim_address