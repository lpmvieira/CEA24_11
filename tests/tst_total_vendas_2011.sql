/*  
    This test ensures that the 2011 
    gross sales are correct with the audited 
    accounting value: 
    $12,646,112.16.
*/
with
    sales_2011 as (
        select sum(gross_value) as sum_gross_value
        from {{ ref('int_sales__metric_orders_sales') }}
        where orderdate between '2011-01-01' and '2011-12-31'
    )

select sum_gross_value
from sales_2011
where sum_gross_value not between 12646112.00 and 12646113.00