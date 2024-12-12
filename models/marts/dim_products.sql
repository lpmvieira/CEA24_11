with
    dim_products as (
        select *
        from {{ ref('stg_erp__products') }}
    )

select *
from dim_products