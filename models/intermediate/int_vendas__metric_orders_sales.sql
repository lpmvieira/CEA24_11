with
    order_detail as (
        select *
        from {{ ref('stg_erp__orderdetail') }}
    )

    , orders as (
        select *
        from {{ ref('stg_erp__orders') }}
    )

    , joined as (
        select
            order_detail.pk_orderdetail
            , order_detail.fk_product
            , orders.pk_orders
            , orders.fk_person
            , orders.fk_customer
            , orders.fk_address
            , orders.orderdate
            , order_detail.discount
            , order_detail.unitprice
            , order_detail.orderqty
            , orders.freight
            , orders.orders_number
            , orders.subtotal
            , orders.taxamt
            , orders.totaldue
        from order_detail
        inner join orders on order_detail.fk_orderid = orders.pk_orders
    )

    , metrics as (
        select
            {{ 
                dbt_utils.generate_surrogate_key(['pk_orderdetail', 'pk_orders'])
            }} as sk_order_sales
            , pk_orderdetail as id_oderdetail
            , pk_orders as id_orders
            , fk_product
            , fk_person
            , fk_customer
            , fk_address
            , orderdate
            , subtotal
            , taxamt
            , totaldue 
            , discount
            , unitprice
            , orderqty
            , freight
            , unitprice * orderqty as total_bruto
            , unitprice * (1 - discount) * orderqty as total_liquido
            , cast((freight /  count(*) over(partition by orders_number)) as numeric(18,2)) as frete_rateado
            , case
                when discount > 0 then true
                else false
            end as teve_desconto
        from joined
    )

select * 
from metrics  