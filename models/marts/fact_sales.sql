with
    fact_sales as (
        select *
        from {{ ref('int_sales__metric_orders_sales') }}
    )

select *
from fact_sales