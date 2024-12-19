with
    source_orders as (
        select *
        from {{ source('erp', 'salesorderheader') }}
    )

    , renomed as (
        select 
            cast(salesorderid as int) as pk_orders
            , cast(salespersonid as int) as fk_person
            , cast(customerid as int) as fk_customer 
            --, cast(creditcardid as int) as fk_creditcardid já está incluso dentro do person
            , cast(shiptoaddressid as int) as fk_address 
            , cast(status as varchar) as orders_status  
            , cast(orderdate as date) as orderdate
            ,cast(salesorderid as int) as orders_number
            , cast(subtotal as numeric(18,2)) as subtotal
            , cast(taxamt as numeric(18,2)) as taxamt
            , cast(freight as numeric(18,2)) as freight
            , cast(totaldue as numeric(18,2)) as totaldue
        from source_orders
    )

select *
from renomed