with 
    dim_customer as (
        select * 
        from {{ ref('int_sales__prep_customer') }}
    )

select * from dim_customer