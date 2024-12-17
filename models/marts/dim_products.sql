with
    dim_products as (
        select *
        from {{ ref('int_production__prep_products') }}
    )

select *
from dim_products